#!/bin/bash
docker run -d --name nginx-mtls \
-p 9443:9443 \
-v $(pwd)/nginx/nginx_mtls.conf:/etc/nginx/nginx.conf:ro \
-v $(pwd):/etc/nginx/mtls:ro \
nginx:alpine

sleep 2
# it must be fail
echo "=== Test without client certificate ===" > mtls_test.txt
curl -k https://localhost:9443/ -v 2>&1 | grep -E 'HTTP|SSL|certificate' >> mtls_test.txt

# It is must sussece
echo -e "\n=== Test with client certificate ===" >> mtls_test.txt
curl -k https://localhost:9443/ \
--cert client/client.crt \
--key client/client.key \
-v 2>&1 | grep -E 'HTTP|SSL|certificate' >> mtls_test.txt

echo -e "\nopenssl verify -CAfile ca/rootCA.crt client/client.crt" >> mtls_test.txt

openssl verify -CAfile ca/rootCA.crt client/client.crt &>> mtls_test.txt

docker stop nginx-mtls 
docker rm nginx-mtls 