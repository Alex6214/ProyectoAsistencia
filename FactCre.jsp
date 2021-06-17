<%-- 
    Document   : index
    Created on : 16/01/2019, 08:58:13 AM
    Author     : RICHARDADM
--%>

<%@page import="java.text.DateFormat.Field"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="estilos.css" rel="stylesheet" type="text/css"/>
        <link href="fonts.css" rel="stylesheet" type="text/css"/>
        <title>Credito</title>
    </head>
   <br>
    <form> 
    <img src="img/richard.jpg" style="padding-left: 990px" />   
     </form>
        <br>
        <br>
    <br>
    <body style="margin-top: 30px">
        
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
        String dato = request.getParameter("Fecha");
        
        smt = con.createStatement();
        rs = smt.executeQuery("select * from fa_cbfact where ccod_cia = 'RCR' and ccond_pago between '03' and 'C90'and cstatus = 'A' and ddoc_fch ='"+dato+"'");
        
        %>
       <form target=" black">
        <div class="container buscar">            
            
            <br>
            
            
           <%
        String dat = request.getParameter("txtBuscar2");
         
            if(dat != null){
                smt = con.createStatement();
                rs = smt.executeQuery("select * from fa_cbfact where ccod_cia='RCR' and cstatus = 'A' and cdoc_serie ='"+dat+"' and ddoc_fch = '"+dato+"'");
            }
            
            
            %> 
        </div> 
      
        <br>
        <div class="container">
            <h1 style="font-size: 30px">Lista de Comprobantes</h1>
            <br>
        <table  class="table table-bordered"  id="tablaDatos">
                    <tr>
                            <th class="text-center">Comprobante</th>
                            <th>Serie</th>
                            <th class="text-center">Correlativo</th>
                            <th class="text-center">Codicion de Pago</th>
                            <th class="text-center">Cliente</th>
                            <th class="text-center">Cliente Descripcion</th>
                             <th class="text-center">Total de comprobante</th>
                              <th class="text-center">Fecha de Emision</th>
                        </tr>
                <%
                while(rs.next()){
                %>
                <tr class="text-center">
                    <td class="text-center"><%= rs.getString("cdoc")%></td>
                    <td class="text-center"><%= rs.getString("cdoc_serie")%></td>
                    <td class="text-center"><%= rs.getString("cdoc_nro")%></td>
                    <td class="text-center"><%= rs.getString("ccond_pago")%></td>
                     <td class="text-center"><%= rs.getString("ccod_coa")%></td>
                     <td class="text-center"><%= rs.getString("ccoa_dsc")%></td>
                    <td class="text-center"><%= rs.getDouble("nimp_t_mof")%></td>
                    <td class="text-center"><%= rs.getString("ddoc_fch")%></td>  
                </tr>  
                <%}%>
                </table>          
        </div>
                <br>
                <br>
                <br>
                <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script> 
         <%
        ResultSet r;
        smt = con.createStatement();
        r = smt.executeQuery("select sum(nimp_t_mof) as Total from fa_cbfact where ccod_cia = 'RCR' and ccond_pago between '03' and 'C90'  and cstatus = 'A' and ddoc_fch = '"+dato+"'");
        %>
        <form class="form">
                <%
                while(r.next()){
                %>               
                <div style="padding-left: 1000px">
                    <table  class="table-condensed" id="tablaDatos">
                    <th><b>Total de Liquidacion credito de dia:</b></th>            
                        <td><input style="font-size: 30px" readonly="" class="form-control" name="txttotal" value="<%=r.getDouble("Total")%>"/></td>
                    </table>
                </div>
        </form>
        <%}%>  
            <br>
            <br>
            <br>
            <br> 
             
            
        
    </body>
</html>

        


