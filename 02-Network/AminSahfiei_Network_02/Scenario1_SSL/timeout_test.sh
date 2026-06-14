#!/bin/bash

SERVER="10.255.255.1"

echo "Testing SSH timeout..."

timeout 5 ssh user@$SERVER

if [ $? -eq 124 ]; then
    echo "Connection timeout detected"
else
    echo "Connection finished"
fi
