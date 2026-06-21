#!/bin/bash
# cd 06_docker_compose
docker compose up -d
sleep 5
docker compose exec web ping -c 2 app &> service_communication.txt
docker network ls | grep docker_compose &> compose_networks.txt
docker volume ls | grep docker_compose &> compose_volumes.txt
docker compose down -v