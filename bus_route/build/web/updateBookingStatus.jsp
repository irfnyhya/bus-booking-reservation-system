<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String reservationID = request.getParameter("reservationID");
    String status = request.getParameter("status");

    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish the connection
        String url = "jdbc:mysql://localhost:3306/bus_route";
        String username = "root";
        String password = ""; // Replace with your MySQL password
        conn = DriverManager.getConnection(url, username, password);

        // Prepare SQL statement
        String sql = "UPDATE reservation SET status = ? WHERE reservationID = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, status);
        stmt.setInt(2, Integer.parseInt(reservationID));
        
        // Execute the update
        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated > 0) {
            // Print JavaScript to show an alert after successful update
%>
<script>
    alert("Booking status updated successfully.");
    window.location.href = document.referrer; // Redirect back to previous page
</script>
<%
        } else {
            // Print JavaScript to show an alert if update failed
%>
<script>
    alert("Failed to update booking status.");
    window.location.href = document.referrer; // Redirect back to previous page
</script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Print JavaScript to show an alert for exception
%>
<script>
    alert("Exception occurred: <%= e.getMessage() %>");
    window.location.href = document.referrer; // Redirect back to previous page
</script>
<%
    } finally {
        // Close resources
        if (stmt != null) {
            try { stmt.close(); } catch (SQLException e) { /* ignored */ }
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException e) { /* ignored */ }
        }
    }
%>

