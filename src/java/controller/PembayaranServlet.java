/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;
import java.util.List;

import model.Penawaran;

@WebServlet("/pembayaran")
public class PembayaranServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession s = req.getSession();
        List<Penawaran> list = (List<Penawaran>) s.getAttribute("riwayatTawaran");

        int id = Integer.parseInt(req.getParameter("id"));

        for (Penawaran p : list) {
            if (p.getId() == id) {
                p.setStatus("DIBAYAR");
                break;
            }
        }

        s.setAttribute("riwayatTawaran", list);
        resp.sendRedirect("riwayatPembelian");
    }
}