<%-- 
    Document   : riwayatTawar
    Created on : Nov 29, 2025, 9:06:19?PM
    Author     : rayfa
--%>
<%@page import="java.util.List"%>
<%@page import="model.Penawaran"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="image/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Riwayat Penawaran - TawarinAja</title>
    <style>
        :root { 
            --primary-color: #2E8B57; 
            --secondary-color: #FF6B35; 
            --accent-color: #264653; 
        }
        body { 
            font-family: 'Inter', sans-serif; 
            background: linear-gradient(135deg, #2E8B57 0%, #3CB371 100%); 
            min-height: 100vh; color: #333; 
        }
        .navbar-brand { 
            font-family: 'Playfair Display', serif; 
            font-weight: 700; font-size: 1.8rem; 
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
        .bid-card { border: none; border-radius: 15px; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08); margin-bottom: 1.5rem; transition: transform 0.3s ease; }
        .bid-card:hover { transform: translateY(-5px); }
        .status-badge { padding: 8px 16px; border-radius: 20px; font-weight: 600; font-size: 0.9rem; }
        .status-menang { background: linear-gradient(45deg, #00b894, #00a085); color: white; }
        .status-dibayar { background: linear-gradient(45deg, #0984e3, #0767b3); color: white; }
        .status-kalah { background: #95a5a6; color: white; }
        .status-aktif { background: linear-gradient(45deg, #fdcb6e, #e17055); color: white; }
        .btn-pay { background: linear-gradient(45deg, #FF6B35, #FF8E53); border: none; padding: 8px 20px; border-radius: 20px; color: white; font-weight: 600; text-decoration: none; display: inline-block; transition: all 0.3s ease; }
        .btn-pay:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(255, 107, 53, 0.4); color: white; }
        .price-highlight { font-size: 1.5rem; font-weight: 700; color: var(--primary-color); }
        .time-badge { background: #f8f9fa; color: #666; padding: 6px 12px; border-radius: 15px; font-size: 0.8rem; font-weight: 600; }
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
                <a href="${pageContext.request.contextPath}/ListBarangServlet" class="btn btn-outline-primary btn-sm">
                    <i class="fas fa-home me-1"></i>Kembali ke Home
                </a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="history-card">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0" style="font-family: 'Inter', sans-serif; font-weight: 700; color: var(--accent-color);">
                    <i class="fas fa-history me-2"></i>Riwayat Penawaran
                </h2>
                <div>
                    <a href="${pageContext.request.contextPath}/cekPemenang" class="btn btn-outline-primary me-2">
                        <i class="fas fa-sync-alt me-2"></i>Cek Kemenangan
                    </a>
                    <a href="historyPembelian.jsp" class="btn btn-outline-primary">
                        <i class="fas fa-shopping-bag me-2"></i>Lihat Pembelian
                    </a>
                </div>
            </div>

            <%
                List<Penawaran> list = (List<Penawaran>) session.getAttribute("riwayatTawaran");
            %>

            <% if (list == null || list.isEmpty()) { %>
            <div class="text-center py-5">
                <i class="fas fa-inbox fa-4x text-muted mb-3"></i>
                <h4 class="text-muted">Belum Ada Penawaran</h4>
                <p class="text-muted">Mulai ajukan penawaran pada barang lelang yang tersedia</p>
                <a href="${pageContext.request.contextPath}/ListBarangServlet" class="btn btn-primary">
                    <i class="fas fa-shopping-bag me-2"></i>Jelajahi Barang Lelang
                </a>
            </div>
            <% } else { %>
                <div class="row">
                    <% for (Penawaran p : list) { 
                        String statusClass = "status-aktif";
                        if ("MENANG".equals(p.getStatus())) {
                            statusClass = "status-menang";
                        } else if ("DIBAYAR".equals(p.getStatus())) {
                            statusClass = "status-dibayar";
                        } else if ("KALAH".equals(p.getStatus())) {
                            statusClass = "status-kalah";
                        }
                    %>
                    <div class="col-lg-6 mb-4">
                        <div class="card bid-card">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <div>
                                        <h6 class="card-title mb-1">ID Penawaran: #<%=p.getId()%></h6>
                                        <p class="text-muted small mb-0">ID Barang: #<%=p.getBarangId()%></p>
                                    </div>
                                    <span class="status-badge <%= statusClass %>">
                                        <%=p.getStatus() != null ? p.getStatus() : "AKTIF"%>
                                    </span>
                                </div>
                                
                                <div class="price-highlight mb-3">
                                    Rp <%= String.format("%,.0f", p.getAmount()) %>
                                </div>
                                
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <span class="time-badge">
                                        <i class="fas fa-clock me-1"></i>
                                        <%= new java.util.Date().toString() %>
                                    </span>
                                </div>

                                <% if ("MENANG".equals(p.getStatus())) { %>
                                    <a class="btn-pay w-100 text-center" 
                                       href="${pageContext.request.contextPath}/pembayaran.jsp?id=<%=p.getId()%>">
                                        <i class="fas fa-credit-card me-2"></i>Bayar Sekarang
                                    </a>
                                <% } else if ("DIBAYAR".equals(p.getStatus())) { %>
                                    <div class="text-center">
                                        <i class="fas fa-check-circle text-success me-2"></i>
                                        <span class="text-success fw-bold">Pembayaran Selesai</span>
                                    </div>
                                <% } else if ("KALAH".equals(p.getStatus())) { %>
                                    <div class="text-center">
                                        <i class="fas fa-times-circle text-secondary me-2"></i>
                                        <span class="text-secondary">Penawaran tidak berhasil</span>
                                    </div>
                                <% } else { %>
                                    <div class="text-center">
                                        <i class="fas fa-hourglass-half text-warning me-2"></i>
                                        <span class="text-warning">Menunggu hasil lelang</span>
                                    </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
                
                <!-- Statistics -->
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card border-0 bg-light">
                            <div class="card-body">
                                <div class="row text-center">
                                    <div class="col-md-3">
                                        <h4 class="text-primary"><%= list.size() %></h4>
                                        <small class="text-muted">Total Penawaran</small>
                                    </div>
                                    <div class="col-md-3">
                                        <h4 class="text-success">
                                            <%= list.stream().filter(p -> "MENANG".equals(p.getStatus())).count() %>
                                        </h4>
                                        <small class="text-muted">Menang</small>
                                    </div>
                                    <div class="col-md-3">
                                        <h4 class="text-warning">
                                            <%= list.stream().filter(p -> p.getStatus() == null || "AKTIF".equals(p.getStatus())).count() %>
                                        </h4>
                                        <small class="text-muted">Aktif</small>
                                    </div>
                                    <div class="col-md-3">
                                        <h4 class="text-secondary">
                                            <%= list.stream().filter(p -> "KALAH".equals(p.getStatus())).count() %>
                                        </h4>
                                        <small class="text-muted">Tidak Berhasil</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>

    <!-- POPUP LOGIC -->
    <%
    // LOGIKA POPUP YANG DIPERBAIKI
    Boolean globalPopup = (Boolean) request.getAttribute("globalPopup");
    Boolean sessionPopup = (Boolean) session.getAttribute("showWinPopup");
    Integer popupWinnerId = (Integer) request.getAttribute("globalPopupWinnerId");

    if (popupWinnerId == null) {
        popupWinnerId = (Integer) session.getAttribute("popupWinnerId");
    }

    boolean shouldShowPopup = (globalPopup != null && globalPopup) || 
                            (sessionPopup != null && sessionPopup);

    if (shouldShowPopup && popupWinnerId != null) {
        session.removeAttribute("showWinPopup");
        session.removeAttribute("popupWinnerId");
    %>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        Swal.fire({
            title: "? Selamat!",
            html: "<b>Kamu memenangkan lelang!</b><br>Segera lakukan pembayaran untuk mendapatkan barang.",
            icon: "success",
            confirmButtonText: "Lihat Riwayat",
            confirmButtonColor: "#2E8B57",
            background: '#ffffff',
            allowOutsideClick: false,
            allowEscapeKey: false,
            customClass: {
                popup: 'rounded-3'
            }
        }).then((result) => {
            // Redirect ke halaman yang sama untuk refresh data
            window.location.href = "riwayatTawar?refresh=" + new Date().getTime();
        });
    
        // OPSIONAL: Auto close setelah 5 detik
        setTimeout(() => {
            if (Swal.isVisible()) {
                Swal.close();
                window.location.href = "riwayatTawar?refresh=" + new Date().getTime();
            }
        }, 5000);
    });
    </script>
    <%
    }
    %>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>