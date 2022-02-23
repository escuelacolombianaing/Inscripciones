<%
    response.setHeader("Cache-Control","no-cache");
    configeci.configuracion confEci = new configeci.configuracion();
    String prog =request.getParameter("prog");
    String perant = request.getParameter("perant");
    String nom_est = request.getParameter("nom_est");
 %>
<html>
<head>
<title>SolicitudActivación de cupo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ACTIVACIÓN DE CUPO PREGRADO" />
</jsp:include>
  <table width="640" border="0" align="center" class="textocom">
    <tr>
      <td height="69">&nbsp;</td>
      <td height="69">&nbsp;</td>
      <td height="69">&nbsp;</td>
    </tr>
    <tr>
      <td height="69" colspan="3"><%=nom_est%>:<br>
          Usted realizo proceso de admisión para el periodo <%=perant%> y fue admitido al programa <%=prog%>
          <br><a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/ProcNoMatric"> Si desea activar su admisión ingrese aquí.</a>
          <br>Si desea cambiar de programa debe realizar su proceso nuevamente .
         </td>
    </tr>
  </table>
<br>
<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>
</body>
</html>
