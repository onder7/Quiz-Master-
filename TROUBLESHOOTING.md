# Quiz Master - Hata Ayıklama Kılavuzu

## 🔧 Yaygın Hatalar ve Çözümleri

### 1. SQLSTATE[42000]: Syntax error - LIMIT hatası

**Hata:**
```
SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax
```

**Sebep:** PDO'da LIMIT değerleri prepared statement parametresi olarak kullanılamaz.

**Çözüm:** Model dosyalarında LIMIT değerlerini integer'a çevirip doğrudan SQL'e yerleştirin:
```php
$limit = (int)$limit;
$sql = "SELECT * FROM table LIMIT $limit";
```

### 2. Column not found hatası

**Hata:**
```
SQLSTATE[42S22]: Column not found: 1054 Unknown column
```

**Sebep:** SQL sorgusunda tablo alias'ı kullanımı tutarsızlığı.

**Çözüm:** Tüm sorgularda tutarlı alias kullanın veya alias kullanmayın.

### 3. 500 Internal Server Error

**Sebepler ve Çözümler:**

1. **Veritabanı bağlantısı:**
   - `config/database.php` dosyasındaki bilgileri kontrol edin
   - MySQL servisinin çalıştığından emin olun

2. **Dosya izinleri:**
   ```bash
   chmod -R 755 .
   chmod -R 777 public/audio
   chmod -R 777 logs
   ```

3. **.htaccess eksik:**
   - `.htaccess` dosyasının ana dizinde olduğundan emin olun
   - Apache'de `mod_rewrite` modülünün aktif olduğunu kontrol edin

### 4. Ses dosyaları çalışmıyor

**Çözüm:**
1. `public/audio/` klasörünün var olduğundan emin olun
2. Ses dosyalarının doğru formatta olduğunu kontrol edin:
   - MP3 ve OGG/WAV formatları desteklenir
3. Tarayıcı konsolunda hata mesajlarını kontrol edin

### 5. Giriş yapılamıyor

**Olası sebepler:**
1. **Session başlatılmamış:** `index.php` dosyasında `session_start()` olduğundan emin olun
2. **Şifre hash uyumsuzluğu:** Kayıt olurken `password_hash()` kullanıldığından emin olun
3. **Veritabanı karakter seti:** UTF8MB4 kullanıldığından emin olun

### 6. Türkçe karakterler bozuk görünüyor

**Çözüm:**
1. Veritabanı karakter setini kontrol edin:
   ```sql
   ALTER DATABASE quiz_app CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

2. PDO bağlantısında charset belirtin:
   ```php
   $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";
   ```

### 7. Composer hatası

**Hata:** `composer: command not found`

**Çözüm:**
```bash
# Linux/Mac
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Windows
# https://getcomposer.org/Composer-Setup.exe adresinden indirin
```

### 8. Flight framework bulunamadı

**Hata:** `Class 'Flight' not found`

**Çözüm:**
```bash
composer install
# veya
composer require mikecao/flight
```

## 🐛 Debug Modu

Detaylı hata mesajları için `.env` dosyasında:
```
APP_DEBUG=true
```

**⚠️ ÖNEMLİ:** Production'da debug modunu kapatmayı unutmayın!

## 📋 Kontrol Listesi

Kurulum sonrası kontrol edilmesi gerekenler:

- [ ] PHP >= 7.4 kurulu mu?
- [ ] MySQL çalışıyor mu?
- [ ] Composer kurulu mu?
- [ ] `composer install` çalıştırıldı mı?
- [ ] Veritabanı oluşturuldu mu?
- [ ] SQL dosyaları import edildi mi?
- [ ] `.htaccess` dosyası var mı?
- [ ] `mod_rewrite` aktif mi?
- [ ] Dosya izinleri doğru mu?
- [ ] Ses dosyaları yüklendi mi?

## 🔍 Log Dosyaları

Hata ayıklama için kontrol edilecek log dosyaları:

1. **PHP Error Log:**
   - Linux: `/var/log/apache2/error.log`
   - Windows: `C:\wamp64\logs\php_error.log`

2. **Apache Error Log:**
   - Linux: `/var/log/apache2/error.log`
   - Windows: `C:\wamp64\logs\apache_error.log`

3. **Uygulama Logları:**
   - `logs/` klasörü (oluşturulması gerekiyor)

## 💡 İpuçları

1. **Tarayıcı Konsolu:** F12 ile açın ve JavaScript hatalarını kontrol edin
2. **Network Tab:** AJAX isteklerinin durumunu kontrol edin
3. **PHP Info:** `phpinfo()` ile PHP ayarlarını kontrol edin
4. **MySQL Konsol:** Sorguları doğrudan test edin

## 🆘 Destek

Sorun devam ediyorsa:

1. Hata mesajının tam metnini kaydedin
2. PHP ve MySQL versiyonlarınızı belirtin
3. İşletim sisteminizi belirtin
4. Hangi adımda hata aldığınızı açıklayın
5. GitHub'da issue açın veya geliştirici ile iletişime geçin

## 🔄 Sık Güncellenen Çözümler

### WAMP/XAMPP Özel Durumları

**WAMP:**
- PHP Extensions: `php_pdo_mysql` aktif olmalı
- Apache Modules: `rewrite_module` aktif olmalı

**XAMPP:**
- `httpd.conf` dosyasında `AllowOverride All` olmalı
- Virtual host ayarları kontrol edilmeli

### Docker Sorunları

**Port çakışması:**
```bash
# Kullanılan portları kontrol et
docker ps
# Farklı port kullan
docker-compose.yml dosyasında ports: - "8001:80"
```

**Volume izinleri:**
```bash
docker exec -it quiz_app_web chmod -R 777 /var/www/html/public/audio
```
