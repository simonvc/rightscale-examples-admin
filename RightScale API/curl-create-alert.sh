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

#curl -b mySavedCookies -X GET -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/$ACCT/alert_specs"

curl --data -v -b mySavedCookies -X POST -H "X-API-VERSION:1.0" -D "alert-headers.tmp" \
  -d "alert_spec[name]=voting_alert" \
  -d "alert_spec[file]=cpu-0/cpu-idle" \
  -d "alert_spec[variable]=value" \
  -d "alert_spec[condition]=<=" \
  -d "alert_spec[threshold]=10" \
  -d "alert_spec[duration]=5" \
  -d "alert_spec[description]=scales the server up if the cpu is busy" \
  -d "alert_spec[subject_type]=Server" \
  -d "alert_spec[subject_href]=https://my.rightscale.com/api/acct/7954/servers/207486001" \
  -d "alert_spec[action]=vote" \
  -d "alert_spec[vote_tag]=Base Server Template 11H1" \
  -d "alert_spec[vote_type]=grow" \
"https://my.rightscale.com/api/acct/$ACCT/alert_specs"

# Now get the alert location ready for use on the server
new_alert=`grep -i Location alert-headers.tmp | cut -f 2 -d " "`
echo "New alert located at $new_alert"
