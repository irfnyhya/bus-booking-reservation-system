package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class process_002dupdateroute_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <title>Update Route</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            background-color: #f4f4f4;\n");
      out.write("            color: #333;\n");
      out.write("        }\n");
      out.write("        header, footer {\n");
      out.write("            background-color: #007bff;\n");
      out.write("            color: #fff;\n");
      out.write("            padding: 20px 0;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("        header h1 {\n");
      out.write("            margin: 0;\n");
      out.write("        }\n");
      out.write("        nav {\n");
      out.write("            background-color: #0056b3;\n");
      out.write("            padding: 10px 0;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("        nav a {\n");
      out.write("            color: #fff;\n");
      out.write("            text-decoration: none;\n");
      out.write("            margin: 0 15px;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("        nav a:hover {\n");
      out.write("            text-decoration: underline;\n");
      out.write("        }\n");
      out.write("        nav input[type=\"button\"] {\n");
      out.write("            background-color: white;\n");
      out.write("            color: maroon;\n");
      out.write("            border: 1px solid #007bff;\n");
      out.write("            padding: 10px 20px;\n");
      out.write("            margin-left: 10px;\n");
      out.write("            border-radius: 4px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("        }\n");
      out.write("        nav input[type=\"button\"]:hover {\n");
      out.write("            background-color: grey;\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("        main {\n");
      out.write("            padding: 20px;\n");
      out.write("            display: flex;\n");
      out.write("            flex-direction: column;\n");
      out.write("            align-items: center;\n");
      out.write("            min-height: calc(100vh - 120px);\n");
      out.write("        }\n");
      out.write("        .form-container {\n");
      out.write("            background-color: white;\n");
      out.write("            padding: 20px;\n");
      out.write("            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("            border-radius: 8px;\n");
      out.write("            width: 100%;\n");
      out.write("            max-width: 600px;\n");
      out.write("            box-sizing: border-box;\n");
      out.write("        }\n");
      out.write("        h2 {\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("        form table {\n");
      out.write("            width: 100%;\n");
      out.write("            margin: 20px 0;\n");
      out.write("        }\n");
      out.write("        form table td {\n");
      out.write("            padding: 10px;\n");
      out.write("        }\n");
      out.write("        form input[type=\"text\"], form input[type=\"number\"], form input[type=\"time\"] {\n");
      out.write("            width: calc(100% - 20px);\n");
      out.write("            padding: 8px;\n");
      out.write("            margin: 5px 0;\n");
      out.write("            border: 1px solid #ccc;\n");
      out.write("            border-radius: 4px;\n");
      out.write("        }\n");
      out.write("        form input[type=\"submit\"], form input[type=\"button\"] {\n");
      out.write("            padding: 10px 20px;\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 4px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            margin-right: 10px;\n");
      out.write("        }\n");
      out.write("        form input[type=\"submit\"] {\n");
      out.write("            background-color: #007bff;\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("        form input[type=\"button\"] {\n");
      out.write("            background-color: gray;\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("        form input[type=\"submit\"]:hover, form input[type=\"button\"]:hover {\n");
      out.write("            opacity: 0.9;\n");
      out.write("        }\n");
      out.write("        footer {\n");
      out.write("            position: fixed;\n");
      out.write("            width: 100%;\n");
      out.write("            bottom: 0;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("        <h1>Update Route</h1>\n");
      out.write("    </header>\n");
      out.write("    <nav>\n");
      out.write("        <a href=\"adminDashboard.jsp\">Back to Admin Dashboard</a>\n");
      out.write("    </nav>\n");
      out.write("    <main>\n");
      out.write("        <div class=\"form-container\">\n");
      out.write("            ");

                String routeid1 = request.getParameter("routeid");
                String myplatno = "", myorigin = "", mydestination = "", mydeparture = "", myarrival = "", myprice = "";

                Class.forName("com.mysql.jdbc.Driver");
                String myUrl = "jdbc:mysql://localhost:3306/bus_route";
                Connection myconnection = DriverManager.getConnection(myUrl, "root", "");

                Statement myStatement = myconnection.createStatement();
                String myQuery = "SELECT * FROM route WHERE routeid= '" + routeid1 + "'";
                ResultSet myRs = myStatement.executeQuery(myQuery);

                if (myRs.next()) {
                    myplatno = myRs.getString(2);
                    myorigin = myRs.getString(3);
                    mydestination = myRs.getString(4);
                    mydeparture = myRs.getString(5);
                    myarrival = myRs.getString(6);
                    myprice = myRs.getString(7);
                }
                
                // Fetch the list of buses for the dropdown
                String busQuery = "SELECT DISTINCT platno FROM route";
                ResultSet busRs = myStatement.executeQuery(busQuery);
            
      out.write("\n");
      out.write("            <h2>Update Route</h2>\n");
      out.write("            <form action=\"process-updateroute2.jsp\" method=\"POST\">\n");
      out.write("                <input type=\"hidden\" name=\"hidid\" value=\"");
      out.print(routeid1);
      out.write("\"/>\n");
      out.write("                <table>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"bus\">Bus: </label></td>\n");
      out.write("                        <td>\n");
      out.write("                            <select name=\"platno\" id=\"platno\">\n");
      out.write("                                ");
 while (busRs.next()) { 
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print( busRs.getString("platno") );
      out.write("\" \n");
      out.write("                                    ");
      out.print( busRs.getString("platno").equals(myplatno) ? "selected" : "" );
      out.write(">\n");
      out.write("                                        ");
      out.print( busRs.getString("platno") );
      out.write("\n");
      out.write("                                    </option>\n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                            </select>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label>Origin: </label></td>\n");
      out.write("                        <td><input type=\"text\" name=\"origin\" value=\"");
      out.print(myorigin);
      out.write("\" required/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label>Destination: </label></td>\n");
      out.write("                        <td><input type=\"text\" name=\"destination\" value=\"");
      out.print(mydestination);
      out.write("\" required/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label>Departure Time: </label></td>\n");
      out.write("                        <td><input type=\"time\" name=\"departuretime\" value=\"");
      out.print(mydeparture);
      out.write("\" required/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label>Arrival Time: </label></td>\n");
      out.write("                        <td><input type=\"time\" name=\"arrivaltime\" value=\"");
      out.print(myarrival);
      out.write("\" required/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label>Price: </label></td>\n");
      out.write("                        <td><input type=\"number\" name=\"price\" value=\"");
      out.print(myprice);
      out.write("\" required/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        <td>\n");
      out.write("                            <input type=\"submit\" value=\"Update\"/>\n");
      out.write("                            <input type=\"button\" value=\"Cancel\" onclick=\"window.location.href='process-viewroute.jsp'; return false;\"/>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("    </main>\n");
      out.write("    <footer>\n");
      out.write("        <p>&copy; 2024 Bus Booking System. All rights reserved.</p>\n");
      out.write("    </footer>\n");
      out.write("    ");

        myconnection.close();
    
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
