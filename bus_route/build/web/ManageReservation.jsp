<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        
        <title>Manage Booking</title>
        <style>
            .filter-container {
                margin-bottom: 20px;
            }
            
            
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                color: #333;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            header , footer{
                background-color: #007bff;
                color: #fff;
                padding: 20px 0;
                text-align: center;
            }

            header h1 {
                margin: 0;
            }

            /* Navigation Styling */
            nav {
                background-color: #0056b3;
                padding: 10px 0;
                text-align: center;
            }

            nav a {
                color: #fff;
                text-decoration: none;
                margin: 0 15px;
                font-weight: bold;
            }

            nav a:hover {
                text-decoration: underline;
            }

            nav input[type="button"] {
                background-color: white;
                color: #007bff;
                border: 1px solid maroon;
                padding: 10px 20px;
                margin-left: 10px;
                border-radius: 4px;
                cursor: pointer;
            }

            nav input[type="button"]:hover {
                background-color: grey;
                color: white;
            }

            main {
                flex: 1;
                padding: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .content-container {
                background-color: white;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                width: 100%;
                max-width: 800px;
                box-sizing: border-box;
            }

            h1 {
                text-align: center;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }

            table, th, td {
                border: 1px solid #ccc;
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #007bff;
                color: white;
            }

            input[type="button"] {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                background-color: #007bff;
                color: white;
                margin-bottom: 20px;
            }

            input[type="button"]:hover {
                opacity: 0.9;
            }

            footer {
                text-align: center;
            }

            .actions a {
                margin: 0 5px;
                color: #007bff;
                text-decoration: none;
            }

            .actions a:hover {
                text-decoration: underline;
            }
       
        </style>
    </head>
    <body>
        <header>
            <h1>Manage Route</h1>
        </header>
        <nav>
            <a href="adminDashboard.jsp">Back to Admin Dashboard</a>
        </nav>

        <main>
            <div class="container">
                <div class="content">
                    <div class="form-container">
                        <h2>Manage Bookings</h2>

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

<!--                        <form id="manageBookingsForm" method="post">-->
                            <table class="bookings-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>RESERVATION ID</th>
                                        <th>USER ID</th>
                                        <th>ROUTE ID</th>
                                        <th>DATE</th>
                                        <th>DEPARTURE TIME</th>
                                        <th>ARRIVAL TIME</th>
                                        <th>SEAT NUMBER</th>
                                        <th>ACTION</th>
                                    </tr>
                                </thead>
                                <tbody id="reservationTableBody">
                                    <%
                                        Connection conn = null;
                                        PreparedStatement stmt = null;
                                        ResultSet rs = null;
                                        int i = 1;
                                        String selectedStatus = request.getParameter("status");
                                        try {
                                            // Load the MySQL JDBC driver
                                            Class.forName("com.mysql.jdbc.Driver");

                                            // Establish the connection
                                            String url = "jdbc:mysql://localhost:3306/bus_route";
                                            String username = "root";
                                            String password = ""; // Replace with your MySQL password
                                            conn = DriverManager.getConnection(url, username, password);

                                            // Prepare SQL query
                                            String sql = "SELECT reservationID, user_id, routeid, date, departuretime, arrivaltime, seatno, status FROM reservation";

                                            // Apply filter based on selected status
                                            if ("pending".equals(selectedStatus) || "approved".equals(selectedStatus) || "rejected".equals(selectedStatus)) {
                                                sql += " WHERE status = ?";
                                            }

                                            stmt = conn.prepareStatement(sql);

                                            // Set filter parameter if applicable
                                            if ("pending".equals(selectedStatus) || "approved".equals(selectedStatus) || "rejected".equals(selectedStatus)) {
                                                stmt.setString(1, selectedStatus);
                                            }

                                            // Execute the query
                                            rs = stmt.executeQuery();

                                            // Iterate over the result set and display data
                                            while (rs.next()) {
                                    %>
                                    <tr data-status="<%= rs.getString("status")%>">
                                        <td><%= i++%></td>
                                        <td><%= rs.getInt("reservationID")%></td>
                                        <td><%= rs.getInt("user_id")%></td>
                                        <td><%= rs.getString("routeid")%></td>
                                        <td><%= rs.getString("date")%></td>
                                        <td><%= rs.getString("departuretime")%></td>
                                        <td><%= rs.getString("arrivaltime")%></td>
                                        <td><%= rs.getString("seatno")%></td>
                                        <td class="actionCell">
                                            <form method="post" class="status-update-form" action="updateBookingStatus.jsp">
                                                <input type="hidden" name="reservationID" value="<%= rs.getInt("reservationID")%>">
                                                <select name="status">
                                                    <option value="pending" <%= "pending".equals(rs.getString("status")) ? "selected" : ""%>>Pending</option>
                                                    <option value="approved" <%= "approved".equals(rs.getString("status")) ? "selected" : ""%>>Approved</option>
                                                    <option value="rejected" <%= "rejected".equals(rs.getString("status")) ? "selected" : ""%>>Rejected</option>
                                                </select>
                                                <button type="submit">Update</button>
                                            </form>
                                                
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


                        <!--</form>-->
                    </div>
                </div>
            </div>
        </main>

        <footer>
            <p>&copy; 2024 Bus Booking System. All rights reserved.</p>
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

            // Function to save changes via AJAX
            function saveChanges() {
                const forms = document.querySelectorAll('.status-update-form');
                forms.forEach(form => {
                    const formData = new FormData(form);
                    const xhr = new XMLHttpRequest();
                    xhr.open('POST', 'updateBookingStatus.jsp', true);
                    xhr.onload = function () {
                        // Handle response if needed
                        console.log(xhr.responseText);
                    };
                    xhr.send(formData);
                });
            }
        </script>

    </body>
</html>
