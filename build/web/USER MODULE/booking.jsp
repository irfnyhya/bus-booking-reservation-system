<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="index.css" rel="stylesheet">
        <title>Booking</title>
        <style>
            .filter-container {
                margin-bottom: 20px;
            }
        </style>
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
                                <a class="btn" href="booking.jsp">Booking</a>
                            </li>
                            <li class="nav__item">
                                <a class="nav__link" href="viewProfile.jsp">Profile</a>
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

        <main style="min-height:  600px;">
            <div class="container">
                <div class="form-container">
                    <h2>Bookings</h2><br><br>

                    <!-- Filter by status -->
                    <div class="filter-container">
                        <form id="filterForm" method="get">
                            <label for="statusFilter">Filter by status:</label>
                            <select id="statusFilter" name="status" onchange="document.getElementById('filterForm').submit()">
                                <option value="all">All</option>
                                <option value="pending">Pending</option>
                                <option value="approved">Approved</option>
                                <option value="rejected">Rejected</option>
                            </select>
                        </form>
                    </div>


                    <table class="bookings-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Reservation ID</th>
                                <th>Origin</th>
                                <th>Destination</th>
                                <th>Date</th>
                                <th>Departure Time</th>
                                <th>Arrival Time</th>
                                <th>Seat Number</th>
                                <th>Status</th>
                                <th>Amount</th>
                                <th>Receipt</th>
                            </tr>
                        </thead>
                        <tbody id="reservationTableBody">
                            <%
                                Connection conn = null;
                                PreparedStatement stmt = null;
                                ResultSet rs = null;
                                int i = 1;
                                int userId = (int) session.getAttribute("user_id");
                                String selectedStatus = request.getParameter("status");
                                try {
                                    // Load the MySQL JDBC driver
                                    Class.forName("com.mysql.jdbc.Driver");

                                    // Establish the connection
                                    String url = "jdbc:mysql://localhost:3306/bus_route";
                                    String username = "root";
                                    String password = ""; // Replace with your MySQL password
                                    conn = DriverManager.getConnection(url, username, password);

                                    // Prepare SQL query with joins
                                    String sql = "SELECT r.reservationID, ro.origin, ro.destination, r.date, r.departuretime, r.arrivaltime, r.seatno, r.status, p.amount "
                                            + "FROM reservation r "
                                            + "JOIN route ro ON r.routeid = ro.routeid "
                                            + "LEFT JOIN payment p ON r.reservationID = p.reservationID "
                                            + "WHERE r.user_id=?";

                                    // Apply filter based on selected status (if applicable)
                                    if ("pending".equals(selectedStatus) || "approved".equals(selectedStatus) || "rejected".equals(selectedStatus)) {
                                        sql += " AND r.status = ?";
                                    }

                                    stmt = conn.prepareStatement(sql);
                                    stmt.setInt(1, userId); // Set user_id parameter

                                    // Set status parameter if applicable
                                    if ("pending".equals(selectedStatus) || "approved".equals(selectedStatus) || "rejected".equals(selectedStatus)) {
                                        stmt.setString(2, selectedStatus);
                                    }

                                    // Execute the query
                                    rs = stmt.executeQuery();

                                    // Iterate over the result set and display data
                                    while (rs.next()) {
                            %>
                            <tr data-status="<%= rs.getString("status")%>">
                                <td><%= i++%></td>
                                <td><%= rs.getInt("reservationID")%></td>
                                <td><%= rs.getString("origin")%></td>
                                <td><%= rs.getString("destination")%></td>
                                <td><%= rs.getString("date")%></td>
                                <td><%= rs.getString("departuretime")%></td>
                                <td><%= rs.getString("arrivaltime")%></td>
                                <td><%= rs.getString("seatno")%></td>
                                <td><%= rs.getString("status")%></td>
                                <td><%= rs.getString("amount") != null ? rs.getString("amount") : "N/A"%></td>
                                <td>
                                    <% if ("approved".equals(rs.getString("status"))) {%>
                                    <form action="receipt.jsp" method="get" target="_blank">
                                        <input type="hidden" name="reservationID" value="<%= rs.getInt("reservationID")%>">
                                        <button type="submit">Receipt</button>
                                    </form>
                                    <% } %>
                                </td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    // Close resources in finally block
                                    if (rs != null) {
                                        try {
                                            rs.close();
                                        } catch (SQLException e) {
                                            /* ignored */ }
                                    }
                                    if (stmt != null) {
                                        try {
                                            stmt.close();
                                        } catch (SQLException e) {
                                            /* ignored */ }
                                    }
                                    if (conn != null) {
                                        try {
                                            conn.close();
                                        } catch (SQLException e) {
                                            /* ignored */ }
                                    }
                                }
                            %>
                        </tbody>
                    </table>

                    <!-- Any additional form elements or actions can be added here -->

                </div>
            </div>
        </main>

        <footer class="footer-distributed">
            <div class="footer-left">
                <img class="logofooter" src="logo.png" alt="logo">

                <p class="footer-links">
                    <a href="Dasboard.jsp" class="link-1">Dashboard</a>
                    <a href="booking.jsp">Booking</a>
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
            // Hamburger menu functionality
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
