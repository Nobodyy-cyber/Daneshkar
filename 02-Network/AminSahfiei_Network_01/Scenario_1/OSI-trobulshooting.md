مدل OSI (اتصال سیستم‌های باز) یک چارچوب استاندارد برای درک نحوه ارتباطات شبکه‌ای است که از ۷ لایه مجزا تشکیل شده است:

*   **لایه ۷: کاربرد (Application)**
    این لایه مستقیم با نرم‌افزارهای کاربر (مانند مرورگر یا ایمیل) در ارتباط است و رابطی برای دسترسی کاربر به خدمات شبکه فراهم می‌کند.
*   **لایه ۶: نمایش (Presentation)**
    داده‌ها را به قالبی قابل فهم برای شبکه تبدیل می‌کند و وظایف رمزگذاری، فشرده‌سازی و ترجمه کدهای داده را بر عهده دارد.
*   **لایه ۵: نشست (Session)**
    وظیفه برقراری، مدیریت و پایان دادن به ارتباط (جلسات) بین دو دستگاه را بر عهده دارد تا تبادل داده‌ها به درستی انجام شود.
*   **لایه ۴: انتقال (Transport)**
    مسئول انتقال مطمئن داده‌ها بین دو نقطه (End-to-End) است و وظایفی مانند کنترل جریان و بازیابی خطاهای احتمالی در حین ارسال را انجام می‌دهد.
*   **لایه ۳: شبکه (Network)**
    تعیین مسیر داده‌ها (مسیریابی) و انتخاب بهترین راه برای رسیدن بسته‌ها به مقصد بر اساس آدرس‌های منطقی (IP) در این لایه انجام می‌شود.
*   **لایه ۲: پیوند داده (Data Link)**
    داده‌ها را به فریم (Frame) تبدیل کرده و مسئول انتقال فیزیکی آن‌ها بین دو دستگاهِ مستقیماً متصل به هم بر اساس آدرس‌های سخت‌افزاری (MAC) است.
*   **لایه ۱: فیزیکی (Physical)**
    به انتقال بیت‌های خام (0 و 1) از طریق رسانه‌های فیزیکی مانند کابل، فیبر نوری یا امواج رادیویی می‌پردازد و مشخصات سخت‌افزاری را تعریف می‌کند
    ============================================================================================================================================================================================================================================
                           Part 2: Troubleshooting "Website Inaccessible" (Step-by-Step)

| Layer | What to Check? | Linux Tool/Command |
| :--- | :--- | :--- |
| **L1: Physical** | Is the network cable plugged in? Are the NIC LEDs blinking? | `ip link`, `ethtool` |
| **L2: Data Link** | Can we see the gateway's MAC address? Any ARP issues? | `arp -a`, `ip neighbor` |
| **L3: Network** | Can we ping the server IP or the Gateway? Is the routing table correct? | `ping`, `ip route`, `traceroute` |
| **L4: Transport** | Is port 80/443 open? Is the TCP handshake successful? | `telnet`, `nc`, `ss -tuln` |
| **L5: Session** | Are there too many open sessions? Is the connection being dropped? | `netstat -an` |
| **L6: Presentation** | Is there an SSL/TLS handshake error? (Certificate expired/mismatch) | `openssl s_client` |
| **L7: Application** | Is the web server (Nginx/Apache) running? Is DNS resolving correctly? | `curl -I`, `dig`, `nslookup` |

