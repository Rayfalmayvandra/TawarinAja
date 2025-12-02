/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Barang;

@WebServlet(name = "ListBarangSellerServlet", urlPatterns = {"/ListBarangSellerServlet"})
public class ListBarangSellerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Data dummy - sesuai constructor Barang
        ArrayList<Barang> barangList = new ArrayList<>();

        long waktuSelesai = System.currentTimeMillis() + 86400000; // +1 hari

        barangList.add(new Barang(1, "Laptop", "Laptop gaming", 3500000, waktuSelesai));
        barangList.add(new Barang(2, "Sepatu", "Sepatu baru original", 250000, waktuSelesai));

        request.setAttribute("barangList", barangList);
        request.getRequestDispatcher("listBarangSeller.jsp").forward(request, response);
    }
}