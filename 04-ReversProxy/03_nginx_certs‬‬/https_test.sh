#!/bin/bash

# script_dir="$(dirname "$(readlink -f "$0")")"
# grand_dir="$(dirname "$script_dir")"
script_dir=$(pwd)


docker run -d --name nginx-https \
-p 8443:443 \
-v ${script_dir}/nginx/nginx_https.conf:/etc/nginx/nginx.conf:ro \
-v ${script_dir}/certs:/etc/nginx/certs:ro \
nginx:alpine

sleep 2

curl -k https://localhost:8443/status > https_response.txt
openssl s_client -connect localhost:8443 -servername demo.local < /dev/null 2>&1 | openssl x509 -noout -dates >> https_response.txt
docker logs nginx-https | tail -n 10 > https_logs.txt

echo -e "\ndocker port nginx-https " >> https_response.txt
docker port nginx-https  >> https_response.txt

echo -e "\nss -tuln | grep -E ':8443'" >> https_response.txt
ss -tuln | grep -E ':8443' >> https_response.txt

docker stop nginx-https
docker rm nginx-https