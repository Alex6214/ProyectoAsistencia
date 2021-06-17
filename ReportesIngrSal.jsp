<%-- 
    Document   : RegistroAsistencia
    Created on : 05/02/2019, 01:43:17 PM
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
            <div style="padding-left: 50px">
            <a href="Acceso.html"> <button type="button" class="btn btn-success btn-lg"data-toggle="modal" data-target="#myModal">Regresar</button></a>
            </div>
            <center>
          <div class="container buscar">            
           
            <br> 
            <form name="form1" action="pdfAsisgrh.jsp" target="_black1" class="form" >
             <div>
                 <input type="date" name ="txtparametro1"  class="form-control" placeholder="Ingrese Fecha" style="width: 200px" />
                 <br>
            <input type="submit" value="REPORTE ASISTENCIA GRH" class="btn btn-success btn-lg"  style="width: 300px"/>
             </div>
         </form>
            <br>
            <br>
                    <form name="form2" action="pdfAsisrcr.jsp" target="_black" class="form" >
             <div>
                 <input type="DATE" name ="txtparametro"  class="form-control" placeholder="Ingrese Fecha" style="width: 200px" />
                 <br>
                 <input type="submit" value="REPORTE ASISTENCIA RCR" class="btn btn-success btn-lg" style="width: 300px" />
             </div>
         </form>
            
            <br>
            <br>
                    <form name="form3" action="pdfSalgrh.jsp" target="_black3" class="form" >
             <div>
                 <input type="date" name ="txtsalgrh"  class="form-control" placeholder="Ingrese Fecha" style="width: 200px" />
                 <br>
                 <input type="submit" value="REPORTE SALIDA GRH" class="btn btn-success btn-lg" style="width: 300px"/>
             </div>
         </form>
             <br>
            <br>
                    <form name="form4" action="pdfSalrcr.jsp" target="_black4" class="form" >
             <div>
                 <input type="date" name ="txtsalrcr"  class="form-control" placeholder="Ingrese Fecha" style="width: 200px" />
                 <br>
                 <input type="submit" value="REPORTE SALIDA RCR" class="btn btn-success btn-lg" style="width: 300px" />
             </div>
         </form>
            
            
            
            <br>
            <br>
            <br>
            
          </div>
   
        </center>
         
    </body>
</html>
