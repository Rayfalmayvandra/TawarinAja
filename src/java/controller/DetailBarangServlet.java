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

import model.Barang;

@WebServlet("/detailBarang")
public class DetailBarangServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        List<Barang> list = (List<Barang>) getServletContext().getAttribute("barangList");

        Barang found = null;
        for (Barang b : list) if (b.getId() == id) found = b;

        req.setAttribute("barang", found);
        req.getRequestDispatcher("detailBarang.jsp").forward(req, resp);
    }
}









