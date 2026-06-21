#!/bin/bash

docker run -d --name nginx-status \
-p 8090:80 \
-v $(pwd)/nginx_status.conf:/etc/nginx/nginx.conf:ro \
nginx:alpine

sleep 2
for i in {1..8}; do
curl http://localhost:8090/ > /dev/null
done
curl http://localhost:8090/basic_status > status_output.txt
docker logs nginx-status | tail -n 15 > status_logs.txt

docker stop nginx-status
docker rm nginx-status