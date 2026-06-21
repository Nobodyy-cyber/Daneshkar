#!/bin/bash
DOCKER_NETWORK='haproxy_net'

./setup_backends.sh

docker run -d --name haproxy-lb \
-p 9000:9000 \
--network $DOCKER_NETWORK \
-v $(pwd)/haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro \
haproxy:alpine


sleep 3
# some request to haproxy 
echo "=== Load Balancing Test ===" > haproxy_test.log
for i in {1..6}; do
echo "Request $i:" >> haproxy_test.log
curl http://localhost:9000/ >> haproxy_test.log
echo "" >> haproxy_test.log
done
docker logs haproxy-lb | tail -n 20 > haproxy_logs.txt
docker stats --no-stream haproxy-lb backend1 backend2 > haproxy_stats.txt
docker stop haproxy-lb backend1 backend2
docker rm haproxy-lb backend1 backend2
docker network rm $DOCKER_NETWORK