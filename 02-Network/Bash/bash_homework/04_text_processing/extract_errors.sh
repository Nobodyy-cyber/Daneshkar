#!/bin/bash
# هدف: استخراج خطوط ERROR از app.log و ذخیره در errors.log

SCRIPT_DIR="$(dirname "$0")"
INPUT="$SCRIPT_DIR/app.log"
OUTPUT="$SCRIPT_DIR/errors.log"

if [ ! -f "$INPUT" ]; then
    echo "ERROR: app.log not found at $INPUT"
    exit 1
fi

# ذخیره خطوط ERROR در فایل خروجی
sed -n '/ERROR/p' "$INPUT" > "$OUTPUT"

echo "Error lines saved to: $OUTPUT"
echo "--- Extracted Errors (timestamp + message) ---"

# چاپ فقط timestamp و پیام (بدون سطح لاگ ERROR)
while IFS= read -r line; do
    # استخراج timestamp (فیلد ۱ و ۲) و پیام (فیلد ۴ به بعد)
    timestamp=$(echo "$line" | awk '{print $1, $2}')
    message=$(echo "$line" | awk '{for(i=4;i<=NF;i++) printf $i" "; print ""}')
    echo "$timestamp $message"
done < "$OUTPUT"
