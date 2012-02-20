#! /bin/bash -ex
#
# This is a template for use testing API functions.
# It relies on a file called user-details.sh to pull in the credentials

# This file should setup variables containing the username and password
source ./user-details.sh

# This line sets up the login cookies
curl -c mySavedCookies -u "$USER:$PASSWORD" https://my.rightscale.com/api/acct/7954/login?api_version=1.0

curl -v -b mySavedCookies -X GET -H 'X-API-VERSION:1.0' -d "resource_type=ec2_instance" -d "tags[]=rs_login:state=active" -d "tags[]=appserver:active=true" "https://my.rightscale.com/api/acct/7954/tags/search"
