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
        <title>Bus Seat</title>
    </head>

    <body>
        <%
            String busType = request.getParameter("type");
            String myPax = request.getParameter("quantity");
            String myorigin = request.getParameter("origin");
            String mydestination = request.getParameter("destination");
            String mydate = request.getParameter("date");
            String myrouteid = request.getParameter("myrouteid");
            String busId = request.getParameter("platno");
            String myarrivalTime = request.getParameter("arrivaltime");
            String mydepartureTime = request.getParameter("departuretime");
            String myprice = request.getParameter("price");
            int userId = (int) session.getAttribute("user_id");
            

            Class.forName("com.mysql.jdbc.Driver");
            String myUrl = "jdbc:mysql://localhost:3306/bus_route";
            Connection myconnection = DriverManager.getConnection(myUrl, "root", "");

            // Query to get route details using routeid
            String myQuery = "SELECT arrivaltime, departuretime, bus.type AS type FROM route JOIN bus ON route.platno = bus.platno WHERE route.routeid = ?";
            PreparedStatement preparedStatement = myconnection.prepareStatement(myQuery);
            preparedStatement.setString(1, myrouteid);
            ResultSet myRs1 = preparedStatement.executeQuery();

            // Query to get reserved seats
            String reservedSeatsQuery = "SELECT seatno FROM reservation WHERE date = ? AND routeid = ? AND status = 'approved'";
            PreparedStatement reservedSeatsStmt = myconnection.prepareStatement(reservedSeatsQuery);
            reservedSeatsStmt.setString(1, mydate);
            reservedSeatsStmt.setString(2, myrouteid);
            ResultSet reservedSeatsRs = reservedSeatsStmt.executeQuery();

            // Collect reserved seats
            StringBuilder reservedSeats = new StringBuilder();
            while (reservedSeatsRs.next()) {
                reservedSeats.append(reservedSeatsRs.getString("seatno")).append(",");
            }

            // Close result sets and statements
            reservedSeatsRs.close();
            reservedSeatsStmt.close();
            myRs1.close();
            preparedStatement.close();

            String reservedSeatsString = reservedSeats.length() > 0 ? reservedSeats.substring(0, reservedSeats.length() - 1) : "";
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


        <main>
            <div class="main-container">
                <div clss="left-section">
                    <div class="bus-layout">
                        <div class="legend">
                            <div class="legend-item">
                                <div class="seat available"></div>
                                <span>Available Seat</span>
                            </div>
                            <div class="legend-item">
                                <div class="seat unavailable"></div>
                                <span>Occupied Seat</span>
                            </div>
                            <div class="legend-item">
                                <div class="seat selected"></div>
                                <span>Chosen Seat</span>
                            </div> 
                        </div>
                        <div class="driver-seat">Driver</div>
                        <% if (busType.equals("single deck")) { %>
                        <div class="seat-row">
                            <div class="seat" id="seat1" onclick="selectSeat('seat1')"></div>
                            <div class="seat" id="seat2" onclick="selectSeat('seat2')"></div>
                            <div class="seat" id="seat3"onclick="selectSeat('seat3')"></div>
                            <div class="seat" id="seat4" onclick="selectSeat('seat4')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat5" onclick="selectSeat('seat5')"></div>
                            <div class="seat" id="seat6" onclick="selectSeat('seat6')"></div>
                            <div class="seat" id="seat7" onclick="selectSeat('seat7')"></div>
                            <div class="seat" id="seat8" onclick="selectSeat('seat8')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat9" onclick="selectSeat('seat9')"></div>
                            <div class="seat" id="seat10" onclick="selectSeat('seat10')"></div>
                            <div class="seat" id="seat11" onclick="selectSeat('seat11')"></div> 
                            <div class="seat" id="seat12" onclick="selectSeat('seat12')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat13" onclick="selectSeat('seat13')"></div>
                            <div class="seat" id="seat14" onclick="selectSeat('seat14')"></div>
                            <div class="seat" id="seat15" onclick="selectSeat('seat15')"></div>
                            <div class="seat" id="seat16" onclick="selectSeat('seat16')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat17" onclick="selectSeat('seat17')"></div>
                            <div class="seat" id="seat18" onclick="selectSeat('seat18')"></div>
                            <div class="seat" id="seat19" onclick="selectSeat('seat19')"></div>
                            <div class="seat" id="seat20" onclick="selectSeat('seat20')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat21" onclick="selectSeat('seat21')"></div>
                            <div class="seat" id="seat22" onclick="selectSeat('seat22')"></div>
                            <div class="seat" id="seat23" onclick="selectSeat('seat23')"></div>
                            <div class="seat" id="seat24" onclick="selectSeat('seat24')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat25" onclick="selectSeat('seat25')"></div>
                            <div class="seat" id="seat26" onclick="selectSeat('seat26')"></div>
                            <div class="seat" id="seat27" onclick="selectSeat('seat27')"></div>
                            <div class="seat" id="seat28" onclick="selectSeat('seat28')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat29" onclick="selectSeat('seat29')"></div>
                            <div class="seat" id="seat30" onclick="selectSeat('seat30')"></div>
                            <div class="seat" id="seat31" onclick="selectSeat('seat31')"></div>
                            <div class="seat" id="seat32" onclick="selectSeat('seat32')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat33" onclick="selectSeat('seat33')"></div>
                            <div class="seat" id="seat34" onclick="selectSeat('seat34')"></div>
                            <div class="seat" id="seat35" onclick="selectSeat('seat35')"></div>
                            <div class="seat" id="seat36" onclick="selectSeat('seat36')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat37" onclick="selectSeat('seat37')"></div>
                            <div class="seat" id="seat38" onclick="selectSeat('seat38')"></div>
                            <div class="seat" id="seat39" onclick="selectSeat('seat39')"></div>
                            <div class="seat" id="seat40" onclick="selectSeat('seat40')"></div>
                        </div>
                        <!-- Additional rows as needed -->
                        <% } else if (busType.equals("double deck")) { %>
                        <div class="deck">
                            <h3>Lower Deck</h3>
                            <div class="seat-row">
                                <div class="seat" id="seat1" onclick="selectSeat('seat1')"></div>
                                <div class="seat" id="seat2" onclick="selectSeat('seat2')"></div>
                                <div class="seat" id="seat3"onclick="selectSeat('seat3')"></div>
                                <div class="seat" id="seat4" onclick="selectSeat('seat4')"></div>
                            </div>
                            <div class="seat-row">
                                <div class="seat" id="seat5" onclick="selectSeat('seat5')"></div>
                                <div class="seat" id="seat6" onclick="selectSeat('seat6')"></div>
                                <div class="seat" id="seat7" onclick="selectSeat('seat7')"></div>
                                <div class="seat" id="seat8" onclick="selectSeat('seat8')"></div>
                            </div>
                            <div class="seat-row">
                                <div class="seat" id="seat9" onclick="selectSeat('seat9')"></div>
                                <div class="seat" id="seat10" onclick="selectSeat('seat10')"></div>
                                <div class="seat" id="seat11" onclick="selectSeat('seat11')"></div> 
                                <div class="seat" id="seat12" onclick="selectSeat('seat12')"></div>
                            </div>
                            <div class="seat-row">
                                <div class="seat" id="seat13" onclick="selectSeat('seat13')"></div>
                                <div class="seat" id="seat14" onclick="selectSeat('seat14')"></div>
                                <div class="seat" id="seat15" onclick="selectSeat('seat15')"></div>
                                <div class="seat" id="seat16" onclick="selectSeat('seat16')"></div>
                            </div>
                            <!-- Additional rows as needed -->
                        </div>
                        <h3>Upper Deck</h3>
                        <div class="seat-row">
                            <div class="seat" id="seat17" onclick="selectSeat('seat17')"></div>
                            <div class="seat" id="seat18" onclick="selectSeat('seat18')"></div>
                            <div class="seat" id="seat19" onclick="selectSeat('seat19')"></div>
                            <div class="seat" id="seat20" onclick="selectSeat('seat20')"></div>
                        </div><div class="seat-row">
                            <div class="seat" id="seat21" onclick="selectSeat('seat21')"></div>
                            <div class="seat" id="seat22" onclick="selectSeat('seat22')"></div>
                            <div class="seat" id="seat23" onclick="selectSeat('seat23')"></div>
                            <div class="seat" id="seat24" onclick="selectSeat('seat24')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat25" onclick="selectSeat('seat25')"></div>
                            <div class="seat" id="seat26" onclick="selectSeat('seat26')"></div>
                            <div class="seat" id="seat27" onclick="selectSeat('seat27')"></div>
                            <div class="seat" id="seat28" onclick="selectSeat('seat28')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat29" onclick="selectSeat('seat29')"></div>
                            <div class="seat" id="seat30" onclick="selectSeat('seat30')"></div>
                            <div class="seat" id="seat31" onclick="selectSeat('seat31')"></div>
                            <div class="seat" id="seat32" onclick="selectSeat('seat32')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat33" onclick="selectSeat('seat33')"></div>
                            <div class="seat" id="seat34" onclick="selectSeat('seat34')"></div>
                            <div class="seat" id="seat35" onclick="selectSeat('seat35')"></div>
                            <div class="seat" id="seat36" onclick="selectSeat('seat36')"></div>
                        </div>
                        <div class="seat-row">
                            <div class="seat" id="seat37" onclick="selectSeat('seat37')"></div>
                            <div class="seat" id="seat38" onclick="selectSeat('seat38')"></div>
                            <div class="seat" id="seat39" onclick="selectSeat('seat39')"></div>
                            <div class="seat" id="seat40" onclick="selectSeat('seat40')"></div>
                        </div>
                        <% }%>

                        <div class="pax-info">
                            <h4>Pax: <span id="pax-count"><%= myPax%></span></h4>
                            <!--'<%=myPax%>'-->
                        </div>
                        <!--busId, type, myPax, myorigin, mydestination, mydate-->
                        <button type="submit" id="pay-button" onclick="selectBus('<%=userId%>','<%=busType%>', '<%=myPax%>', '<%=myorigin%>', '<%=mydestination%>', '<%=mydate%>', '<%=mydepartureTime%>', '<%=myarrivalTime%>', '<%=myrouteid%>' , <%=myprice%>)" disabled>Reserve</button>
                    </div>

                </div>

                <div class="right-section">
                    <div style="margin-left: 20%" class="info-container">
                        <div class="info1">
                            <h2><%= mydate%></h2>
                        </div>
                        <div class="info2">
                            <p><%= myorigin%></p>
                            <span style="font-size: 30px">&#8594;</span>
                            <p><%= mydestination%></p>
                        </div>
                        <div class="info3">
                            <p><%= mydepartureTime%> --> </p> <br>
                            <p> <%= myarrivalTime%></p> <br>
                        </div>

                        <div class="info4">
                            <p><%= busType%></p>
                        </div>

                        <div class="info5">
                            <p><%= myPax%> pax<p>
                        </div>
                        
                        
                    </div>
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
            var count = 0;
            const requiredPax = <%= Integer.parseInt(myPax)%>;
            const payButton = document.getElementById('pay-button');

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

            let selectedSeats = [];
            const reservedSeats = "<%= reservedSeatsString%>".split(',');

            document.querySelectorAll('.seat').forEach(seat => {
                if (reservedSeats.includes(seat.id)) {
                    seat.classList.add('unavailable');
                    seat.classList.remove('selected');
                    seat.removeAttribute('seat');
                } else {
                    seat.classList.add('available');
                    seat.addEventListener('click', () => {
                        const seatId = seat.id;
                        if (seat.classList.contains('selected')) {
                            seat.classList.remove('selected');
                            count--;
                            selectedSeats.splice(selectedSeats.indexOf(seatId), 1);
                        } else if (count < requiredPax) {
                            if(!reservedSeats.includes(seat.id))
                            {
                                seat.classList.add('selected');
                                count++;
                                selectedSeats.push(seatId);
                            }
                        }

                        if (count === requiredPax) {
                            payButton.disabled = false;
                        } else {
                            payButton.disabled = true;
                        }
                        
                        if(count === requiredPax)
                            alertSelectedSeats();
                    });
                }
            });

            function alertSelectedSeats() {
                alert("Selected Seats: " + selectedSeats.join(", "));
            }

            function selectBus(userId,type, myPax, myorigin, mydestination, mydate, mydepartureTime, myarrivalTime, myrouteid, myprice) {
                
                window.location.href = 'Payment.jsp?userId=' + userId + '&seats=' + selectedSeats + '&type=' + type + '&quantity=' + myPax + '&origin=' + myorigin + '&destination=' + mydestination + '&date=' + mydate + '&departuretime=' + mydepartureTime + '&arrivaltime=' + myarrivalTime + '&routeid=' + myrouteid + '&price=' + myprice;
            }
        </script>

        <%
            myconnection.close();
        %>
    </body>
</html>
