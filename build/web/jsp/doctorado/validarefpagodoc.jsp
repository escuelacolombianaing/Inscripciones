<%-- 
    Document   : validarefpagodoc
    Created on : 4/04/2018, 02:55:15 PM
    Author     : andres.rojas
--%>

<%@page import="utiles.Correo"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>

<%
try{
            String acepto = request.getParameter("acepto");
            configeci.configDoctorado confEci = new configeci.configDoctorado();
            String idplan = request.getParameter("idplan");
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
            function validar() {
                if(document.formvrp.ref.value == "" || document.formvrp.doc.value == ""){
                    alert("Los campos no pueden estar vacios");
                    return false;
                }
            }
            //-->
        </script>
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        
        
        <div class="container">
            
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
            
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">   

        <%if (acepto.equals("S")) {%>
        <center>
        <table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td><p class="textocom">Para diligenciar el formulario de solicitud de admisi&oacute;n a alguno de
                        los programas académicos de la Escuela Colombiana de Ingeniería, por favor registre
                        el Número de referencia de pago de sus derechos de inscripción y el n&uacute;mero
                        de Documento de Identidad registrado para realizar dicho pago.</p></td>
            </tr>
        </table>
        </center>
        <form action="VerificaAspDoctorado" method="POST" name="formvrp" id="formvrp">
            <input name="idplan" type="hidden" id="idplan" value="<%=idplan%>">
            <div class="col-xs-8 col-md-5 col-md-offset-1">	
                            <p><strong>No.&nbsp;<BR> Referencia&nbsp; </strong>  
                        </div>
            <br>
                        <div class="col-xs-80 col-md-2">
                            <div class="form-group espaciado">
                                <strong> 
                                    <input type="text" name="ref" size="10" class="form-control" ></strong>
                            </div>
                        </div>
            <br>
            <br>
            <br>
                        <div class="col-xs-8 col-md-5 col-md-offset-1">	
                            <p><strong>Documento Identidad&nbsp; <br>(Sin puntos, ni comas ni guiones)&nbsp; </strong>
                        </div>
            <br>
                        <div class="col-xs-80 col-md-2">
                            <div class="form-group espaciado">
                                <strong> 
                                    <input type="text" name="doc" size="15" class="form-control" ></strong>
                            </div>
                        </div>
                </div>
            </div>   
             <div class="row">
                 <div class="col-xs-12 col-md-11 col-md-offset-5" >
                    <div class="submit">
                        <input class="btn btn-primary btn-lg" type="submit" value="Enviar Datos" onClick="javascript: return validar();"/>
                    </div>
                </div>

                <div class="col-xs-12 col-md-4"></div>								
            </div>


            <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                </form>

            </div>
        <%} else {%>
        <p>&nbsp;</p>
        <p align="center" class="textocom"><b>Favor ac&eacute;rquese a la Oficina de Admisiones.  Bloque A primer piso.<br>
                Donde se aclararán sus inquietudes, o al email: <a href='mailto:admisiones@escuelaing.edu.co'>admisiones@escuelaing.edu.co</a> o al teléfono 6683600 opción 2 en el menú.</b></p>
                <%}%>
          </div>
</html>
<%
            } catch (Exception e) {
                Correo correo = new Correo();
                correo.enviar("Solicitud Doctorado", e.getMessage());
            }
%>