<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.odev7.Mekan" %>
<%@ page import="com.example.odev7.SehirDAO" %>
<!DOCTYPE html>
<html lang="tr">
<head>
  <meta charset="UTF-8">
  <title>Şehir Detayları</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
  <%
    String idParam = request.getParameter("id");
    if (idParam != null && !idParam.isEmpty()) {
      int sehirId = Integer.parseInt(idParam);

      SehirDAO dao = new SehirDAO();
      List<Mekan> mekanlar = dao.getMekanlarBySehirId(sehirId);
  %>

  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="text-success fw-bold">Mekanlar ve Gezilecek Yerler</h2>
    <a href="mekanEkle.jsp?sehirId=<%= sehirId %>" class="btn btn-success shadow-sm">+ Yeni Mekan Ekle</a>
  </div>

  <div class="card shadow-sm">
    <div class="card-body p-0">
      <table class="table table-striped table-hover m-0">
        <thead class="table-success">
        <tr>
          <th>Mekan Adı</th>
          <th>Kategori</th>
          <th>Açıklama</th>
          <th>Adres</th>
        </tr>
        </thead>
        <tbody>
        <%
          if (mekanlar != null && !mekanlar.isEmpty()) {
            for (Mekan m : mekanlar) {
        %>
        <tr>
          <td class="fw-bold"><%= m.getMekanAdi() %></td>
          <td><span class="badge bg-info text-dark"><%= m.getKategori() %></span></td>
          <td><%= m.getAciklama() %></td>
          <td><small class="text-muted"><%= m.getAdres() %></small></td>
        </tr>
        <%
          }
        } else {
        %>
        <tr>
          <td colspan="4" class="text-center p-4 text-muted">Bu şehre henüz mekan eklenmemiş.</td>
        </tr>
        <%
          }
        %>
        </tbody>
      </table>
    </div>
  </div>

  <%
  } else {
  %>
  <div class="alert alert-danger mt-3 shadow-sm">Hata: Şehir ID'si bulunamadı!</div>
  <%
    }
  %>

  <div class="mt-4">
    <a href="index.jsp" class="btn btn-secondary shadow-sm">&larr; Ana Sayfaya Dön</a>
  </div>

</div>

</body>
</html>