#!/bin/bash
docker compose config &> compose_with_env.txt
docker compose up -d
sleep 5
docker compose exec db env | grep MYSQL &> db_env_vars.txt
docker compose down