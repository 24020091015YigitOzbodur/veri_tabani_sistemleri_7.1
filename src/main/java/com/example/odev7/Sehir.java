package com.example.odev7;

public class Sehir {
    private int id;
    private String sehirAdi;
    private String bolge;
    private String aciklama;

    public Sehir() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getSehirAdi() { return sehirAdi; }
    public void setSehirAdi(String sehirAdi) { this.sehirAdi = sehirAdi; }

    public String getBolge() { return bolge; }
    public void setBolge(String bolge) { this.bolge = bolge; }

    public String getAciklama() { return aciklama; }
    public void setAciklama(String aciklama) { this.aciklama = aciklama; }
}