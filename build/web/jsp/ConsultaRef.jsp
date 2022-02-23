<%-- 
    Document   : ConsultaRef
    Created on : 9/09/2011, 03:40:43 PM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% String docEst = request.getParameter("doc");
    configeci.configuracion confEci = new configeci.configuracion();
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    String idplan = request.getParameter("idplan");
    Vector consulta = new Vector();
    configeci.configuracion confeci = new configeci.configuracion();
    String periodo = confeci.getPeriodo();
    consulta = bd.Referencia(docEst, oout);
%>
<html>
    <head>
        <%if(idplan!=null&&idplan.equals("352")){%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Consulta Número de Referencia</title>
        <%}%>
        
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
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="Consulta número de referencia" />
        </jsp:include>
        <%}%>
        

        <%if (consulta.size() <= 0) {%>
        <h3><center> No existen registros con este número de documento, por favor verifique e intente nuevamente.<br> Recuerde que debe ingresar el número con el que solicitó referencia.</center></h3>


        <%} else {%>
        <div align="center">
            <table width="663" border="0">
                <tr> 
                    <td width="183"> 
                        <p><b><font size="2">Aspirante:</font></b></p>
                        <p>&nbsp;</p>
                    </td>
                    <% for (int i = 0; i < consulta.size(); i++) {
              Vector dato = (Vector) consulta.elementAt(i);
              String aspirante = dato.elementAt(2).toString();%>
                <h4>&nbsp;</h4>
                <br>
                <%if (i == 0) {%>
                <td width="470"> <font size="2"><%=aspirante%></font> 
                    <p>&nbsp;</p></td>

                </tr>
                <tr> 
                    <td width="183"> 
                        <p><font size="2" color="#000000"><b>N&uacute;mero de Referencia</b></font></p>
                    </td>
                    <td width="470"> 
                        <font size="2"><b>Programa</b></font>
                    </td>
                </tr>
                <%}%>
                <tr>
                    <td width="183"><font size="2"><%=dato.elementAt(1)%></font></td>
                    <td width="470"><font size="2"><%=dato.elementAt(3)%></font></td>
                </tr>
                <%}%>
            </table>
        </div>
        <p>&nbsp;</p>

        <% }%>


    </body>
</html>
