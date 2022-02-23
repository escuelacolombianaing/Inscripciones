<%-- 
    Document   : Error
    Created on : 28/04/2011, 03:04:21 PM
    Author     : 
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
        <jsp:param name="titulo" value="SOLICITUD PROCESO ADMITIDOS NO MATRICULADOS" />
</jsp:include>
  <table width="640" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
    <tr>
      <td><br>
<p align="center"><big><strong>Estimado Aspirante: </strong></big></p>
      <p align="center">La información no fue procesada, por favor ingrese m&aacute;s 
        tarde.</p>
</td>
    </tr>
</table>

<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>

    </body>
</html>
