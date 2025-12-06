<%-- 
    Document   : showBus
    Created on : 28 May 2024, 4:44:12 pm
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="index.css" rel="stylesheet">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <title>Bus List</title>
    </head>

    <body>

        <%
            String myorigin = request.getParameter("origin");
            String mydestination = request.getParameter("destination");
            String mydate = request.getParameter("date");
            String myPax = request.getParameter("quantity");
            String myrouteid = request.getParameter("routeid");
            String myarrivalTime = request.getParameter("arrivaltime");
            String mydepartureTime = request.getParameter("departuretime");
            String mybusId = request.getParameter("busId");
            
            //Database connection parameters
            Class.forName("com.mysql.jdbc.Driver");
            String myUrl = "jdbc:mysql://localhost:3306/bus_route";
            Connection myconnection = DriverManager.getConnection(myUrl, "root", "");

            String myQuery = "SELECT route.*, bus.* FROM route JOIN bus ON route.platno = bus.platno WHERE route.origin = ? AND route.destination = ?";

            PreparedStatement preparedStatement = myconnection.prepareStatement(myQuery);

            preparedStatement.setString(1, myorigin);
            preparedStatement.setString(2, mydestination);

            ResultSet myRs = preparedStatement.executeQuery();

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
                                <a class="btn" href="Dashboard.html">Dashboard</a>
                            </li>
                            <li class="nav__item">
                                <a class="nav__link" href="Booking.html">Booking</a>
                            </li>
                            <li class="nav__item">
                                <a class="nav__link" href="Profile.html">Profile</a>
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
            <div class="main-container">
                <div class="left-section">
                    <div class="card-container">                   
                        <%                            while (myRs.next()) {
                                String routeid = myRs.getString("routeid");
                                String type = myRs.getString("type");
                                String mydeparturetime = myRs.getString("departuretime");
                                String myarrivaltime = myRs.getString("arrivaltime");
                                String myprice = myRs.getString("price");
                                
                        %>
                        <div class="card" onclick="selectBus('<%=mybusId%>','<%=routeid%>', '<%=type%>', '<%=myPax%>', '<%=myorigin%>', '<%=mydestination%>', '<%=mydate%>', '<%=myarrivaltime%>', '<%=mydeparturetime%>', '<%=myprice%>')">  
                            <div class="card-1">
                                <div class="left1">
                                    <h3>Departure time </h3>
                                    <p ><%=mydeparturetime%> <p>
                                        <br>
                                    <p>Bus Type : <%=type%></p>
                                </div>
                            </div>
                            <div class="card-2">
                                <div class="left2">
                                    <h3>Arrival time </h3>
                                    <p ><%=myarrivaltime%> <p>
                                        <br>
                                        <br>
                                </div>
                            </div>


                            <div class="card-4">
                                <h3><%= myRs.getString("price")%></h3>
                            </div>
                        </div>
                        <%
                            }
                        %>

                    </div>
                </div>
                <div class="right-section">
                    <div class="info-container">
                        <div class="info1">

                            <h2><%= mydate%></h2>
                        </div>
                        <div class="info2">

                            <p><%=myorigin%></p>

                            <span style="font-size: 30px">&#8594;</span>
                            <p><%=mydestination%></p>
                        </div>
                        <div class="info4">
                            <p><%=myPax%> pax</p>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer>
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
                        Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu auctor lacus vehicula sit amet.
                    </p>
                    <div class="footer-icons">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                        <a href="#"><i class="fa fa-github"></i></a>
                    </div>
                </div>
            </footer>
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
        <script>
            function selectBus(mybusId, routeid, type, myPax, myorigin, mydestination, mydate, myarrivalTime, mydepartureTime, myprice) {
                window.location.href = 'busSeat.jsp?myrouteid=' + routeid + '&type=' + type + '&quantity=' + myPax + '&origin=' + myorigin + '&destination=' + mydestination + '&date=' + mydate + '&arrivaltime=' + myarrivalTime + '&departuretime=' + mydepartureTime + '&price=' + myprice ;
            }
        </script>

        <%

            myconnection.close();

        %>


    </body>

</html>
