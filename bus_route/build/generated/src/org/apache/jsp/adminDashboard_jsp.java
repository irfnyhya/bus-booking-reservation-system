package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class adminDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Admin Dashboard</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"styledashboard.css\">\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("        <h1>Admin Dashboard</h1>\n");
      out.write("    </header>\n");
      out.write("    <nav>\n");
      out.write("        \n");
      out.write("        <a href=\"index.jsp\">Logout</a> <!-- Logout button added -->\n");
      out.write("    </nav>\n");
      out.write("    <main>\n");
      out.write("        <div class=\"dashboard\">\n");
      out.write("            <h1>Welcome, Admin!</h1>\n");
      out.write("            <a href=\"registerStaff.jsp\">Register Staff</a><br>\n");
      out.write("            <a href=\"viewFeedback.jsp\">View Feedback</a> \n");
      out.write("            <a href=\"process-viewroute.jsp\">Manage Route</a>\n");
      out.write("            <a href=\"ManageReservation.jsp\">Manage Reservation</a>\n");
      out.write("            <a href=\"GenerateReports.jsp\">Manage Reports</a>\n");
      out.write("        </div>\n");
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
