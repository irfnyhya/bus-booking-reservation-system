<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            padding: 20px;
        }
        h2 {
            margin-bottom: 20px;
        }
        .receipt-details {
            margin-bottom: 20px;
        }
        .receipt-details p {
            margin-bottom: 5px;
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function printReceipt() {
            window.print();
        }
    </script>
</head>
<body>
    <h2>Receipt Details</h2>
    <div class="receipt-details">
        <% 
          
            
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Establish the connection
                String url = "jdbc:mysql://localhost:3306/bus_route";
                String username = "root";
                String password = ""; // Replace with your MySQL password
                conn = DriverManager.getConnection(url, username, password);

                // Prepare SQL query to fetch reservation details
                String sql = "SELECT r.reservationID, ro.origin, ro.destination, r.date, r.departuretime, r.arrivaltime, r.seatno, r.status, p.amount "
                        + "FROM reservation r "
                        + "JOIN route ro ON r.routeid = ro.routeid "
                        + "LEFT JOIN payment p ON r.reservationID = p.reservationID "
                        + "WHERE r.reservationID=?";

                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(request.getParameter("reservationID")));

                // Execute the query
                rs = stmt.executeQuery();

                // Display receipt details
                if (rs.next()) {
        %>
        
        <p><strong>Reservation ID:</strong> <%= rs.getInt("reservationID") %></p>
        <p><strong>Origin:</strong> <%= rs.getString("origin") %></p>
        <p><strong>Destination:</strong> <%= rs.getString("destination") %></p>
        <p><strong>Date:</strong> <%= rs.getString("date") %></p>
        <p><strong>Departure Time:</strong> <%= rs.getString("departuretime") %></p>
        <p><strong>Arrival Time:</strong> <%= rs.getString("arrivaltime") %></p>
        <p><strong>Seat Number:</strong> <%= rs.getString("seatno") %></p>
        <p><strong>Status:</strong> <%= rs.getString("status") %></p>
        <p><strong>Amount:</strong> <%= rs.getString("amount") != null ? rs.getString("amount") : "N/A" %></p>
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
                        /* ignored */
                    }
                }
                if (stmt != null) {
                    try {
                        stmt.close();
                    } catch (SQLException e) {
                        /* ignored */
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        /* ignored */
                    }
                }
            }
        %>
    </div>

    <!-- Print button -->
    <button onclick="printReceipt()">Print Receipt</button>

</body>
</html>
