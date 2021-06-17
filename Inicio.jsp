<%-- 
    Document   : Inicio
    Created on : 16/01/2019, 10:44:35 AM
    Author     : RICHARDADM
--%><%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>



%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>CORPORACION RICHARD</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body style="margin-top: 30px">
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
        ResultSet r;
        smt = con.createStatement();
        r = smt.executeQuery("select sum(nimp_t_mof) as Total from fa_cbfact where ccod_cia = 'RCR' and ccond_pago between '02' and 'C90' and ddoc_fch = '2019-01-02'");
        
       
        %>
        <table  class="table table-bordered"  id="tablaDatos">
                    <tr>
                            <th class="text-center">Comprobante</th>
                            
                        </tr>
                <%
                while(r.next()){
                %>
                <tr class="text-center">
                    <td class="text-center"><%= r.getDouble("Total")%></td>
                    
                </tr>
        <%
        
        
            }
            
            
            %>  
        </table>
    </body>
</html>
