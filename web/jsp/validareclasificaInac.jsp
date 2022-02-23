<%-- 
    Document   : validareclasificaInac
    Created on : 12/01/2010, 06:47:22 AM
    Author     : lrodriguez
--%>

<%@page contentType="text/html"%>
<%configeci.configuracion confEci = new configeci.configuracion();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/comun.css" rel="stylesheet" type="text/css">
        <title>Solicitud Reclasificación</title>
    </head>
    <body> <!%=confEci.getPeriodo()%>
	<jsp:include page="encabezado">
        <jsp:param name="parametro" value="2010-1" />
        <jsp:param name="titulo" value="SOLICITUD RECLASIFICACION" />
        </jsp:include>
    <table width="431" height="94" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
      <tr>
        <td height="94"><strong>Este proceso se ha cerrado.
       </strong></td>
      </tr>
    </table>
<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>
    </body>
</html>
