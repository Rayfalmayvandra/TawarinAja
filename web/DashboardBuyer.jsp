<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="image/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <title>Dashboard Pembeli - TawarinAja</title>

    <style>
        :root {
            --primary-color: #2E8B57;
            --accent-color: #264653;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #2E8B57, #3CB371);
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
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            margin-top: 2rem;
            padding: 3rem;
        }

        .stats-card, .quick-action-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s ease;
        }

        .stats-card:hover, .quick-action-card:hover {
            transform: translateY(-5px);
        }

        .stats-icon, .action-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }

        .btn-primary-custom {
            background: linear-gradient(45deg, var(--primary-color), #4CAF50);
            border: none;
            padding: 10px 30px;
            border-radius: 50px;
            color: white;
            font-weight: 600;
            text-decoration: none;
        }

        .btn-outline-custom {
            border: 2px solid var(--primary-color);
            padding: 8px 25px;
            border-radius: 50px;
            color: var(--primary-color);
            font-weight: 600;
            text-decoration: none;
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

<!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="DashboardBuyer.jsp">
            <img src="image/logo1.png" alt="TawarinAja" height="40" class="me-2">
            TawarinAja
        </a>

        <div class="navbar-nav ms-auto">
            <div class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                    <i class="fas fa-user-circle me-1"></i>Pembeli
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="profilPembeli.jsp"><i class="fas fa-user me-2"></i>Profil</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-danger" href="index.jsp"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<!-- Dashboard -->
<div class="container">
    <div class="dashboard-card">

        <!-- Welcome -->
        <div class="welcome-section">
            <h2 style="font-family:'Playfair Display',serif;">
                <i class="fas fa-shopping-cart me-2"></i>Dashboard Pembeli
            </h2>
            <p>Jelajahi barang lelang, lakukan bidding, dan pantau aktivitas Anda.</p>
        </div>

        <!-- Stats -->
        <div class="row mb-5">
            <div class="col-md-4 mb-3">
                <div class="stats-card">
                    <i class="fas fa-gavel stats-icon"></i>
                    <div class="stats-number">5</div>
                    <div class="stats-label">Bid Aktif</div>
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <div class="stats-card">
                    <i class="fas fa-heart stats-icon"></i>
                    <div class="stats-number">12</div>
                    <div class="stats-label">Wishlist</div>
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <div class="stats-card">
                    <i class="fas fa-clock stats-icon"></i>
                    <div class="stats-number">3</div>
                    <div class="stats-label">Menunggu Hasil</div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <h4 class="mb-4" style="color:var(--accent-color); font-weight:600;">
            <i class="fas fa-bolt me-2"></i>Aksi Cepat
        </h4>

        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="quick-action-card">
                    <i class="fas fa-search action-icon"></i>
                    <h5>Jelajahi Lelang</h5>
                    <p class="text-muted">Cari barang menarik untuk dibid</p>
                    <a href="ListBarangServlet" class="btn btn-primary-custom">Lihat Barang</a>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="quick-action-card">
                    <i class="fas fa-history action-icon"></i>
                    <h5>Riwayat Bid</h5>
                    <p class="text-muted">Pantau semua aktivitas bidding</p>
                    <a href="riwayatBid.jsp" class="btn btn-primary-custom">Riwayat</a>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="quick-action-card">
                    <i class="fas fa-heart action-icon"></i>
                    <h5>Wishlist Saya</h5>
                    <p class="text-muted">Barang favorit yang ingin Anda menangkan</p>
                    <a href="wishlist.jsp" class="btn btn-primary-custom">Wishlist</a>
                </div>
            </div>
        </div>

        <!-- Recent Activity -->
        <div class="mt-5">
            <div class="d-flex justify-content-between mb-3">
                <h4 style="color:var(--accent-color); font-weight:600;">
                    <i class="fas fa-clock me-2"></i>Aktivitas Terbaru
                </h4>
                <a href="riwayatBid.jsp" class="btn btn-outline-custom btn-sm">Lihat Semua</a>
            </div>

            <div class="list-group">
                <div class="list-group-item d-flex justify-content-between">
                    <span><i class="fas fa-gavel text-success me-2"></i>Anda mengajukan bid pada "Kamera DSLR"</span>
                    <small class="text-muted">1 jam lalu</small>
                </div>

                <div class="list-group-item d-flex justify-content-between">
                    <span><i class="fas fa-heart text-danger me-2"></i>"Smartphone XYZ" ditambahkan ke wishlist</span>
                    <small class="text-muted">3 jam lalu</small>
                </div>

                <div class="list-group-item d-flex justify-content-between">
                    <span><i class="fas fa-check-circle text-primary me-2"></i>Bid Anda menang pada "Laptop Gaming"</span>
                    <small class="text-muted">1 hari lalu</small>
                </div>
            </div>
        </div>

    </div>
</div>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
