<%-- 
    Document   : process-addbus
    Created on : 28 May 2024, 11:07:50 am
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
            String myplatno = request.getParameter("platno");
            String mytype = request.getParameter("type");
            String mycapacity1 = request.getParameter("capacity");
            String mystatus = request.getParameter("status");
            
            int mycapacity = Integer.parseInt(mycapacity1);
            
            Class.forName("com.mysql.jdbc.Driver");
            
            String myUrl = "jdbc:mysql://localhost:3306/bus_route";
            Connection myconnection = DriverManager.getConnection(myUrl,"root","");
            
            String mySqlQuery = "insert into bus " 
                                 + "(platno,type,capacity,status)"
                                 + "value (?,?,?,?)";
            PreparedStatement myPs = myconnection.prepareStatement(mySqlQuery);
            
            myPs.setString(1,myplatno);
            myPs.setString(2,mytype);
            myPs.setInt(3,mycapacity);
            myPs.setString(4,mystatus);
            
            if (!myPs.execute()){
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Success Add Record\")");
            out.println("</script>");
            
//            RequestDispatcher rd = request.getRequestDispatcher("process-viewbus.jsp");
//            rd.include(request, response);
            }
            myconnection.close();
            
            %>
            <p><%=mystatus%></p>
    </body>
</html>

























































