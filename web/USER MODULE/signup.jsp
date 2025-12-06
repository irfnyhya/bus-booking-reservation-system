<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="index.css" rel="stylesheet">
        <title>Sign Up</title>
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
                                <a class="nav_link" href="loginUser.jsp">Login</a>
                            </li>
                            <li class="nav__item">
                                <a class="btn" href="signup.jsp">Sign Up</a>
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
        <main >
            <div class="container">
                <form class="horizontal-form" action="signup.jsp" method="post" onsubmit="return validateForm()">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required placeholder="Username">
                    <label for="fullname">Full Name:</label>
                    <input type="text" id="fullname" name="fullname" required placeholder="Full Name">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required placeholder="tinytravel@gmail.com">
                    <label for="ic_number">IC Number:</label>
                    <input type="text" id="ic_number" name="ic_number" required oninput="presetICNumber()" pattern="\d{6}-\d{2}-\d{4}" title="IC Number must be in the format 021122-11-0033" placeholder="021122-11-0033">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                    <label for="confirm_password">Confirm Password:</label>
                    <input type="password" id="confirm_password" name="confirm_password" required>
                    <i style="margin-right: 45%" id="password-eye" class="fa fa-eye" onclick="togglePasswordVisibility('password')"></i>
                    <button type="submit">Sign Up</button>
                    <div class="additional-options">
                        <p>Already have an account? <a href="loginUser.jsp">Log In</a></p>
                    </div>
                </form>
            </div>
            <%
                boolean registrationSuccess = false;
                String errorMessage = null;
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

                        String username = request.getParameter("username");
                        String fullname = request.getParameter("fullname");
                        String email = request.getParameter("email");
                        String icNumber = request.getParameter("ic_number");
                        String password = request.getParameter("password");

                        // Check if email, IC Number, or username already exists
                        String checkQuery = "SELECT COUNT(*) FROM users WHERE email = ? OR ic_number = ? OR username = ?";
                        psCheck = conn.prepareStatement(checkQuery);
                        psCheck.setString(1, email);
                        psCheck.setString(2, icNumber);
                        psCheck.setString(3, username);
                        rs = psCheck.executeQuery();
                        if (rs.next() && rs.getInt(1) > 0) {
                            errorMessage = "Email, IC Number, or Username already exists. Please use a different email, IC Number, or Username.";
                        } else {
                            // Validate IC Number format on server side
                            String icPattern = "\\d{6}-\\d{2}-\\d{4}";
                            if (!icNumber.matches(icPattern)) {
                                errorMessage = "Invalid IC Number format. It must be in the format 021122-11-0033.";
                            } else {
                                // Validate password format on server side
                                String passwordPattern = "^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,}$";
                                if (!password.matches(passwordPattern)) {
                                    errorMessage = "Password must contain at least one capital letter, one number, one special character, and be at least 8 characters long.";
                                } else {
                                    String insertQuery = "INSERT INTO users (username, fullname, email, ic_number, password) VALUES (?, ?, ?, ?, ?)";
                                    psInsert = conn.prepareStatement(insertQuery);
                                    psInsert.setString(1, username);
                                    psInsert.setString(2, fullname);
                                    psInsert.setString(3, email);
                                    psInsert.setString(4, icNumber);
                                    psInsert.setString(5, password);
                                    int result = psInsert.executeUpdate();

                                    if (result > 0) {
                                        registrationSuccess = true;
                                    } else {
                                        errorMessage = "Error registering user.";
                                    }
                                }
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try {
                            rs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        if (psCheck != null) try {
                            psCheck.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        if (psInsert != null) try {
                            psInsert.close();
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
            <% if (registrationSuccess) { %>
                <script>
                    alert("User registered successfully!");
                    window.location.href = "signup.jsp";
                </script>
            <% } else if (errorMessage != null) { %>
                <script>
                    alert("<%= errorMessage %>");
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
            function redirectToHome() {
                alert("User registered successfully!");
                window.location.href = "signup.jsp";
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
