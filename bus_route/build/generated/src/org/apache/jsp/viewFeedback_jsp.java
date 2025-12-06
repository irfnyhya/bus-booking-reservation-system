package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class viewFeedback_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>View Feedback</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"stylesfeedback.css\">\n");
      out.write("    <style>\n");
      out.write("        .reply-form {\n");
      out.write("            display: none;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <script>\n");
      out.write("        function showReplyForm(feedbackId) {\n");
      out.write("            var replyForm = document.getElementById('reply-form-' + feedbackId);\n");
      out.write("            replyForm.style.display = 'block';\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("        <h1>View User Feedback</h1>\n");
      out.write("    </header>\n");
      out.write("    <nav>\n");
      out.write("        <a href=\"adminDashboard.jsp\">Back to Admin Dashboard</a>\n");
      out.write("    </nav>\n");
      out.write("    <main>\n");
      out.write("        <div class=\"feedback-list\">\n");
      out.write("            <h2>Feedback Received</h2>\n");
      out.write("            ");

                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Load the JDBC driver
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");

                    String sql = "SELECT f.feedback_id, f.content, f.reply, u.username, u.email FROM feedback f JOIN users u ON f.user_id = u.user_id";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        int feedbackId = rs.getInt("feedback_id");
                        String content = rs.getString("content");
                        String reply = rs.getString("reply");
                        String username = rs.getString("username");
                        String email = rs.getString("email");
                        out.println("<div class='feedback-item'>");
                        out.println("<p><strong>User:</strong> " + username + " (" + email + ")</p>");
                        out.println("<p><strong>Feedback:</strong> " + content + "</p>");
                        if (reply != null) {
                            out.println("<p><strong>Reply:</strong> " + reply + "</p>");
                            out.println("<button onclick='showReplyForm(" + feedbackId + ")'>Edit Reply</button>");
                        } else {
                            out.println("<button onclick='showReplyForm(" + feedbackId + ")'>Reply</button>");
                        }
                        out.println("<div id='reply-form-" + feedbackId + "' class='reply-form'>");
                        out.println("<form action='replyFeedback.jsp' method='post'>");
                        out.println("<input type='hidden' name='feedback_id' value='" + feedbackId + "' />");
                        out.println("<label for='reply'>Reply:</label><br>");
                        out.println("<textarea id='reply' name='reply' rows='4' cols='50'>" + (reply != null ? reply : "") + "</textarea><br><br>");
                        out.println("<input type='submit' value='Submit Reply' />");
                        out.println("</form>");
                        out.println("</div>");
                        out.println("<form action='deleteFeedback.jsp' method='post' style='display:inline;'>");
                        out.println("<input type='hidden' name='feedback_id' value='" + feedbackId + "' />");
                        out.println("<input type='submit' value='Delete Feedback' />");
                        out.println("</form>");
                        out.println("<hr></div>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>There was an error retrieving feedback.</p>");
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </main>\n");
      out.write("    <footer>\n");
      out.write("        <p>&copy; 2024 User Management System</p>\n");
      out.write("    </footer>\n");
      out.write("</body>\n");
      out.write("</html>");
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
