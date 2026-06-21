#!/bin/bash
cd 07_traefik
docker compose -f docker-compose-advanced.yml up -d
sleep 5
echo "=== Testing web1 ===" > advanced_test.txt
curl -H "Host: web1.localhost" http://localhost:8080/ >> advanced_test.txt
echo -e "\n=== Testing web2 ===" >> advanced_test.txt
curl -H "Host: web2.localhost" http://localhost:8080/ >> advanced_test.txt
echo -e "\n=== Traefik Dashboard ===" >> advanced_test.txt
curl http://localhost:8081/api/http/routers >> advanced_test.txt
docker compose -f docker-compose-advanced.yml down 