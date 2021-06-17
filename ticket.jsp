<%-- 
    Document   : ticket
    Created on : 17/01/2019, 10:07:27 AM
    Author     : RICHARDADM
--%>

<%@page import="javax.swing.JOptionPane"%>
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
        <link href="fonts.css" rel="stylesheet" type="text/css"/>
        <link href="estilos.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">
        <title>Ticket</title>
    </head>
    <br>
    <header>
        <h1 class="title">CORPORACION RICHARD</h1>
        <a href=""></a>
      </header>
    <br>
    <br>
    <div class="container buscar" >  
         <a href="Compro.jsp"> <button  type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Comprobantes</button></a>
        <form style="padding-left: 1000px" >
            <a href="index.html"> <button  type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Regresar</button></a>
        </form>
         
         <form name="form1" action="pdf.jsp" target="_black">
             <div>
                 <input type="text" name ="txtparametro"  class="form-control-static" style="padding-right: 200px" />
            <input type="submit" value="Generar PDF RCR" class="btn btn-success btn-lg" />
             </div>
         </form>
            <br>
    <body style="background-color: #d9edf7">
        <%
        Connection con;
            String url="jdbc:sqlserver://SERVIDOR-DELL:1433;databaseName=PRUEBAUSER";
            String Driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String user="ADM";
            String clave="ADM";
            Class.forName(Driver);
            con=DriverManager.getConnection(url,user,clave);
            PreparedStatement ps;
            Statement sr;
            ResultSet rs;
            String ruc,razon,monto,referencia,nombre,dni,fecha;
            
          ruc = request.getParameter("txtruc");
            razon = request.getParameter("txtrazon");
            monto = request.getParameter("txtmonto");
            referencia = request.getParameter("txtrefe");
            nombre = request.getParameter("txtNom");
            dni = request.getParameter("txtdni");
            fecha = request.getParameter("txtfechaticket");
        %>
        <div class="container" style=" padding-left: 350px">
              <h1  style="padding-left: 50px "> COMPROBANTE</h1>
            <hr>
            
            <form action="" method="post" class="form-control" style="width: 500px; height: 680px">
                <h1><b><u>CLIENTE</u></b></h1>
               
                RUC/DNI:
                <input type="text" name="txtruc" placeholder="Ingrese RUC o DNI "class="form-control"/><br>
                Razon Social:
                <input type="text" name="txtrazon" class="form-control" value=""/><br>
                
                Fecha:
                <input type="text" name="txtfechaticket" class="form-control"/>
                Monto:
                <input type="text" name="txtmonto" class="form-control"/><br>
                Referencia:
                <input type="text" name="txtrefe" class="form-control"/><br>
                <textarea name="" class="form-control" maxlength="200px"> </textarea>
                <h1><b><u>USUARIO</u></b></h1>
                Nombres:
                <input type="text" name="txtNom" class="form-control"/><br>
                DNI:
                <input type="text" name="txtdni" class="form-control"/>
                <br>
                
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
               
            </form>
            <br>
            <br>
        </div>
        
      
    </body>
    
</html>
 <%
            if(ruc == null){
               con.close();
            }else{
            ps=con.prepareStatement("insert into COMPRO_CREDITO (Ruc_compro, desc_compro, Fecha_compro, monto_compro, refe_compro, nombre_usu, dni_usu)values('"+ruc+"','"+razon+"','"+fecha+"','"+monto+"','"+referencia+"','"+nombre+"','"+dni+"')");
                ps.executeUpdate();
               response.sendRedirect("Compro.jsp");
            
            }
            
%>