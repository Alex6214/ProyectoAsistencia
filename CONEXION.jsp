<%-- 
    Document   : CONEXION
    Created on : 21/02/2019, 02:30:54 PM
    Author     : Administrador
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
        Connection con = null;
        try{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = (Connection)DriverManager.getConnection("jdbc:sqlserver://SERVIDOR-DELL:1433;databaseName=GRUPORICHARD","ADM","ADM");
        out.print("Conexion en Linea");
        }catch(Exception ex){
        out.print("Error: "+ex.getMessage());
        }
        %>
    </body>
</html>
