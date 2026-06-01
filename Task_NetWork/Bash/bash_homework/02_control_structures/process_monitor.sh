#!/bin/bash
# هدف: مانیتور تعداد پردازه‌ها هر ۵ ثانیه، ۳ بار

count=0
max=3

while [ $count -lt $max ]; do
    count=$((count + 1))
    proc_count=$(ps aux | wc -l)
    echo "[Check $count/$max] $(date '+%H:%M:%S') - Running processes: $proc_count"

    # فقط اگر هنوز تکرار باقی مانده صبر کن
    if [ $count -lt $max ]; then
        sleep 5
    fi
done

echo "Monitoring complete."
