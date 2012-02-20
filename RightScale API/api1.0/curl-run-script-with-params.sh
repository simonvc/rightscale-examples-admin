#! /bin/bash -ex
#
# This is a template for use testing API functions.
# It relies on a file called user-details.sh to pull in the credentials. This file should contain similar to the following:
#
#USER="user.name@company.com"
#PASSWORD="MySecurePassword"
#ACCT="0000"
#

# This file should setup variables containing the username and password
source ./user-details.sh

# This line sets up the login cookies
curl -c mySavedCookies -u "$USER:$PASSWORD" https://my.rightscale.com/api/acct/$ACCT/login?api_version=1.0

curl -b mySavedCookies -X POST -H 'X-API-VERSION:1.0' -d "right_script=412148" -d "server[parameters][PUBLIC_IP]=text:11.11.11.11" "https://my.rightscale.com/api/acct/$ACCT/servers/207486001/run_script"
curl -b mySavedCookies -X POST -H 'X-API-VERSION:1.0' -d "right_script=https://my.rightscale.com/api/acct/$ACCT/right_scripts/412148" -d "server[parameters][PUBLIC_IP]=text:99.99.99.99" "https://my.rightscale.com/api/acct/$ACCT/servers/207486001/run_script"
