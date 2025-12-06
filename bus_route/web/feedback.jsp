<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Feedback</title>
    <link rel="stylesheet" type="text/css" href="stylesfeedback.css">

</head>
<body>
    <header>
        <h1>Feedback</h1>
    </header>
    <nav>
        <a href="userDashboard.jsp">Back to Dashboard</a>
    </nav>
    <main>
        <div class="feedback">
            <h2>We value your feedback</h2>
            <form action="submitFeedback.jsp" method="post">
                <label for="feedback">Your Feedback:</label><br>
                <textarea id="feedback" name="feedback" rows="4" cols="50"></textarea><br><br>
                <input type="submit" value="Submit">
            </form>
        </div>
        
        <div class="feedback-list">
            <h2>Your Submitted Feedback</h2>
            <%
                String userICNumber = (String) session.getAttribute("ic_number");
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Load the JDBC driver
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_management", "root", "admin");

                    // Get user_id based on the IC number stored in the session
                    String getUserIDSQL = "SELECT user_id FROM users WHERE ic_number = ?";
                    PreparedStatement getUserIDStmt = conn.prepareStatement(getUserIDSQL);
                    getUserIDStmt.setString(1, userICNumber);
                    ResultSet userIdRs = getUserIDStmt.executeQuery();
                    int userId = 0;
                    if (userIdRs.next()) {
                        userId = userIdRs.getInt("user_id");
                    }
                    userIdRs.close();
                    getUserIDStmt.close();

                    String sql = "SELECT feedback_id, content, reply FROM feedback WHERE user_id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, userId);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        int feedbackId = rs.getInt("feedback_id");
                        String content = rs.getString("content");
                        String reply = rs.getString("reply");
                        out.println("<div class='feedback-item'>");
                        out.println("<p><strong>Feedback:</strong> " + content + "</p>");
                        if (reply != null) {
                            out.println("<p><strong>Reply:</strong> " + reply + "</p>");
                        } else {
                            out.println("<p><strong>Reply:</strong> No reply yet.</p>");
                        }
                        out.println("<hr></div>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>There was an error retrieving feedback.</p>");
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
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
