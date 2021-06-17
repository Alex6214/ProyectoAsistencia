<%-- 
    Document   : Tarjeta
    Created on : 09/02/2019, 10:07:30 AM
    Author     : Administrador
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="fonts.css" rel="stylesheet" type="text/css"/>
        <link href="estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">
        <title>Contado</title>
    </head>
    <br>
    <form> 
    <img src="img/richard.jpg" style="padding-left: 990px" />   
     </form>
        <br>
        <br>
    <br>
   <body style="margin-top: 30px">
       <form target=" black">
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
        rs = smt.executeQuery("select * from fa_cbfact where ccod_cia = 'RCR' and ccond_pago = '02' and cstatus = 'A' and ddoc_fch ='"+dato+"'");
        
        %>
        <div class="container buscar">            
           
            <br>
            
            
            <%
        
        String dat = request.getParameter("txtBuscar2");
        
            if(dat != null){
                smt = con.createStatement();
                rs = smt.executeQuery("select * from fa_cbfact where ccod_cia = 'RCR' and ccond_pago ='01' and ddoc_fch ='"+dato+"' and cstatus ='A' and cdoc_serie = '"+dat+"'  ");
                
            }
            
            
            %>  
        </div> 
      
        <br>
        <div class="container">
            <h1 style="font-size: 30px">Lista de Comprobantes pagado con Tarjeta</h1>
            <br>
        <table  class="table table-bordered"  id="tablaDatos">
                    <tr>
                            <th class="text-center">Comprobante</th>
                            <th>Serie</th>
                            <th class="text-center">Correlativo</th>
                            <th class="text-center">Codicion de Pago</th>
                            <th class="text-center">Cliente Doc</th>
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
        //Conectando a la base de datos
            
            
         
      
        ResultSet r;
        smt = con.createStatement();
        r = smt.executeQuery("select sum(nimp_t_mof) as Total from fa_cbfact where ccod_cia = 'RCR' and ccond_pago = '02' and cstatus = 'A' and ddoc_fch = '"+dato+"'");
        
       
        %>
        <form class="form">
            
            
                <%
                while(r.next()){
                %>
                
                <div style="padding-left: 1000px">
                    <table  class="table-condensed" id="tablaDatos">
                    <th><b>Total de Liquidacion credito de dia:</b></th>
             
                        <td><input style="font-size: 30px" class="form-control"  readonly="" name="txttotal" value="<%=r.getDouble("Total")%>"/></td>
                    </table>
                </div>
        </form>
        <%
            }
            %>  
            <br>
            <br>
            <br>
            <br>
       </form>
    </body>
</html>
