#!/bin/bash

SERVER="ftp.ubuntu.com"

echo "--- 1. Connecting to $SERVER ---"
ftp -n $SERVER <<EOF
user anonymous anonymous
ls
quit
EOF

echo -e "\n--- 2. Downloading with wget ---"
wget ftp://$SERVER/README.html

echo -e "\n--- 3. Uploading (Conceptual) ---"
