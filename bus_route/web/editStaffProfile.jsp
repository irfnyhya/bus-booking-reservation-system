<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Staff Profile</title>
    <link rel="stylesheet" type="text/css" href="styleseditprofile.css">


</head>
<body>
    <header>
        <h1>Edit Profile</h1>
    </header>
    <nav>
        <a href="viewStaffProfile.jsp">Back to Profile</a>
    </nav>
    <main>
        <%
            String dbURL = "jdbc:mysql://localhost:3306/bus_route";
            String dbUser = "root";
            String dbPass = "";
            
            Connection conn = null;
            PreparedStatement ps = null;

            String currentICNumber = (String) session.getAttribute("ic_number");
            String newPassword = request.getParameter("newPassword");
            String message = null;

            if (request.getParameter("update") != null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                    String updateQuery = "UPDATE staff SET password = ? WHERE ic_number = ?";
                    ps = conn.prepareStatement(updateQuery);
                    ps.setString(1, newPassword);
                    ps.setString(2, currentICNumber);
                    
                    int result = ps.executeUpdate();
                    
                    if (result > 0) {
                        message = "Password updated successfully.";
                    } else {
                        message = "Error updating password.";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            }
        %>

        <h2>Change Password</h2>
        <form method="post" action="editStaffProfile.jsp">
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            <button type="submit" name="update">Update Password</button>
        </form>
        
        <p><%= message != null ? message : "" %></p>
    </main>
    <footer>
        <p>&copy; 2024 User Management System</p>
    </footer>
</body>
</html>
