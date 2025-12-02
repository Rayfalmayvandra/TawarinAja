<%-- 
    Document   : historyPembelian
    Created on : Nov 30, 2025, 1:15:29?AM
    Author     : rayfa
--%>

<%@ page import="java.util.List" %>
<%@ page import="model.Penawaran" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="image/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <title>Riwayat Pembelian - TawarinAja</title>
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
        
        .history-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
            padding: 2rem;
        }
        
        .purchase-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            margin-bottom: 1.5rem;
            transition: transform 0.3s ease;
        }
        
        .purchase-card:hover {
            transform: translateY(-5px);
        }
        
        .status-badge {
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        .status-dibayar {
            background: linear-gradient(45deg, #00b894, #00a085);
            color: white;
        }
        
        .status-dikirim {
            background: linear-gradient(45deg, #0984e3, #0767b3);
            color: white;
        }
        
        .status-selesai {
            background: linear-gradient(45deg, #00cec9, #00a8a8);
            color: white;
        }
        
        .price-highlight {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .tracking-steps {
            display: flex;
            justify-content: space-between;
            margin-top: 1rem;
            position: relative;
        }
        
        .tracking-steps::before {
            content: '';
            position: absolute;
            top: 15px;
            left: 0;
            right: 0;
            height: 2px;
            background: #e9ecef;
            z-index: 1;
        }
        
        .tracking-step {
            text-align: center;
            position: relative;
            z-index: 2;
            flex: 1;
        }
        
        .step-icon {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: #e9ecef;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 0.5rem;
            font-size: 0.8rem;
        }
        
        .step-active {
            background: var(--primary-color);
            color: white;
        }
        
        .step-completed {
            background: var(--primary-color);
            color: white;
        }
        
        .step-label {
            font-size: 0.8rem;
            color: #666;
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
                <a class="nav-link" href="${pageContext.request.contextPath}/ListBarangServlet">
                    <i class="fas fa-home me-1"></i>Beranda
                </a>
                <a class="nav-link" href="riwayatTawar">
                    <i class="fas fa-history me-1"></i>Riwayat Tawar
                </a>
                <a class="nav-link active" href="historyPembelian.jsp">
                    <i class="fas fa-shopping-bag me-1"></i>Pembelian
                </a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="history-card">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0" style="font-family: 'Playfair Display', serif; color: var(--accent-color);">
                    <i class="fas fa-shopping-bag me-2"></i>Riwayat Pembelian
                </h2>
                <a href="${pageContext.request.contextPath}/ListBarangServlet" class="btn btn-outline-custom">
                    <i class="fas fa-arrow-left me-1"></i>Kembali ke Beranda
                </a>
            </div>

            <%
                List<Penawaran> history = (List<Penawaran>) session.getAttribute("historyPembelian");
            %>

            <% if (history == null || history.isEmpty()) { %>
            <div class="text-center py-5">
                <i class="fas fa-box-open fa-4x text-muted mb-3"></i>
                <h4 class="text-muted">Belum Ada Pembelian</h4>
                <p class="text-muted mb-4">Mulai ikuti lelang dan menangkan barang impian Anda</p>
                <a href="${pageContext.request.contextPath}/ListBarangServlet" class="btn btn-primary" 
                   style="background: linear-gradient(45deg, var(--primary-color), #4CAF50); border: none; padding: 12px 30px; border-radius: 25px; font-weight: 600;">
                    <i class="fas fa-gavel me-2"></i>Jelajahi Lelang
                </a>
            </div>
            <% } else { %>
                <div class="row">
                    <% for (Penawaran p : history) { 
                        // Determine status and tracking progress
                        String status = "DIBAYAR";
                        int progress = 1; // 1: Dibayar, 2: Dikirim, 3: Selesai
                        
                        // You can add logic here to determine actual status from your data
                        if (p.getStatus() != null) {
                            switch(p.getStatus()) {
                                case "DIKIRIM":
                                    progress = 2;
                                    break;
                                case "SELESAI":
                                    progress = 3;
                                    break;
                                default:
                                    progress = 1;
                            }
                        }
                    %>
                    <div class="col-12 mb-4">
                        <div class="card purchase-card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="d-flex align-items-start mb-3">
                                            <div class="bg-light rounded p-3 me-3">
                                                <i class="fas fa-cube fa-2x text-primary"></i>
                                            </div>
                                            <div>
                                                <h5 class="card-title mb-1" style="color: var(--accent-color);">
                                                    Barang #<%= p.getBarangId() %>
                                                </h5>
                                                <p class="text-muted mb-2">ID Penawaran: #<%= p.getId() %></p>
                                                <div class="price-highlight">
                                                    Rp <%= String.format("%,.0f", p.getAmount()) %>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row mb-3">
                                            <div class="col-sm-6">
                                                <small class="text-muted">Alamat Pengiriman:</small>
                                                <p class="mb-1"><%= p.getAlamat() != null ? p.getAlamat() : "Alamat tidak tersedia" %></p>
                                            </div>
                                            <div class="col-sm-6">
                                                <small class="text-muted">Metode Pembayaran:</small>
                                                <p class="mb-1"><%= p.getMetode() != null ? p.getMetode() : "Transfer Bank" %></p>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <div class="text-end mb-3">
                                            <span class="status-badge 
                                                <% if (progress >= 3) { %>status-selesai
                                                <% } else if (progress >= 2) { %>status-dikirim
                                                <% } else { %>status-dibayar<% } %>">
                                                <% if (progress >= 3) { %>SELESAI
                                                <% } else if (progress >= 2) { %>DIKIRIM
                                                <% } else { %>DIBAYAR<% } %>
                                            </span>
                                        </div>
                                        
                                        <!-- Tracking Steps -->
                                        <div class="tracking-steps">
                                            <div class="tracking-step">
                                                <div class="step-icon <%= progress >= 1 ? "step-completed" : "" %>">
                                                    <i class="fas fa-<%= progress >= 1 ? "check" : "clock" %>"></i>
                                                </div>
                                                <div class="step-label">Dibayar</div>
                                            </div>
                                            <div class="tracking-step">
                                                <div class="step-icon <%= progress >= 2 ? "step-completed" : (progress == 1 ? "step-active" : "") %>">
                                                    <i class="fas fa-<%= progress >= 2 ? "check" : (progress == 1 ? "truck" : "clock") %>"></i>
                                                </div>
                                                <div class="step-label">Dikirim</div>
                                            </div>
                                            <div class="tracking-step">
                                                <div class="step-icon <%= progress >= 3 ? "step-completed" : (progress == 2 ? "step-active" : "") %>">
                                                    <i class="fas fa-<%= progress >= 3 ? "check" : (progress == 2 ? "box" : "clock") %>"></i>
                                                </div>
                                                <div class="step-label">Selesai</div>
                                            </div>
                                        </div>
                                        
                                        <div class="text-end mt-3">
                                            <% if (progress < 3) { %>
                                            <a href="#" class="btn btn-outline-custom btn-sm">
                                                <i class="fas fa-eye me-1"></i>Lacak
                                            </a>
                                            <% } else { %>
                                            <a href="#" class="btn btn-outline-custom btn-sm">
                                                <i class="fas fa-star me-1"></i>Beri Rating
                                            </a>
                                            <% } %>
                                        </div>
                                    </div>
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