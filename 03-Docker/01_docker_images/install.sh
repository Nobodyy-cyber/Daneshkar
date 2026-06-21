#!/bin/bash
set -e
sudo apt update
sudo systemctl status docker --no-pager | head -n 15
docker ps -a >> status.txt
sudo systemctl restart docker

docker --version > docker_version.txt
docker info | head -n 20 >> docker_version.txt
docker compose version >> composen_version.txt
