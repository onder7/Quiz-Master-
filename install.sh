#!/bin/bash

echo "🎮 Quiz Master Kurulum Scripti"
echo "=============================="

# Renkleri tanımla
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# PHP versiyonunu kontrol et
echo -n "PHP kontrolü... "
if command -v php &> /dev/null; then
    PHP_VERSION=$(php -r "echo PHP_VERSION;")
    echo -e "${GREEN}✓${NC} (v$PHP_VERSION)"
else
    echo -e "${RED}✗${NC} PHP kurulu değil!"
    exit 1
fi

# Composer kontrolü
echo -n "Composer kontrolü... "
if command -v composer &> /dev/null; then
    echo -e "${GREEN}✓${NC}"
else
    echo -e "${YELLOW}Composer kurulu değil. Kuruluyor...${NC}"
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
fi

# Bağımlılıkları yükle
echo "Bağımlılıklar yükleniyor..."
composer install

# .env dosyasını oluştur
if [ ! -f .env ]; then
    echo ".env dosyası oluşturuluyor..."
    cp .env.example .env
    echo -e "${YELLOW}Lütfen .env dosyasını düzenleyin!${NC}"
fi

# Ses dosyaları klasörünü oluştur
echo "Klasörler oluşturuluyor..."
mkdir -p public/audio
mkdir -p logs

# İzinleri ayarla
echo "Dosya izinleri ayarlanıyor..."
chmod -R 755 .
chmod -R 777 public/audio
chmod -R 777 logs

# Veritabanı kurulumu
echo ""
echo -e "${YELLOW}Veritabanı Kurulumu${NC}"
echo "===================="
echo "1. quiz_app veritabanını oluşturun"
echo "2. quiz_app (2).sql dosyasını import edin"
echo "3. sample_questions.sql dosyasını import edin (opsiyonel)"
echo "4. database_updates.sql dosyasını çalıştırın"
echo ""

# Sunucu başlatma seçenekleri
echo -e "${GREEN}Kurulum tamamlandı!${NC}"
echo ""
echo "Uygulamayı başlatmak için:"
echo "  PHP Server: php -S localhost:8000"
echo "  Docker:     docker-compose up -d"
echo ""
echo "Ardından tarayıcınızda http://localhost:8000 adresini açın."
