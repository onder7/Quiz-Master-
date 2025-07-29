-- Veritabanı güncellemeleri
-- Bu dosyayı mevcut veritabanınıza uygulayarak eksik alanları ekleyebilirsiniz

-- user_answers tablosuna time_taken alanı ekle (eğer yoksa)
ALTER TABLE user_answers 
ADD COLUMN time_taken INT DEFAULT 0 AFTER is_correct;

-- Performans için index eklemeleri
ALTER TABLE scores ADD INDEX idx_user_percentage (user_id, score, total_questions);
ALTER TABLE scores ADD INDEX idx_completed_date (completed_at);

-- Örnek admin kullanıcısı (şifre: admin123)
INSERT INTO users (username, email, password) 
VALUES ('admin', 'admin@quizmaster.com', '$2y$10$YourHashedPasswordHere')
ON DUPLICATE KEY UPDATE username = username;

-- Veritabanı karakter setini kontrol et
ALTER DATABASE quiz_app CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
