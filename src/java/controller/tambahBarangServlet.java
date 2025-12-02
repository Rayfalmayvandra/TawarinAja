package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "tambahBarangServlet", urlPatterns = {"/tambahBarangServlet"})
@MultipartConfig
public class tambahBarangServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Ambil parameter (pastikan tidak null)
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        String priceStr = request.getParameter("price");
        if (priceStr == null || priceStr.isEmpty()) {
            priceStr = "0";
        }

        double initialPrice = Double.parseDouble(priceStr);

        // Dummy: endTime 2 hari dari sekarang
        long endTime = System.currentTimeMillis() + (2L * 24 * 60 * 60 * 1000);

        System.out.println("Barang berhasil diterima:");
        System.out.println("Nama: " + title);
        System.out.println("Deskripsi: " + description);
        System.out.println("Harga: " + initialPrice);

        // Kembali ke halaman list barang
        response.sendRedirect("ListBarangSellerServlet");
    }
}