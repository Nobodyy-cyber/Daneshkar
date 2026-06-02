#!/bin/bash

REPORT_FILE="connectivity_report.txt"

{
    echo "--- Connectivity Report ($(date)) ---"
    echo "--------------------------------------------"

    echo "[1] Pinging 8.8.8.8..."
    if ping -c 4 8.8.8.8 > /dev/null 2>&1; then
        echo "SUCCESS: 8.8.8.8 is reachable."
    else
        echo "FAILURE: 8.8.8.8 is unreachable."
    fi

    echo -e "\n[2] Pinging google.com..."
    if ping -c 4 google.com > /dev/null 2>&1; then
        echo "SUCCESS: google.com is reachable."
    else
        echo "FAILURE: google.com is unreachable."
    fi

    echo -e "\n[3] Testing DNS resolution for github.com..."
    DNS_RESULT=$(nslookup github.com 2>&1)
    if [ $? -eq 0 ]; then
        echo "SUCCESS: DNS resolution successful."
        echo "$DNS_RESULT"
    else
        echo "FAILURE: DNS resolution failed."
        echo "$DNS_RESULT"
    fi

    echo -e "\n--------------------------------------------"
    echo "Report completed."
} | tee $REPORT_FILE
