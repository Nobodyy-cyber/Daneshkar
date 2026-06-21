#!/bin/bash
 
docker run -d --name nginx-basic -p 8080:80 nginx:alpine

sleep 3
curl -I http://localhost:8080 > nginx_response.txt
docker logs nginx-basic | head -n 10 > nginx_logs.txt
docker inspect nginx-basic | grep -A 5 "NetworkSettings" > nginx_network.txt
docker stop nginx-basic
docker rm nginx-basic