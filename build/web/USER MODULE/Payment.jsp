<%-- 
    Document   : Payment
    Created on : 31 May 2024, 12:55:19 am
    Author     : USER
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="index.css" rel="stylesheet">
        <title>Payment</title>
        <script>
            function handlePayButtonClick(event) {
                event.preventDefault();

                var form = document.getElementById('customerForm');
                var name = form.name.value;
                var age = form.age.value;
                var email = form.email.value;
                var phone = form.phone.value;
                var bank = form.bank.value;

                // Validate the form fields
                if (name === "" || age === "" || email === "" || phone === "" || bank === "") {
                    alert("Please fill out all the fields.");
                    return;
                }

                // Map selected bank to dummy payment URLs
                var bankUrls = {
                    "maybank": "https://www.maybank2u.com.my/maybank2u/malaysia/en/personal/services/digital_banking/maybank2u_pay.page",
                    "cimb": "https://www.cimbclicks.com.my/",
                    "publicbank": "https://www.pbebank.com/",
                    "rhb": "https://www.rhbgroup.com/index.html",
                    "hongleong": "https://s.hongleongconnect.my/rib/app/fo/login?web=1",
                    "ambank": "https://www.ambank.com.my/eng/online-banking",
                    "bsn": "https://www.mybsn.com.my/mybsn/login/login.do",
                    "uob": "https://www.uob.com.my/personal/eservices/pib/pib.page",
                    "ocbc": "https://internet.ocbc.com.my/internet-banking/LoginV2/Login?rc=INB",
                    "hsbc": "https://www.hsbc.com.my/ways-to-bank/online-banking"
                };

                var paymentUrl = bankUrls[bank];

                // Display the redirect message
                document.getElementById('message').innerHTML = "<h2>Redirecting to the Payment Gateway...</h2><p>Please wait while we redirect you to the payment gateway.</p>";


                // Redirect to Dashboard.jsp after 2 seconds
                setTimeout(function () {
                    // Open the payment gateway URL in a new tab
                    var win = window.open(paymentUrl, '_blank');
                    win.focus();
                    // Alert the message first
                    alert('Payment accepted');
                    console.log('Payment inserted');
                    window.location.href = "Dashboard.jsp?message=ok";
                }, 2000); // Redirect after 2 seconds

            }

            window.onload = function () {
                document.getElementById('payButton').addEventListener('click', handlePayButtonClick);
            };
        </script>
    </head>
    <body>

        <%

            String busType = request.getParameter("type");
            String myPax = request.getParameter("quantity");
            double price = Double.parseDouble(request.getParameter("price"));
            int pax = Integer.parseInt(myPax);
            double total = price * pax;
            String myorigin = request.getParameter("origin");
            String mydestination = request.getParameter("destination");
            String mydate = request.getParameter("date");
//            String myrouteid = request.getParameter("routeid");
//            String busId = request.getParameter("platno");
            String myarrivalTime = request.getParameter("arrivaltime");
            String mydepartureTime = request.getParameter("departuretime");

//Database connection parameters
            Class.forName("com.mysql.jdbc.Driver");
            String myUrl = "jdbc:mysql://localhost:3306/bus_route";
            Connection myconnection = DriverManager.getConnection(myUrl, "root", "");
            Connection myconnection2 = DriverManager.getConnection(myUrl, "root", ""); // Fixed: changed 'url' to 'myUrl'

//            String myQuery = "SELECT route.*, bus.type AS type FROM route JOIN bus ON route.platno = bus.platno WHERE route.origin = ? AND route.destination = ?";
//
//            PreparedStatement preparedStatement = myconnection.prepareStatement(myQuery);
//
//            preparedStatement.setString(1, myorigin);
//            preparedStatement.setString(2, mydestination);
//
//            ResultSet myRs = preparedStatement.executeQuery();

        %>

        <%            // Get parameters from the URL
            
            String routeId = request.getParameter("routeid");
            String date = request.getParameter("date");
            String arrivaltime = request.getParameter("arrivaltime");
            String departuretime = request.getParameter("departuretime");
            int userId = (int) session.getAttribute("user_id");
            String seatNo = request.getParameter("seats"); // This should be a comma-separated list of seat numbers

            // Log the parameters for debugging
//            System.out.println("userId: " + userId);
//            System.out.println("routeId: " + routeId);
//            System.out.println("date: " + date);
//            System.out.println("seatNo: " + seatNo);
            // Create the SQL query with the values directly
//            String insertQuery = "INSERT INTO reservation (user_id, routeid, date, seatno) VALUES ('" + userId + "', '" + routeId + "', '" + date + "', '" + seatNo + "')";
//            String insertQuery = "INSERT INTO reservation (user_id, routeid, date, seatno) VALUES ('2','2','3','4')";
//            System.out.println("Executing query: " + insertQuery);
            try {
                // Create and execute the SQL query to insert into the reservation table
                String insertQuery = "INSERT INTO reservation (user_id, routeid, date, arrivaltime, departuretime, seatno) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStatement = myconnection2.prepareStatement(insertQuery);
                insertStatement.setInt(1, userId);
                insertStatement.setString(2, routeId);
                insertStatement.setString(3, date);
                insertStatement.setString(4, arrivaltime);
                insertStatement.setString(5, departuretime);
                insertStatement.setString(6, seatNo);

//                System.out.println("Executing query: " + insertQuery);
                int rowsInserted = insertStatement.executeUpdate();

                if (rowsInserted > 0) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('A new reservation was inserted successfully!');");
                    out.println("console.log('inserted');");
                    out.println("</script>");
                    
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Failed to insert the reservation.');");
                    out.println("console.log('failed');");
                    out.println("</script>");
                    out.println("Failed to insert the reservation.");
                }

                insertStatement.close();
            } catch (SQLException e) {
//                e.printStackTrace(out);
//                System.out.println("SQL Error: " + e.getMessage());
            }
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
                <div class="left-section">
                    <div class="row">
                        <div class="col-75">
                            <div class="paycontainer">
                                <form id="customerForm" method="post" action="receipt.jsp" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-50">
                                            
                                            <h3>Customer's Information</h3>
                                            <label for="name">Name:</label>
                                            <input type="text" id="name" name="name" required>
                                            <label for="age">Age:</label>
                                            <input type="number" id="age" name="age" min="1" required>
                                            <label for="email">Email:</label>
                                            <input type="email" id="email" name="email" required>
                                            <label for="phone">Phone Number:</label>
                                            <input type="tel" id="phone" name="phone" required>
                                        </div>
                                        <div class="col-50">
                                            <h3>Payment</h3>
                                            <label for="bank">Select Your Bank:</label><br>
                                            <select id="bank" name="bank" required>
                                                <option value="" disabled selected>Select your bank</option>
                                                <option value="maybank">Maybank</option>
                                                <option value="cimb">CIMB</option>
                                                <option value="publicbank">Public Bank</option>
                                                <option value="rhb">RHB Bank</option>
                                                <option value="hongleong">Hong Leong Bank</option>
                                                <option value="ambank">AmBank</option>
                                                <option value="bsn">Bank Simpanan Nasional (BSN)</option>
                                                <option value="uob">United Overseas Bank (UOB)</option>
                                                <option value="ocbc">OCBC Bank</option>
                                                <option value="hsbc">HSBC Bank</option>
                                            </select>
                                            
                                        </div>
                                    </div>
                                    
                                </form>



                                <button id="payButton" type="button">Pay</button><br>



                                <%            try {
                                        String query = "INSERT INTO payment (reservationID, amount) "
                                                + "VALUES ((SELECT reservationID FROM reservation ORDER BY reservationID DESC LIMIT 1), " + total + ")";
                                        PreparedStatement Statement = myconnection.prepareStatement(query);
                                        int rowsInserted = Statement.executeUpdate();

//                                        if (rowsInserted > 0) {
//                                            out.println("<script type='text/javascript'>");
//                                            out.println("alert('A payment was successfully inserted');");
//                                            out.println("console.log('Payment inserted');");
//                                            out.println("</script>");
//                                            out.println("A new payment was successfully inserted!");
//                                        } else {
//                                            out.println("<script type='text/javascript'>");
//                                            out.println("alert('Failed to proceed the payment.');");
//                                            out.println("console.log('failed');");
//                                            out.println("</script>");
//                                            out.println("Failed to proceed the payment.");
//                                        }
                                    } catch (SQLException e) {
                                        // Handle exceptions
                                    }
                                %>
                                <button style="background-color: red; margin-bottom: 30px" type="reset" value="Reset">Cancel</button>
                                <div id="message"></div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="right-section">
                    <div style="margin-left: 20%" class="info-container">
                        <div class="info1">
                            <h2><%=mydate%></h2>
                        </div>
                        <div class="info2">
                            <p><%=myorigin%></p>
                            <span style="font-size: 30px">&#8594;</span>
                            <p><%=mydestination%></p>

                        </div>
                        <div class="info3">
                            <p><%=mydepartureTime%> -->  </p> <br>
                            <p>  <%=myarrivalTime%></p> <br>

                        </div>

                        <div class="info4">
                            <p><%=busType%></p>
                        </div>

                        <div class="info5">
                            <p><%=myPax%> pax / RM <%=total%><p>
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

        <%

            myconnection.close();

            myconnection2.close();
        %>

    </body>
</html>
