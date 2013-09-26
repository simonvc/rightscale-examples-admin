from lxml import objectify
import requests
import getpass
import myrightscalepassword

user="simon.vans-colina@pearson.com"
acct="51401"
baseurl="https://my.rightscale.com" # wont work because of the 302 that python turns into a GET 
baseurl="https://us-3.rightscale.com"
password=myrightscalepassword.password

s = requests.Session()
data = {}
data['email'] = user
data['password'] = password
data['account_href'] = "/api/accounts/%s" % acct

headers = {'X-API-VERSION': "1.5", 'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/xml'}
url=baseurl+"/api/session"
r=s.post(url, headers=headers, data=data)
r=s.get(baseurl+'/api/servers', headers=headers)

servers=objectify.fromstring(str(r.text))

for server in servers.iterchildren():
  print server.name, server.state



