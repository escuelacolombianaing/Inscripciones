<%-- 
    Document   : Valida
    Created on : 3/03/2016, 03:17:21 PM
    Author     : Lucero
--%><%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
try{
String titulo = new String("");
        titulo = "Cargue Documentación Posgrado";
        configeci.configuracion confEci = new configeci.configuracion();
        response.setHeader("Cache-Control", "no-cache");

        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        int ban = 0;
        String tipoest = request.getParameter("tipoest");
        String plan = request.getParameter("plan");
//Convertir el dato String a Date para compararlo mas adelante.
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String fechaActual = formatter.format(hoy);%>
   
   <% String tipo= request.getParameter("tipo");%>
    
<html>
    <head>
        <%if(plan!=null&&plan.equals("352")){%>
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
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Cargar Documentación Posgrado</title>
        <%}%>
    </head>
    <body>
        <%if(plan!=null&&plan.equals("352")){%>
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
        <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        <%}%>
       

        <form action="DocumentacionPosgrados?on=n&spath=spath&plan=<%=plan%>" method="POST" name="formvrp" id="formvrp">
<input type="hidden" name="tipo"  value="<%=tipo%>">
<center>
  <table border="0" cellpadding="0" cellspacing="2" width="50%" align="center" class="textocom">
      <tr> 
        <td colspan="3"> 
          <p align="center" ><b><font color="#000000" size="2">&iexcl;Bienvenido 
            al env&iacute;o EN LINEA de documentos!<br>
            Es f&aacute;cil, seguro y puede hacerlo usted mismo<br>
            Sin gastar tiempo en desplazamientos o haciendo filas.</font></b></p>
          <p align="center" ><font color="#990000"><b><font size="3">Despu&eacute;s 
            de cargar sus documentos, puede verificar el estado al siguiente d&iacute;a 
            h&aacute;bil despu&eacute;s de la 1:00 p.m.</font></b></font><font size="3"><br>
            </font> </p>
          <blockquote>
            <p><font color="#000000" size="2">Por este v&iacute;nculo o link debe 
              enviar &uacute;nicamente los documentos de admisi&oacute;n, que 
              son:<br>
              </font> </p>
            <ul>
              <li><font color="#000000" size="2">Formulario impreso con fotografía 
                a color 3x4cm.</font></li>
              <li><font color="#000000" size="2">Carta de presentaci&oacute;n 
                del aspirante (1 p&aacute;gina m&aacute;ximo)</font></li>
              <li><font color="#000000" size="2">Hoja de vida resumida (2 p&aacute;ginas 
                m&aacute;ximo y sin anexos)</font></li>
              <li><font color="#000000" size="2">Fotocopia del documento de identidad 
                ampliada al 150%.</font></li>
              <li><font color="#000000" size="2">Fotocopia de la tarjeta profesional 
                de ingeniero o certificado de que se encuentra en tr&aacute;mite</font></li>
              <li><font color="#000000" size="2">Fotocopia legible del diploma 
                o del acta de grado que acredite el grado profesional del aspirante</font></li>
              <li><font color="#000000" size="2"> Fotocopia del certificado de 
                notas de las calificaciones de pregrado que incluya el promedio 
                de la carrera.<br>
                </font></li>
              <%if(plan!=null&&plan.equals("352")){%>
              <li><font color="#000000" size="2">Dos cartas de recomendaci&oacute;n <a href="ReferenciasPos">ver formato 
                        aqu&iacute;</a>, preferiblemente de profesores del &aacute;rea o jefes 
                    inmediatos. </li>
                <li><font color="#000000" size="2">Fotocopia de Libreta Militar</li>
                <li><font color="#000000" size="2">Fotocopia del Carn&eacute; de EPS</li>
                <li><font color="#000000" size="2">Fotocopia de Soporte de Pago de Preinscripci&oacute;n</li>
                <li><font color="#000000" size="2">Escrito de Motivaci&oacute;n de máximo dos hojas en el que se proporcione evidencia sobre:</li>
                <ol style="list-style-type: lower-alpha; padding-bottom: 0;">
                    <li style="margin-left:2em"><font color="#000000" size="2">Área de conocimiento y línea de investigación de interés del doctorado. Describir qué actividades realizadas en esta área lo han motivado a realizar el doctorado y cómo se ha preparado.</li>
                    <li style="margin-left:2em"><font color="#000000" size="2">Alineación del tema de investigación que espera desarrollar con las líneas de los grupos de la Escuela.</li>
                    <li style="margin-left:2em"><font color="#000000" size="2">Contar con el aval de los directores de los grupos a los cuales pertenecen las líneas de investigación.</li>
                    <li style="margin-left:2em"><font color="#000000" size="2">Contar con el aval del profesor que lo apoyó en la propuesta.</li>
                </ol>
                <li><font color="#000000" size="2">Propuesta de investigación que detalle objetivos científicos, metodología de trabajo, resultados esperados, recursos físicos y financieros, cronograma de actividades y plan de financiación</li>
                <li><font color="#000000" size="2">Soporte de publicaciones científicas, si las tiene.</li>
                <li><font color="#000000" size="2">Resultado del examen del idioma inglés (según clasificación del Marco Común Europeo), Toefl, Michigan, Oxford o Ielts. Vigencia inferior de dos años.</li>
                <li><font color="#000000" size="2">Examen institucional de conocimientos y competencias.</li>
                <li><font color="#000000" size="2">Información sobre la financiación del programa doctoral.</li>
              <%}%>
            </ul>
            <p><b><font color="#000000" size="2">PASOS PARA ENVIAR SUS DOCUMENTOS 
              DE ADMISION &quot;EN LINEA&quot;</font></b></p>
            <p><font color="#000000" size="2">1. Re&uacute;na todos los documentos 
              anteriores.<br>
              2. Escanee la totalidad de los documentos en formato PDF. Debe obtener 
              UN SOLO archivo de VARIAS PAGINAS.<br>
              3. Digite el n&uacute;mero del documento de identidad del aspirante, 
              sin puntos ni guiones<br>
              4. Ubique el archivo y env&iacute;elo </font><b><br>
              </b> </p>
              <br>
              <p>
                  <b>
                      <font color="#ff0000" size="3">
                      NOTA: Si el servicio de carge no le confirma el env&iacute;o de su archivo .pdf o falla, por favor env&iacute;e el archivo junto con sus datos de identificaci&oacute;n y el programa acad&eacute;mico al que se inscribi&oacute; al correo electr&oacute;nico: <a href="mailto:documentos@escuelaing.edu.co">documentos@escuelaing.edu.co</a>
                      </font>
                  </b>
              </p>
          </blockquote>
        </td>
    </tr>
    <tr  bgcolor="#F3F3F3"> 
      <td width="50%" height="38"><strong><font size="3">Documento Identidad&nbsp; 
        <br>
        (Sin puntos, ni comas ni guiones)&nbsp;</font></strong></td>
      <td width="50%" height="38"><strong> 
        <input type="text" name="doc" size="15" class="campotext">
        </strong>
     
        <input type="submit" value="Enviar" name="B1"  class="boton" onClick="javascript: return validar();">
</td>
    </tr>
    <tr > 
      <td colspan="2" height="38"> 
        <p align="center"><strong><font size="2"><b>TIPS para tener en cuenta:</b></font></strong></p>
        <ul>
          <li><font size="2">No env&iacute;e documentaci&oacute;n incompleta ya 
            que no se podr&aacute; iniciar el proceso<br>
            </font></li>
          <li><font size="2">El sistema s&oacute;lo acepta archivos en 
            formato PDF. <br>
            </font></li>
          <li><font size="2">Debe grabar UN SOLO ARCHIVO con la totalidad 
            de los documentos de admisi&oacute;n.<br>
            </font></li>
          <li><font size="2">Si env&iacute;a un documento a la vez, cada 
            nuevo archivo borrar&aacute; el archivo anterior. <br>
            </font></li>
          <li><font size="2">Al escanear h&aacute;galo preferiblemente 
            en tonos de grises.<br>
            </font></li>
          <li><font size="2">No le coloque claves o contrase&ntilde;as a los archivos<br>
            </font></li>
          <li><font size="2">Si tiene sus documentos en otros formatos 
            (JPG, TIFF) usted mismo puede convertirlos a PDF r&aacute;pida y gratuitamente:</font>
            <ul>
              <li><font size="2">Convertir un archivo cualquiera en un 
                archivo PDF: http://pdfcreator.uptodown.com/ <br>
                </font></li>
              <li><font size="2">Convertir varios archivos en un s&oacute;lo 
                PDF: http://www.ilovepdf.com/es/ </font></li>
              <li><font size="2"> Para visualizar archivos PDF necesita 
                tener instalado Adobe Reader: http://get.adobe.com/es/reader/ 
                </font><b><br>
                </b> </li>
            </ul>
          </li>
        </ul>
      
  </table>
</center>
  <div align="center"><center>
      <p>&nbsp;</p>
  </center></div>

</form>

    </body>
</html>

<%
            } catch (Exception e) {
                Correo correo = new Correo();
                correo.enviar("Valida en Inscripciones", e.getMessage());
            }
%>
