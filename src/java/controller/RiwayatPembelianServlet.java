/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;
import java.util.*;

import model.Penawaran;

@WebServlet("/riwayatPembelian")
public class RiwayatPembelianServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession s = req.getSession();
        List<Penawaran> list = (List<Penawaran>) s.getAttribute("riwayatTawaran");

        List<Penawaran> paid = new ArrayList<>();

        if (list != null) {
            for (Penawaran p : list) {
                if ("DIBAYAR".equals(p.getStatus())) {
                    paid.add(p);
                }
            }
        }

        req.setAttribute("paidList", paid);
        req.getRequestDispatcher("riwayatPembelian.jsp").forward(req, resp);
    }
}