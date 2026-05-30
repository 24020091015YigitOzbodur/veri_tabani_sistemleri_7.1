package com.example.odev7;

public class Mekan {
    private int id;
    private int sehirId;
    private String mekanAdi;
    private String kategori;
    private String aciklama;
    private String adres;

    public Mekan() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getSehirId() { return sehirId; }
    public void setSehirId(int sehirId) { this.sehirId = sehirId; }

    public String getMekanAdi() { return mekanAdi; }
    public void setMekanAdi(String mekanAdi) { this.mekanAdi = mekanAdi; }

    public String getKategori() { return kategori; }
    public void setKategori(String kategori) { this.kategori = kategori; }

    public String getAciklama() { return aciklama; }
    public void setAciklama(String aciklama) { this.aciklama = aciklama; }

    public String getAdres() { return adres; }
    public void setAdres(String adres) { this.adres = adres; }
}