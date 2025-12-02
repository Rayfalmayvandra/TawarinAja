<%-- 
    Document   : register
    Created on : Dec 1, 2025, 1:30:14 AM
    Author     : MSii
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar - TawarinAja</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">

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
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            padding: 3rem;
            width: 100%;
            max-width: 500px;
        }

        .brand-logo {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .brand-logo img {
            height: 60px;
        }

        .brand-text {
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-top: 1rem;
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

        .btn-register {
            background: linear-gradient(45deg, var(--primary-color), #4CAF50);
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            color: white;
            width: 100%;
            transition: 0.3s;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 139, 87, 0.4);
            color: white;
        }

        .login-link {
            color: var(--primary-color);
            font-weight: 600;
            text-decoration: none;
        }

        .login-link:hover {
            color: var(--secondary-color);
        }
    </style>
</head>

<body>
    <div class="register-card">
        <div class="brand-logo">
            <img src="image/logo1.png" alt="TawarinAja">
            <div class="brand-text">TawarinAja</div>
        </div>

        <h2 class="text-center mb-4" style="color: var(--accent-color);">Buat Akun Baru</h2>

        <form action="register" method="post">
            <div class="mb-3">
                <label class="form-label">Nama Lengkap</label>
                <input type="text" class="form-control form-control-custom" 
                       name="nama" placeholder="Masukkan nama lengkap Anda" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control form-control-custom"
                       name="email" placeholder="contoh@email.com" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" class="form-control form-control-custom" 
                       name="password" placeholder="Minimal 8 karakter" required>
            </div>

            <div class="mb-4">
                <label class="form-label">Konfirmasi Password</label>
                <input type="password" class="form-control form-control-custom" 
                       name="confirmPassword" placeholder="Ketik ulang password" required>
            </div>

            <button class="btn btn-register mb-3">
                <i class="fas fa-user-plus me-2"></i>Daftar Sekarang
            </button>
        </form>
        <div class="text-center">
            <p class="text-muted">Sudah punya akun?
                <a href="login.jsp" class="login-link">Masuk di sini</a>
            </p>
        </div>
    </div>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Validasi konfirmasi password
        document.querySelector("form").addEventListener("submit", function(e) {
            const pass = document.querySelector("[name=password]").value;
            const confirm = document.querySelector("[name=confirmPassword]").value;
            if (pass !== confirm) {
                e.preventDefault();
                alert("Password dan Konfirmasi Password tidak sama!");
            }
        });
    </script>
</body>
</html>
