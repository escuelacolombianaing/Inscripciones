<%-- 
    Document   : FormuDoctorado
    Created on : 3/04/2018, 09:46:29 AM
    Author     : andres.rojas
--%>

<%@page import="configeci.configDoctorado"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
    configDoctorado configDoct=new configDoctorado();
    String idplan = configDoct.getIdPlan();
    String prog = "";
    BDadmisiones admision = new BDadmisiones();
    String ref = request.getParameter("ref");
    String doc = request.getParameter("doc");
    Vector ciud = admision.getCiudades();
    Vector pais = admision.getPaises();
    int i;
    Vector pginsc = admision.getInscrito(doc, ref);
    if(idplan.equals("352")){
        prog="DOCTORADO EN INGENIERIA";
    }
    if (pginsc.size() > 0) {

%>
<html lang="es">
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
<script language="JavaScript" type="text/JavaScript">
    <!--
    function verifica_fecha(fecha){
    if (fecha.length == 0 || fecha.length != 10 ){

    return false;
    }
    isplit = fecha.indexOf('-');
    if (isplit != 2 || isplit == fecha.length){

    return false;
    }

    sDay = fecha.substring(0, isplit);
    isplit = fecha.indexOf('-', isplit + 1);


    if (isplit == -1 || (isplit + 1 ) == fecha.length){

    return false;
    }

    sMonth = fecha.substring((sDay.length + 1), isplit);
    sYear = fecha.substring(isplit + 1);

    return true;
    }

    function comprueba( ){

    /**
    var indice = document.form1.campo1.selectedIndex;
    */
    var in1 = document.form1.campo26.selectedIndex;
    var in2 = document.form1.campo30.selectedIndex;
    var in3 = document.form1.campo31.selectedIndex;
    var in4 = document.form1.campo36.selectedIndex;
    var in5 = document.form1.campo10.selectedIndex;;
    var valor;

    if ( document.form1.campo12.value == 'null' ) {
    alert("Debe seleccionar un tipo de Documento de identidad");
    document.form1.campo12.style.backgroundColor= '#ffcc00';
    return false;
    }

    /**
    if ( document.forms.form1.campo1.options[indice].value == 'N') {
    alert("Usted debe seleccionar el programa al cual aspira.");
    document.form1.campo1.style.backgroundColor= '#ffcc00';
    return false;
    }
    */


    if  (document.forms.form1.campo2.value == '')  {
    alert("Los campos de Apellidos y Nombres no pueden estar en blanco");
    document.form1.campo2.style.backgroundColor= '#ffcc00';
    return false;
    }

    indice = document.getElementById("campo4").selectedIndex;
    if( indice == null || indice == 0 ) {
    alert("Usted debe seleccionar la CIUDAD de nacimiento");
    return false;
    }

    indice = document.getElementById("campo10").selectedIndex;
    if( indice == null || indice == 0 ) {
    alert("Usted debe seleccionar el PAIS de nacimiento");
    return false;
    }


    if ( document.forms.form1.campo5.value == "null") {
    alert("Usted debe seleccionar el día de nacimiento");
    document.form1.campo5.style.backgroundColor= '#ffcc00';
    return false;
    }



    if ( document.forms.form1.campo6.value == "null") {
    alert("Usted debe seleccionar un mes de nacimiento");
    document.form1.campo6.style.backgroundColor= '#ffcc00';
    return false;
    }

    if ( isNaN(document.forms.form1.campo7.value ) ) {
    alert("El año de nacimiento debe ser dato numérico");
    document.form1.campo7.style.backgroundColor= '#ffcc00';
    return false;
    }


    if (document.forms.form1.campo7.value == ''){
    alert("Debe digitar el año de nacimiento");
    document.form1.campo7.style.backgroundColor= '#ffcc00';
    return false;
    }

    if (document.forms.form1.campo7.value.length != 4) {
    alert("El año de nacimiento no es correcto, recuerde es de cuatro digitos");
    document.form1.campo7.style.backgroundColor= '#ffcc00';
    return false;
    }


    if (document.forms.form1.campo7.value > 2018){
    alert("Por favor verifique el año de nacimiento");
    return false;
    }

    if ( document.forms.form1.campo20.value == "") {
    alert("Por favor ingrese la direción de correo electrónico");
    document.form1.campo20.style.backgroundColor= '#ffcc00';
    return false;
    }

    if ( document.forms.form1.campo8.value=='M' ) {
    if ( (document.forms.form1.libreta.value == "") || (document.forms.form1.distrito.value == "")) {
    alert("La información de Libreta Militar y Distrito NO pueden estar en blanco");
    document.form1.libreta.style.backgroundColor= '#ffcc00';
    return false;
    }
    }



    if ( isNaN(document.form1.campo11.value ) ) {
    alert("El documento de identidad debe ser un dato numérico");
    document.form1.campo11.style.backgroundColor= '#ffcc00';
    return false;
    }




    if ( document.forms.form1.campo14.value == '' || document.forms.form1.campo15.value == '') {
    alert("Los campos de dirección y teléfono de residencia no deben estar en blanco");
    document.form1.campo14.style.backgroundColor= '#ffcc00';
    return false;
    }

    if ( isNaN(document.forms.form1.campo15.value ) ) {
    alert("El número telefónico debe ser un dato numérico");
    document.form1.campo15.style.backgroundColor= '#ffcc00';
    return false;
    }


    if (document.forms.form1.campo15.value.length <  7) {
    alert("Por favor verifique el número de teléfono e ingrese un número válido.");
    document.form1.campo15.style.backgroundColor= '#ffcc00';
    return false;
    }

    if ( document.forms.form1.campo22.value == '' || document.forms.form1.campo23.value == '' || document.forms.form1.campo24.value == '') {
    alert("Los campos de nombre, dirección y teléfono de la persona a quien se puede contactar no deben estar en blanco");
    document.form1.campo22.style.backgroundColor= '#ffcc00';
    document.form1.campo23.style.backgroundColor= '#ffcc00';
    return false;
    }


    if (document.forms.form1.promedio.value == ''){
    alert("Debe digitar el promedio de la carrera.");
    document.form1.promedio.style.backgroundColor= '#ffcc00';
    return false;
    }

    // var ind11 = document.form1.campo16.selectedIndex;
    if ( document.form1.campo16.value == "") {
    alert("Usted debe seleccionar una ciudad de residencia");
    document.form1.campo16.style.backgroundColor= '#ffcc00';
    return false;
    }



    if ( isNaN(document.forms.form1.campo24.value ) ) {
    alert("Recuerde que el número telefónico debe ser un dato numérico");
    document.form1.campo24.style.backgroundColor= '#ffcc00';
    return false;
    }

    if (document.forms.form1.campo24.value.length <  7) {
    alert("Por favor verifique el número de teléfono e ingrese un número válido.");
    document.form1.campo24.style.backgroundColor= '#ffcc00';
    return false;
    }


    if (( document.forms.form1.campo26.options[in1].value == 'N' || document.forms.form1.pais.value == '' || document.forms.form1.campo27.value == '' || document.forms.form1.campo28.value == '' || document.forms.form1.campo29.value == '' || document.forms.form1.campo30.options[in2].value == 'N') )
    {
    alert("Los campos correspondientes a la informacion de estudios de pregrado no deben estar en blanco");
    document.form1.campo26.style.backgroundColor= '#ffcc00';
    document.form1.pais.style.backgroundColor= '#ffcc00';
    document.form1.campo27.style.backgroundColor= '#ffcc00';
    document.form1.campo28.style.backgroundColor= '#ffcc00';
    document.form1.campo29.style.backgroundColor= '#ffcc00';
    document.form1.campo30.style.backgroundColor= '#ffcc00';
    return false;
    }

    if ((document.forms.form1.campo26.options[in1].value != 'N')) {
    if ( isNaN(document.forms.form1.campo28.value ) ) {
    alert("El año de inicio de estudios universitarios de pregrado debe ser dato numérico");
    document.form1.campo28.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo28.value == ''){
    alert("Debe digitar el año de inicio de estudios universitarios de pregrado");
    document.form1.campo28.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo28.value.length != 4) {
    alert("El año de inicio de estudios universitarios de pregrado no esta correcto, recuerde es de cuatro digitos");
    document.form1.campo28.style.backgroundColor= '#ffcc00';
    return false;
    }
    if ( isNaN(document.forms.form1.campo29.value ) ) {
    alert("El año de finalización de estudios universitarios de pregrado debe ser dato numérico");
    document.form1.campo29.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo29.value == ''){
    alert("Debe digitar el año de finalización de estudios universitarios de pregrado");
    document.form1.campo29.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo29.value.length != 4) {
    alert("El año de finalización de estudios universitarios de pregrado no esta correcto, recuerde es de cuatro digitos");
    document.form1.campo29.style.backgroundColor= '#ffcc00';
    return false;
    }
    }

    if (document.forms.form1.campo31.options[in3].value != 'N') {

    if ( isNaN(document.forms.form1.campo33.value ) ) {
    alert("El año de inicio de estudios universitarios de posgrado debe ser dato numérico");
    document.form1.campo33.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo33.value == ''){
    alert("Debe digitar el año de inicio de estudios universitarios de posgrado");
    document.form1.campo33.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo33.value.length != 4) {
    alert("El año de inicio de estudios universitarios de posgrado no esta correcto, recuerde es de cuatro digitos");
    document.form1.campo33.style.backgroundColor= '#ffcc00';
    return false;
    }
    if ( isNaN(document.forms.form1.campo34.value ) ) {
    alert("El año de finalización de estudios universitarios de posgrado debe ser dato numérico");
    document.form1.campo34.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo34.value == ''){
    alert("Debe digitar el año de finalización de estudios universitarios de posgrado");
    document.form1.campo34.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo34.value.length != 4) {
    alert("El año de finalización de estudios universitarios de posgrado no esta correcto, recuerde es de cuatro digitos");
    document.form1.campo34.style.backgroundColor= '#ffcc00';
    return false;
    }
    if ( document.forms.form1.campo32.value == '' || document.forms.form1.campo35.value == '') {
    alert("Los campos de programa y grado obtenido en los estudios universitario de posgrado no deben estar en blanco");
    document.form1.campo32.style.backgroundColor= '#ffcc00';
    document.form1.campo35.style.backgroundColor= '#ffcc00';
    return false;
    }
    }


    if ((document.forms.form1.campo36.options[in4].value != 'N')) {

    if ( isNaN(document.forms.form1.campo38.value ) ) {
    alert("El año de inicio de estudios universitarios de posgrado debe ser dato numérico");
    document.form1.campo38.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo38.value == ''){
    alert("Debe digitar el año de inicio de estudios universitarios de posgrado");
    document.form1.campo38.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo38.value.length != 4) {
    alert("El año de inicio de estudios universitarios de posgrado no esta correcto, recuerde es de cuatro digitos");
    document.form1.campo38.style.backgroundColor= '#ffcc00';
    return false;
    }
    if ( isNaN(document.forms.form1.campo39.value ) ) {
    alert("El año de finalización de estudios universitarios de posgrado debe ser dato numérico");
    document.form1.campo39.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo39.value == ''){
    alert("Debe digitar el año de finalización de estudios universitarios de posgrado");
    document.form1.campo39.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo39.value.length != 4) {
    alert("El año de finalización de estudios universitarios de posgrado no esta correcto, recuerde es de cuatro digitos");
    document.form1.campo39.style.backgroundColor= '#ffcc00';
    return false;
    }
    if ( document.forms.form1.campo37.value == '' || document.forms.form1.campo40.value == '') {
    alert("Los campos de programa y grado obtenido en los estudios universitario de posgrado no deben estar en blanco");
    document.form1.campo37.style.backgroundColor= '#ffcc00';
    document.form1.campo40.style.backgroundColor= '#ffcc00';
    return false;
    }
    }

    if ((document.forms.form1.campo41.value != '')) {
    if (document.forms.form1.campo42.value == ''){
    alert("La fecha de inicio del tipo de experiencia no debe estar en blanco");
    document.form1.campo42.style.backgroundColor= '#ffcc00';
    return false;
    }
    if (document.forms.form1.campo43.value == ''){
    alert("La fecha de finalización del tipo de experiencia no debe estar en blanco");
    document.form1.campo43.style.backgroundColor= '#ffcc00';
    return false;
    }
    if ( document.forms.form1.campo44.value == '' || document.forms.form1.campo46.value == '' || document.forms.form1.campo47.value == '') {
    alert("La información correspondiente a la respectiva entidad de experiencia debe estar completa.");
    document.form1.campo44.style.backgroundColor= '#ffcc00';
    document.form1.campo46.style.backgroundColor= '#ffcc00';
    document.form1.campo47.style.backgroundColor= '#ffcc00';
    return false;
    }

    if ( !document.forms.form1.campo45[0].checked && !document.forms.form1.campo45[1].checked && !document.forms.form1.campo45[2].checked) {
    alert("Debe seleccionar el tipo de experiencia.");
    return false;
    }

    }

    if (document.forms.form1.campo64.value==''){
    alert("El campo de interés académico no pueden estar en blanco.");
    document.form1.campo64.style.backgroundColor= '#ffcc00';
    return false;
    }

    if ( (document.forms.form1.campo65.value=='' || document.forms.form1.campo66.value=='' || document.forms.form1.campo67.value=='' || document.forms.form1.campo68.value=='') &&
    (document.forms.form1.campo69.value=='' || document.forms.form1.campo70.value=='' || document.forms.form1.campo71.value=='' || document.forms.form1.campo72.value=='') &&
    (document.forms.form1.campo73.value=='' || document.forms.form1.campo74.value=='' || document.forms.form1.campo75.value=='' || document.forms.form1.campo76.value=='')){
    alert("Usted debe proporcionar por lo menos una referencia laboral o académica.");
    document.form1.campo65.style.backgroundColor= '#ffcc00';
    return false;
    }





    /*  if ( !document.forms.form1.campo77[0].checked && !document.forms.form1.campo77[1].checked && !document.forms.form1.campo77[2].checked && !document.forms.form1.campo77[3].checked &&
    !document.forms.form1.campo77[4].checked && !document.forms.form1.campo77[5].checked && !document.forms.form1.campo77[6].checked && !document.forms.form1.campo77[7].checked && !document.forms.form1.campo77[8].checked) {
    alert("Debe seleccionar un medio por el cual se entero del programa");
    return false;
    }*/

    if ( document.form1.campo77.value == "") {
    alert("Usted debe seleccionar el medio por el cual se enteró del programa");
    document.form1.campo77.style.backgroundColor= '#ffcc00';
    return false;
    }

    if ( !document.forms.form1.campo78[0].checked && !document.forms.form1.campo78[1].checked && !document.forms.form1.campo78[2].checked &&
    !document.forms.form1.campo78[3].checked && !document.forms.form1.campo78[4].checked && !document.forms.form1.campo78[5].checked) {
    alert("Debe seleccionar una forma de financiación");
    return false;
    }


    valor = document.form1.campo20.value;

    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)){
    return (true);
    } else {
    alert("Error: Por favor ingrese una direccion de correo válida");
    return (false);
    }



    return true;
    }


    function convertTildes(str) {
    var out = "", flag = 0;
    for (i = 0; i < str.length; i++) {
    if ((str.charAt(i)!="í") && (str.charAt(i)!="á") && (str.charAt(i)!="é") && (str.charAt(i)!="ó") && (str.charAt(i)!="ú")
    && (str.charAt(i)!="Á") && (str.charAt(i)!="É") && (str.charAt(i)!="Í") && (str.charAt(i)!="Ó") && (str.charAt(i)!="Ú") && (str.charAt(i)!="à") && (str.charAt(i)!="è") && (str.charAt(i)!="ì") && (str.charAt(i)!="ò") && (str.charAt(i)!="ù") 
    && (str.charAt(i)!="À") && (str.charAt(i)!="È") && (str.charAt(i)!="Ì") && (str.charAt(i)!="Ò") && (str.charAt(i)!="Ù") && (str.charAt(i)!="ä") && (str.charAt(i)!="ë") && (str.charAt(i)!="ï") && (str.charAt(i)!="ö") && (str.charAt(i)!="ü")
    && (str.charAt(i)!="Ä") && (str.charAt(i)!="Ë") && (str.charAt(i)!="Ï")  && (str.charAt(i)!="Ö") && (str.charAt(i)!="Ü") )  {
    out += str.charAt(i);
    flag = 0;
    }

    else {
    if((flag == 0) && (str.charAt(i)=="í")){
    out += "i";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="á")){
    out += "a";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="é")){
    out += "e";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="ó")){
    out += "o";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="ú")){
    out += "u";
    flag = 1;
    }

    if((flag == 0) && (str.charAt(i)=="ì")){
    out += "i";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="à")){
    out += "a";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="è")){
    out += "e";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="ò")){
    out += "o";
    flag = 1;                   
    }
    if((flag == 0) && (str.charAt(i)=="ù")){
    out += "u";
    flag = 1;
    }

    if((flag == 0) && (str.charAt(i)=="Á")){
    out += "A";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="É")){
    out += "E";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="Í")){
    out += "I";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="Ó")){
    out += "O";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="Ú")){
    out += "U";
    flag = 1;
    }

    if((flag == 0) && (str.charAt(i)=="À")){
    out += "A";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="È")){
    out += "E";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="Ì")){
    out += "I";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="Ò")){
    out += "O";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="Ù")){
    out += "U";
    flag = 1;
    }

    if((flag == 0) && (str.charAt(i)=="ï")){
    out += "i";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="ä")){
    out += "a";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="ë")){
    out += "e";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="ö")){
    out += "o";
    flag = 1;                   
    }
    if((flag == 0) && (str.charAt(i)=="ü")){
    out += "u";
    flag = 1;
    }

    if((flag == 0) && (str.charAt(i)=="Ä")){
    out += "A";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="Ë")){
    out += "E";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="Ï")){
    out += "I";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="Ö")){
    out += "O";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="Ü")){
    out += "U";
    flag = 1;
    }
    }
    }
    return out;
    }
    //-->
</script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-116073513-1');
</script>
</head>

    <body>

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


            <div class="container-fluid contenidos">
                <div class="row">
                    <div class="col-xs-12 col-md-8 col-md-offset-2">
                        <form  name="form1"  method="post" onSubmit="return comprueba( );" action="GrabaEstudianteDoc">
                            <h3>Solicitud de Admisión al Doctorado en Ingeniería<hr></h3>
                            <div class="row">
                                <div class="col-xs-12 col-md-12">
                                    <div>
                                        <legend class="textocom">Los campos marcados con un asterisco (<b><font color=#ff0000>*</font></b>)
                                            son campos obligatorios
                                    </div>
                                </div>          			              
                            </div>
                            <!--DATOS ASPIRANTE-->
                            <input id="campo1" name="campo1" type="hidden" value="<%=idplan%>">
                            <div class="formulario">
                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingOne">
                                            <h4 class="panel-title">
                                                <span class="glyphicon glyphicon-collapse-down"></span> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                    <strong><span class="rojo">PASO 1:</span></strong> Datos del aspirante
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                            <div class="panel-body">

                                                <div class="row">
                                                    <div class="col-xs-12 col-md-6">
                                                        <div class="form-group espaciado">
                                                            <label for="">Primer apellido</label>
                                                            <input type="text" class="form-control" name="ape1"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(7)%>">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-md-6">
                                                        <div class="form-group">
                                                            <label for="">Segundo apellido</label>
                                                            <input type="text" class="form-control" name="ape2"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(8)%>">
                                                        </div>
                                                    </div>
                                                </div>	

                                                <div class="form-group">
                                                    <label for="">Nombre(s)</label>
                                                    <input type="text" class="form-control" name="campo2"  size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(9)%>">
                                                </div>

                                                <div class="row">
                                                    <div class="col-xs-12 col-md-4">
                                                        <div class="form-group espaciado">
                                                            <label for="">Tipo de documento</label>
                                                            <select name="campo12" class="form-control">
                                                                <option value="null" selected><b>Seleccione</b></option>
                                                                <option value="C"><b>CC </b>
                                                                <option value="E"><b>CE </b>
                                                                <option value="O"><b>OTRO </b>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-4">
                                                        <div class="form-group espaciado">
                                                            <label for="">Documento de identidad</label>
                                                            <input type="text" class="form-control"  name="campo11"  size="18" maxlength="20" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(3)%>" placeholder="documento de identidad" >
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div><strong>Fecha de nacimiento</strong></div>
                                                    <div class="col-xs-2 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label>Día</label>
                                                            <select name="campo5" class="form-control" id="campo5">
                                                                <option value="null" selected>dia</option>
                                                                <option value="01">01</option>
                                                                <option value="02">02</option>
                                                                <option value="03">03</option>
                                                                <option value="04">04</option>
                                                                <option value="05">05</option>
                                                                <option value="06">06</option>
                                                                <option value="07">07</option>
                                                                <option value="08">08</option>
                                                                <option value="09">09</option>
                                                                <option value="10">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                                <option value="13">13</option>
                                                                <option value="14">14</option>
                                                                <option value="15">15</option>
                                                                <option value="16">16</option>
                                                                <option value="17">17</option>
                                                                <option value="18">18</option>
                                                                <option value="19">19</option>
                                                                <option value="20">20</option>
                                                                <option value="21">21</option>
                                                                <option value="22">22</option>
                                                                <option value="23">23</option>
                                                                <option value="24">24</option>
                                                                <option value="25">25</option>
                                                                <option value="26">26</option>
                                                                <option value="27">27</option>
                                                                <option value="28">28</option>
                                                                <option value="29">29</option>
                                                                <option value="30">30</option>
                                                                <option value="31">31</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-2 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label>Mes</label>
                                                            <select name="campo6" class="form-control" id="campo6">
                                                                <option value="null" selected>mes</option>
                                                                <option value="01">Enero</option>
                                                                <option value="02">Febrero</option>
                                                                <option value="03">Marzo</option>
                                                                <option value="04">Abril</option>
                                                                <option value="05">Mayo</option>
                                                                <option value="06">Junio</option>
                                                                <option value="07">Julio</option>
                                                                <option value="08">Agosto</option>
                                                                <option value="09">Septiembre</option>
                                                                <option value="10">Octubre</option>
                                                                <option value="11">Noviembre</option>
                                                                <option value="12">Diciembre</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-2 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label>Año</label>
                                                            <input type="text" class="form-control" name="campo7"  placeholder="año" id="campo7" size="5" maxlength="4">
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-3 col-md-3">
                                                        <div class="form-group espaciado">
                                                            <label>Ciudad de nacimiento</label>
                                                            <select name="campo4" class="form-control" id="campo4">
                                                                <option value="" selected> Seleccione</option>
                                                                <%
                                                                    Vector detciud = new Vector();
                                                                    for (i = 0; i < ciud.size(); i++) {
                                                                        detciud = (Vector) ciud.elementAt(i);
                                                                %>
                                                                <option value="<%=detciud.elementAt(0)%>"><%=detciud.elementAt(1)%></option>
                                                                <%
                                                                    }
                                                                %>
                                                                <option value="0">Otra</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-3 col-md-3">
                                                        <div class="form-group espaciado">
                                                            <label>País de nacimiento</label>
                                                            <select name="campo10" class="form-control" id="campo10">
                                                                <option value="" selected><strong>Seleccione</strong></option>
                                                                <%
                                                                    Vector detpais = new Vector();
                                                                    for (i = 0; i < pais.size(); i++) {
                                                                        detpais = (Vector) pais.elementAt(i);
                                                                %>
                                                                <option value="<%=detpais.elementAt(0)%>"><strong><%=detpais.elementAt(1)%></strong></option>
                                                                    <%
                                                                        }
                                                                    %>
                                                                <option value="0"><strong>Otra</strong></option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-xs-2 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label>Sexo</label>
                                                            <select name="campo8" class="form-control" id="campo8">
                                                                <option value="M" selected>Masculino
                                                                <option value="F">Femenino
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-2 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label>Estado civil</label>
                                                            <select name="campo9" class="form-control" id="campo9">
                                                                <option value="S" selected><strong>Soltero(A) </strong>
                                                                <option value="C"><strong>Casado(A) </strong>
                                                                <option value="P"><strong>Separado(A) </strong>
                                                                <option value="V"><strong>Viudo(A) </strong>
                                                                <option value="U"><strong>Unión Libre </strong>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-6">
                                                        <div class="form-group espaciado">
                                                            <label for="">Correo electrónico</label>
                                                            <input type="text" class="form-control" name="campo20" size="20" maxlength="30">
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label for="">Celular</label>
                                                            <input name="campo21" type="text" class="form-control" size="10" maxlength="10">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-xs-12 col-md-4">
                                                        <div class="form-group espaciado">
                                                            <label for="">Libreta militar número</label>
                                                            <input type="text" class="form-control" name="libreta"  id="libreta" size="10" maxlength="15" placeholder="Libreta militar" size="15" maxlength="15">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label for="">Distrito No.</label>
                                                            <input type="text" class="form-control" name="distrito"   placeholder="Distrito" size="3" maxlength="3">
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-xs-12 col-md-6">
                                                        <div class="form-group espaciado">
                                                            <label for="">Dirección de residencia</label>
                                                            <input name="campo14" type="text" class="form-control" id="campo14" size="50" maxlength="35" placeholder="dirección" >
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label>Ciudad</label>
                                                            <select name="campo16" class="form-control" id="campo16">
                                                                <option value="" selected>Seleccione</option>
                                                                <%
                                                                    detciud = new Vector();
                                                                    for (i = 0; i < ciud.size(); i++) {
                                                                        detciud = (Vector) ciud.elementAt(i);
                                                                %>
                                                                <option value="<%=detciud.elementAt(0)%>"><%=detciud.elementAt(1)%></option>
                                                                <%
                                                                    }
                                                                %>
                                                                <option value="0">Otra</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label for="">Teléfono</label>
                                                            <input name="campo15" type="text"  id="campo15" maxlength="15" class="form-control" placeholder="teléfono" >
                                                        </div>
                                                    </div>		                	
                                                </div> 

                                                <div class="row">
                                                    <div class="col-xs-12 col-md-5">
                                                        <div class="form-group espaciado">
                                                            <label for="">Dirección de oficina</label>
                                                            <input  name="campo17" type="text" class="form-control" id="campo17" size="50" maxlength="35" placeholder="dirección" >
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label>Ciudad</label>
                                                            <select name="campo19" class="form-control" id="campo19">
                                                                <option value="" selected>Seleccione</option>
                                                                <%
                                                                    detciud = new Vector();
                                                                    for (i = 0; i < ciud.size(); i++) {
                                                                        detciud = (Vector) ciud.elementAt(i);
                                                                %>
                                                                <option value="<%=detciud.elementAt(0)%>"><%=detciud.elementAt(1)%></option>
                                                                <%
                                                                    }
                                                                %>
                                                                <option value="0">Otra</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label for="">Teléfono</label>
                                                            <input name="campo18" type="text" class="form-control" id="campo18" maxlength="15">
                                                        </div>
                                                    </div>


                                                </div>   

                                                <div class="form-group">
                                                    <hr>
                                                    <label for="">Persona a quien contactar en caso de emergencia</label>
                                                    <input type="text" class="form-control" name="campo22" size="50" maxlength="40"   placeholder="nombre completo"  onBlur="this.value = convertTildes(this.value);">
                                                </div>   

                                                <div class="row">
                                                    <div class="col-xs-12 col-md-8">
                                                        <div class="form-group espaciado">
                                                            <label for="">Dirección</label>
                                                            <input type="text" class="form-control" name="campo23" size="30" maxlength="30" placeholder="dirección">
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label for="">Teléfono</label>
                                                            <input type="text" class="form-control" name="campo24" id="campo24" maxlength="15" placeholder="telefono" >
                                                        </div>
                                                    </div>	

                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label>Ciudad</label>
                                                            <select name="campo25" class="form-control" id="campo4">
                                                                <option value="" selected>Seleccione</option>
                                                                <%
                                                                    detciud = new Vector();
                                                                    for (i = 0; i < ciud.size(); i++) {
                                                                        detciud = (Vector) ciud.elementAt(i);
                                                                %>
                                                                <option value="<%=detciud.elementAt(0)%>"><%=detciud.elementAt(1)%></option>
                                                                <%
                                                                    }
                                                                %>
                                                                <option value="0">Otra</option>
                                                            </select>
                                                        </div>
                                                    </div>


                                                </div>            	
                                            </div>
                                        </div>
                                    </div>

                                    <!--DATOS EDUCACION-->
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingTwo">
                                            <h4 class="panel-title">
                                                <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                    <strong><span class="rojo">PASO 2:</span></strong> Datos de educación
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                            <div class="panel-body">

                                                <div class="row">
                                                    <div class="col-xs-12 col-md-8">			                		
                                                        <div class="form-group espaciado">
                                                            <br>Estudios universitarios de pregrado <small class="azul">(Título profesional)</small> promedio de la carrera
                                                        </div>
                                                    </div>								
                                                    <div class="col-xs-2 col-md-1">
                                                        <div class="form-group espaciado">
                                                            <label></label>
                                                            <input type="text" class="form-control" name="promedio" size="2" maxlength="2">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-5 col-md-3"><br> Dos dígitos <br> sin puntos</div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-xs-12 col-md-7">
                                                        <div class="form-group espaciado">
                                                            <label for="">Universidad (Nombre Oficial como aparece
                                                                en su diploma o acta de grado)</label>
                                                            <select name="campo26" class="form-control" >
                                                                <option value="N" selected>SELECCIONE</option>
                                                                <option value="CORPORACION UNIVERSITARIA DE IBAGUE">CORP
                                                                    UNIV DE IBAGUE</option>
                                                                <option value="CORPORACION UNIVERSITARIA DE LA COSTA">CORP
                                                                    UNIV DE LA COSTA</option>
                                                                <option value="ESCUELA COLOMBIANA DE INGENIERIA JULIO GARAVITO">ESC
                                                                    COL DE INGENIERIA JULIO GARAVITO</option>
                                                                <option value="ESCUELA DE ADMINISTRACION DE NEGOCIOS">ESC
                                                                    DE ADM DE NEGOCIOS</option>
                                                                <option value="ESCUELA NAVAL DE CADETES ">ALMIRANTE JOSE
                                                                    PRUDENCIO PADILLA ESC NAVAL DE CADETES</option>
                                                                <option value="FUNDACION UNIVERSIDAD DE AMERICA">FUND UNIV
                                                                    DE AMERICA</option>
                                                                <option value="FUNDACION UNIVERSITARIA AGRARIA DE COLOMBIA">FUND
                                                                    UNIV AGRARIA DE COLOMBIA</option>
                                                                <option value="FUNDACION UNIVERSITARIA AUTONOMA DE COLOMBIA">FUND
                                                                    UNIV AUTONOMA DE COLOMBIA</option>
                                                                <option value="FUNDACION UNIVERSITARIA DE BOYACA">FUND UNIV
                                                                    DE BOYACA</option>
                                                                <option value="INSTITUTO UNIVERSITARIO DE LA PAZ">INSTITUTO
                                                                    UNIVERSITARIO DE LA PAZ</option>
                                                                <option value="PONTIFICIA UNIVERSIDAD JAVERIANA">PONTIFICIA
                                                                    UNIV JAVERIANA</option>
                                                                <option value="UNIVERSIDAD ANTONIO NARIÑO">UNIV ANTONIO
                                                                    NARIÑO</option>
                                                                <option value="UNIVERSIDAD AUTONOMA DE COLOMBIA">UNIV AUTONOMA
                                                                    DE COLOMBIA</option>
                                                                <option value="UNIVERSIDAD AUTONOMA DE MANIZALES">UNIV AUTONOMA
                                                                    DE MANIZALES</option>
                                                                <option value="UNIVERSIDAD AUTONOMA DEL CARIBE">UNIV AUTONOMA
                                                                    DEL CARIBE</option>
                                                                <option value="UNIVERSIDAD CATOLICA DE COLOMBIA">UNIV CATOLICA
                                                                    DE COLOMBIA</option>
                                                                <option value="UNIVERSIDAD COOPERATIVA DE COLOMBIA">UNIV
                                                                    COOPERATIVA DE COLOMBIA</option>
                                                                <option value="UNIVERSIDAD DE AMERICA">UNIV DE AMERICA</option>
                                                                <option value="UNIVERSIDAD DE CARTAGENA">UNIV DE CARTAGENA</option>
                                                                <option value="UNIVERSIDAD DE CIENCIAS APLICADAS Y AMBIENTALES">UNIV
                                                                    DE CIENCIAS APLICADAS Y AMBIENTALES</option>
                                                                <option value="UNIVERSIDAD DE LA SABANA">UNIV DE LA SABANA</option>
                                                                <option value="UNIVERSIDAD DE LA SALLE">UNIV DE LA SALLE</option>
                                                                <option value="UNIVERSIDAD DE LOS ANDES">UNIV DE LOS ANDES</option>
                                                                <option value="UNIVERSIDAD DE NARIÑO">UNIV DE NARIÑO</option>
                                                                <option value="UNIVERSIDAD DEL CAUCA">UNIV DEL CAUCA</option>
                                                                <option value="UNIVERSIDAD DEL QUINDIO">UNIV DEL QUINDIO</option>
                                                                <option value="UNIVERSIDAD DISTRITAL FRANCISCO JOSE DE CALDAS">UNIV
                                                                    DIST FRANCISCO JOSE DE CALDAS</option>
                                                                <option value="UNIVERSIDAD FRANCISCO DE PAULA SANTANDER">UNIV
                                                                    FRANCISCO DE PAULA SANTANDER</option>
                                                                <option value="UNIVERSIDAD INDUSTRIAL DE SANTANDER">UNIV
                                                                    INDUSTRIAL DE SANTANDER</option>
                                                                <option value="UNIVERSIDAD JORGE TADEO LOZANO">UNIV JORGE
                                                                    TADEO LOZANO</option>
                                                                <option value="UNIVERSIDAD LA GRAN COLOMBIA">UNIV LA GRAN
                                                                    COLOMBIA</option>
                                                                <option value="UNIVERSIDAD LIBRE">UNIV LIBRE</option>
                                                                <option value="UNIVERSIDAD MILITAR NUEVA GRANADA">UNIV MILITAR
                                                                    NUEVA GRANADA</option>
                                                                <option value="UNIVERSIDAD NACIONAL DE COLOMBIA">UNIV NACIONAL
                                                                    DE COLOMBIA</option>
                                                                <option value="UNIVERSIDAD PEDAGOGICA Y TECNOLOGICA DE COLOMBIA">UNIV
                                                                    PEDAGOGICA Y TECNOLOGICA DE COLOMBIA</option>
                                                                <option value="UNIVERSIDAD PILOTO DE COLOMBIA">UNIV PILOTO
                                                                    DE COLOMBIA</option>
                                                                <option value="UNIVERSIDAD SANTIAGO DE CALI">UNIV SANTIAGO
                                                                    DE CALI</option>
                                                                <option value="UNIVERSIDAD SANTO TOMAS">UNIV SANTO TOMAS</option>
                                                                <option value="UNIVERSIDAD SERGIO ARBOLEDA">UNIV SERGIO
                                                                    ARBOLEDA</option>
                                                                <option value="UNIVERSIDAD SURCOLOMBIANA">UNIV SURCOLOMBIANA</option>
                                                                <option value="OTRA">OTRA</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <label for="">País</label>
                                                        <input type="text" class="form-control" name="pais" size="10" maxlength="30" placeholder="país" >
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-md-7">
                                                    <div class="form-group espaciado">
                                                        <label for="">Programa</label>
                                                        <input type="text" class="form-control" name="campo27" size="20" maxlength="50" placeholder="programa" >
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12 col-md-5">
                                                        <div class="form-group espaciado">
                                                            <label for="">Título obtenido</label>
                                                            <select name="campo30" class="form-control">
                                                                <option value="N" selected>SELECCIONE</option>
                                                                <option value="Administrador Financiero y de Sistemas">Admón
                                                                    de Instituciones de servicio</option>
                                                                <option value="Administrador de Empresas">Admón de Empresas</option>
                                                                <option value="Administrador Financiero y de Sistemas">Admon
                                                                    Financiero y de Sistemas</option>
                                                                <option value="Arquitecto">Arquitecto</option>
                                                                <option value="Biólogo">Biólogo</option>
                                                                <option value="Biólogo marino">Biólogo marino</option>
                                                                <option value="Economista">Economista</option>
                                                                <option value="Ingeniero Agrícola">Ingeniero Agrícola</option>
                                                                <option value="Ingeniero Ambiental">Ingeniero Ambiental</option>
                                                                <option value="Ingeniero Ambiental y de Saneamiento">Ing
                                                                    Ambiental y de Saneamiento</option>
                                                                <option value="Ingeniero Ambiental y Sanitario">Ing Ambiental
                                                                    y Sanitario</option>
                                                                <option value="Ingeniero Catastral y Geodesta">Ing Catastral
                                                                    y Geodesta</option>
                                                                <option value="Ingeniero Civil">Ingeniero Civil</option>
                                                                <option value="Ingeniero de Petróleos">Ingeniero de Petróleos</option>
                                                                <option value="Ingeniero de Producción Agroindustrial">Ing
                                                                    de Produc Agroindustrial</option>
                                                                <option value="Ingeniero de Sistemas">Ingeniero de Sistemas</option>
                                                                <option value="Ingeniero Electricista">Ingeniero Electricista</option>
                                                                <option value="Ingeniero Electrónico">Ingeniero Electrónico</option>
                                                                <option value="Ingeniero Forestal">Ingeniero Forestal</option>
                                                                <option value="Ingeniero Geólogo">Ingeniero Geólogo</option>
                                                                <option value="Ingeniero Industrial">Ingeniero Industrial</option>
                                                                <option value="Ingeniero Mecánico">Ingeniero Mecánico</option>
                                                                <option value="Ingeniero Naval">Ingeniero Naval</option>
                                                                <option value="Ingeniero Químico">Ingeniero Químico</option>
                                                                <option value="Ingeniero Sanitario y Ambiental">Ing Sanitario
                                                                    y Ambiental</option>
                                                                <option value="Microbiólogo Industrial">Microbiólogo Industrial</option>
                                                                <option value="Psicologo">Psicologo</option>
                                                                <option value="Químico Industrial">Químico Industrial</option>
                                                                <option value="Otra">Otra</option>
                                                            </select>
                                                        </div>
                                                    </div>							

                                                    <div class="col-xs-12 col-md-3">

                                                        <div class="col-sx-6 col-md-6">
                                                            <label for="">Fecha <small class="miniaturas">inicio</small></label>
                                                            <div class="form-group espaciado">
                                                                <input type="text" class="form-control" name="campo28" size="4" maxlength="4" placeholder="aaaa">
                                                            </div>
                                                        </div>
                                                        <div class="col-sx-6 col-md-6">
                                                            <label for="">Fecha <small class="miniaturas">final</small></label>
                                                            <div class="form-group espaciado">
                                                                <input type="text" class="form-control" name="campo29" size="4" maxlength="4" placeholder="aaaa">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-md-12">
                                                    <div class="separador"></div>
                                                    <h5>Otros estudios formales <small class="azul">(Aquellos que conducen a título)</small></h5>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <label for="">Universidad </label>
                                                        <select name="campo31" class="form-control" >
                                                            <option value="N" selected>SELECCIONE</option>
                                                            <option value="CORPORACION UNIVERSITARIA DE IBAGUE">CORP
                                                                UNIV DE IBAGUE</option>
                                                            <option value="CORPORACION UNIVERSITARIA DE LA COSTA">CORP
                                                                UNIV DE LA COSTA</option>
                                                            <option value="ESCUELA COLOMBIANA DE INGENIERIA JULIO GARAVITO">ESC
                                                                COL DE INGENIERIA JULIO GARAVITO</option>
                                                            <option value="ESCUELA DE ADMINISTRACION DE NEGOCIOS">ESC
                                                                DE ADM DE NEGOCIOS</option>
                                                            <option value="ESCUELA NAVAL DE CADETES ALMIRANTE JOSE PRUDENCIO PADILLA">ESC
                                                                    NAVAL DE CADETES</option>
                                                            <option value="FUNDACION UNIVERSIDAD DE AMERICA">FUND
                                                                UNIV DE AMERICA</option>
                                                            <option value="FUNDACION UNIVERSITARIA AGRARIA DE COLOMBIA">FUND
                                                                UNIV AGRARIA DE COLOMBIA</option>
                                                            <option value="FUNDACION UNIVERSITARIA AUTONOMA DE COLOMBIA">FUND
                                                                UNIV AUTONOMA DE COLOMBIA</option>
                                                            <option value="FUNDACION UNIVERSITARIA DE BOYACA">FUND
                                                                UNIV DE BOYACA</option>
                                                            <option value="INSTITUTO UNIVERSITARIO DE LA PAZ">INSTITUTO
                                                                UNIVERSITARIO DE LA PAZ</option>
                                                            <option value="PONTIFICIA UNIVERSIDAD JAVERIANA">PONTIFICIA
                                                                UNIV JAVERIANA</option>
                                                            <option value="UNIVERSIDAD ANTONIO NARIÑO">UNIV ANTONIO
                                                                NARIÑO</option>
                                                            <option value="UNIVERSIDAD AUTONOMA DE COLOMBIA">UNIV
                                                                AUTONOMA DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD AUTONOMA DE MANIZALES">UNIV
                                                                AUTONOMA DE MANIZALES</option>
                                                            <option value="UNIVERSIDAD AUTONOMA DEL CARIBE">UNIV AUTONOMA
                                                                DEL CARIBE</option>
                                                            <option value="UNIVERSIDAD CATOLICA DE COLOMBIA">UNIV
                                                                CATOLICA DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD COOPERATIVA DE COLOMBIA">UNIV
                                                                COOPERATIVA DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD DE AMERICA">UNIV DE AMERICA</option>
                                                            <option value="UNIVERSIDAD DE CARTAGENA">UNIV DE CARTAGENA</option>
                                                            <option value="UNIVERSIDAD DE CIENCIAS APLICADAS Y AMBIENTALES">UNIV
                                                                DE CIENCIAS APLICADAS Y AMBIENTALES</option>
                                                            <option value="UNIVERSIDAD DE LA SABANA">UNIV DE LA SABANA</option>
                                                            <option value="UNIVERSIDAD DE LA SALLE">UNIV DE LA SALLE</option>
                                                            <option value="UNIVERSIDAD DE LOS ANDES">UNIV DE LOS ANDES</option>
                                                            <option value="UNIVERSIDAD DE NARIÑO">UNIV DE NARIÑO</option>
                                                            <option value="UNIVERSIDAD DEL CAUCA">UNIV DEL CAUCA</option>
                                                            <option value="UNIVERSIDAD DEL QUINDIO">UNIV DEL QUINDIO</option>
                                                            <option value="UNIVERSIDAD DISTRITAL FRANCISCO JOSE DE CALDAS">UNIV
                                                                DIST FRANCISCO JOSE DE CALDAS</option>
                                                            <option value="UNIVERSIDAD FRANCISCO DE PAULA SANTANDER">UNIV
                                                                FRANCISCO DE PAULA SANTANDER</option>
                                                            <option value="UNIVERSIDAD INDUSTRIAL DE SANTANDER">UNIV
                                                                INDUSTRIAL DE SANTANDER</option>
                                                            <option value="UNIVERSIDAD JORGE TADEO LOZANO">UNIV JORGE
                                                                TADEO LOZANO</option>
                                                            <option value="UNIVERSIDAD LA GRAN COLOMBIA">UNIV LA GRAN
                                                                COLOMBIA</option>
                                                            <option value="UNIVERSIDAD LIBRE">UNIV LIBRE</option>
                                                            <option value="UNIVERSIDAD MILITAR NUEVA GRANADA">UNIV
                                                                MILITAR NUEVA GRANADA</option>
                                                            <option value="UNIVERSIDAD NACIONAL DE COLOMBIA">UNIV
                                                                NACIONAL DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD PEDAGOGICA Y TECNOLOGICA DE COLOMBIA">UNIV
                                                                PEDAGOGICA Y TECNOLOGICA DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD PILOTO DE COLOMBIA">UNIV PILOTO
                                                                DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD SANTIAGO DE CALI">UNIV SANTIAGO
                                                                DE CALI</option>
                                                            <option value="UNIVERSIDAD SANTO TOMAS">UNIV SANTO TOMAS</option>
                                                            <option value="UNIVERSIDAD SERGIO ARBOLEDA">UNIV SERGIO
                                                                ARBOLEDA</option>
                                                            <option value="UNIVERSIDAD SURCOLOMBIANA">UNIV SURCOLOMBIANA</option>
                                                            <option value="OTRA">OTRA</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <label for="">Programa</label>
                                                        <input type="text" class="form-control" name="campo32" size="20" maxlength="50"  onBlur="this.value = convertTildes(this.value);" placeholder="programa" >
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <label for="">Grado obtenido</label>
                                                        <input type="text" class="form-control" name="campo35" size="25" maxlength="60" onBlur="this.value = convertTildes(this.value);" placeholder="Grado obtenido" >
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="row">
                                                        <div class="col-sx-6 col-md-6">
                                                            <label for="">Fecha <small class="miniaturas">inicio</small></label>
                                                            <div class="form-group espaciado">
                                                                <input type="text" class="form-control" name="campo33" size="4" maxlength="4" placeholder="aaaa">
                                                            </div>
                                                        </div>
                                                        <div class="col-sx-6 col-md-6">
                                                            <label for="">Fecha <small class="miniaturas">final</small></label>
                                                            <div class="form-group espaciado">
                                                                <input type="text" class="form-control" name="campo34" size="4" maxlength="4" placeholder="aaaa">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">							
                                                        <select name="campo36" class="form-control" >
                                                            <option value="N" selected>SELECCIONE</option>
                                                            <option value="CORPORACION UNIVERSITARIA DE IBAGUE">CORP
                                                                UNIV DE IBAGUE</option>
                                                            <option value="CORPORACION UNIVERSITARIA DE LA COSTA">CORP
                                                                UNIV DE LA COSTA</option>
                                                            <option value="ESCUELA COLOMBIANA DE INGENIERIA JULIO GARAVITO">ESC
                                                                COL DE INGENIERIA JULIO GARAVITO</option>
                                                            <option value="ESCUELA DE ADMINISTRACION DE NEGOCIOS">ESC
                                                                DE ADM DE NEGOCIOS</option>
                                                            <option value="ESCUELA NAVAL DE CADETES ALMIRANTE JOSE PRUDENCIO PADILLA">ESC
                                                                NAVAL DE CADETES</option>
                                                            <option value="FUNDACION UNIVERSIDAD DE AMERICA">FUND
                                                                UNIV DE AMERICA</option>
                                                            <option value="FUNDACION UNIVERSITARIA AGRARIA DE COLOMBIA">FUND
                                                                UNIV AGRARIA DE COLOMBIA</option>
                                                            <option value="FUNDACION UNIVERSITARIA AUTONOMA DE COLOMBIA">FUND
                                                                UNIV AUTONOMA DE COLOMBIA</option>
                                                            <option value="FUNDACION UNIVERSITARIA DE BOYACA">FUND
                                                                UNIV DE BOYACA</option>
                                                            <option value="INSTITUTO UNIVERSITARIO DE LA PAZ">INSTITUTO
                                                                UNIVERSITARIO DE LA PAZ</option>
                                                            <option value="PONTIFICIA UNIVERSIDAD JAVERIANA">PONTIFICIA
                                                                UNIV JAVERIANA</option>
                                                            <option value="UNIVERSIDAD ANTONIO NARIÑO">UNIV ANTONIO
                                                                NARIÑO</option>
                                                            <option value="UNIVERSIDAD AUTONOMA DE COLOMBIA">UNIV
                                                                AUTONOMA DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD AUTONOMA DE MANIZALES">UNIV
                                                                AUTONOMA DE MANIZALES</option>
                                                            <option value="UNIVERSIDAD AUTONOMA DEL CARIBE">UNIV AUTONOMA
                                                                DEL CARIBE</option>
                                                            <option value="UNIVERSIDAD CATOLICA DE COLOMBIA">UNIV
                                                                CATOLICA DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD COOPERATIVA DE COLOMBIA">UNIV
                                                                COOPERATIVA DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD DE AMERICA">UNIV DE AMERICA</option>
                                                            <option value="UNIVERSIDAD DE CARTAGENA">UNIV DE CARTAGENA</option>
                                                            <option value="UNIVERSIDAD DE CIENCIAS APLICADAS Y AMBIENTALES">UNIV
                                                                DE CIENCIAS APLICADAS Y AMBIENTALES</option>
                                                            <option value="UNIVERSIDAD DE LA SABANA">UNIV DE LA SABANA</option>
                                                            <option value="UNIVERSIDAD DE LA SALLE">UNIV DE LA SALLE</option>
                                                            <option value="UNIVERSIDAD DE LOS ANDES">UNIV DE LOS ANDES</option>
                                                            <option value="UNIVERSIDAD DE NARIÑO">UNIV DE NARIÑO</option>
                                                            <option value="UNIVERSIDAD DEL CAUCA">UNIV DEL CAUCA</option>
                                                            <option value="UNIVERSIDAD DEL QUINDIO">UNIV DEL QUINDIO</option>
                                                            <option value="UNIVERSIDAD DISTRITAL FRANCISCO JOSE DE CALDAS">UNIV
                                                                DIST FRANCISCO JOSE DE CALDAS</option>
                                                            <option value="UNIVERSIDAD FRANCISCO DE PAULA SANTANDER">UNIV
                                                                FRANCISCO DE PAULA SANTANDER</option>
                                                            <option value="UNIVERSIDAD INDUSTRIAL DE SANTANDER">UNIV
                                                                INDUSTRIAL DE SANTANDER</option>
                                                            <option value="UNIVERSIDAD JORGE TADEO LOZANO">UNIV JORGE
                                                                TADEO LOZANO</option>
                                                            <option value="UNIVERSIDAD LA GRAN COLOMBIA">UNIV LA GRAN
                                                                COLOMBIA</option>
                                                            <option value="UNIVERSIDAD LIBRE">UNIV LIBRE</option>
                                                            <option value="UNIVERSIDAD MILITAR NUEVA GRANADA">UNIV
                                                                MILITAR NUEVA GRANADA</option>
                                                            <option value="UNIVERSIDAD NACIONAL DE COLOMBIA">UNIV
                                                                NACIONAL DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD PEDAGOGICA Y TECNOLOGICA DE COLOMBIA">UNIV
                                                                PEDAGOGICA Y TECNOLOGICA DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD PILOTO DE COLOMBIA">UNIV PILOTO
                                                                DE COLOMBIA</option>
                                                            <option value="UNIVERSIDAD SANTIAGO DE CALI">UNIV SANTIAGO
                                                                DE CALI</option>
                                                            <option value="UNIVERSIDAD SANTO TOMAS">UNIV SANTO TOMAS</option>
                                                            <option value="UNIVERSIDAD SERGIO ARBOLEDA">UNIV SERGIO
                                                                ARBOLEDA</option>
                                                            <option value="UNIVERSIDAD SURCOLOMBIANA">UNIV SURCOLOMBIANA</option>
                                                            <option value="OTRA">OTRA</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">								
                                                        <input type="text" class="form-control" name="campo37" size="20" maxlength="50"  onBlur="this.value = convertTildes(this.value);" placeholder="programa">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">									
                                                        <input type="text" class="form-control"name="campo40" size="25" maxlength="60" onBlur="this.value = convertTildes(this.value);" placeholder="Grado obtenido" >
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="row">
                                                        <div class="col-sx-6 col-md-6">										
                                                            <div class="form-group espaciado">
                                                                <input type="text" class="form-control" name="campo38" size="4" maxlength="4" placeholder="dd-mm-aaaa">
                                                            </div>
                                                        </div>
                                                        <div class="col-sx-6 col-md-6">											
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" name="campo39" size="4" maxlength="4" placeholder="dd-mm-aaaa">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--DATOS EXPERIENCIA-->
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingThree">
                                        <h4 class="panel-title">
                                            <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                <strong><span class="rojo">PASO 3:</span></strong> Información experiencia
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                        <div class="panel-body">

                                            <div class="row">
                                                <div class="col-xs-12 col-md-12">			                		
                                                    <div class="form-group espaciado">
                                                        <br>Haga referencia a la experiencia actual
                                                    </div>
                                                </div>	
                                                <div class="col-xs-12 col-md-5">
                                                    <label for="">Entidad</label>
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control"  name="campo41" size="15" maxlength="40"  placeholder="entidad">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="row">
                                                        <div class="col-sx-6 col-md-6">	
                                                            <label for="">Fecha <small class="miniaturas">inicio</small></label>										
                                                            <div class="form-group espaciado">
                                                                <input type="text" class="form-control" name="campo42" size="5" maxlength="7" placeholder="mm-aaaa">
                                                            </div>
                                                        </div>
                                                        <div class="col-sx-6 col-md-6">	
                                                            <label for="">Fecha <small class="miniaturas">final</small></label>										
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" name="campo43" size="5" maxlength="7" placeholder="mm-aaaa">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-4">
                                                    <label for="">Cargo</label>
                                                    <div class="form-group espaciado">									
                                                        <input type="text" class="form-control" name="campo44" size="10" maxlength="40" placeholder="cargo">
                                                    </div>
                                                </div>				

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="row">
                                                        <div class="col-sx-6 col-md-6">	
                                                            <p>Experiencia</p>
                                                        </div>
                                                        <div class="col-sx-6 col-md-6">	
                                                            <div class="form-group espaciado">		
                                                                <label class="radio-inline">
                                                                    <input type="radio" id="inlineRadio1"  name="campo45" value="L"> Laboral
                                                                </label><br>
                                                                <label class="radio-inline">
                                                                    <input type="radio"  id="inlineRadio2" name="campo45" value="D"> Docente
                                                                </label><br>
                                                                <label class="radio-inline">
                                                                    <input type="radio"  id="inlineRadio2" name="campo45" value="I"> Investigativa
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-md-5">
                                                    <label for="">Jefe inmediato</label>
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" name="campo46" size="15" maxlength="40" onBlur="this.value = convertTildes(this.value);" placeholder="nombre" >
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-4">
                                                    <label for="">Telefono</label>
                                                    <div class="form-group espaciado">									
                                                        <input type="text" class="form-control" name="campo47" size="10" maxlength="20" placeholder="telefono">
                                                    </div>
                                                </div>				


                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-md-12">							
                                                    <p>Si es posible adjunte copia de sus trabajos más relevantes. Indique
                                                        la entidad en la que hizo sus trabajos o investigaciones y el
                                                        nombre de las personas que le colaboraron o lo asesoraron; así
                                                        mismo indique si alguno de estos trabajos ha sido publicado y
                                                        en qué medio.<br><strong>¿Ha sido usted objeto de distinciones y premios (académicos, profesionales u otros), y en caso dado, en cuáles?</strong></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-md-5">
                                                    <label for="">Distinción</label>
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" name="campo48" maxlength="60" size="35" placeholder="distinción">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-5">
                                                    <label for="">Entidad</label>
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" name="campo49" size="35" maxlength="50" placeholder="entidad">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-2">
                                                    <label for="">Año</label>
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" name="campo50" size="4" maxlength="4" placeholder="año">
                                                    </div>
                                                </div>
                                            </div>	

                                            <div class="row">
                                                <div class="col-xs-12 col-md-5">
                                                    <label for="">Distinción</label>
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" name="campo51" maxlength="60" size="35" placeholder="distinción">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-5">
                                                    <label for="">Entidad</label>
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" name="campo52" size="35" maxlength="50" placeholder="entidad">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-2">
                                                    <label for="">Año</label>
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" name="campo53" size="4" maxlength="4" placeholder="año">
                                                    </div>
                                                </div>
                                            </div>	

                                            <div class="row">
                                                <div class="col-xs-12 col-md-12">							
                                                    <p>Califique su conocimiento de idiomas diferentes al español, de acuerdo con la siguiente convención: MUY BIEN, BIEN, REGULAR</p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-md-4">
                                                    <div class="form-group espaciado">	
                                                        <label for="">Idioma</label>						
                                                        <select name="campo54" class="form-control">
                                                            <option value="" selected></option>
                                                            <option value="Ingles">Ingles</option>
                                                            <option value="Frances">Frances</option>
                                                            <option value="Aleman">Aleman</option>
                                                            <option value="Italiano">Italiano</option>
                                                            <option value="Portugues">Portugues</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-2">
                                                    <div class="form-group espaciado">	
                                                        <label for="">Comprende leer</label>						
                                                        <select name="campo55" class="form-control">
                                                            <option value="" selected></option>
                                                            <option value="0" selected>0-20%</option>
                                                            <option value="2">21-40%</option>
                                                            <option value="4">41-60%</option>
                                                            <option value="6">61-80%</option>
                                                            <option value="8">81-100%</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-2">
                                                    <div class="form-group espaciado">	
                                                        <label for="">Comprende al oir</label>						
                                                        <select name="campo56" class="form-control">
                                                            <option value="" selected></option>
                                                            <option value="0" selected>0-20%</option>
                                                            <option value="2">21-40%</option>
                                                            <option value="4">41-60%</option>
                                                            <option value="6">61-80%</option>
                                                            <option value="8">81-100%</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-2">
                                                    <div class="form-group espaciado">	
                                                        <label for="">Habla</label>						
                                                        <select name="campo57" class="form-control">
                                                            <option value="0" selected>0-20%</option>
                                                            <option value="2">21-40%</option>
                                                            <option value="4">41-60%</option>
                                                            <option value="6">61-80%</option>
                                                            <option value="8">81-100%</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-2">
                                                    <div class="form-group espaciado">	
                                                        <label for="">Escribe</label>						
                                                        <select name="campo58" class="form-control">
                                                            <option value="0" selected>0-20%</option>
                                                            <option value="2">21-40%</option>
                                                            <option value="4">41-60%</option>
                                                            <option value="6">61-80%</option>
                                                            <option value="8">81-100%</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-md-4">
                                                    <div class="form-group espaciado">	
                                                        <label for="">Idioma</label>						
                                                        <select name="campo59" class="form-control">
                                                            <option value="" selected></option>
                                                            <option value="Ingles">Ingles</option>
                                                            <option value="Frances">Frances</option>
                                                            <option value="Aleman">Aleman</option>
                                                            <option value="Italiano">Italiano</option>
                                                            <option value="Portugues">Portugues</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-2">
                                                    <div class="form-group espaciado">	
                                                        <label for="">Comprende leer</label>						
                                                        <select name="campo60" class="form-control">
                                                            <option value="" selected></option>
                                                            <option value="0" selected>0-20%</option>
                                                            <option value="2">21-40%</option>
                                                            <option value="4">41-60%</option>
                                                            <option value="6">61-80%</option>
                                                            <option value="8">81-100%</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-2">
                                                    <div class="form-group espaciado">	
                                                        <label for="">Comprende al oir</label>						
                                                        <select name="campo61" class="form-control">
                                                            <option value="" selected></option>
                                                            <option value="0" selected>0-20%</option>
                                                            <option value="2">21-40%</option>
                                                            <option value="4">41-60%</option>
                                                            <option value="6">61-80%</option>
                                                            <option value="8">81-100%</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-2">
                                                    <div class="form-group espaciado">	
                                                        <label for="">Habla</label>						
                                                        <select name="campo62" class="form-control">
                                                            <option value="0" selected>0-20%</option>
                                                            <option value="2">21-40%</option>
                                                            <option value="4">41-60%</option>
                                                            <option value="6">61-80%</option>
                                                            <option value="8">81-100%</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-2">
                                                    <div class="form-group espaciado">	
                                                        <label for="">Escribe</label>						
                                                        <select name="campo63" class="form-control">
                                                            <option value="0" selected>0-20%</option>
                                                            <option value="2">21-40%</option>
                                                            <option value="4">41-60%</option>
                                                            <option value="6">61-80%</option>
                                                            <option value="8">81-100%</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <!--INTERES ACADEMICO-->
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingFour">
                                        <h4 class="panel-title">
                                            <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                                <strong><span class="rojo">PASO 4:</span></strong> Interés académico
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                                        <div class="panel-body">

                                            <div class="row">
                                                <div class="col-xs-12 col-md-12">							
                                                    <p><strong>*</strong> Indique las razones por las cuales desea seguir este programa de posgrado, o los factores que lo llevaron a pensar que será de gran utilidad en el desarrollo de su vida profesional y laboral, intereses académicos y profesionales y planes futuros. (máximo 255 caracteres)</p>
                                                </div>

                                                <div class="col-xs-12 col-md-12">
                                                    <div class="form-group">
                                                        <textarea class="form-control"  name="campo64" cols="85" rows="2" wrap="VIRTUAL" onBlur="this.value = convertTildes(this.value);"></textarea>
                                                    </div>
                                                </div>
                                            </div>		                	
                                        </div>
                                    </div>
                                </div>

                                <!--REFERENCIAS-->
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingFive">
                                        <h4 class="panel-title">
                                            <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                                <strong><span class="rojo">PASO 5:</span></strong> Referencias académicas o laborales
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                                        <div class="panel-body">

                                            <div class="row">
                                                <div class="col-xs-12 col-md-12">							
                                                    <p><strong>*</strong> Preferiblemente de sus profesores universitarios o jefes inmediatos</p>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <label for="">Nombre</label>
                                                        <input type="text" class="form-control" placeholder="nombre" name="campo65" maxlength="30" size="20" onBlur="this.value = convertTildes(this.value);">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <label for="">Entidad</label>
                                                        <input type="text" class="form-control" placeholder="entidad" name="campo66" size="20" maxlength="30">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <label for="">Cargo</label>
                                                        <input type="text" class="form-control" placeholder="cargo" name="campo67" size="20" maxlength="40">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <label for="">Telefono <small class="azul">(número y ext)</small></label>
                                                        <input type="text" class="form-control" placeholder="teléfono y ext" name="campo68" maxlength="30" size="15">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" placeholder="nombre" name="campo69" size="20" maxlength="30" onBlur="this.value = convertTildes(this.value);">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" placeholder="entidad" name="campo70" size="20" maxlength="30">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" placeholder="cargo" name="campo71" size="20" maxlength="40">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" placeholder="teléfono y ext" name="campo72" size="15" maxlength="30">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" placeholder="nombre" name="campo73" size="20" maxlength="30" onBlur="this.value = convertTildes(this.value);">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" placeholder="entidad" name="campo74" size="20" maxlength="30">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <input type="text" class="form-control" placeholder="cargo" name="campo75" size="20" maxlength="40" value="">
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">										
                                                        <input type="text" class="form-control" placeholder="teléfono y ext" name="campo76" size="15" maxlength="30">
                                                    </div>
                                                </div>
                                            </div>	                	
                                        </div>
                                    </div>
                                </div>

                                <!--OTRA INFORMACION-->
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingSix">
                                        <h4 class="panel-title">
                                            <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                                <strong><span class="rojo">PASO 6:</span></strong> Información adicional
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                                        <div class="panel-body">
                                            <div class="row">		
                                                <div class="col-xs-12 col-md-8">
                                                    <div class="form-group espaciado">			      
                                                        <p><strong>*</strong> ¿Cómo se enteró de la existencia de este programa de posgrado?</p>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-md-3">
                                                    <div class="form-group espaciado">
                                                        <select name="campo77" class="form-control">
                                                            <option value="" Selected><font size="3">Seleccione</font></option>
                                                            <%   Vector medios = new Vector();
                                                                Vector medio = admision.Medios();
                                                                for (int x = 0; x < medio.size(); x++) {
                                                                    medios = (Vector) medio.elementAt(x);%>
                                                            <option value="<%=medios.elementAt(0)%>"><font size="3"><%=medios.elementAt(1)%></font></option>
                                                            <% }%>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-md-1"></div>                			              
                                            </div>

                                            <div class="row">		              
                                                <div class="col-xs-12 col-md-12">
                                                    <div class="espaciado">
                                                        <p><strong>*</strong> ¿Cómo piensa financiar sus estudios?</p>
                                                    </div>

                                                    <div class="form-group espaciado">
                                                        <label class="radio-inline">
                                                            <input type="radio" name="campo78" value="4"> Préstamo
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="campo78" value="1"> Beca
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="campo78" value="5"> Entidad donde trabaja
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="campo78" value="3"> Familia
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="campo78" value="2"> Recursos propios
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="campo78" value="20"> Mixto
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <input name="nom_est" type="hidden" id="nom_est" value="<%=pginsc.elementAt(2)%>">
                                <input name="ref" type="hidden" id="ref" value="<%=pginsc.elementAt(0)%>">
                                <div class="row">
                                    <hr>
                                    <div class="col-xs-12 col-md-9">			                		
                                        <div class="form-group espaciado">
                                            <small></small>
                                        </div>
                                    </div>
                                    <input name="bi"  type="submit" class="btn btn primary" value="Enviar Solicitud" onClick="javascript: return validar();">
                                </div>
                        </form>	

                    </div>
                </div>
            </div>

            <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
            </div>
        </div>
    </div>

    <!--FOOTER-->
    <footer>
        <div class="container">
            <div class="row">
                <article class="redes col-xs-12 col-md-6">
                    <p>
                        Siganos en:<br/>

                    <ul>
                        <li><a href="https://www.facebook.com/Escuelacolingenieria" target="_blank"><img src="img/icono-facebook.svg" class="f"></a></li>
                        <li><a href="https://twitter.com/Escuelaing" target="_blank"><img src="img/icono-twitter.svg" class="t"></a></li>
                        <li><a href="http://instagram.com/escuelaing" target="_blank"><img src="img/icono-instagram.svg" class="i"></a></li>
                        <li><a href="https://www.youtube.com/user/escuelacolingenieria" target="_blank"><img src="img/icono-youtube.svg" class="y"></a></li>
                        <li><a href="https://www.linkedin.com/edu/school?id=11508" target="_blank"><img src="img/icono-linkedin.svg" class="l"></a></li>
                        <li><a href="http://www.pinterest.com/escuelacoling" target="_blank"><img src="img/icono-pinterest.svg" class="p"></a></li>
                    </ul>

                    ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO<br/>
                    AK.45 No.205-59 (Autopista Norte)<br/>
                    Contact Center: +57(1) 668 3600<br/>
                    LÃ­nea Nacional Gratuita: 018000112668<br/>
                    www.escuelaing.edu.co<br/><br/>
                    Bogotá, D.C. - Colombia<br/>						
                    </p>
                </article>
                <article class="iframe-video col-xs-12 col-md-6">
                    <p>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1987.9617427360993!2d-74.04338482936627!3d4.783148717834411!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f85e374627fe5%3A0x540783a0b074c84d!2sEscuela+Colombiana+de+Ingenier%C3%ADa!5e0!3m2!1ses!2ses!4v1424190444206" width="100%" height="auto" frameborder="0" style="border:0"></iframe>
                    </p>
                    <small>Todos los derechos reservados  2016 - Escuela Colombiana de Ingenieria Julio Garavito. <br>Personería Jurídica 086 de enero 19 de 1973. Institución sujeta a inspección y vigilancia por el Ministerio de Educación Nacional.</small>
                </article>
            </div>
        </div>
    </footer>
    <script src="js/jquery.js"></script>
    <script src="http://code.jquery.com/jquery-latest.jS"></script>
    <script src="js/bootstrap.min.js"></script>


</body>
</html>

<% } else
        response.sendRedirect("ErrorPago");%> </p>