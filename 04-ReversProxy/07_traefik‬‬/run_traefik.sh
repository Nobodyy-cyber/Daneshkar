#!/bin/bash
# cd 07_traefik


docker compose up -d
sleep 5
docker compose ps > traefik_status.txt
curl http://localhost:8080/ > whoami_response.txt
curl http://localhost:8081/api/rawdata > traefik_api.txt 2>&1 || echo "API
check" >> traefik_api.txt
docker compose logs traefik | tail -n 30 &> traefik_logs.txt


# docker compose down 
# docker network rm  net-treafik