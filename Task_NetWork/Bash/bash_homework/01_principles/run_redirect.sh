#!/bin/bash
# هدف: ریدایرکت stdout و stderr و چاپ چند پیام نمونه

# مرحله ۱: ایجاد پوشه خروجی
mkdir -p ./outputs

# مرحله ۲: ریدایرکت‌ها را با exec تنظیم کن
# stdout → outputs/app.log  ,  stderr → outputs/app.err
exec 1>outputs/app.log
exec 2>outputs/app.err

# مرحله ۳: چند پیام تست
echo "this is info"
echo "Script started at: $(date)"
echo "Current user: $(whoami)"

ls /path/that/does/not/exists   # عمداً خطا تولید می‌کند
