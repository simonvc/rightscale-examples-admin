#!/usr/bin/ruby

require 'RightAPI/RightAPI.rb'

api = RightAPI.new
api.log = true

api.login(:username => "jonathan.dade@rightscale.com", :password => "MilRecHer6", :account => "7954")

url = "server_arrays/5518/run_script_on_all"
http_method = "post"
params = { 
  'server_array[right_script_href]' =>'https://my.rightscale.com/api/acct/7954/right_scripts/209774', 
  'server_array[server_template_hrefs]'=> 'https://my.rightscale.com/api/acct/7954/ec2_server_templates/57545'}

body = api.send(url, http_method, params )
puts "===== Headers ====="
api.headers.keys.each{ |key| puts key.to_s + " => " + api.headers[key].to_s }
puts "===== Body ====="
puts body

#puts api.send("servers")
