#! /bin/bash -ex
#
# This file contains examples of using curl to access the RightScale API
# It relies on a file called user-details.sh to pull in the credentials

# This file should setup variables containing the username and password
source ./user-details.sh
acctid="7954"

#
# Examples
#

# This line sets up the login cookies
curl -w "Result: %{response_code}\n" -c mySavedCookies -u "$USER:$PASSWORD" "https://my.rightscale.com/api/acct/$acctid/login?api_version=1.0"

# This call gets all operational servers
#curl -b mySavedCookies -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/7954/servers.xml?state=operational"

# This call gets the details of a specific instance
#curl -b mySavedCookies -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/7954/ec2_instances/5239075

# This call lists all instances (not sure this works)
#curl -b mySavedCookies  -X 'GET' -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/7954/ec2_instances"

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

# This call will list the ec2 security groups for cloud 2 (eu) 
#curl -b mySavedCookies -H 'X_API_VERSION:1.0' -d "cloud_id=2" -X GET "https://my.rightscale.com/api/acct/7954/ec2_security_groups"

# This request will update an input for a RightScript on a deployment.
#curl -b mySavedCookies -H 'X-API-VERSION:1.0' -X PUT -d 'deployment[parameters][FIREFOX_HOMEPAGE]=text:www.test.com' "https://my.rightscale.com/api/acct/7954/deployments/53513"

# This one updates an input for a chef recipe
#curl -b mySavedCookies -H 'X-API-VERSION:1.0' -X PUT -d 'deployment[parameters][s3/bucket]=text:myBucket' "https://my.rightscale.com/api/acct/7954/deployments/53513"

#curl -b mySavedCookies -H 'X-API-VERSION:1.0' -X GET https://my.rightscale.com/api/acct/7954/servers/836587/current

#curl -w "Result: %{response_code}\n" -b mySavedCookies -H 'X-API-VERSION: 1.0' -d 'ec2_security_group[from_port]=24' -d 'ec2_security_group[to_port]=25' -d 'ec2_security_group[cidr_ips]=10.1.1.0/0' -d 'ec2_security_group[protocol]=udp' -X PUT https://my.rightscale.com/api/acct/7954/ec2_security_groups/182266

#curl -w "Result: %{response_code}\n" -b mySavedCookies -H 'X-API-VERSION: 1.0' -d 'cloud_id=2' -d 'ec2_security_group[aws_description]=gibber mcflibber' -d 'ec2_security_group[aws_group_name]=gibber mcflibber' -X 'POST' https://my.rightscale.com/api/acct/7954/ec2_security_groups

#curl -w "Result: %{response_code}\n" -b mySavedCookies -H 'X-API-VERSION:1.0' -X GET "https://my.rightscale.com/api/acct/$acctid/servers/868844/current"
# curl -w "Result: %{response_code}\n" -b mySavedCookies -H 'X-API-VERSION:1.0' -X GET "https://my.rightscale.com/api/acct/$acctid/servers/876115"

#curl -w "Result: %{response_code}\n" -b mySavedCookies -H 'X-API-VERSION:1.0' -X GET "https://my.rightscale.com/api/$acctid/deployments/66600/show_servers_script"

#curl -w "Result: %{response_code}\n" -b mySavedCookies -H 'X-API-VERSION:1.0' -X GET "https://my.rightscale.com/api/acct/$acctid/deployments"

# curl -w "Result: %{response_code}\n" -b mySavedCookies -H 'X-API-VERSION:1.0' -X GET "https://my.rightscale.com/api/acct/$acctid/servers?filter=state=operational"
# echo
# echo "========================================================"
# echo
# echo " Array"
# echo
# echo "========================================================"
# echo
# curl -w "Result: %{response_code}\n" -b mySavedCookies -H 'X-API-VERSION:1.0' -X GET "https://my.rightscale.com/api/acct/$acctid/server_arrays/10836/instances"

#curl -w "Result: %{response_code}\n" -b mySavedCookies -X POST -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/7954/ec2_instances/7108987/stop"

#curl -w "Result: %{response_code}\n" -b mySavedCookies -X GET -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/$acctid/ec2_elastic_ips"
# curl -w "Result: %{response_code}\n" -b mySavedCookies -X GET -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/$acctid/servers/890270"
#curl -w "Result: %{response_code}\n" -b mySavedCookies -X GET -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/$acctid/servers/836587"
#curl -w "Result: %{response_code}\n" -b mySavedCookies -X GET -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/$acctid/ec2_elastic_ips/54759"

#curl -w "Result: %{response_code}\n" -b mySavedCookies -X GET -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/$acctid/servers/805417/get_sketchy_data?start=-400&end=0&resolution=1&plugin_name=cp-0&plugin_type=cpu-idle"

#curl -w "Result %{response_code}\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' -d 'server_array[active]=true' "https://my.rightscale.com/api/acct/$acctid/server_arrays/10461"
#curl -w "Result %{response_code}\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' -d 'server_array[active]=false' "https://my.rightscale.com/api/acct/$acctid/server_arrays/10461"

#curl -w "Result %{response_code}\n" -b mySavedCookies -X GET -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/9236/deployments"
url -w "Result: %{response_code}\n" -b mySavedCookies -X GET -H 'X-API-VERSION:1.0' "https://my.rightscale.com/api/acct/$acctid/server_arrays/16809/instances"
