from lxml import objectify
import requests
import getpass
import myrightscalepassword

user="simon.vans-colina@pearson.com"
acct="51401"
baseurl="https://my.rightscale.com" # wont work because of the 302 that python turns into a GET 
baseurl="https://us-3.rightscale.com"
#password=getpass.getpass()
password=myrightscalepassword.password

s = requests.Session()
data = {}
data['email'] = user
data['password'] = password
data['account_href'] = "/api/accounts/%s" % acct
print 'data', data

headers = {'X-API-VERSION': "1.5", 'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/xml'}
print 'headers', headers

url=baseurl+"/api/session"

print url
r=s.post(url, headers=headers, data=data)

print 'r', r
print 'raw', r.raw
print 'url', r.url
print 'request', r.request
print 'headers', r.headers

r=s.get(baseurl+'/api/servers', headers=headers)
print r.raw
print r.text

servers=objectify.fromstring(r.text)

for server in servers:
  print server

