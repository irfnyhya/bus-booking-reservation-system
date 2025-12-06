<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    String feedback = request.getParameter("feedback");
    String message = "";
    String userICNumber = (String) session.getAttribute("ic_number");

    if (feedback != null && !feedback.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");

            // Get user_id based on the IC number stored in the session
            String getUserIDSQL = "SELECT user_id FROM users WHERE ic_number = ?";
            PreparedStatement getUserIDStmt = conn.prepareStatement(getUserIDSQL);
            getUserIDStmt.setString(1, userICNumber);
            ResultSet rs = getUserIDStmt.executeQuery();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt("user_id");
            }
            rs.close();
            getUserIDStmt.close();

            String sql = "INSERT INTO feedback (content, user_id) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, feedback);
            pstmt.setInt(2, userId);
            pstmt.executeUpdate();
            message = "Feedback submitted successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            message = "There was an error submitting your feedback: " + e.getMessage();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    } else {
        message = "Feedback cannot be empty.";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="index.css" rel="stylesheet">
        <title>Feedback</title>
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
                                <a class="nav_link" href="viewProfile.jsp">Profile</a>
                            </li>
                            <li class="nav__item">
                                <a class="btn" href="feedback.jsp">Feedback</a>
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
   
    <main style="height:600px">
        <div style="display: flex;
                 justify-content: center;
                 align-items: center;"class="container">
        <div style="margin-top: 100px;" class="feedback">
            <h2>Feedback Status</h2>
            <p><%= message %></p>
            <a href="feedback.jsp">Submit More Feedback</a>
        </div>
        </div>
    </main>
    <footer class="footer-distributed">
            <div class="footer-left">
                <img class="logofooter" src="logo.png" alt="logo">

                <p class="footer-links">
                    <a href="#" class="link-1">Dashboard</a>
                    <a href="#">About</a>
                    <a href="#">Booking</a>
                    <a href="#">Help</a>
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
                    Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu
                    auctor
                    lacus vehicula sit amet.
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
        </script>
</body>
</html>
