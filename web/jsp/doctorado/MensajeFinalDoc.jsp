<%-- 
    Document   : MensajeFinalDoc
    Created on : 4/04/2018, 10:33:02 AM
    Author     : andres.rojas
--%>

<%
String ref, apellido1, apellido2, nom,doc,prog;
apellido1 = request.getParameter("apellido1") ;
apellido2 = request.getParameter("apellido2") ;
nom = request.getParameter("nombre") ;
doc = request.getParameter("doc") ;
ref = request.getParameter("ref") ;
prog = request.getParameter("prog") ;
configeci.configDoctorado confEci = new configeci.configDoctorado();
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
            
            //Estas dos lineas se agregaron en 2020-2 por el tema del Coronavirus
            alert("Su solicitud de número de referencia se realizó con éxito. El número de referencia es: <%=ref%>. Tenga  en cuenta que este número le será solicitado para el diligenciamiento del formulario")
            location.href = '/inscripcioneslinea/InicioDoctorado';
            
            
<!--
function impresion(){
    document.getElementById("tablaboton").style.visibility='hidden';
    window.print();
    
}
        --> </script>
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
        
        <div class="container-fluid contenidos">
        <p align="center"><b><font size="3">Una vez seleccione la forma de pago
        el sistema le informar&aacute; el n&uacute;mero de referencia.</font></b></p>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
          <p>1. <span class="resaltados"><font size="2" face="Arial, Helvetica, sans-serif"><b>Pago</b></font></span><b><font size="2" face="Arial, Helvetica, sans-serif"> 
            en efectivo en bancos:</font></b><font size="2" face="Arial, Helvetica, sans-serif"> 
            Consigne $99.000(noventa y nueve mil pesos m/cte) en efectivo a nombre de
            la Escuela Colombiana de Ingenier&iacute;a. Siga las instrucciones 
            de acuerdo con la entidad bancaria en la cual realizar&aacute; el 
            pago:</font> </p>
        
        
              <li><b><a href="MensajeOccidenteDoc?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%>">Banco
                de Occidente</a></b></li>
              <li><a href="MensajeItauDoc?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%> "><b><i>Banco Itaú </i></b></a><font face="Arial, Helvetica, sans-serif" size="2"><br>
                </font><font face="Arial, Helvetica, sans-serif" size="2"><br>
                </font></li>
           
       
          <p><span class="resaltados">2. <b><font size="2" face="Arial, Helvetica, sans-serif">Pago 
            en l&iacute;nea :</font></b> <b><i><a href="PagoLineaDoc?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%>">Para
            consultar instrucciones haga click Aqu&iacute;</a></i></b></span><br>
          </p>
          <p>3. <b> <font size="2" face="Arial, Helvetica, sans-serif">Pago mixto. 
            </font></b><i><b><a href="TarjetaDoc?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%>">Para
            consultar instrucciones haga click Aqu&iacute;</a></b></i></p>
          <p><i></i></p>
        
    
                  
               
       <p>&nbsp;</p>
    <p><b><i>Despu&eacute;s de haber realizado el pago, recuerde diligenciar su 
      formulario para terminar el proceso de inscripci&oacute;n.</i></b></p>
    <p><b><i>Si tiene inquietudes por favor comun&iacute;quese al tel&eacute;fono 
      6683600 opción 2 en el menú.</i></b></p>
    
      <p></div> </div> </div> </div></div></p>
    </body>
</html>
<!--%
    sesion = request.getSession(false) ;
    sesion.invalidate() ;
%-->
