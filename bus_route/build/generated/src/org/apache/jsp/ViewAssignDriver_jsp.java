package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import java.util.ArrayList;
import java.sql.*;

public final class ViewAssignDriver_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>View Report Details</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"styledashboard.css\">\n");
      out.write("    <style>\n");
      out.write("        .bus-layout {\n");
      out.write("            display: flex;\n");
      out.write("            flex-direction: column;\n");
      out.write("            align-items: center;\n");
      out.write("        }\n");
      out.write("        .legend, .seat-row {\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            margin-bottom: 10px;\n");
      out.write("        }\n");
      out.write("        .legend-item {\n");
      out.write("            display: flex;\n");
      out.write("            align-items: center;\n");
      out.write("            margin-right: 15px;\n");
      out.write("        }\n");
      out.write("        .legend-item .seat {\n");
      out.write("            width: 20px;\n");
      out.write("            height: 20px;\n");
      out.write("            margin-right: 5px;\n");
      out.write("        }\n");
      out.write("        .seat {\n");
      out.write("            width: 30px;\n");
      out.write("            height: 30px;\n");
      out.write("            margin: 5px;\n");
      out.write("            background-color: lightgray;\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write("        .available {\n");
      out.write("            background-color: green;\n");
      out.write("        }\n");
      out.write("        .unavailable {\n");
      out.write("            background-color: red;\n");
      out.write("        }\n");
      out.write("        .container {\n");
      out.write("            max-width: 1200px;\n");
      out.write("            margin: 100px auto;\n");
      out.write("            padding: 20px;\n");
      out.write("            background-color: #fff;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("        }\n");
      out.write("        .btn {\n");
      out.write("            display: inline-block;\n");
      out.write("            font-weight: 400;\n");
      out.write("            color: #212529;\n");
      out.write("            text-align: center;\n");
      out.write("            vertical-align: middle;\n");
      out.write("            cursor: pointer;\n");
      out.write("            background-color: transparent;\n");
      out.write("            border: 1px solid transparent;\n");
      out.write("            padding: 0.375rem 0.75rem;\n");
      out.write("            font-size: 1rem;\n");
      out.write("            line-height: 1.5;\n");
      out.write("            border-radius: 0.25rem;\n");
      out.write("            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;\n");
      out.write("        }\n");
      out.write("        .btn-secondary {\n");
      out.write("            color: #fff;\n");
      out.write("            background-color: #6c757d;\n");
      out.write("            border-color: #6c757d;\n");
      out.write("        }\n");
      out.write("        .btn-secondary:hover {\n");
      out.write("            color: #fff;\n");
      out.write("            background-color: #5a6268;\n");
      out.write("            border-color: #545b62;\n");
      out.write("        }\n");
      out.write("        .details-table {\n");
      out.write("            width: 100%;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("            margin: 20px 0;\n");
      out.write("        }\n");
      out.write("        .details-table th, .details-table td {\n");
      out.write("            border: 1px solid #ddd;\n");
      out.write("            padding: 12px;\n");
      out.write("            text-align: left;\n");
      out.write("        }\n");
      out.write("        .details-table th {\n");
      out.write("            background-color: #f2f2f2;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("        <h1>Display Driver Bus Reports</h1>\n");
      out.write("    </header>\n");
      out.write("    <nav>\n");
      out.write("        <a href=\"adminDashboard.jsp\">Back to Admin Dashboard</a>\n");
      out.write("    </nav>\n");
      out.write("    <div class=\"container mt-5\">\n");
      out.write("        <h2>Assigned Driver Details</h2>\n");
      out.write("        <a href=\"DisplayReports.jsp\" class=\"btn btn-secondary mb-3\">Back to Reports</a><br><br>\n");
      out.write("        <table class=\"details-table\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Staff ID</th>\n");
      out.write("                    <th>Name</th>\n");
      out.write("                    <th>IC No</th>\n");
      out.write("                    <th>Assign Date</th>\n");
      out.write("                    <th>Bus Type</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                ");

                    String driverID = request.getParameter("driver");
                    String busID = request.getParameter("bus");
                    String assignDate = request.getParameter("assignDate");

                    boolean isSingleDecker = true;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");

                        // Get driver details
                        String driverQuery = "SELECT staff_id, staff_fullname, ic_number FROM staff WHERE staff_id = ?";
                        PreparedStatement driverStmt = conn.prepareStatement(driverQuery);
                        driverStmt.setString(1, driverID);
                        ResultSet driverRs = driverStmt.executeQuery();
                        String staffID = "", name = "", icNo = "";
                        if (driverRs.next()) {
                            staffID = driverRs.getString("staff_id");
                            name = driverRs.getString("staff_fullname");
                            icNo = driverRs.getString("ic_number");
                        }
                        driverRs.close();
                        driverStmt.close();

                        // Get bus type
                        String busQuery = "SELECT type FROM bus WHERE platno = ?";
                        PreparedStatement busStmt = conn.prepareStatement(busQuery);
                        busStmt.setString(1, busID);
                        ResultSet busRs = busStmt.executeQuery();
                        String busType = "";
                        if (busRs.next()) {
                            busType = busRs.getString("type");
                            isSingleDecker = "Single Decker".equalsIgnoreCase(busType);
                        }
                        busRs.close();
                        busStmt.close();
                        
                        out.println("<tr>");
                        out.println("<td>" + staffID + "</td>");
                        out.println("<td>" + name + "</td>");
                        out.println("<td>" + icNo + "</td>");
                        out.println("<td>" + assignDate + "</td>");
                        out.println("<td>" + busType + "</td>");
                        out.println("</tr>");

                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("        <div class=\"bus-layout\">\n");
      out.write("            <div class=\"legend\">\n");
      out.write("                <div class=\"legend-item\">\n");
      out.write("                    <div class=\"seat available\"></div>\n");
      out.write("                    <span>Available Seat</span>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"legend-item\">\n");
      out.write("                    <div class=\"seat unavailable\"></div>\n");
      out.write("                    <span>Unavailable Seat</span>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"driver-seat\">Driver</div>\n");
      out.write("            ");
 if (isSingleDecker) { 
      out.write("\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat1\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat2\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat3\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat4\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat5\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat6\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat7\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat8\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat9\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat10\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat11\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat12\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat13\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat14\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat15\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat16\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat17\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat18\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat19\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat20\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat21\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat22\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat23\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat24\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat25\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat26\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat27\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat28\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat29\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat30\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat31\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat32\"></div>\n");
      out.write("            </div>\n");
      out.write("            ");
 } else { 
      out.write("\n");
      out.write("            <h3>Lower Deck</h3>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat1\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat2\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat3\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat4\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat5\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat6\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat7\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat8\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat9\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat10\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat11\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat12\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat13\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat14\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat15\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat16\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat17\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat18\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat19\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat20\"></div>\n");
      out.write("            </div>\n");
      out.write("            <h3>Upper Deck</h3>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat21\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat22\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat23\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat24\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat25\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat26\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat27\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat28\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat29\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat30\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat31\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat32\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat33\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat34\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat35\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat36\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"seat-row\">\n");
      out.write("                <div class=\"seat available\" id=\"seat37\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat38\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat39\"></div>\n");
      out.write("                <div class=\"seat available\" id=\"seat40\"></div>\n");
      out.write("            </div>\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
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
