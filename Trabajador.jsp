<%-- 
    Document   : Trabajador
    Created on : 31/01/2019, 04:32:52 PM
    Author     : RICHARDADM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
    <title>REGISTRO DE ASISTENCIA</title>
    <link rel="stylesheet" href="estilos.css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="fonts.css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">
    </head>
    <br>
    <form> 
    <img src="img/richard.jpg" style="padding-left: 990px" />   
     </form>
        <br>
        <br>
    <br>
    <body>
         <%
        //Conectando a la base de datos
            Connection con ;
            String url="jdbc:sqlserver://SERVIDOR-DELL:1433;databaseName=GRUPORICHARD";
            String Driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String user="ADM";
            String clave="ADM";
            Class.forName(Driver);
            con=DriverManager.getConnection(url,user,clave);
         
        PreparedStatement pstm;     
        Statement smt;
        ResultSet rs;          
        
        
        smt = con.createStatement();
        rs = smt.executeQuery("select * from Reg_Trabajador order by id_reg DESC");
        
        %>
         <div class="container buscar">            
            <a href="Registro.jsp"> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Regresar</button></a>
            <br>
            
           
            
        </div> 
      
        <br>
        <div class="container">
            <h1 style="font-size: 30px">Trabajadores</h1>
            <br>
        <table  class="table table-bordered"  id="tablaDatos">
                    <tr>
                                <th class="text-center">Nombres</th>
                                <th>Apellidos</th>
                                <th class="text-center">Edad</th>
                                <th class="text-center">DNI</th>
                                <th class="text-center">Celular</th>
                                <th class="text-center">Cargo</th>
                                <th class="text-center">Tipo de Contrato</th>                     
                                <th class="text-center">Hora de Ingreso</th>
                                <th class="text-center">Hora de Salida</th>
                                <th class="text-center">Empresa</th>
                              
                        </tr>
                <%
                while(rs.next()){
                %>
                <tr class="text-center">
                    <td class="text-center"><%= rs.getString("Nombres_trab")%></td>
                    <td class="text-center"><%= rs.getString("Apellidos_trab")%></td>
                    <td class="text-center"><%= rs.getString("Edad_trab")%></td>
                    <td class="text-center"><%= rs.getString("Dni_trab")%></td>
                    <td class="text-center"><%= rs.getString("Celular_trab")%></td>
                     <td class="text-center"><%= rs.getString("Cargo_emp")%></td>
                     <td class="text-center"><%= rs.getString("Tipo_contrato_emp")%></td>                   
                    <td class="text-center"><%= rs.getString("Hora_entrada_emp")%></td>
                    <td class="text-center"><%= rs.getString("Hora_salida_emp")%></td>
                    <td class="text-center"><%= rs.getString("Empresa")%></td>
                    
                    
                    
                </tr>
                
                <%}%>
                </table>
                     
                
                    
        </div>
                
                
                 
                
              
                <br>
                <br>
                <br>
                <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script> 
        
            <br>
            <br>
            <br>
            <br>
            
    </body>
</html>
