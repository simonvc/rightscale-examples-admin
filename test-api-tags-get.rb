#! /usr/bin/ruby

require 'RightAPI.rb'

details = {
  :username => 'jonathan.dade@rightscale.com',
  :password => 'MilRecHer6',
  :account => '7954'
}

api = RightAPI.new
api.log = true

api.login(:account => '7954', :username => 'jonathan.dade@rightscale.com', :password => 'MilRecHer6')

http_method = "get"
#http_method = "post"
#http_method = "put"
#http_method = "delete"

url = 'servers'
#params = { 'server[nickname]' => 'this was a test' }

puts api.send(url, http_method)
