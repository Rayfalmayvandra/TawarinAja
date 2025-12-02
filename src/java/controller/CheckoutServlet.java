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
import java.util.ArrayList;
import model.Penawaran;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int idPenawaran = Integer.parseInt(req.getParameter("idPenawaran"));
        String alamat = req.getParameter("alamat");
        String metode = req.getParameter("metode");
        double amount = Double.parseDouble(req.getParameter("amount"));

        HttpSession session = req.getSession();

        List<Penawaran> list =
                (List<Penawaran>) session.getAttribute("riwayatTawaran");

        List<Penawaran> history =
                (List<Penawaran>) session.getAttribute("historyPembelian");

        if (history == null) history = new ArrayList<>();

        // cari penawaran
        Penawaran found = null;
        for (Penawaran p : list) {
            if (p.getId() == idPenawaran) {
                found = p;
                break;
            }
        }

        if (found != null) {
            found.setStatus("DIBAYAR");
            found.setAlamat(alamat);
            found.setMetode(metode);

            // Tambahkan ke history pembelian jika belum ada
            if (!history.contains(found)) {
                history.add(found);
            }
        }

        session.setAttribute("historyPembelian", history);
        session.setAttribute("riwayatTawaran", list);

        resp.sendRedirect("pembayaranSukses.jsp");
    }
}