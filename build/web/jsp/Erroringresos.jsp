<%-- 
    Document   : Erroringresos
    Created on : 28/04/2011, 03:04:21 PM
    Author     : lrodriguez
--%>

<%
	configeci.configuracion confEci = new configeci.configuracion();
%>
<html>
<head>
<title>Formulario Inscripción del Aspirante</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE INSCRIPCIÓN A LOS PROGRAMAS ACADÉMICOS DE PREGRADO" />
</jsp:include>
  <table width="640" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
    <tr>
      <td><br>
<p align="center"><big><strong>Estimado Aspirante: </strong></big></p>
<p align="center">La información de los ingresos de algunos de sus padres o responsable de su matrícula debe ser mayor a cero(0), por favor verifíquele e
ingrese los datos correctos. </p>
<p align="center"> </p></td>
    </tr>
</table>
<form>&nbsp;&nbsp;<center><input type="button" value="Cerrar ventana" onclick="window.close()" class="boton"></center></form>
<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>

    </body>
</html>
