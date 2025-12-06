<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Feedback</title>
</head>
<body>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        int feedbackId = Integer.parseInt(request.getParameter("feedback_id"));
        
        Class.forName("com.mysql.cj.jdbc.Driver"); // Load the JDBC driver
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");
        
        String sql = "DELETE FROM feedback WHERE feedback_id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, feedbackId);
        int rowsAffected = stmt.executeUpdate();
        
        if (rowsAffected > 0) {
            out.println("<p>Feedback successfully deleted.</p>");
        } else {
            out.println("<p>Failed to delete feedback.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>There was an error deleting the feedback.</p>");
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
    response.sendRedirect("viewFeedback.jsp"); // Redirect back to the feedback view page
%>
</body>
</html>