#!/bin/bash
# هدف: خواندن sample.txt با mapfile و نوشتن خطوط خطا در errors.txt

SCRIPT_DIR="$(dirname "$0")"
SAMPLE_FILE="$SCRIPT_DIR/sample.txt"
ERRORS_FILE="$SCRIPT_DIR/errors.txt"

# بررسی وجود فایل
if [ ! -f "$SAMPLE_FILE" ]; then
    echo "ERROR: sample.txt not found at $SAMPLE_FILE"
    exit 1
fi

# خواندن تمام خطوط در آرایه با mapfile
mapfile -t lines < "$SAMPLE_FILE"

# پاک کردن فایل خروجی قبلی
> "$ERRORS_FILE"

echo "Processing ${#lines[@]} lines from sample.txt ..."

for line in "${lines[@]}"; do
    # بررسی حروف کوچک/بزرگ با grep -qi
    if echo "$line" | grep -qi "error"; then
        echo "$line" >> "$ERRORS_FILE"
        echo "  [ERROR LINE] $line"
    fi
done

echo "Done. Error lines saved to: $ERRORS_FILE"
