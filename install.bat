#Windows Kurulum Scripti
@echo off
echo ==============================
echo Quiz Master Kurulum Scripti
echo ==============================
echo.

REM PHP kontrolu
echo PHP kontrol ediliyor...
php -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [HATA] PHP kurulu degil!
    echo Lutfen PHP'yi kurun: https://windows.php.net/download/
    pause
    exit /b 1
) else (
    echo [OK] PHP kurulu
)

REM Composer kontrolu
echo Composer kontrol ediliyor...
composer -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [UYARI] Composer kurulu degil!
    echo Composer indiriliyor...
    powershell -Command "Invoke-WebRequest -Uri https://getcomposer.org/installer -OutFile composer-setup.php"
    php composer-setup.php
    del composer-setup.php
    echo [OK] Composer indirildi
) else (
    echo [OK] Composer kurulu
)

REM Bagimliliklari yukle
echo.
echo Bagimliliklar yukleniyor...
call composer install

REM .env dosyasini olustur
if not exist .env (
    echo .env dosyasi olusturuluyor...
    copy .env.example .env
    echo [UYARI] Lutfen .env dosyasini duzenleyin!
)

REM Klasorleri olustur
echo.
echo Klasorler olusturuluyor...
if not exist "public\audio" mkdir "public\audio"
if not exist "logs" mkdir "logs"

echo.
echo ==============================
echo Kurulum tamamlandi!
echo ==============================
echo.
echo Veritabani kurulumu:
echo 1. phpMyAdmin'e gidin
echo 2. quiz_app veritabanini olusturun
echo 3. quiz_app (2).sql dosyasini import edin
echo 4. sample_questions.sql dosyasini import edin
echo 5. database_updates.sql dosyasini calistirin
echo.
echo Uygulamayi baslatmak icin:
echo   php -S localhost:8000
echo.
echo Ardindan tarayicinizda http://localhost:8000 adresini acin.
echo.
pause
