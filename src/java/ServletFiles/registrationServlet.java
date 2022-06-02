/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ServletFiles;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.PageContext;

/**
 *
 * @author nikun
 */
public class registrationServlet extends HttpServlet {

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
            out.println("<title>Servlet registrationServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String conf_password = request.getParameter("conf_password");
            
            if (password.equals(conf_password)) {
                ServletContext context = getServletContext();
                String driver = context.getInitParameter("Driver");
                String url = context.getInitParameter("db_url");

                try {
                    //out.println(driver);
                    Class.forName(driver);

                    Connection con = DriverManager.getConnection(url, "root", "");

                    String query = "INSERT INTO user (`Name`, `Email`, `Password`) VALUES(?,?,?)";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1,name);
                    ps.setString(2,email);
                    ps.setString(3,password);

                    int rowCount = ps.executeUpdate();
                    if (rowCount > 0) {
                        //registration completed successfully.
                        HttpSession session = request.getSession();
                        session.setAttribute("username", name);
                        session.setAttribute("status", true);
                        response.sendRedirect("HomePage.jsp");
                    } else {
                        out.println("row not inserted.");
                    }
    //                String query = "SELECT password from user where email = '"+email+"'";
    //                
    //                ResultSet rs = stmt.executeQuery(query);
    //                
    //                if (rs.next()) {
    //                    out.println("it is not null");
    //                } else {
    //                    out.println("It is null");
    //                }
                } catch (Exception e) {
                    out.println("EXCEPTION: "+e.getLocalizedMessage());
                }
            } else {
                out.println("<h3>Password and confirm password are not same. <a href='registration.jsp'>click here</a><h3>");
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
