<%@page contentType="text/html"%>
<%configeci.configuracion confEci = new configeci.configuracion();%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/comun.css" rel="stylesheet" type="text/css">
        <title>Admitidos Pregrado</title>
    </head>
    <body> <!%=confEci.getPeriodo()%>
	<jsp:include page="encabezado">
        <jsp:param name="parametro" value="2010-2" />
        <jsp:param name="titulo" value="ASPIRANTES A PRIMER SEMESTRE" />
        </jsp:include>
    <table width="431" height="94" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
      <tr>
        <td height="94"><strong>La respuesta de Admisión para el 2010-2 se ha cerrado.
       </strong></td>
      </tr>
    </table>
<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>  
    </body>
</html>
