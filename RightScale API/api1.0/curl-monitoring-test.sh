#! /bin/bash -ex
#
# This is a template for use testing API functions.
# It relies on a file called user-details.sh to pull in the credentials

# Sets up an alias for curl to print the response code
alias curl='curl -w "Result: %{response_code}\n"'

# This file should setup variables containing the username and password
source ./user-details.sh

# This line sets up the login cookies
curl -w "Result: %{response_code}\n" -c mySavedCookies -u "$USER:$PASSWORD" https://my.rightscale.com/api/acct/9236/login?api_version=1.0

curl -b mySavedCookies -X GET -H 'X-API-VERSION:1.0' 'https://my.rightscale.com/api/acct/9236/servers/892817/monitoring?format=js'
