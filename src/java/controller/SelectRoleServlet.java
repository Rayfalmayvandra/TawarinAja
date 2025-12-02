package controller;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SelectRoleServlet")
public class SelectRoleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();

        String role = request.getParameter("role");

        // simpan role ke session
        session.setAttribute("role", role);

        if ("buyer".equals(role)) {
            response.sendRedirect("DashboardBuyer.jsp");
        } else {
            response.sendRedirect("DashboardSeller.jsp");
        }
    }
}
