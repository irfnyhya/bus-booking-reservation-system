package org.apache.jsp.USER_0020MODULE;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class booking_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("    <link href=\"index.css\" rel=\"stylesheet\">\n");
      out.write("    <title>Manage Booking</title>\n");
      out.write("    <style>\n");
      out.write("        .filter-container {\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<header>\n");
      out.write("    <div class=\"bottom-bar\">\n");
      out.write("        <div class=\"bottom-bar__content\">\n");
      out.write("            <a href=\"Dashboard.html\" class=\"logo\">\n");
      out.write("                <img class=\"logo__img\" src=\"logo.png\" alt=\"logo\">\n");
      out.write("                <span class=\"logo__text\">Bus Ticket Reservation</span>\n");
      out.write("            </a>\n");
      out.write("\n");
      out.write("            <nav class=\"nav\">\n");
      out.write("                <ul class=\"nav__list\">\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a class=\"btn\" href=\"Dashboard.html\">Dashboard</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a class=\"nav__link\" href=\"Booking.html\">Booking</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a class=\"nav__link\" href=\"Profile.html\">Profile</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a class=\"nav__link\" href=\"Help.html\">Help</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("            <div class=\"hamburger\">\n");
      out.write("                <div class=\"bar\"></div>\n");
      out.write("                <div class=\"bar\"></div>\n");
      out.write("                <div class=\"bar\"></div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</header>\n");
      out.write("\n");
      out.write("<main>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <div class=\"form-container\">\n");
      out.write("                <h2>Manage Bookings</h2>\n");
      out.write("                \n");
      out.write("                <!-- Filter by status -->\n");
      out.write("                <div class=\"filter-container\">\n");
      out.write("                    <form id=\"filterForm\" method=\"get\">\n");
      out.write("                        <label for=\"statusFilter\">Filter by status:</label>\n");
      out.write("                        <select id=\"statusFilter\" name=\"status\" onchange=\"document.getElementById('filterForm').submit()\">\n");
      out.write("                            <option value=\"all\">All</option>\n");
      out.write("                            <option value=\"pending\">Pending</option>\n");
      out.write("                            <option value=\"approved\">Approved</option>\n");
      out.write("                            <option value=\"rejected\">Rejected</option>\n");
      out.write("                        </select>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <form id=\"manageBookingsForm\" method=\"post\">\n");
      out.write("                    <table class=\"bookings-table\">\n");
      out.write("                        <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>#</th>\n");
      out.write("                            <th>RESERVATION ID</th>\n");
      out.write("                            <th>ROUTE ID</th>\n");
      out.write("                            <th>ORIGIN</th>\n");
      out.write("                            <th>DESTINATION</th>\n");
      out.write("                            <th>DATE</th>\n");
      out.write("                            <th>DEPARTURE TIME</th>\n");
      out.write("                            <th>ARRIVAL TIME</th>\n");
      out.write("                            <th>SEAT NUMBER</th>\n");
      out.write("                            <th>STATUS</th>\n");
      out.write("                            <th>AMOUNT</th>\n");
      out.write("                        </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody id=\"reservationTableBody\">\n");
      out.write("                        ");
 
                            Connection conn = null;
                            PreparedStatement stmt = null;
                            ResultSet rs = null;
                            int i = 1;
                            int userId = (int) session.getAttribute("user_id");
                            String selectedStatus = request.getParameter("status");
                            try {
                                // Load the MySQL JDBC driver
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                
                                // Establish the connection
                                String url = "jdbc:mysql://localhost:3306/bus_route";
                                String username = "root";
                                String password = ""; // Replace with your MySQL password
                                conn = DriverManager.getConnection(url, username, password);
                                
                                // Prepare SQL query with joins
                                String sql = "SELECT r.reservationID, ro.origin, ro.destination, r.date, r.departuretime, r.arrivaltime, r.seatno, r.status, p.amount " +
                                             "FROM reservation r " +
                                             "JOIN route ro ON r.routeid = ro.routeid " +
                                             "LEFT JOIN payment p ON r.reservationID = p.reservationID " +
                                             "WHERE r.user_id=?";
                                
                                // Apply filter based on selected status (if applicable)
                                if ("pending".equals(selectedStatus) || "approved".equals(selectedStatus) || "rejected".equals(selectedStatus)) {
                                    sql += " AND r.status = ?";
                                }
                                
                                stmt = conn.prepareStatement(sql);
                                stmt.setInt(1, userId); // Set user_id parameter
                                
                                // Set status parameter if applicable
                                if ("pending".equals(selectedStatus) || "approved".equals(selectedStatus) || "rejected".equals(selectedStatus)) {
                                    stmt.setString(2, selectedStatus);
                                }
                                
                                // Execute the query
                                rs = stmt.executeQuery();
                                
                                // Iterate over the result set and display data
                                while (rs.next()) {
                        
      out.write("\n");
      out.write("                        <tr data-status=\"");
      out.print( rs.getString("status") );
      out.write("\">\n");
      out.write("                            <td>");
      out.print( i++ );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getInt("reservationID") );
      out.write("</td>\n");
      out.write("\n");
      out.write("                            <td>");
      out.print( rs.getString("origin") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString("destination") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString("date") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString("departuretime") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString("arrivaltime") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString("seatno") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString("status") );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString("amount") != null ? rs.getString("amount") : "N/A" );
      out.write("</td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
 
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                // Close resources in finally block
                                if (rs != null) {
                                    try { rs.close(); } catch (SQLException e) { /* ignored */ }
                                }
                                if (stmt != null) {
                                    try { stmt.close(); } catch (SQLException e) { /* ignored */ }
                                }
                                if (conn != null) {
                                    try { conn.close(); } catch (SQLException e) { /* ignored */ }
                                }
                            }
                        
      out.write("\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                    \n");
      out.write("                    <!-- Any additional form elements or actions can be added here -->\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</main>\n");
      out.write("\n");
      out.write("<footer>\n");
      out.write("    <footer class=\"footer-distributed\">\n");
      out.write("        <div class=\"footer-left\">\n");
      out.write("            <img class=\"logofooter\" src=\"logo.png\" alt=\"logo\">\n");
      out.write("\n");
      out.write("            <p class=\"footer-links\">\n");
      out.write("                <a href=\"#\" class=\"link-1\">Dashboard</a>\n");
      out.write("                <a href=\"#\">About</a>\n");
      out.write("                <a href=\"#\">Booking</a>\n");
      out.write("                <a href=\"#\">Help</a>\n");
      out.write("            </p>\n");
      out.write("            <p class=\"footer-company-name\">Tiny Travel Co. © 2024</p>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"footer-center\">\n");
      out.write("            <div>\n");
      out.write("                <i class=\"fa fa-map-marker\"></i>\n");
      out.write("                <p><span>Kuala Nerus</span> Terengganu, Malaysia</p>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <i class=\"fa fa-phone\"></i>\n");
      out.write("                <p>+60 123456789</p>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <i class=\"fa fa-envelope\"></i>\n");
      out.write("                <p><a href=\"mailto:tinytravel@company.com\">tinytravel@company.com</a></p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"footer-right\">\n");
      out.write("            <p class=\"footer-company-about\">\n");
      out.write("                <span>About the company</span>\n");
      out.write("                Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu\n");
      out.write("                auctor\n");
      out.write("                lacus vehicula sit amet.\n");
      out.write("            </p>\n");
      out.write("            <div class=\"footer-icons\">\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-linkedin\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-github\"></i></a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </footer>\n");
      out.write("</footer>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    // Hamburger menu functionality\n");
      out.write("    const navEl = document.querySelector('.nav');\n");
      out.write("    const hamburgerEl = document.querySelector('.hamburger');\n");
      out.write("    const navItemEls = document.querySelectorAll('.nav__item');\n");
      out.write("\n");
      out.write("    hamburgerEl.addEventListener('click', () => {\n");
      out.write("        navEl.classList.toggle('nav--open');\n");
      out.write("        hamburgerEl.classList.toggle('hamburger--open');\n");
      out.write("    });\n");
      out.write("\n");
      out.write("    navItemEls.forEach(navItemEl => {\n");
      out.write("        navItemEl.addEventListener('click', () => {\n");
      out.write("            navEl.classList.remove('nav--open');\n");
      out.write("            hamburgerEl.classList.remove('hamburger--open');\n");
      out.write("        });\n");
      out.write("    });\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
