package com.example.odev7;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:postgresql://localhost:5432/sehir_rehberi";
    private static final String USER = "postgres";
    private static final String PASSWORD = "2331548y.";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Veritabanına bağlandı!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Bağlantı kesildi: " + e.getMessage());
        }
        return conn;
    }
}