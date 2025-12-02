<%-- 
    Document   : DashboardSeller
    Created on : Nov 30, 2025, 3:39:03 PM
    Author     : MSii
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="image/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <title>Dashboard Penjual - TawarinAja</title>
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
        
        .dashboard-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
            padding: 3rem;
        }
        
        .stats-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: none;
            transition: transform 0.3s ease;
            height: 100%;
        }
        
        .stats-card:hover {
            transform: translateY(-5px);
        }
        
        .stats-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .stats-number {
            font-size: 2rem;
            font-weight: 700;
            color: var(--accent-color);
            margin-bottom: 0.5rem;
        }
        
        .stats-label {
            color: #666;
            font-weight: 600;
        }
        
        .quick-action-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: none;
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .quick-action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
        
        .action-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .btn-primary-custom {
            background: linear-gradient(45deg, var(--primary-color), #4CAF50);
            border: none;
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
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
        
        .welcome-section {
            background: linear-gradient(135deg, var(--primary-color), #4CAF50);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
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
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-user-circle me-1"></i>Penjual
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="profilPenjual.jsp"><i class="fas fa-user me-2"></i>Profil</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="index.jsp"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="dashboard-card">
            <!-- Welcome Section -->
            <div class="welcome-section">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h2 style="font-family: 'Playfair Display', serif; margin-bottom: 0.5rem;">
                            <i class="fas fa-store me-2"></i>Dashboard Penjual
                        </h2>
                        <p class="mb-0" style="font-size: 1.1rem; opacity: 0.9;">
                            Selamat datang! Kelola barang lelang dan pantau penjualan Anda di sini.
                        </p>
                    </div>
                    <div class="col-md-4 text-end">
                        <a href="tambahBarang.jsp" class="btn btn-light btn-lg">
                            <i class="fas fa-plus me-2"></i>Tambah Barang
                        </a>
                    </div>
                </div>
            </div>

            <!-- Stats Section -->
            <div class="row mb-5">
                <div class="col-md-3 mb-4">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="fas fa-cube"></i>
                        </div>
                        <div class="stats-number">12</div>
                        <div class="stats-label">Barang Aktif</div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="fas fa-gavel"></i>
                        </div>
                        <div class="stats-number">8</div>
                        <div class="stats-label">Sedang Dilelang</div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <div class="stats-number">24</div>
                        <div class="stats-label">Terjual</div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="stats-number">4.8</div>
                        <div class="stats-label">Rating</div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="row">
                <div class="col-12 mb-4">
                    <h4 style="color: var(--accent-color); font-weight: 600;">
                        <i class="fas fa-bolt me-2"></i>Aksi Cepat
                    </h4>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="quick-action-card text-center">
                        <div class="action-icon">
                            <i class="fas fa-list"></i>
                        </div>
                        <h5>Kelola Barang</h5>
                        <p class="text-muted">Lihat dan kelola semua barang lelang Anda</p>
                        <a href="ListBarangSellerServlet" class="btn btn-primary-custom">
                            <i class="fas fa-arrow-right me-2"></i>Kelola
                        </a>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="quick-action-card text-center">
                        <div class="action-icon">
                            <i class="fas fa-plus-circle"></i>
                        </div>
                        <h5>Tambah Barang</h5>
                        <p class="text-muted">Tambah barang baru untuk dilelang</p>
                        <a href="tambahBarang.jsp" class="btn btn-primary-custom">
                            <i class="fas fa-plus me-2"></i>Tambah
                        </a>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="quick-action-card text-center">
                        <div class="action-icon">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h5>Riwayat Penjualan</h5>
                        <p class="text-muted">Lihat riwayat dan statistik penjualan</p>
                        <a href="riwayatPenjualan.jsp" class="btn btn-primary-custom">
                            <i class="fas fa-chart-bar me-2"></i>Lihat
                        </a>
                    </div>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="row mt-5">
                <div class="col-12">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 style="color: var(--accent-color); font-weight: 600;">
                            <i class="fas fa-clock me-2"></i>Aktivitas Terbaru
                        </h4>
                        <a href="riwayatPenjualan.jsp" class="btn btn-outline-custom btn-sm">
                            Lihat Semua
                        </a>
                    </div>
                    
                    <div class="list-group">
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <div>
                                <i class="fas fa-gavel text-success me-2"></i>
                                <span>Barang "Smartphone XYZ" mendapat tawaran baru - Rp 2.500.000</span>
                            </div>
                            <small class="text-muted">2 jam lalu</small>
                        </div>
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <div>
                                <i class="fas fa-check-circle text-primary me-2"></i>
                                <span>Barang "Laptop Gaming" berhasil terjual</span>
                            </div>
                            <small class="text-muted">1 hari lalu</small>
                        </div>
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <div>
                                <i class="fas fa-plus text-warning me-2"></i>
                                <span>Barang baru "Kamera DSLR" ditambahkan</span>
                            </div>
                            <small class="text-muted">1 hari lalu</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>