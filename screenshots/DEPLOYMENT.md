 - Yayınlama Kılavuzu
 - # Quiz Master - Yayınlama Kılavuzu

## 🚀 Deployment Seçenekleri

### 1. Shared Hosting (Paylaşımlı Hosting)

#### Gereksinimler
- PHP 7.4+
- MySQL 5.7+
- Apache/Nginx
- mod_rewrite etkin

#### Adımlar
1. **Dosyaları yükleyin:**
   ```bash
   # FTP veya cPanel File Manager kullanarak tüm dosyaları public_html'e yükleyin
   ```

2. **Veritabanı oluşturun:**
   - cPanel'den MySQL veritabanı oluşturun
   - Kullanıcı oluşturun ve yetkilendirin
   - phpMyAdmin'den SQL dosyalarını import edin

3. **Konfigürasyon:**
   ```php
   // config/database.php
   $host = 'localhost';
   $dbname = 'kullanici_quizapp';
   $username = 'kullanici_dbuser';
   $password = 'güvenli_şifre';
   ```

4. **İzinler:**
   ```bash
   chmod 755 -R .
   chmod 777 -R public/audio
   ```

### 2. VPS/Cloud Server

#### DigitalOcean/Linode/AWS EC2

1. **Server hazırlığı:**
   ```bash
   # Ubuntu 20.04 için
   sudo apt update
   sudo apt install apache2 php php-mysql mysql-server composer
   sudo a2enmod rewrite
   ```

2. **Projeyi klonlayın:**
   ```bash
   cd /var/www/html
   git clone https://github.com/yourusername/quiz-master.git
   cd quiz-master
   composer install
   ```

3. **Apache konfigürasyonu:**
   ```apache
   <VirtualHost *:80>
       ServerName quiz.domain.com
       DocumentRoot /var/www/html/quiz-master
       
       <Directory /var/www/html/quiz-master>
           AllowOverride All
           Require all granted
       </Directory>
   </VirtualHost>
   ```

4. **SSL sertifikası (Let's Encrypt):**
   ```bash
   sudo apt install certbot python3-certbot-apache
   sudo certbot --apache -d quiz.domain.com
   ```

### 3. Docker Deployment

1. **Production docker-compose.yml:**
   ```yaml
   version: '3.8'
   services:
     web:
       build: .
       ports:
         - "80:80"
         - "443:443"
       volumes:
         - ./:/var/www/html
       environment:
         - APP_ENV=production
         - APP_DEBUG=false
   ```

2. **Başlatma:**
   ```bash
   docker-compose up -d
   ```

### 4. Heroku Deployment

1. **Heroku CLI kurulumu ve giriş:**
   ```bash
   heroku login
   heroku create quiz-master-app
   ```

2. **ClearDB MySQL addon:**
   ```bash
   heroku addons:create cleardb:ignite
   ```

3. **Procfile oluşturun:**
   ```
   web: vendor/bin/heroku-php-apache2 /
   ```

4. **Deploy:**
   ```bash
   git push heroku main
   ```

## ⚙️ Production Ayarları

### 1. Güvenlik

**.env dosyası:**
```env
APP_ENV=production
APP_DEBUG=false
APP_KEY=generate-strong-key-here
```

**config/database.php:**
```php
// Ortam değişkenlerinden al
$host = $_ENV['DB_HOST'] ?? 'localhost';
$dbname = $_ENV['DB_DATABASE'] ?? 'quiz_app';
$username = $_ENV['DB_USERNAME'] ?? 'root';
$password = $_ENV['DB_PASSWORD'] ?? '';
```

### 2. Performans Optimizasyonları

**Apache .htaccess eklemeleri:**
```apache
# Gzip sıkıştırma
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/html text/css text/javascript
</IfModule>

# Browser caching
<IfModule mod_expires.c>
    ExpiresActive On
    ExpiresByType image/jpg "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType text/css "access plus 1 month"
    ExpiresByType application/javascript "access plus 1 month"
</IfModule>
```

**PHP optimizasyonları:**
```ini
; php.ini
opcache.enable=1
opcache.memory_consumption=128
opcache.max_accelerated_files=10000
```

### 3. Veritabanı Optimizasyonları

```sql
-- Performans için ekstra indeksler
ALTER TABLE scores ADD INDEX idx_date_score (completed_at, score);
ALTER TABLE questions ADD INDEX idx_diff_cat (difficulty, category);

-- Veritabanı bakımı
OPTIMIZE TABLE scores;
OPTIMIZE TABLE user_answers;
```

## 📊 Monitoring ve Logging

### 1. Error Logging

**PHP hata logları:**
```php
// index.php başına ekle
ini_set('log_errors', 1);
ini_set('error_log', __DIR__ . '/logs/php_errors.log');
```

### 2. Application Monitoring

**New Relic kurulumu:**
```bash
curl -L https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -
sudo apt update
sudo apt install newrelic-php5
```

**Google Analytics:**
```html
<!-- views/layout/footer.php -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
```

## 🔐 Güvenlik Kontrol Listesi

- [ ] Debug modu kapalı
- [ ] Güçlü veritabanı şifresi
- [ ] SSL sertifikası aktif
- [ ] .env dosyası git'te yok
- [ ] Dosya izinleri düzgün
- [ ] SQL injection koruması aktif
- [ ] XSS koruması aktif
- [ ] Rate limiting uygulandı
- [ ] Backup stratejisi belirlendi

## 🔄 CI/CD Pipeline

### GitHub Actions örneği:

```yaml
name: Deploy

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Deploy to server
      uses: appleboy/ssh-action@master
      with:
        host: ${{ secrets.HOST }}
        username: ${{ secrets.USERNAME }}
        key: ${{ secrets.SSH_KEY }}
        script: |
          cd /var/www/html/quiz-master
          git pull origin main
          composer install --no-dev
          php artisan migrate
```

## 📦 Backup Stratejisi

### Otomatik Backup Script:

```bash
#!/bin/bash
# backup.sh

# Veritabanı backup
mysqldump -u root -p quiz_app > backup/db_$(date +%Y%m%d).sql

# Dosya backup
tar -czf backup/files_$(date +%Y%m%d).tar.gz . --exclude=backup

# Eski backupları sil (30 günden eski)
find backup -name "*.sql" -mtime +30 -delete
find backup -name "*.tar.gz" -mtime +30 -delete
```

### Cron job:
```bash
0 2 * * * /var/www/html/quiz-master/backup.sh
```

## 🚨 Sorun Giderme

### Yaygın Production Hataları:

1. **500 Internal Server Error:**
   - .htaccess kontrol et
   - PHP error log kontrol et
   - Dosya izinlerini kontrol et

2. **Veritabanı bağlantı hatası:**
   - Credentials doğru mu?
   - MySQL servisi çalışıyor mu?
   - Firewall kuralları?

3. **Yavaş performans:**
   - MySQL slow query log aktif et
   - PHP opcache kontrol et
   - CDN kullanmayı düşün

## 📈 Ölçekleme

### Yük dengeleme:
- HAProxy veya Nginx load balancer
- MySQL master-slave replikasyon
- Redis/Memcached session storage
- CDN entegrasyonu (Cloudflare)

### Mikroservis mimarisi:
- API gateway
- Separate quiz service
- Separate user service
- Message queue (RabbitMQ)

## 📝 Deployment Checklist

Yayına almadan önce:

- [ ] Tüm testler geçiyor mu?
- [ ] Veritabanı migration'ları hazır mı?
- [ ] SSL sertifikası kurulu mu?
- [ ] Backup sistemi çalışıyor mu?
- [ ] Monitoring aktif mi?
- [ ] Error handling düzgün mü?
- [ ] Performance testleri yapıldı mı?
- [ ] Security scan yapıldı mı?
- [ ] Dokümantasyon güncel mi?
- [ ] Rollback planı var mı?
