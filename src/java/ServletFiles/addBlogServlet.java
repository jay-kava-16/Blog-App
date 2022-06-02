/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ServletFiles;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.time.*;
/**
 *
 * @author nikun
 */
public class addBlogServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addBlogServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String title = request.getParameter("blog_title");
            String desc = request.getParameter("blog_description");
            long millis=System.currentTimeMillis();  
            Date date = new Date(millis);
            
            ServletContext context = getServletContext();
            String driver = context.getInitParameter("Driver");
            String url = context.getInitParameter("db_url");
            
            try {
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url, "root", "");
                String query = "INSERT INTO blog (`user_id`,`blog_title`, `blog_desc`, `date`) VALUES(?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(query);
                HttpSession session = request.getSession();
                int user_id = Integer.parseInt(session.getAttribute("userID").toString());
                ps.setInt(1, user_id);
                ps.setString(2, title);
                ps.setString(3, desc);
                ps.setDate(4, date);
                
                int rowCount = ps.executeUpdate();
                
                if (rowCount > 0) {
                        //registration completed successfully.
                        response.sendRedirect("HomePage.jsp");
                    } else {
                        out.println("row not inserted.");
                    }
                
            } catch (Exception e) {
                out.println("Exception: "+e);
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
