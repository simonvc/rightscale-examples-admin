#!/bin/bash -ex
#
# This script logs in to the Rightscale API v1.5 (and ready for 2.0 later).
# This script should be used in conjunction with other scripts to access the
# functions.
#

# Gets the users details for the login and creates the cookies.
# it pulls the details in the form:
# #!/bin/bash
# 
# USER="my.user@my.domain.com"
# PASSWORD="MySecurePassword"
# ACCT="0000"
source ../user-details.sh

# Make sure the URL variable is set. This is ready for multiple
# endpoints for the API
if [ -z "$URL" ]; then
  URL="https://my.rightscale.com"
fi

# This command makes the actual call to login to the API and
# and create an unrestricted session.
#
# The options used are explained here:
#   -v        Use verbose output.
#   --post302 This option is used to ensure that if a redirect
#             is sent then the new request will remain a POST
#   --location-trusted  This is used to ensure a redirect
#             will send the user credentials on the redirected
#             request. This should only be used for the login
#             and NOT subsequent requests.
#   -c "mySavedCookies-$ACCT" This is the name of the file in
#             which the authentication credentials are stored.
#             The account number is appended for use with
#             multiple account scripts.
#   -d "email=$USER"  This is form data to populate the user's
#             email login credential. The value is picked up
#             from the 'sourced' file.
#   -d "password=$PASSWORD" Again form data that is picked up
#             from the imported file.
#   -d "account_href=/api/accounts/$ACCT" This specifies the
#             account href. These are relative to the baseurl.
#   -X POST   This specifies that the request should use the 
#             HTTP POST method.
#   -H "X-API-VERSION:1.5"  This adds the header to specify 
#             that the request is for version 1.5 of the API.
curl  -v \
      --post302 \
      --location-trusted \
      -c "mySavedCookies-$ACCT" \
      -d "email=$USER" \
      -d "password=$PASSWORD" \
      -d "account_href=/api/accounts/$ACCT" \
      -X POST \
      -H "X-API-VERSION:1.5" \
      "$URL/api/session"
