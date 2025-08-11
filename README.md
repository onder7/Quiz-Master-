# Quiz Master - Bilgi Yarışması Uygulaması
#english

DEMO: https://quiz-test.online/
Quiz Master, PHP Flight framework kullanılarak geliştirilmiş modern bir quiz uygulamasıdır. Kullanıcılar quiz çözebilir, çoklu oyuncu modunda yarışabilir ve admin paneli üzerinden sistemi yönetebilir.

Android için webview uygulaması ile birlikte kaynak kodlara onder7@gmail.com aeposta gödnererek iletişime geçebilirsiniz.

<img width="1906" height="924" alt="image" src="https://github.com/user-attachments/assets/091fdeab-a8ba-4dff-b5b6-61702132f1c9" />

<img width="1898" height="925" alt="image" src="https://github.com/user-attachments/assets/e9fa9354-3197-4bd6-a794-5d21f258b841" />

<img width="1892" height="904" alt="image" src="https://github.com/user-attachments/assets/b357d2ed-9f38-4ce7-b148-b3c902c6805e" />

<img width="1891" height="930" alt="image" src="https://github.com/user-attachments/assets/151dd5bd-47ba-4a29-9e02-f2e32f4538b8" />

<img width="1912" height="924" alt="image" src="https://github.com/user-attachments/assets/8f7ad712-945d-4612-8878-33e63e1bc04e" />

<img width="1894" height="921" alt="image" src="https://github.com/user-attachments/assets/52fcb597-2c56-425b-a2ef-1402b1c5c79c" />

<img width="1899" height="923" alt="image" src="https://github.com/user-attachments/assets/d5ad90a4-3479-4d8e-81b3-f6d6731e867c" />

<img width="1899" height="920" alt="image" src="https://github.com/user-attachments/assets/2dc70935-6373-46ec-b009-7e58dca99651" />




# Quiz Master - İnteraktif Quiz Uygulaması

## Türkçe

### 📋 Proje Hakkında
Quiz Master, PHP Flight framework kullanılarak geliştirilmiş modern bir quiz uygulamasıdır. Kullanıcılar quiz çözebilir, çoklu oyuncu modunda yarışabilir ve admin paneli üzerinden sistemi yönetebilir.

### ✨ Özellikler

#### 🎮 Oyuncu Özellikleri
- **Kullanıcı Kayıt/Giriş Sistemi**: E-posta/şifre ve sosyal medya girişi
- **Quiz Çözme**: Farklı kategori ve zorluk seviyelerinde sorular
- **Çoklu Oyuncu Modu**: Gerçek zamanlı rakiple yarışma
- **Skor Tablosu**: En yüksek skorları görüntüleme
- **Kişisel İstatistikler**: Performans takibi

#### 🛠️ Admin Paneli
- **Kullanıcı Yönetimi**: Kullanıcıları görüntüleme, düzenleme ve yönetme
- **Soru Yönetimi**: Modern kart tabanlı soru listesi
- **Soru Ekleme/Düzenleme**: Canlı önizleme ile soru oluşturma
- **Dashboard**: Detaylı sistem istatistikleri
- **İstatistikler**: Kullanıcı aktiviteleri ve oyun verileri

#### 🎨 Tasarım Özellikleri
- **Modern UI/UX**: Glassmorphism tasarım
- **Koyu/Açık Tema**: Otomatik tema geçişi
- **Responsive Tasarım**: Mobil uyumlu arayüz
- **Smooth Animasyonlar**: Kullanıcı dostu geçişler

### 🚀 Teknolojiler
- **Backend**: PHP 8+, Flight Framework
- **Database**: MySQL/MariaDB
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Styling**: CSS Custom Properties, Flexbox, Grid
- **Authentication**: OAuth (Google, Facebook, Twitter)
- **Real-time**: AJAX polling

### 📦 Kurulum

#### Gereksinimler
- PHP 8.0 veya üzeri
- MySQL 5.7 veya üzeri
- Web sunucu (Apache/Nginx)
- Composer

#### Adımlar
1. **Projeyi klonlayın**
   ```bash
   git clone [repository-url]
   cd bilg
   ```

2. **Bağımlılıkları yükleyin**
   ```bash
   composer install
   ```

3. **Veritabanını oluşturun**
   ```sql
   CREATE DATABASE quiz_db;
   ```

4. **Yapılandırma dosyalarını düzenleyin**
   - `config/database.php` - Veritabanı bağlantısı
   - `config/google.php` - Google OAuth
   - `config/facebook.php` - Facebook OAuth
   - `config/twitter.php` - Twitter OAuth

5. **Veritabanı tablolarını oluşturun**
   - SQL dosyalarını çalıştırın veya uygulama ilk çalıştırıldığında otomatik oluşturulacaktır

6. **Web sunucusunu başlatın**
   ```bash
   # WAMP/XAMPP kullanıyorsanız
   # Projeyi htdocs klasörüne yerleştirin
   
   # Built-in server
   php -S localhost:8000
   ```

### 🔧 Yapılandırma

#### Veritabanı Ayarları
```php
// config/database.php
$host = 'localhost';
$dbname = 'quiz_db';
$username = 'your_username';
$password = 'your_password';
```

#### OAuth Ayarları
```php
// config/google.php
define('GOOGLE_CLIENT_ID', 'your_google_client_id');
define('GOOGLE_CLIENT_SECRET', 'your_google_client_secret');
```

### 🎯 Kullanım

#### Admin Hesabı
Varsayılan admin hesabı:
- **Kullanıcı adı**: admin
- **Şifre**: admin123

İlk giriş sırasında otomatik olarak oluşturulur.

#### Admin Paneli
- `/admin/login` - Admin girişi
- `/admin/dashboard` - Ana kontrol paneli
- `/admin/users` - Kullanıcı yönetimi
- `/admin/questions` - Soru yönetimi

### 📁 Proje Yapısı
```
bilg/
├── config/                 # Yapılandırma dosyaları
├── controllers/            # MVC Controller'ları
├── models/                # MVC Model'leri
├── views/                 # View dosyaları
│   ├── admin/            # Admin panel görünümleri
│   ├── auth/             # Kimlik doğrulama sayfaları
│   ├── quiz/             # Quiz sayfaları
│   └── layout/           # Ortak layout dosyaları
├── public/               # Statik dosyalar
├── helpers/              # Yardımcı fonksiyonlar
└── vendor/               # Composer bağımlılıkları
```

### 🤝 Katkıda Bulunma
1. Fork'layın
2. Feature branch oluşturun (`git checkout -b feature/AmazingFeature`)
3. Commit'leyin (`git commit -m 'Add some AmazingFeature'`)
4. Push'layın (`git push origin feature/AmazingFeature`)
5. Pull Request oluşturun

---

## English

### 📋 About the Project
Quiz Master is a modern quiz application developed using PHP Flight framework. Users can solve quizzes, compete in multiplayer mode, and manage the system through an admin panel.

### ✨ Features

#### 🎮 Player Features
- **User Registration/Login System**: Email/password and social media login
- **Quiz Solving**: Questions in different categories and difficulty levels
- **Multiplayer Mode**: Real-time competition with opponents
- **Leaderboard**: View highest scores
- **Personal Statistics**: Performance tracking

#### 🛠️ Admin Panel
- **User Management**: View, edit and manage users
- **Question Management**: Modern card-based question list
- **Question Add/Edit**: Question creation with live preview
- **Dashboard**: Detailed system statistics
- **Statistics**: User activities and game data

#### 🎨 Design Features
- **Modern UI/UX**: Glassmorphism design
- **Dark/Light Theme**: Automatic theme switching
- **Responsive Design**: Mobile-friendly interface
- **Smooth Animations**: User-friendly transitions

### 🚀 Technologies
- **Backend**: PHP 8+, Flight Framework
- **Database**: MySQL/MariaDB
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Styling**: CSS Custom Properties, Flexbox, Grid
- **Authentication**: OAuth (Google, Facebook, Twitter)
- **Real-time**: AJAX polling

### 📦 Installation

#### Requirements
- PHP 8.0 or higher
- MySQL 5.7 or higher
- Web server (Apache/Nginx)
- Composer

#### Steps
1. **Clone the project**
   ```bash
   git clone [repository-url]
   cd bilg
   ```

2. **Install dependencies**
   ```bash
   composer install
   ```

3. **Create database**
   ```sql
   CREATE DATABASE quiz_db;
   ```

4. **Edit configuration files**
   - `config/database.php` - Database connection
   - `config/google.php` - Google OAuth
   - `config/facebook.php` - Facebook OAuth
   - `config/twitter.php` - Twitter OAuth

5. **Create database tables**
   - Run SQL files or they will be created automatically when the application runs for the first time

6. **Start web server**
   ```bash
   # If using WAMP/XAMPP
   # Place the project in htdocs folder
   
   # Built-in server
   php -S localhost:8000
   ```

### 🔧 Configuration

#### Database Settings
```php
// config/database.php
$host = 'localhost';
$dbname = 'quiz_db';
$username = 'your_username';
$password = 'your_password';
```

#### OAuth Settings
```php
// config/google.php
define('GOOGLE_CLIENT_ID', 'your_google_client_id');
define('GOOGLE_CLIENT_SECRET', 'your_google_client_secret');
```

### 🎯 Usage

#### Admin Account
Default admin account:
- **Username**: admin
- **Password**: admin123

Created automatically on first login.

#### Admin Panel
- `/admin/login` - Admin login
- `/admin/dashboard` - Main control panel
- `/admin/users` - User management
- `/admin/questions` - Question management

### 📁 Project Structure
```
bilg/
├── config/                 # Configuration files
├── controllers/            # MVC Controllers
├── models/                # MVC Models
├── views/                 # View files
│   ├── admin/            # Admin panel views
│   ├── auth/             # Authentication pages
│   ├── quiz/             # Quiz pages
│   └── layout/           # Common layout files
├── public/               # Static files
├── helpers/              # Helper functions
└── vendor/               # Composer dependencies
```

### 🤝 Contributing
1. Fork it
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### 📄 License
This project is licensed under the MIT License.

### 👥 Authors
- **Development Team** - Initial work and development

### 🙏 Acknowledgments
- Flight PHP Framework
- Font Awesome for icons
- All contributors and testers
