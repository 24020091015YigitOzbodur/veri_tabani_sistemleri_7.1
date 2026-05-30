<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.odev7.Mekan" %>
<%@ page import="com.example.odev7.SehirDAO" %>
<%
    // Eğer form submit edildiyse (POST isteği geldiyse) bu blok çalışır ve veritabanına kaydeder
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        request.setCharacterEncoding("UTF-8"); // Türkçe karakter sorunu olmasın diye

        Mekan yeniMekan = new Mekan();
        yeniMekan.setSehirId(Integer.parseInt(request.getParameter("sehirId")));
        yeniMekan.setMekanAdi(request.getParameter("mekanAdi"));
        yeniMekan.setKategori(request.getParameter("kategori"));
        yeniMekan.setAciklama(request.getParameter("aciklama"));
        yeniMekan.setAdres(request.getParameter("adres"));

        SehirDAO dao = new SehirDAO();
        dao.mekanEkle(yeniMekan);

        // Kayıt bitince o şehrin detay sayfasına geri dön
        response.sendRedirect("sehirDetay.jsp?id=" + yeniMekan.getSehirId());
        return;
    }

    // Sayfa normal açıldıysa URL'den sehirId'yi alıp forma gizli (hidden) olarak gömeceğiz
    String sehirId = request.getParameter("sehirId");
%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Yeni Mekan Ekle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-success text-white">
                    <h4 class="mb-0">Yeni Mekan Ekle</h4>
                </div>
                <div class="card-body">
                    <form action="mekanEkle.jsp" method="post">
                        <input type="hidden" name="sehirId" value="<%= sehirId %>">

                        <div class="mb-3">
                            <label class="form-label fw-bold">Mekan Adı</label>
                            <input type="text" class="form-control" name="mekanAdi" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Kategori</label>
                            <select class="form-select" name="kategori">
                                <option value="Restoran">Restoran</option>
                                <option value="Kafe">Kafe</option>
                                <option value="Müze">Müze</option>
                                <option value="Park">Park/Doğa</option>
                                <option value="Eğlence">Eğlence</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Açıklama</label>
                            <textarea class="form-control" name="aciklama" rows="3" required></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Adres</label>
                            <textarea class="form-control" name="adres" rows="2" required></textarea>
                        </div>

                        <button type="submit" class="btn btn-success w-100">Kaydet</button>
                        <a href="sehirDetay.jsp?id=<%= sehirId %>" class="btn btn-outline-secondary w-100 mt-2">İptal</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>