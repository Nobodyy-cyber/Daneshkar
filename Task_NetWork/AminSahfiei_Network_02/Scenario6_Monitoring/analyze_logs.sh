#!/bin/bash

OUTPUT="log_analysis_report.txt"

echo "Network Log Analysis Report" > $OUTPUT
echo "Generated at: $(date)" >> $OUTPUT
echo "--------------------------------------" >> $OUTPUT

LOGFILES="/var/log/syslog /var/log/kern.log /var/log/auth.log"

echo "Log Files Analyzed:" >> $OUTPUT
for log in $LOGFILES
do
    if [ -f "$log" ]; then
        echo "$log" >> $OUTPUT
    fi
done

echo "--------------------------------------" >> $OUTPUT

echo "Last 10 Network Events:" >> $OUTPUT
grep -iE "network|ssh|connection|failed|error" $LOGFILES 2>/dev/null | tail -n 10 >> $OUTPUT

echo "--------------------------------------" >> $OUTPUT

echo "IP Address Statistics:" >> $OUTPUT
grep -Eho '([0-9]{1,3}\.){3}[0-9]{1,3}' $LOGFILES 2>/dev/null | sort | uniq -c | sort -nr >> $OUTPUT

echo "--------------------------------------" >> $OUTPUT

echo "Suspicious Patterns (Multiple Failed Logins):" >> $OUTPUT
grep "Failed password" /var/log/auth.log 2>/dev/null | \
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | \
sort | uniq -c | sort -nr | head >> $OUTPUT

echo "--------------------------------------" >> $OUTPUT
echo "Analysis complete. Results saved in log_analysis_report.txt"
