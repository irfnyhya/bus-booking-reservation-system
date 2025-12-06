<%-- 
    Document   : DeleteAssignDriver
    Created on : 3 Jul 2024, 10:11:45 am
    Author     : irfan yahya
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Assignment</title>
</head>
<body>
<%
    String driverID = request.getParameter("driver");
    String busID = request.getParameter("bus");
    String assignDate = request.getParameter("assignDate");

    List<Map<String, String>> assignments = (List<Map<String, String>>) session.getAttribute("assignments");
    if (assignments != null) {
        Iterator<Map<String, String>> iterator = assignments.iterator();
        while (iterator.hasNext()) {
            Map<String, String> assignment = iterator.next();
            if (assignment.get("driver").equals(driverID) && assignment.get("bus").equals(busID) && assignment.get("assignDate").equals(assignDate)) {
                iterator.remove();
                break;
            }
        }
        session.setAttribute("assignments", assignments);
    }

    response.sendRedirect("DisplayReports.jsp");
%>
</body>
</html>
