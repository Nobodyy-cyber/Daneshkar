#!/bin/bash
# هدف: سه تابع کاربردی - say_hello / count_lines / disk_ok

# --- تابع ۱: چاپ سلام ---
say_hello() {
    local name="$1"
    if [ -z "$name" ]; then
        echo "Usage: $0 hello <NAME>"
        exit 1
    fi
    echo "Hello, $name"
}

# --- تابع ۲: شمارش خطوط فایل ---
count_lines() {
    local file="$1"
    if [ -z "$file" ]; then
        echo "Usage: $0 count <FILE>"
        exit 1
    fi
    if [ ! -f "$file" ]; then
        echo "ERROR: File '$file' not found."
        exit 1
    fi
    local lines
    lines=$(wc -l < "$file")
    echo "Lines in '$file': $lines"
}

# --- تابع ۳: بررسی فضای دیسک ---
disk_ok() {
    local threshold="$1"
    if [ -z "$threshold" ]; then
        echo "Usage: $0 disk <THRESHOLD_PERCENT>"
        exit 1
    fi
    # استخراج درصد استفاده از / با df و awk
    local usage
    usage=$(df -h / | awk 'NR==2 {gsub(/%/,""); print $5}')
    echo "Disk usage: ${usage}%  (threshold: ${threshold}%)"
    if [ "$usage" -gt "$threshold" ]; then
        echo "ALERT: Disk usage exceeds threshold!"
    else
        echo "OK: Disk usage is within limit."
    fi
}

# --- سوییچ اصلی روی آرگومان اول ---
command="$1"
shift

case "$command" in
    hello)  say_hello "$1" ;;
    count)  count_lines "$1" ;;
    disk)   disk_ok "$1" ;;
    *)
        echo "Usage: $0 {hello <NAME> | count <FILE> | disk <THRESHOLD>}"
        exit 1
        ;;
esac
