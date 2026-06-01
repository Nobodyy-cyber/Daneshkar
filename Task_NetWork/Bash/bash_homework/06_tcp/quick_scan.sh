#!/bin/bash

HOST="localhost"
PORTS=(22 80 443)

check_port() {
    local port="$1"
    
    if command -v nc &>/dev/null; then
        nc -z -w 2 "$HOST" "$port" &>/dev/null
    else
        timeout 2 bash -c "</dev/tcp/$HOST/$port" &>/dev/null
    fi
    return $?
}

for port in "${PORTS[@]}"; do
    if check_port "$port"; then
        echo "$port open"
    else
        echo "$port closed"
    fi
done
