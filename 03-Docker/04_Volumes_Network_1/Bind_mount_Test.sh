#!/bin/bash
sleep 2
curl http://localhost:9000 > bind_mount_output.html
echo "File modified on host" >> 04_volumes_network_1/web/index.html
curl http://localhost:9000 > bind_mount_output_modified.html

