package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (email == null || !email.contains("@")) {
            resp.sendRedirect("login.jsp?error=1");
            return;
        }

        HttpSession session = req.getSession();
        session.setAttribute("email", email);

        // cek apakah user sudah punya role
        String role = (String) session.getAttribute("role");

        if (role == null) {
            // belum pilih role → paksa pilih role
            resp.sendRedirect("SelectRole.jsp");
            return;
        }

        // kalau sudah punya role → langsung dashboard
        if ("buyer".equals(role)) {
            resp.sendRedirect("DashboardBuyer.jsp");
        } else {
            resp.sendRedirect("DashboardSeller.jsp");
        }
    }
}
