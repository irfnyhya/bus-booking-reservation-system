package org.apache.jsp.USER_0020MODULE;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public final class viewProfile_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("        <link href=\"index.css\" rel=\"stylesheet\">\n");
      out.write("        <title>Profile</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("            <div class=\"bottom-bar\">\n");
      out.write("                <div class=\"bottom-bar__content\">\n");
      out.write("                    <a href=\"Dashboard.html\" class=\"logo\">\n");
      out.write("                        <img class=\"logo__img\" src=\"logo.png\" alt=\"logo\">\n");
      out.write("                        <span class=\"logo__text\">Bus Ticket Reservation</span>\n");
      out.write("                    </a>\n");
      out.write("\n");
      out.write("                    <nav class=\"nav\">\n");
      out.write("                        <ul class=\"nav__list\">\n");
      out.write("                            <li class=\"nav__item\">\n");
      out.write("                                <a class=\"nav_link\" href=\"Dashboard.jsp\">Dashboard</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav__item\">\n");
      out.write("                                <a class=\"nav__link\" href=\"booking.jsp\">Booking</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav__item\">\n");
      out.write("                                <a class=\"btn\" href=\"viewProfile.jsp\">Profile</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav__item\">\n");
      out.write("                                <a class=\"nav__link\" href=\"Help.html\">Help</a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </nav>\n");
      out.write("\n");
      out.write("                    <div class=\"hamburger\">\n");
      out.write("                        <div class=\"bar\"></div>\n");
      out.write("                        <div class=\"bar\"></div>\n");
      out.write("                        <div class=\"bar\"></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("    \n");
      out.write("    <main>\n");
      out.write("        ");

            String dbURL = "jdbc:mysql://localhost:3306/bus_route";
            String dbUser = "root";
            String dbPass = "";

            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String email = null;
            String icNumber = null;
            String username = null;
            String fullname = null;
            String password = null;

            // Assume user is logged in and their IC number is stored in session
            String userICNumber = (String) session.getAttribute("ic_number");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // Fetch user details
                String query = "SELECT username, fullname, email, ic_number,password FROM users WHERE ic_number = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, userICNumber);
                rs = ps.executeQuery();

                if (rs.next()) {
                    username = rs.getString("username");
                    fullname = rs.getString("fullname");
                    email = rs.getString("email");
                    icNumber = rs.getString("ic_number");
                    password = rs.getString("password");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("        \n");
      out.write("        <div class=\"profile-info\">\n");
      out.write("            <p><strong>Username:</strong> ");
      out.print( username );
      out.write("</p>\n");
      out.write("            <p><strong>Full Name:</strong> ");
      out.print( fullname );
      out.write("</p>\n");
      out.write("            <p><strong>Email:</strong> ");
      out.print( email );
      out.write("</p>\n");
      out.write("            <p><strong>IC Number:</strong> ");
      out.print( icNumber );
      out.write("</p>\n");
      out.write("            <p><strong>Password:</strong> ");
      out.print( password );
      out.write("</p>\n");
      out.write("        \n");
      out.write("        <button onclick=\"location.href='editProfile.jsp'\">Edit Profile</button>\n");
      out.write("        <button onclick=\"location.href='loginUser.jsp'\">Log Out</button>\n");
      out.write("        </div>\n");
      out.write("            </div>\n");
      out.write("    </main>\n");
      out.write("    <footer class=\"footer-distributed\">\n");
      out.write("            <div class=\"footer-left\">\n");
      out.write("                <img class=\"logofooter\" src=\"logo.png\" alt=\"logo\">\n");
      out.write("\n");
      out.write("                <p class=\"footer-links\">\n");
      out.write("                    <a href=\"#\" class=\"link-1\">Dashboard</a>\n");
      out.write("                    <a href=\"#\">About</a>\n");
      out.write("                    <a href=\"#\">Booking</a>\n");
      out.write("                    <a href=\"#\">Help</a>\n");
      out.write("                </p>\n");
      out.write("                <p class=\"footer-company-name\">Tiny Travel Co. © 2024</p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"footer-center\">\n");
      out.write("                <div>\n");
      out.write("                    <i class=\"fa fa-map-marker\"></i>\n");
      out.write("                    <p><span>Kuala Nerus</span> Terengganu, Malaysia</p>\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <i class=\"fa fa-phone\"></i>\n");
      out.write("                    <p>+60 123456789</p>\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <i class=\"fa fa-envelope\"></i>\n");
      out.write("                    <p><a href=\"mailto:tinytravel@company.com\">tinytravel@company.com</a></p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"footer-right\">\n");
      out.write("                <p class=\"footer-company-about\">\n");
      out.write("                    <span>About the company</span>\n");
      out.write("                    Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu\n");
      out.write("                    auctor\n");
      out.write("                    lacus vehicula sit amet.\n");
      out.write("                </p>\n");
      out.write("                <div class=\"footer-icons\">\n");
      out.write("                    <a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\n");
      out.write("                    <a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\n");
      out.write("                    <a href=\"#\"><i class=\"fa fa-linkedin\"></i></a>\n");
      out.write("                    <a href=\"#\"><i class=\"fa fa-github\"></i></a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("<script>\n");
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
      out.write("        </script>\n");
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
