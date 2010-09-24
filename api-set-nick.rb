#!/usr/bin/ruby

require 'RightAPI.rb'

api = RightAPI.new
api.log = true

api.login("jonathan.dade@rightscale.com", "MilRecHer6", "7954")

url = "tags/set"
http_method = "put"
myTags = [ 'myTag1', 'my_server_tags:tagged=>Look_at_the_tags' ]
params = { 'resource_href'=>'https://my.rightscale.com/api/acct/7954/ec2_instances/687102', 'tags[]'=> 'myTagging'}

puts api.send(url, http_method, params )

#puts api.send("servers")
