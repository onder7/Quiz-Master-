# Quiz Master - Bilgi Yarışması Uygulaması

FlightPHP framework'ü kullanılarak geliştirilmiş, mobil uyumlu bilgi yarışması uygulaması. Android için webview uygulaması ile birlikte kaynak kodlara onder7@gmail.com aeposta gödnererek iletişime geçebilirsiniz.

<img width="1526" height="815" alt="image" src="https://github.com/user-attachments/assets/4dd45476-cc47-4d2b-9ed8-2fecd3e931c0" />

<img width="1182" height="663" alt="image" src="https://github.com/user-attachments/assets/6f922438-5d15-4025-b79b-b9e470dd5c7a" />

<img width="1193" height="808" alt="image" src="https://github.com/user-attachments/assets/d0319cde-5357-4eb6-82e7-244203899ac6" />


## Özellikler

- 📱 Tamamen mobil uyumlu responsive tasarım
- 🎨 Animasyonlu arka plan ve modern UI
- 🔊 Ses efektleri (arka plan müziği, doğru/yanlış sesleri, süre uyarısı)
- 👥 **Çok Oyunculu Mod** (Yeni!)
  - İki oyuncu aynı anda yarışabilir
  - Oda sistemi ile kolay eşleşme
  - Gerçek zamanlı skor takibi
  - Canlı rakip ilerleme göstergesi
- 🏆 Liderlik tablosu (günlük, haftalık, aylık, tüm zamanlar)
- 📊 Kullanıcı istatistikleri
- ⏱️ Soru başına 30 saniye süre limiti
- 🎯 Zorluk seviyeleri (Kolay, Orta, Zor, Karışık)
- 📚 Kategori bazlı sorular
- 🔐 Kullanıcı kayıt ve giriş sistemi

## Gereksinimler

- PHP >= 7.4 (PHP 8.1+ tam uyumlu)
- MySQL >= 5.7
- Composer
- Apache veya Nginx (mod_rewrite etkin)

## Kurulum

### 1. Projeyi İndirin

```bash
git clone https://github.com/yourusername/quiz-master.git
cd quiz-master
```

### 2. Bağımlılıkları Yükleyin

```bash
composer install
```

### 3. Veritabanını Oluşturun

- phpMyAdmin veya MySQL komut satırını kullanarak `quiz_app` adında bir veritabanı oluşturun
- Verilen `quiz_app (2).sql` dosyasını import edin

### 4. Veritabanı Bağlantısını Yapılandırın

`config/database.php` dosyasını açın ve veritabanı bilgilerinizi güncelleyin:

```php
$host = '127.0.0.1';
$port = '3306';
$dbname = 'quiz_app';
$username = 'root';
$password = '';
```

### 5. Dosya İzinlerini Ayarlayın

```bash
chmod 755 -R .
chmod 777 -R public/
```

### 6. Uygulamayı Başlatın

#### Geliştirme Ortamı (PHP Built-in Server)

```bash
composer start
# veya
php -S localhost:8000
```

#### Production (Apache)

Apache DocumentRoot'u proje klasörüne yönlendirin ve mod_rewrite'ın etkin olduğundan emin olun.

## Proje Yapısı

```
quiz-master/
├── config/
│   ├── database.php        # Veritabanı yapılandırması
│   └── app.php            # Uygulama ayarları
├── controllers/
│   ├── AuthController.php  # Kimlik doğrulama işlemleri
│   ├── QuizController.php  # Quiz işlemleri
│   ├── ScoreController.php # Skor ve liderlik tablosu
│   └── MultiplayerController.php # Çok oyunculu mod
├── models/
│   ├── User.php           # Kullanıcı modeli
│   ├── Question.php       # Soru modeli
│   ├── Score.php          # Skor modeli
│   ├── UserAnswer.php     # Kullanıcı cevapları modeli
│   ├── GameRoom.php       # Oyun odası modeli
│   ├── GamePlayer.php     # Oyuncu durumu modeli
│   ├── GameAnswer.php     # Oyun cevapları modeli
│   └── GameResult.php     # Oyun sonuçları modeli
├── views/
│   ├── layout/
│   │   ├── header.php     # Sayfa başlığı
│   │   └── footer.php     # Sayfa sonu
│   ├── auth/
│   │   ├── login.php      # Giriş sayfası
│   │   └── register.php   # Kayıt sayfası
│   ├── quiz/
│   │   ├── home.php       # Ana sayfa
│   │   ├── setup.php      # Quiz ayarları
│   │   ├── play.php       # Quiz oyun ekranı
│   │   └── result.php     # Sonuç ekranı
│   ├── score/
│   │   └── leaderboard.php # Liderlik tablosu
│   └── multiplayer/
│       ├── lobby.php      # Çok oyunculu lobi
│       ├── waiting.php    # Bekleme odası
│       ├── play.php       # Çok oyunculu oyun
│       └── result.php     # Oyun sonucu
├── public/
│   ├── css/
│   │   └── style.css      # Ana stil dosyası
│   ├── js/
│   │   └── app.js         # JavaScript dosyası
│   └── audio/             # Ses dosyaları klasörü
├── helpers/
│   └── functions.php      # Yardımcı fonksiyonlar
├── logs/                  # Log dosyaları
├── .htaccess             # URL yönlendirme
├── index.php             # Ana giriş dosyası
├── composer.json         # Composer yapılandırması
└── README.md             # Bu dosya─ result.php     # Sonuç ekranı
│   └── score/
│       └── leaderboard.php # Liderlik tablosu
├── public/
│   ├── css/
│   │   └── style.css      # Ana stil dosyası
│   ├── js/
│   │   └── app.js         # JavaScript dosyası
│   └── audio/             # Ses dosyaları klasörü
├── .htaccess              # URL yönlendirme
├── index.php              # Ana giriş dosyası
├── composer.json          # Composer yapılandırması
└── README.md              # Bu dosya
```

## Ses Dosyaları

Aşağıdaki ses dosyalarını `public/audio/` klasörüne eklemeniz gerekmektedir:

- `quiz-background.mp3/.ogg` - Arka plan müziği
- `correct-answer.mp3/.wav` - Doğru cevap sesi
- `wrong-answer.mp3/.wav` - Yanlış cevap sesi
- `timer-warning.mp3/.wav` - Süre uyarı sesi
- `quiz-complete.mp3/.wav` - Quiz tamamlama sesi
- `button-click.mp3/.wav` - Buton tıklama sesi

## Kullanım

### 1. Kayıt Olma
- Ana sayfada "Kayıt Ol" butonuna tıklayın
- Kullanıcı adı, e-posta ve şifre bilgilerinizi girin
- Kayıt olduktan sonra otomatik olarak giriş yapılır

### 2. Tek Oyunculu Quiz
- Ana sayfadan zorluk seviyesi seçerek hızlı başlayabilirsiniz
- Veya "Özel Quiz Oluştur" ile detaylı ayarlar yapabilirsiniz:
  - Zorluk seviyesi (Kolay, Orta, Zor, Karışık)
  - Kategori seçimi
  - Soru sayısı (5, 10, 15, 20)

### 3. Çok Oyunculu Mod
- Ana sayfadan "Çok Oyunculu Mod" butonuna tıklayın
- **Oda Oluşturma:**
  - "Oda Oluştur" butonuna tıklayın
  - Zorluk ve soru sayısını seçin
  - Oluşan 6 haneli kodu arkadaşınızla paylaşın
- **Odaya Katılma:**
  - Arkadaşınızdan aldığınız kodu girin
  - "Katıl" butonuna basın
- Her iki oyuncu "Hazırım" dediğinde oyun başlar
- Aynı sorular, aynı süre, gerçek zamanlı yarışma!

### 4. Quiz Oynama
- Her soru için 30 saniye süreniz vardır
- 4 şıktan birini seçin
- Cevapladıktan sonra doğru/yanlış gösterilir
- 2 saniye sonra otomatik olarak sonraki soruya geçer

### 5. Sonuçlar
- Quiz bitiminde toplam skorunuz gösterilir
- Başarı yüzdesi hesaplanır
- Çok oyunculu modda kazanan belirlenir
- Sonuçlarınızı sosyal medyada paylaşabilirsiniz

### 6. Liderlik Tablosu
- Günlük, haftalık, aylık ve tüm zamanların en iyilerini görün
- Kendi sıralamanızı takip edin

## Veritabanına Soru Ekleme

SQL kullanarak yeni sorular ekleyebilirsiniz:

```sql
INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_answer, difficulty, category) 
VALUES 
('Türkiye\'nin başkenti neresidir?', 'İstanbul', 'Ankara', 'İzmir', 'Bursa', 'b', 'easy', 'coğrafya'),
('2 + 2 kaç eder?', '3', '4', '5', '6', 'b', 'easy', 'matematik');
```

## Özelleştirme

### Renk Teması
`public/css/style.css` dosyasındaki CSS değişkenlerini düzenleyerek renk temasını değiştirebilirsiniz:

```css
:root {
    --primary-color: #6366f1;
    --secondary-color: #f59e0b;
    --success-color: #10b981;
    --danger-color: #ef4444;
    /* ... */
}
```

### Süre Limiti
`public/js/app.js` dosyasında `timeRemaining` değişkenini değiştirerek soru başına süreyi ayarlayabilirsiniz.

## Güvenlik Notları

- Tüm kullanıcı girdileri `htmlspecialchars()` ile temizlenir
- Şifreler `password_hash()` ile güvenli şekilde saklanır
- SQL injection koruması için PDO prepared statements kullanılır
- XSS koruması için output encoding uygulanır

## Lisans

Bu proje MIT lisansı altında lisanslanmıştır.

## Destek

Sorularınız veya önerileriniz için issue açabilir veya pull request gönderebilirsiniz.
