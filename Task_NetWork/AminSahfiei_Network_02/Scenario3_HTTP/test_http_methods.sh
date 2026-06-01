#!/bin/bash

BASE_URL="https://jsonplaceholder.typicode.com/posts"

echo "--- HTTP Methods Test Report ---" > http_methods_report.txt

test_method() {
    METHOD=$1
    URL=$2
    DATA=$3
    
    echo "Testing $METHOD..."
    echo "--- $METHOD Method ---" >> http_methods_report.txt
    
    if [ -z "$DATA" ]; then
        RESPONSE=$(curl -i -X $METHOD $URL 2>/dev/null)
        STATUS=$(curl -o /dev/null -s -w "%{http_code}" -X $METHOD $URL)
    else
        RESPONSE=$(curl -i -X $METHOD $URL -H "Content-Type: application/json" -d "$DATA" 2>/dev/null)
        STATUS=$(curl -o /dev/null -s -w "%{http_code}" -X $METHOD $URL -H "Content-Type: application/json" -d "$DATA")
    fi
    
    echo "Status Code: $STATUS" >> http_methods_report.txt
    echo "Response Headers & Preview:" >> http_methods_report.txt
    echo "$RESPONSE" | head -n 10 >> http_methods_report.txt
    echo "--------------------------" >> http_methods_report.txt
    echo "Tested $METHOD with status $STATUS"
}

test_method "GET" "$BASE_URL/1" ""
test_method "POST" "$BASE_URL" '{"title":"foo","body":"bar","userId":1}'
test_method "PUT" "$BASE_URL/1" '{"title":"foo","body":"bar","userId":1}'
test_method "DELETE" "$BASE_URL/1" ""

echo "Done! Results saved in http_methods_report.txt"
