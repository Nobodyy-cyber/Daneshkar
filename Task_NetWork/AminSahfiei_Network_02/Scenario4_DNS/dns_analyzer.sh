#!/bin/bash

DOMAINS=("google.com" "github.com" "stackoverflow.com" "linkedin.com")

OUTPUT="dns_analysis_report.txt"

echo "DNS Query Analysis Report" > $OUTPUT
echo "Generated on: $(date)" >> $OUTPUT
echo "-------------------------------------------------------------" >> $OUTPUT
printf "%-20s %-20s %-10s %-20s %-10s\n" "Domain" "IP Address" "TTL" "DNS Server" "Query(ms)" >> $OUTPUT
echo "-------------------------------------------------------------" >> $OUTPUT

for DOMAIN in "${DOMAINS[@]}"
do
    DIG_RESULT=$(dig $DOMAIN)

    IP=$(dig +short $DOMAIN A | head -n 1)

    TTL=$(echo "$DIG_RESULT" | grep -m1 "$DOMAIN" | awk '{print $2}')

    SERVER=$(echo "$DIG_RESULT" | grep "SERVER:" | awk '{print $2}')

    TIME=$(echo "$DIG_RESULT" | grep "Query time" | awk '{print $4}')

    printf "%-20s %-20s %-10s %-20s %-10s\n" "$DOMAIN" "$IP" "$TTL" "$SERVER" "$TIME" >> $OUTPUT
done

echo "-------------------------------------------------------------" >> $OUTPUT
echo "Analysis complete. Results saved in dns_analysis_report.txt"
