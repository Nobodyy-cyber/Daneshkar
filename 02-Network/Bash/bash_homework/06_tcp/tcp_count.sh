#!/bin/bash
if command -v ss &>/dev/null; then
    listen_count=$(ss -tan | grep -c "LISTEN" || true)
    estab_count=$(ss -tan | grep -c "ESTAB" || true)
elif command -v netstat &>/dev/null; then
    listen_count=$(netstat -tan | grep -c "LISTEN" || true)
    estab_count=$(netstat -tan | grep -c "ESTABLISHED" || true)
else
    echo "ERROR: Neither 'ss' nor 'netstat' found."
    exit 1
fi

echo "LISTEN: $listen_count"
echo "ESTABLISHED: $estab_count"
