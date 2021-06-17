<%-- 
    Document   : VistaSalRefri
    Created on : 12/02/2019, 11:26:44 AM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="estilos.css" rel="stylesheet" type="text/css"/>
        <link href="fonts.css" rel="stylesheet" type="text/css"/>
        <title>Asistencia</title>
    </head>
    <br>
    <form> 
    <img src="img/richard.jpg" style="padding-left: 990px" />   
     </form>
        <br>
        <br>
        <body >
          <div class="container buscar">            
            <a href="Acceso.html"> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Regresar</button></a>
            <br> 
            <form class="form">
            <div style="padding-left: 800px">                  
                <input  class="form-control" type="text" name="txtBuscar4" placeholder="INGRESE NOMBRE"/>  
                <input style="text-align: center "  class="btn btn"  type="submit" value="Buscar"/>
            </div>            
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
        rs = smt.executeQuery("SELECT * FROM TB_SalidaRefri ");
        
        %>           
        </div>       
        <br>
        <div class="container">
            <h1 style="font-size: 30px">Lista de Asistencia</h1>
            <br>
            <%
        String dato = request.getParameter("txtBuscar4");
         
            if(dato != null){
                smt = con.createStatement();
                rs = smt.executeQuery("select * from TB_SalidaRefri where Nombres like  '%"+dato+"%'");
            }

            %>  
         <table  class="table table-bordered"  id="tablaDatos">
                    <tr>
                                <th class="text-center">DNI</th>
                                <th class="text-center">Nombres</th>
                                <th class="text-center">Apellidos</th>                                
                                <th class="text-center">Dia</th>
                                <th class="text-center">Termino de Refrigerio</th>  
                                
                        </tr>
                <%
                while(rs.next()){
                %>
                <tr class="text-center">                
                    <td class="text-center"><%= rs.getString("Dni_trab")%></td>
                    <td class="text-center"><%= rs.getString("Nombres")%></td>
                    <td class="text-center"><%= rs.getString("Apellidos")%></td>
                    <td class="text-center"><%= rs.getString("Dia")%></td>
                    <td class="text-center"><%= rs.getString("Hora_Termino_Refri")%></td> 
                    
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


