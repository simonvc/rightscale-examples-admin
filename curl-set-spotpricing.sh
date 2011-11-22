#! /bin/bash -ex
#
# This file contains examples of using curl to access the RightScale API
# It relies on a file called user-details.sh to pull in the credentials

# This file should setup variables containing the username and password
source ./user-details.sh
acctid="xxxx"

#
# Examples
#

# This line sets up the login cookies
curl -w "Result: %{response_code}\n" -c mySavedCookies -u "$USER:$PASSWORD" "https://my.rightscale.com/api/acct/$acctid/login?api_version=1.0"

curl -w "Result  %{response_code}\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' -d 'server[pricing]=spot' -d 'server[max_spot_price]=0.1' "https://my.rightscale.com/api/acct/$acctid/servers/1044856"
