<%-- 
    Document   : DocumentosPosgrado
    Created on : 18/04/2016, 09:17:50 AM
    Author     : Lucero
--%>

<%@page import="javax.print.Doc"%>
<%@page import="utiles.Correo"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDdocumentacion" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    String docEst="";
    String idPlanDoc="";
    String idplan="";
    try {
        docEst = request.getParameter("doc");
        //Este parametro solo existe si es una consulta para el Doctorado en Ingeniería
        idPlanDoc = request.getParameter("idplan");
        PrintWriter oout = response.getWriter();
        BDdocumentacion bd = new BDdocumentacion();
        configeci.configuracion confEci = new configeci.configuracion();
        HttpSession sesion;
        sesion = request.getSession(true);
        if (docEst != null && !docEst.equals("")) {
            Vector consulta;
            
            if(idPlanDoc!=null && idPlanDoc.equals("352")){
                consulta = bd.ConsultaDocDoctorado(docEst, confEci.getPeriodo(), oout);
                idplan=idPlanDoc;
            }else{
                consulta = bd.ConsultaDocPosgrado(docEst, confEci.getPeriodo(), oout);
                if(!consulta.isEmpty()){
                    idplan = ((Vector) consulta.elementAt(0)).elementAt(6).toString();
                }
            }
            
            
            
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
        <title>Documentos Posgrado</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/tablas.css"/>
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
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Documentación Posgrado" />
        </jsp:include>
        <%}%>
        <%if ((consulta.size()) == 0) {%>
        <div align="center">Su documento es incorrecto o usted no formaliz&oacute;
            la solicitud de admisión para este programa académico.</div>

        <%  } else {%>
        <center>
        <table width="60%" border="3" align="center"  class="sortable" >
            <tr>
                <td colspan="3"><b>Aspirante:<%=((Vector) consulta.elementAt(0)).elementAt(0)%></b></td>
            </tr>
            <% String prog = "";
                
                if (idplan.equals("312")) {
                    prog = "ESPECIALIZACION EN ESTRUCTURAS";
                }

                if (idplan.equals("374")) {
                    prog = "ESPECIALIZACION EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
                }

                if (idplan.equals("267")) {
                    prog = "ESPECIALIZACION EN DISEÑO CONSTRUCCION Y CONSERVACION DE VIAS";
                }

                if (idplan.equals("313")) {
                    prog = "ESPECIALIZACION EN ECONOMIA PARA INGENIEROS";
                }

                if (idplan.equals("370")) {
                    prog = "ESPECIALIZACIÓN EN GESTIÓN INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE";
                }

                if (idplan.equals("310")) {
                    prog = "ESPECIALIZACION EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
                }

                if (idplan.equals("309")) {
                    prog = "ESPECIALIZACION EN SANEAMIENTO AMBIENTAL";
                }
                if (idplan.equals("324")) {
                    prog = "ESPECIALIZACION EN TELEMATICA APLICADA A NEGOCIOS";
                }
                if (idplan.equals("285")) {
                    prog = "ESPECIALIZACION EN PROCESAMIENTO DE POLIMEROS";
                }
                if (idplan.equals("320")) {
                    prog = "ESPECIALIZACION EN INGENIERIA DE FUNDACIONES";
                }
                if (idplan.equals("373")) {
                    prog = "ESPECIALIZACION EN GERENCIA DE OPERACIONES";
                }
                if (idplan.equals("290")) {
                    prog = "MAESTRIA EN INGENIERIA CIVIL";
                }
                if (idplan.equals("291")) {
                    prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN INGENIERIA ESTRUCTURAL";
                }
                if (idplan.equals("292")) {
                    prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN INGENIERIA AMBIENTAL";
                }
                if (idplan.equals("293")) {
                    prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN GEOTECNIA- MODALIDAD DE PROFUNDIZACIÓN";
                }
                if (idplan.equals("294")) {
                    prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN TRANSITO Y TRANSPORTE - MODALIDAD DE PROFUNDIZACIÓN";
                }
                if (idplan.equals("353")) {
                    prog = "MAESTRIA EN GESTIÓN DE INFORMACIÓN";
                }
                if (idplan.equals("321")) {
                    prog = "MAESTRÍA EN INGENIERÍA ELECTRÓNICA";
                }
                if (idplan.equals("351")) {
                    prog = "MAESTRÍA EN  DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
                }
                if (idplan.equals("330")) {
                    prog = "MAESTRÍA EN  INGENIERIA INDUSTRIAL";
                }
                if (idplan.equals("352")) {
                    prog = "DOCTORADO EN INGENIERÍA";
                }
                if (idplan.equals("336")) {
                    prog = "MAESTRÍA EN  INGENIERÍA ELÉCTRICA";
                }
                if (idplan.equals("371")) {
                    prog = "MAESTRÍA EN INFORMÁTICA";
                }
                if (idplan.equals("372")) {
                    prog = "MAESTRÍA EN CIENCIAS ACTUARIALES";
                }
                if (idplan.equals("376")) {
                    prog = "MAESTRÍA EN CIENCIA DE DATOS MODALIDAD DE PROFUNDIZACIÓN";
                }
                if (idplan.equals("377")) {
                    prog = "MAESTRÍA EN CIENCIA DE DATOS MODALIDAD DE INVESTIGACIÓN";
                }

            %>
            <br>
            <br>
            <p>
            <tr>
                <td colspan="3">
                    <p><b>Programa:<%=prog%></b></p>
                    <p>&nbsp;</p>
                </td>
            </tr>
            <tr>
                <td width="25%"><b>Documentos para la Admisi&oacute;n</b></td>
                <td width="10%"><b>Estado</b></td>
                <td width="25%"><b>Observaciones</b></td>
            </tr>
            <%if(idplan!=null&&idplan.equals("352")){%>
            <%String tipo = "";
                String estado = "";
                //iniciamos el for en 1 para quitar el recibo de pago de inscripcion solicitado por marcela quevedo
                for (int i = 1; i < consulta.size(); i++) {
                    Vector dato = (Vector) consulta.elementAt(i);
                    tipo = (dato.elementAt(5).toString());
                    estado = (dato.elementAt(3).toString());
            %>
            <tr>
                <td width="25%"><%=dato.elementAt(2)%></td>

                <%if (estado.equals("N")) {%>
                <td width="10%">Sin recibir</td>
                <%} else {%>
                <td width="10%">Recibido </td>

                <%}%>
                <td width="25%"><%=dato.elementAt(4)%> </td>
            </tr>

            <%}%>
            <%}else{%>
            <%  String tipo = "";
                String estado = "";
                //iniciamos el for en 1 para quitar el recibo de pago de inscripcion solicitado por marcela quevedo
                for (int i = 1; i < 4; i++) {
                    Vector dato = (Vector) consulta.elementAt(i);
                    tipo = (dato.elementAt(5).toString());
                    estado = (dato.elementAt(3).toString());
            %>
            <tr>
                <td width="25%"><%=dato.elementAt(2)%></td>

                <%if (estado.equals("N")) {%>
                <td width="10%">Sin recibir</td>
                <%} else {%>
                <td width="10%">Recibido </td>

                <%}%>
                <td width="25%"><%=dato.elementAt(4)%> </td>
            </tr>

            <%}%>  
            <%for (int i = 5; i < 7; i++) {
                    Vector dato = (Vector) consulta.elementAt(i);
                    tipo = (dato.elementAt(5).toString());
                    estado = (dato.elementAt(3).toString());
            %>
            <tr>
                <td width="25%"><%=dato.elementAt(2)%></td>

                <%if (estado.equals("N")) {%>
                <td width="10%">Sin recibir</td>
                <%} else {%>
                <td width="10%">Recibido </td>

                <%}%>
                <td width="25%"><%=dato.elementAt(4)%> </td>
            </tr>

            <%}%>  
            
             <%
            Vector dato = (Vector) consulta.elementAt(8);
                    tipo = (dato.elementAt(5).toString());
                    estado = (dato.elementAt(3).toString());
            %>
            <tr>
                <td width="25%"><%=dato.elementAt(2)%></td>

                <%if (estado.equals("N")) {%>
                <td width="10%">Sin recibir</td>
                <%} else {%>
                <td width="10%">Recibido </td>

                <%}%>
                <td width="25%"><%=dato.elementAt(4)%> </td>
            </tr>
            <%
            Vector datos = (Vector) consulta.elementAt(11);
                    tipo = (datos.elementAt(5).toString());
                    estado = (datos.elementAt(3).toString());
            %>
            <tr>
                <td width="25%"><%=datos.elementAt(2)%></td>

                <%if (estado.equals("N")) {%>
                <td width="10%">Sin recibir</td>
                <%} else {%>
                <td width="10%">Recibido </td>

                <%}%>
                <td width="25%"><%=dato.elementAt(4)%> </td>
            </tr>
            <%}%>
            
            
        </table>
        </center>

        <p>&nbsp;</p>
        <p>
    <center>
    </center>
    <p align="left"><br>
        <%}
                }%>
    </body>
</html>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Documentos Posgrado", e.getMessage()+" Tipo: "+e.getClass().getCanonicalName()+" Doc de Estudiante: "+docEst+" Plan:"+idplan);
    }
%>