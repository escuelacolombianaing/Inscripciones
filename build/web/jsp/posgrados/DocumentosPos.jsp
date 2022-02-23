<%-- 
    Document   : Documentos
    Created on : 13/09/2011, 10:14:31 AM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%
    String idplan=request.getParameter("idplan");
%>
<html>
    <head>
        <%if(idplan!= null && idplan.equals("352")){%>
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
            <%}else{%>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Consulta Documentación Posgrados</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/tablas.css"/>
        <%}%>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {

                if(document.forms.formegre.doc.value == ""){
                    alert("Por favor ingrese su documento de identificación");
                    document.formegre.doc.style.backgroundColor= '#ffcc00';
                    document.formegre.doc.focus();
                    return false;
                }
            }
            //-->
        </script>
    </head>
    <body>
        <%if(idplan!=null&&idplan.equals("352")){%>
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
        <%}else{%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="Consulta Documentación Posgrados" />
        </jsp:include>
        <%}%>
        <form action="EstadoDocumentosPosgrado" method="POST" name="formegre" id="formegre">
            <center>
            <input type="hidden" name="id_evento"  value="13">
            <input type="hidden" name="idplan" value="<%=idplan%>">
            <table border="0" cellpadding="0" cellspacing="2" width="50%" align="center" class="textocom">
                <tr  bgcolor="#F3F3F3">
                    <td  bgcolor="#F3F3F3" width="50%" height="38">
                        <div align="right">
                            <p><strong><font size="2">Documento Identidad&nbsp; <br>
                            (con el que realizó la inscripción. Sin puntos, ni comas, ni guiones):</font></strong>
                    </div></td>
                    <td  bgcolor="#F3F3F3" width="50%" height="38"><strong>
                    <input type="text" name="doc" size="15" class="campotext"></strong></td>
                </tr>
            </table>
            <p><input type="submit" value="Enviar" name="B1"  class="btn btn primary" onClick="javascript: return validar();"></p>
            </center>
        </form>

    </body>
</html>