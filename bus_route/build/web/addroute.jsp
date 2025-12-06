<%-- 
    Document   : addroute
    Created on : 28 May 2024, 6:13:29 pm
    Author     : irfan yahya
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Route</title>
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

            header, footer {
                background-color: #007bff;
                color: white;
                text-align: center;
                padding: 15px 0;
            }
            
            header nav {
                position: absolute;
                top: 30px;
                right: 20px;
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
                color: maroon;
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

            .form-container {
                background-color: white;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                width: 100%;
                max-width: 600px;
                box-sizing: border-box;
            }

            h2, h3 {
                text-align: center;
            }

            form table {
                width: 100%;
                margin: 20px 0;
            }

            form table td {
                padding: 10px;
            }

            form input[type="text"], form input[type="number"], form input[type="time"] {
                width: calc(100% - 20px);
                padding: 8px;
                margin: 5px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            form input[type="submit"], form input[type="reset"] {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-right: 10px;
            }

            form input[type="submit"] {
                background-color: #007bff;
                color: white;
            }

            form input[type="reset"] {
                background-color: gray;
                color: white;
            }

            form input[type="submit"]:hover, form input[type="reset"]:hover {
                opacity: 0.9;
            }

            footer {
                width: 100%;
                text-align: center;
            }
        </style>
    </head>
    <body>
        
        <%
            Class.forName("com.mysql.jdbc.Driver");
            String myUrl = "jdbc:mysql://localhost:3306/bus_route";
            Connection myconnection = DriverManager.getConnection(myUrl, "root", "");
            Connection myconnection1 = DriverManager.getConnection(myUrl, "root", "");

            Statement myStatement = myconnection.createStatement();
            Statement myStatement1 = myconnection1.createStatement();
            String myQuery1 = "select * from route";
            String myQuery2 = "select platno from bus where status = 'available'";
            ResultSet myRs1 = myStatement.executeQuery(myQuery1);
            ResultSet myRs2 = myStatement1.executeQuery(myQuery2);
        %>
        
        <header>
            <h1>Bus Booking System</h1>
        </header>
         <nav>
            <a href="adminDashboard.jsp">Back to Admin Dashboard</a>
        </nav>

        <main>
            <div class="form-container">
                <h2>Add Route That is Available</h2>
                <h3>Add Route Form</h3>
                <form action="process-addroute.jsp" method="POST">
                    <table>
                        <tbody>
                            <tr>
                                <td><label>Route ID:</label></td>
                                <td><input type="text" name="routeid" required/></td>
                            </tr>
                            <tr>
                                <td><label for="bus">Bus : </label></td>
                                <td>
                                    <select name="platno" id="platno">
                                        <% while (myRs2.next()) { %>
                                            <option value="<%= myRs2.getString("platno") %>"><%= myRs2.getString("platno") %></option>
                                        <% } %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><label>Origin:</label></td>
                                <td><input type="text" name="origin" required/></td>
                            </tr>
                            <tr>
                                <td><label>Destination:</label></td>
                                <td><input type="text" name="destination" required/></td>
                            </tr>
                            <tr>
                                <td><label>Departure Time:</label></td>
                                <td><input type="time" name="departuretime" required/></td>
                            </tr>
                            <tr>
                                <td><label>Arrival Time:</label></td>
                                <td><input type="time" name="arrivaltime" required/></td>
                            </tr>
                            <tr>
                                <td><label>Price:</label></td>
                                <td><input type="number" name="price" required/></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" value="Save"/> 
                                    <input type="reset" value="Cancel"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </main>

        <footer>
            <p>&copy; 2024 Bus Booking System. All rights reserved.</p>
        </footer>
    </body>
</html>
