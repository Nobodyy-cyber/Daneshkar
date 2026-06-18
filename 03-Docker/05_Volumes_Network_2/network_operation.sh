#!/bin/bash
docker network inspect my-network > network_info.txt
docker exec container1 ping -c 3 container2 > ping_test.txt
docker exec container1 nslookup container2 >> ping_test.txt
