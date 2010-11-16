#! /bin/bash
#
# This file contains examples of using curl to access the RightScale API
# It relies on a file called user-details.sh to pull in the credentials

# This file should setup variables containing the username and password
source ./user-details.sh

#
# Examples
#

# This line sets up the login cookies
curl -c mySavedCookies -u "$USER:$PASSWORD" https://my.rightscale.com/api/acct/7954/login?api_version=1.0

# This call gets all operational servers
#curl -b mySavedCookies -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/7954/servers.xml?state=operational"

# This call gets the details of a specific instance
#curl -b mySavedCookies -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/7954/ec2_instances/5239075

# This call lists all instances (not sure this works)
# curl -b mySavedCookies -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/7954/ec2_instances"

# This line creates a new server
#curl -b mySavedCookies -H 'X-API-VERSION:1.0' -v -X POST \
#-d "cloud_id=3" \
#-d "server[nickname]=jd-api-test" \
#-d "server[server_template_href]='https://my.rightscale.com/api/acct/7954/server_templates/57204'" \
#-d "server[ec2_ssh_key]='https://my.rightscale.com/api/acct/7954/clouds/3/ec2_ssh_keys/203980'" \
#-d "server[ec2_security_groups_href]='https://my.rightscale.com/api/acct/7954/clouds/3/ec2_security_groups/97875'" \
#-d "server[deployment_href]='https://my.rightscale.com/api/acct/7954/deployments/61944'" \
#-d "server[ec2_availability_zone]=us-west-1d" \
#"https://my.rightscale.com/api/acct/7954/servers"

curl -b mySavedCookies -H 'X_API_VERSION:1.0' -d "cloud_id=2" -X GET "https://my.rightscale.com/api/acct/7954/ec2_security_groups"
# | grep https://my.rightscale.com/api/acct/7954/ec2_security_groups | cut -f 2 -d '>' | cut -f 1 -d '<' 
