<%-- 
    Document   : process-updatebus2
    Created on : 28 May 2024, 2:09:22 pm
    Author     : irfan yahya
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Bus</title>
    </head>
    <body>

        <%

            int busid = Integer.parseInt(request.getParameter("hidid"));
            String myplatno = request.getParameter("platno");
            String mytype = request.getParameter("type");
            int mycapacity = Integer.parseInt(request.getParameter("capacity"));
            String mystatus = request.getParameter("status");

            Class.forName("com.mysql.jdbc.Driver");

            String myUrl = "jdbc:mysql://localhost:3306/bus_route";
            Connection myconnection = DriverManager.getConnection(myUrl, "root", "");

            String mySqlQuery = "update bus "
                    + "set platno=?, type=? , capacity=? , status=?"
                    + " where id=? ";
            PreparedStatement myPs = myconnection.prepareStatement(mySqlQuery);

            myPs.setString(1, myplatno);
            myPs.setString(2, mytype);
            myPs.setInt(3, mycapacity);
            myPs.setString(4, mystatus);
            myPs.setInt(5, busid);

            if (myPs.executeUpdate() != 0) {

                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Update Record\")");
                out.println("</script >");

                RequestDispatcher rd = request.getRequestDispatcher("process-viewbus.jsp");
                rd.include(request, response);
            }
            myconnection.close();
        %>
    </body>
</html>
