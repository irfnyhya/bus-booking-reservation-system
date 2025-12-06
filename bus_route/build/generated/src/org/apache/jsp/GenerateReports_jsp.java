package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class GenerateReports_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Generate Reports</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"styledashboard.css\">\n");
      out.write("    <style>\n");
      out.write("        .container {\n");
      out.write("            margin: 100px auto;\n");
      out.write("            max-width: 500px;\n");
      out.write("            background-color: white;\n");
      out.write("            padding: 20px;\n");
      out.write("            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("        }\n");
      out.write("        .form-header {\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("        .form-group {\n");
      out.write("            margin-bottom: 15px;\n");
      out.write("        }\n");
      out.write("        .form-group label {\n");
      out.write("            display: block;\n");
      out.write("            margin-bottom: 5px;\n");
      out.write("        }\n");
      out.write("        .form-group select, .form-group input {\n");
      out.write("            width: 100%;\n");
      out.write("            padding: 8px;\n");
      out.write("            box-sizing: border-box;\n");
      out.write("        }\n");
      out.write("        .btn-primary {\n");
      out.write("            background-color: #007bff;\n");
      out.write("            color: white;\n");
      out.write("            padding: 10px 15px;\n");
      out.write("            border: none;\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write("        .btn-primary:hover {\n");
      out.write("            background-color: #0056b3;\n");
      out.write("        }\n");
      out.write("        .alert {\n");
      out.write("            padding: 10px;\n");
      out.write("            background-color: #f44336;\n");
      out.write("            color: white;\n");
      out.write("            margin-top: 20px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("        <h1>Admin Dashboard</h1>\n");
      out.write("    </header>\n");
      out.write("    <nav>\n");
      out.write("        <a href=\"adminDashboard.jsp\">Back to Admin Dashboard</a>\n");
      out.write("    </nav>\n");
      out.write("    <div class=\"container form-container\">\n");
      out.write("        <div class=\"form-header\">\n");
      out.write("            <h2>Assign Driver to Bus</h2>\n");
      out.write("        </div>\n");
      out.write("        <form action=\"GenerateReports.jsp\" method=\"post\">\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"driver\">Select Driver:</label>\n");
      out.write("                <select name=\"driver\" id=\"driver\" class=\"form-control\" required>\n");
      out.write("                    <option value=\"\">Select Driver</option>\n");
      out.write("                    ");
 
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT staff_id, staff_fullname FROM staff WHERE role='Driver'");
                            while (rs.next()) {
                                String staffID = rs.getString("staff_id");
                                String name = rs.getString("staff_fullname");
                                out.println("<option value='" + staffID + "'>" + name + "</option>");
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    
      out.write("\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"bus\">Select Bus:</label>\n");
      out.write("                <select name=\"bus\" id=\"bus\" class=\"form-control\" required>\n");
      out.write("                    <option value=\"\">Select Bus</option>\n");
      out.write("                    ");
 
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT platno FROM bus");
                            while (rs.next()) {
                                String platNo = rs.getString("platno");
                                out.println("<option value='" + platNo + "'>" + platNo + "</option>");
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    
      out.write("\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"assignDate\">Assign Date:</label>\n");
      out.write("                <select name=\"assignDate\" id=\"assignDate\" class=\"form-control\" required>\n");
      out.write("                    <option value=\"\">Select Date</option>\n");
      out.write("                    ");
 
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT DISTINCT date FROM reservation");
                            while (rs.next()) {
                                String Date = rs.getString("date");
                                out.println("<option value='" + Date + "'>" + Date + "</option>");
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    
      out.write("\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("            <button type=\"submit\" class=\"btn btn-primary\">Assign</button>\n");
      out.write("            <a href=\"DisplayReports.jsp\">Report Driver List</a>\n");
      out.write("        </form>\n");
      out.write("        ");
 
            if (request.getMethod().equalsIgnoreCase("post")) {
                String driver = request.getParameter("driver");
                String bus = request.getParameter("bus");
                String assignDate = request.getParameter("assignDate");

                List<Map<String, String>> assignments = (List<Map<String, String>>) session.getAttribute("assignments");
                if (assignments == null) {
                    assignments = new ArrayList<>();
                }

                Map<String, String> assignment = new HashMap<>();
                assignment.put("driver", driver);
                assignment.put("bus", bus);
                assignment.put("assignDate", assignDate);
                assignments.add(assignment);

                session.setAttribute("assignments", assignments);
                
                response.sendRedirect("DisplayReports.jsp");
            }
        
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <footer>\n");
      out.write("        <p>&copy; 2024 User Management System</p>\n");
      out.write("    </footer>\n");
      out.write("    \n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
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
