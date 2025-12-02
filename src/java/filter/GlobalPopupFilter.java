/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author rayfa
 */
package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebFilter("/*")
public class GlobalPopupFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession(false);

        // HANYA cek untuk halaman tertentu, bukan semua halaman
        String path = request.getServletPath();
        
        // Hanya proses untuk halaman riwayatTawar dan dashboard pembeli
        if (session != null && ("/riwayatTawar".equals(path) || "/dashboardPembeli.jsp".equals(path) || path.contains("riwayatTawar"))) {
            
            Boolean popup = (Boolean) session.getAttribute("showWinPopup");
            Integer winId = (Integer) session.getAttribute("popupWinnerId");

            if (popup != null && popup && winId != null) {
                request.setAttribute("globalPopup", true);
                request.setAttribute("globalPopupWinnerId", winId);
                
                // AUTO REMOVE setelah ditampilkan - INI SOLUSI UTAMA
                session.removeAttribute("showWinPopup");
                session.removeAttribute("popupWinnerId");
            }
        }

        chain.doFilter(request, response);
    }
}