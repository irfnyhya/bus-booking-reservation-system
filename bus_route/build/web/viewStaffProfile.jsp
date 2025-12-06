<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Staff Profile</title>
    <link rel="stylesheet" type="text/css" href="stylesviewprofile.css">

</head>
<body>
    <header>
        <h1>Driver Profile</h1>
    </header>
    <nav>
        
        <a href="busOwnerDashboard.jsp">Back To Dashboard</a>
    </nav>
    <main>
        <%
            String dbURL = "jdbc:mysql://localhost:3306/bus_route";
            String dbUser = "root";
            String dbPass = "";

            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String icNumber = null;
            String password = null;
            String staffFullname = null;
            String role = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                String currentICNumber = (String) session.getAttribute("ic_number");
                String query = "SELECT * FROM staff WHERE ic_number = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, currentICNumber);
                rs = ps.executeQuery();

                if (rs.next()) {
                    icNumber = rs.getString("ic_number");
                    password = rs.getString("password");
                    staffFullname = rs.getString("staff_fullname");
                    role = rs.getString("role");
                } else {
                    out.println("<p>Staff profile not found.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>

        <h2>Profile Details</h2>
        <p><strong>IC Number:</strong> <%= icNumber %></p>
        <p><strong>Full Name:</strong> <%= staffFullname %></p>
        <p><strong>Role:</strong> <%= role %></p>
        <p><strong>Password:</strong> <%= password %></p>

        <form action="editStaffProfile.jsp" method="get">
            <button type="submit">Edit Password</button>
        </form>

        <%
            if ("Driver".equalsIgnoreCase(role)) {
                out.println("<a href='driverDashboard.jsp'>Back to Dashboard</a>");
            } else if ("Bus Owner".equalsIgnoreCase(role)) {
                out.println("<a href='busOwnerDashboard.jsp'>Back to Dashboard</a>");
            }
        %>
    </main>
    <footer>
        <p>&copy; 2024 User Management System</p>
    </footer>
</body>
</html>
