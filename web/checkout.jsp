<%-- 
    Document   : checkout
    Created on : Nov 30, 2025, 1:28:42 AM
    Author     : rayfa
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // PERBAIKAN LOGIKA: Validasi parameter
    String idPenawaranParam = request.getParameter("id");
    String amountParam = request.getParameter("amount");
    
    if (idPenawaranParam == null || amountParam == null) {
        response.sendRedirect("riwayatTawar");
        return;
    }
    
    int idPenawaran = Integer.parseInt(idPenawaranParam);
    double harga = Double.parseDouble(amountParam);
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="image/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <title>Checkout - TawarinAja</title>
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
        
        .checkout-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
            padding: 3rem;
        }
        
        .summary-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: none;
            margin-bottom: 2rem;
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
        
        .price-highlight {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
            text-align: center;
        }
        
        .payment-method {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .payment-method:hover {
            border-color: var(--primary-color);
        }
        
        .payment-method.selected {
            border-color: var(--primary-color);
            background-color: rgba(46, 139, 87, 0.05);
        }
        
        .security-badge {
            background: linear-gradient(45deg, #00b894, #00a085);
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
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
                    <i class="fas fa-lock me-1"></i>Checkout Aman
                </span>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="checkout-card">
            <div class="row">
                <div class="col-lg-8">
                    <h2 class="mb-4" style="font-family: 'Playfair Display', serif; color: var(--accent-color);">
                        <i class="fas fa-shopping-cart me-2"></i>Checkout Pembayaran
                    </h2>
                    
                    <!-- Informasi Pesanan -->
                    <div class="summary-card">
                        <h5 class="mb-3" style="color: var(--accent-color);">
                            <i class="fas fa-receipt me-2"></i>Informasi Pesanan
                        </h5>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>ID Penawaran:</strong> #<%= idPenawaran %></p>
                            </div>
                            <div class="col-md-6 text-end">
                                <div class="price-highlight">Rp <%= String.format("%,.0f", harga) %></div>
                            </div>
                        </div>
                    </div>
                    
                    <form action="checkout" method="post" id="checkoutForm">
                        <input type="hidden" name="idPenawaran" value="<%= idPenawaran %>">
                        <input type="hidden" name="amount" value="<%= harga %>">
                        
                        <!-- Alamat Pengiriman -->
                        <div class="summary-card">
                            <h5 class="mb-3" style="color: var(--accent-color);">
                                <i class="fas fa-truck me-2"></i>Alamat Pengiriman
                            </h5>
                            <div class="mb-3">
                                <label class="form-label">Nama Penerima</label>
                                <input type="text" name="namaPenerima" class="form-control form-control-custom" 
                                       placeholder="Masukkan nama penerima" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nomor Telepon</label>
                                <input type="tel" name="telepon" class="form-control form-control-custom" 
                                       placeholder="Contoh: 081234567890" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Alamat Lengkap</label>
                                <textarea name="alamat" class="form-control form-control-custom" 
                                          rows="4" placeholder="Masukkan alamat lengkap pengiriman..." 
                                          required></textarea>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Kota</label>
                                        <input type="text" name="kota" class="form-control form-control-custom" 
                                               placeholder="Nama kota" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Kode Pos</label>
                                        <input type="text" name="kodePos" class="form-control form-control-custom" 
                                               placeholder="Kode pos" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Metode Pembayaran -->
                        <div class="summary-card">
                            <h5 class="mb-3" style="color: var(--accent-color);">
                                <i class="fas fa-credit-card me-2"></i>Metode Pembayaran
                            </h5>
                            
                            <div class="payment-method" onclick="selectPayment('transfer')">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="metode" 
                                           id="transfer" value="Transfer Bank" required>
                                    <label class="form-check-label" for="transfer">
                                        <strong>Transfer Bank</strong>
                                    </label>
                                </div>
                                <div class="mt-2">
                                    <small class="text-muted">
                                        <i class="fas fa-university me-1"></i>
                                        BCA, BNI, Mandiri, BRI, dan bank lainnya
                                    </small>
                                </div>
                            </div>
                            
                            <div class="payment-method" onclick="selectPayment('ewallet')">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="metode" 
                                           id="ewallet" value="E-Wallet">
                                    <label class="form-check-label" for="ewallet">
                                        <strong>E-Wallet</strong>
                                    </label>
                                </div>
                                <div class="mt-2">
                                    <small class="text-muted">
                                        <i class="fas fa-mobile-alt me-1"></i>
                                        Gopay, OVO, Dana, LinkAja
                                    </small>
                                </div>
                            </div>
                            
                            <div class="payment-method" onclick="selectPayment('cod')">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="metode" 
                                           id="cod" value="COD">
                                    <label class="form-check-label" for="cod">
                                        <strong>Cash on Delivery (COD)</strong>
                                    </label>
                                </div>
                                <div class="mt-2">
                                    <small class="text-muted">
                                        <i class="fas fa-money-bill-wave me-1"></i>
                                        Bayar ketika barang diterima (tambahan biaya administrasi)
                                    </small>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Catatan -->
                        <div class="summary-card">
                            <h5 class="mb-3" style="color: var(--accent-color);">
                                <i class="fas fa-sticky-note me-2"></i>Catatan (Opsional)
                            </h5>
                            <textarea name="catatan" class="form-control form-control-custom" 
                                      rows="3" placeholder="Tambahkan catatan untuk penjual..."></textarea>
                        </div>
                    </form>
                </div>
                
                <div class="col-lg-4">
                    <!-- Ringkasan Belanja -->
                    <div class="summary-card sticky-top" style="top: 2rem;">
                        <h5 class="mb-3" style="color: var(--accent-color);">
                            <i class="fas fa-file-invoice me-2"></i>Ringkasan
                        </h5>
                        
                        <div class="d-flex justify-content-between mb-2">
                            <span>Subtotal:</span>
                            <span>Rp <%= String.format("%,.0f", harga) %></span>
                        </div>
                        
                        <div class="d-flex justify-content-between mb-2">
                            <span>Biaya Admin:</span>
                            <span>Rp 5.000</span>
                        </div>
                        
                        <div class="d-flex justify-content-between mb-2">
                            <span>Ongkos Kirim:</span>
                            <span class="text-success">Gratis</span>
                        </div>
                        
                        <hr>
                        
                        <div class="d-flex justify-content-between mb-3">
                            <strong>Total:</strong>
                            <strong class="price-highlight" style="font-size: 1.5rem;">
                                Rp <%= String.format("%,.0f", harga + 5000) %>
                            </strong>
                        </div>
                        
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="agreeTerms" required>
                                <label class="form-check-label small" for="agreeTerms">
                                    Saya menyetujui 
                                    <a href="#" style="color: var(--primary-color);">Syarat & Ketentuan</a>
                                    dan 
                                    <a href="#" style="color: var(--primary-color);">Kebijakan Privasi</a>
                                </label>
                            </div>
                        </div>
                        
                        <button type="submit" form="checkoutForm" class="btn btn-primary-custom w-100 mb-3">
                            <i class="fas fa-lock me-2"></i>Bayar Sekarang
                        </button>
                        
                        <a href="riwayatTawar" class="btn btn-outline-custom w-100">
                            <i class="fas fa-arrow-left me-2"></i>Kembali
                        </a>
                        
                        <div class="text-center mt-3">
                            <small class="text-muted">
                                <i class="fas fa-shield-alt me-1"></i>
                                Transaksi Anda aman dan terenkripsi
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function selectPayment(method) {
            // Remove selected class from all payment methods
            document.querySelectorAll('.payment-method').forEach(function(el) {
                el.classList.remove('selected');
            });
            
            // Add selected class to clicked payment method
            event.currentTarget.classList.add('selected');
            
            // Check the corresponding radio button
            document.getElementById(method).checked = true;
        }
        
        // Form validation
        document.getElementById('checkoutForm').addEventListener('submit', function(e) {
            const agreeTerms = document.getElementById('agreeTerms');
            if (!agreeTerms.checked) {
                e.preventDefault();
                alert('Anda harus menyetujui Syarat & Ketentuan untuk melanjutkan pembayaran.');
                return false;
            }
        });
    </script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>