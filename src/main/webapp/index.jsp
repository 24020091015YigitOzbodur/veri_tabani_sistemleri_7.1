<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.odev7.Sehir" %>
<%@ page import="com.example.odev7.SehirDAO" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Şehir Rehberi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4 text-primary fw-bold">Şehir Rehberi ve Gezi Rotası</h2>

    <div class="card shadow-sm">
        <div class="card-body p-0">
            <table class="table table-hover m-0">
                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Şehir Adı</th>
                    <th>Bölge</th>
                    <th>Açıklama</th>
                </tr>
                </thead>
                <tbody>
                <%
                    SehirDAO dao = new SehirDAO();
                    List<Sehir> sehirler = dao.getTumSehirler();

                    if(sehirler != null && !sehirler.isEmpty()) {
                        for(Sehir s : sehirler) {
                %>
                <tr>
                    <td><%= s.getId() %></td>
                    <td><a href="sehirDetay.jsp?id=<%= s.getId() %>" class="text-decoration-none fw-bold text-primary"><%= s.getSehirAdi() %></a></td>
                    <td><span class="badge bg-secondary"><%= s.getBolge() %></span></td>
                    <td><%= s.getAciklama() %></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="4" class="text-center text-muted p-3">Henüz hiç şehir eklenmemiş.</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>