#!/bin/bash
# هدف: بررسی syntax تمام فایل‌های .sh داخل پروژه با bash -n

echo "===== Bash Syntax Check Report ====="
echo "Date: $(date)"
echo "====================================="

# پیدا کردن تمام فایل‌های .sh
while IFS= read -r -d '' file; do
    # اجرای بررسی syntax
    bash -n "$file" 2>&1
    exit_code=$?

    if [ $exit_code -eq 0 ]; then
        echo "OK   : $file"
    else
        echo "ERROR: $file"
    fi
done < <(find . -name "*.sh" -print0)

echo "====================================="
echo "Syntax check complete."
