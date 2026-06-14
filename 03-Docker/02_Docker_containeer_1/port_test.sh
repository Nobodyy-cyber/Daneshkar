#!/bin/bash
sleep 2
curl -I http://localhost:8888 > port_mapping_test.txt
docker port web-server >> port_mapping_test.txt
ss -tuln | grep 8888 >> port_mapping_test.txt
