/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;
import model.Penawaran;

@WebServlet("/cekPemenang")
public class MenangServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession();
        List<Penawaran> semuaPenawaran = (List<Penawaran>) session.getAttribute("riwayatTawaran");
        
        if (semuaPenawaran == null) {
            resp.sendRedirect("riwayatTawar.jsp");
            return;
        }

        boolean pemenangDitemukan = false;
        Integer idPemenang = null;

        // Kelompokkan penawaran yang belum ada statusnya per barang, kecuali yang sudah DIBAYAR
        Map<Integer, List<Penawaran>> penawaranAktif = new HashMap<>();
        
        for (Penawaran p : semuaPenawaran) {
            // Lewati yang sudah DIBAYAR
            if ("DIBAYAR".equals(p.getStatus())) {
                continue;
            }
            // Hanya proses yang belum ada status atau status aktif
            if (p.getStatus() == null || "AKTIF".equals(p.getStatus()) || "BELUM_MENANG".equals(p.getStatus())) {
                if (!penawaranAktif.containsKey(p.getBarangId())) {
                    penawaranAktif.put(p.getBarangId(), new ArrayList<>());
                }
                penawaranAktif.get(p.getBarangId()).add(p);
            }
        }

        // Proses setiap barang
        for (List<Penawaran> penawaranUntukBarang : penawaranAktif.values()) {
            if (penawaranUntukBarang.isEmpty()) continue;
            
            // Cari penawaran tertinggi
            Penawaran pemenang = Collections.max(penawaranUntukBarang, 
                Comparator.comparingDouble(Penawaran::getAmount));
            
            // Set status
            pemenang.setStatus("MENANG");
            pemenangDitemukan = true;
            idPemenang = pemenang.getId();
            
            // Set yang lain sebagai kalah
            for (Penawaran p : penawaranUntukBarang) {
                if (p != pemenang) {
                    p.setStatus("KALAH");
                }
            }
        }

        if (pemenangDitemukan && idPemenang != null) {
            session.setAttribute("showWinPopup", true);
            session.setAttribute("popupWinnerId", idPemenang);
        }

        resp.sendRedirect("riwayatTawar.jsp");
    }
}