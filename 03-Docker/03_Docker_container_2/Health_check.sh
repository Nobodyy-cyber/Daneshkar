#!/bin/bash
sleep 10
docker inspect --format='{{.State.Health.Status}}' health-test >
health_status.txt
docker inspect --format='{{json .State.Health}}' health-test | python3 -m
json.tool > health_details.txt
docker ps --filter "name=health-test" --format "table
{{.Names}}\t{{.Status}}" >> health_status.txt
