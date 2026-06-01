#!/bin/bash
# هدف: پاک‌سازی config.ini با sed و ذخیره در clean.config

SCRIPT_DIR="$(dirname "$0")"
INPUT="$SCRIPT_DIR/config.ini"
OUTPUT="$SCRIPT_DIR/clean.config"

if [ ! -f "$INPUT" ]; then
    echo "ERROR: config.ini not found at $INPUT"
    exit 1
fi

sed \
    -e '/^$/d' \
    -e '/^#/d' \
    -e 's/^DEBUG=true/DEBUG=false/' \
    "$INPUT" > "$OUTPUT"

echo "Clean config saved to: $OUTPUT"
echo "--- Content ---"
cat "$OUTPUT"
