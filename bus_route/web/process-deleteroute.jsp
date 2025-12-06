<%-- 
    Document   : process-deleteroute
    Created on : 28 May 2024, 6:17:00 pm
    Author     : irfan yahya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Manage Route</title>
    </head>
    <body>
        <%

            String routeid1 = request.getParameter("routeid");
            Class.forName("com.mysql.jdbc.Driver");
            String myUrl = "jdbc:mysql://localhost:3306/bus_route";
            Connection myconnection = DriverManager.getConnection(myUrl, "root", "");

            String mySqlQuery = "delete from route where routeid=?";
            PreparedStatement myPs = myconnection.prepareStatement(mySqlQuery);

            myPs.setString(1, routeid1);

            if (myPs.executeUpdate() != 0) {

                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Delete Record\")");
                out.println("</script >");

                RequestDispatcher rd = request.getRequestDispatcher("process-viewroute.jsp");
                rd.include(request, response);
            } else {
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Failed Delete Record\")");
                out.println("</script >");
            }
        %>



    </body>
</html>
