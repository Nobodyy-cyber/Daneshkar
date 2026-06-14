#!/bin/bash
docker stats --no-stream limited-container > resource_stats.txt

docker inspect limited-container | grep -A 5 "Memory\|CpuShares" >>
resource_stats.txt
