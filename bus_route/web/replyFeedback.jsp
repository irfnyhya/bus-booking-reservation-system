<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    String feedbackId = request.getParameter("feedback_id");
    String reply = request.getParameter("reply");
    String message = "";

    if (reply != null && !reply.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");
            String sql = "UPDATE feedback SET reply = ? WHERE feedback_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reply);
            pstmt.setInt(2, Integer.parseInt(feedbackId));
            pstmt.executeUpdate();
            message = "Reply submitted successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            message = "There was an error submitting your reply: " + e.getMessage();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    } else {
        message = "Reply cannot be empty.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Reply Submission</title>
    <link rel="stylesheet" type="text/css" href="stylesfeedback.css">

</head>
<body>
    <header>
        <h1>Reply</h1>
    </header>
    <nav>
        <a href="viewFeedback.jsp">Back to Feedback</a>
    </nav>
    <main>
        <div class="feedback">
            <h2>Reply Status</h2>
            <p><%= message %></p>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 User Management System</p>
    </footer>
</body>
</html>
