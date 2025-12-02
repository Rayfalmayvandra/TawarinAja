<%-- 
    Document   : login
    Created on : Nov 23, 2025, 8:19:02 PM
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
    <title>Login - TawarinAja</title>
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
        
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 3rem;
            max-width: 450px;
            width: 100%;
        }
        
        .brand-logo {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .brand-logo img {
            height: 60px;
        }
        
        .brand-text {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 2rem;
            color: var(--primary-color);
            margin-top: 1rem;
        }
        
        .slogan {
            color: var(--secondary-color);
            font-weight: 600;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.1rem;
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
        
        .btn-login {
            background: linear-gradient(45deg, var(--primary-color), #4CAF50);
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
            width: 100%;
        }
        
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 139, 87, 0.4);
            color: white;
        }
        
        .form-label {
            font-weight: 600;
            color: var(--accent-color);
            margin-bottom: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <div class="brand-logo">
            <img src="image/logo1.png" alt="TawarinAja">
            <div class="brand-text">TawarinAja</div>
        </div>

        <p class="slogan">Satu Lelang Dua Kepuasan</p>

        <h2 class="text-center mb-4" style="color: var(--accent-color);">Masuk ke Akun Anda</h2>

        <form action="${pageContext.request.contextPath}/login" method="POST">
            <div class="mb-3">
                <label for="email" class="form-label">Alamat Email</label>
                <input type="email" name="email" class="form-control form-control-custom"
                       id="email" placeholder="nama@contoh.com" required>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label">Kata Sandi</label>
                <input type="password" name="password" class="form-control form-control-custom"
                       id="password" placeholder="Masukkan kata sandi" required>
            </div>

            <button type="submit" class="btn btn-login mb-3">
                <i class="fas fa-sign-in-alt me-2"></i> Masuk
            </button>
        </form>

        <div class="text-center">
            <p class="text-muted">Belum punya akun?
                <a href="register.jsp" style="color: var(--primary-color); text-decoration: none; font-weight: 600;">
                    Daftar di sini
                </a>
            </p>
        </div>
    </div>

    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>