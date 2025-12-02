<%-- 
    Document   : ListBarangSeller
    Created on : Nov 30, 2025, 3:39:44 PM
    Author     : MSii
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.Barang" %>
<%
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    
    if (successMessage != null) {
        session.removeAttribute("successMessage");
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <i class="fas fa-check-circle me-2"></i><%= successMessage %>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<%
    }
    
    if (errorMessage != null) {
        session.removeAttribute("errorMessage");
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <i class="fas fa-exclamation-triangle me-2"></i><%= errorMessage %>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<%
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="image/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <title>Barang Saya - TawarinAja</title>
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
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
        
        .product-image {
            height: 180px;
            background: linear-gradient(45deg, #f8f9fa, #e9ecef);
            border-radius: 15px 15px 0 0;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
            font-size: 2.5rem;
        }
        
        .price-tag {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        .status-active {
            background: linear-gradient(45deg, #00b894, #00a085);
            color: white;
        }
        
        .status-ended {
            background: #6c757d;
            color: white;
        }
        
        .status-sold {
            background: linear-gradient(45deg, #FF6B35, #FF8E53);
            color: white;
        }
        
        .btn-primary-custom {
            background: linear-gradient(45deg, var(--primary-color), #4CAF50);
            border: none;
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            font-size: 0.9rem;
        }
        
        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 139, 87, 0.4);
            color: white;
        }
        
        .btn-outline-custom {
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            font-size: 0.9rem;
        }
        
        .btn-outline-custom:hover {
            background-color: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .table-custom {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        }
        
        .table-custom th {
            background: linear-gradient(45deg, var(--primary-color), #4CAF50);
            color: white;
            font-weight: 600;
            padding: 1rem;
            border: none;
        }
        
        .table-custom td {
            padding: 1rem;
            vertical-align: middle;
            border-color: #f1f3f4;
        }
        
        .table-custom tbody tr:hover {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/ListBarangServlet">
                <img src="image/logo1.png" alt="TawarinAja" height="40" class="me-2">
                TawarinAja
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="DashboardSeller.jsp">
                    <i class="fas fa-tachometer-alt me-1"></i>Dashboard
                </a>
                <a class="nav-link active" href="ListBarangSellerServlet">
                    <i class="fas fa-cube me-1"></i>Barang Saya
                </a>
                <a class="nav-link" href="riwayatPenjualan.jsp">
                    <i class="fas fa-chart-line me-1"></i>Riwayat
                </a>
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-user-circle me-1"></i>Penjual
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="profilPenjual.jsp"><i class="fas fa-user me-2"></i>Profil</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="logout"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="products-card">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0" style="font-family: 'Playfair Display', serif; color: var(--accent-color);">
                    <i class="fas fa-cubes me-2"></i>Barang Saya
                </h2>
                <div>
                    <a href="DashboardSeller.jsp" class="btn btn-outline-custom me-2">
                        <i class="fas fa-arrow-left me-1"></i>Kembali
                    </a>
                    <a href="tambahBarang.jsp" class="btn btn-primary-custom">
                        <i class="fas fa-plus me-1"></i>Tambah Barang
                    </a>
                </div>
            </div>

            <%
                List<Barang> list = (List<Barang>) request.getAttribute("barangList");
                if (list == null || list.isEmpty()) {
            %>
            <div class="text-center py-5">
                <i class="fas fa-box-open fa-4x text-muted mb-3"></i>
                <h4 class="text-muted">Belum Ada Barang</h4>
                <p class="text-muted mb-4">Mulai tambahkan barang pertama Anda untuk dilelang</p>
                <a href="tambahBarang.jsp" class="btn btn-primary-custom">
                    <i class="fas fa-plus me-2"></i>Tambah Barang Pertama
                </a>
            </div>
            <%
                } else {
            %>
            <div class="table-responsive">
                <table class="table table-custom table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nama Barang</th>
                            <th>Harga Awal</th>
                            <th>Status</th>
                            <th>Waktu Selesai</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Barang b : list) {
                                String status = "ACTIVE";
                                long now = System.currentTimeMillis();
                                if (b.getEndTime() < now) {
                                    status = "ENDED";
                                }
                        %>
                        <tr>
                            <td><strong>#<%= b.getId() %></strong></td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div class="product-image me-3" style="width: 60px; height: 60px; border-radius: 10px;">
                                        <i class="fas fa-cube"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-1" style="color: var(--accent-color);"><%= b.getTitle() %></h6>
                                        <small class="text-muted"><%= b.getDescription().length() > 50 ? 
                                            b.getDescription().substring(0, 50) + "..." : b.getDescription() %></small>
                                    </div>
                                </div>
                            </td>
                            <td class="price-tag">Rp <%= String.format("%,.0f", b.getInitialPrice()) %></td>
                            <td>
                                <span class="status-badge 
                                    <% if ("ACTIVE".equals(status)) { %>status-active
                                    <% } else { %>status-ended<% } %>">
                                    <% if ("ACTIVE".equals(status)) { %>
                                        <i class="fas fa-play me-1"></i>Aktif
                                    <% } else { %>
                                        <i class="fas fa-flag-checkered me-1"></i>Selesai
                                    <% } %>
                                </span>
                            </td>
                            <td>
                                <small><%= new java.util.Date(b.getEndTime()) %></small>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <a href="#" class="btn btn-outline-custom btn-sm">
                                        <i class="fas fa-edit me-1"></i>Edit
                                    </a>
                                    <a href="#" class="btn btn-outline-custom btn-sm">
                                        <i class="fas fa-chart-bar me-1"></i>Statistik
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="d-flex justify-content-between align-items-center mt-4">
                <div class="text-muted">
                    Menampilkan <%= list.size() %> barang
                </div>
                <nav>
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link" href="#">Previous</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>