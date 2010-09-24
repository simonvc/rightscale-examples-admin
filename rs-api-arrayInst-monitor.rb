#!/usr/bin/ruby

require 'RightAPI/RightAPI.rb'
require 'rexml/document'

api = RightAPI.new
api.log = true

api.login(:username => 'jonathan.dade@rightscale.com', 
          :password => 'MilRecHer6',
          :account => '7954')

url = "servers"
http_method = "get"

params = {}
ret_val = api.send(url, http_method, params )
# puts ret_val

xdoc = REXML::Document.new ret_val.to_s
#puts xdoc.root.to_s
xdoc.each_element('servers/server') do 
  |e| if e.elements['state'].text.include? 'operational'
  puts e.elements['href']
  end
end
#puts xdoc.elements['servers/server[1]']

#puts api.send("servers")
