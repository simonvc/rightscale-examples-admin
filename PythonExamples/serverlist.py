from lxml import objectify
import requests
import getpass
import myrightscalepassword

user="simon.vans-colina@pearson.com"
acct="51401"
baseurl="https://my.rightscale.com"
baseurl="https://us-3.rightscale.com"
#password=getpass.getpass()
password=myrightscalepassword.password

s = requests.Session()
data = {}
data['email'] = user
data['password'] = password
data['account_href'] = "/api/accounts/%s" % acct

# reformat the string because rightscale doesnt understand form encoding (sadface)
d="&".join(['%s=%s' % (k,data[k]) for k in data.keys()])

print 'data', d

headers = {'X-API-VERSION': "1.5", 'Content-Type': 'application/x-www-form-urlencoded'}
print 'headers', headers

url=baseurl+"/api/session"
#url="http://localhost:9000/api/session"

print url
r=s.post(url, headers=headers, data=d)

print 'r', r
print 'raw', r.raw
print 'url', r.url
print 'request', r.request
print 'headers', r.headers



