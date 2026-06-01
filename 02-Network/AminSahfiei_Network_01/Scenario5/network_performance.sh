#!/bin/bash

SERVER="127.0.0.1"
REPORT="performance_report.txt"

echo "Network Performance Report" > $REPORT
echo "Generated on: $(date)" >> $REPORT
echo "-----------------------------------" >> $REPORT

echo "" >> $REPORT
echo "1. Bandwidth Test (iperf3 TCP)" >> $REPORT
echo "-----------------------------------" >> $REPORT
iperf3 -c $SERVER >> $REPORT 2>&1

echo "" >> $REPORT
echo "2. Latency and Packet Loss Test (ping)" >> $REPORT
echo "-----------------------------------" >> $REPORT
ping -c 10 $SERVER >> $REPORT 2>&1

echo "" >> $REPORT
echo "3. Jitter Test (iperf3 UDP)" >> $REPORT
echo "-----------------------------------" >> $REPORT
iperf3 -c $SERVER -u -b 100M >> $REPORT 2>&1

echo "" >> $REPORT
echo "Report saved to $REPORT"
