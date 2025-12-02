<%-- 
    Document   : detailBarang
    Created on : Nov 29, 2025, 9:05:15 PM
    Author     : rayfa
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.Barang"%>
<%
    Barang b = (Barang) request.getAttribute("barang");
    long now = System.currentTimeMillis();
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="image/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <title>Detail Barang - TawarinAja</title>
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
        
        .detail-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
            padding: 2rem;
        }
        
        .countdown-timer {
            background: linear-gradient(45deg, #FF6B35, #FF8E53);
            color: white;
            padding: 1rem;
            border-radius: 10px;
            text-align: center;
            font-weight: 600;
            font-size: 1.2rem;
        }
        
        .btn-primary-custom {
            background: linear-gradient(45deg, var(--primary-color), #4CAF50);
            border: none;
            padding: 12px 35px;
            border-radius: 50px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }
        
        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 139, 87, 0.4);
            color: white;
        }
        
        .btn-outline-custom {
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
            padding: 10px 25px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-outline-custom:hover {
            background-color: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }
        
        .price-tag {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .form-control-custom {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 12px 15px;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }
        
        .form-control-custom:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(46, 139, 87, 0.25);
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
        </div>
    </nav>

    <div class="container">
        <div class="detail-card">
            <div class="row">
                <div class="col-lg-8">
                    <h1 class="mb-4" style="font-family: 'Playfair Display', serif; color: var(--accent-color);">
                        <%= b.getTitle() %>
                    </h1>
                    
                    <div class="mb-4">
                        <h5>Deskripsi Barang</h5>
                        <p class="text-muted"><%= b.getDescription() %></p>
                    </div>
                    
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="card bg-light border-0">
                                <div class="card-body">
                                    <h6 class="card-title text-muted">Harga Awal</h6>
                                    <div class="price-tag">Rp <%= b.getInitialPrice() %></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <div class="countdown-timer mb-4">
                        <i class="fas fa-clock me-2"></i>
                        <span id="countdown">Memuat...</span>
                    </div>
                    
                    <div class="card shadow-sm border-0">
                        <div class="card-body">
                            <h5 class="card-title">Ajukan Penawaran</h5>
                            <form action="${pageContext.request.contextPath}/tawar" method="post" id="tawarForm">
                                <input type="hidden" name="id" value="<%= b.getId() %>">
                                <div class="mb-3">
                                    <label for="hargaInput" class="form-label">Masukkan Harga Tawaran</label>
                                    <input type="number" name="harga" class="form-control form-control-custom" 
                                           id="hargaInput" required min="<%= b.getInitialPrice() + 1 %>"
                                           placeholder="Rp">
                                </div>
                                <button id="btnTawar" type="submit" class="btn btn-primary-custom w-100">
                                    <i class="fas fa-gavel me-2"></i>Ajukan Tawaran
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="mt-4">
                <a href="${pageContext.request.contextPath}/ListBarangServlet" class="btn btn-outline-custom">
                    <i class="fas fa-arrow-left me-2"></i>Kembali ke Daftar Barang
                </a>
            </div>
        </div>
    </div>

    <script>
        var endTime = <%= b.getEndTime() %>;
        function updateCountdown() {
            var now = Date.now();
            var dist = endTime - now;
            
            if (dist <= 0) {
                document.getElementById('countdown').innerHTML = "<i class='fas fa-flag-checkered me-2'></i>Lelang Selesai";
                var btn = document.getElementById('btnTawar');
                if (btn) {
                    btn.disabled = true;
                    btn.innerHTML = "<i class='fas fa-ban me-2'></i>Lelang Telah Berakhir";
                    btn.classList.remove('btn-primary-custom');
                    btn.classList.add('btn-secondary');
                }
                return;
            }
            
            var hours = Math.floor(dist / (1000 * 60 * 60));
            var minutes = Math.floor((dist % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((dist % (1000 * 60)) / 1000);
            
            var timeString = "";
            if (hours > 0) {
                timeString += hours + " jam ";
            }
            timeString += minutes + " menit " + seconds + " detik";
            
            document.getElementById('countdown').innerHTML = "<i class='fas fa-clock me-2'></i>" + timeString;
        }
        
        setInterval(updateCountdown, 1000);
        updateCountdown();
        
        // Set minimum bid value
        document.getElementById('hargaInput').min = <%= b.getInitialPrice() + 1 %>;
        document.getElementById('hargaInput').placeholder = "Rp " + (<%= b.getInitialPrice() + 1 %>).toLocaleString();
    </script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>