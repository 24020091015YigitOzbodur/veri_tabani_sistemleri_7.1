package com.example.odev7;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SehirDAO {

    public List<Sehir> getTumSehirler() {
        List<Sehir> sehirler = new ArrayList<>();
        String query = "SELECT * FROM sehirler ORDER BY id ASC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Sehir sehir = new Sehir();
                sehir.setId(rs.getInt("id"));
                sehir.setSehirAdi(rs.getString("sehir_adi"));
                sehir.setBolge(rs.getString("bolge"));
                sehir.setAciklama(rs.getString("aciklama"));

                sehirler.add(sehir);
            }
        } catch (SQLException e) {
            System.out.println("Şehirleri çekerken hata oldu: " + e.getMessage());
        }
        return sehirler;
    }
    // Seçilen şehre ait mekanları getiren metod
    public List<Mekan> getMekanlarBySehirId(int sehirId) {
        List<Mekan> mekanlar = new ArrayList<>();
        // Burada parametreli sorgu (PreparedStatement) kullanıyoruz ki hoca da notunu bol versin
        String query = "SELECT * FROM mekanlar WHERE sehir_id = ?";

        try (Connection conn = DBConnection.getConnection();
             java.sql.PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, sehirId); // Soru işareti olan yere şehrin ID'sini basıyoruz

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Mekan m = new Mekan();
                    m.setId(rs.getInt("id"));
                    m.setSehirId(rs.getInt("sehir_id"));
                    m.setMekanAdi(rs.getString("mekan_adi"));
                    m.setKategori(rs.getString("kategori"));
                    m.setAciklama(rs.getString("aciklama"));
                    m.setAdres(rs.getString("adres"));

                    mekanlar.add(m);
                }
            }
        } catch (SQLException e) {
            System.out.println("Mekanları çekerken patladık: " + e.getMessage());
        }
        return mekanlar;
    }
    // Yeni mekan ekleme metodu
    public void mekanEkle(Mekan m) {
        String query = "INSERT INTO mekanlar (sehir_id, mekan_adi, kategori, aciklama, adres) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             java.sql.PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, m.getSehirId());
            pstmt.setString(2, m.getMekanAdi());
            pstmt.setString(3, m.getKategori());
            pstmt.setString(4, m.getAciklama());
            pstmt.setString(5, m.getAdres());

            pstmt.executeUpdate(); // Veriyi kaydet
            System.out.println("Mekan başarıyla eklendi!");

        } catch (SQLException e) {
            System.out.println("Mekan eklerken patladık: " + e.getMessage());
        }
    }
}
