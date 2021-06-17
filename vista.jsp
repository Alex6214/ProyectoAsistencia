<%-- 
    Document   : vista
    Created on : 10/02/2019, 03:05:58 PM
    Author     : Administrador
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="net.sf.jasperreports.engine.JRRuntimeException"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
   <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
       
        <div>Generar reportes de los productos</div>
    <center>
        
        <form name="form1" action="pdfAsisgrh.jsp" target="_black">
             <div>
                 <input type="text" name ="txtparametro1"  class="form-control-static" style="padding-right: 200px" />
            <input type="submit" value="Generar PDF GRH" class="btn btn-success btn-lg" />
             </div>
         </form>
        <form name="form1" action="pdfAsisrcr.jsp" target="_black">
             <div>
                 <input type="text" name ="txtparametro"  class="form-control-static" style="padding-right: 200px" />
            <input type="submit" value="Generar PDF RCR" class="btn btn-success btn-lg" />
             </div>
         </form>
       
        
    </center>
   
    </body>
</html>
