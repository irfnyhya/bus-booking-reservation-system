<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="index.css" rel="stylesheet">
    <title>Edit Profile</title>
</head>
<body>
  <header>
    <div class="bottom-bar">
        <div class="bottom-bar__content">
            <a href="Dashboard.html" class="logo">
                <img class="logo__img" src="logo.png" alt="logo">
                <span class="logo__text">Bus Ticket Reservation</span>
            </a>

            <nav class="nav">
                <ul class="nav__list">
                       <li class="nav__item">
                                <a class="nav__link" href="Dashboard.jsp">Dashboard</a>
                            </li>
                            <li class="nav__item">
                                <a class="nav__link" href="booking.jsp">Booking</a>
                            </li>
                            <li class="nav__item">
                                <a class="btn" href="viewProfile.jsp">Profile</a>
                            </li>
                            <li class="nav__item">
                                <a class="nav__link" href="feedback.jsp">Feedback</a>
                            </li>
                </ul>
            </nav>

            <div class="hamburger">
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
            </div>
        </div>
    </div>
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
    
    <div class="container">
        <form class="horizontal-form" action="editProfile.jsp" method="post" onsubmit="return validateForm()">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= email %>" required>
            <label for="ic_number">IC Number:</label>
            <input type="text" id="ic_number" name="ic_number" value="<%= icNumber %>" required oninput="presetICNumber()" pattern="\d{6}-\d{2}-\d{4}" title="IC Number must be in the format 021122-11-0033" readonly>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="<%= username %>" required>
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" value="<%= fullname %>" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Leave blank to keep current password">
            <button type="submit">Update Profile</button>
            <button type="button" onclick="location.href='viewProfile.jsp'">View Profile</button>
            <input type="hidden" id="updateStatus" name="updateStatus" value="">
        </form>
    </div>
    
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
                boolean validPassword = true;
                if (password == null || password.isEmpty()) {
                    updateQuery = "UPDATE users SET email = ?, username = ?, fullname = ? WHERE ic_number = ?";
                    ps = conn.prepareStatement(updateQuery);
                    ps.setString(1, email);
                    ps.setString(2, username);
                    ps.setString(3, fullname);
                    ps.setString(4, userICNumber);
                } else {
                    String passwordPattern = "^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*?]).{8,}$";
                    if (!password.matches(passwordPattern)) {
                        validPassword = false;
                        request.setAttribute("updateStatus", "Password must contain at least one capital letter, one number, one special character, and be at least 8 characters long.");
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
                
                if (validPassword) {
                    int result = ps.executeUpdate();

                    if (result > 0) {
                        request.setAttribute("updateStatus", "Profile updated successfully.");
                    } else {
                        request.setAttribute("updateStatus", "Error updating profile.");
                    }
                }
                response.sendRedirect("editProfile.jsp?status=" + request.getAttribute("updateStatus"));
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>
  </main>
<footer class="footer-distributed">
    <div class="footer-left">
        <img class="logofooter" src="logo.png" alt="logo">

        <p class="footer-links">
            <a href="Dasboard.jsp" class="link-1">Dashboard</a>
            <a href="Booking.jsp">Booking</a>
            <a href="viewProfile.jsp">Profile</a>
            <a href="feedback.jsp">Feedback</a>
        </p>
        <p class="footer-company-name">Tiny Travel Co. © 2024</p>
    </div>

    <div class="footer-center">
        <div>
            <i class="fa fa-map-marker"></i>
            <p><span>Kuala Nerus</span> Terengganu, Malaysia</p>
        </div>
        <div>
            <i class="fa fa-phone"></i>
            <p>+60 123456789</p>
        </div>
        <div>
            <i class="fa fa-envelope"></i>
            <p><a href="mailto:tinytravel@company.com">tinytravel@company.com</a></p>
        </div>
    </div>

    <div class="footer-right">
        <p class="footer-company-about">
            <span>About the company</span>
            Your go-to solution for easy bus ticket booking! Whether you're commuting, planning a weekend trip, or a long journey, our platform ensures a seamless and convenient booking experience. Travel effortlessly with Tiny Travel Company!
        </p>
        <div class="footer-icons">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-github"></i></a>
        </div>
    </div>
</footer>
  <script>
    const navEl = document.querySelector('.nav');
    const hamburgerEl = document.querySelector('.hamburger');
    const navItemEls = document.querySelectorAll('.nav__item');

    hamburgerEl.addEventListener('click', () => {
        navEl.classList.toggle('nav--open');
        hamburgerEl.classList.toggle('hamburger--open');
    });

    navItemEls.forEach(navItemEl => {
        navItemEl.addEventListener('click', () => {
            navEl.classList.remove('nav--open');
            hamburgerEl.classList.remove('hamburger--open');
        });
    });

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

    window.onload = function() {
        const params = new URLSearchParams(window.location.search);
        const status = params.get('status');
        if (status) {
            alert(status);
        }
    }
  </script>
</body>
</html>
