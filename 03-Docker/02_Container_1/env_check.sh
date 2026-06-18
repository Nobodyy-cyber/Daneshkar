#!/bin/bash
docker exec env-test env | grep -E 'MY_VAR|PORT' > env_output.txt
docker exec env-test sh -c 'echo "MY_VAR=$MY_VAR, PORT=$PORT"'
>> env_output.txt
