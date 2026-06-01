#!/bin/bash

REPORT="security_report.txt"

echo "===== Security Monitoring Report =====" > "$REPORT"
echo "Generated at: $(date)" >> "$REPORT"
echo "--------------------------------------" >> "$REPORT"

echo -e "\n[1] IPs with more than 100 active connections:" >> "$REPORT"
sudo netstat -ntu 2>/dev/null | awk '{print $5}' | cut -d: -f1 \
  | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' \
  | sort | uniq -c | sort -nr | awk '$1>100' >> "$REPORT"

if [ $? -ne 0 ]; then
  echo "Error while checking active connections." >> "$REPORT"
fi

echo -e "\n[2] SSH failed login attempts (Failed password):" >> "$REPORT"

if [ -f /var/log/secure ]; then
  LOGFILE="/var/log/secure"
elif [ -f /var/log/auth.log ]; then
  LOGFILE="/var/log/auth.log"
else
  LOGFILE=""
fi

if [ -n "$LOGFILE" ]; then
  sudo grep "Failed password" "$LOGFILE" | awk '{print $(NF-3)}' \
    | sort | uniq -c | sort -nr >> "$REPORT"

  echo "(Total failed attempts: $(sudo grep -c 'Failed password' "$LOGFILE"))" >> "$REPORT"
else
  echo "No auth log found (/var/log/auth.log or /var/log/secure)." >> "$REPORT"
fi

echo -e "\n[3] Connections to unusual ports (greater than 10000):" >> "$REPORT"
sudo netstat -ntu 2>/dev/null \
  | awk '{print $5, $4}' \
  | awk -F '[: ]' '{if ($6 > 10000) print $1}' \
  | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' \
  | sort | uniq -c | sort -nr >> "$REPORT"

echo -e "\n--------------------------------------" >> "$REPORT"
echo "Full report saved to $REPORT" >> "$REPORT"

echo "Monitoring completed. Output file: $REPORT"
