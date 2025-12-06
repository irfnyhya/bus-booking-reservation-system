<%-- 
    Document   : Dashboard
    Created on : 28 May 2024, 12:19:42 pm
    Author     : USER
--%>

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
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="index.css" rel="stylesheet">
        <title>Dashboard</title>
    </head>

    <body>

        <%

            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/bus_route";
            Connection myconnection1 = DriverManager.getConnection(url, "root", "");
            Connection myconnection2 = DriverManager.getConnection(url, "root", "");

            Statement myStatement1 = myconnection1.createStatement();

            String sql = "SELECT DISTINCT origin FROM route";
            ResultSet myRs1 = myStatement1.executeQuery(sql);

            Set<String> originSet = new HashSet<>();
            while (myRs1.next()) {
                originSet.add(myRs1.getString("origin"));
            }

            sql = "SELECT DISTINCT destination FROM route";
            ResultSet myRs2 = myStatement1.executeQuery(sql);

            Set<String> destinationSet = new HashSet<>();
            while (myRs2.next()) {
                destinationSet.add(myRs2.getString("destination"));
            }

            int userId = (int) session.getAttribute("user_id");
        %>



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
                                <a class="btn" href="Dashboard.jsp">Dashboard</a>
                            </li>
                            <li class="nav__item">
                                <a class="nav__link" href="booking.jsp">Booking</a>
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


        <main style="height:600px;">
            <div class="container" style="padding: 50px;">

                <div class="form">
                    <h3>Book Your Ticket</h3>
                    <form action="showBus.jsp" method="POST">
                        <p>
                            <label for="origin">Origin</label>
                            <select name="origin" id="origin" >
                                <option value="" disabled selected hidden>Origin</option>
                                <% for (String origin : originSet) {%>
                                <option value="<%= origin%>"><%= origin%></option>
                                <% } %>
                            </select>
                        </p>
                        <p>
                            <label for="destination">Destination</label>
                            <select name="destination" id="destination">
                                <option value="" disabled selected hidden>Destination</option>
                                <option value="" disabled selected hidden>Destination</option>
                                <% for (String destination : destinationSet) {%>
                                <option value="<%= destination%>"><%= destination%></option>
                                <% } %>                            </select>
                        </p>
                        <p>
                            <label for="">Date</label>
                            <input type="date" name="date" id="date">
                        </p>
                        <p>
                            <label for="">Pax</label>
                            <input type="number" id="quantity" name="quantity" min="1">
                        </p>

                        <p class="full-width">
                            <button type="submit" formaction="showBus.jsp">Search Bus</button>
                        </p>


                    </form>
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
            // Get the message from the query parameter
            var urlParams = new URLSearchParams(window.location.search);
            var message = urlParams.get("message");

            // Display the alert message
            if (message === "ok") {
                alert("Payment accepted!");
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

        <% myconnection1.close();%>
        <% myconnection2.close();%>
    </body>

</html>