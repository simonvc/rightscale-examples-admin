require "RightAPI.rb"

api = RightAPI.new
api.log = true
api.reraise_exceptions = true
	
api.login( {:username => "jonathan.dade@rightscale.com", :password => "MilRecHer6", :account => "7954"} )
	


puts api.send('servers').to_s

