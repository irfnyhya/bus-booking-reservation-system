<%-- 
    Document   : process-deletebus
    Created on : 28 May 2024, 5:34:10 pm
    Author     : irfan yahya
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MAnage Bus</title>
    </head>
    <body>
        <%

            int busid = Integer.parseInt(request.getParameter("id"));
            Class.forName("com.mysql.jdbc.Driver");
            String myUrl = "jdbc:mysql://localhost:3306/bus_route";
            Connection myconnection = DriverManager.getConnection(myUrl, "root", "");

            String mySqlQuery = "delete from bus where id=?";
            PreparedStatement myPs = myconnection.prepareStatement(mySqlQuery);

            myPs.setInt(1, busid);

            if (myPs.executeUpdate() != 0) {

                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Delete Record\")");
                out.println("</script >");

                RequestDispatcher rd = request.getRequestDispatcher("process-viewbus.jsp");
                rd.include(request, response);
            }
        %>



    </body>
</html>
