package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class FAQ_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>FAQ - Bus System</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"index.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header class=\"header\">\n");
      out.write("        <h1>Frequently Asked Questions</h1>\n");
      out.write("    </header>\n");
      out.write("    <nav id=\"sidebar\" class=\"collapsed\">\n");
      out.write("        <span class=\"close-btn\" onclick=\"toggleSidebar()\">&times;</span>\n");
      out.write("        <a href=\"userDashboard.jsp\">Back to Dashboard</a>\n");
      out.write("        <a href=\"#faq1\" onclick=\"showContent('faq1')\">How do I purchase a bus ticket?</a>\n");
      out.write("        <a href=\"#faq2\" onclick=\"showContent('faq2')\">What are the different types of bus passes available?</a>\n");
      out.write("        <a href=\"#faq3\" onclick=\"showContent('faq3')\">How do I check the bus schedule?</a>\n");
      out.write("        <a href=\"#faq4\" onclick=\"showContent('faq4')\">What should I do if I lose an item on the bus?</a>\n");
      out.write("        <a href=\"#faq5\" onclick=\"showContent('faq5')\">Are there discounts for students and seniors?</a>\n");
      out.write("        <!-- Add more questions as needed -->\n");
      out.write("    </nav>\n");
      out.write("    <span class=\"open-btn\" onclick=\"toggleSidebar()\">&#9776;</span>\n");
      out.write("    <main id=\"main-content\">\n");
      out.write("        <div id=\"faq1\" class=\"content active\">\n");
      out.write("            <h2>How do I purchase a bus ticket?</h2>\n");
      out.write("            <p>You can purchase a bus ticket at the bus station, from the bus driver, or online through our website or mobile app. Payment options include cash, credit/debit cards, and mobile payment services.</p>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"faq2\" class=\"content\">\n");
      out.write("            <h2>What are the different types of bus passes available?</h2>\n");
      out.write("            <p>We offer several types of bus passes, including single-ride tickets, day passes, weekly passes, and monthly passes. Each pass type provides different benefits and discounts, so choose the one that best fits your travel needs.</p>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"faq3\" class=\"content\">\n");
      out.write("            <h2>How do I check the bus schedule?</h2>\n");
      out.write("            <p>You can check the bus schedule on our website, mobile app, or at the bus station. Schedules are also posted at major bus stops. Make sure to check for any service updates or changes before your trip.</p>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"faq4\" class=\"content\">\n");
      out.write("            <h2>What should I do if I lose an item on the bus?</h2>\n");
      out.write("            <p>If you lose an item on the bus, please contact our customer service team as soon as possible. Provide a detailed description of the lost item and the bus route number. We will do our best to help you recover your lost item.</p>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"faq5\" class=\"content\">\n");
      out.write("            <h2>Are there discounts for students and seniors?</h2>\n");
      out.write("            <p>Yes, we offer discounted fares for students, seniors, and other eligible groups. To qualify for a discount, you may need to show a valid ID or pass when purchasing your ticket or boarding the bus. Please check our website for more details on eligibility and how to apply.</p>\n");
      out.write("        </div>\n");
      out.write("        <!-- Add more answers as needed -->\n");
      out.write("    </main>\n");
      out.write("    <footer class=\"footer-distributed\">\n");
      out.write("        <div class=\"footer-left\">\n");
      out.write("            <img src=\"logo.png\" class=\"logofooter\" alt=\"Logo\">\n");
      out.write("            <p class=\"footer-links\">\n");
      out.write("                <a href=\"userDashboard.jsp\" class=\"link-1\">Home</a>\n");
      out.write("                <a href=\"#faq1\">FAQ</a>\n");
      out.write("                <a href=\"#faq2\">Passes</a>\n");
      out.write("                <a href=\"#faq3\">Schedule</a>\n");
      out.write("                <a href=\"#faq4\">Lost & Found</a>\n");
      out.write("                <a href=\"#faq5\">Discounts</a>\n");
      out.write("            </p>\n");
      out.write("            <p class=\"footer-company-name\">&copy; 2024 User Management System</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"footer-center\">\n");
      out.write("            <div>\n");
      out.write("                <i class=\"fa fa-map-marker\"></i>\n");
      out.write("                <p><span>123 Main Street</span> Anytown, USA</p>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <i class=\"fa fa-phone\"></i>\n");
      out.write("                <p>+1 555 123456</p>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <i class=\"fa fa-envelope\"></i>\n");
      out.write("                <p><a href=\"mailto:support@company.com\">support@company.com</a></p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"footer-right\">\n");
      out.write("            <p class=\"footer-company-about\">\n");
      out.write("                <span>About the company</span>\n");
      out.write("                We offer the best bus services in the country. Safe, reliable, and affordable travel options for everyone.\n");
      out.write("            </p>\n");
      out.write("            <div class=\"footer-icons\">\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-linkedin\"></i></a>\n");
      out.write("                <a href=\"#\"><i class=\"fa fa-github\"></i></a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </footer>\n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("        function showContent(id) {\n");
      out.write("            // Hide all content\n");
      out.write("            var contents = document.getElementsByClassName('content');\n");
      out.write("            for (var i = 0; i < contents.length; i++) {\n");
      out.write("                contents[i].classList.remove('active');\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            // Show the selected content\n");
      out.write("            document.getElementById(id).classList.add('active');\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        function toggleSidebar() {\n");
      out.write("            var sidebar = document.getElementById('sidebar');\n");
      out.write("            var mainContent = document.getElementById('main-content');\n");
      out.write("            if (sidebar.classList.contains('collapsed')) {\n");
      out.write("                sidebar.classList.remove('collapsed');\n");
      out.write("                mainContent.style.marginLeft = '260px';\n");
      out.write("            } else {\n");
      out.write("                sidebar.classList.add('collapsed');\n");
      out.write("                mainContent.style.marginLeft = '0';\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    </script>\n");
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
