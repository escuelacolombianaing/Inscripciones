<%
	configeci.configmaestria confEci = new configeci.configmaestria();
     String idplan =  request.getParameter("idplan");
%>
<html>
<head>
<title>Formulario Inscripción del Aspirante</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>

<body>
 <%if (idplan.equals("353")) {%>
    <jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN GESTIÓN DE INFORMACIÓN" />
    </jsp:include>
    <%}else if (idplan.equals("332")) {%>
    <jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERIA ELECTRONICA" />
    </jsp:include>
    <%} else if (idplan.equals("290")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERÍA CIVIL" />
    </jsp:include>
<%}else if (idplan.equals("351")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS" />
    </jsp:include>
<%}else if (idplan.equals("371")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INFORMÁTICA" />
    </jsp:include>
<%}else if (idplan.equals("372")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN CIENCIAS ACTUARIALES" />
    </jsp:include>
<%}else if (idplan.equals("376")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN CIENCIA DE DATOS" />
    </jsp:include>
<%}else if (idplan.equals("330")){%>
<jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERÍA INDUSTRIAL" />
    </jsp:include>
<%}%>
 
  <table width="640" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
    <tr>
      <td><br> 
<p align="center"><big><strong>Estimado Aspirante: </strong></big></p>
<p align="center">La información de su pago no concuerda con la diligenciada, el valor está inferior al autorizado,  el Banco NO ha reportado la consignación de los
 derechos de inscripción para ese número de Referencia o está intentando inscribirse a un programa diferente al registrado inicialmente. </p>
<p align="center">Verifique los datos dados, y si son correctos intente más tarde. </p></td>
    </tr>
</table>
<form>&nbsp;&nbsp;<center><input type="button" value="Cerrar ventana" onclick="window.close()" class="boton"></center></form>

    
    </body>
</html>
