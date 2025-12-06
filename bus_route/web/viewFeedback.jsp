<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Feedback</title>
    <link rel="stylesheet" type="text/css" href="stylesfeedback.css">
    <style>
        .reply-form {
            display: none;
        }
    </style>
    <script>
        function showReplyForm(feedbackId) {
            var replyForm = document.getElementById('reply-form-' + feedbackId);
            replyForm.style.display = 'block';
        }
    </script>
</head>
<body>
    <header>
        <h1>View User Feedback</h1>
    </header>
    <nav>
        <a href="adminDashboard.jsp">Back to Admin Dashboard</a>
    </nav>
    <main>
        <div class="feedback-list">
            <h2>Feedback Received</h2>
            <%
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
            %>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 User Management System</p>
    </footer>
</body>
</html>