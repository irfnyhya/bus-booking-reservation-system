package org.apache.jsp.USER_0020MODULE;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public final class loginUser_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Login</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<header>\n");
      out.write("    <div class=\"bottom-bar\">\n");
      out.write("        <div class=\"bottom-bar__content\">\n");
      out.write("            <a href=\"Dashboard.jsp\" class=\"logo\">\n");
      out.write("                <img class=\"logo__img\" src=\"logo.png\" alt=\"logo\">\n");
      out.write("                <span class=\"logo__text\">Bus Ticket Reservation</span>\n");
      out.write("            </a>\n");
      out.write("\n");
      out.write("            <nav class=\"nav\">\n");
      out.write("                <ul class=\"nav__list\">\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a class=\"btn\" href=\"loginUser.jsp\">Login</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav__item\">\n");
      out.write("                        <a class=\"nav__link\" href=\"signup.jsp\">Sign Up</a>\n");
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
      out.write("<main style=\"height:600px;\">\n");
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <form class=\"horizontal-form\" action=\"loginUser.jsp\" method=\"post\">\n");
      out.write("            <label for=\"ic_number\">IC Number:</label>\n");
      out.write("            <input type=\"text\" id=\"ic_number\" name=\"ic_number\" required oninput=\"presetICNumber()\" pattern=\"\\d{6}-\\d{2}-\\d{4}\" title=\"IC Number must be in the format 021122-11-0033\" placeholder=\"021122-11-0033\">\n");
      out.write("\n");
      out.write("            <label for=\"password\">Password:</label>\n");
      out.write("            <input type=\"password\" id=\"password\" name=\"password\" required>\n");
      out.write("\n");
      out.write("            <i style=\"margin-right: 45%\" id=\"password-eye\" class=\"fa fa-eye\" onclick=\"togglePasswordVisibility('password')\"></i>\n");
      out.write("\n");
      out.write("            <div class=\"additional-options\">\n");
      out.write("                <p>Don't have an account? <a href=\"signup.jsp\">Sign Up</a></p>\n");
      out.write("            </div>\n");
      out.write("            <button type=\"submit\">Login</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    ");

        boolean loginFailed = false;
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

                String query = "SELECT user_id FROM users WHERE ic_number = ? AND password = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, icNumber);
                ps.setString(2, password);

                rs = ps.executeQuery();

                if (rs.next()) {
                    int userId = rs.getInt("user_id");
                    session.setAttribute("ic_number", icNumber); // Set session attribute for IC Number
                    session.setAttribute("user_id", userId); // Set session attribute for User ID
                    response.sendRedirect("Dashboard.jsp");
                } else {
                    loginFailed = true;
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (ps != null) try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (conn != null) try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    
      out.write("\n");
      out.write("    ");
 if (loginFailed) { 
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert(\"Invalid IC number or password.\");\n");
      out.write("        </script>\n");
      out.write("    ");
 } 
      out.write("\n");
      out.write("</main>\n");
      out.write("<footer class=\"footer-distributed\">\n");
      out.write("    <div class=\"footer-left\">\n");
      out.write("        <img class=\"logofooter\" src=\"logo.png\" alt=\"logo\">\n");
      out.write("\n");
      out.write("        <p class=\"footer-links\">\n");
      out.write("            <a href=\"Dasboard.jsp\" class=\"link-1\">Dashboard</a>\n");
      out.write("            <a href=\"Booking.jsp\">Booking</a>\n");
      out.write("            <a href=\"viewProfile.jsp\">Profile</a>\n");
      out.write("            <a href=\"feedback.jsp\">Feedback</a>\n");
      out.write("        </p>\n");
      out.write("        <p class=\"footer-company-name\">Tiny Travel Co. © 2024</p>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"footer-center\">\n");
      out.write("        <div>\n");
      out.write("            <i class=\"fa fa-map-marker\"></i>\n");
      out.write("            <p><span>Kuala Nerus</span> Terengganu, Malaysia</p>\n");
      out.write("        </div>\n");
      out.write("        <div>\n");
      out.write("            <i class=\"fa fa-phone\"></i>\n");
      out.write("            <p>+60 123456789</p>\n");
      out.write("        </div>\n");
      out.write("        <div>\n");
      out.write("            <i class=\"fa fa-envelope\"></i>\n");
      out.write("            <p><a href=\"mailto:tinytravel@company.com\">tinytravel@company.com</a></p>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"footer-right\">\n");
      out.write("        <p class=\"footer-company-about\">\n");
      out.write("            <span>About the company</span>\n");
      out.write("            Your go-to solution for easy bus ticket booking! Whether you're commuting, planning a weekend trip, or a long journey, our platform ensures a seamless and convenient booking experience. Travel effortlessly with Tiny Travel Company!\n");
      out.write("        </p>\n");
      out.write("        <div class=\"footer-icons\">\n");
      out.write("            <a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\n");
      out.write("            <a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\n");
      out.write("            <a href=\"#\"><i class=\"fa fa-linkedin\"></i></a>\n");
      out.write("            <a href=\"#\"><i class=\"fa fa-github\"></i></a>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</footer>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    function presetICNumber() {\n");
      out.write("        var icInput = document.getElementById(\"ic_number\");\n");
      out.write("        if (icInput.value.length === 6 || icInput.value.length === 9) {\n");
      out.write("            icInput.value += '-';\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("    function togglePasswordVisibility(id) {\n");
      out.write("        var password = document.getElementById(id);\n");
      out.write("        var eyeIcon = document.getElementById(id + \"-eye\");\n");
      out.write("        if (password.type === \"password\") {\n");
      out.write("            password.type = \"text\";\n");
      out.write("            eyeIcon.classList.remove(\"fa-eye\");\n");
      out.write("            eyeIcon.classList.add(\"fa-eye-slash\");\n");
      out.write("        } else {\n");
      out.write("            password.type = \"password\";\n");
      out.write("            eyeIcon.classList.remove(\"fa-eye-slash\");\n");
      out.write("            eyeIcon.classList.add(\"fa-eye\");\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("\n");
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
