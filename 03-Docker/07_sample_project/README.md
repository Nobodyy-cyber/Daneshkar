<div align="center">

# Sample Docker Project  
## Nginx + Python + Docker Compose

<p>
یک پروژه نمونه ساده شامل Frontend استاتیک، Reverse Proxy با Nginx و Backend API با Python
</p>

</div>

---

## 1. توضیح کوتاه پروژه

این پروژه یک وب اپلیکیشن ساده شامل موارد زیر است:

<div>

<ul>
  <li>Frontend استاتیک (HTML)</li>
  <li>Reverse Proxy با Nginx</li>
  <li>Backend API با Python</li>
  <li>اجرا شده در Docker Compose</li>
</ul>

</div>

کاربر از طریق مرورگر به Nginx متصل می‌شود و:

<ul>
  <li>فایل‌های HTML را دریافت می‌کند</li>
  <li>درخواست‌های <code>/api</code> به سرویس Python ارسال می‌شود</li>
</ul>

---

## 2. نحوه راه‌اندازی پروژه

<details open>
<summary><strong>اجرای پروژه</strong></summary>
```bash
cd 07_sample_project
docker-compose up -d --build

</details>

<details>
<summary><strong>مشاهده وضعیت سرویس‌ها</strong></summary>

bash
docker-compose ps

</details>

<details>
<summary><strong>مشاهده لاگ‌ها</strong></summary>

bash
docker-compose logs

</details>

<details>
<summary><strong>توقف پروژه</strong></summary>

bash
docker-compose down

</details>

---

## 3. ساختار فایل‌ها و نقش هر سرویس

### ساختار فایل‌ها



<pre dir="ltr"><code>07_sample_project/
├── docker-compose.yml   → تعریف سرویس‌ها
├── nginx/
│   └── nginx.conf       → تنظیمات reverse proxy
├── app/
│   ├── app.py           → API ساده Python
│   └── Dockerfile       → ساخت image پایتون
└── web/
└── index.html       → فایل frontend
</code></pre>


### نقش سرویس‌ها

<table>
  <thead>
<tr>
<th>سرویس</th>
<th>نقش</th>
</tr>
  </thead>
  <tbody>
<tr>
<td><strong>nginx</strong></td>
<td>
سرو فایل‌های استاتیک<br>
reverse proxy برای <code>/api</code><br>
گوش دادن روی پورت <code>80</code> در کانتینر و پورت <code>3000</code> در هاست
</td>
</tr>
<tr>
<td><strong>python-app</strong></td>
<td>
اجرای API روی پورت <code>8000</code><br>
پاسخ JSON برمی‌گرداند
</td>
</tr>
  </tbody>
</table>

---

## 4. نحوه دسترسی به سرویس‌ها

<table>
  <thead>
<tr>
<th>بخش</th>
<th>آدرس</th>
</tr>
  </thead>
  <tbody>
<tr>
<td>Frontend</td>
<td><code>http://localhost:3000</code></td>
</tr>
<tr>
<td>API</td>
<td><code>http://localhost:3000/api</code></td>
</tr>
  </tbody>
</table>

### پورت‌ها

<table>
  <thead>
<tr>
<th>سرویس</th>
<th>پورت داخلی</th>
<th>پورت هاست</th>
</tr>
  </thead>
  <tbody>
<tr>
<td>nginx</td>
<td><code>80</code></td>
<td><code>3000</code></td>
</tr>
<tr>
<td>python</td>
<td><code>8000</code></td>
<td>داخلی شبکه</td>
</tr>
  </tbody>
</table>

---

# 📄 فایل: `project_sample_07/architecture.txt`

## Project Architecture Explanation

---

## 1️⃣ چگونه Nginx به app Python متصل می‌شود؟

در فایل <code>nginx.conf</code>:

nginx
location /api {
proxy_pass http://python-app:8000;
}

نام <code>python-app</code> همان نام سرویس در <code>docker-compose</code> است.

Docker Compose به صورت خودکار DNS داخلی ایجاد می‌کند.

بنابراین nginx می‌تواند با نام سرویس به <code>python-app</code> متصل شود.

---

## 2️⃣ چه network هایی استفاده شده؟

در <code>docker-compose</code>:

yaml
networks:
  default:
name: sample-project-network

یک شبکه bridge سفارشی ساخته می‌شود با نام:

text
sample-project-network

هر دو سرویس داخل این شبکه هستند و می‌توانند با نام سرویس با هم ارتباط برقرار کنند.

---

## 3️⃣ اگر بخواهید یک database اضافه کنید چه تغییراتی لازم است؟

برای اضافه کردن database، مثلاً PostgreSQL:

<details open>
<summary><strong>در docker-compose.yml یک سرویس جدید اضافه می‌کنیم</strong></summary>

yaml
database:
  image: postgres:15
  environment:
POSTGRES_DB: sampledb
POSTGRES_USER: user
POSTGRES_PASSWORD: pass
  volumes:
- db-data:/var/lib/postgresql/data

</details>

<details open>
<summary><strong>یک volume برای persistence اضافه می‌کنیم</strong></summary>

yaml
volumes:
  db-data:

</details>

<details open>
<summary><strong>در app.py</strong></summary>

<ul>
  <li>نصب driver، مثلاً <code>psycopg2</code></li>
  <li>اتصال به database با hostname = <code>database</code></li>
</ul>

</details>

<details open>
<summary><strong>ممکن است نیاز به اضافه کردن depends_on داشته باشیم</strong></summary>

yaml
python-app:
  depends_on:
- database

</details>

به این صورت معماری به شکل زیر تغییر می‌کند:

text
Browser → Nginx → Python API → Database

---

# ✅ جمع‌بندی معماری پروژه

<div align="center">

<table>
  <tr>
<td align="center"><strong>Browser</strong></td>
  </tr>
  <tr>
<td align="center">↓</td>
  </tr>
  <tr>
<td align="center"><strong>Nginx</strong><br><code>Port 3000</code></td>
  </tr>
  <tr>
<td align="center">↓</td>
  </tr>
  <tr>
<td align="center"><strong>Python API</strong><br><code>Port 8000</code></td>
  </tr>
</table>

</div>

تمام سرویس‌ها داخل یک Docker Network مشترک هستند.

---
`

اگر می‌خواهی فایل قابل دانلود بسازی، همین محتوا را داخل فایل `README.md` قرار بده.  
اگر خواستی، می‌توانم یک نسخه حتی زیباتر هم با badge، بخش Technologies، و طراحی شبیه READMEهای GitHub آماده کنم.