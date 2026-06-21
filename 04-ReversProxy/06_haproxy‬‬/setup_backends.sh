#!/bin/bash
DOCKER_NETWORK='haproxy_net'

docker network create $DOCKER_NETWORK

docker run -d --name backend1 \
--network $DOCKER_NETWORK \
-v $(pwd)/backend1:/usr/share/nginx/html:ro \
-p 8180:80 \
nginx:alpine

docker run -d --name backend2 \
--network $DOCKER_NETWORK \
-v $(pwd)/backend2:/usr/share/nginx/html:ro \
-p 8181:80 \
nginx:alpine

sleep 2
curl http://localhost:8180/ > backend1_response.txt
curl http://localhost:8181/ > backend2_response.txt
docker ps | grep backend > backends_status.txt

