# NOXARA

Website PHP Native 8.2 untuk deploy di aaPanel + Nginx + MySQL.

## Struktur
Lihat daftar folder pada bagian `Struktur Folder` di bawah.

## Deploy Singkat
1. Upload semua file ke `/www/wwwroot/noxara.page`.
2. Import `database/schema.sql` lalu `database/seed.sql`.
3. Pastikan PHP 8.2 aktif pada domain.
4. Terapkan `nginx/noxara.conf` ke konfigurasi Nginx site.
5. Atur cron aaPanel sesuai daftar pada dokumen ini.

## Struktur Folder
```text
/www/wwwroot/noxara.page
├── index.php
├── assets/
│   ├── css/app.css
│   ├── js/app.js
│   ├── img/.gitkeep
│   └── icons/
├── uploads/
│   ├── welcome/
│   ├── banners/
│   ├── promos/
│   ├── chat/
│   ├── payment/
│   └── qris/
├── config/
│   ├── app.php
│   └── database.php
├── includes/
├── pages/
├── actions/
├── database/
│   ├── schema.sql
│   └── seed.sql
├── cron/
├── storage/
│   ├── logs/
│   ├── cache/
│   └── backups/
├── nginx/
│   └── noxara.conf
└── README.md
```

## Cron aaPanel
- `php /www/wwwroot/noxara.page/cron/mining-cron.php`
- `php /www/wwwroot/noxara.page/cron/product-expire-cron.php`
- `php /www/wwwroot/noxara.page/cron/cashify-payment-cron.php`
- `php /www/wwwroot/noxara.page/cron/vip-sync-cron.php`
- `php /www/wwwroot/noxara.page/cron/backup-cron.php`

## Catatan
- Ini WEBSITE PHP NATIVE (bukan Android/APK/Vite/React/Node).
- Root langsung dari `/www/wwwroot/noxara.page` tanpa `/public`.
