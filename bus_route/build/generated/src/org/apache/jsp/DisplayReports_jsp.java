package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class DisplayReports_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Display Reports</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"styledashboard.css\">\n");
      out.write("    <style>\n");
      out.write("        .table-container {\n");
      out.write("            margin: 20px auto;\n");
      out.write("            width: 90%;\n");
      out.write("            max-width: 1000px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .table-header {\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .table {\n");
      out.write("            width: 100%;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .table th, .table td {\n");
      out.write("            padding: 10px;\n");
      out.write("            text-align: left;\n");
      out.write("            border-bottom: 1px solid #ddd;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .table th {\n");
      out.write("            background-color: #f2f2f2;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .table tr:hover {\n");
      out.write("            background-color: #f5f5f5;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn {\n");
      out.write("            display: inline-block;\n");
      out.write("            padding: 5px 10px;\n");
      out.write("            text-align: center;\n");
      out.write("            text-decoration: none;\n");
      out.write("            border-radius: 4px;\n");
      out.write("            transition: background-color 0.3s;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-info {\n");
      out.write("            background-color: #17a2b8;\n");
      out.write("            color: #fff;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-info:hover {\n");
      out.write("            background-color: #138496;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-danger {\n");
      out.write("            background-color: #dc3545;\n");
      out.write("            color: #fff;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn-danger:hover {\n");
      out.write("            background-color: #c82333;\n");
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
      out.write("    <div class=\"container table-container\">\n");
      out.write("        <div class=\"table-header\">\n");
      out.write("            <h2>Assigned Driver Reports</h2>\n");
      out.write("        </div>\n");
      out.write("        <a href=\"GenerateReports.jsp\" class=\"back\">Back</a>\n");
      out.write("        <table class=\"table table-bordered\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Driver Name</th>\n");
      out.write("                    <th>Bus PlatNo</th>\n");
      out.write("                    <th>Assign Date</th>\n");
      out.write("                    <th>Action</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                ");
 
                    List<Map<String, String>> assignments = (List<Map<String, String>>) session.getAttribute("assignments");
                    if (assignments != null) {
                        for (Map<String, String> assignment : assignments) {
                            String driverID = assignment.get("driver");
                            String busID = assignment.get("bus");
                            String assignDate = assignment.get("assignDate");

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");
                                
                                // Get driver name
                                String driverName = "";
                                String driverQuery = "SELECT staff_fullname FROM staff WHERE staff_id = ?";
                                PreparedStatement driverStmt = conn.prepareStatement(driverQuery);
                                driverStmt.setString(1, driverID);
                                ResultSet driverRs = driverStmt.executeQuery();
                                if (driverRs.next()) {
                                    driverName = driverRs.getString("staff_fullname");
                                }
                                driverRs.close();
                                driverStmt.close();
                                
                                out.println("<tr>");
                                out.println("<td>" + driverName + "</td>");
                                out.println("<td>" + busID + "</td>");
                                out.println("<td>" + assignDate + "</td>");
                                out.println("<td>");
                                out.println("<a href='DeleteAssignDriver.jsp?assignDate=" + assignDate + "&bus=" + busID + "&driver=" + driverID + "' class='btn btn-danger'>Delete</a>");
                                out.println("</td>");
                                out.println("</tr>");

                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    }
                
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <footer>\n");
      out.write("        <p>&copy; 2024 User Management System</p>\n");
      out.write("    </footer>\n");
      out.write("            \n");
      out.write("    <script src=\"https://code .jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
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
