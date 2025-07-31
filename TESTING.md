# Quiz Master - Test Rehberi

## 🧪 Manuel Test Senaryoları

### 1. Kullanıcı Kayıt ve Giriş
- [ ] Yeni kullanıcı kaydı oluştur
- [ ] Aynı kullanıcı adı ile kayıt dene (hata vermeli)
- [ ] Aynı e-posta ile kayıt dene (hata vermeli)
- [ ] Kısa şifre ile kayıt dene (< 6 karakter, hata vermeli)
- [ ] Başarılı giriş yap
- [ ] Yanlış şifre ile giriş dene
- [ ] Çıkış yap ve protected route'lara erişim dene

### 2. Tek Oyunculu Quiz
- [ ] Hızlı başlat (kolay/orta/zor)
- [ ] Özel quiz oluştur (kategori + zorluk + soru sayısı)
- [ ] Süre dolana kadar bekle (otomatik cevap seçimi)
- [ ] Manuel cevap seç
- [ ] 2 saniye sonra otomatik geçiş kontrolü
- [ ] Son sorudan sonra sonuç ekranı
- [ ] Sosyal medya paylaşım butonları

### 3. Çok Oyunculu Mod
- [ ] Oda oluştur
- [ ] Oda kodunu kopyala
- [ ] Farklı tarayıcı/cihazdan odaya katıl
- [ ] Her iki oyuncu "Hazırım" de
- [ ] Oyun başlaması kontrolü
- [ ] Rakip skoru gerçek zamanlı güncellenmeli
- [ ] Rakip ilerlemesi görünmeli
- [ ] Bir oyuncu bitirdiğinde diğeri devam edebilmeli
- [ ] Sonuç ekranında kazanan doğru gösterilmeli
- [ ] Beraberlik durumu testi

### 4. Mobil Uyumluluk
- [ ] 320px genişlikte test (iPhone SE)
- [ ] 768px genişlikte test (iPad)
- [ ] Hamburger menü açılıp kapanmalı
- [ ] Touch eventler çalışmalı
- [ ] Klavye açıldığında layout bozulmamalı

### 5. Ses Sistemi
- [ ] Ses aç/kapa toggle
- [ ] Arka plan müziği loop
- [ ] Doğru/yanlış cevap sesleri
- [ ] Buton tıklama sesleri
- [ ] Süre uyarı sesi (10 saniye)
- [ ] LocalStorage'da ses tercihi saklanmalı

### 6. Performans Testleri
- [ ] 20 soruluk quiz lag olmadan çalışmalı
- [ ] Multiplayer 2 saniyede bir güncelleme almalı
- [ ] Animasyonlar 60fps'de çalışmalı
- [ ] İlk yükleme 3 saniyenin altında

## 🔧 Test Verileri

### Test Kullanıcıları
```sql
-- Test kullanıcıları ekle
INSERT INTO users (username, email, password) VALUES
('testuser1', 'test1@test.com', '$2y$10$YourHashedPassword'),
('testuser2', 'test2@test.com', '$2y$10$YourHashedPassword'),
('testuser3', 'test3@test.com', '$2y$10$YourHashedPassword');
```

### Test Soruları
```sql
-- Her kategori için en az 5 soru olmalı
SELECT category, COUNT(*) FROM questions GROUP BY category;

-- Her zorluk seviyesi için kontrol
SELECT difficulty, COUNT(*) FROM questions GROUP BY difficulty;
```

### Multiplayer Test
```sql
-- Aktif odaları kontrol
SELECT * FROM game_rooms WHERE status IN ('waiting', 'ready', 'playing');

-- Zombie odaları kontrol (30 dk'dan eski)
SELECT * FROM game_rooms 
WHERE status = 'waiting' 
AND created_at < DATE_SUB(NOW(), INTERVAL 30 MINUTE);
```

## 🛠️ Debug Araçları

### JavaScript Console Komutları
```javascript
// Ses sistemi kontrol
soundEnabled = false; // Sesi kapat
playCorrectSound(); // Test sesi

// Timer kontrol
timeRem
