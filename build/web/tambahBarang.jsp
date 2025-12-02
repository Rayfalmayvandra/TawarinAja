<%-- 
    Document   : tambahBarang
    Created on : Nov 30, 2025, 3:40:10 PM
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
    <title>Tambah Barang - TawarinAja</title>
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
        
        .form-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
            padding: 3rem;
        }
        
        .form-control-custom {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 12px 15px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control-custom:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(46, 139, 87, 0.25);
        }
        
        .form-label {
            font-weight: 600;
            color: var(--accent-color);
            margin-bottom: 0.5rem;
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
        
        .upload-area {
            border: 2px dashed #dee2e6;
            border-radius: 10px;
            padding: 2rem;
            text-align: center;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }
        
        .upload-area:hover {
            border-color: var(--primary-color);
            background: #f1f3f4;
        }
        
        .upload-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .feature-badge {
            background: linear-gradient(45deg, #FF6B35, #FF8E53);
            color: white;
            padding: 4px 12px;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-left: 10px;
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
                <a class="nav-link" href="ListBarangSellerServlet">
                    <i class="fas fa-cube me-1"></i>Barang Saya
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
        <div class="form-card">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0" style="font-family: 'Playfair Display', serif; color: var(--accent-color);">
                    <i class="fas fa-plus-circle me-2"></i>Tambah Barang Lelang
                </h2>
                <a href="ListBarangSellerServlet" class="btn btn-outline-custom">
                    <i class="fas fa-arrow-left me-1"></i>Kembali
                </a>
            </div>

            <form action="tambahBarangServlet" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Basic Information -->
                        <div class="card border-0 shadow-sm mb-4">
                            <div class="card-header bg-transparent border-0">
                                <h5 class="mb-0" style="color: var(--accent-color);">
                                    <i class="fas fa-info-circle me-2"></i>Informasi Dasar
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="title" class="form-label">Nama Barang</label>
                                    <input type="text" name="title" class="form-control form-control-custom" 
                                           id="title" placeholder="Contoh: Smartphone XYZ 128GB" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="description" class="form-label">Deskripsi Barang</label>
                                    <textarea name="description" class="form-control form-control-custom" 
                                              id="description" rows="4" 
                                              placeholder="Jelaskan detail kondisi, spesifikasi, dan keunggulan barang..." 
                                              required></textarea>
                                    <div class="form-text">Deskripsi yang detail akan menarik lebih banyak pembeli.</div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="price" class="form-label">Harga Awal</label>
                                            <div class="input-group">
                                                <span class="input-group-text">Rp</span>
                                                <input type="number" name="price" class="form-control form-control-custom" 
                                                       id="price" placeholder="0" required min="1000">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="category" class="form-label">Kategori</label>
                                            <select name="category" class="form-control form-control-custom" id="category" required>
                                                <option value="">Pilih Kategori</option>
                                                <option value="elektronik">Elektronik</option>
                                                <option value="fashion">Fashion</option>
                                                <option value="otomotif">Otomotif</option>
                                                <option value="rumah-tangga">Rumah Tangga</option>
                                                <option value="hobi">Hobi & Koleksi</option>
                                                <option value="lainnya">Lainnya</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Auction Settings -->
                        <div class="card border-0 shadow-sm mb-4">
                            <div class="card-header bg-transparent border-0">
                                <h5 class="mb-0" style="color: var(--accent-color);">
                                    <i class="fas fa-gavel me-2"></i>Pengaturan Lelang
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="duration" class="form-label">Durasi Lelang</label>
                                            <select name="duration" class="form-control form-control-custom" id="duration" required>
                                                <option value="1">1 Hari</option>
                                                <option value="3" selected>3 Hari</option>
                                                <option value="7">7 Hari</option>
                                                <option value="14">14 Hari</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="minBid" class="form-label">Kenaikan Minimum Bid</label>
                                            <div class="input-group">
                                                <span class="input-group-text">Rp</span>
                                                <input type="number" name="minBid" class="form-control form-control-custom" 
                                                       id="minBid" value="10000" min="1000">
                                            </div>
                                            <div class="form-text">Harga minimal penawaran berikutnya</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4">
                        <!-- Image Upload -->
                        <div class="card border-0 shadow-sm mb-4">
                            <div class="card-header bg-transparent border-0">
                                <h5 class="mb-0" style="color: var(--accent-color);">
                                    <i class="fas fa-images me-2"></i>Gambar Barang
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="upload-area">
                                    <div class="upload-icon">
                                        <i class="fas fa-cloud-upload-alt"></i>
                                    </div>
                                    <h6>Upload Gambar Barang</h6>
                                    <p class="text-muted small">Drag & drop atau klik untuk memilih file</p>
                                    <input type="file" name="images" class="d-none" id="imageUpload" multiple accept="image/*">
                                    <button type="button" class="btn btn-outline-custom btn-sm" onclick="document.getElementById('imageUpload').click()">
                                        <i class="fas fa-folder-open me-1"></i>Pilih File
                                    </button>
                                </div>
                                <div class="form-text mt-2">Format: JPG, PNG, GIF. Maksimal 5MB per gambar.</div>
                            </div>
                        </div>

                        <!-- Preview & Submit -->
                        <div class="card border-0 shadow-sm">
                            <div class="card-header bg-transparent border-0">
                                <h5 class="mb-0" style="color: var(--accent-color);">
                                    <i class="fas fa-rocket me-2"></i>Publikasi
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="featured" name="featured">
                                        <label class="form-check-label" for="featured">
                                            Jadikan Featured 
                                            <span class="feature-badge">PRO</span>
                                        </label>
                                    </div>
                                    <div class="form-text">Barang akan ditampilkan di halaman utama</div>
                                </div>
                                
                                <div class="mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="instantBuy" name="instantBuy">
                                        <label class="form-check-label" for="instantBuy">
                                            Aktifkan Instant Buy
                                        </label>
                                    </div>
                                    <div class="form-text">Pembeli dapat langsung membeli dengan harga tertentu</div>
                                </div>
                                
                                <hr>
                                
                                <button type="submit" class="btn btn-primary-custom w-100">
                                    <i class="fas fa-paper-plane me-2"></i>Publikasikan Barang
                                </button>
                                
                                <div class="text-center mt-2">
                                    <small class="text-muted">
                                        Dengan mempublikasikan, Anda menyetujui 
                                        <a href="#" style="color: var(--primary-color);">Syarat & Ketentuan</a>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Preview image upload
        document.getElementById('imageUpload').addEventListener('change', function(e) {
            const uploadArea = document.querySelector('.upload-area');
            if (files.length > 0) {
                uploadArea.innerHTML = `
                    <div class="upload-icon text-success">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <h6>${files.length} file dipilih</h6>
                    <p class="text-muted small">Gambar siap diupload</p>
                    <button type="button" class="btn btn-outline-custom btn-sm" onclick="document.getElementById('imageUpload').click()">
                        <i class="fas fa-sync me-1"></i>Ubah File
                    </button>
                `;
            }
        });
    </script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>