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

@WebServlet("/tawar")
public class TawarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int barangId = Integer.parseInt(req.getParameter("id"));
        double harga = Double.parseDouble(req.getParameter("harga"));

        HttpSession session = req.getSession();
        List<Penawaran> list = (List<Penawaran>) session.getAttribute("riwayatTawaran");

        if (list == null) list = new ArrayList<>();

        // Buat penawaran baru dengan status null (belum diketahui)
        Penawaran penawaranBaru = new Penawaran(barangId, harga);
        list.add(penawaranBaru);
        session.setAttribute("riwayatTawaran", list);

        resp.sendRedirect("riwayatTawar");
    }
}