<%-- 
    Document   : CorreoNuevos
    Created on : 14/06/2017, 03:08:25 PM
    Author     : lucero.rodriguez
--%>


<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% String docEst = request.getParameter("documento");
    configeci.configuracion confEci = new configeci.configuracion();
     String periodo = confEci.getPeriodo();
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    String carnet = new String();
    String prog = new String();
    HttpSession sesion;%>
   
<html>
<head>
<title>Consultar Correo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.boton{
        font-size:10px;
        font-family:Verdana,Helvetica;
        font-weight:bold;
        color:white;
		background-image:url(img/blue-background.gif);
        height:25px;
		border-color: 666699;
		border-width: 2;
       }
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
</head>

<body>
 <jsp:include page="encabezado">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="Consulta correo" />
        </jsp:include>
<%
Vector estud = bd.infoCorreoNuevos(docEst, periodo);
if((estud.size()) == 0){%>
  	<p>&nbsp;</p>
	<p align="center"><h3>
            <center>
	    <font color="#666666" size="3" face="Verdana, Arial, Helvetica, sans-serif">Su numero de carnet o documento es incorrecto, o no existe información</font><br>
  </center></h3>
<%}else{%>

<% for ( int j = 0 ; j < estud.size() ; j++ ){
		Vector estudiante = (Vector)estud.elementAt(j) ;
%>
  <div align="center">
  <p><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif">CORREO ESTUDIANTES</font></b><br>
  </p>
  <table width="550" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="20%"> 
        <div align="right"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Carnet: 
          &nbsp;&nbsp;&nbsp;&nbsp;</font></b></div>
      </td>
      <td width="80%"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(0)%></font></b></td>
    </tr>
    <tr> 
      <td width="20%"> 
        <div align="right"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Doc: 
          &nbsp;&nbsp;&nbsp;&nbsp;</font></b></div>
      </td>
      <td width="80%"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(1)%></font></b></td>
    </tr>
    <tr> 
      <td width="20%"> 
        <div align="right"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">Nombre: 
          &nbsp;&nbsp;&nbsp;&nbsp;</font></b></div>
      </td>
      <td width="80%"><b><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><%=estudiante.elementAt(2)%></font></b></td>
    </tr>
    <tr> 
      <td width="20%"> 
        <div align="center"><b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
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
          informamos A LOS ESTUDIANTES NUEVOS que la contrase&ntilde;a ser&aacute; 
          generada autom&aacute;ticamente por el sistema con la siguiente estructura:</b></font></p>
        <p align="left"><font color="#800000" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><br>
          Primera letra del primer nombre en May&uacute;scula + Segunda letra 
          del primer nombre en min&uacute;scula + Los cuatro &uacute;ltimos d&iacute;gitos 
          del carnet + Las dos primeras letras del primer apellido en min&uacute;scula. 
          </b></font></p>
        <p>Ejemplo: Juan Alberto P&eacute;rez Morales, n&uacute;mero de documento 
          de identificaci&oacute;n 123456789, n&uacute;mero de carnet 1234567; 
          para este caso la contrase&ntilde;a asignada ser&aacute;: Ju4567pe </p>
        <!--p>Tips para realizar el cambio de contrase&ntilde;a:<br>
          &quot; Ingresar al enlace<br>
          &quot; Registrar su usuario sin &quot;@mail.escuelaing.edu.co&quot;<br>
          &quot; Registrar Preguntas y asociar correo alterno<br>
          &quot; Cambiar contrase&ntilde;a</p-->
        <!--ul>
          <li><a href="http://tycho.escuelaing.edu.co/contenido/documentos/Manualcambiocontrasenas.pdf">Consulte 
            el manual para gestionar el cambio de contrase&ntilde;a</a></li>
          <li><a href="https://gestorpasswd.escuelaing.edu.co/">Cambie su contrase&ntilde;a</a></li>
        </ul-->
        <p align="left"><font color="#800000"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Cualquier 
                duda o inconveniente por favor acercarse a La Direcci&oacute;n de Tecnolog&iacute;a o contactarse con el Centro de Servicios Tecnol&oacute;gicos en la URL <a href="https://serviciosti.escuelaing.edu.co/">serviciosti.escuelaing.edu.co</a> o al correo <a href="mailto:serviciosti@escuelaing.edu.co">serviciosti@escuelaing.edu.co</a></font></b></font><br>
        </p>
        <br>
        <br>
        <%
            if(!estudiante.elementAt(4).equals("No disponible")&&!estudiante.elementAt(4).equals("P")){
        %>
        <form method="post" action="https://estudiantes.escuelaing.edu.co/estudiantes/horarioEstud">
            <p align="center"><font color="#800000"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <input type="hidden" id="id_nuevo" name="id_nuevo" value="<%=estudiante.elementAt(0)%>">
                    <input type="submit" value="Ver Horario"></font></b></font><br>
        </p>
        </form>
        <%
            }
        %>
        <b><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;&nbsp;</font></b></td>
    </tr>
  </table>
  </div>
  <br>
  
  <%}%>
  <%}%>
  <div align="center">
  <form>
    <table width="324" border="0">
      <tr>
        <td> 
          <div align="center">
            <input type="button"  onClick="window.close()" value="Cerrar" name="button">
          </div>
        </td>
      </tr>
    </table>
    </form>

  </div>
<map name="Map">
        <area shape="rect" coords="3,2,127,32" href="http://www.escuelaing.edu.co/delcolegioalau.htm">
        <area shape="rect" coords="131,2,255,32" href="http://www.escuelaing.edu.co/aspirantesposgrado/aspirantes.htm">
        <area shape="rect" coords="385,3,513,34" href="http://egresados.escuelaing.edu.co/egresados">
        <area shape="rect" coords="516,4,640,32" href="http://empleados.escuelaing.edu.co/intraeci">
        <area shape="rect" coords="643,3,766,31" href="http://www.escuelaing.edu.co/entorno/relacion_entorno.htm">
        <area shape="rect" coords="3,124,165,186" href="http://www.escuelaing.edu.co">
        </map>
</body>
</html>