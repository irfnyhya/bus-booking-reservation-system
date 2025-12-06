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
    <title>Login</title>
</head>
<body>
<header>
    <div class="bottom-bar">
        <div class="bottom-bar__content">
            <a href="Dashboard.jsp" class="logo">
                <img class="logo__img" src="logo.png" alt="logo">
                <span class="logo__text">Bus Ticket Reservation</span>
            </a>

            <nav class="nav">
                <ul class="nav__list">
                    <li class="nav__item">
                        <a class="btn" href="loginUser.jsp">Login</a>
                    </li>
                    <li class="nav__item">
                        <a class="nav__link" href="signup.jsp">Sign Up</a>
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
<main style="height:600px;">

    <div class="container">
        <form class="horizontal-form" action="loginUser.jsp" method="post">
            <label for="ic_number">IC Number:</label>
            <input type="text" id="ic_number" name="ic_number" required oninput="presetICNumber()" pattern="\d{6}-\d{2}-\d{4}" title="IC Number must be in the format 021122-11-0033" placeholder="021122-11-0033">

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <i style="margin-right: 45%" id="password-eye" class="fa fa-eye" onclick="togglePasswordVisibility('password')"></i>

            <div class="additional-options">
                <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
            </div>
            <button type="submit">Login</button>
        </form>
    </div>

    <%
        boolean loginFailed = false;
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

                String icNumber = request.getParameter("ic_number");
                String password = request.getParameter("password");

                String query = "SELECT user_id FROM users WHERE ic_number = ? AND password = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, icNumber);
                ps.setString(2, password);

                rs = ps.executeQuery();

                if (rs.next()) {
                    int userId = rs.getInt("user_id");
                    session.setAttribute("ic_number", icNumber); // Set session attribute for IC Number
                    session.setAttribute("user_id", userId); // Set session attribute for User ID
                    response.sendRedirect("Dashboard.jsp");
                } else {
                    loginFailed = true;
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (ps != null) try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (conn != null) try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
    <% if (loginFailed) { %>
        <script>
            alert("Invalid IC number or password.");
        </script>
    <% } %>
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
</script>

</body>
</html>
