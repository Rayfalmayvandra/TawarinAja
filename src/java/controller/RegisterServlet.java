package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String nama = req.getParameter("nama");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Validasi sederhana
        if (email == null || !email.contains("@")) {
            resp.sendRedirect("register.jsp?error=invalid");
            return;
        }

        HttpSession session = req.getSession();

        // Simpan data user sementara (tanpa DB)
        session.setAttribute("nama", nama);
        session.setAttribute("email", email);
        session.setAttribute("password", password);

        // Lanjut memilih role
        resp.sendRedirect("SelectRole.jsp");
    }
}
