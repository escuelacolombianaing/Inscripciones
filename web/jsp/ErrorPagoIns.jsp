<%
	configeci.configuracion confEci = new configeci.configuracion();
%>
<html>
<head>
<title>Formulario Inscripci�n del Aspirante</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/comun.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/estilo-fomularios.css">
</head>

<body>
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE INSCRIPCI�N A LOS PROGRAMAS ACAD�MICOS DE PREGRADO" />
</jsp:include>
     <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
    
  <br> 
<p align="center"><big><strong>Estimado Aspirante: </strong></big></p>
<p align="center">La informaci�n de su pago no concuerda con la diligenciada, el valor est� inferior al autorizado, o el Banco NO ha reportado la consignaci�n de los
 derechos de inscripci�n para ese n�mero de Referencia. </p>
<p align="center">Verifique los datos dados, y si son correctos intente m�s tarde. </p>
   
<form>&nbsp;&nbsp;<center><input type="button" value="Cerrar ventana" onclick="window.close()" class="boton"></center></form>
<center>
<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>
                </div>
            </div>
     </div>
</center>
    </body>
</html>
