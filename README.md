# 🌍 Şehir Rehberi ve Gezi Rotası

Bu proje, Sistem Tasarımı ve Yazılım Mühendisliği (SSTE) dersi çoklu veritabanı ödevinin **1. Aşamasıdır**. Java Server Pages (JSP) ve PostgreSQL kullanılarak geliştirilmiş, dinamik bir şehir ve mekan listeleme web uygulamasıdır.

Arayüz tasarımında Bootstrap 5 kullanılmış olup, veritabanı işlemleri JDBC üzerinden yapılmıştır.

## 🚀 Özellikler

* **Şehir Listeleme:** Veritabanındaki şehirlerin ana sayfada tablo halinde görüntülenmesi.
* **Mekan Detayları:** Seçilen şehre ait turistik mekanların, restoranların ve etkinliklerin listelendiği detay sayfası (Parametreli SQL sorgusu ile).
* **Yeni Mekan Ekleme:** Arayüz üzerinden formu doldurarak ilgili şehre yeni mekan/gezi rotası ekleme işlemi.
* **Responsive Tasarım:** Bootstrap 5 ile mobil uyumlu, temiz ve modern arayüz.


## 📂 Kurulum ve Çalıştırma

Projeyi kendi bilgisayarınızda (veya hocanın bilgisayarında) sorunsuz çalıştırmak için aşağıdaki adımları izleyin:

**1. Veritabanını Ayağa Kaldırma:**
* Proje dizininde bulunan `sehir_rehberi.sql` dosyasının içindeki SQL kodlarını kopyalayın.
* pgAdmin 4 üzerinden `sehir_rehberi` adında yeni bir veritabanı oluşturup Query Tool (Sorgu Ekranı) üzerinden bu kodları çalıştırın. Tablolar ve test verileri otomatik eklenecektir.

**2. Veritabanı Bağlantı Ayarları:**
* Kodu IDE'nizde (IntelliJ IDEA vb.) açın.
* `src/main/java/com/example/odev7/DBConnection.java` dosyasına gidin.
* `PASSWORD` değişkenindeki değeri kendi PostgreSQL şifrenizle değiştirin.

**3. Projeyi Başlatma:**
* Projeyi Tomcat sunucusu üzerinde derleyip çalıştırın (Run).
* Tarayıcınızda `http://localhost:8080/odev7/` (veya sizin portunuza göre) adresine giderek projeyi test edebilirsiniz.

## 📷 Ekran Görüntüleri
<img width="1263" height="616" alt="ss1" src="https://github.com/user-attachments/assets/764d76bf-a36c-4bbc-a20c-5bed71b0f34f" />
<img width="1290" height="679" alt="ss2" src="https://github.com/user-attachments/assets/f2bb6d68-f9e7-4af8-99f3-64f86e4a9b86" />
<img width="955" height="755" alt="ss3" src="https://github.com/user-attachments/assets/4620bd66-baa9-4d83-abe4-eae37c87ba2a" />
<img width="1338" height="674" alt="ss4" src="https://github.com/user-attachments/assets/c38c1bba-2acd-4c4c-9fa7-ad492535430e" />
