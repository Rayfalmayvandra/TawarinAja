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
import model.Barang;

@WebServlet("/riwayatTawar")
public class RiwayatTawarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        List<Penawaran> myList = (List<Penawaran>) session.getAttribute("riwayatTawaran");
        List<Barang> barangList = (List<Barang>) getServletContext().getAttribute("barangList");

        if (myList == null || myList.isEmpty()) {
            req.getRequestDispatcher("riwayatTawar.jsp").forward(req, resp);
            return;
        }

        long now = System.currentTimeMillis();
        Map<Integer, Penawaran> highest = new HashMap<>();
        boolean popup = false;

        // Kelompokkan penawaran per barang, hanya untuk yang belum DIBAYAR
        for (Penawaran p : myList) {
            if ("DIBAYAR".equals(p.getStatus())) {
                continue; // Lewati yang sudah dibayar
            }

            int idBarang = p.getBarangId();
            long end = Long.MAX_VALUE;

            // Cari waktu berakhir barang
            if (barangList != null) {
                for (Barang b : barangList) {
                    if (b.getId() == idBarang) {
                        end = b.getEndTime();
                        break;
                    }
                }
            }

            // Jika lelang sudah berakhir
            if (now >= end) {
                Penawaran curr = highest.get(idBarang);
                if (curr == null || p.getAmount() > curr.getAmount()) {
                    highest.put(idBarang, p);
                }
            }
        }

        // Update status untuk yang menang dan kalah
        for (Penawaran p : myList) {
            if ("DIBAYAR".equals(p.getStatus())) {
                continue;
            }

            // Reset status yang belum dibayar menjadi BELUM_MENANG (kecuali yang akan jadi MENANG)
            p.setStatus("BELUM_MENANG");

            // Periksa apakah penawaran ini adalah pemenang untuk barangnya
            Penawaran pemenang = highest.get(p.getBarangId());
            if (pemenang != null && p.getId() == pemenang.getId()) {
                // Jika sebelumnya belum MENANG, maka set popup
                if (!"MENANG".equals(p.getStatus())) {
                    popup = true;
                }
                p.setStatus("MENANG");
            }
        }

        if (popup) {
            session.setAttribute("showWinPopup", true);
        }

        session.setAttribute("riwayatTawaran", myList);
        req.getRequestDispatcher("riwayatTawar.jsp").forward(req, resp);
    }
}