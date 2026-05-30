-- Önce şehirler tablosu (Ana tablo)
CREATE TABLE sehirler (
                          id SERIAL PRIMARY KEY,
                          sehir_adi VARCHAR(100) NOT NULL,
                          bolge VARCHAR(50),
                          aciklama TEXT
);

-- Mekanlar tablosu (Şehre bağlı)
CREATE TABLE mekanlar (
                          id SERIAL PRIMARY KEY,
                          sehir_id INT REFERENCES sehirler(id) ON DELETE CASCADE,
                          mekan_adi VARCHAR(150) NOT NULL,
                          kategori VARCHAR(50), -- Restoran, Müze, Park vb.
                          aciklama TEXT,
                          adres TEXT
);

-- Etkinlikler tablosu (Şehre bağlı)
CREATE TABLE etkinlikler (
                             id SERIAL PRIMARY KEY,
                             sehir_id INT REFERENCES sehirler(id) ON DELETE CASCADE,
                             etkinlik_adi VARCHAR(150) NOT NULL,
                             tarih DATE,
                             aciklama TEXT
);

-- Rehberler tablosu (Şehre bağlı)
CREATE TABLE rehberler (
                           id SERIAL PRIMARY KEY,
                           sehir_id INT REFERENCES sehirler(id) ON DELETE CASCADE,
                           rehber_adi VARCHAR(150) NOT NULL,
                           icerik TEXT,
                           puan INT CHECK (puan BETWEEN 1 AND 5)
);

-- Önce şehirleri ekleyelim
INSERT INTO sehirler (sehir_adi, bolge, aciklama) VALUES
                                                      ('Adana', 'Akdeniz', 'Kebabın, şalgamın ve sıcağın başkenti.'),
                                                      ('Kahramanmaraş', 'Akdeniz', 'Dondurmanın ve şiirin ana vatanı.');

-- Mekanları ekleyelim (Adana id=1, Maraş id=2 olarak eklendiği için)
INSERT INTO mekanlar (sehir_id, mekan_adi, kategori, aciklama, adres) VALUES
                                                                          (1, 'Tarihi Kazancılar Kebapçısı', 'Restoran', 'Gerçek Adana kebabı burada yenir.', 'Büyüksaat Civarı, Seyhan'),
                                                                          (2, 'Yaşar Pastanesi', 'Kafe', 'Hakiki Maraş dondurması denemek için birebir.', 'Trabzon Bulvarı, Dulkadiroğlu');

-- Birkaç da etkinlik ve rehber atalım tam olsun
INSERT INTO etkinlikler (sehir_id, etkinlik_adi, tarih, aciklama) VALUES
                                                                      (1, 'Portakal Çiçeği Karnavalı', '2027-04-15', 'Sokak lezzetleri ve eğlence dolu festival.'),
                                                                      (2, 'Dondurma Festivali', '2026-08-10', 'Sınırsız dondurma tadımı ve gösteriler.');

INSERT INTO rehberler (sehir_id, rehber_adi, icerik, puan) VALUES
                                                               (1, 'Ali Usta', 'Adana lezzet turu uzmanı', 5),
                                                               (2, 'Ayşe Hanım', 'Maraş tarihi mekanlar rehberi', 4);