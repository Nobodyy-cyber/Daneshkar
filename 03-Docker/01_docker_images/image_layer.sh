#!/bin/bash
docker history nginx:alpine --no-trunc > image_history.txt
docker inspect nginx:alpine | grep -A 10 "RootFS" > image_rootfs.txt
docker history nginx:alpin >> image_rootfs.txt
docker image inspect nginx:alpine --format '{{.Size}}' > image_size_bytes.txt
