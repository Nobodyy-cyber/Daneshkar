#!/bin/bash

docker run -d --name test-nginx nginx:alpine
sleep 2
docker ps | grep test-nginx
docker logs test-nginx | head -n 10 > nginx_logs.txt
docker stop test-nginx
docker ps -a | grep test-nginx
docker inspect test-nginx | grep -A 3 "State" > Container_State.txt
