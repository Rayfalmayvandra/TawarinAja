<%-- 
    Document   : listBarang
    Created on : Nov 29, 2025, 8:53:52 PM
    Author     : rayfa
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Barang" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="image/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <title>Daftar Barang - TawarinAja</title>
    <style>
        :root {
            --primary-color: #2E8B57;
            --secondary-color: #FF6B35;
            --accent-color: #264653;
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #2E8B57 0%, #3CB371 100%);
            min-height: 100vh;
            color: #333;
        }
        
        .navbar-brand {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 1.8rem;
            color: var(--primary-color) !important;
        }
        
        .products-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
            padding: 2rem;
        }
        
        .product-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }
        
        .product-image {
            height: 200px;
            background: linear-gradient(45deg, #f8f9fa, #e9ecef);
            border-radius: 15px 15px 0 0;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
            font-size: 3rem;
        }
        
        .price-tag {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .btn-detail {
            background: linear-gradient(45deg, var(--primary-color), #4CAF50);
            border: none;
            padding: 10px 25px;
            border-radius: 25px;
            color: white;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .btn-detail:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 139, 87, 0.4);
            color: white;
        }
        
        .cart-badge {
            position: relative;
        }
        
        .cart-badge::after {
            content: '';
            position: absolute;
            top: -5px;
            right: -5px;
            width: 8px;
            height: 8px;
            background: var(--secondary-color);
            border-radius: 50%;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="image/logo1.png" alt="TawarinAja" height="40" class="me-2">
                TawarinAja
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link cart-badge position-relative me-3" 
                   href="${pageContext.request.contextPath}/riwayatTawar" 
                   style="font-size: 1.5rem; color: var(--accent-color);">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                <a href="${pageContext.request.contextPath}/riwayatTawar" class="btn btn-outline-primary btn-sm">
                    <i class="fas fa-history me-1"></i>Riwayat Tawaran
                </a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="products-card">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0" style="font-family: 'Playfair Display', serif; color: var(--accent-color);">
                    <i class="fas fa-gavel me-2"></i>Daftar Barang Lelang
                </h2>
                <span class="badge bg-primary fs-6">
                    <%
                        List<Barang> barangList = (List<Barang>) application.getAttribute("barangList");
                        int itemCount = (barangList != null) ? barangList.size() : 0;
                    %>
                    <%= itemCount %> Barang Tersedia
                </span>
            </div>

            <% if (barangList == null || barangList.isEmpty()) { %>
            <div class="text-center py-5">
                <i class="fas fa-box-open fa-4x text-muted mb-3"></i>
                <h4 class="text-muted">Tidak Ada Barang Lelang</h4>
                <p class="text-muted">Belum ada barang yang dilelang saat ini</p>
            </div>
            <% } else { %>
                <div class="row">
                    <% for (Barang b : barangList) { %>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card product-card">
                            <div class="product-image">
                                <i class="fas fa-cube"></i>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title" style="color: var(--accent-color);">
                                    <%= b.getTitle() %>
                                </h5>
                                <p class="card-text text-muted">
                                    <%= b.getDescription().length() > 100 ? 
                                        b.getDescription().substring(0, 100) + "..." : 
                                        b.getDescription() %>
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="price-tag">
                                        Rp <%= String.format("%,.0f", b.getInitialPrice()) %>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/detailBarang?id=<%= b.getId() %>" 
                                       class="btn btn-detail">
                                        <i class="fas fa-eye me-1"></i>Detail
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            <% } %>
        </div>
    </div>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>