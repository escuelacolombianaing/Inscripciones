<%-- 
    Document   : referenciaDoctorado
    Created on : 3/04/2018, 11:01:06 AM
    Author     : andres.rojas
--%>

<%@page import="BDatos.BDadmisiones"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="configeci.configDoctorado"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <%
        configDoctorado configDoct=new configDoctorado();
        String idplan = configDoct.getIdPlan();
        
        String idPrograma = configDoct.getIdPrograma();
        PrintWriter oout = response.getWriter();
        int ban = 1;
    %>

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
            function comprueba( ) {
            var valor;
            var ind = document.form1.prog.selectedIndex;
            if (document.forms.form1.prog.options[ind].value == '0') {
            alert("Usted debe seleccionar algún programa académico");
            return false;
            }

            if (document.forms.form1.apellido1.value == '') {
            alert("Los apellidos del aspirante no puede estar en blanco");
            return false;
            }

            if (document.forms.form1.apellido2.value == '') {
            alert("Los apellidos del aspirante no puede estar en blanco");
            return false;
            }

            if (document.forms.form1.nom.value == '') {
            alert("El nombre del aspirante no puede estar en blanco");
            return false;
            }
            if (isNaN(document.forms.form1.tel.value) || (document.forms.form1.tel.value == '')) {
            alert("Falta la información telefónica o el dato no es numérico");
            return false;
            }

            if (document.forms.form1.tel.value.length < 7) {
            alert("El número telefónico no es correcto, por favor verifiquelo.");
            document.form1.tel.style.backgroundColor = '#ffcc00';
            return false;
            }

            if (document.forms.form1.ciudad.value == '') {
            alert("Usted debe proporcionar la ciudad de donde es el número telefónico.");
            return false;
            }

            if (isNaN(document.forms.form1.doc.value) || (document.forms.form1.doc.value == '')) {
            alert("El documento de identidad no puede estar en blanco y debe ser dato numérico");
            return false;
            }

            if (document.forms.form1.numreg.value == '') {
            alert("El Título Profesional no puede estar en blanco");
            return false;
            }

            valor = document.forms.form1.ema.value;



            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)) {
            return (true);
            } else {
            alert("Error: Por favor ingrese una dirección de correo válida");
            return (false);
            }



            return true;
            }

            function convertTildes(str) {
            var out = "", flag = 0;
            for (i = 0; i < str.length; i++) {
            if ((str.charAt(i) != "í") && (str.charAt(i) != "á") && (str.charAt(i) != "é") && (str.charAt(i) != "ó") && (str.charAt(i) != "ú")
            && (str.charAt(i) != "Á") && (str.charAt(i) != "É") && (str.charAt(i) != "Í") && (str.charAt(i) != "Ó") && (str.charAt(i) != "Ú")) {
            out += str.charAt(i);
            flag = 0;
            }
            else {
            if ((flag == 0) && (str.charAt(i) == "í")) {
            out += "i";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "á")) {
            out += "a";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "é")) {
            out += "e";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "ó")) {
            out += "o";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "ú")) {
            out += "u";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "Á")) {
            out += "A";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "É")) {
            out += "E";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "Í")) {
            out += "I";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "Ó")) {
            out += "O";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "Ú")) {
            out += "U";
            flag = 1;
            }
            }
            }
            return out;
            }
        </SCRIPT>

        <script language="JavaScript" type="text/JavaScript">
            <!--
            function ventanaSecundaria (URL){
            window.open(URL,"","width=850,height=750,scrollbars=no,top=100,left=100")
            }
            //-->
        </script>
    </head>

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



        <%if (ban == 0) {
                out.println("<b><center>Las inscripciones para este programa sólo se habilitarán en las fechas programadas.<center></b>");

            } else {%>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-10">
                    <center>
                    <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td> <fieldset><legend class="textocom"><strong>Solicitud de n&uacute;mero
                                            de referencia de pago para hacer la inscripci&oacute;n a Doctorado en Ingenier&iacute;a. </strong>
                                    </legend><div align="center">
                                        <p align="center" class="textocom">Para inscribirse al programa de Doctorado en Ingenier&iacute;a de la Escuela Colombiana de Ingenier&iacute;a Julio Garavito por
                                            favor diligencie estos datos b&aacute;sicos, y tome nota del n&uacute;mero
                                            de referencia de pago de los derechos de inscripci&oacute;n que el sistema
                                            le indicar&aacute; una
                                            vez los haya enviado.</p>
                                        
                                        <p align="center" class="textocom">
                                            Los campos marcados con un asterisco (<b><font color=#ff0000>*</font></b>)
                                            son campos obligatorios
                                            </td>
                                            </tr>
                                            </table>
                    </center>
                    
                    
                    
                                        <p>
                                        <div class="col-lg-2"></div>
                                        <div class="col-md-8">
                                        <form action="CapturaRefDoctorado" method="post" onSubmit="return comprueba( );" name="form1" id="form1">
                                            <center>
                                                    
                                                    <div class="contenido">
                                                        <div class="form-group espaciado">
                                                            <div align="left"><strong><b><font color="#CC0033">*</font></b>Primer Apellido del Aspirante</strong></div>
                                                            <strong>
                                                                <input type="text"  onBlur="this.value = convertTildes(this.value);" class="form-control" name="apellido1" size="14" maxlength="14">
                                                            </strong>
                                                        </div>
                                                    </div>
                                                    <div class="contenido">
                                                        <div class="form-group espaciado">
                                                            <div align="left"><strong><b><font color="#CC0033">*</font></b>Segundo Apellido del Aspirante</strong>
                                                                <strong>
                                                                    <input type="text" onBlur="this.value = convertTildes(this.value);" class="form-control" name="apellido2" size="14" maxlength="14">
                                                                </strong>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="contenido">
                                                        <div class="form-group espaciado">
                                                            <div align="left"><strong><b><font color="#CC0033">*</font> Nombre(s) del aspirante &nbsp;</b></strong>
                                                                <strong>
                                                                    <input type="text" onBlur="this.value = convertTildes(this.value);" class="form-control" name="nom" size="28" maxlength="28">
                                                                </strong>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <br>
                                                    <div class="contenido">
                                                        <div class="form-group espaciado">
                                                            <div align="left"><strong><p><b><font color="#CC0033">* </font>Teléfono</b></p></strong>
                                                                <strong>
                                                                    <input type="text" class="form-control" name="tel" size="12"  >
                                                                </strong>
                                                            </div>
                                                            <div align="left"><strong><p><b>de ciudad</b></p></strong>
                                                                <strong>
                                                                    <input type="text" class="form-control" name="ciudad" size="15" maxlength="15">
                                                                </strong>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="contenido">
                                                        <div class="form-group espaciado">
                                                            <div align="left"><strong><p><b><font color="#CC0033">* </font>Teléfono de oficina</b></p></strong>
                                                                <strong>
                                                                    <input type="text" class="form-control" name="tel_ofi" size="12"  >
                                                                </strong>
                                                                <strong><p><b>de ciudad</b></p></strong>
                                                                <strong>
                                                                    <input type="text" class="form-control" name="ciudadofi" size="15" maxlength="15"  >
                                                                </strong>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="contenido">
                                                        <div class="form-group espaciado">
                                                            <div align="left"><b><font color="#CC0033">*</font></b><strong>Celular </strong>
                                                                <strong>
                                                                    <input type="text" class="form-control" name="numreg1" size="15" maxlength="15">
                                                                </strong>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="contenido">
                                                        <div class="form-group espaciado">
                                                            <div align="left"><b><font color="#CC0033">*</font></b><strong>Direcci&oacute;n&nbsp; Electr&oacute;nica</strong>
                                                                <strong>
                                                                    <input name="ema" type="text" class="form-control" size="50" maxlength="50">
                                                                </strong>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="contenido">
                                                        <div class="form-group espaciado">
                                                            <div align="left"><strong><font color="#CC0033">*</font> Documento
                                                                Identidad&nbsp; <br>
                                                                (Sin puntos, ni comas ni guiones)&nbsp;</strong>
                                                                <strong>
                                                                    <input type="text" class="form-control" name="doc" size="12" maxlength="12">
                                                                </strong>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="contenido">
                                                        <div class="form-group espaciado">
                                                            <div align="left"><b><font color="#CC0033">*</font></b><strong>Tipo de Documento: &nbsp; </strong>
                                                                <strong>
                                                                    <select name="tip_doc" id='tip_doc' size='1' class="form-control">
                                                                        <option value="null" selected>Seleccione</option>
                                                                        <option value="TI">TI 
                                                                        <option value="CC">CC 
                                                                        <option value="CE">CE 
                                                                        <option value="PC">Pasaporte Colombiano 
                                                                        <option value="PE">Pasaporte Extranjero 
                                                                        <option value="CR">Contraseña Registraduría
                                                                    </select>
                                                                </strong>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <div class="contenido">
                                                        <div class="form-group espaciado">
                                                            <div align="left"><b><font color="#CC0033">*</font> T&iacute;tulo Profesional</b>
                                                                <strong>
                                                                    <input type="text" class="form-control" name="numreg" maxlength="50" size="50">
                                                                </strong>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                            </center>
                                            <input type="hidden" name="tipoest" value="P">
                                            <input type="hidden" name="prog" value="<%=idplan%>">
                                            <div class="row">
                                                <div class="col-xs-12 col-md-3"></div>
                                                <div class="col-xs-12 col-md-7">
                                                    <div align="right" class="submit">
                                                        <input class="btn btn primary" type="submit" value="Enviar Datos" />
                                                    </div>
                                                </div>

                                            </div>
                                        </form>
                                    
                                    </div>
                                    </div>
                                    </div>
                                    <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                                    </div>
                                    </div>
                                    <%}%>
                                    </body>
</html>
