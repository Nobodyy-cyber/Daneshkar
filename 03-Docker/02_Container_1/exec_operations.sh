#!/bin/bash
docker exec exec-test sh -c 'echo "Hello from exec" > /tmp/test.txt'
docker exec exec-test cat /tmp/test.txt > exec_output.txt
docker exec exec-test sh -c 'ps aux' > exec_processes.txt
docker exec -it exec-test sh -c 'echo "Interactive exec test" >> /tmp/test.txt'
2>&1 | head -n 5 >> exec_output.txt
