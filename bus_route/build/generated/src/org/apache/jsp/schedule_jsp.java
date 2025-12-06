package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class schedule_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Manage Bus</title>\n");
      out.write("        <style>\n");
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
      out.write("            header {\n");
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
      out.write("                border: 1px solid #007bff;\n");
      out.write("                padding: 10px 20px;\n");
      out.write("                margin-left: 10px;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                cursor: pointer;\n");
      out.write("                font-family: Arial, sans-serif;\n");
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
      out.write("                background-color: #007bff;\n");
      out.write("                color: #fff;\n");
      out.write("                padding: 20px 0;\n");
      out.write("                text-align: center;\n");
      out.write("                position: relative;\n");
      out.write("                width: 100%;\n");
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
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("            <h1>Schedule</h1>\n");
      out.write("        </header>\n");
      out.write("        <nav>\n");
      out.write("            <a href=\"driverDashboard.jsp\">Back To Dashboard</a>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <main>\n");
      out.write("            <div class=\"content-container\">\n");
      out.write("                <h1>Schedule</h1>\n");
      out.write("\n");
      out.write("                <table>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Route ID</th>\n");
      out.write("                        <th>Bus</th>\n");
      out.write("                        <th>Departure Time</th>\n");
      out.write("                        <th>Arrival Time</th>\n");
      out.write("                        <th>Date</th>\n");
      out.write("                    </tr>\n");
      out.write("                    ");

                        Class.forName("com.mysql.jdbc.Driver");
                        String myUrl = "jdbc:mysql://localhost:3306/bus_route";
                        Connection myconnection = DriverManager.getConnection(myUrl, "root", "");

                        Statement myStatement = myconnection.createStatement();
                        String myQuery = "SELECT r.routeid, rt.platno, r.departuretime, r.arrivaltime, r.date " +
                                         "FROM reservation r " +
                                         "JOIN route rt ON r.routeid = rt.routeid";
                        ResultSet myRs = myStatement.executeQuery(myQuery);

                        while (myRs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + myRs.getString("routeid") + "</td>");
                            out.println("<td>" + myRs.getString("platno") + "</td>");
                            out.println("<td>" + myRs.getString("departuretime") + "</td>");
                            out.println("<td>" + myRs.getString("arrivaltime") + "</td>");
                            out.println("<td>" + myRs.getString("date") + "</td>");
                            out.println("</tr>");
                        }

                        myconnection.close();
                    
      out.write("\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </main>\n");
      out.write("\n");
      out.write("        <footer>\n");
      out.write("            <p>&copy; 2024 Bus Booking System. All rights reserved.</p>\n");
      out.write("        </footer>\n");
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
