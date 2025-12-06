<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Display Reports</title>
    <link rel="stylesheet" type="text/css" href="styledashboard.css">
    <style>
        .table-container {
            margin: 20px auto;
            width: 90%;
            max-width: 1000px;
        }

        .table-header {
            margin-bottom: 20px;
            text-align: center;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .table th, .table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .table th {
            background-color: #f2f2f2;
        }

        .table tr:hover {
            background-color: #f5f5f5;
        }

        .btn {
            display: inline-block;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .btn-info {
            background-color: #17a2b8;
            color: #fff;
        }

        .btn-info:hover {
            background-color: #138496;
        }

        .btn-danger {
            background-color: #dc3545;
            color: #fff;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <header>
        <h1>Display Driver Bus Reports</h1>
    </header>
    <nav>
        <a href="adminDashboard.jsp">Back to Admin Dashboard</a>
    </nav>
    <div class="container table-container">
        <div class="table-header">
            <h2>Assigned Driver Reports</h2>
        </div>
        <a href="GenerateReports.jsp" class="back">Add new driver</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Driver Name</th>
                    <th>Bus PlatNo</th>
                    <th>Origin</th>
                    <th>Destination</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                    <th>Assign Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Map<String, String>> assignments = (List<Map<String, String>>) session.getAttribute("assignments");
                    if (assignments != null) {
                        for (Map<String, String> assignment : assignments) {
                            String driverID = assignment.get("driver");
                            String busID = assignment.get("bus");
                            String assignDate = assignment.get("assignDate");

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");
                                
                                // Get driver name
                                String driverName = "";
                                String driverQuery = "SELECT staff_fullname FROM staff WHERE staff_id = ?";
                                PreparedStatement driverStmt = conn.prepareStatement(driverQuery);
                                driverStmt.setString(1, driverID);
                                ResultSet driverRs = driverStmt.executeQuery();
                                if (driverRs.next()) {
                                    driverName = driverRs.getString("staff_fullname");
                                }
                                driverRs.close();
                                driverStmt.close();
                                
                                String origin = "";
                                String destination = "";
                                String departureTime = "";
                                String arrivalTime = "";

                                String routeQuery = "SELECT origin, destination, departuretime, arrivaltime FROM route WHERE platno = ?";
                                PreparedStatement routeStmt = conn.prepareStatement(routeQuery);
                                routeStmt.setString(1, busID);
                                ResultSet routeRs = routeStmt.executeQuery();
                                if (routeRs.next()) {
                                    origin = routeRs.getString("origin");
                                    destination = routeRs.getString("destination");
                                    departureTime = routeRs.getTime("departuretime").toString();
                                    arrivalTime = routeRs.getTime("arrivaltime").toString();
                                }
                                routeRs.close();
                                routeStmt.close();
                                
                                out.println("<tr>");
                                out.println("<td>" + driverName + "</td>");
                                out.println("<td>" + busID + "</td>");
                                out.println("<td>" + origin + "</td>");
                                out.println("<td>" + destination + "</td>");
                                out.println("<td>" + departureTime + "</td>");
                                out.println("<td>" + arrivalTime + "</td>");
                                out.println("<td>" + assignDate + "</td>");
                                out.println("<td>");
                                out.println("<a href='DeleteAssignDriver.jsp?assignDate=" + assignDate + "&bus=" + busID + "&driver=" + driverID + "' class='btn btn-danger'>Delete</a>");
                                out.println("</td>");
                                out.println("</tr>");

                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <footer>
        <p>&copy; 2024 User Management System</p>
    </footer>
            
    <script src="https://code .jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>