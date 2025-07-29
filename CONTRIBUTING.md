# Quiz Master'a Katkıda Bulunma Rehberi

Quiz Master'a katkıda bulunmayı düşündüğünüz için teşekkürler! 🎉

## 📋 İçindekiler

- [Davranış Kuralları](#davranış-kuralları)
- [Nasıl Katkıda Bulunabilirim?](#nasıl-katkıda-bulunabilirim)
- [Geliştirme Ortamı](#geliştirme-ortamı)
- [Kod Standartları](#kod-standartları)
- [Pull Request Süreci](#pull-request-süreci)
- [Commit Mesajları](#commit-mesajları)

## 📜 Davranış Kuralları

Bu proje açık ve misafirperver bir ortam sağlamayı amaçlar. Katılımcılar olarak:

- Saygılı ve yapıcı dil kullanın
- Farklı görüşlere açık olun
- Eleştirileri nazikçe kabul edin
- Topluluk için en iyisine odaklanın

## 🤝 Nasıl Katkıda Bulunabilirim?

### 🐛 Bug Raporlama

Bir bug bulduysanız:

1. GitHub Issues'da mevcut bir issue olup olmadığını kontrol edin
2. Yoksa yeni bir issue açın ve şunları belirtin:
   - Bug'ın açık açıklaması
   - Yeniden üretme adımları
   - Beklenen davranış
   - Gerçekleşen davranış
   - Ekran görüntüleri (varsa)
   - Sistem bilgileri (OS, PHP versiyon, vb.)

### 💡 Özellik Önerileri

Yeni özellik önerileri için:

1. Önce mevcut issue'ları kontrol edin
2. Özelliğin neden gerekli olduğunu açıklayın
3. Mümkünse implementasyon önerisi ekleyin
4. UI/UX mockup'ları faydalı olur

### 🔧 Kod Katkıları

1. Repository'yi fork edin
2. Feature branch oluşturun: `git checkout -b feature/amazing-feature`
3. Değişikliklerinizi yapın
4. Test edin
5. Commit edin: `git commit -m '✨ Add amazing feature'`
6. Push edin: `git push origin feature/amazing-feature`
7. Pull Request açın

## 💻 Geliştirme Ortamı

### Gereksinimler

- PHP >= 7.4
- MySQL >= 5.7
- Composer
- Git

### Kurulum

```bash
# Repository'yi klonlayın
git clone https://github.com/yourusername/quiz-master.git
cd quiz-master

# Bağımlılıkları yükleyin
composer install

# Veritabanını hazırlayın
mysql -u root -p < quiz_app.sql
mysql -u root -p quiz_app < sample_questions.sql

# Development server başlatın
php -S localhost:8000
```

## 📝 Kod Standartları

### PHP

- PSR-12 coding standard'ına uyun
- Anlamlı değişken ve fonksiyon isimleri kullanın
- Yorum satırları Türkçe veya İngilizce olabilir
- DocBlock kullanın:

```php
/**
 * Kullanıcının quiz skorunu hesaplar
 * 
 * @param int $correct Doğru cevap sayısı
 * @param int $total Toplam soru sayısı
 * @return float Yüzde olarak başarı oranı
 */
public function calculateScore($correct, $total) {
    return ($correct / $total) * 100;
}
```

### JavaScript

- ES6+ syntax kullanın
- camelCase naming convention
- JSDoc yorumları ekleyin:

```javascript
/**
 * Süre sayacını başlatır
 * @param {number} seconds - Başlangıç saniyesi
 */
function startTimer(seconds) {
    // Implementation
}
```

### CSS

- BEM metodolojisi tercih edilir
- CSS değişkenleri kullanın
- Mobile-first approach

```css
/* Component */
.quiz-card {
    /* Base styles */
}

/* Element */
.quiz-card__title {
    /* Element styles */
}

/* Modifier */
.quiz-card--featured {
    /* Modifier styles */
}
```

### SQL

- Tablo ve kolon isimleri snake_case
- İlişkisel bütünlük korunmalı
- Index'ler performans için önemli

## 🔄 Pull Request Süreci

1. **Branch Naming:**
   - `feature/` - Yeni özellikler
   - `bugfix/` - Bug düzeltmeleri
   - `hotfix/` - Acil düzeltmeler
   - `docs/` - Dokümantasyon

2. **PR Açıklaması:**
   ```markdown
   ## Açıklama
   Bu PR neyi çözüyor/ekliyor?

   ## Değişiklikler
   - Değişiklik 1
   - Değişiklik 2

   ## Test
   Nasıl test edildi?

   ## Ekran Görüntüleri
   (Varsa)

   ## Checklist
   - [ ] Kod standartlarına uygun
   - [ ] Testler yazıldı/güncellendi
   - [ ] Dokümantasyon güncellendi
   ```

3. **Code Review:**
   - En az 1 reviewer onayı gerekli
   - CI/CD testleri geçmeli
   - Conflict'ler çözülmeli

## 💬 Commit Mesajları

Conventional Commits formatını kullanıyoruz:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types:
- `feat:` Yeni özellik
- `fix:` Bug düzeltmesi
- `docs:` Dokümantasyon
- `style:` Formatting, missing semi colons, etc
- `refactor:` Kod refactoring
- `test:` Test ekleme/düzeltme
- `chore:` Maintenance

### Örnekler:

```bash
feat(quiz): add timer warning at 10 seconds
fix(auth): resolve login redirect issue
docs(readme): update installation instructions
style(css): fix button alignment on mobile
refactor(models): optimize database queries
test(quiz): add unit tests for score calculation
chore(deps): update composer dependencies
```

### Emojiler (Opsiyonel):

- ✨ `:sparkles:` - Yeni özellik
- 🐛 `:bug:` - Bug fix
- 📚 `:books:` - Dokümantasyon
- 💄 `:lipstick:` - UI/styling
- ♻️ `:recycle:` - Refactoring
- ✅ `:white_check_mark:` - Test
- 🔧 `:wrench:` - Configuration

## 🧪 Test Yazma

### PHPUnit Testleri

```php
class QuizTest extends TestCase
{
    public function testScoreCalculation()
    {
        $quiz = new Quiz();
        $score = $quiz->calculateScore(8, 10);
        $this->assertEquals(80, $score);
    }
}
```

### JavaScript Testleri

```javascript
describe('Timer', () => {
    it('should start from 30 seconds', () => {
        const timer = new Timer();
        expect(timer.seconds).toBe(30);
    });
});
```

## 📚 Dokümantasyon

Kod katkılarınızla birlikte:

- README.md'yi güncelleyin
- API değişikliklerini belgeleyin
- Yeni özellikler için kullanım örnekleri ekleyin
- CHANGELOG.md'ye ekleme yapın

## 🎯 Öncelikli Alanlar

Şu alanlarda katkılar özellikle değerli:

1. **Performans İyileştirmeleri**
   - Database query optimization
   - Frontend performance
   - Caching strategies

2. **Yeni Özellikler**
   - Dark mode
   - Çok oyunculu mod
   - API development
   - Mobile app

3. **Test Coverage**
   - Unit tests
   - Integration tests
   - E2E tests

4. **Dokümantasyon**
   - API documentation
   - User guides
   - Video tutorials

5. **Çeviriler**
   - İngilizce çeviri
   - Diğer diller

## 🙏 Teşekkürler!

Her türlü katkı değerlidir. Kod, dokümantasyon, tasarım, test veya fikir - hepsi projeyi ileriye taşır.

Sorularınız varsa:
- GitHub Issues kullanın
- Discussions'da tartışma başlatın
- E-posta: contact@quizmaster.com

Happy coding! 🚀
