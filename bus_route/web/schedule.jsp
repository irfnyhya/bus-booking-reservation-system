<%-- 
    Document   : schedule
    Created on : 31 May 2024, 2:59:20 pm
    Author     : irfan yahya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Bus</title>
        <style>
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

            header {
                background-color: #007bff;
                color: #fff;
                padding: 20px 0;
                text-align: center;
            }

            header h1 {
                margin: 0;
            }

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
                border: 1px solid #007bff;
                padding: 10px 20px;
                margin-left: 10px;
                border-radius: 4px;
                cursor: pointer;
                font-family: Arial, sans-serif;
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
                background-color: #007bff;
                color: #fff;
                padding: 20px 0;
                text-align: center;
                position: relative;
                width: 100%;
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
            <h1>Schedule</h1>
        </header>
        <nav>
            <a href="driverDashboard.jsp">Back To Dashboard</a>
        </nav>

        <main>
            <div class="content-container">
                <h1>Schedule</h1>

                <table>
                    <tr>
                        <th>Route ID</th>
                        <th>Bus</th>
                        <th>Departure Time</th>
                        <th>Arrival Time</th>
                        <th>Date</th>
                    </tr>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        String myUrl = "jdbc:mysql://localhost:3306/bus_route";
                        Connection myconnection = DriverManager.getConnection(myUrl, "root", "");

                        Statement myStatement = myconnection.createStatement();
                        String myQuery = "SELECT r.routeid, rt.platno, r.departuretime, r.arrivaltime, r.date " +
                                         "FROM reservation r " +
                                         "JOIN route rt ON r.routeid = rt.routeid";
                        ResultSet myRs = myStatement.executeQuery(myQuery);

                        while (myRs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + myRs.getString("routeid") + "</td>");
                            out.println("<td>" + myRs.getString("platno") + "</td>");
                            out.println("<td>" + myRs.getString("departuretime") + "</td>");
                            out.println("<td>" + myRs.getString("arrivaltime") + "</td>");
                            out.println("<td>" + myRs.getString("date") + "</td>");
                            out.println("</tr>");
                        }

                        myconnection.close();
                    %>
                </table>
            </div>
        </main>

        <footer>
            <p>&copy; 2024 Bus Booking System. All rights reserved.</p>
        </footer>
    </body>
</html>
