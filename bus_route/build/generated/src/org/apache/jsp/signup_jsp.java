package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public final class signup_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <head>\n");
      out.write("        <title>Sign Up</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("        <link href=\"index.css\" rel=\"stylesheet\">\n");
      out.write("        <title>Sign Up</title>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
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
      out.write("                                <a class=\"nav_link\" href=\"loginUser.jsp\">Login</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav__item\">\n");
      out.write("                                <a class=\"btn\" href=\"signup.jsp\">Sign Up</a>\n");
      out.write("\n");
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
      out.write("        <main>\n");
      out.write("\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <form class=\"horizontal-form\" action=\"signup.jsp\" method=\"post\">\n");
      out.write("                    <label for=\"username\">Username:</label>\n");
      out.write("                    <input type=\"text\" id=\"username\" name=\"username\" required>\n");
      out.write("                    <label for=\"fullname\">Full Name:</label>\n");
      out.write("                    <input type=\"text\" id=\"fullname\" name=\"fullname\" required>\n");
      out.write("                    <label for=\"email\">Email:</label>\n");
      out.write("                    <input type=\"email\" id=\"email\" name=\"email\" required>\n");
      out.write("                    <label for=\"ic_number\">IC Number:</label>\n");
      out.write("                    <input type=\"text\" id=\"ic_number\" name=\"ic_number\" required oninput=\"presetICNumber()\" pattern=\"\\d{6}-\\d{2}-\\d{4}\" title=\"IC Number must be in the format 021122-11-0033\">\n");
      out.write("                    <label for=\"password\">Password:</label>\n");
      out.write("                    <input type=\"password\" id=\"password\" name=\"password\" required>\n");
      out.write("                    <label for=\"confirm_password\">Confirm Password:</label>\n");
      out.write("                    <input type=\"password\" id=\"confirm_password\" name=\"confirm_password\" required>\n");
      out.write("                    <i style=\"margin-right: 45%\" id=\"password-eye\" class=\"fa fa-eye\" onclick=\"togglePasswordVisibility('password')\"></i>\n");
      out.write("                    <button type=\"submit\">Sign Up</button>\n");
      out.write("                    <div class=\"additional-options\">\n");
      out.write("                        <p>Already have an account? <a href=\"loginUser.jsp\">Log In</a></p>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            ");

                if ("post".equalsIgnoreCase(request.getMethod())) {
                    String dbURL = "jdbc:mysql://localhost:3306/bus_route";
                    String dbUser = "root";
                    String dbPass = "";

                    Connection conn = null;
                    PreparedStatement psCheck = null;
                    PreparedStatement psInsert = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                        String username = request.getParameter("username");
                        String fullname = request.getParameter("fullname");
                        String email = request.getParameter("email");
                        String icNumber = request.getParameter("ic_number");
                        String password = request.getParameter("password");

                        // Check if email, IC Number, or username already exists
                        String checkQuery = "SELECT COUNT(*) FROM users WHERE email = ? OR ic_number = ? OR username = ?";
                        psCheck = conn.prepareStatement(checkQuery);
                        psCheck.setString(1, email);
                        psCheck.setString(2, icNumber);
                        psCheck.setString(3, username);
                        rs = psCheck.executeQuery();
                        if (rs.next() && rs.getInt(1) > 0) {
                            out.println("<p>Email, IC Number, or Username already exists. Please use a different email, IC Number, or Username.</p>");
                        } else {
                            // Validate IC Number format on server side
                            String icPattern = "\\d{6}-\\d{2}-\\d{4}";
                            if (!icNumber.matches(icPattern)) {
                                out.println("<p>Invalid IC Number format. It must be in the format 021122-11-0033</p>");
                            } else {
                                // Validate password format on server side
                                String passwordPattern = "^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,}$";
                                if (!password.matches(passwordPattern)) {
                                    out.println("<p>Password must contain at least one capital letter, one number, one special character, and be at least 8 characters long.</p>");
                                } else {
                                    String insertQuery = "INSERT INTO users (username, fullname, email, ic_number, password) VALUES (?, ?, ?, ?, ?)";
                                    psInsert = conn.prepareStatement(insertQuery);
                                    psInsert.setString(1, username);
                                    psInsert.setString(2, fullname);
                                    psInsert.setString(3, email);
                                    psInsert.setString(4, icNumber);
                                    psInsert.setString(5, password);
                                    int result = psInsert.executeUpdate();

                                    if (result > 0) {
                                        out.println("<script>redirectToHome();</script>");
                                    } else {
                                        out.println("<p>Error registering user.</p>");
                                    }
                                }
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try {
                            rs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        if (psCheck != null) try {
                            psCheck.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        if (psInsert != null) try {
                            psInsert.close();
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
      out.write("        </main>\n");
      out.write("        <footer class=\"footer-distributed\">\n");
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
      out.write("\n");
      out.write("        <script>\n");
      out.write("            function redirectToHome() {\n");
      out.write("                alert(\"User registered successfully!\");\n");
      out.write("                window.location.href = \"loginUser.jsp\";\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function validateForm() {\n");
      out.write("                var password = document.getElementById(\"password\").value;\n");
      out.write("                var confirmPassword = document.getElementById(\"confirm_password\").value;\n");
      out.write("                var passwordPattern = /^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*?]).{8,}$/;\n");
      out.write("                if (!password.match(passwordPattern)) {\n");
      out.write("                    alert(\"Password must contain at least one capital letter, one number, one special character, and be at least 8 characters long.\");\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                if (password !== confirmPassword) {\n");
      out.write("                    alert(\"Passwords do not match.\");\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                return true;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function presetICNumber() {\n");
      out.write("                var icInput = document.getElementById(\"ic_number\");\n");
      out.write("                if (icInput.value.length === 6 || icInput.value.length === 9) {\n");
      out.write("                    icInput.value += '-';\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            function togglePasswordVisibility(id) {\n");
      out.write("                var password = document.getElementById(id);\n");
      out.write("                var eyeIcon = document.getElementById(id + \"-eye\");\n");
      out.write("                if (password.type === \"password\") {\n");
      out.write("                    password.type = \"text\";\n");
      out.write("                    eyeIcon.classList.remove(\"fa-eye\");\n");
      out.write("                    eyeIcon.classList.add(\"fa-eye-slash\");\n");
      out.write("                } else {\n");
      out.write("                    password.type = \"password\";\n");
      out.write("                    eyeIcon.classList.remove(\"fa-eye-slash\");\n");
      out.write("                    eyeIcon.classList.add(\"fa-eye\");\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
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
