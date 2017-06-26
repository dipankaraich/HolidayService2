#!/bin/bash
# This is to run maven command for deploying an API proxy in such a 
# way that username and password do not remain in bash history

environment=$1
username=$2
if [ -z "$3"]
 then
	echo "Enter your password, followed by [ENTER]: "
	read -s password
else
	password=$3
fi

mvn apigee-enterprise:deploy -P$environment -Dusername=$username -Dpassword=$password

rm -rf target