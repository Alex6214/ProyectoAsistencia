<%-- 
    Document   : SalRefri
    Created on : 12/02/2019, 11:25:20 AM
    Author     : Administrador
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
    <title>CORPORACION RICHARD</title>
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
        String dn = request.getParameter("txtBuscar3");
 
        smt = con.createStatement();
        rs = smt.executeQuery("select * from Reg_Trabajador where Dni_trab = '"+dn+"' ");
        
        %>
        <form>
        <div class="container buscar">            
            <a href="Acceso.html"> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Regresar</button></a>
            <br>
            
            <form class="form">
            <div style="padding-left: 800px">                  
                <input  class="form-control" type="text" name="txtBuscar3" placeholder="INGRESE Dni"/>  
                <input style="text-align: center "  class="btn btn"  type="submit" value="Buscar"/>
            </div>
            
           
            
        </div> 
      
        <br>
        <div class="container">
            <h1 style="font-size: 30px">Datos:</h1>
            <br>
         <table  class="table table-bordered"  id="tablaDatos">
                    <tr>
                                <th class="text-center">Nombres</th>
                                <th>Apellidos</th>
                                <th class="text-center">Edad</th>
                                <th class="text-center">DNI</th>
                                <th class="text-center">Celular</th>
                                <th class="text-center">Cargo</th>
                                <th class="text-center">Empresa</th>
                              
                        </tr>
                <%
                while(rs.next()){
                %>
                <tr class="text-center">
                    
               .   
                <input type="hidden" name="txtnom" class="form-control" value="<%= rs.getString("Nombres_trab")%>"/><br>
                   
                .   
                <input type="hidden" name="txtape" class="form-control" value="<%= rs.getString("Apellidos_trab")%>"/><br> 
                
               .
                <input type="hidden" name="txtdni"  class="form-control" value="<%= rs.getString("Dni_trab")%>"/><br>
                    
                .
                   
                    
                   
                    <td class="text-center"><%= rs.getString("Nombres_trab")%></td>
                    <td class="text-center"><%= rs.getString("Apellidos_trab")%></td>
                    <td class="text-center"><%= rs.getString("Edad_trab")%></td>
                    <td class="text-center"><%= rs.getString("Dni_trab")%></td>
                    <td class="text-center"><%= rs.getString("Celular_trab")%></td>
                    <td class="text-center"><%= rs.getString("Cargo_emp")%></td>
                    <td class="text-center"><%= rs.getString("Empresa")%></td>
                
                    
                </tr>
                
                <%}%>
                
                </table>
               <button type="submit" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Registrar Ingreso</button>
                    
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
            </form>
    </body>
</html>
<%
        
        
         String dni = request.getParameter("txtdni");
        String nom = request.getParameter("txtnom");
        String ape = request.getParameter("txtape");
        
        
            if(nom != null){
                pstm=con.prepareStatement("insert into TB_SalidaRefri (Dni_trab, Nombres, Apellidos)values('"+dni+"','"+nom+"','"+ape+"')");
               pstm.executeUpdate();
                response.sendRedirect("VistaSalRefri.jsp");
                
            }
            
            
            %>  
            
            
