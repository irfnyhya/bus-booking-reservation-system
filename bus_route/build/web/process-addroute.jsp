<%-- 
    Document   : process-addroute
    Created on : 28 May 2024, 6:13:50 pm
    Author     : irfan yahya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Route</title>
    </head>
    <body>
        <%
            String myrouteid = request.getParameter("routeid");
            String myplatno = request.getParameter("platno");
            String myorigin = request.getParameter("origin");
            String mydestination = request.getParameter("destination");
            String mydeparture = request.getParameter("departuretime");
            String myarrival = request.getParameter("arrivaltime");
            double myprice = Double.parseDouble(request.getParameter("price"));
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mysql://localhost:3306/bus_route";
            Connection myconnection = DriverManager.getConnection(myUrl,"root","");
            
            String mySqlQuery = "insert into route " 
                                 + "(routeid,platno,origin,destination,departuretime,arrivaltime,price)"
                                 + "value (?,?,?,?,?,?,?)";
            PreparedStatement myPs = myconnection.prepareStatement(mySqlQuery);
            
            myPs.setString(1,myrouteid);
            myPs.setString(2,myplatno);
            myPs.setString(3,myorigin);
            myPs.setString(4,mydestination);
            myPs.setString(5,mydeparture);
            myPs.setString(6,myarrival);
            myPs.setDouble(7,myprice);
            
            if (!myPs.execute()){
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Success Add Record\")");
            out.println("</script>");
            
            RequestDispatcher rd = request.getRequestDispatcher("process-viewroute.jsp");
            rd.include(request, response);
            
            myconnection.close();
            }
            %>
    </body>
</html>