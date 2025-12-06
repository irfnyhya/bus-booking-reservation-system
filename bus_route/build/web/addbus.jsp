<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Student Page</title>
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
                padding: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: calc(100vh - 120px); /* Adjust to fit header and footer */
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

            form select {
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
                position: fixed;
                width: 100%;
                bottom: 0;
            }
        </style>
        <script>
            function setCapacity() {
                var type = document.getElementById("busType").value;
                var capacityField = document.getElementById("capacity");

                if (type === "Single Deck") {
                    capacityField.value = 40;
                } else if (type === "Double Deck") {
                    capacityField.value = 50;
                }
            }
        </script>
    </head>
    <body>
        <header>
            <h1>Bus Booking System</h1>
        </header>
         <nav>
            <a href="busOwnerDashboard.jsp">Back to Dashboard</a>
        </nav>

        <main>
            <div class="form-container">
                <h2>Add Bus That is Available</h2>
                <h3>Add Bus Form</h3>
                <form action="process-addbus.jsp" method="POST">
                    <input type="hidden" name="command" value="ADD"/>
                    <table>
                        <tbody>
                            <tr>
                                <td><label>Plat Number:</label></td>
                                <td><input type="text" name="platno" required /></td>
                            </tr>
                            <tr>
                                <td><label>Type Of Bus:</label></td>
                                <td>
                                    <select name="type" id="busType" required onchange="setCapacity()">
                                        <option value="Single Deck">Single Deck</option>
                                        <option value="Double Deck">Double Deck</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><label>Capacity:</label></td>
                                <td><input type="number" name="capacity" id="capacity" required /></td>
                            </tr>
                            <tr>
                                <td><label>Status Of Bus:</label></td>
                                <td>
                                    <select name="status">
                                        <option>Maintenance</option>
                                        <option>Available</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Save"/> <input type="reset" value="Cancel" /></td>
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
