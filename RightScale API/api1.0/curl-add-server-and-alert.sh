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

#
# Make the login request and grab the cookie.

# This line sets up the login cookies
echo "Logging in."
curl -c mySavedCookies -u "$USER:$PASSWORD" https://my.rightscale.com/api/acct/$ACCT/login?api_version=1.0

#
# Now create the server in the deployment

echo "Creating new server."
curl -D "servers-headers.tmp" -b mySavedCookies -X POST -H 'X-API-VERSION:1.0' \
  -d "server[nickname]=test_add_alerts_server" \
  -d "server[server_template_href]=https://my.rightscale.com/api/acct/$ACCT/server_templates/101702" \
  -d "server[ec2_ssh_key_href]=https://my.rightscale.com/api/acct/$ACCT/clouds/2/ec2_ssh_keys/203982" \
  -d "server[ec2_security_groups_href]=https://my.rightscale.com/api/acct/$ACCT/clouds/2/ec2_security_groups/49346" \
  -d "server[deployment_href]=https://my.rightscale.com/api/acct/$ACCT/deployments/109926" \
  -d "cloud_id=2" \
"https://my.rightscale.com/api/acct/$ACCT/servers"

# Now get the url from the file.
new_server=`grep -i Location servers-headers.tmp | cut -f 2 -d " "`
echo "New server located at $new_server"

#
# Now create a new alert to add to the server(s)

echo "Creating new alert."

curl --data -v -b mySavedCookies -X POST -H "X-API-VERSION:1.0" -D "alert-headers.tmp" \
  -d "alert_spec[name]=voting_alert" \
  -d "alert_spec[file]=cpu-0/cpu-idle" \
  -d "alert_spec[variable]=value" \
  -d "alert_spec[condition]=<=" \
  -d "alert_spec[threshold]=10" \
  -d "alert_spec[duration]=5" \
  -d "alert_spec[description]=scales the server up if the cpu is busy" \
  -d "alert_spec[subject_type]=Server" \
  -d "alert_spec[subject_href]=$new_server" \
  -d "alert_spec[action]=vote" \
  -d "alert_spec[vote_tag]=Base Server Template 11H1" \
  -d "alert_spec[vote_type]=grow" \
"https://my.rightscale.com/api/acct/$ACCT/alert_specs"

# Now get the alert location ready for use on the server
new_alert=`grep -i Location alert-headers.tmp | cut -f 2 -d " "`
echo "New alert located at $new_alert"
