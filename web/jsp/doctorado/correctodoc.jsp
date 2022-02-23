<%-- 
    Document   : correctodoc
    Created on : 5/04/2018, 03:19:44 PM
    Author     : andres.rojas
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    configeci.configDoctorado confEci = new configeci.configDoctorado();
    String ref;
    String nsol = request.getParameter("nsol");
    String nombre = request.getParameter("nombre");
    String plan = request.getParameter("plan");
    String programa = "";
    otros.rutas ruta = new otros.rutas();
    Vector cronograma = bd.Cronogramas(oout, confEci.getPeriodoSiguiente(), plan);

    if (plan.equals("352")) {
        programa = "DOCTORADO EN INGENIERIA";
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
                <div class="col-md-3"></div>
                <div class="col-md-12">

                    <table width="70%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td valign="top">
                                <p align="left"><big><strong>Estimado Aspirante: Muchas Gracias. Su información
                                ya ha ingresado a nuestro sistema.</strong> </big></p>
                        <p align="left"><b>Usted esta preinscrito al programa : </b><%=programa%>.
                        </p>
                        <p align="left"> <b>Preinscripci&oacute;n No: <%=nsol%></b><br>
                            <b>Nombre del aspirante: <%=nombre.toUpperCase()%> </b></p>
                        <ol class="formuCorrecto">
                            <li> <b>Para formalizar la inscripci&oacute;n, debe cargar en un documento 
                                    .pdf el conjunto de documentos detallados m&aacute;s adelante, a trav&eacute;s 
                                    del siguiente <a href="ValidaPos?plan=<%=plan%>">LINK</a>, 
                                    y a m&aacute;s tardar el <%=cronograma.elementAt(4)%>. as&iacute;:</b></li>
                        </ol>
                        <ul class="formuCorrecto">
                            <li><font color="#000000" >Formulario impreso con fotografía a color 3x4cm.</font></li>
                            <li><font color="#000000" >Carta de presentaci&oacute;n del aspirante 
                                (1 p&aacute;gina m&aacute;ximo)</font></li>
                            <li><font color="#000000" >Hoja de vida resumida (2 p&aacute;ginas m&aacute;ximo 
                                y sin anexos)</font></li>
                            <li><font color="#000000" >Fotocopia del documento de identidad ampliada 
                                al 150%.</font></li>
                            <li><font color="#000000" >Fotocopia de la tarjeta profesional de ingeniero 
                                o certificado de que se encuentra en tr&aacute;mite</font></li>
                            <li><font color="#000000" >Fotocopia legible del diploma o del acta de 
                                grado que acredite el grado profesional del aspirante</font></li>
                            <li><font color="#000000" > Fotocopia del certificado de notas de las 
                                calificaciones de pregrado que incluya el promedio de la carrera.</font></li>
                            <li><font color="#000000" >Dos cartas de recomendaci&oacute;n <a href="ReferenciasPos">ver formato 
                                    aqu&iacute;</a>, preferiblemente de profesores del &aacute;rea o jefes 
                                inmediatos. </li>
                            <li><font color="#000000" >Fotocopia de Libreta Militar</li>
                            <li><font color="#000000" >Fotocopia del Carn&eacute; de EPS</li>
                            <li><font color="#000000" >Fotocopia de Soporte de Pago de Preinscripci&oacute;n</li>
                            <li><font color="#000000" >Escrito de Motivaci&oacute;n de máximo dos hojas en el que se proporcione evidencia sobre:</li>
                            <ol style="list-style-type: lower-alpha; padding-bottom: 0;">
                                <li style="margin-left:2em"><font color="#000000">Área de conocimiento y línea de investigación de interés del doctorado. Describir qué actividades realizadas en esta área lo han motivado a realizar el doctorado y cómo se ha preparado.</li>
                                <li style="margin-left:2em"><font color="#000000">Alineación del tema de investigación que espera desarrollar con las líneas de los grupos de la Escuela.</li>
                                <li style="margin-left:2em"><font color="#000000">Contar con el aval de los directores de los grupos a los cuales pertenecen las líneas de investigación.</li>
                                <li style="margin-left:2em"><font color="#000000">Contar con el aval del profesor que lo apoyó en la propuesta.</li>
                            </ol>
                            <li><font color="#000000" >Propuesta de investigación que detalle objetivos científicos, metodología de trabajo, resultados esperados, recursos físicos y financieros, cronograma de actividades y plan de financiación</li>
                            <li><font color="#000000" >Soporte de publicaciones científicas, si las tiene.</li>
                            <li><font color="#000000" >Resultado del examen del idioma inglés (según clasificación del Marco Común Europeo), Toefl, Michigan, Oxford o Ielts. Vigencia inferior de dos años.</li>
                            <li><font color="#000000" >Examen institucional de conocimientos y competencias.</li>
                            <li><font color="#000000" >Información sobre la financiación del programa doctoral.</li>
                        </ul>
                        <p>
                            <!--Especializacion en GESTION DE INFORMACION -->
                        </p>
                        <ol class="formuCorrecto" start="2">
                            <li> Presentaci&oacute;n de entrevista</li>
                        </ol>
                        <ul class="formuCorrecto">
                            <li>El Comit&eacute; del Programa estudiar&aacute; cada solicitud, y si
                                lo encuentra necesario, citar&aacute; a los candidatos a entrevista
                                <%=cronograma.elementAt(8)%> para lo cual podr&aacute; consultar con el n&uacute;mero
                                de su documento de identidad en la P&aacute;gina Web del programa de <b> &quot;<%=programa%>&quot;</b>, la fecha, hora y el lugar de las mismas.

                            <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de
                                    selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Página
                                Web del programa de &quot;<b><%=programa%>&quot;, </b> a partir del d&iacute;a <%=cronograma.elementAt(10)%><font color="#000000">,
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento
                                de identidad</font>.</li>
                        </ul>
                        <p>Nota: Informaci&oacute;n adicional en la Direcci&oacute;n de Posgrados,
                            
                        <%if (plan.equals("352")) {%>
                        e-mail: <a href="mailto:posgrados@escuelaing.edu.co">posgrados@escuelaing.edu.co</a><br>
                        <%}%>
                        </td>
                        </tr>
                    </table><br>
                </div>
            </div>
        </div>
        <table width="90%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td><form>
                        <p align="center">
                        <center>
                            <INPUT type=button class="btn btn primary" name=print value="Imprimir" onClick="javascript:window.print()">
                            &nbsp;&nbsp;
                            <input type="button" class="btn btn primary" value="Cerrar ventana" onclick="window.close()">
                        </center>
                        </p>
                    </form></td>
            </tr>
        </table>


    </body>
</html>