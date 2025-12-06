package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class ManageReservation_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("        \n");
      out.write("        <title>Manage Booking</title>\n");
      out.write("        <style>\n");
      out.write("            .filter-container {\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            body {\n");
      out.write("                font-family: Arial, sans-serif;\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                background-color: #f4f4f4;\n");
      out.write("                color: #333;\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("                min-height: 100vh;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            header , footer{\n");
      out.write("                background-color: #007bff;\n");
      out.write("                color: #fff;\n");
      out.write("                padding: 20px 0;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            header h1 {\n");
      out.write("                margin: 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Navigation Styling */\n");
      out.write("            nav {\n");
      out.write("                background-color: #0056b3;\n");
      out.write("                padding: 10px 0;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            nav a {\n");
      out.write("                color: #fff;\n");
      out.write("                text-decoration: none;\n");
      out.write("                margin: 0 15px;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            nav a:hover {\n");
      out.write("                text-decoration: underline;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            nav input[type=\"button\"] {\n");
      out.write("                background-color: white;\n");
      out.write("                color: #007bff;\n");
      out.write("                border: 1px solid maroon;\n");
      out.write("                padding: 10px 20px;\n");
      out.write("                margin-left: 10px;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            nav input[type=\"button\"]:hover {\n");
      out.write("                background-color: grey;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            main {\n");
      out.write("                flex: 1;\n");
      out.write("                padding: 20px;\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("                align-items: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .content-container {\n");
      out.write("                background-color: white;\n");
      out.write("                padding: 20px;\n");
      out.write("                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("                border-radius: 8px;\n");
      out.write("                width: 100%;\n");
      out.write("                max-width: 800px;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            h1 {\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            table {\n");
      out.write("                width: 100%;\n");
      out.write("                border-collapse: collapse;\n");
      out.write("                margin: 20px 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            table, th, td {\n");
      out.write("                border: 1px solid #ccc;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            th, td {\n");
      out.write("                padding: 10px;\n");
      out.write("                text-align: left;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            th {\n");
      out.write("                background-color: #007bff;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=\"button\"] {\n");
      out.write("                padding: 10px 20px;\n");
      out.write("                border: none;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                cursor: pointer;\n");
      out.write("                background-color: #007bff;\n");
      out.write("                color: white;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=\"button\"]:hover {\n");
      out.write("                opacity: 0.9;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            footer {\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .actions a {\n");
      out.write("                margin: 0 5px;\n");
      out.write("                color: #007bff;\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .actions a:hover {\n");
      out.write("                text-decoration: underline;\n");
      out.write("            }\n");
      out.write("       \n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("            <h1>Manage Route</h1>\n");
      out.write("        </header>\n");
      out.write("        <nav>\n");
      out.write("            <a href=\"adminDashboard.jsp\">Back to Admin Dashboard</a>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <main>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"content\">\n");
      out.write("                    <div class=\"form-container\">\n");
      out.write("                        <h2>Manage Bookings</h2>\n");
      out.write("\n");
      out.write("                        <!-- Filter by status -->\n");
      out.write("                        <div class=\"filter-container\">\n");
      out.write("                            <form id=\"filterForm\" method=\"get\">\n");
      out.write("                                <label for=\"statusFilter\">Filter by status:</label>\n");
      out.write("                                <select id=\"statusFilter\" name=\"status\" onchange=\"document.getElementById('filterForm').submit()\">\n");
      out.write("                                    <option value=\"all\">All</option>\n");
      out.write("                                    <option value=\"pending\">Pending</option>\n");
      out.write("                                    <option value=\"approved\">Approved</option>\n");
      out.write("                                    <option value=\"rejected\">Rejected</option>\n");
      out.write("                                </select>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("<!--                        <form id=\"manageBookingsForm\" method=\"post\">-->\n");
      out.write("                            <table class=\"bookings-table\">\n");
      out.write("                                <thead>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <th>#</th>\n");
      out.write("                                        <th>RESERVATION ID</th>\n");
      out.write("                                        <th>USER ID</th>\n");
      out.write("                                        <th>ROUTE ID</th>\n");
      out.write("                                        <th>DATE</th>\n");
      out.write("                                        <th>DEPARTURE TIME</th>\n");
      out.write("                                        <th>ARRIVAL TIME</th>\n");
      out.write("                                        <th>SEAT NUMBER</th>\n");
      out.write("                                        <th>ACTION</th>\n");
      out.write("                                    </tr>\n");
      out.write("                                </thead>\n");
      out.write("                                <tbody id=\"reservationTableBody\">\n");
      out.write("                                    ");

                                        Connection conn = null;
                                        PreparedStatement stmt = null;
                                        ResultSet rs = null;
                                        int i = 1;
                                        String selectedStatus = request.getParameter("status");
                                        try {
                                            // Load the MySQL JDBC driver
                                            Class.forName("com.mysql.jdbc.Driver");

                                            // Establish the connection
                                            String url = "jdbc:mysql://localhost:3306/bus_route";
                                            String username = "root";
                                            String password = ""; // Replace with your MySQL password
                                            conn = DriverManager.getConnection(url, username, password);

                                            // Prepare SQL query
                                            String sql = "SELECT reservationID, user_id, routeid, date, departuretime, arrivaltime, seatno, status FROM reservation";

                                            // Apply filter based on selected status
                                            if ("pending".equals(selectedStatus) || "approved".equals(selectedStatus) || "rejected".equals(selectedStatus)) {
                                                sql += " WHERE status = ?";
                                            }

                                            stmt = conn.prepareStatement(sql);

                                            // Set filter parameter if applicable
                                            if ("pending".equals(selectedStatus) || "approved".equals(selectedStatus) || "rejected".equals(selectedStatus)) {
                                                stmt.setString(1, selectedStatus);
                                            }

                                            // Execute the query
                                            rs = stmt.executeQuery();

                                            // Iterate over the result set and display data
                                            while (rs.next()) {
                                    
      out.write("\n");
      out.write("                                    <tr data-status=\"");
      out.print( rs.getString("status"));
      out.write("\">\n");
      out.write("                                        <td>");
      out.print( i++);
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print( rs.getInt("reservationID"));
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print( rs.getInt("user_id"));
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print( rs.getString("routeid"));
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print( rs.getString("date"));
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print( rs.getString("departuretime"));
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print( rs.getString("arrivaltime"));
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print( rs.getString("seatno"));
      out.write("</td>\n");
      out.write("                                        <td class=\"actionCell\">\n");
      out.write("                                            <form method=\"post\" class=\"status-update-form\" action=\"updateBookingStatus.jsp\">\n");
      out.write("                                                <input type=\"hidden\" name=\"reservationID\" value=\"");
      out.print( rs.getInt("reservationID"));
      out.write("\">\n");
      out.write("                                                <select name=\"status\">\n");
      out.write("                                                    <option value=\"pending\" ");
      out.print( "pending".equals(rs.getString("status")) ? "selected" : "");
      out.write(">Pending</option>\n");
      out.write("                                                    <option value=\"approved\" ");
      out.print( "approved".equals(rs.getString("status")) ? "selected" : "");
      out.write(">Approved</option>\n");
      out.write("                                                    <option value=\"rejected\" ");
      out.print( "rejected".equals(rs.getString("status")) ? "selected" : "");
      out.write(">Rejected</option>\n");
      out.write("                                                </select>\n");
      out.write("                                                <button type=\"submit\">Update</button>\n");
      out.write("                                            </form>\n");
      out.write("                                                \n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    ");

                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        } finally {
                                            // Close resources in finally block
                                            if (rs != null) {
                                                try {
                                                    rs.close();
                                                } catch (SQLException e) {
                                                    /* ignored */ }
                                            }
                                            if (stmt != null) {
                                                try {
                                                    stmt.close();
                                                } catch (SQLException e) {
                                                    /* ignored */ }
                                            }
                                            if (conn != null) {
                                                try {
                                                    conn.close();
                                                } catch (SQLException e) {
                                                    /* ignored */ }
                                            }
                                        }
                                    
      out.write("\n");
      out.write("                                </tbody>\n");
      out.write("                            </table>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <!--</form>-->\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </main>\n");
      out.write("\n");
      out.write("        <footer>\n");
      out.write("            <p>&copy; 2024 Bus Booking System. All rights reserved.</p>\n");
      out.write("        </footer>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            // Hamburger menu functionality\n");
      out.write("            const navEl = document.querySelector('.nav');\n");
      out.write("            const hamburgerEl = document.querySelector('.hamburger');\n");
      out.write("            const navItemEls = document.querySelectorAll('.nav__item');\n");
      out.write("\n");
      out.write("            hamburgerEl.addEventListener('click', () => {\n");
      out.write("                navEl.classList.toggle('nav--open');\n");
      out.write("                hamburgerEl.classList.toggle('hamburger--open');\n");
      out.write("            });\n");
      out.write("\n");
      out.write("            navItemEls.forEach(navItemEl => {\n");
      out.write("                navItemEl.addEventListener('click', () => {\n");
      out.write("                    navEl.classList.remove('nav--open');\n");
      out.write("                    hamburgerEl.classList.remove('hamburger--open');\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("\n");
      out.write("            // Function to save changes via AJAX\n");
      out.write("            function saveChanges() {\n");
      out.write("                const forms = document.querySelectorAll('.status-update-form');\n");
      out.write("                forms.forEach(form => {\n");
      out.write("                    const formData = new FormData(form);\n");
      out.write("                    const xhr = new XMLHttpRequest();\n");
      out.write("                    xhr.open('POST', 'updateBookingStatus.jsp', true);\n");
      out.write("                    xhr.onload = function () {\n");
      out.write("                        // Handle response if needed\n");
      out.write("                        console.log(xhr.responseText);\n");
      out.write("                    };\n");
      out.write("                    xhr.send(formData);\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </body>\n");
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
