package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addbus_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Add New Student Page</title>\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                font-family: Arial, sans-serif;\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                background-color: #f4f4f4;\n");
      out.write("                color: #333;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            header, footer {\n");
      out.write("                background-color: #007bff;\n");
      out.write("                color: white;\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 15px 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            header nav {\n");
      out.write("                position: absolute;\n");
      out.write("                top: 30px;\n");
      out.write("                right: 20px;\n");
      out.write("            }\n");
      out.write("            \n");
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
      out.write("                color: maroon;\n");
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
      out.write("                padding: 20px;\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("                align-items: center;\n");
      out.write("                min-height: calc(100vh - 120px); /* Adjust to fit header and footer */\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-container {\n");
      out.write("                background-color: white;\n");
      out.write("                padding: 20px;\n");
      out.write("                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("                border-radius: 8px;\n");
      out.write("                width: 100%;\n");
      out.write("                max-width: 600px;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            h2, h3 {\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            form table {\n");
      out.write("                width: 100%;\n");
      out.write("                margin: 20px 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            form table td {\n");
      out.write("                padding: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            form input[type=\"text\"], form input[type=\"number\"], form input[type=\"time\"] {\n");
      out.write("                width: calc(100% - 20px);\n");
      out.write("                padding: 8px;\n");
      out.write("                margin: 5px 0;\n");
      out.write("                border: 1px solid #ccc;\n");
      out.write("                border-radius: 4px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            form select {\n");
      out.write("                width: calc(100% - 20px);\n");
      out.write("                padding: 8px;\n");
      out.write("                margin: 5px 0;\n");
      out.write("                border: 1px solid #ccc;\n");
      out.write("                border-radius: 4px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            form input[type=\"submit\"], form input[type=\"reset\"] {\n");
      out.write("                padding: 10px 20px;\n");
      out.write("                border: none;\n");
      out.write("                border-radius: 4px;\n");
      out.write("                cursor: pointer;\n");
      out.write("                margin-right: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            form input[type=\"submit\"] {\n");
      out.write("                background-color: #007bff;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            form input[type=\"reset\"] {\n");
      out.write("                background-color: gray;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            form input[type=\"submit\"]:hover, form input[type=\"reset\"]:hover {\n");
      out.write("                opacity: 0.9;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            footer {\n");
      out.write("                position: fixed;\n");
      out.write("                width: 100%;\n");
      out.write("                bottom: 0;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <script>\n");
      out.write("            function setCapacity() {\n");
      out.write("                var type = document.getElementById(\"busType\").value;\n");
      out.write("                var capacityField = document.getElementById(\"capacity\");\n");
      out.write("\n");
      out.write("                if (type === \"Single Deck\") {\n");
      out.write("                    capacityField.value = 40;\n");
      out.write("                } else if (type === \"Double Deck\") {\n");
      out.write("                    capacityField.value = 50;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("            <h1>Bus Booking System</h1>\n");
      out.write("        </header>\n");
      out.write("         <nav>\n");
      out.write("            <a href=\"busOwnerDashboard.jsp\">Back to Dashboard</a>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <main>\n");
      out.write("            <div class=\"form-container\">\n");
      out.write("                <h2>Add Bus That is Available</h2>\n");
      out.write("                <h3>Add Bus Form</h3>\n");
      out.write("                <form action=\"process-addbus.jsp\" method=\"POST\">\n");
      out.write("                    <input type=\"hidden\" name=\"command\" value=\"ADD\"/>\n");
      out.write("                    <table>\n");
      out.write("                        <tbody>\n");
      out.write("                            <tr>\n");
      out.write("                                <td><label>Plat Number:</label></td>\n");
      out.write("                                <td><input type=\"text\" name=\"platno\" required /></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td><label>Type Of Bus:</label></td>\n");
      out.write("                                <td>\n");
      out.write("                                    <select name=\"type\" id=\"busType\" required onchange=\"setCapacity()\">\n");
      out.write("                                        <option value=\"Single Deck\">Single Deck</option>\n");
      out.write("                                        <option value=\"Double Deck\">Double Deck</option>\n");
      out.write("                                    </select>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td><label>Capacity:</label></td>\n");
      out.write("                                <td><input type=\"number\" name=\"capacity\" id=\"capacity\" required /></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td><label>Status Of Bus:</label></td>\n");
      out.write("                                <td>\n");
      out.write("                                    <select name=\"status\">\n");
      out.write("                                        <option>Maintenance</option>\n");
      out.write("                                        <option>Available</option>\n");
      out.write("                                    </select>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td></td>\n");
      out.write("                                <td><input type=\"submit\" value=\"Save\"/> <input type=\"reset\" value=\"Cancel\" /></td>\n");
      out.write("                            </tr>\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                </form>\n");
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
