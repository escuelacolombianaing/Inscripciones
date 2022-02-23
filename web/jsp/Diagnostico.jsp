<%-- 
    Document   : Diagnostico
    Created on : 2/12/2009, 12:11:53 PM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% String docEst = request.getParameter("documento");
            configeci.configuracion confEci = new configeci.configuracion();
            PrintWriter oout = response.getWriter();
            BDadmisiones bd = new BDadmisiones();
            Vector examen = bd.Diagnostico(docEst, oout);
            String prog="";
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Citación Exámen de Diagnóstico</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CITACION EXAMENES DE DIAGNOSTICO" />
        </jsp:include>
<% for (int j=0; j< examen.size(); j++){
                Vector datos= (Vector) examen.elementAt(j);

 if (datos.elementAt(5).equals("13")) {
            prog = "INGENIERIA CIVIL";

        } else if (datos.elementAt(5).equals("14")) {
            prog = "INGENIERIA ELECTRICA";

        } else if (datos.elementAt(5).equals("15")) {
            prog = "INGENIERIA DE SISTEMAS";

        } else if (datos.elementAt(5).equals("16")) {
            prog = "INGENIERIA INDUSTRIAL";

        } else if (datos.elementAt(5).equals("17")) {
            prog = "INGENIERIA ELECTRONICA";

        } else if (datos.elementAt(5).equals("18")) {
            prog = "ECONOMIA";

        } else if (datos.elementAt(5).equals("19")) {
            prog = "ADMINISTRACION DE EMPRESAS";

        } else if (datos.elementAt(5).equals("20")) {
            prog = "MATEMATICAS";

        } else if (datos.elementAt(5).equals("260")) {
            prog = "INGENIERIA MECANICA";

        } else if (datos.elementAt(5).equals("264")) {
            prog = "INGENIERIA AMBIENTAL";

        }
   %>
   <br>
<table width="50%" border="0" align="center" class="textoimpremas">
    <% if (j==0) {%>
  <tr> 
    <td><b>Nombre :</b> <%=datos.elementAt(4)%></td>
  </tr>
  <tr>
    <td height="39">
      <p><b>Programa:</b><%=prog%></p>
      <p>&nbsp;</p>
    </td>
  </tr>
  <tr>
    <td height="39">
      <p><b><font color="#CC0000">Código:</font></b><font color="#CC0000"> <%=datos.elementAt(1)%></font></p>
      <p><font color="#000000">* Anote este n&uacute;mero pues lo va a necesitar 
        para tener acceso al ex&aacute;men de diagn&oacute;stico.</font></p>
      <p><font color="#000000">*Por favor traer su documento de identidad</font></p>
      <p>&nbsp;</p>
    </td>
  </tr>
  <tr><td></td></tr>
   <tr>
    <td>Usted deber&aacute; presentarse al ex&aacute;men de Diagn&oacute;stico
      el  <b><%=datos.elementAt(3)%></b> a las  <b><%=datos.elementAt(6)%> </b> en el salón <b> <%=datos.elementAt(2)%></b></p>
    
  <%}
                }%>
    
                 <tr><td></td></tr>
                <tr><td>
      <p>&nbsp;</p>
      <p>Cordialmente, </p>
      <p>Oficina de Admisiones 6683600 opción 2 en el menú.</p>
    </td></tr>
</table>
</body>
</html>
