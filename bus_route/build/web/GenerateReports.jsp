<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Reports</title>
    <link rel="stylesheet" type="text/css" href="styledashboard.css">
    <style>
        .container {
            margin: 100px auto;
            max-width: 500px;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-header {
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group select, .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .alert {
            padding: 10px;
            background-color: #f44336;
            color: white;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
    </header>
    <nav>
        <a href="adminDashboard.jsp">Back to Admin Dashboard</a>
    </nav>
    <div class="container form-container">
        <div class="form-header">
            <h2>Assign Driver to Bus</h2>
        </div>
        <form action="GenerateReports.jsp" method="post">
            <div class="form-group">
                <label for="driver">Select Driver:</label>
                <select name="driver" id="driver" class="form-control" required>
                    <option value="">Select Driver</option>
                    <% 
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT staff_id, staff_fullname FROM staff WHERE role='Driver'");
                            while (rs.next()) {
                                String staffID = rs.getString("staff_id");
                                String name = rs.getString("staff_fullname");
                                out.println("<option value='" + staffID + "'>" + name + "</option>");
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="bus">Select Bus:</label>
                <select name="bus" id="bus" class="form-control" required>
                    <option value="">Select Bus</option>
                    <% 
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT platno FROM bus");
                            while (rs.next()) {
                                String platNo = rs.getString("platno");
                                out.println("<option value='" + platNo + "'>" + platNo + "</option>");
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="assignDate">Assign Date:</label>
                <select name="assignDate" id="assignDate" class="form-control" required>
                    <option value="">Select Date</option>
                    <% 
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_route", "root", "");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT DISTINCT date FROM reservation");
                            while (rs.next()) {
                                String Date = rs.getString("date");
                                out.println("<option value='" + Date + "'>" + Date + "</option>");
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Assign</button>
            <a href="DisplayReports.jsp">Report Driver List</a>
        </form>
        <% 
            if (request.getMethod().equalsIgnoreCase("post")) {
                String driver = request.getParameter("driver");
                String bus = request.getParameter("bus");
                String assignDate = request.getParameter("assignDate");

                List<Map<String, String>> assignments = (List<Map<String, String>>) session.getAttribute("assignments");
                if (assignments == null) {
                    assignments = new ArrayList<>();
                }

                Map<String, String> assignment = new HashMap<>();
                assignment.put("driver", driver);
                assignment.put("bus", bus);
                assignment.put("assignDate", assignDate);
                assignments.add(assignment);

                session.setAttribute("assignments", assignments);
                
                response.sendRedirect("DisplayReports.jsp");
            }
        %>
    </div>

    <footer>
        <p>&copy; 2024 User Management System</p>
    </footer>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
