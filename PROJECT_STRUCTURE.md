# Quiz Master - Proje Yapısı

## 📁 Klasör Yapısı Detayları

```
quiz-master/
│
├── 📁 config/                    # Yapılandırma dosyaları
│   ├── app.php                   # Uygulama ayarları ve sabitler
│   └── database.php              # Veritabanı bağlantı ayarları
│
├── 📁 controllers/               # MVC Controller katmanı
│   ├── AuthController.php        # Kullanıcı giriş/kayıt işlemleri
│   ├── QuizController.php        # Tek oyunculu quiz mantığı
│   ├── ScoreController.php       # Skor ve liderlik tablosu
│   └── MultiplayerController.php # Çok oyunculu mod işlemleri
│
├── 📁 models/                    # Veritabanı modelleri
│   ├── User.php                  # Kullanıcı CRUD işlemleri
│   ├── Question.php              # Soru yönetimi
│   ├── Score.php                 # Tek oyunculu skorlar
│   ├── UserAnswer.php            # Kullanıcı cevap geçmişi
│   ├── GameRoom.php              # Multiplayer oda yönetimi
│   ├── GamePlayer.php            # Oyuncu durum takibi
│   ├── GameAnswer.php            # Multiplayer cevaplar
│   └── GameResult.php            # Oyun sonuçları
│
├── 📁 views/                     # Görünüm katmanı (PHP templates)
│   ├── 📁 layout/
│   │   ├── header.php            # Ortak başlık (nav, meta)
│   │   └── footer.php            # Ortak alt kısım (scripts)
│   │
│   ├── 📁 auth/
│   │   ├── login.php             # Giriş formu
│   │   └── register.php          # Kayıt formu
│   │
│   ├── 📁 quiz/
│   │   ├── home.php              # Ana sayfa dashboard
│   │   ├── setup.php             # Quiz ayarları formu
│   │   ├── play.php              # Oyun ekranı
│   │   └── result.php            # Sonuç ekranı
│   │
│   ├── 📁 score/
│   │   └── leaderboard.php       # Liderlik tablosu
│   │
│   └── 📁 multiplayer/
│       ├── lobby.php             # MP ana ekranı
│       ├── waiting.php           # Bekleme odası
│       ├── play.php              # MP oyun ekranı
│       └── result.php            # MP sonuç ekranı
│
├── 📁 public/                    # Web erişimli dosyalar
│   ├── 📁 css/
│   │   └── style.css             # Tüm stiller (7000+ satır)
│   │
│   ├── 📁 js/
│   │   └── app.js                # JavaScript (2000+ satır)
│   │
│   ├── 📁 audio/                 # Ses dosyaları
│   │   ├── quiz-background.mp3   # Arka plan müziği
│   │   ├── correct-answer.mp3    # Doğru cevap sesi
│   │   ├── wrong-answer.mp3      # Yanlış cevap sesi
│   │   ├── timer-warning.mp3     # Süre uyarısı
│   │   ├── quiz-complete.mp3     # Quiz bitiş sesi
│   │   └── button-click.mp3      # Tıklama sesi
│   │
│   └── robots.txt                # SEO robotları ayarı
│
├── 📁 helpers/                   # Yardımcı fonksiyonlar
│   └── functions.php             # Genel yardımcı fonksiyonlar
│
├── 📁 logs/                      # Log dosyaları
│   └── .gitkeep                  # Boş klasör için
│
├── 📁 screenshots/               # Ekran görüntüleri
│   └── README.md                 # Görsel dokümantasyon
│
├── 📁 docker/                    # Docker yapılandırması
│   └── apache/
│       └── 000-default.conf      # Apache config
│
├── 📄 index.php                  # Ana giriş noktası & routing
├── 📄 .htaccess                  # URL rewrite kuralları
├── 📄 composer.json              # PHP bağımlılıkları
├── 📄 composer.lock              # Kilitli versiyon bilgileri
├── 📄 .env.example               # Örnek ortam değişkenleri
├── 📄 .gitignore                 # Git ignore listesi
├── 📄 docker-compose.yml         # Docker orkestrasyon
├── 📄 install.sh                 # Linux/Mac kurulum scripti
├── 📄 install.bat                # Windows kurulum scripti
│
├── 📄 README.md                  # Ana dokümantasyon
├── 📄 FEATURES.md                # Detaylı özellik listesi
├── 📄 CHANGELOG.md               # Versiyon geçmişi
├── 📄 CONTRIBUTING.md            # Katkıda bulunma rehberi
├── 📄 TROUBLESHOOTING.md         # Sorun giderme kılavuzu
├── 📄 DEPLOYMENT.md              # Yayınlama rehberi
├── 📄 API.md                     # API dokümantasyonu
├── 📄 LICENSE                    # MIT lisansı
├── 📄 VERSION                    # Mevcut versiyon (1.1.0)
│
└── 📄 SQL Dosyaları/
    ├── quiz_app.sql              # Ana veritabanı şeması
    ├── multiplayer_tables.sql    # Multiplayer tabloları
    ├── sample_questions.sql      # 50+ örnek soru
    └── database_updates.sql      # Güncelleme scriptleri
```

## 🏗️ Mimari Detayları

### MVC Pattern
- **Model**: Veritabanı işlemleri ve iş mantığı
- **View**: PHP template'leri ile HTML render
- **Controller**: HTTP isteklerini işleme ve yönlendirme

### Routing (index.php)
```php
Flight::route('GET /', callback);           // Ana sayfa
Flight::route('POST /login', callback);      // Giriş işlemi
Flight::route('GET /quiz/play', callback);   // Quiz oyun
Flight::route('GET /multiplayer', callback); // MP lobi
```

### Veritabanı Yapısı
- **users**: Kullanıcı bilgileri
- **questions**: Soru havuzu
- **scores**: Tek oyunculu skorlar
- **user_answers**: Cevap geçmişi
- **game_rooms**: MP odaları
- **game_players**: Oyuncu durumları
- **game_answers**: MP cevapları
- **game_results**: Oyun sonuçları

### JavaScript Modülleri (app.js)
- Mobile menu yönetimi
- Ses kontrolleri
- Quiz timer ve mantığı
- AJAX istekleri
- Multiplayer real-time güncellemeler
- Form validasyonu
- Animasyon kontrolleri

### CSS Organizasyonu (style.css)
- CSS Variables (renkler, spacing)
- Base styles (reset, typography)
- Component styles (buttons, forms)
- Page-specific styles
- Animations & transitions
- Responsive breakpoints
- Utility classes

## 🔄 Data Flow

1. **Kullanıcı İsteği** → index.php (routing)
2. **Route Match** → Controller method
3. **Controller** → Model (veri işleme)
4. **Model** → Database query
5. **Controller** → View render
6. **View** → HTML output
7. **JavaScript** → Dynamic updates

## 🔌 API Endpoints

### Public API
- `/api/categories` - Kategori listesi
- `/api/multiplayer/stats` - MP istatistikler
- `/api/multiplayer/recent-games` - Son oyunlar

### Protected API (Auth required)
- `/api/check-answer` - Cevap kontrolü
- `/api/multiplayer/room-status` - Oda durumu
- `/api/multiplayer/opponent-status` - Rakip durumu

## 🚀 Deployment Notları

- PHP 7.4+ gerekli (8.1+ önerilen)
- MySQL 5.7+ gerekli
- Apache mod_rewrite aktif olmalı
- Event scheduler aktif olmalı (MP cleanup)
- Session storage yazılabilir olmalı
- Audio dosyaları ayrıca yüklenmeli
