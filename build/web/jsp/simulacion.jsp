<%-- 
    Document   : simulacion
    Created on : 23/09/2009, 09:11:26 AM
    Author     : lrodriguez
--%>

<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%
        String idprog = request.getParameter("idprog");
         configeci.configuracion confEci = new configeci.configuracion();
      %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Simular cambio de niveles</title>
          <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
      <body>
        <jsp:include page="encabezado">
    <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
    <jsp:param name="titulo" value="SIMULACION CAMBIO DE NIVELES" />
</jsp:include>
<p>&nbsp;</p>
<table width="50%" border="0" align="center"  class="textoimpremas">
  <tr>
    <td>Seleccione en cada &aacute;rea el nivel al cual desea hacer el cambio, 
      para consultar las asignaturas que cursar&iacute;a en caso que su solicitud 
      sea aprobada.</td>
  </tr>
</table>
<p>&nbsp;</p>
<table width="28%" border="0" align="center" class="textoimpremas">
  <form name="form1" method="post" action="Validar" target="popup"onsubmit="window.open('', 'popup', 'width = 450, height = 400, top=700,left=750')">
    <input name="idprog" type="hidden"  value="<%=idprog%>">
    <tr> 
      <td width="27%"> 
        <div align="center"><b>Asignatura</b></div>
      </td>
      <td width="73%"> 
        <div align="center"><b>Nivel</b></div>
      </td>
    </tr>
    <tr> 
      <td width="27%">Matem&aacute;ticas</td>
      <td width="73%"> 
        <div align="center"> 
          <select name="nivel1" class="textoimpremas">
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B">Bajo</option>
          </select>
        </div>
      </td>
    </tr>

    <% if (idprog.equals("13")|| idprog.equals("14") || idprog.equals("15")|| idprog.equals("16") || idprog.equals("17") ||  idprog.equals("20")|| idprog.equals("260")){%>
    <tr> 
      <td width="27%">F&iacute;sica</td>
      <td width="73%"> 
        <div align="center"> 
          <select name="nivel2" class="textoimpremas">
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B">Bajo</option>
          </select>
        </div>
      </td>
    </tr>
    <%}%>
    <tr>
      <td width="27%">Lenguaje</td>
      <td width="73%"> 
        <div align="center">
          <select name="nivel3" class="textoimpremas">
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B">Bajo</option>
          </select>
        </div>
      </td>
    </tr>
    <% if (idprog.equals("16")|| idprog.equals("20") || idprog.equals("260")){%>
    <tr> 
      <td>Qu&iacute;mica</td>
      <td> 
        <div align="center">
          <select name="nivel4" class="textoimpremas">
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B">Bajo</option>
          </select>
        </div>
      </td>
    </tr>
    <%}%>
    <!%if (idprog.equals("18") || idprog.equals("19")){%>
    <!-- <tr>
      <td>Filosofía</td>
      <td>
        <div align="center">
          <select name="nivel2" class="textoimpremas">
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B">Bajo</option>
          </select>
        </div>
      </td>
    </tr>-->

     <!%}%>

    <tr> 
      <td colspan="2"> 
        <div align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="submit" name="Submit" value="Validar" class="textoimpremas">
          </p>
        </div>
      </td>
    </tr>
  </form>
</table>
<h1>&nbsp;</h1>
    </body>
</html>
