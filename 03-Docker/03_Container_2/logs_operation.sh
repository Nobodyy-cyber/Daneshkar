#!/bin/bash
sleep 12
docker logs log-test > all_logs.txt
docker logs --tail 5 log-test > last_5_logs.txt
docker logs --since 5s log-test > recent_logs.txt
