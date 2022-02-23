<%-- 
    Document   : pagoenlineaDoc
    Created on : 4/04/2018, 10:44:42 AM
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
String nomPrograma="";
if(prog.equals("277")){
    nomPrograma="DOCTORADO EN INGENIERIA";
}
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

      
          <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">           
      <p>Usted va a realizar el pago de los derechos de Inscripción ($ 99.000
        ) en el link que aparece en la parte inferior de esta p&aacute;gina.</p>
                    <p><b>Nombre Aspirante - Programa: <%=nom.toUpperCase()%>&nbsp;&nbsp;<%=apellido1.toUpperCase()%> &nbsp;<%=apellido2.toUpperCase()%>
                    - <%=nomPrograma%> </b></p>
                    <p><b>Documento de Identidad:&nbsp;&nbsp;&nbsp;<%=doc%></b> </p>
                    <p><b>Número de referencia:</b> <strong>&nbsp; &nbsp;<%=ref%></strong> 
                    </p>
                  
                    <p align="center">
        <p>No olvide hacer clic en el bot&oacute;n <strong>"REGRESAR A LA TIENDA"</strong> al terminar el pago en PSE para que su pago quede registrado.</p>
      <p>Si desea puede realizar el pago de los derechos de inscripci&oacute;n 
        <strong>a trav&eacute;s de internet</strong> haciendo <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst"><strong>&lt;&lt;CLIC
        AQUI&gt;&gt;</strong></a>, para realizar este proceso debe contar con 
        una cuenta corriente o de ahorros en Colombia. </p>
                    
      <p><i>(En caso de error en el número del documento de identidad que quedó 
        registrado, por favor envíe a la Oficina de admisiones al correo electr&oacute;nico 
        admisiones@escuelaing.edu.co, copia de su documento de identidad solicitando 
        la correspondiente corrección, antes de realizar su pago". Esto evitará 
        posteriores confusiones con su pago).</i></p>
      <p>Para atender cualquier inquietud que tenga con su pago, por favor env&iacute;ela 
        al correo electr&oacute;nico admisiones@escuelaing.edu.co, Oficina de 
        Admisiones, relacionando sus datos.</p>
                <p>&nbsp;</p></td>
           
                    <div align="center">
                        <input id="imprimir" name="imprimir" class="boton"  type="submit" id="imprimir3" value="Imprimir"  onClick="impresion()">
                    </div>
                </div>
            </div></div>
    </body>
</html>
