<%-- 
    Document   : InicioDoctorado
    Created on : 4/04/2018, 02:41:03 PM
    Author     : andres.rojas
--%>

<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>


<% 
    //validaremos el idplan al ingresar mas adelante ref y doc
    try {
        int ban = 1;
        configeci.configDoctorado confEci = new configeci.configDoctorado();
        BDadmisiones bd = new BDadmisiones();
        
       
           
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
        <SCRIPT LANGUAGE="JavaScript">

            function comprueba( ){

            if ( !document.forms.form1.acepto[0].checked && !document.forms.form1.acepto[1].checked ) {
            alert("Debe seleccionar alguna opción");
            return false;
            }

            return true;
            }
        </SCRIPT>
    </head>
    <script language="JavaScript" type="text/JavaScript">
        <!--
        function ventanaSecundaria (URL){
        <%if (ban == 1) {%>
        window.open(URL,"","width=850,height=600,scrollbars=yes,top=80,left=100");

        <%} else {%>

        alert("Solo se habilitarán en las fechas programadas");
        <%}%>
        }

        function textoin(id){
        //document.getElementById(id).style.fontSize='8px';
        document.getElementById(id).style.color='#336699';
        }

        function textout(id){
        //document.getElementById(id).style.fontSize='10px';
        document.getElementById(id).style.color='#FFFFFF';
        }

        function ilum(esto, uno){
        esto.style.backgroundColor=uno;
        }
        //-->
    </script>
    <body bgcolor="#FFFFFF" text="#000000">

     
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
   
        <div align="center">

            <form name="form1" method="post"  onSubmit="return comprueba( );" action="ValidaRefPagoDoc">
              
                <div align="center">

                    <% if (ban == 1) {%>


                    <div class="container-fluid contenidos">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <p align="center"><b><font color="#CC0000" size="4">IMPORTANTE</font></b></p>
                                <p align="left">La informaci&oacute;n suministrada en esta solicitud
                                    de admisi&oacute;n ser&aacute; utilizada para el estudio de
                                    su admisi&oacute;n.</p>
                                <p>Declaro que la informaci&oacute;n aqu&iacute; consignada
                                    es cierta y autorizo su verificaci&oacute;n, en el caso de
                                    encontrar falsedad en los datos consignados, esta solicitud
                                    se anular&aacute;.</p>
                                <p>&nbsp;</p>
                                <p>
                                    Acepto que conozco las condiciones aqu&iacute;
                                    descritas&nbsp;&nbsp;&nbsp;&nbsp;</td>


                                    <b>Si
                                        <input type="radio" name="acepto" value="S">
                                        &nbsp;&nbsp;No</b>
                                    <input type="radio" name="acepto" value="N">
                                <center>
                                    <p>
                                        <input type="submit" value="Acepto" name="submit" class="boton">
                                    </p>
                                    <p>&nbsp;</p>
                                </center>

                                <% } else {%>
                                <center>Este proceso sólo se habilitará en las fechas programadas.</center>
                                    <%}%>

                            </div></div></div></div>
                <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                </div>
            </form>
        </div>

    </body>
</html>
<%    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Solicitud Doctorado", e.getMessage());
    }
%>
