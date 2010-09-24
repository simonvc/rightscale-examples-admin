#!/usr/bin/ruby

require 'RightAPI.rb'

api = RightAPI.new
api.log = true
api.login("jonathan.dade@rightscale.com","MilRecHer6", "7954")


# api.login("alex@rightscale.com", "simplePASS", "7954")
api.login("jonathan.dade@rightscale.com", "MilRecHer6", "7954")

url = "servers"
# http_method = "get"
http_method = "put"
# params = { 'server[ec2_security_groups_href][]' => 'https://my.rightscale.com/clouds/1/ec2_security_groups/122351' }

# puts api.send(url, http_method, params )

# puts api.send("servers/754935")

params = {'resource_href' => 'https://my.rightscale.com/clouds/2/ec2_ebs_volumes/320762', 'tags[]' => 'aaa', }
# puts api.send("tags/set?resource_href=https://my.rightscale.com/api/acct/7954/server/687102&tags[]=bbb","put")

api.send("tags/set", http_method, params)

#puts api.reply

