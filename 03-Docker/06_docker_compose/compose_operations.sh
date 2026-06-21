#!/bin/bash
# cd 06_docker_compose

docker compose up -d
sleep 5
docker compose ps &> compose_status.txt
docker compose logs web | head -n 10 &> web_logs.txt
curl http://localhost:8080 &> web_response.html
docker compose down