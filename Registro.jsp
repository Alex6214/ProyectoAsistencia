<%-- 
    Document   : Registro
    Created on : 30/01/2019, 01:54:05 PM
    Author     : RICHARDADM
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <meta charset="utf-8">
    <title>REGISTRO DE TRABAJADOR</title>
    <link rel="stylesheet" href="estilos.css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="fonts.css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">
    </head>
    
      <br>
    <form> 
    <img src="img/richard.jpg" style="padding-left: 890px" />   
     </form>
        <br>
        <br>
    <br>
    <div class="container buscar" >  
         <a href="Trabajador.jsp"> <button  type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Registro</button></a>
        <form style="padding-left: 1000px" >
            <a href="index.html"> <button  type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Regresar</button></a>
        </form>
            <br>
    <body>
        <%
        Connection con;
            String url="jdbc:sqlserver://SERVIDOR-DELL:1433;databaseName=GRUPORICHARD";
            String Driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String user="ADM";
            String clave="ADM";
            Class.forName(Driver);
            con=DriverManager.getConnection(url,user,clave);
            PreparedStatement ps;
           
            String nom = request.getParameter("txtnom");
            String ape = request.getParameter("txtape");
            String fec_nac = request.getParameter("txtnac");
            String  edad =request.getParameter("txted");
            String pais = request.getParameter("txtpais");
            String dist = request.getParameter("txtdis");
            String prov = request.getParameter("txtprov");
            String dep = request.getParameter("txtdep");
            String dni = request.getParameter("txtdni");
            String cel = request.getParameter("txtcel");
            String ec = request.getParameter("cboec");
            String cargo_act = request.getParameter("txtcargoemp");
            String tipoc = request.getParameter("cbotipoc");
            String fec_inicio = request.getParameter("txtfechainicio");
            String fec_termino = request.getParameter("txtfechatermino");
            String hora_en = request.getParameter("txthoraen");
            String hora_sa = request.getParameter("txthorasa");
            String empresa = request.getParameter("cboEmpresa");
            
         
        %>
        <div class="container" style=" padding-left: 230px">
              <h1  style="padding-left: 200px "> Ficha Personal</h1>
            <hr>
            
            <form action="" method="post" class="form-control" style="width: 700px; height: 1580px ">
                <h1><b><u> 1.- DATOS PERSONALES</u></b></h1>
               
                Nombres Completos:
                <input type="text" name="txtnom" placeholder="Ingrese Nombres " class="form-control"/><br>
                Apellidos Completos:
                <input type="text" name="txtape" placeholder="Ingrese Apellidos " class="form-control" value=""/><br>
                Fecha Nacimiento:
                <input type="text" name="txtnac" placeholder="Fecha Nacimiento AAAA/MM/DD " class="form-control" value=""/><br>
                Edad:
                <input type="text" name="txted" placeholder="Ingrese su Edad " class="form-control" value=""/><br>
                Pais:
                <input type="text" name="txtpais" placeholder="Ingrese Pais " class="form-control" value=""/><br>
                Distrito:
                <input type="text" name="txtdis" placeholder="Ingrese Distrito " class="form-control" value=""/><br>
                Provincia:
                <input type="text" name="txtprov" placeholder="Ingrese Provincia " class="form-control" value=""/><br>
                Departamento:
                <input type="text" name="txtdep" placeholder="Ingrese Departamento" class="form-control" value=""/><br>
                DNI:
                <input type="text" name="txtdni" placeholder="Ingrese su DNI " class="form-control" value=""/><br>
                <br>
                Celular:
                <input type="text" name="txtcel" placeholder="Ingrese su Celular " class="form-control" value=""/><br>
                Estado Civil:
                <select name="cboec" class="form-control">
                    <option value="Soltero/a">Soltero/a</option>
                    <option value="Casado/a">Casado/a</option>
                    <option value="Conviviente">Conviviente</option>
                    <option value="Viudo/a">Viudo/a</option>
                </select>
                <br>
               
                <h1><b><u> 2.- INFORMACION DE INGRESO A LA EMPRESA  </u></b></h1>
                Cargo:
                <input type="text" name="txtcargoemp" class="form-control" value=""/><br>
                Tipo de Contrato:
                <select name="cbotipoc" class="form-control" >
                    <option value="Planilla" >Planilla</option>
                    <option value="Recibo" >Recibo por Honorario</option>
                </select>
                
                Fecha de inicio de contrato:
                <input type="text" name="txtfechainicio" class="form-control" value=""/><br>
                
                Fecha de termino de contrato:
                <input type="text" name="txtfechatermino" class="form-control" value=""/><br>
                Horario Establecido:
                <input type="text" name="txthoraen" Placeholder="Hora de Ingreso" class="form-control" value=""/><br>
                <input type="text" name="txthorasa" placeholder="Hora de salida" class="form-control" value=""/><br>
                
                
                
                
                <select name="cboEmpresa" class="form-control">
                    <option>Escoger Empresa</option>
                    
                    <%
                    try
                    {
                        String Query = "select * from ad_ctcia";
                      Statement sr=con.createStatement();
                      ResultSet rs=sr.executeQuery(Query);
                      while(rs.next()){
                      %>
                      <option value="<%=rs.getString("ccod_cia")%>"><%=rs.getString("cdsc_cia")%></option>
                      <% 
                      } 
                    }
                    catch(Exception e)
                            {
                                e.printStackTrace();
                                out.println("Error"+e.getMessage());
                            }
                    
                    %>
                </select>
                <br>
                <br>
                <br>
               <input type="submit" value="Guardar" class="btn btn-primary btn-lg" ondblclick="forma.submit()" style="width: 680px"/>
               <%
            
            
                if(dni != null ){
              
            ps=con.prepareStatement("insert into Reg_Trabajador (Nombres_trab,Apellidos_trab,Fecha_Nac_trab,Edad_trab,Pais,Distrito_trab,Provincia_trab,Departamento_trab,Dni_trab,Celular_trab,Estadoci_trab,Cargo_emp,Tipo_contrato_emp,Fecha_inicio_emp,Fecha_Termino_emp,Hora_entrada_emp,Hora_salida_emp,Empresa)values('"+nom+"','"+ape+"','"+fec_nac+"','"+edad+"','"+pais+"','"+dist+"','"+prov+"','"+dep+"','"+dni+"','"+cel+"','"+ec+"','"+cargo_act+"','"+tipoc+"','"+fec_inicio+"','"+fec_termino+"','"+hora_en+"','"+hora_sa+"','"+empresa+"')");
                ps.executeUpdate();
               response.sendRedirect("Trabajador.jsp");
            
                }
            
            
%>



            </form>
            <br>
            <br>
            <br>
            <br>
            
        </div>
    </body>
</html>

