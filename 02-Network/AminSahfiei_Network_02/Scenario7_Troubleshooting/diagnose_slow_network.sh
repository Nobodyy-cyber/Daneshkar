#!/bin/bash

OUTPUT="network_performance_diagnosis.txt"

echo "Network Performance Diagnosis Report" > $OUTPUT
echo "Generated at: $(date)" >> $OUTPUT
echo "-------------------------------------" >> $OUTPUT

echo "" >> $OUTPUT
echo "Latency Test:" >> $OUTPUT
for server in 8.8.8.8 1.1.1.1 google.com
do
    echo "Testing latency to $server" >> $OUTPUT
    ping -c 10 $server | grep avg >> $OUTPUT
done

echo "-------------------------------------" >> $OUTPUT

# Packet loss check
echo "" >> $OUTPUT
echo "Packet Loss Test (8.8.8.8):" >> $OUTPUT
ping -c 10 8.8.8.8 | grep "packet loss" >> $OUTPUT

echo "-------------------------------------" >> $OUTPUT

echo "" >> $OUTPUT
echo "DNS Resolution Time:" >> $OUTPUT
{ time dig google.com > /dev/null; } 2>> $OUTPUT

echo "-------------------------------------" >> $OUTPUT

echo "" >> $OUTPUT
echo "MTU Information:" >> $OUTPUT
ip link show | grep mtu >> $OUTPUT

echo "" >> $OUTPUT
echo "MTU Test (1472 payload):" >> $OUTPUT
ping -c 3 -M do -s 1472 8.8.8.8 >> $OUTPUT

echo "-------------------------------------" >> $OUTPUT

echo "" >> $OUTPUT
echo "Potential Bottleneck Analysis:" >> $OUTPUT

LOSS=$(ping -c 5 8.8.8.8 | grep "packet loss" | awk -F',' '{print $3}' | awk '{print $1}')

if [ "$LOSS" != "0%" ]; then
    echo "Possible issue: Packet loss detected ($LOSS)" >> $OUTPUT
else
    echo "No packet loss detected." >> $OUTPUT
fi

LAT=$(ping -c 5 8.8.8.8 | grep avg | awk -F'/' '{print $5}')

echo "Average latency: $LAT ms" >> $OUTPUT

echo "Diagnosis completed. Results saved in $OUTPUT"
