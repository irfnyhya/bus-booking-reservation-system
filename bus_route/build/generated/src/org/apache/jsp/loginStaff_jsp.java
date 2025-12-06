package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class loginStaff_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("    <title>Staff Login</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"styleslogin.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css\">\n");
      out.write("    <script>\n");
      out.write("        function presetICNumber() {\n");
      out.write("            var icInput = document.getElementById(\"ic_number\");\n");
      out.write("            if (icInput.value.length === 6 || icInput.value.length === 9) {\n");
      out.write("                icInput.value += '-';\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("         function togglePasswordVisibility() {\n");
      out.write("            var password = document.getElementById(\"password\");\n");
      out.write("            var eyeIcon = document.getElementById(\"password-eye\");\n");
      out.write("            if (password.type === \"password\") {\n");
      out.write("                password.type = \"text\";\n");
      out.write("                eyeIcon.classList.remove(\"fa-eye\");\n");
      out.write("                eyeIcon.classList.add(\"fa-eye-slash\");\n");
      out.write("            } else {\n");
      out.write("                password.type = \"password\";\n");
      out.write("                eyeIcon.classList.remove(\"fa-eye-slash\");\n");
      out.write("                eyeIcon.classList.add(\"fa-eye\");\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("        <h1>Staff Login</h1>\n");
      out.write("    </header>\n");
      out.write("    <nav>\n");
      out.write("        <a href=\"adminLogin.jsp\">Login as Admin</a>\n");
      out.write("        <a href=\"loginStaff.jsp\">Login as Staff</a>\n");
      out.write("       \n");
      out.write("    </nav>\n");
      out.write("    <main>\n");
      out.write("        <form action=\"loginStaff.jsp\" method=\"post\">\n");
      out.write("            <label for=\"ic_number\">IC Number:</label>\n");
      out.write("            <input type=\"text\" id=\"ic_number\" name=\"ic_number\" required oninput=\"presetICNumber()\" pattern=\"\\d{6}-\\d{2}-\\d{4}\" title=\"IC Number must be in the format 021122-11-0033\"><br>\n");
      out.write("            <label for=\"password\">Password:</label>\n");
      out.write("            <input type=\"password\" id=\"password\" name=\"password\" required><br>\n");
      out.write("            <i id=\"password-eye\" class=\"fa fa-eye\" onclick=\"togglePasswordVisibility('password')\"></i><br>\n");
      out.write("            <label for=\"role\">Role:</label>\n");
      out.write("            <select id=\"role\" name=\"role\" required>\n");
      out.write("                <option value=\"Driver\">Driver</option>\n");
      out.write("                <option value=\"Bus Owner\">Bus Owner</option>\n");
      out.write("            </select><br>\n");
      out.write("            <button type=\"submit\">Login</button>\n");
      out.write("        </form>\n");
      out.write("        ");

            if ("post".equalsIgnoreCase(request.getMethod())) {
                String dbURL = "jdbc:mysql://localhost:3306/bus_route";
                String dbUser = "root";
                String dbPass = "";

                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                    String icNumber = request.getParameter("ic_number");
                    String password = request.getParameter("password");
                    String role = request.getParameter("role");

                    String query = "SELECT * FROM staff WHERE ic_number = ? AND password = ? AND role = ?";
                    ps = conn.prepareStatement(query);
                    ps.setString(1, icNumber);
                    ps.setString(2, password);
                    ps.setString(3, role);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        
                        session.setAttribute("ic_number", icNumber);

                        if ("Driver".equalsIgnoreCase(role)) {
                            response.sendRedirect("driverDashboard.jsp");
                        } else if ("Bus Owner".equalsIgnoreCase(role)) {
                            response.sendRedirect("busOwnerDashboard.jsp");
                        }
                    } else {
                        out.println("<p>Invalid IC number, password, or role.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            }
        
      out.write("\n");
      out.write("    </main>\n");
      out.write("    <footer>\n");
      out.write("        <p>&copy; 2024 User Management System</p>\n");
      out.write("    </footer>\n");
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
