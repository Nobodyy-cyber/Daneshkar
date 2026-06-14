#!/bin/bash

INTERFACE="enp5s0"
LOGFILE="monitoring_log.txt"

echo "Starting network monitoring..." >> $LOGFILE

RX1=$(cat /proc/net/dev | grep $INTERFACE | awk '{print $2}')
TX1=$(cat /proc/net/dev | grep $INTERFACE | awk '{print $10}')

while true
do
    sleep 5

    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

    RX2=$(cat /proc/net/dev | grep $INTERFACE | awk '{print $2}')
    TX2=$(cat /proc/net/dev | grep $INTERFACE | awk '{print $10}')

    DOWNLOAD=$((RX2 - RX1))
    UPLOAD=$((TX2 - TX1))

    DOWNLOAD_KB=$((DOWNLOAD / 1024))
    UPLOAD_KB=$((UPLOAD / 1024))

    ACTIVE_CONN=$(ss -ntu | wc -l)

    TOP_IP=$(ss -ntu | awk 'NR>1 {print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head -5)

    {
        echo "----------------------------------------"
        echo "Time: $TIMESTAMP"
        echo "Interface: $INTERFACE"
        echo "Download (5s): ${DOWNLOAD_KB} KB"
        echo "Upload (5s): ${UPLOAD_KB} KB"
        echo "Active Connections: $ACTIVE_CONN"
        echo "Top 5 IP Addresses:"
        echo "$TOP_IP"
    } >> $LOGFILE

    RX1=$RX2
    TX1=$TX2

done
