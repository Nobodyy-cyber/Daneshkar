#!/bin/bash
docker exec volume-test sh -c 'echo "Hello from container"' > test.txt
docker exec volume-test cat test.txt > volume_content.txt
docker volume inspect my-data > volume_info.txt
docker rm -f volume-test
docker run -d --name volume-test-2 -v my-data:/app/data alpine:latest sleep
3600
docker exec volume-test-2 cat test.txt >> volume_content.txt
