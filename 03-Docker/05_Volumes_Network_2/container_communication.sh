#!/bin/bash
sleep 10
docker exec client ping -c 2 db > db_connectivity.txt
docker exec client nslookup db >> db_connectivity.txt
docker network ls > all_networks.txt
docker network inspect bridge | grep -A 10 "Containers" >> all_networks.txt
