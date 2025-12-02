<%-- 
    Document   : index
    Created on : Nov 23, 2025, 8:16:29 PM
    Author     : rayfa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="image/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <title>TawarinAja - Lelang Online Terpercaya</title>
    <style>
        :root {
            --primary-color: #2E8B57;
            --secondary-color: #FF6B35;
            --accent-color: #264653;
            --light-bg: #f8f9fa;
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
        
        .hero-section {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
            padding: 3rem;
        }
        
        h1 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: var(--accent-color);
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        
        .slogan {
            font-family: 'Inter', sans-serif;
            font-weight: 600;
            color: var(--secondary-color);
            font-size: 1.4rem;
            margin-bottom: 2rem;
            border-left: 4px solid var(--secondary-color);
            padding-left: 1rem;
        }
        
        .feature-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease;
            height: 100%;
            border: none;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
        }
        
        .feature-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
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
            padding: 12px 35px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .btn-outline-custom:hover {
            background-color: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }
        
        .stats-section {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 2rem;
            margin-top: 3rem;
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .stat-label {
            font-size: 1rem;
            color: #666;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .footer {
            background: var(--accent-color);
            color: white;
            padding: 2rem 0;
            margin-top: 4rem;
            border-radius: 20px 20px 0 0;
        }
        
        .logo-container {
            text-align: center;
            padding: 2rem;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Beranda</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Lelang Aktif</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Cara Lelang</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Tentang Kami</a>
                    </li>
                    <li class="nav-item ms-2">
                        <a href="login.jsp" class="btn btn-outline-custom">Login</a>
                    </li>
                    <li class="nav-item ms-2">
                        <a href="register.jsp" class="btn btn-primary-custom">Daftar</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="container">
        <div class="hero-section">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1>Selamat Datang di TawarinAja</h1>
                    <p class="slogan">Satu Lelang Dua Kepuasan</p>
                    <p class="lead mb-4">
                        Platform lelang online terpercaya yang menghubungkan penjual dan pembeli 
                        dalam pengalaman lelang digital yang aman, transparan, dan menguntungkan.
                    </p>
                    <div class="d-flex gap-3 flex-wrap">
                        <a href="register.jsp" class="btn btn-primary-custom">Mulai Lelang</a>
                        <a href="#cara-kerja" class="btn btn-outline-custom">Pelajari Cara Kerja</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="logo-container">
                        <img src="image/logo2.png" class="img-fluid" alt="TawarinAja Logo" style="max-height: 300px;">
                        <p class="mt-3 text-muted">Platform Lelang Online</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Stats Section -->
        <div class="stats-section">
            <div class="row text-center">
                <div class="col-md-3 col-6 mb-3">
                    <div class="stat-number">500+</div>
                    <div class="stat-label">Lelang Aktif</div>
                </div>
                <div class="col-md-3 col-6 mb-3">
                    <div class="stat-number">10K+</div>
                    <div class="stat-label">Pengguna</div>
                </div>
                <div class="col-md-3 col-6 mb-3">
                    <div class="stat-number">95%</div>
                    <div class="stat-label">Kepuasan</div>
                </div>
                <div class="col-md-3 col-6 mb-3">
                    <div class="stat-number">24/7</div>
                    <div class="stat-label">Support</div>
                </div>
            </div>
        </div>

        <!-- Features Section -->
        <div class="row mt-5" id="cara-kerja">
            <div class="col-12 text-center mb-5">
                <h2>Mengapa Memilih TawarinAja?</h2>
                <p class="text-muted">Platform lelang modern dengan fitur terbaik</p>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="feature-card">
                    <div class="feature-icon">⚡</div>
                    <h4>Lelang Real-time</h4>
                    <p>Sistem bidding real-time dengan notifikasi instan untuk setiap penawaran baru</p>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="feature-card">
                    <div class="feature-icon">🛡️</div>
                    <h4>Aman & Terpercaya</h4>
                    <p>Transaksi aman dengan sistem verifikasi dan escrow untuk melindungi semua pihak</p>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="feature-card">
                    <div class="feature-icon">📱</div>
                    <h4>User Friendly</h4>
                    <p>Antarmuka yang intuitif dan mudah digunakan untuk semua kalangan</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>TawarinAja</h5>
                    <p>Platform lelang online terpercaya yang menghubungkan penjual dan pembeli dengan sistem yang aman dan transparan.</p>
                </div>
                <div class="col-md-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-light">Tentang Kami</a></li>
                        <li><a href="#" class="text-light">Syarat & Ketentuan</a></li>
                        <li><a href="#" class="text-light">Kebijakan Privasi</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>Kontak</h5>
                    <ul class="list-unstyled">
                        <li>Email: info@tawarinaja.com</li>
                        <li>Telepon: 0888 yang lain kapan2 cihuy!</li>
                    </ul>
                </div>
            </div>
            <hr class="my-4 bg-light">
            <div class="text-center">
                <p>&copy; 2024 TawarinAja. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>