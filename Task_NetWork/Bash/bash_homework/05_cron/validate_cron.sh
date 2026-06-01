#!/bin/bash
# هدف: اعتبارسنجی فرمت خطوط cron در sample.cron

SCRIPT_DIR="$(dirname "$0")"
CRON_FILE="$SCRIPT_DIR/sample.cron"

if [ ! -f "$CRON_FILE" ]; then
    echo "ERROR: sample.cron not found at $CRON_FILE"
    exit 1
fi

while IFS= read -r line; do
    # نادیده گرفتن خطوط خالی و کامنت‌ها
    [[ -z "$line" || "$line" == \#* ]] && continue

    # بررسی: آیا حداقل ۶ فیلد دارد (۵ فیلد زمان + command)
    field_count=$(echo "$line" | awk '{print NF}')
    if [ "$field_count" -ge 6 ]; then
        echo "VALID: $line"
    else
        echo "INVALID: $line"
    fi
done < "$CRON_FILE"
