<%-- 
    Document   : process-updateroute2
    Created on : 28 May 2024, 6:16:25 pm
    Author     : irfan yahya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>

        <%

            String routeid1 = request.getParameter("hidid");
            String myplatno = request.getParameter("platno");
            String myorigin = request.getParameter("origin");
            String mydestination = request.getParameter("destination");
            String mydeparture = request.getParameter("departuretime");
            String myarrival = request.getParameter("arrivaltime");
            double myprice = Double.parseDouble(request.getParameter("price"));

            Class.forName("com.mysql.jdbc.Driver");

            String myUrl = "jdbc:mysql://localhost:3306/bus_route";
            Connection myconnection = DriverManager.getConnection(myUrl, "root", "");

            String mySqlQuery = "update route "
                    + " set platno=? ,origin=? , destination=? , departuretime=?, arrivaltime=?, price=?"
                    + " where routeid=? ";
            PreparedStatement myPs = myconnection.prepareStatement(mySqlQuery);

            myPs.setString(1,myplatno);
            myPs.setString(2,myorigin);
            myPs.setString(3,mydestination);
            myPs.setString(4,mydeparture);
            myPs.setString(5,myarrival);
            myPs.setDouble(6,myprice);
            myPs.setString(7,routeid1);

            if (myPs.executeUpdate() != 0) {

                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Update Record\")");
                out.println("</script >");

                RequestDispatcher rd = request.getRequestDispatcher("process-viewroute.jsp");
                rd.include(request, response);
            } else {
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Failed Update Record\")");
                out.println("</script >");
            }
            myconnection.close();
        %>
    </body>
</html>

