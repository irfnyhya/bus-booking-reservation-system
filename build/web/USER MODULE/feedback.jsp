<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

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
                                <a class="nav__link" href="viewProfile.jsp">Profile</a>
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
        <main>
            <div style="display: flex;
                 justify-content: center;
                 align-items: center;"class="container">
                <div class="feedback">
                    <h2>We value your feedback</h2>
                    <form action="submitFeedback.jsp" method="post">
                        <label for="feedback">Your Feedback:</label><br>
                        <textarea id="feedback" name="feedback" rows="4" cols="50"></textarea><br><br>
                        <input type="submit" value="Submit">
                    </form>
                </div>
            </div>
            <div style="display: flex;
                 justify-content: center;
                 align-items: center;"class="container">

                <div class="feedback-list">
                    <h2>Your Submitted Feedback</h2>
                    <%
                        String userICNumber = (String) session.getAttribute("ic_number");
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver"); // Load the JDBC driver
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");

                            // Get user_id based on the IC number stored in the session
                            String getUserIDSQL = "SELECT user_id FROM users WHERE ic_number = ?";
                            PreparedStatement getUserIDStmt = conn.prepareStatement(getUserIDSQL);
                            getUserIDStmt.setString(1, userICNumber);
                            ResultSet userIdRs = getUserIDStmt.executeQuery();
                            int userId = 0;
                            if (userIdRs.next()) {
                                userId = userIdRs.getInt("user_id");
                            }
                            userIdRs.close();
                            getUserIDStmt.close();

                            String sql = "SELECT feedback_id, content, reply FROM feedback WHERE user_id = ?";
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setInt(1, userId);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                                int feedbackId = rs.getInt("feedback_id");
                                String content = rs.getString("content");
                                String reply = rs.getString("reply");
                                out.println("<div class='feedback-item'>");
                                out.println("<p><strong>Feedback:</strong> " + content + "</p>");
                                if (reply != null) {
                                    out.println("<p><strong>Reply:</strong> " + reply + "</p>");
                                } else {
                                    out.println("<p><strong>Reply:</strong> No reply yet.</p>");
                                }
                                out.println("<hr></div>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<p>There was an error retrieving feedback.</p>");
                        } finally {
                            if (rs != null) {
                                rs.close();
                            }
                            if (pstmt != null) {
                                pstmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        }
                    %>
                </div>
            </div>
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
        </script>
    </body>
</html>
