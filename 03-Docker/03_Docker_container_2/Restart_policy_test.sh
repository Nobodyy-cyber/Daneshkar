#!/bin/bash
sleep 7
docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.RestartCount}}" |
grep -E 'always-restart|unless-stopped|no-restart' > restart_status.txt
docker inspect always-restart | grep -A 2 "RestartPolicy" >> restart_status.txt
