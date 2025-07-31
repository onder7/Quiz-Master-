#Değişiklik Günlüğü
# Değişiklik Günlüğü

Tüm önemli değişiklikler bu dosyada belgelenecektir.

## [1.0.0] - 2025-01-29

### 🎉 İlk Sürüm

#### Eklenen Özellikler
- ✅ Kullanıcı kayıt ve giriş sistemi
- ✅ Quiz oyun mekanikleri
- ✅ 4 zorluk seviyesi (Kolay, Orta, Zor, Karışık)
- ✅ Kategori bazlı soru filtreleme
- ✅ 30 saniyelik süre sayacı
- ✅ Ses efektleri sistemi
- ✅ Liderlik tablosu (günlük/haftalık/aylık/tüm zamanlar)
- ✅ Kullanıcı istatistikleri
- ✅ Mobil uyumlu responsive tasarım
- ✅ Animasyonlu arka plan
- ✅ Sosyal medya paylaşım butonları
- ✅ Klavye kısayolları desteği
- ✅ PWA hazır altyapı

#### Teknik Özellikler
- FlightPHP framework entegrasyonu
- MVC mimari yapısı
- PDO veritabanı katmanı
- Güvenli oturum yönetimi
- SQL injection koruması
- XSS koruması
- Modern CSS3 animasyonları
- Vanilla JavaScript (jQuery bağımlılığı yok)

#### Veritabanı
- 4 ana tablo (users, questions, scores, user_answers)
- İndekslenmiş sorgular
- UTF8MB4 karakter desteği
- 50+ örnek soru

### Düzeltilen Hatalar
- 🐛 PDO LIMIT parametresi hatası düzeltildi
- 🐛 SQL alias tutarsızlıkları giderildi
- 🐛 getUserRank metodu yeniden yazıldı
- 🐛 NULL değer kontrolleri eklendi

### Bilinen Sorunlar
- Ses dosyaları projeye dahil değil (telif hakkı nedeniyle)
- Dark mode henüz mevcut değil
- Çok oyunculu mod yok

## [Gelecek Sürüm] - Planlanan

### Eklenecek Özellikler
- 🌙 Dark mode desteği
- 🏅 Başarı/rozet sistemi
- 👥 Çok oyunculu yarışma modu
- 📚 Admin paneli ve soru yönetimi
- 🌍 Çoklu dil desteği (İngilizce, Türkçe)
- 📱 Progressive Web App (PWA) tam desteği
- 🔔 Push bildirimler
- 📊 Detaylı performans analitiği
- 🎯 Özel quiz oluşturma
- 💬 Oyun içi sohbet

### İyileştirmeler
- Performans optimizasyonları
- Daha fazla animasyon ve geçiş efekti
- Gelişmiş güvenlik özellikleri
- API dokümantasyonu
- Unit ve integration testleri

## Katkıda Bulunma

Projeye katkıda bulunmak için:
1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/AmazingFeature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add some AmazingFeature'`)
4. Branch'e push yapın (`git push origin feature/AmazingFeature`)
5. Pull Request açın

# Değişiklik Günlüğü

Tüm önemli değişiklikler bu dosyada belgelenecektir.

## [1.1.0] - 2025-01-29

### 🎉 Büyük Güncelleme: Çok Oyunculu Mod

#### Yeni Özellikler
- ✅ **Çok Oyunculu Yarışma Modu**
  - Oda oluşturma ve katılma sistemi
  - 6 karakterlik benzersiz oda kodları
  - Gerçek zamanlı skor takibi
  - Canlı rakip ilerleme göstergesi
  - Otomatik oyun başlatma
  - Bağlantı kopması kontrolü
  
- ✅ **Multiplayer Lobi**
  - Oda oluşturma formu
  - Hızlı oda katılımı
  - Son oyunlar listesi
  - Çok oyunculu istatistikler
  
- ✅ **Bekleme Odası**
  - Oyuncu hazırlık sistemi
  - WhatsApp ile davet gönderme
  - Oda kodu kopyalama
  - Oyuncu durumu göstergesi
  
- ✅ **Sonuç Ekranı**
  - Kazanan/kaybeden/berabere durumları
  - Detaylı skor karşılaştırması
  - Konfeti animasyonu (kazanma durumunda)
  - Sosyal medya paylaşımı

#### Veritabanı Güncellemeleri
- 5 yeni tablo eklendi (game_rooms, game_players, game_questions, game_answers, game_results)
- Otomatik oda temizleme event'i
- Performans için index'ler

#### UI/UX İyileştirmeleri
- Ana sayfaya çok oyunculu mod butonu
- Navigasyon menüsüne çok oyunculu link
- Mobil uyumlu çok oyunculu arayüzler
- Yeni animasyonlar ve geçiş efektleri

## [1.0.2] - 2025-01-29

### 🆕 Yeni Özellikler
- Cevaptan sonra 2 saniye içinde otomatik sonraki soruya geçiş
- Geri sayım animasyonu ve görsel efektler
- Mobil menü için kapatma butonu

### 🐛 Düzeltmeler
- Mobil menü görünürlük sorunu düzeltildi
- Mobil menü animasyonları iyileştirildi

### 📝 Güncellemeler
- Otomatik geçiş süresi yapılandırılabilir hale getirildi (AUTO_ADVANCE_DELAY)
- Mobil menü UX iyileştirmeleri
- Countdown progress bar animasyonu eklendi

## [1.0.1] - 2025-01-29

### 🐛 Düzeltmeler
- PHP 8.1+ type conversion hataları düzeltildi
- `gmdate()` fonksiyonu için explicit type casting eklendi
- Helper fonksiyonlar eklendi (`formatTime`, `formatPercentage`, vb.)
- Error reporting ayarları PHP 8.1+ için optimize edildi

### 🆕 Eklemeler
- `helpers/functions.php` - Yardımcı fonksiyonlar
- `config/app.php` - Uygulama yapılandırması
- `logs/` klasörü ve `.gitkeep` dosyası
- PHP sürüm uyumluluğu genişletildi (7.4 - 8.3)

### 📝 Güncellemeler
- Tüm view dosyalarında type-safe fonksiyonlar kullanıldı
- Dokümantasyon PHP 8.1+ uyumluluğu için güncellendi
- Error handling iyileştirildi

## [1.0.0] - 2025-01-29

### 🎉 İlk Sürüm

#### Eklenen Özellikler
- ✅ Kullanıcı kayıt ve giriş sistemi
- ✅ Quiz oyun mekanikleri
- ✅ 4 zorluk seviyesi (Kolay, Orta, Zor, Karışık)
- ✅ Kategori bazlı soru filtreleme
- ✅ 30 saniyelik süre sayacı
- ✅ Ses efektleri sistemi
- ✅ Liderlik tablosu (günlük/haftalık/aylık/tüm zamanlar)
- ✅ Kullanıcı istatistikleri
- ✅ Mobil uyumlu responsive tasarım
- ✅ Animasyonlu arka plan
- ✅ Sosyal medya paylaşım butonları
- ✅ Klavye kısayolları desteği
- ✅ PWA hazır altyapı

#### Teknik Özellikler
- FlightPHP framework entegrasyonu
- MVC mimari yapısı
- PDO veritabanı katmanı
- Güvenli oturum yönetimi
- SQL injection koruması
- XSS koruması
- Modern CSS3 animasyonları
- Vanilla JavaScript (jQuery bağımlılığı yok)

#### Veritabanı
- 4 ana tablo (users, questions, scores, user_answers)
- İndekslenmiş sorgular
- UTF8MB4 karakter desteği
- 50+ örnek soru

### Düzeltilen Hatalar
- 🐛 PDO LIMIT parametresi hatası düzeltildi
- 🐛 SQL alias tutarsızlıkları giderildi
- 🐛 getUserRank metodu yeniden yazıldı
- 🐛 NULL değer kontrolleri eklendi
- 🐛 PHP 8.1+ type conversion hataları düzeltildi

### Bilinen Sorunlar
- Ses dosyaları projeye dahil değil (telif hakkı nedeniyle)
- Dark mode henüz mevcut değil
- Çok oyunculu mod yok

## [Gelecek Sürüm] - Planlanan

### Eklenecek Özellikler
- 🌙 Dark mode desteği
- 🏅 Başarı/rozet sistemi
- 👥 Çok oyunculu yarışma modu
- 📚 Admin paneli ve soru yönetimi
- 🌍 Çoklu dil desteği (İngilizce, Türkçe)
- 📱 Progressive Web App (PWA) tam desteği
- 🔔 Push bildirimler
- 📊 Detaylı performans analitiği
- 🎯 Özel quiz oluşturma
- 💬 Oyun içi sohbet

### İyileştirmeler
- Performans optimizasyonları
- Daha fazla animasyon ve geçiş efekti
- Gelişmiş güvenlik özellikleri
- API dokümantasyonu
- Unit ve integration testleri

## Katkıda Bulunma

Projeye katkıda bulunmak için:
1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/AmazingFeature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add some AmazingFeature'`)
4. Branch'e push yapın (`git push origin feature/AmazingFeature`)
5. Pull Request açın

## Lisans

Bu proje MIT lisansı altında lisanslanmıştır.
