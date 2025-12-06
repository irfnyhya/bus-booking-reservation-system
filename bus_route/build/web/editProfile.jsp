<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <link rel="stylesheet" type="text/css" href="styleseditprofile.css">



    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*?]).{8,}$/;
            if (password && !password.match(passwordPattern)) {
                alert("Password must contain at least one capital letter, one number, one special character, and be at least 8 characters long.");
                return false;
            }
            return true;
        }

        function presetICNumber() {
            var icInput = document.getElementById("ic_number");
            if (icInput.value.length === 6 || icInput.value.length === 9) {
                icInput.value += '-';
            }
        }
    </script>
</head>
<body>
    <header>
        <h1>Edit Profile</h1>
    </header>
    
    <main>
        <%
            String dbURL = "jdbc:mysql://localhost:3306/bus_route";
            String dbUser = "root";
            String dbPass = "";

            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String email = null;
            String icNumber = null;
            String password = null;
            String username = null;
            String fullname = null;

            // Assume user is logged in and their IC number is stored in session
            String userICNumber = (String) session.getAttribute("ic_number");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // Fetch user details
                String query = "SELECT email, ic_number, password, username, fullname FROM users WHERE ic_number = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, userICNumber);
                rs = ps.executeQuery();

                if (rs.next()) {
                    email = rs.getString("email");
                    icNumber = rs.getString("ic_number");
                    password = rs.getString("password");
                    username = rs.getString("username");
                    fullname = rs.getString("fullname");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
        <form action="editProfile.jsp" method="post" onsubmit="return validateForm()">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= email %>" required><br>
            <label for="ic_number">IC Number:</label>
            <input type="text" id="ic_number" name="ic_number" value="<%= icNumber %>" required oninput="presetICNumber()" pattern="\d{6}-\d{2}-\d{4}" title="IC Number must be in the format 021122-11-0033" readonly><br>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="<%= username %>" required><br>
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" value="<%= fullname %>" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Leave blank to keep current password"><br>
            <button type="submit">Update Profile</button>
        </form>
        <button onclick="location.href='viewProfile.jsp'">View Profile</button>
        <%
            if ("post".equalsIgnoreCase(request.getMethod())) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                    email = request.getParameter("email");
                    password = request.getParameter("password");
                    username = request.getParameter("username");
                    fullname = request.getParameter("fullname");

                    // If password is left blank, keep the current password
                    String updateQuery;
                    if (password == null || password.isEmpty()) {
                        updateQuery = "UPDATE users SET email = ?, username = ?, fullname = ? WHERE ic_number = ?";
                        ps = conn.prepareStatement(updateQuery);
                        ps.setString(1, email);
                        ps.setString(2, username);
                        ps.setString(3, fullname);
                        ps.setString(4, userICNumber);
                    } else {
                        String passwordPattern = "^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,}$";
                        if (!password.matches(passwordPattern)) {
                            out.println("<p>Password must contain at least one capital letter, one number, one special character, and be at least 8 characters long.</p>");
                        } else {
                            updateQuery = "UPDATE users SET email = ?, password = ?, username = ?, fullname = ? WHERE ic_number = ?";
                            ps = conn.prepareStatement(updateQuery);
                            ps.setString(1, email);
                            ps.setString(2, password);
                            ps.setString(3, username);
                            ps.setString(4, fullname);
                            ps.setString(5, userICNumber);
                        }
                    }
                    int result = ps.executeUpdate();

                    if (result > 0) {
                        out.println("<p>Profile updated successfully.</p>");
                    } else {
                        out.println("<p>Error updating profile.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
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
