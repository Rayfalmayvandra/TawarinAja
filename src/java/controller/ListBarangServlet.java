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

import model.Barang;

@WebServlet("/ListBarangServlet")
public class ListBarangServlet extends HttpServlet {

    @Override
    public void init() {
        if (getServletContext().getAttribute("barangList") == null) {

            long now = System.currentTimeMillis();

            List<Barang> list = new ArrayList<>();
            list.add(new Barang(1, "Laptop Gaming", "Laptop kenceng buat main", 5000000, now + 60000));
            list.add(new Barang(2, "iPhone 12", "iPhone mulus", 7000000, now + 90000));
            list.add(new Barang(3, "PS4 Slim", "Kondisi normal", 3000000, now + 120000));

            getServletContext().setAttribute("barangList", list);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Barang> list = (List<Barang>) getServletContext().getAttribute("barangList");
        req.setAttribute("barangList", list);
        req.getRequestDispatcher("listBarang.jsp").forward(req, resp);
    }
}







