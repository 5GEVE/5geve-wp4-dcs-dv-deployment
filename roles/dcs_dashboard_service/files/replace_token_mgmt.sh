#!/bin/bash

curl --location --request POST 'http://10.5.7.21:8080/auth/realms/5geve/protocol/openid-connect/token' --header 'Authorization: Basic a2liYW5hOmM5N2IyMTU0LTc0OTUtNDc2YS04Y2RiLWMxYTliNzBjMTkzMw==' --header 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'grant_type=password' --data-urlencode 'username=kibanaadmin' --data-urlencode 'password=kib10Ana' --data-urlencode 'scope=openid' --data-urlencode 'client-id=kibana'

echo Copy and paste access_token below:
echo
read token

sudo sed -i "/Authorization/c\        proxy_set_header  Authorization \"Bearer $token\";" /etc/nginx/sites-available/mgmt

echo File modified
sudo cat /etc/nginx/sites-available/mgmt

sudo systemctl reload nginx
