<%-- 
    Document   : SelectRole
    Created on : Nov 29, 2025, 8:32:31 PM
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
    <title>Pilih Peran - TawarinAja</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            color: #333;
        }
        
        .role-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 3rem;
            max-width: 800px;
            width: 100%;
        }
        
        .brand-logo {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .brand-logo img {
            height: 150px;
        }
        
        .role-option {
            border: 2px solid #e9ecef;
            border-radius: 15px;
            padding: 2.5rem;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            height: 100%;
            background: white;
        }
        
        .role-option:hover {
            border-color: var(--primary-color);
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .role-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }
        
        .role-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--accent-color);
            margin-bottom: 1rem;
        }
        
        .role-description {
            color: #666;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }
        
        .btn-role {
            background: linear-gradient(45deg, var(--primary-color), #4CAF50);
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
            width: 100%;
        }
        
        .btn-role:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 139, 87, 0.4);
            color: white;
        }
        
        .btn-role-seller {
            background: linear-gradient(45deg, #FF6B35, #FF8E53);
        }
        
        .btn-role-seller:hover {
            box-shadow: 0 5px 15px rgba(255, 107, 53, 0.4);
        }
        
        .feature-list {
            text-align: left;
            margin-top: 1.5rem;
        }
        
        .feature-list li {
            margin-bottom: 0.5rem;
            color: #666;
        }
        
        .feature-list i {
            color: var(--primary-color);
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="container-fluid d-flex justify-content-center">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="role-card">
                    <div class="brand-logo">
                        <img src="image/logo2.png" alt="TawarinAja">
                    </div>
                                        
                    <h2 class="text-center mb-5" style="color: var(--accent-color);">
                        Pilih Peran Anda
                    </h2>
                    
                    <form action="SelectRoleServlet" method="post">
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <div class="role-option" onclick="document.querySelector('input[name=role][value=buyer]').checked = true;">
                                    <div class="role-icon">
                                        <i class="fas fa-shopping-cart"></i>
                                    </div>
                                    <div class="role-title">Pembeli</div>
                                    <div class="role-description">
                                        Masuk sebagai pembeli untuk menawar dan membeli barang lelang
                                    </div>
                                    <ul class="feature-list">
                                        <li><i class="fas fa-check"></i> Lihat barang lelang</li>
                                        <li><i class="fas fa-check"></i> Ajukan penawaran</li>
                                        <li><i class="fas fa-check"></i> Pantau riwayat tawar</li>
                                        <li><i class="fas fa-check"></i> Beli barang pemenang</li>
                                    </ul>
                                    <button type="submit" name="role" value="buyer" class="btn btn-role mt-3">
                                        <i class="fas fa-user me-2"></i>Masuk sebagai Pembeli
                                    </button>
                                </div>
                            </div>
                            
                            <div class="col-md-6 mb-4">
                                <div class="role-option" onclick="document.querySelector('input[name=role][value=seller]').checked = true;">
                                    <div class="role-icon">
                                        <i class="fas fa-store"></i>
                                    </div>
                                    <div class="role-title">Penjual</div>
                                    <div class="role-description">
                                        Masuk sebagai penjual untuk mengelola dan menjual barang lelang
                                    </div>
                                    <ul class="feature-list">
                                        <li><i class="fas fa-check"></i> Tambah barang lelang</li>
                                        <li><i class="fas fa-check"></i> Kelola barang aktif</li>
                                        <li><i class="fas fa-check"></i> Pantau penawaran</li>
                                        <li><i class="fas fa-check"></i> Lihat riwayat penjualan</li>
                                    </ul>
                                    <button type="submit" name="role" value="seller" class="btn btn-role btn-role-seller mt-3">
                                        <i class="fas fa-user-tie me-2"></i>Masuk sebagai Penjual
                                    </button>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Hidden radio buttons for form submission -->
                        <input type="radio" name="role" value="buyer" style="display: none;" checked>
                        <input type="radio" name="role" value="seller" style="display: none;">
                    </form>
                    
                    <div class="text-center mt-4">
                        <p class="text-muted">
                            Bingung memilih? 
                            <a href="${pageContext.request.contextPath}/ListBarangServlet" 
                               style="color: var(--primary-color); text-decoration: none; font-weight: 600;">
                                Jelajahi dulu sebagai tamu
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>