#!/bin/bash
docker exec container-a ping -c 2 container-b 2>&1 > isolation_test.txt ||
echo "Ping failed as expected" >> isolation_test.txt
docker network connect network-a container-b
docker exec container-a ping -c 2 container-b >> isolation_test.txt
docker network inspect network-a | grep -A 5 "Containers" > network_a_containers.txt
docker network inspect bridge | grep -A 10 "IPAM" > bridge_network_info.txt
