<%-- 
    Document   : MensajeCorrectoCampusDay
    Created on : 19/10/2018, 04:22:56 PM
    Author     : andres.rojas
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%
    String refer= request.getParameter("ref");
    String apellido1= request.getParameter("apellido1");
    String apellido2= request.getParameter("apellido2");
    String nombre= request.getParameter("nombre");
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Campus Day Escuela</title>

	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="shortcut icon" type="image/x-icon" href="html/CampusDay/CampusDayFiles/img/favicon.ico">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
	<link rel="stylesheet" href="html/CampusDay/CampusDayFiles/css/estilos-campusdayformulario.css">
	<meta name="keywords" content="Campus Day Escuela – Campus Day – Campus – Escuela de Ingenieros Campus – Campus Escuela – Escuela de Ingenieros Campus Day – ECI Campus Day – Campus Day ECI – Campus Day Bogotá – Campus Day Bogotá 2018 – Campus Day 2018 – Escuela Campus Day 2018 – Gran Evento Campus – Gran Evento Campus Day 2018 – Escuela de Ingeniería Campus Day – Julio Garavito Campus Day – Julio Garavito Campus – Open Day – Open Day Escuela – Open Day Escuela de ingeniería – Escuela de Ingeniería Open Day 2018 – Campo Day – Campo Day Escuela – Campus Day Gratis – Campus Day Escuela Gratis – Estudiar Ingeniería – Ingenierías en Bogotá – Quiero estudiar ingeniería – Donde estudiar ingeniería">
	<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=11; IE=10; IE=EmulateIE10; IE=9; IE=EmulateIE9; IE=8; IE=EmulateIE8; IE=7; IE=EmulateIE7; IE=5" >
	<meta http-equiv="Content-Language" content="ES" />
	<meta name="language" content="spanish" />
	<meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito Julio Garavito" />
	<meta name="copyright" content="Copyright (c) 2018" />
	<meta name="description" content="Obtén tu ingreso gratis este 27 de octubre desde las 8AM. Ven con tus padres y conoce las Ingenierías que tenemos para ofrecerte." />
	<meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito Julio Garavito - Vuelve a casa"/>
	<link href="html/CampusDay/CampusDayFiles/css/validationEngine.jquery.css" type="text/css" media="screen" rel="stylesheet" />
        <style>
            input[type=number]::-webkit-outer-spin-button,
            input[type=number]::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            input[type=number] {
                -moz-appearance:textfield;
            }
        </style>
</head>
<body>

	<section class="intro">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<center><img src="html/CampusDay/CampusDayFiles/img/logo-campusday.png" class="img-responsive" alt="logo campus day escuela"></center>
				</div>
				
                            
                                
				<div class="col-sm-9">
            <h3>
                Estimado(a) aspirante <%=(nombre+" "+apellido1+" "+apellido2)%>,
                Usted ha sido preinscrito satisfactoriamente tome nota de su número de referencia: <b><%=refer%></b>. Usted puede diligenciar su formulario de admisión <a href="SolicitudAdm?tipoest=N">aquí</a>.
                <br>
                Si no va a diligenciar su formulario de admisión en este momento, recuerde que puede hacerlo después en la sección de admisiones de la página principal de la Escuela Colombiana de Ingeniería Julio Garavito.
            </h3>
                	</div>
			</div>
		</div>
	</section>  	


	<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-5 col-md-5">
					<strong><a href="https://www.escuelaing.edu.co/uploads/descargables/2810_politica_para_el_tratamiento_de_datos_personales.pdf" target="_blank">Recolección y autorización para el manejo de datos personales</a></strong><br>
					<strong>Escuela Colombiana de Ingeniería Julio Garavito</strong> <br>
					Ak 45 No. 205 - 59 Autopista Norte, costado occidental. <br>
					Contact Center: 57(1) 668 3600 <br>
					Línea Nacional Gratuita: 018000112668 <br>
					www.escuelaing.edu.co <br>
					Bogotá - Colombia <br><br>

					<small>
						Personería Jurídica 086 de enero 19 de 1973. <br>
						Acreditación institucional de alta calidad. <br>
						Res. 20273 del 27 de noviembre de 2014. (Vigencia 4 años). <br>
						Vigilada Mineducación.
					</small><br><br>

					<small>© Dirección de Mercadeo y Comunicaciones Internas</small><br><br>
				</div>

				<div class="col-sm-7 col-md-7">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3975.9262331134787!2d-74.04478278578759!3d4.78267549652671!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f85e32ae0ca4b%3A0x5edd4c74e8f7220c!2sESCUELA+COLOMBIANA+DE+INGENIER%C3%8DA+JULIO+GARAVITO!5e0!3m2!1ses!2ses!4v1479245437319" width="100%" height="260" frameborder="0" style="border:0" allowfullscreen></iframe>
				</div>

			</div>
		</div>
	</footer>





	<!--SCRIPT BOOTSTRAP--> 
	<script src="html/CampusDay/CampusDayFiles/js/jquery.js"></script>
	<script src="//code.jquery.com/jquery-latest.jS"></script>
	<script src="html/CampusDay/CampusDayFiles/js/bootstrap.min.js"></script>
	<script src="html/CampusDay/CampusDayFiles/js/main.js"></script>


	<script src="html/CampusDay/CampusDayFiles/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
	<script src="html/CampusDay/CampusDayFiles/js/jquery.validationEngine-es.js" type="text/javascript" charset="utf-8"></script>
	<script src="html/CampusDay/CampusDayFiles/js/custom.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>
