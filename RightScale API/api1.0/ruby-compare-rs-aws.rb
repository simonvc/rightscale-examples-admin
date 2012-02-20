#!/usr/bin/env ruby
#
# Terminate running servers if they have been alive > server_limit_hours
# and the description doesn't contain safeword.

require 'rubygems'
require 'RightAPI/RightAPI'
require 'AWS'
require 'crack'
require 'time'
require 'pp'

#set print to flush immediately
STDOUT.sync = true

# Rightscale Credentials
user = '' # user's rightscale login email address
account = '' # target rightscale account number
password = '' # user's rightscale password

#AWS credentials
aws_user = '' # AWS user credential
aws_pass = '' # AWS password credential

puts "\n=====================================================\n"
puts
puts " Compare RightScale and AWS"
puts " This script retrieves and compares all instances\nrunnning in Amazon We Services and those in deployments or arrays that are operational in Rightscale."
puts
puts " This will list any stranded or not found instance IDs. It is advised that these are located in the \"Clouds > <cloud name> > EC2 instances\" pages to confirm why these were found"
puts "\n=====================================================\n"

ec2_us_east = AWS::EC2::Base.new(:access_key_id => aws_user, :secret_access_key => aws_pass)
ec2_us_west = AWS::EC2::Base.new(:access_key_id => aws_user, :secret_access_key => aws_pass, :server => 'ec2.us-west-1.amazonaws.com')
ec2_eu_west = AWS::EC2::Base.new(:access_key_id => aws_user, :secret_access_key => aws_pass, :server => 'ec2.eu-west-1.amazonaws.com')
ec2_ap_southeast = AWS::EC2::Base.new(:access_key_id => aws_user, :secret_access_key => aws_pass, :server => 'ec2.ap-southeast-1.amazonaws.com')

ec2_instances = {}

puts "Locating instances in EC2:\n"

# US East instances
print "US East: "
unless ec2_us_east.describe_instances.reservationSet == nil then
  ec2_us_east.describe_instances.reservationSet.item.each do | rSetItem |
    rSetItem.instancesSet.item.each do |iSetItem|
      ec2_instances[iSetItem.instanceId] = iSetItem.instanceState.name
    end
  end
end
print "success.\n"

# US West instances
print "US West: "
unless ec2_us_west.describe_instances.reservationSet == nil then
  ec2_us_west.describe_instances.reservationSet.item.each do | rSetItem |
    rSetItem.instancesSet.item.each do |iSetItem|
      ec2_instances[iSetItem.instanceId] = iSetItem.instanceState.name
    end
  end
end
print "success.\n"

# EU West instances
print "EU West: "
unless ec2_eu_west.describe_instances.reservationSet == nil then
  ec2_eu_west.describe_instances.reservationSet.item.each do | rSetItem |
    rSetItem.instancesSet.item.each do |iSetItem|
      ec2_instances[iSetItem.instanceId] = iSetItem.instanceState.name
    end
  end
end
print "success.\n"

# AP Southeast instances
print "AP Southeast: "
unless ec2_ap_southeast.describe_instances.reservationSet == nil then
  ec2_ap_southeast.describe_instances.reservationSet.item.each do | rSetItem |
    rSetItem.instancesSet.item.each do |iSetItem|
      ec2_instances[iSetItem.instanceId] = iSetItem.instanceState.name
    end
  end
end
print "success.\n"

puts "\n=====================================================\n"

puts "\nRemoving stopped instances\n"
puts "Instances found: #{ec2_instances.size}"
ec2_instances.keys.each do |key|
  unless ec2_instances[key] == 'running'
    ec2_instances.delete(key)
  end
end
puts "Instances running: #{ec2_instances.size}"

puts "\n=====================================================\n"

api = RightAPI.new
api.log = true
api.login(:username => user, :password => password, :account => account)

puts "\n=====================================================\n"

puts "Locating instances in RightScale:\n\n"

rs_instances = {}

# Get ordinary servers from RightScale
print "Fetching Rightscale Servers: "
output = api.send("servers")
xml = Crack::XML.parse(output)
xml["servers"].each do |svr|
  if svr['state'] == 'operational' ||
     svr['state'] == 'booting' ||
     svr['state'] == 'stranded'
        svr['href'] =~ /\/(\d+)$/
        id = $1
        tmpxml = Crack::XML.parse( api.send("servers/#{id}/settings"))
rs_instances[tmpxml['settings']['aws_id']] = { 'nickname' => tmpxml['settings']['nickname'], 'href' => svr['href'], 'cloud-id' => tmpxml['settings']['cloud_id'], 'availability-zone' => tmpxml['settings']['ec2_availability_zone']}
  end
end
print "done\n"

# Fetch array instances

print "Fetching Rightscale Array instances: "
arrays = api.send("server_arrays")
arraysOutput = []
arrays.each_line do |line|
  if line =~ /<href>https:\/\/my.rightscale.com\/api\/acct\/\d+\/(.*)<\/href>/
# puts "matched: #{line}"
    arraysOutput.push($1)
  end
end
arraysOutput.each do |array|
  arrayData = api.send("#{array}/instances")
  arraysXmlData = Crack::XML.parse(arrayData)
  arraysXmlData['instances'].each do |instance|
# puts instance['resource_uid']
    rs_instances[instance['resource_uid']] = { 'nickname' => instance['nickname'], 'href' => instance['href'] }
  end
end
print "done\n"

puts "\n=====================================================\n"

# Now create useful lists of each and print any unmatched ones

# Print sorted list of Array Ids
aws_ids = ec2_instances.keys.sort
rs_ids = rs_instances.keys.sort

# Print non-matching instances
print "Comparing AWS and Rightscale\n"

unmatched = []
aws_ids.each do |id|
 if ! rs_ids.include? id
   unmatched.push id
 end
end

puts
puts "Number of unmatched instances: #{unmatched.size}"
if unmatched.size > 0
  puts "Instances found:"
  unmatched.each do |id|
    puts "\t#{id}"
  end
end