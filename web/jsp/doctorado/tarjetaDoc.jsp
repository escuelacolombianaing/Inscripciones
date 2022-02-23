<%-- 
    Document   : tarjetaDoc
    Created on : 6/04/2018, 03:42:31 PM
    Author     : andres.rojas
--%>

<%
    String ref, apellido1, apellido2, nom, doc, prog;
    apellido1 = request.getParameter("apellido1");
    apellido2 = request.getParameter("apellido2");
    nom = request.getParameter("nombre");
    doc = request.getParameter("doc");
    ref = request.getParameter("ref");
    prog = request.getParameter("prog");
    configeci.configPosgrados confEci = new configeci.configPosgrados();
%>

<html>
    <head>
        <meta charset="UTF-8">
	<title>DOCTORADO EN INGENIERÍA</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="Content-Language" content="ES" />
	<meta name="language" content="spanish" />
	<meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
	<meta name="copyright" content="Copyright (c) 2017" />
	<meta name="description" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
	<meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="css/estilo-doctorado.css">
	<link rel="stylesheet" href="css/FormularioDoctorado.css">   
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300i,700" rel="stylesheet">

	<!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-116073513-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'UA-116073513-1');
    </script>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function impresion(){
            document.getElementById("imprimir").style.visibility='hidden';
            window.print();

            }
            -->

        </script>

    </head>
    <body>

        <div class="container-fluid franjaColor navbar-fixed-top">
		<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="nav navbar-default" role="navegation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".menu">
							<span class="sr-only">Desplegar navegación</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="index.html"><img alt="Brand" src="img/logoEscuela.svg" class="img-responsive"></a>
					</div>
					<div class="collapse navbar-collapse menu">
						<ul class="nav navbar-nav">
							<li><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/index.html">Inicio</a></li>
							<li><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/caracteristicas.html">Características</a></li>
							<li><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/internacionalizacion.html">Internacionalización</a></li>
							<li><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/investigacion.html">Investigación</a></li>
							<li><a href="http://www.escuelaing.edu.co/escuela/doctoradoIngenieria/doc/Brochure-Doctorado-Ingenieria.pdf" target="_blank">Guía Doctorado</a></li>
							<li class="active"><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/admisiones.html">Admisiones</a></li>
							<li><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/contacto.html">Contáctenos</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		</div>
            </div>
        <div class="row">
				<div class="col-lg-12"><h2 class="page-header"><span><img src="img/icono-areas.png" alt="icono plan"></span> DOCTORES</h2></div>
				<div class="row">
					<div class="col-md-12"><img src="img/imgGeneralidades-1.jpg" class="img-responsive" alt="Bloque F"><br></div>
				</div>
	</div>	
        <br>
        <% if (prog.equals("13")) {
                prog = "INGENIERIA CIVIL";
            }
            if (prog.equals("14")) {
                prog = "INGENIERIA ELECTRICA";
            }
            if (prog.equals("15")) {
                prog = "INGENIERIA DE SISTEMAS";
            }
            if (prog.equals("16")) {
                prog = "INGENIERIA INDUSTRIAL";
            }
            if (prog.equals("17")) {
                prog = "INGENIERIA ELECTRONICA";
            }
            if (prog.equals("18")) {
                prog = "ECONOMIA";
            }
            if (prog.equals("19")) {
                prog = "ADMINISTRACION";
            }
            if (prog.equals("20")) {
                prog = "MATEMATICAS";
            }
            if (prog.equals("260")) {
                prog = "INGENIERIA MECANICA";
            }
            if (prog.equals("285")) {
                prog = "PROCESAMIENTO DE POLIMEROS";
            }
            if (prog.equals("370")) {
                prog = "ESPECIALIZACIÓN EN GESTIÓN INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE";
            }
            if (prog.equals("312")) {
                prog = "ESPECIALIZACION EN ESTRUCTURAS";
            }
            if (prog.equals("310")) {
                prog = "ESPECIALIZACION EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
            }
            if (prog.equals("324")) {
                prog = "ESPECIALIZACION EN TELEMATICA APLICADA A NEGOCIOS";
            }
            if (prog.equals("374")) {
                prog = "ESPECIALIZACION EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
            }
            if (prog.equals("320")) {
                prog = "ESPECIALIZACION EN INGENIERIA DE FUNDACIONES";
            }
            if (prog.equals("309")) {
                prog = "ESPECIALIZACION EN SANEAMIENTO AMBIENTAL";
            }
            if (prog.equals("313")) {
                prog = "ESPECIALIZACION EN ECONOMIA PARA INGENIEROS";
            }
            if (prog.equals("373")) {
                prog = "ESPECIALIZACION EN GERENCIA DE OPERACIONES";
            }
            if (prog.equals("267")) {
                prog = "ESPECIALIZACION EN DISEÑO, CONSTRUCCION Y CONSERVACION DE VIAS";
            }
            if (prog.equals("332")) {
                prog = "MAESTRIA EN INGENIERIA ELECTRONICA";
            }
            if (prog.equals("333")) {
                prog = "MAESTRIA EN INGENIERIA ELECTRONICA";
            }
            if (prog.equals("351")) {
                prog = "MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
            }
            if (prog.equals("290") || prog.equals("290") || prog.equals("292") || prog.equals("293") || prog.equals("294")) {
                prog = "MAESTRIA EN INGENIERIA CIVIL";
            }
            if (prog.equals("353")) {
                prog = "MAESTRIA EN GESTION DE INFORMACION";
            }
            if (prog.equals("330")) {
                prog = "MAESTRIA EN INGENIERIA INDUSTRIAL";
            }
            if (prog.equals("335") || prog.equals("336")) {
                prog = "MAESTRIA EN INGENIERIA ELECTRICA";
            }
            if(prog.equals("371")){
                prog="MAESTRÍA EN INFORMÁTICA";
            }
            if(prog.equals("372")){
                prog="MAESTRÍA EN CIENCIAS ACTUARIALES";
            }
            if(prog.equals("376") || prog.equals("377")){
                prog="MAESTRÍA EN CIENCIA DE DATOS";
            }
            if(prog.equals("277")){
                prog="DOCTORADO EN INGENIERIA";
            }
        %>	
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <p>Si usted desea pagar los derechos de inscripción ($99.000) combinando
                        efectivo y tarjeta d&eacute;bito, efectivo y tarjeta cr&eacute;dito, efectivo 
                        y cheque o con cualquier tarjeta d&eacute;bito o cr&eacute;dito, únicamente 
                        podrá hacerlo en la caja de la Escuela Colombiana de Ingenier&iacute;a, 
                        Bloque A, primer piso, de 8:00 a.m a 12 m. y de 1:00p.m a 4:00p.m</p>
                    <p align="center"><b>Para ello imprima este reporte y pres&eacute;ntelo 
                            en la caja de la Escuela.</b></p>
                    <p><b>Nombre Aspirante - Programa: <%=nom.toUpperCase()%>&nbsp;&nbsp;<%=apellido1.toUpperCase()%> 
                            &nbsp;<%=apellido2.toUpperCase()%> - <%=prog%> </b></p>
                    <p><b>Documento de Identidad:&nbsp;&nbsp;&nbsp;<%=doc%></b> </p>
                    <p><b>Número de referencia:</b> <strong>&nbsp; &nbsp;<%=ref%></strong> 
                    </p>
                    <ol>
                        <p>&nbsp;</p>
                        <p><li>Usted no requiere diligenciar comprobante. Una vez realice el pago,
                            el cajero le entregar&aacute; el soporte con el respectivo sello el 
                            cual deber&aacute; entregar en la Oficina de Admisiones con el fin de 
                            habilitar su pago .</li> </p>
                        <p>
                        <li>Una vez habilitado el pago, se le dar&aacute; acceso para diligenciar 
                            el formulario de solicitud de admisi&oacute;n en l&iacute;nea. Tenga 
                            en cuenta la fecha l&iacute;mite del proceso de inscripciones y los 
                            tiempos necesarios para acceder al formulario una vez haya realizado 
                            el pago, y verifique que este se recibi&oacute; correctamente 
                    </ol>

                    <p>(En caso de error en el n&uacute;mero del documento de identidad que 
                        qued&oacute; registrado, por favor env&iacute;e a la Oficina de admisiones 
                        al correo electr&oacute;nico admisiones@escuelaing.edu.co, copia de 
                        su documento de identidad solicitando la correspondiente correcci&oacute;n&quot;. 
                        Esto evitar&aacute; posteriores confusiones con su pago)</p>
                    <p>Para atender cualquier inquietud que tenga con su pago, por favor env&iacute;ela 
                        al correo electr&oacute;nico admisiones@escuelaing.edu.co, Oficina de 
                        Admisiones, relacionando sus datos.<br>
                    </p>


                    <div align="center">
                        <input name="imprimir" class="boton"  type="submit" id="imprimir" value="Imprimir"  onClick="impresion()">
                    </div>
                </div>
            </div>
        </div>
        <p>&nbsp;</p></body>
</html>
