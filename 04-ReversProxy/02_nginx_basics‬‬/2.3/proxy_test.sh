#!/bin/bash
script_dir="$(dirname "$(readlink -f "$0")")"
grand_dir="$(dirname "$script_dir")"
DOCKER_NETWORK="nginx2.3"

docker network create  $DOCKER_NETWORK

docker run -d --name backend-api  --network $DOCKER_NETWORK python:3.9-alpine sh -c "python3 -m http.server 5000"

docker run -d --name nginx-proxy -p 8090:80 --network $DOCKER_NETWORK \
  -v "${script_dir}/nginx.conf:/etc/nginx/nginx.conf:ro" \
  -v "${grand_dir}/2.2/web:/usr/share/nginx/html:ro" \
  nginx:alpine

sleep 3
curl http://localhost:8090/ > frontend_test.txt
curl http://localhost:8090/api > api_test.txt
docker logs nginx-proxy | tail -n 10 > proxy_logs.txt


docker stop nginx-proxy backend-api
docker rm nginx-proxy backend-api
docker network rm $DOCKER_NETWORK