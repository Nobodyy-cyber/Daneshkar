#!/bin/bash

while true
do
clear

echo -e "\e[36m=====================================\e[0m"
echo -e "\e[36m      Simple Network Dashboard       \e[0m"
echo -e "\e[36m=====================================\e[0m"

echo -e "\n\e[32m[Network Interfaces & IPs]\e[0m"
ip -br addr

echo -e "\n\e[33m[Active Connections]\e[0m"
echo "Total connections: $(ss -ntu | wc -l)"

echo -e "\n\e[34m[Open Ports]\e[0m"
ss -tuln | awk 'NR>1 {print $1, $5}'

echo -e "\n\e[35m[DNS Servers]\e[0m"
grep "nameserver" /etc/resolv.conf | awk '{print $2}'

echo -e "\n\e[31m[Latest 5 Log Entries]\e[0m"
if [ -f /var/log/syslog ]; then
    tail -n 5 /var/log/syslog
elif [ -f /var/log/messages ]; then
    tail -n 5 /var/log/messages
else
    echo "No log file found"
fi

echo -e "\n\e[33mRefreshing in 10 seconds... (Ctrl+C to exit)\e[0m"

sleep 10

done
