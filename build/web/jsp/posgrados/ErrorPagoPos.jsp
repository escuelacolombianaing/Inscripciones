<%-- 
    Document   : ErrorPagoPos
    Created on : 13/03/2012, 09:28:00 AM
    Author     : lrodriguez
--%>

<%
	configeci.configPosgrados confEci = new configeci.configPosgrados();
%>
<html>
<head>
<title>Formulario Inscripción del Aspirante</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>

<body>
    
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE INSCRIPCIÓN A LOS PROGRAMAS DE POSGRADO" />
</jsp:include>
  <table width="640" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
    <tr>
      <td><br>
<p align="center"><big><strong>Estimado Aspirante: </strong></big></p>
<p align="center">La información de su pago no concuerda con la diligenciada, el valor está inferior al autorizado, el Banco NO ha reportado la consignación de los
 derechos de inscripción para
 ese número de Referencia o está intentando inscribirse a un programa diferente al registrado inicialmente. </p>
<p align="center">Verifique los datos dados, y si son correctos intente más tarde. </p></td>
    </tr>
</table>
<form>&nbsp;&nbsp;<center><input type="button" value="Cerrar ventana" onclick="window.close()" class="boton"></center></form>


    </body>
</html>
