#! /bin/bash -e
#
# This is a template for use testing API functions.
# It relies on a file called user-details.sh to pull in the credentials. This file should contain similar to the following:
#
#USER="user.name@company.com"
#PASSWORD="MySecurePassword"
#ACCT="0000"
#

# This file should setup variables containing the username and password
source ../user-details.sh

# This line sets up the login cookies
curl -w "Response code: %http_code\n" -c mySavedCookies -u "$USER:$PASSWORD" https://my.rightscale.com/api/acct/$ACCT/login?api_version=1.0

curl -w "Response code: %http_code\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' \
\
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_1]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_2]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_3]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_4]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_5]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_6]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_7]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_8]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_9]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_10]=text:This_is_a_really_long_input_value" \
	"https://my.rightscale.com/api/acct/$ACCT/servers/487624001"
curl -w "Response code: %http_code\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' \
\
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_11]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_12]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_13]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_14]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_15]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_16]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_17]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_18]=text:This_is_a_really_long_input_value" \
	"https://my.rightscale.com/api/acct/$ACCT/servers/487624001"
curl -w "Response code: %http_code\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' \
\
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_19]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_20]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_21]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_22]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_23]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_24]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_25]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_26]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_27]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_28]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_29]=text:This_is_a_really_long_input_value" \
	"https://my.rightscale.com/api/acct/$ACCT/servers/487624001"
curl -w "Response code: %http_code\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' \
\
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_30]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_31]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_32]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_33]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_34]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_35]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_36]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_37]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_38]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_39]=text:This_is_a_really_long_input_value" \
	"https://my.rightscale.com/api/acct/$ACCT/servers/487624001"
curl -w "Response code: %http_code\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' \
\
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_40]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_41]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_42]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_43]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_44]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_45]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_46]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_47]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_48]=text:This_is_a_really_long_input_value" \
	"https://my.rightscale.com/api/acct/$ACCT/servers/487624001"
curl -w "Response code: %http_code\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' \
\
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_49]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_50]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_51]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_52]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_53]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_54]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_55]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_56]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_57]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_58]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_59]=text:This_is_a_really_long_input_value" \
	"https://my.rightscale.com/api/acct/$ACCT/servers/487624001"
curl -w "Response code: %http_code\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' \
\
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_60]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_61]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_62]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_63]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_64]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_65]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_66]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_67]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_68]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_69]=text:This_is_a_really_long_input_value" \
	"https://my.rightscale.com/api/acct/$ACCT/servers/487624001"
curl -w "Response code: %http_code\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' \
\
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_70]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_71]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_72]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_73]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_74]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_75]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_76]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_77]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_78]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_79]=text:This_is_a_really_long_input_value" \
	"https://my.rightscale.com/api/acct/$ACCT/servers/487624001"
curl -w "Response code: %http_code\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' \
\
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_80]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_81]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_82]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_83]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_84]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_85]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_86]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_87]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_88]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_89]=text:This_is_a_really_long_input_value" \
	"https://my.rightscale.com/api/acct/$ACCT/servers/487624001"
curl -w "Response code: %http_code\n" -b mySavedCookies -X PUT -H 'X-API-VERSION:1.0' \
\
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_90]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_91]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_92]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_93]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_94]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_95]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_96]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_97]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_98]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_99]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][LONG_INPUT_VALUE_NUMBER_100]=text:This_is_a_really_long_input_value" \
	-d "server[parameters][TEMPORARY_INPUT_LOG_FILE]=text:/tmp/input_log.txt" \
  "https://my.rightscale.com/api/acct/$ACCT/servers/487624001"
