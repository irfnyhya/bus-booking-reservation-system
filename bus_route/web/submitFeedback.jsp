<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    String feedback = request.getParameter("feedback");
    String message = "";
    String userICNumber = (String) session.getAttribute("ic_number");

    if (feedback != null && !feedback.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");

            // Get user_id based on the IC number stored in the session
            String getUserIDSQL = "SELECT user_id FROM users WHERE ic_number = ?";
            PreparedStatement getUserIDStmt = conn.prepareStatement(getUserIDSQL);
            getUserIDStmt.setString(1, userICNumber);
            ResultSet rs = getUserIDStmt.executeQuery();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt("user_id");
            }
            rs.close();
            getUserIDStmt.close();

            String sql = "INSERT INTO feedback (content, user_id) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, feedback);
            pstmt.setInt(2, userId);
            pstmt.executeUpdate();
            message = "Feedback submitted successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            message = "There was an error submitting your feedback: " + e.getMessage();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    } else {
        message = "Feedback cannot be empty.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Feedback Submission</title>
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
            <h2>Feedback Status</h2>
            <p><%= message %></p>
            <a href="feedback.jsp">Submit More Feedback</a>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 User Management System</p>
    </footer>
</body>
</html>
