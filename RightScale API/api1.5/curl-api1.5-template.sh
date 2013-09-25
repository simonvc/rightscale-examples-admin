#!/bin/bash -ex
#
# Api 1.5 :: Server examples
#
# First run the login script to obtain the authentication cookies.
# Once these have been retrieved you can manipulate Rightscale objects.
#

# Import some variables
source ../user-details.sh

# Set some useful base variables
BASEURL="https://my.rightscale.com"

# Get a list of servers
curl -L -v -b "mySavedCookies-$ACCT" -X "GET" -H "X-API-VERSION:1.5" -H "Accept: application/xml" "$BASEURL/api/servers"
