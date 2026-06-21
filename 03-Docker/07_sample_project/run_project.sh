#!/bin/bash
docker compose up -d --build
sleep 5
curl http://localhost:3000 &> frontend_test.html
curl http://localhost:3000/api &> api_test.json
docker compose ps &> project_status.txt
docker compose logs --tail 20 > project_logs.txt