<%-- 
    Document   : VistaIngresos
    Created on : 11/02/2019, 02:24:43 PM
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
        <body>
          <div class="container buscar">  
            <form>
                <div style="padding-right:  50px"> 
                  
            <a href="Ingreso.jsp"> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Regresar</button></a>
                </div>
            </form>
              
            <br> 
            <form>
            <div style="padding-left: 800px">                  
                <input  class="form-control" type="date" name="txtBuscar4" placeholder="INGRESE FECHA 'AÑO/MES/DIA'" style="width: 200px"/>  
                <input style="text-align: center "  class="btn btn"  type="submit" value="Buscar"/>
            </div>  
             </form>
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
        rs = smt.executeQuery("SELECT top(30)* FROM TB_Ingreso order by Dia DESC ");
        
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
                rs = smt.executeQuery("select * from TB_Ingreso where Dia like  '%"+dato+"%'");
            }

            %>  
         <table  class="table table-bordered"  id="tablaDatos">
                    <tr>
                                <th class="text-center">DNI</th>
                                <th class="text-center">Nombres</th>
                                <th class="text-center">Apellidos</th>                               
                                <th class="text-center">Dia</th>
                                <th class="text-center">Ingreso Marcado</th>  
                                
                                <th class="text-center">Temperatura °C</th>  
                                
                        </tr>
                <%
                while(rs.next()){
                %>
                <tr class="text-center">                
                    <td class="text-center"><%= rs.getString("Dni_trab")%></td>
                    <td class="text-center"><%= rs.getString("Nombres")%></td>
                    <td class="text-center"><%= rs.getString("Apellidos")%></td>                   
                    <td class="text-center"><%= rs.getString("Dia")%></td>
                    <td class="text-center"><%= rs.getString("Hora_ingreso")%></td>
                    <td class="text-center"><%= rs.getString("Temperatura")%></td>
                                  
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

