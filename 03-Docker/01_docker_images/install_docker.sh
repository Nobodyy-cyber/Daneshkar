#!/bin/bash
set -e
#sudo apt update
#sudo apt install -y docker.io docker-compose
sudo systemctl enable docker
sudo systemctl start docker
docker --version > docker_version.txt
docker info | head -n 20 >> docker_version.txt
