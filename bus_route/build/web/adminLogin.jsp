<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="styleslogin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script>
        
        function togglePasswordVisibility() {
            var password = document.getElementById("password");
            var eyeIcon = document.getElementById("password-eye");
            if (password.type === "password") {
                password.type = "text";
                eyeIcon.classList.remove("fa-eye");
                eyeIcon.classList.add("fa-eye-slash");
            } else {
                password.type = "password";
                eyeIcon.classList.remove("fa-eye-slash");
                eyeIcon.classList.add("fa-eye");
            }
        }
        
    </script>

</head>
<body>
    <header>
        <h1>Admin Login</h1>
    </header>
    <nav>
        <a href="adminLogin.jsp">Login as Admin</a>
        <a href="loginStaff.jsp">Login as Staff</a>
        
    </nav>
    <main>
        <form action="adminLogin.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <i id="password-eye" class="fa fa-eye" onclick="togglePasswordVisibility('password')"></i><br>
            <button type="submit">Login</button>
        </form>
        <%
            if ("post".equalsIgnoreCase(request.getMethod())) {
                String dbURL = "jdbc:mysql://localhost:3306/bus_route";
                String dbUser = "root";
                String dbPass = "";

                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                    String username = request.getParameter("username");
                    String password = request.getParameter("password");

                    String query = "SELECT * FROM admins WHERE username = ? AND password = ?";
                    ps = conn.prepareStatement(query);
                    ps.setString(1, username);
                    ps.setString(2, password);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        response.sendRedirect("adminDashboard.jsp");
                    } else {
                        out.println("<p>Invalid username or password.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            }
        %>
    </main>
    <footer>
        <p>&copy; 2024 User Management System</p>
    </footer>
</body>
</html>
