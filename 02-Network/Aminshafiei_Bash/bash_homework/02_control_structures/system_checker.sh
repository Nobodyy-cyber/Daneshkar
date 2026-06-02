#!/bin/bash
# هدف: بررسی کاربر، وجود فایل، و محتوای فایل با if/elif

SAMPLE_FILE="$(dirname "$0")/sample.txt"

# --- بررسی کاربر ---
if [ "$(id -u)" -eq 0 ]; then
    echo "root user"
else
    echo "normal user"
fi

# --- بررسی وجود فایل و تعداد خطوط ---
if [ -f "$SAMPLE_FILE" ]; then
    line_count=$(wc -l < "$SAMPLE_FILE")
    echo "File '$SAMPLE_FILE' exists. Line count: $line_count"
else
    echo "File '$SAMPLE_FILE' not found."
fi

# --- بررسی وجود ERROR یا error در فایل ---
if [ -f "$SAMPLE_FILE" ] && grep -qi "error" "$SAMPLE_FILE"; then
    echo "WARNING: 'error' keyword found in sample file!"
fi
