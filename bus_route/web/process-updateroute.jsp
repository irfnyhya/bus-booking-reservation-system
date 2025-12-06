<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Route</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        header, footer {
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
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: calc(100vh - 120px);
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
        h2 {
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
        form input[type="submit"], form input[type="button"] {
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
        form input[type="button"] {
            background-color: gray;
            color: white;
        }
        form input[type="submit"]:hover, form input[type="button"]:hover {
            opacity: 0.9;
        }
        footer {
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Update Route</h1>
    </header>
    <nav>
        <a href="adminDashboard.jsp">Back to Admin Dashboard</a>
    </nav>
    <main>
        <div class="form-container">
            <%
                String routeid1 = request.getParameter("routeid");
                String myplatno = "", myorigin = "", mydestination = "", mydeparture = "", myarrival = "", myprice = "";

                Class.forName("com.mysql.jdbc.Driver");
                String myUrl = "jdbc:mysql://localhost:3306/bus_route";
                Connection myconnection = DriverManager.getConnection(myUrl, "root", "");

                Statement myStatement = myconnection.createStatement();
                String myQuery = "SELECT * FROM route WHERE routeid= '" + routeid1 + "'";
                ResultSet myRs = myStatement.executeQuery(myQuery);

                if (myRs.next()) {
                    myplatno = myRs.getString(2);
                    myorigin = myRs.getString(3);
                    mydestination = myRs.getString(4);
                    mydeparture = myRs.getString(5);
                    myarrival = myRs.getString(6);
                    myprice = myRs.getString(7);
                }
                
                // Fetch the list of buses for the dropdown
                String busQuery = "SELECT DISTINCT platno FROM route";
                ResultSet busRs = myStatement.executeQuery(busQuery);
            %>
            <h2>Update Route</h2>
            <form action="process-updateroute2.jsp" method="POST">
                <input type="hidden" name="hidid" value="<%=routeid1%>"/>
                <table>
                    <tr>
                        <td><label for="bus">Bus: </label></td>
                        <td>
                            <select name="platno" id="platno">
                                <% while (busRs.next()) { %>
                                    <option value="<%= busRs.getString("platno") %>" 
                                    <%= busRs.getString("platno").equals(myplatno) ? "selected" : "" %>>
                                        <%= busRs.getString("platno") %>
                                    </option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>Origin: </label></td>
                        <td><input type="text" name="origin" value="<%=myorigin%>" required/></td>
                    </tr>
                    <tr>
                        <td><label>Destination: </label></td>
                        <td><input type="text" name="destination" value="<%=mydestination%>" required/></td>
                    </tr>
                    <tr>
                        <td><label>Departure Time: </label></td>
                        <td><input type="time" name="departuretime" value="<%=mydeparture%>" required/></td>
                    </tr>
                    <tr>
                        <td><label>Arrival Time: </label></td>
                        <td><input type="time" name="arrivaltime" value="<%=myarrival%>" required/></td>
                    </tr>
                    <tr>
                        <td><label>Price: </label></td>
                        <td><input type="number" name="price" value="<%=myprice%>" required/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Update"/>
                            <input type="button" value="Cancel" onclick="window.location.href='process-viewroute.jsp'; return false;"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Bus Booking System. All rights reserved.</p>
    </footer>
    <%
        myconnection.close();
    %>
</body>
</html>
