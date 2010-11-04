#!/usr/bin/ruby
#
# Terminate running servers if they have been alive > server_limit_hours
# and the description doesn't contain safeword.

require 'rubygems'
require 'RightAPI/RightAPI'
require 'crack'
require 'time'
require 'pp'

user = 'jonathan.dade@rightscale.com'
account = '7954'
password = 'MilRecHer6'

api = RightAPI.new
api.log = true
api.login(:username => user, :password => password, :account => account)

output = api.send("servers")
#puts output
#File.open("output.txt", 'w') {|f| f.write(output) }
#output=`cat output.txt`

xml = Crack::XML.parse(output)
puts "Operational servers:"
xml["servers"].each { |svr|
  server_id = svr["href"].match(/[0-9]+$/).to_s.to_i
  if (svr["state"] == "operational")
    puts "Server ID#(#{server_id}) - (#{svr["nickname"]})"
    if (output = api.send("servers/#{server_id}/monitoring"))
      xmlmonitor = Crack::XML.parse(output)
      if (xmlmonitor["monitors"]["monitor"][0]["href"])
        puts " Sketchy used:"+xmlmonitor["monitors"]["monitor"][0]["href"].match(/sketchy[0-9]+-[0-9]+/).to_s
      end
    end
  end
}
