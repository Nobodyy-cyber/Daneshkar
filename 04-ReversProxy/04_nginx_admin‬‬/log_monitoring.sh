#!/bin/bash

docker run -d --name nginx-logs \
-p 8091:80 \
nginx:alpine

sleep 2

curl http://localhost:8091/ > /dev/null
curl http://localhost:8091/nonexistent 2>&1 > /dev/null

docker logs nginx-logs --tail 20 > latest_logs.txt
docker logs nginx-logs 2>&1 | grep -i error > error_logs.txt || echo "No
errors found" > error_logs.txt


docker logs nginx-logs --since 1m > recent_logs.txt
docker stop  nginx-logs
docker rm  nginx-logs
