<%-- 
    Document   : Compro
    Created on : 23/01/2019, 03:02:31 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="fonts.css" rel="stylesheet" type="text/css"/>
        <link href="estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">
        <title>JSP Page</title>
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
            String url="jdbc:sqlserver://SERVIDOR-DELL:1433;databaseName=PRUEBAUSER";
            String Driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String user="ADM";
            String clave="ADM";
            Class.forName(Driver);
            con=DriverManager.getConnection(url,user,clave);
         
        PreparedStatement pstm;     
        Statement smt;
        ResultSet rs;          
        String dato = request.getParameter("Fecha");
        
        smt = con.createStatement();
        rs = smt.executeQuery("select * from COMPRO_CREDITO order by Fecha_compro DESC");
        
        %>
        <div class="container buscar">            
            <a href="ticket.jsp"> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Regresar</button></a>
            <br>
            
            <form class="form">
            <div style="padding-left: 800px">                  
                <input  class="form-control" type="text" name="txtBuscar2" placeholder="INGRESE COA"/>  
                <input style="text-align: center "  class="btn btn"  type="submit" value="Buscar"/>
            </div>
            </form>
            <%
        
        String dat = request.getParameter("txtBuscar2");
        
            if(dat != null){
                smt = con.createStatement();
                rs = smt.executeQuery("select * from COMPRO_CREDITO where Ruc_compro = '"+dat+"'  ");
                
            }
            
            
            %>  
        </div> 
      
        <br>
        <div class="container">
            <h1 style="font-size: 30px">Lista de Comprobantes</h1>
            <br>
        <table  class="table table-bordered"  id="tablaDatos">
                    <tr>
                            <th class="text-center">Ruc/DNI</th>
                            <th>Descripcion de COA</th>
                            
                            <th class="text-center">Fecha Emision</th>
                            <th class="text-center">Monto</th>
                            <th class="text-center">Referencia</th>
                            <th class="text-center">Nombre de Uusario</th>
                             <th class="text-center">Dni Usuario</th>
                              
                        </tr>
                <%
                while(rs.next()){
                %>
                <tr class="text-center">
                    <td class="text-center"><%= rs.getString("Ruc_compro")%></td>
                    <td class="text-center"><%= rs.getString("desc_compro")%></td>
                    <td class="text-center"><%= rs.getString("Fecha_compro")%></td>
                    <td class="text-center"><%= rs.getString("monto_compro")%></td>
                    <td class="text-center"><%= rs.getString("refe_compro")%></td>
                     <td class="text-center"><%= rs.getString("nombre_usu")%></td>
                    <td class="text-center"><%= rs.getDouble("dni_usu")%></td>
                    
                    
                    
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
