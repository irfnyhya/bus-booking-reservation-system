<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Staff</title>
    <link rel="stylesheet" type="text/css" href="styleslogin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script>
        function redirectToHome() {
            alert("Staff registered successfully!");
            window.location.href = "adminDashboard.jsp";
        }

        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm_password").value;
            var passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*?]).{8,}$/;
            if (!password.match(passwordPattern)) {
                alert("Password must contain at least one capital letter, one number, one special character, and be at least 8 characters long.");
                return false;
            }
            if (password !== confirmPassword) {
                alert("Passwords do not match.");
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
        function togglePasswordVisibility(id) {
            var password = document.getElementById(id);
            var eyeIcon = document.getElementById(id + "-eye");
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
        <h1>Register Staff</h1>
    </header>
    <nav>
        <a href="adminDashboard.jsp">Dashboard</a>
    </nav>
    <main>
        <form action="registerStaff.jsp" method="post" onsubmit="return validateForm()">
            <label for="ic_number">IC Number:</label>
            <input type="text" id="ic_number" name="ic_number" required oninput="presetICNumber()" pattern="\d{6}-\d{2}-\d{4}" title="IC Number must be in the format 021122-11-0033"><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <label for="confirm_password">Confirm Password:</label>
            <input type="password" id="confirm_password" name="confirm_password" required><br>
            <i id="password-eye" class="fa fa-eye" onclick="togglePasswordVisibility('password')"></i><br>
            <label for="staff_fullname">Full Name:</label>
            <input type="text" id="staff_fullname" name="staff_fullname" required><br>
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="Driver">Driver</option>
                <option value="Bus Owner">Bus Owner</option>
            </select><br>
            <button type="submit">Register</button>
        </form>
        <%
            if ("post".equalsIgnoreCase(request.getMethod())) {
                String dbURL = "jdbc:mysql://localhost:3306/bus_route";
                String dbUser = "root";
                String dbPass = "";

                Connection conn = null;
                PreparedStatement psCheck = null;
                PreparedStatement psInsert = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                    String icNumber = request.getParameter("ic_number");
                    String password = request.getParameter("password");
                    String staffFullname = request.getParameter("staff_fullname");
                    String role = request.getParameter("role");

                    // Check if IC Number already exists
                    String checkQuery = "SELECT COUNT(*) FROM staff WHERE ic_number = ?";
                    psCheck = conn.prepareStatement(checkQuery);
                    psCheck.setString(1, icNumber);
                    rs = psCheck.executeQuery();
                    if (rs.next() && rs.getInt(1) > 0) {
                        out.println("<p>IC Number already exists. Please use a different IC Number.</p>");
                    } else {
                        // Validate IC Number format on server side
                        String icPattern = "\\d{6}-\\d{2}-\\d{4}";
                        if (!icNumber.matches(icPattern)) {
                            out.println("<p>Invalid IC Number format. It must be in the format 021122-11-0033</p>");
                        } else {
                            // Validate password format on server side
                            String passwordPattern = "^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,}$";
                            if (!password.matches(passwordPattern)) {
                                out.println("<p>Password must contain at least one capital letter, one number, one special character, and be at least 8 characters long.</p>");
                            } else {
                                String insertQuery = "INSERT INTO staff (ic_number, password, staff_fullname, role) VALUES (?, ?, ?, ?)";
                                psInsert = conn.prepareStatement(insertQuery);
                                psInsert.setString(1, icNumber);
                                psInsert.setString(2, password);
                                psInsert.setString(3, staffFullname);
                                psInsert.setString(4, role);
                                int result = psInsert.executeUpdate();

                                if (result > 0) {
                                    out.println("<script>redirectToHome();</script>");
                                } else {
                                    out.println("<p>Error registering staff.</p>");
                                }
                            }
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (psCheck != null) try { psCheck.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (psInsert != null) try { psInsert.close(); } catch (SQLException e) { e.printStackTrace(); }
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
