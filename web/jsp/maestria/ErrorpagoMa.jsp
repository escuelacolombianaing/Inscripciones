<%
	configeci.configmaestria confEci = new configeci.configmaestria();
     String idplan =  request.getParameter("idplan");
%>
<html>
<head>
<title>Formulario Inscripci�n del Aspirante</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>

<body>
 <%if (idplan.equals("353")) {%>
    <jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN GESTI�N DE INFORMACI�N" />
    </jsp:include>
    <%}else if (idplan.equals("332")) {%>
    <jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN INGENIERIA ELECTRONICA" />
    </jsp:include>
    <%} else if (idplan.equals("290")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN INGENIER�A CIVIL" />
    </jsp:include>
<%}else if (idplan.equals("351")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS" />
    </jsp:include>
<%}else if (idplan.equals("371")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN INFORM�TICA" />
    </jsp:include>
<%}else if (idplan.equals("372")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN CIENCIAS ACTUARIALES" />
    </jsp:include>
<%}else if (idplan.equals("376")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN CIENCIA DE DATOS" />
    </jsp:include>
<%}else if (idplan.equals("330")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN INGENIER�A INDUSTRIAL" />
    </jsp:include>
<%}%>
 
  <table width="640" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
    <tr>
      <td><br> 
<p align="center"><big><strong>Estimado Aspirante: </strong></big></p>
<p align="center">La informaci�n de su pago no concuerda con la diligenciada, el valor est� inferior al autorizado,  el Banco NO ha reportado la consignaci�n de los
 derechos de inscripci�n para ese n�mero de Referencia o est� intentando inscribirse a un programa diferente al registrado inicialmente. </p>
<p align="center">Verifique los datos dados, y si son correctos intente m�s tarde. </p></td>
    </tr>
</table>
<form>&nbsp;&nbsp;<center><input type="button" value="Cerrar ventana" onclick="window.close()" class="boton"></center></form>

    
    </body>
</html>
