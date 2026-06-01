#!/bin/bash

OUTPUT_FILE="https_test_report.txt"

echo "===== HTTPS Test Report =====" > $OUTPUT_FILE
echo "Target: https://google.com" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

echo "[1] Basic SSL/TLS info using curl" >> $OUTPUT_FILE
curl -vI https://google.com 2>&1 | grep -E "SSL|TLS|expire" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

echo "[2] Certificate chain (using openssl)" >> $OUTPUT_FILE
openssl s_client -connect google.com:443 -showcerts </dev/null 2>/dev/null | grep "s:" | uniq >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

echo "[3] Certificate expiration date" >> $OUTPUT_FILE
echo | openssl s_client -connect google.com:443 2>/dev/null | openssl x509 -noout -dates >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

echo "[4] TLS version used" >> $OUTPUT_FILE
curl -vI https://google.com 2>&1 | grep "TLSv" | uniq >> $OUTPUT_FILE

echo "" >> $OUTPUT_FILE
echo "===== Test Completed =====" >> $OUTPUT_FILE
