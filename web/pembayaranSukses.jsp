<%-- 
    Document   : pembayaranSukses
    Created on : Nov 30, 2025, 12:23:13?AM
    Author     : rayfa
--%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="image/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <title>Pembayaran Berhasil - TawarinAja</title>
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
            color: #333;
        }
        
        .success-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 3rem;
            max-width: 600px;
            width: 100%;
            text-align: center;
        }
        
        .success-icon {
            font-size: 5rem;
            color: var(--primary-color);
            margin-bottom: 2rem;
        }
        
        .btn-primary-custom {
            background: linear-gradient(45deg, var(--primary-color), #4CAF50);
            border: none;
            padding: 12px 35px;
            border-radius: 50px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin: 0.5rem;
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
            margin: 0.5rem;
        }
        
        .btn-outline-custom:hover {
            background-color: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }
        
        .order-details {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: none;
            margin: 2rem 0;
            text-align: left;
        }
        
        .tracking-number {
            background: linear-gradient(45deg, #FF6B35, #FF8E53);
            color: white;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 1.1rem;
            display: inline-block;
            margin-bottom: 1rem;
        }
        
        .next-steps {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 1.5rem;
            margin-top: 2rem;
        }
        
        .step-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }
        
        .step-number {
            width: 30px;
            height: 30px;
            background: var(--primary-color);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 1rem;
            flex-shrink: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="success-card">
                    <div class="success-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    
                    <h1 style="font-family: 'Playfair Display', serif; color: var(--accent-color); margin-bottom: 1rem;">
                        Pembayaran Berhasil!
                    </h1>
                    
                    <p class="lead mb-4">
                        Terima kasih telah melakukan pembayaran. Barang Anda akan segera diproses dan dikirim.
                    </p>
                    
                    <div class="tracking-number">
                        <i class="fas fa-shipping-fast me-2"></i>No. Pesanan: #TRX-<%= System.currentTimeMillis() %>
                    </div>
                    
                    <!-- Order Details -->
                    <div class="order-details">
                        <h5 class="mb-3" style="color: var(--accent-color);">
                            <i class="fas fa-receipt me-2"></i>Detail Pesanan
                        </h5>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Status Pembayaran:</strong> <span class="text-success">Berhasil</span></p>
                                <p><strong>Metode Pembayaran:</strong> Transfer Bank</p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Estimasi Pengiriman:</strong> 2-3 hari kerja</p>
                                <p><strong>No. Resi:</strong> Akan tersedia</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Next Steps -->
                    <div class="next-steps">
                        <h6 class="mb-3" style="color: var(--accent-color);">
                            <i class="fas fa-list-alt me-2"></i>Langkah Selanjutnya
                        </h6>
                        
                        <div class="step-item">
                            <div class="step-number">1</div>
                            <div>
                                <strong>Pesanan Diproses</strong>
                                <p class="small text-muted mb-0">Penjual sedang mempersiapkan barang Anda</p>
                            </div>
                        </div>
                        
                        <div class="step-item">
                            <div class="step-number">2</div>
                            <div>
                                <strong>Pesanan Dikirim</strong>
                                <p class="small text-muted mb-0">Barang akan dikirim ke alamat Anda</p>
                            </div>
                        </div>
                        
                        <div class="step-item">
                            <div class="step-number">3</div>
                            <div>
                                <strong>Pesanan Sampai</strong>
                                <p class="small text-muted mb-0">Barang telah sampai dan transaksi selesai</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Action Buttons -->
                    <div class="mt-4">
                        <a href="historyPembelian.jsp" class="btn btn-primary-custom">
                            <i class="fas fa-history me-2"></i>Lihat Riwayat Pembelian
                        </a>
                        <a href="${pageContext.request.contextPath}/ListBarangServlet" class="btn btn-outline-custom">
                            <i class="fas fa-home me-2"></i>Kembali ke Home
                        </a>
                    </div>
                    
                    <!-- Support Info -->
                    <div class="mt-4 pt-3 border-top">
                        <p class="text-muted small">
                            Butuh bantuan? 
                            <a href="#" style="color: var(--primary-color); text-decoration: none; font-weight: 600;">
                                Hubungi Customer Service
                            </a>
                            atau email ke 
                            <a href="mailto:support@tawarinaja.com" style="color: var(--primary-color); text-decoration: none; font-weight: 600;">
                                support@tawarinaja.com
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