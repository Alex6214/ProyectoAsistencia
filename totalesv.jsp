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
       String dato2 = request.getParameter("txtBuscar3");
       
        
            
        %>
        
        <div class="container buscar">  
            <form >
            <a href="index.html"> <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Regresar</button></a>
            
            <div style="padding-left: 800px">   
                <B>Periodo:</B>
                <input  class="form-control" type="date" name="txtBuscar1" /> 
                <input  class="form-control" type="date" name="txtBuscar3" />
                <br>
                 <B>Descripcion de Articulo:</B>
                <input  class="form-control" type="text" name="txtBuscar" placeholder="Descripcion"/> 
                <br>
                <button ><input style="text-align: center "  class="btn btn"  type="submit" value="Buscar"/></button>
            </div>
            </form>
            
            <br>
            <br>
            <br>
            <table   class="table table-bordered" >
            <tr>   
                <%
      
            if(dato != null){
                smt = con.createStatement();
                s = smt.executeQuery("SELECT  dbo.fa_lnfact.ccod_cia as Empresa,"
+"dbo.fa_lnfact.ccod_per as Periodo, "
+" dbo.fa_lnfact.cdoc as Tipo_de_Documento,dbo.fa_lnfact.cdoc_nro as Numero_de_Documento,dbo.fa_lnfact.ddoc_fch as Fecha_de_Emision,"
+" dbo.fa_lnfact.ccod_mon as Condicion_de_moneda , dbo.fa_lnfact.ccod_alm  as Almacen, dbo.fa_lnfact.ccod_art as Codigo_de_articulo,"
+" dbo.fa_lnfact.cdsc_art as Descripcion_de_Articulo, dbo.fa_lnfact.nund as Unidades_Vendidas, dbo.fa_lnfact.nimp_u_mof as Precio_unitario_soles, "
+" dbo.fa_lnfact.nimp_u_con as Precio_unitario_dolar, dbo.fa_lnfact.nt_cambio as Tipo_de_Cambio,dbo.fa_lnfact.nimp_n_mof as Neto_Soles,"
+" dbo.fa_lnfact.nimp_n_con as Neto_Dolar, dbo.fa_lnfact.nimp_i_mof as IGV_soles, dbo.fa_lnfact.nimp_i_con as IGV_Dolar, "
+"dbo.fa_lnfact.nimp_t_mof as Total_Soles, dbo.fa_lnfact.nimp_t_con as Total_Dolar, dbo.fa_lnfact.ccod_coa as Cliente, dbo.fa_cbfact.ccoa_dsc as Descripcion_Cliente,"
+"dbo.fa_lnfact.ccod_lin as Linea FROM  dbo.fa_cbfact INNER JOIN dbo.fa_lnfact ON dbo.fa_cbfact.cdoc_nro = dbo.fa_lnfact.cdoc_nro AND dbo.fa_cbfact.cdoc_serie = dbo.fa_lnfact.cdoc_serie AND dbo.fa_cbfact.cdoc = dbo.fa_lnfact.cdoc AND "
+"  dbo.fa_cbfact.ccod_cia = dbo.fa_lnfact.ccod_cia WHERE        (dbo.fa_lnfact.ccod_cia = 'RCR'OR dbo.fa_lnfact.ccod_cia = 'LUP' OR dbo.fa_lnfact.ccod_cia = 'GRH') AND (dbo.fa_lnfact.ddoc_fch between '"+dato1+"' and  '"+dato2+"' ) AND (dbo.fa_lnfact.cdsc_art like '%"+dato+"%')  and (dbo.fa_lnfact.cstatus = 'A')order by Periodo ASC ");
            

            %>  
            <td><table  class="table table-bordered" >
                      <tr style="background-color: #afd9ee">
                          <th class="text-center">Empresa</th>
                            <th class="text-center">Periodo</th>
                            <th class="text-center">Dia</th>
                            <th class="text-center">Tipo de Documento</th>
                            <th class="text-center">Numero de Documento</th>
                            <th class="text-center">Codigo de Articulo</th>
                            <th class="text-center">Descripcion de Articulo</th>
                            <th class="text-center">Unidades Vendidas</th>
                            <th class="text-center">Precio Unitario con IGV</th>
                            <th class="text-center">Precio Neto</th>
                            <th class="text-center">Total Venta</th>
                            <th class="text-center">Descripcion Cliente</th>
                            <th class="text-center">Familia</th>
                           
                        </tr>
        <%
           
                while(s.next()){
                %>
                      <tr class="text-center">
                          <td class="text-center" ><%= s.getString("Empresa")%></td>
                    <td class="text-center" ><%= s.getString("Periodo")%></td>
                    <td class="text-center"><%= s.getString("Fecha_de_Emision")%></td>
                     <td class="text-center"><%= s.getString("Tipo_de_Documento")%></td>
                     <td class="text-center"><%= s.getString("Numero_de_Documento")%></td>
                    <td class="text-center"><%= s.getString("Codigo_de_articulo")%></td>
                    <td class="text-center"><%= s.getString("Descripcion_de_Articulo")%></td>
                   <td class="text-center"><%= s.getInt("Unidades_Vendidas")%></td>
                     <td class="text-center" ><fmt:formatNumber pattern="S/ #,##0.00" value="<%= s.getString("Precio_unitario_soles")%>"></fmt:formatNumber></td>
                      <td class="text-center"><fmt:formatNumber pattern="S/ #,##0.00" value="<%= s.getString("Neto_Soles")%>"></fmt:formatNumber></td>
                       <td class="text-center">  <fmt:formatNumber pattern="S/ #,##0.00" value="<%= s.getString("Total_Soles")%>"></fmt:formatNumber></td>
                       <td class="text-center" ><%= s.getString("Descripcion_Cliente")%></td>
                         <td class="text-center"><%= s.getString("Linea")%></td>
                     
                    
                </tr>
                
                <%}%>
        </table></td>
        <%
       
        ResultSet x;
        smt = con.createStatement();
        x = smt.executeQuery("SELECT  sum(nimp_t_mof) as Total from fa_lnfact where ccod_cia = 'RCR' and ddoc_fch between  '"+dato1+"' and  '"+dato2+"' and cdsc_art like '%"+dato+"%' and cstatus = 'A' ");
        %>
       
            <div style="padding-left: 500px">
            <table style="padding-left: 200px">   
                <form class="form" style="padding-left: 200px">
                <%
                while(x.next()){
                %>               
                <div style="padding-left: 900px">
                    <table  class="table-condensed" id="tablaDatos">
                        
                    <th style="font-size: 20px"><b>Total de Facturacion:</b></th>            
                        <td><input style="font-size: 30px; width: 210px" readonly="" class="form-control" name="txttotal2"  value="<fmt:formatNumber pattern="S/ #,##0.00" value="<%=x.getDouble("Total")%>"></fmt:formatNumber>"/></td>
                    </table>
                </div>
        </form>
                    <br>
                    
        <%}%>  
        
            </table>
            </div>
            <br>
            <br>
   
        </form>
         <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <%}
            
    }catch(Exception e){
        out.print("Error: " + e.getMessage());
    }
    
    
    
    
    %>
    </body>
</html>
