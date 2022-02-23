<%   
    response.setHeader("Cache-Control","no-cache"); 
    configeci.configuracion confEci = new configeci.configuracion();
 %>
<html>
<head>
<title>Solicitud Inscripción Pregrado</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE INSCRIPCIÓN A LOS PROGRAMAS ACADÉMICOS DE PREGRADO" />
</jsp:include>
  <table width="640" border="0" align="center" class="textocom">
    <tr>
      <td height="69">&nbsp;</td>
      <td height="69">&nbsp;</td>
      <td height="69">&nbsp;</td>
    </tr>
    <tr>
      <td height="69" colspan="3">Si usted estuvo matriculado en la Escuela en un programa de pregrado en una 
  oportunidad anterior, deber&aacute; tramitar una solicitud de Seguimiento académico, reintegro 
  o readmisi&oacute;n seg&uacute;n sea el caso, con basse en lo estipulado en 
  el Reglamento Estudiantil de la Escuela</p>
<p>Para mayor informaci&oacute;n consulte el <a href="http://www.escuelaing.edu.co/documentos/reglamentoestudiantil.pdf" target="_blank">reglamento 
  estudiantil</a>, o comun&iacute;quese con la oficina de Admisiones donde se 
  aclararán sus inquietudes, al teléfono 6683600 opción 2 en el menú o al email: 
  <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co.</a> </td>
    </tr>
  </table>
<br>
<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>
</body>
</html>
