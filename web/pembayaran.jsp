<%-- 
    Document   : pembayaran
    Created on : Nov 30, 2025, 12:22:10?AM
    Author     : rayfa
--%>

<%@page import="model.Penawaran"%>
<%
    // PERBAIKAN LOGIKA: Validasi parameter dan session
    String idParam = request.getParameter("id");
    if (idParam == null) {
        response.sendRedirect("riwayatTawar");
        return;
    }
    
    int id = Integer.parseInt(idParam);
    
    // You might want to validate if this bidding ID belongs to the current user
    // and if the status is "MENANG"
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="image/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <title>Pembayaran - TawarinAja</title>
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
        
        .payment-card {
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
        
        .payment-info-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: none;
            margin-bottom: 2rem;
        }
        
        .security-badge {
            background: linear-gradient(45deg, #00b894, #00a085);
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
        }
        
        .bank-option {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 1rem;
            margin-bottom: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .bank-option:hover {
            border-color: var(--primary-color);
        }
        
        .bank-option.selected {
            border-color: var(--primary-color);
            background-color: rgba(46, 139, 87, 0.05);
        }
        
        .bank-logo {
            width: 40px;
            height: 40px;
            background: #f8f9fa;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: var(--primary-color);
            margin-right: 1rem;
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
                <span class="security-badge">
                    <i class="fas fa-lock me-1"></i>Pembayaran Aman
                </span>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="payment-card">
            <div class="row">
                <div class="col-lg-8">
                    <h2 class="mb-4" style="font-family: 'Playfair Display', serif; color: var(--accent-color);">
                        <i class="fas fa-credit-card me-2"></i>Pembayaran
                    </h2>
                    
                    <!-- Informasi Pembayaran -->
                    <div class="payment-info-card">
                        <h5 class="mb-3" style="color: var(--accent-color);">
                            <i class="fas fa-info-circle me-2"></i>Informasi Pembayaran
                        </h5>
                        <p><strong>ID Penawaran:</strong> #<%= id %></p>
                        <p class="text-muted">Silakan lengkapi informasi pembayaran di bawah ini</p>
                    </div>
                    
                    <form action="${pageContext.request.contextPath}/pembayaran" method="post" id="paymentForm">
                        <input type="hidden" name="id" value="<%= id %>">
                        
                        <!-- Informasi Penerima -->
                        <div class="payment-info-card">
                            <h5 class="mb-3" style="color: var(--accent-color);">
                                <i class="fas fa-user me-2"></i>Informasi Penerima
                            </h5>
                            <div class="mb-3">
                                <label class="form-label">Nama Penerima</label>
                                <input type="text" name="nama" class="form-control form-control-custom" 
                                       placeholder="Masukkan nama lengkap penerima" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nomor Telepon</label>
                                <input type="tel" name="telepon" class="form-control form-control-custom" 
                                       placeholder="Contoh: 081234567890" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Alamat Pengiriman</label>
                                <textarea name="alamat" class="form-control form-control-custom" 
                                          rows="4" placeholder="Masukkan alamat lengkap untuk pengiriman..." 
                                          required></textarea>
                            </div>
                        </div>
                        
                        <!-- Metode Pembayaran -->
                        <div class="payment-info-card">
                            <h5 class="mb-3" style="color: var(--accent-color);">
                                <i class="fas fa-wallet me-2"></i>Metode Pembayaran
                            </h5>
                            
                            <div class="bank-option" onclick="selectBank('bca')">
                                <div class="d-flex align-items-center">
                                    <div class="bank-logo">BCA</div>
                                    <div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="metode" 
                                                   id="bca" value="Transfer Bank BCA" required>
                                            <label class="form-check-label" for="bca">
                                                <strong>Bank Central Asia (BCA)</strong>
                                            </label>
                                        </div>
                                        <small class="text-muted">Transfer Bank - BCA</small>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="bank-option" onclick="selectBank('bni')">
                                <div class="d-flex align-items-center">
                                    <div class="bank-logo">BNI</div>
                                    <div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="metode" 
                                                   id="bni" value="Transfer Bank BNI">
                                            <label class="form-check-label" for="bni">
                                                <strong>Bank Negara Indonesia (BNI)</strong>
                                            </label>
                                        </div>
                                        <small class="text-muted">Transfer Bank - BNI</small>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="bank-option" onclick="selectBank('mandiri')">
                                <div class="d-flex align-items-center">
                                    <div class="bank-logo">MDR</div>
                                    <div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="metode" 
                                                   id="mandiri" value="Transfer Bank Mandiri">
                                            <label class="form-check-label" for="mandiri">
                                                <strong>Bank Mandiri</strong>
                                            </label>
                                        </div>
                                        <small class="text-muted">Transfer Bank - Mandiri</small>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="bank-option" onclick="selectBank('gopay')">
                                <div class="d-flex align-items-center">
                                    <div class="bank-logo" style="background: #00AA13; color: white;">G</div>
                                    <div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="metode" 
                                                   id="gopay" value="Gopay">
                                            <label class="form-check-label" for="gopay">
                                                <strong>Gopay</strong>
                                            </label>
                                        </div>
                                        <small class="text-muted">E-Wallet - Gopay</small>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="bank-option" onclick="selectBank('ovo')">
                                <div class="d-flex align-items-center">
                                    <div class="bank-logo" style="background: #673AB7; color: white;">O</div>
                                    <div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="metode" 
                                                   id="ovo" value="OVO">
                                            <label class="form-check-label" for="ovo">
                                                <strong>OVO</strong>
                                            </label>
                                        </div>
                                        <small class="text-muted">E-Wallet - OVO</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Catatan -->
                        <div class="payment-info-card">
                            <h5 class="mb-3" style="color: var(--accent-color);">
                                <i class="fas fa-sticky-note me-2"></i>Catatan (Opsional)
                            </h5>
                            <textarea name="catatan" class="form-control form-control-custom" 
                                      rows="3" placeholder="Tambahkan catatan untuk penjual..."></textarea>
                        </div>
                        
                        <div class="d-flex gap-3">
                            <button type="submit" class="btn btn-primary-custom">
                                <i class="fas fa-lock me-2"></i>Bayar Sekarang
                            </button>
                            <a href="${pageContext.request.contextPath}/riwayatTawar" class="btn btn-outline-custom">
                                <i class="fas fa-arrow-left me-2"></i>Kembali
                            </a>
                        </div>
                    </form>
                </div>
                
                <div class="col-lg-4">
                    <!-- Panduan Pembayaran -->
                    <div class="payment-info-card sticky-top" style="top: 2rem;">
                        <h5 class="mb-3" style="color: var(--accent-color);">
                            <i class="fas fa-question-circle me-2"></i>Panduan Pembayaran
                        </h5>
                        
                        <div class="mb-3">
                            <h6>Transfer Bank</h6>
                            <ol class="small text-muted">
                                <li>Pilih metode transfer bank</li>
                                <li>Salin nomor rekening virtual account</li>
                                <li>Transfer sesuai nominal yang tertera</li>
                                <li>Pembayaran akan diverifikasi otomatis</li>
                            </ol>
                        </div>
                        
                        <div class="mb-3">
                            <h6>E-Wallet</h6>
                            <ol class="small text-muted">
                                <li>Pilih metode e-wallet</li>
                                <li>Scan QR code atau masuk ke aplikasi</li>
                                <li>Bayar sesuai nominal yang tertera</li>
                                <li>Pembayaran akan diverifikasi otomatis</li>
                            </ol>
                        </div>
                        
                        <div class="alert alert-warning small">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            <strong>Penting:</strong> Selesaikan pembayaran dalam 24 jam untuk menghindari pembatalan.
                        </div>
                        
                        <div class="text-center">
                            <small class="text-muted">
                                <i class="fas fa-shield-alt me-1"></i>
                                Transaksi Anda dilindungi sistem keamanan
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function selectBank(bank) {
            // Remove selected class from all bank options
            document.querySelectorAll('.bank-option').forEach(function(el) {
                el.classList.remove('selected');
            });
            
            // Add selected class to clicked bank option
            event.currentTarget.classList.add('selected');
            
            // Check the corresponding radio button
            document.getElementById(bank).checked = true;
        }
        
        // Auto-select first bank option
        document.addEventListener('DOMContentLoaded', function() {
            const firstBank = document.querySelector('.bank-option');
            if (firstBank) {
                firstBank.classList.add('selected');
                const firstRadio = firstBank.querySelector('input[type="radio"]');
                if (firstRadio) {
                    firstRadio.checked = true;
                }
            }
        });
    </script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>