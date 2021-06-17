<%-- 
    Document   : totales
    Created on : 18/01/2019, 10:15:39 AM
    Author     : RICHARDADM
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Comprobantes</title>
    </head>
    
    <br>
    <form> 
    <img src="img/richard.jpg" style="padding-left: 990px" />   
     </form>
        <br>
        <br>
    <body style="margin-top: 30px">
   
        <form  >
        <%
        //Conectando a la base de datos
            Connection con ;
            try{
            String url="jdbc:sqlserver://SERVIDOR-DELL:1433;databaseName=GRUPORICHARD";
            String Driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String user="ADM";
            String clave="ADM";
            Class.forName(Driver);
            con=DriverManager.getConnection(url,user,clave);
         
        PreparedStatement pstm;
        Statement smt;
        
         ResultSet s;
         String dato = request.getParameter("txtBuscar");
         String dato1 = request.getParameter("txtBuscar1");
       
        
            
        %>
        
        <div class="container buscar">  
            <form >
            <a href="index.html"> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Regresar</button></a>
            
            <div style="padding-left: 800px">   
                <B>INGRESE EL RANGO DE FECHA QUE DESEA BUSCAR:</B>
                <input  class="form-control" type="text" name="txtBuscar" placeholder="DE:" style="width: 200px"/>  
                <br>
                <input  class="form-control" type="text" name="txtBuscar1" placeholder="HASTA:" style="width: 200px"/> 
                <br>
                <button ><input style="text-align: center "  class="btn btn"  type="submit" value="Buscar"/></button>
            </div>
            </form>
            
            <%
      
            if(dato != null){
                smt = con.createStatement();
                s = smt.executeQuery("select ddoc_fch as Fecha, sum(nimp_t_mof)  as Total from fa_cbfact where ccod_cia='RCR' and cstatus = 'A'  and ddoc_fch BETWEEN '"+dato+"' AND '"+dato1+"'group by ddoc_fch");
            

            %>  
            
        </div > 
        
        
        <br>
        
        <div class="container">
            <b><h1 style="font-size: 30px">Total facturado por dia </h1></b>
            <br>
        <table  class="table table-bordered"  id="tablaDatos">
                    <tr>
                            <th class="text-center">Liquidacion del dia:</th>
                            <th class="text-center">Total del dia</th>
                            
                        </tr>
                <%
           
                while(s.next()){
                %>
                
                <tr class="text-center">
                    <td class="text-center"><%= s.getString("Fecha")%></td>
                    
                    <td class="text-center"><fmt:formatNumber pattern="S/ #,##0.00" value="<%= s.getString("Total")%>"></fmt:formatNumber></td>
                    
                    
                    <td class="text-center">
                        <a  href="FactCre.jsp?Fecha=<%=s.getString("Fecha")%>" class="btn btn-primary">Credito</a>
                        <a  href="FactCon.jsp?Fecha=<%=s.getString("Fecha")%>" class="btn btn-primary" style="background-color: green">Contado</a>
                        <a  href="Tarjeta.jsp?Fecha=<%=s.getString("Fecha")%>" class="btn btn-primary" style="background-color: green">Tarjeta</a>
                        <a  href="Detalle.jsp?Fecha=<%=s.getString("Fecha")%>" class="btn btn-primary" style="background: red">Todos</a>
                    </td>
                </tr>
                
                <%}%>
                </table>
        </div>
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
      
        <%
       
        ResultSet x;
        smt = con.createStatement();
        x = smt.executeQuery("select sum(nimp_t_mof) as TotalCre from fa_cbfact where ccod_cia = 'RCR' and ccond_pago between '03' and 'C90'  and cstatus = 'A' and ddoc_fch between '"+dato+"' and '"+dato1+"'");
        
        %>
        <form class="form">
                <%
                while(x.next()){
                %>               
                <div style="padding-left: 900px">
                    <table  class="table-condensed" id="tablaDatos">
                        
                    <th style="font-size: 20px"><b>Total de Facturacion al Credito:</b></th>            
                        <td><input style="font-size: 30px; width: 210px" readonly="" class="form-control" name="txttotal2"  value="<fmt:formatNumber pattern="S/ #,##0.00" value="<%=x.getDouble("TotalCre")%>"></fmt:formatNumber>"/></td>
                    </table>
                </div>
        </form>
                    <br>
                    
        <%}%>  
        <%
       
        ResultSet a;
        smt = con.createStatement();
        a = smt.executeQuery("select  sum(nimp_t_mof) as Totalcon from fa_cbfact where ccond_pago = '01' and ddoc_fch between '"+dato+"' and '"+dato1+"' and cstatus = 'A'");
        
        %>
        <form class="form">
                <%
                while(a.next()){
                %>               
                <div style="padding-left: 900px">
                    <table  class="table-condensed" id="tablaDatos">
                        
                    <th style="font-size: 20px"><b>Total de Facturacion al Contado:</b></th>            
                        <td><input style="font-size: 30px; width: 210px" readonly="" class="form-control" name="txttotal2" value="<fmt:formatNumber pattern="S/ #,##0.00" value="<%=a.getDouble("Totalcon")%>"></fmt:formatNumber>" style="width: 200px"/></td>
                    </table>
                </div>
        </form>
        <%}%>  
        
        <br>
       
        <%
       
        ResultSet e;
        smt = con.createStatement();
        e = smt.executeQuery("select  sum(nimp_t_mof) as TotalTar from fa_cbfact where ccond_pago = '02' and ddoc_fch between '"+dato+"' and '"+dato1+"' and cstatus = 'A'");
        
        %>
        <form class="form">
                <%
                while(e.next()){
                %>               
                <div style="padding-left: 900px">
                    <table  class="table-condensed" id="tablaDatos">
                        
                    <th style="font-size: 20px"><b>Total de Facturacion con Tarjeta:</b></th>            
                        <td><input style="font-size: 30px; width: 210px" readonly="" class="form-control" name="txttotal2" value="<fmt:formatNumber pattern="S/ #,##0.00" value="<%=e.getDouble("TotalTar")%>"></fmt:formatNumber>" style="width: 200px"/></td>
                    </table>
                </div>
        </form>
        <%}%>  
        <%
       
        ResultSet p;
        smt = con.createStatement();
        p = smt.executeQuery("select sum(nimp_t_mof) as Totaltod from fa_cbfact where ccod_cia = 'RCR'   and cstatus = 'A' and ddoc_fch between '"+dato+"' and '"+dato1+"'");
        
        %>
        <br>
        <form class="form">
                <%
                while(p.next()){
                %>               
                <div style="padding-left: 900px">
                    <table  class="table-condensed" id="tablaDatos">
                        
                    <th style="font-size: 20px"><b>Total de Facturacion de Rango:</b></th>            
                        <td><input style="font-size: 30px; width: 210px" readonly="" class="form-control" name="txttotal2" value="<fmt:formatNumber pattern="S/ #,##0.00" value="<%=p.getDouble("TotalTod")%>"></fmt:formatNumber>" style="width: 200px"/></td>
                    </table>
                </div>
        </form>
                    <br>
                    
        <%}%>  
        
         
            <br>
            <br>
   
        </form>
    <%}
    
    }catch(Exception e){
        out.print("Error: " + e.getMessage());
    }
    
    
    
    
    %>
    </body>
</html>
