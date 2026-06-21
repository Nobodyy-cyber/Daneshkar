#!/bin/bash
# docker pull nginx:alpine
# docker pull haproxy:alpine
# docker pull traefik:v3.0
# docker pull python:3.9-alpine
# docker images | grep -E 'nginx|haproxy|traefik|python' > pulled_images.txt
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" | awk 'NR==1 || /nginx|haproxy|traefik|python/' > images_summary.txt


