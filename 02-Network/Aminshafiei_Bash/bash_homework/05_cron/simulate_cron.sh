#!/bin/bash
# هدف: خواندن sample.cron و لیست کردن command‌ها در would_run.txt

SCRIPT_DIR="$(dirname "$0")"
CRON_FILE="$SCRIPT_DIR/sample.cron"
OUTPUT="$SCRIPT_DIR/would_run.txt"

if [ ! -f "$CRON_FILE" ]; then
    echo "ERROR: sample.cron not found at $CRON_FILE"
    exit 1
fi

# پاک کردن فایل خروجی قبلی
> "$OUTPUT"

# استخراج command از هر خط معتبر (فیلد ۶ به بعد)
awk '
    /^[[:space:]]*$/ { next }   # خطوط خالی
    /^[[:space:]]*#/ { next }   # کامنت‌ها
    NF >= 6 {
        # حذف ۵ فیلد اول و چاپ بقیه (command)
        $1=""; $2=""; $3=""; $4=""; $5=""
        sub(/^[[:space:]]+/, "")
        print
    }
' "$CRON_FILE" > "$OUTPUT"

echo "Commands that would run:"
cat "$OUTPUT"
