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

curl -b mySavedCookies -X POST -H 'X-API-VERSION:1.0' \
  -d "cloud_id=2" \
  -d "server_array[nickname]=My Test Array tags set via api" \
  -d "server_array[description]=A test array where the voter tags are set via the api" \
  -d "server_array[deployment_href]=https://my.rightscale.com/api/acct/$ACCT/deployments/109926" \
  -d "server_array[array_type]=alert" \
  -d "server_array[ec2_security_groups_href]=https://my.rightscale.com/api/acct/$ACCT/clouds/2/ec2_security_groups/49346" \
  -d "server_array[server_template_href]=https://my.rightscale.com/api/acct/$ACCT/server_templates/122881" \
  -d "server_array[ec2_ssh_key_href]=https://my.rightscale.com/api/acct/$ACCT/clouds/2/ec2_ssh_keys/203982" \
  -d "server_array[collect_audit_entries]=1" \
  -d "server_array[voters_tag]=jd-test-vote" \
  -d "server_array[elasticity][max_count]=5" \
  -d "server_array[elasticity][min_count]=1" \
  -d "server_array[elasticity][resize_up_by]=2" \
  -d "server_array[elasticity][resize_down_by]=1" \
  -d "server_array[elasticity][resize_calm_time]=10" \
  -d "server_array[elasticity][decision_threshold]=51" \
  -d "server_array[active]=false" \
"https://my.rightscale.com/api/acct/$ACCT/server_arrays"
