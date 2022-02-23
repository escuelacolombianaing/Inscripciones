<%-- 
    Document   : correos
    Created on : 14/01/2016, 02:14:30 PM
    Author     : Lucero
--%>
 
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% String docEst = request.getParameter("docEst");
    configeci.configuracion confEci = new configeci.configuracion();
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
   // Vector citacion = bd.Examen(docEst);
    String carnet = new String();
    //Vector examenC = bd.ExamenConoc(docEst, confEci.getPeriodo(), oout);%>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Citación Examen de Conocimiento</title>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

        <link href="css/estilo-resultadoconocimiento.css" rel="stylesheet" type="text/css" media="all">
    </head>

    <body>
    <head>  <div id="container">
        <header>
            <div class="logoescuela">
                <img src="img/logo-ESCUELA.svg"/>
            </div>
            <img src="img/banner.jpg" />
            <div class="osiris">Desarrollado por: Direcci&oacute;n de Tecnolog&iacute;a Osiris y Direcci&oacute;n de Comunicaciones y Mercadeo</div>
            <link href="css/comun.css" rel="stylesheet" type="text/css">
        </header>


<%Vector estud = bd.infoCorreo(docEst);
if((estud.size()) == 0){%>
  	
	<p align="center"><h3><center>
	    <font color="#666666" size="3" face="Verdana, Arial, Helvetica, sans-serif">Su numero de carnet o documento es incorrecto, o no existe información</font><br>
  </center></h3>
<%}else{%>

<% for ( int j = 0 ; j < estud.size() ; j++ ){
		Vector estudiante = (Vector)estud.elementAt(j) ;
%>
<center>

  <p><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif">CORREO ESTUDIANTES</font></b><br>
  </p>
  <table width="450" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      
    <td width="20%"> 
      <div align="left"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Carnet: 
        &nbsp;&nbsp;&nbsp;&nbsp;</font></b></div>
    </td>
      <td width="80%"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(0)%></font></b></td>
    </tr>
    <tr> 
      
    <td width="20%"> 
      <div align="left"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Doc: 
        &nbsp;&nbsp;&nbsp;&nbsp;</font></b></div>
    </td>
      <td width="80%"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(1)%></font></b></td>
    </tr>
    <tr> 
      
    <td width="20%"> 
      <div align="left"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Nombre: 
        &nbsp;&nbsp;&nbsp;&nbsp;</font></b></div>
    </td>
      <td width="80%"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(2)%></font></b></td>
    </tr>
    <tr> 
      
    <td width="20%"> 
      <div align="left"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
        Correo: &nbsp;&nbsp;</font></b></div>
    </td>
      <td width="80%"><a href="mailto:<%=estudiante.elementAt(3)%>@mail.escuelaing.edu.co"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(3)%>@mail.escuelaing.edu.co</font></b></a> 
        &nbsp;&nbsp; </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <div align="left">
          <p>&nbsp;</p>
          <p><font size="3"><b><font color="#336699" face="Verdana, Arial, Helvetica, sans-serif"><blink><font color="#800000">Estimado 
            estudiante</font></blink></font></b> </font></p>
        </div>
        <p align="left"><font color="#800000" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Le 
          informamos  A LOS ESTUDIANTES NUEVOS que a partir del periodo acad&eacute;mico 2013-2, su contrase&ntilde;a
          de correo electr&oacute;nico ser&aacute; el n&uacute;mero de su documento 
          de identificaci&oacute;n, sin embargo si este tiene 7 o menos d&iacute;gitos, 
          su contrase&ntilde;a ser&aacute; el n&uacute;mero de su documento de 
          identificaci&oacute;n seguido por su primer nombre en min&uacute;sculas 
          ejm. 1234567julio.</b></font></p>
        <p align="left"><font color="#800000"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Cualquier 
          duda o inconveniente por favor acercarse a OSIRIS.</font></b></font><br>
        </p>
        <b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;&nbsp;</font></b></td>
    </tr>
  </table>
  <br>
 
  <%}%>
  <%}%>
  
  <div align="center">
            <input name="atras" class="boton"  type="submit" id="" value="Atrás" onClick="location.href = 'ConsultaExamen?documento=<%=docEst%>'">
            <input name="Salir" class="boton"  type="submit" id="" value="Salir" onClick="location.href = 'http://www.escuelaing.edu.co'">
        </div>
    <footer>
        <span class="programa">
            Escuela Colombiana de Ingeniería Julio Garavito
        </span>

        <span class="direccion">
            AK.45 No.205-59 (Autopista Norte)<br/>
            PBX: +57(1) 668 3600<br/>
            Call Center: +57(1) 668 3600<br/>
            Línea Nacional Gratuita: 018000112668<br/>
            www.escuelaing.edu.co<br/>
            Bogotá, D.C. - Colombia<br/>
        </span>
    </footer>
</body>