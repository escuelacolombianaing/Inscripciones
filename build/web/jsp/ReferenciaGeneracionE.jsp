<%-- 
    Document   : ReferenciaGeneracionE
    Created on : 25/08/2015, 01:57:19 PM
    Author     : Lucero
--%>
<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    try {
        response.setHeader("Cache-Control", "no-cache");
//configeci.configuracion confEci = new configeci.configuracion();
        HttpSession sesion;
//sesion = request.getSession(true);
        String tipoest = request.getParameter("tipoest");
        String icfes = "", pais = "", colegio = "", bachiller = "";
        String titulo = new String("");
        configeci.configuracion confEci = new configeci.configuracion();
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        int ban = 0;
        //Convertir el dato String a Date para compararlo mas adelante.
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String fechaActual = formatter.format(hoy);
        titulo = " Inscripciones en l�nea";
        /* Inscripciones Extempor�neas*/

        if (tipoest.equals("E") || tipoest.equals("T")) {
            titulo = "Inscripciones en l�nea";
        }

        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);
        if (pregrados.size() <= 0) {
            out.println("Este proceso no se encuentra habilitado o Falta informaci�n");
        } else {
            Date fechafin = new Date();
            String dato = new String(pregrados.elementAt(1).toString());
            String prog = new String(pregrados.elementAt(3).toString());
            String datofin = new String(pregrados.elementAt(2).toString());

            Date inicio = formatter.parse(dato);
            Date finall = formatter.parse(datofin);
            String X = formatter.format(inicio);
            String Y = formatter.format(finall);
            if (prog.equals(tipoest)) {
                if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y)) && (pregrados.elementAt(5).equals("1"))) {
                    ban = 1;
                }
            }

            //  if (tipoest.equals("N")) {
            //   bachiller = request.getParameter("bachiller");
            //   icfes = request.getParameter("icfes");
            //   pais = request.getParameter("pais");
            //   colegio = request.getParameter("colegio");

            // }

            //  if (tipoest.equals("N") && (bachiller.equals("S") || bachiller.equals("N")) && icfes.equals("N")) {
            //  tipoest = "S";
            //  }

%>

<title>Solicitud de Inscripci�n</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link href="css/comun.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/estilo-fomularios.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<SCRIPT LANGUAGE="JavaScript">
    function compruebanue(){
    var indi = document.form1.ingreso.selectedIndex;
    var tmp, valor;
    if ( document.forms.form1.ingreso.options[indi].value == '0') {
    alert("Usted debe seleccionar si ingreso en alguna oportunidad a la Escuela");
    document.forms.form1.ingreso.style.backgroundColor= '#ffcc00';
    document.forms.form1.ingreso.focus();
    return false;
    }

    if ( document.forms.form1.apellido1.value == '') {
    alert("Los apellidos del aspirante no puede estar en blanco");
    document.forms.form1.apellido1.style.backgroundColor= '#ffcc00';
    document.forms.form1.apellido1.focus();
    return false;
    }

    if ( document.forms.form1.apellido2.value == '') {
    alert("Los apellidos del aspirante no puede estar en blanco");
    document.forms.form1.apellido2.style.backgroundColor= '#ffcc00';
    document.forms.form1.apellido2.focus();
    return false;
    }

    if ( document.forms.form1.nom.value == '') {
    alert("El nombre del aspirante no puede estar en blanco");
    document.forms.form1.nom.style.backgroundColor= '#ffcc00';
    document.forms.form1.nom.focus();
    return false;
    }

    if ( isNaN(document.forms.form1.tel.value ) || (document.forms.form1.tel.value == '')) {
    alert("Falta la informacion telefonica o el dato no es num�rico");
    document.forms.form1.tel.style.backgroundColor= '#ffcc00';
    document.forms.form1.tel.focus();
    return false;
    }

    if (document.forms.form1.tel.value.length <  7) {
    alert("Por favor verifique el n�mero de tel�fono e ingrese un n�mero v�lido.");
    document.forms.form1.tel.style.backgroundColor= '#ffcc00';
    document.forms.form1.tel.focus();
    return false;
    }

    if ( document.forms.form1.ciudad.value == '') {
    alert("Usted debe proporcionar la ciudad de donde es el numero telef�nico.");
    document.forms.form1.ciudad.style.backgroundColor= '#ffcc00';
    document.forms.form1.ciudad.focus();
    return false;
    }

    if ( isNaN(document.forms.form1.doc.value ) || (document.forms.form1.doc.value == '')) {
    alert("El documento de identidad no puede estar en blanco y debe ser dato num�rico");
    document.forms.form1.doc.style.backgroundColor= '#ffcc00';
    document.forms.form1.doc.focus();
    return false;
    }

    if ( document.forms.form1.numreg1.value == '') {
    alert("Por favor ingrese el n�mero de Celular");
    document.forms.form1.numreg1.style.backgroundColor= '#ffcc00';
    document.forms.form1.numreg1.focus();
    return false;
    }

    if ( document.forms.form1.numreg.value == '') {
    alert("El n�mero de registro ICFES no puede estar en blanco");
    document.forms.form1.numreg.style.backgroundColor= '#ffcc00';
    document.forms.form1.numreg.focus();
    return false;
    }


    if (!( document.forms.form1.numreg.value == '')) {
    cadena = "";
    for (i=0;i<4;i++){
    CActual = document.forms.form1.numreg.value.charAt(i)
    cadena=cadena+CActual;
    }
    cadena=cadena.toUpperCase();
    if ((cadena != 'AC20') && (cadena != 'VG20') ){
    alert("El n�mero de registro ICFES no es correcto.");
    return false;
    }

    cadena1="";
    for (j=0;j<7;j++){
    CActual = document.forms.form1.numreg.value.charAt(j)
    cadena1=cadena1+CActual;
    }
    
    cadena1=cadena1.toUpperCase();
    if ((cadena1.indexOf("AC2019") == -1)){
    alert("El n�mero de registro ICFES no corresponde a un periodo del 2019");
    return false;
    }
    
    }

    if (document.forms.form1.numreg.value.length !=  14) {
        
    alert("El n�mero de registro ICFES no es correcto, verifique que lo esta digitando bien.");
    document.forms.form1.numreg.style.backgroundColor= '#ffcc00';
    document.forms.form1.numreg.focus();
    return false;
    }


    if ( document.getElementById("prog").value == "null") {
    alert("Usted debe seleccionar alg�n programa acad�mico");
   //  document.forms.form1.prog.style.backgroundColor= '#ffcc00';
   // document.forms.form1.prog.focus();
    return false;
    }
    /**
    if (document.forms.form1.campo20.value < 2018) {
    alert("Usted NO cumple con los requisitos para aplicar a GENERACION E. Debe ser graduado en el a�o 2018.");
     document.forms.form1.campo20.style.backgroundColor= '#ffcc00';
    document.forms.form1.campo20.focus();
    return false;
    }
    */
    
    if ( document.getElementById("convenio").value == "null") {
    alert("Usted debe seleccionar el convenio");
     document.forms.form1.convenio.style.backgroundColor= '#ffcc00';
    document.forms.form1.convenio.focus();
    return false;
    }
        

    if (document.getElementById("convenio").value =="GE" && document.forms.form1.puntaje.value < 350) {
    alert("Usted NO cumple con el puntaje m�nimo para aplicar a GENERACION E,recuerde que el puntaje m�nimo es 350");
     document.forms.form1.puntaje.style.backgroundColor= '#ffcc00';
    document.forms.form1.puntaje.focus();
    return false;
    }
    
    /**
     if (document.getElementById("convenio").value =="PM" && document.forms.form1.puntaje.value < 313) {
    alert("Usted NO cumple con el puntaje m�nimo para aplicar a SER PILO PAGA, recuerde que para Pilos Mocoa el puntaje m�nimo es 313");
     document.forms.form1.puntaje.style.backgroundColor= '#ffcc00';
    document.forms.form1.puntaje.focus();
    return false;
    }
    
    if (document.getElementById("convenio").value =="PP" && document.forms.form1.puntaje.value < 318) {
    alert("Usted NO cumple con el puntaje m�nimo para aplicar a SER PILO PAGA, recuerde que para Pilos Pazc�fico el puntaje m�nimo es 318");
     document.forms.form1.puntaje.style.backgroundColor= '#ffcc00';
    document.forms.form1.puntaje.focus();
    return false;
    }
        */
    if ( isNaN(document.forms.form1.puntaje.value )) {
    alert("El puntaje icfes debe ser num�rico");
     document.forms.form1.puntaje.style.backgroundColor= '#ffcc00';
    document.forms.form1.puntaje.focus();
    return false;
    }




    valor = document.forms.form1.ema.value;

    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)){
    return (true);
    } else {
    alert("Error: Por favor ingrese una direcci�n de correo v�lida");
    return (false);
    }




    return true;
    }


    function compruebanuext(){
    var indi = document.form1.ingreso.selectedIndex;
    var tmp;
    if ( document.forms.form1.ingreso.options[indi].value == '0') {
    alert("Usted debe seleccionar si ingreso en alguna oportunidad a la Escuela");
    return false;
    }

    if ( document.forms.form1.apellido1.value == '') {
    alert("Los apellidos del aspirante no puede estar en blanco");
    return false;
    }

    if ( document.forms.form1.apellido2.value == '') {
    alert("Los apellidos del aspirante no puede estar en blanco");
    return false;
    }

    if ( document.forms.form1.nom.value == '') {
    alert("El nombre del aspirante no puede estar en blanco");
    return false;
    }

    if ( isNaN(document.forms.form1.tel.value ) || (document.forms.form1.tel.value == '')) {
    alert("Falta la informacion telefonica o el dato no es num�rico");
    return false;
    }

    if (document.forms.form1.tel.value.length <  7) {
    alert("Por favor verifique el n�mero de tel�fono e ingrese un n�mero v�lido.");
    return false;
    }

    if ( document.forms.form1.ciudad.value == '') {
    alert("Usted debe proporcionar la ciudad de donde es el numero telef�nico.");
    return false;
    }

    if ( document.forms.form1.doc.value == '') {
    alert("El documento de identidad no puede estar en blanco.");
    return false;
    }       

    /* if ( isNaN(document.forms.form1.doc.value ) || (document.forms.form1.doc.value == '')) {
    alert("El documento de identidad no puede estar en blanco y debe ser dato num�rico");
    return false;
    }*/


    if ( document.getElementById("prog").value == "null") {
    alert("Usted debe seleccionar alg�n programa acad�mico");
    return false;
    }

    valor = document.forms.form1.ema.value;

    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)){
    return (true);
    } else {
    alert("Error: Por favor ingrese una direcci�n de correo v�lida");
    return (false);
    }

    return true;
    }


    function compruebatrans( ){

    var indi = document.form1.ingreso.selectedIndex;
    if ( document.forms.form1.ingreso.options[indi].value == '0') {
    alert("Usted debe seleccionar si ingreso en alguna oportunidad a la Escuela");
    return false;
    }

    if ( document.forms.form1.apellido1.value == '') {
    alert("Los apellidos del aspirante no puede estar en blanco");
    return false;
    }

    if ( document.forms.form1.apellido2.value == '') {
    alert("Los apellidos del aspirante no puede estar en blanco");
    return false;
    }

    if ( document.forms.form1.nom.value == '') {
    alert("El nombre del aspirante no puede estar en blanco");
    return false;
    }

    if ( isNaN(document.forms.form1.tel.value ) || (document.forms.form1.tel.value == '')) {
    alert("Falta la informaci�n telef�nica o el dato no es num�rico");
    return false;
    }

    if (document.forms.form1.tel.value.length <  7) {
    alert("Por favor verifique el n�mero de tel�fono e ingrese un n�mero v�lido.");
    return false;
    }

    if ( document.forms.form1.ciudad.value == '') {
    alert("Usted debe proporcionar la ciudad de donde es el numero telef�nico.");
    return false;
    }

    if ( isNaN(document.forms.form1.doc.value ) || (document.forms.form1.doc.value == '')) {
    alert("El documento de identidad no puede estar en blanco y debe ser dato num�rico");
    return false;
    }


    if ((document.forms.form1.numreg.value == '') && (document.forms.form1.numreg1.value == '')) {
    alert("Recuerde que usted debe registrar un n�mero de registro ICFES, seg�n sea su caso.");
    return false;
    }

    if ((!document.forms.form1.numreg.value == '') && (!document.forms.form1.numreg1.value == '')) {
    alert("Recuerde que usted debe ingresar s�lo un n�mero de registro ICFES, seg�n sea su caso y no los dos.");
    return false;
    }

    if (!( document.forms.form1.numreg1.value == '')) {
    if (document.forms.form1.numreg1.value.length !=  12) {
    alert("El n�mero de registro ICFES no es correcto, verifique que lo esta digitando bien.");
    return false;
    }
    }

    if (!( document.forms.form1.numreg.value == '')) {
    if (document.forms.form1.numreg.value.length !=  14) {
    alert("El n�mero de registro ICFES no es correcto, verifique que lo esta digitando bien.");
    return false;
    }
    cadena = "";
    for (i=0;i<4;i++){
    CActual = document.forms.form1.numreg.value.charAt(i)
    cadena=cadena+CActual;
    }
    cadena=cadena.toUpperCase();
    if ((cadena != 'AC20')){
    alert("El n�mero de registro ICFES no es correcto o no es de una version 2000 en adelente");
    return false;
    }


    }

    if ( document.getElementById("prog").value == "null") {
    alert("Usted debe seleccionar alg�n programa acad�mico");
    return false;
    }
    
    if (document.forms.form1.puntaje.value < 350) {
    alert("Usted NO cumple con el puntaje de 350 m�nimo para aplicar a Generaci�n E");
    return false;
    }
    



    //else {

    //  if ( document.getElementById("prog").value == "260") {
    //    alert("Recuerde que INGENIERIA MEC�NICA  inici� labores a partir del segundo periodo de 2009, por lo tanto para este programa, s�lo se podr�n homologar las asignaturas que correspondan a los tres primeros semestres del programa");
    //return false;
    //}
    //}

    valor = document.forms.form1.ema.value;

    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)){
    return (true);
    } else {
    alert("Error: Por favor ingrese una direcci�n de correo v�lida");
    return (false);
    }

    return true;
    }



    function compruebareing( ){

    if ( document.forms.form1.apellido1.value == '') {
    alert("Los apellidos del aspirante no puede estar en blanco");
    return false;
    }

    if ( document.forms.form1.apellido2.value == '') {
    alert("Los apellidos del aspirante no puede estar en blanco");
    return false;
    }

    if ( document.forms.form1.nom.value == '') {
    alert("El nombre del aspirante no puede estar en blanco");
    return false;
    }
    if ( isNaN(document.forms.form1.tel.value ) || (document.forms.form1.tel.value == '') ) {
    alert("Falta la informacion telefonica o el dato no es num�rico");
    return false;
    }

    if (document.form1.tel.value.length <  7) {
    alert("Por favor verifique el n�mero de tel�fono e ingrese un n�mero v�lido.");
    return false;
    }

    if ( document.forms.form1.ciudad.value == '') {
    alert("Usted debe proporcionar la ciudad de donde es el numero telef�nico.");
    return false;
    }


    if ( isNaN(document.forms.form1.doc.value ) || (document.forms.form1.doc.value == '')) {
    alert("El documento de identidad no puede estar en blanco y debe ser dato num�rico");
    return false;
    }
    
    if ( document.getElementById("prog").value == "null") {
    alert("Usted debe seleccionar alg�n programa acad�mico");
    return false;
    }

    valor = document.forms.form1.ema.value;

    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)){
    return (true);
    } else {
    alert("Error: Por favor ingrese una direcci�n de correo v�lida");
    return (false);
    }

    return true;
    }



    function convertTildes(str) {
    var out = "", flag = 0;
    for (i = 0; i < str.length; i++) {
    if ((str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�")
    && (str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�")){
    out += str.charAt(i);
    flag = 0;
    }
    else {
    if((flag == 0) && (str.charAt(i)=="�")){
    out += "i";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="�")){
    out += "a";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="�")){
    out += "e";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="�")){
    out += "o";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="�")){
    out += "u";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="�")){
    out += "A";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="�")){
    out += "E";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="�")){
    out += "I";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="�")){
    out += "O";
    flag = 1;
    }
    if((flag == 0) && (str.charAt(i)=="�")){
    out += "U";
    flag = 1;
    }
    }
    }
    return out;
    }


</SCRIPT>

<script language="JavaScript" type="text/javascript">

    <!-- Begin
    function ignoreSpaces(string) {
    var temp = "";
    string = '' + string;
    splitstring = string.split(" ");
    for(i = 0; i < splitstring.length; i++)
    temp += splitstring[i];
    return temp;
    }
    //  End -->
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000">
    <%
        if (tipoest.equals("N") || tipoest.equals("S")) {
            titulo = "SOLICITUD DE N�MERO DE REFERENCIA DE PAGO PARA HACER "
                    + "LA INSCRIPCI�N A PRIMER SEMESTRE";
        }
        if (tipoest.equals("T")) {
            titulo = "SOLICITUD DE N�MERO DE REFERENCIA DE PAGO PARA HACER "
                    + "LA INSCRIPCI�N A TRANSFERENCIA";
        }
        if (tipoest.equals("M")) {
            titulo = "SOLICITUD DE N�MERO DE REFERENCIA DE PAGO PARA HACER "
                    + "LA INSCRIPCI�N A SEGUIMIENTO ACAD�MICO";
        }%>
    <jsp:include page="encabezado">
        <jsp:param name="titulo" value="SOLICITUD DE N�MERO DE REFERENCIA PARA HACER LA INSCRIPCI�N GENERACION E" />
    </jsp:include>
     <div class="container-fluid contenidos">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-10">
    <% ban = 1 ;
    if (ban == 0) {%>
    <center><b><p class="textocom">Este proceso no se encuentra habilitado, s�lo se habilitar� en las fechas programadas que aparecen en el calendario de admisiones,<br> para cualquier informaci�n adicional, comun�quese al 6683600 opci�n 2 en el men�.</p></b></center>
         <br>
<%} else {%>

<table width="640" align="center">
    <tr><td>

            <p class="textocom">La Escuela se reserva el derecho de verificar la informaci�n
                suministrada por usted respecto al Examen de Estado, por lo tanto, no
                es necesario adjuntar el resultado impreso para efectos de su inscripci�n
                pero aseg�rese de registrar correctamente el n�mero de registro SNP en
                el formulario de admisi�n. </p>

            <p class="textocom">Las solicitudes de admisi&oacute;n de aspirantes que no cumplan con el requisito
                m&iacute;nimo de puntajes en las &aacute;reas de inter&eacute;s, ser&aacute;n
                rechazadas. </p>
        </td></tr></table>
<form name="form1" id="form1" method="POST" onSubmit="<%if (tipoest.equals("N")) {
        out.println("return compruebanue();");
    } else if ((tipoest.equals("N") || tipoest.equals("S")) && icfes.equals("N")) {
        out.println("return compruebanuext();");
    } else if (tipoest.equals("M")) {
        out.println("return compruebareing( )");
    } else if (tipoest.equals("T")) {
        out.println("return compruebatrans( )");
    }%>" action="CapturaRefPiloPaga">
    <input type="hidden" name="tipoest" value="<%=tipoest%>">
    <input type="hidden" name="bachiller" value="<%=bachiller%>">
    <input type="hidden" name="icfes" value="<%=icfes%>">
    <input type="hidden" name="pais" value="<%=pais%>">
    <input type="hidden" name="colegio" value="<%=colegio%>">
    
        <table border="0" cellpadding="2" cellspacing="2" width="640" height="277" align="center" class="textocom">
          <%if ((tipoest.equals("N")) || (tipoest.equals("T")) || (tipoest.equals("S"))) {%>
          <tr bgcolor="#F3F3F3"> 
            <td bgcolor="#F3F3F3" width="50%" height="23"> 
              <div align="right"><b><font color="#CC0033">* </font>Ha ingresado 
                (matriculado) en alguna oportunidad anterior a un programa de 
                pregrado en la Escuela?</b></div>
            </td>
            <td bgcolor="#F3F3F3" width="50%" height="23">&nbsp; 
              <select name="ingreso" size="1" class="dato">
                <option value="0" selected>Seleccione</option>
                <option value="S">Si</option>
                <option value="N">NO</option>
              </select>
            </td>
          </tr>
          <%}%>
          <%if (tipoest.equals("N") || (tipoest.equals("T")) || (tipoest.equals("M")) || (tipoest.equals("S"))) {%>
          <tr bgcolor="#F3F3F3"> 
            <td bgcolor="#F3F3F3" width="50%" height="29"> 
              <div align="right"> <strong> <b><font color="#CC0033">* </font></b>Primer 
                apellido del aspirante&nbsp; </strong> </div>
            </td>
            <td bgcolor="#F3F3F3" width="50%" height="29"><strong> 
              <input type="text" name="apellido1" size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);"  class="dato1" >
              </strong></td>
          </tr>
          <tr bgcolor="#F3F3F3"> 
            <td bgcolor="#F3F3F3" width="50%" height="22"> 
              <div align="right"><strong><b><font color="#CC0033">* </font></b>Segundo 
                apellido del aspirante&nbsp;</strong></div>
            </td>
            <td bgcolor="#F3F3F3" width="50%" height="22"><strong> 
              <input type="text" name="apellido2" size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);"  class="dato1" >
              </strong></td>
          </tr>
          <tr bgcolor="#F3F3F3"> 
            <td bgcolor="#F3F3F3" width="50%" height="22"> 
              <div align="right"><b><font color="#CC0033">* </font>Nombres completos 
                del aspirante &nbsp;</b></div>
            </td>
            <td bgcolor="#F3F3F3" width="50%" height="22"><strong> 
              <input type="text" name="nom" size="40" maxlength="40"  class="dato"  onBlur="this.value = convertTildes(this.value);">
              </strong></td>
          </tr>
          <tr bgcolor="#F3F3F3"> 
            <td bgcolor="#F3F3F3" width="46%" height="50"> 
              <div align="right"> 
                <p><b><font color="#CC0033">* </font>Tel�fono</b></p>
              </div>
            </td>
            <td bgcolor="#F3F3F3" width="54%" height="50"> 
              <input type="text" class="dato1" name="tel" size="12"  >
              <b>de ciudad</b> 
              <input type="text" class="dato1" name="ciudad" size="15" maxlength="15"  >
            </td>
          </tr>
          <tr> 
            <td bgcolor="#F3F3F3" width="50%"> 
              <div align="right"> <b></b> 
                <p><strong><b><font color="#CC0033">*</font></b>Direcci�n&nbsp; 
                  <br>
                  electr�nica&nbsp; </strong> 
              </div>
            </td>
            <td bgcolor="#F3F3F3" width="50%"><strong> 
              <input name="ema" type="text"  class="dato"  size="35" maxlength="35">
              </strong></td>
          </tr>
          <tr> 
            <td bgcolor="#F3F3F3" width="50%"> 
              <div align="right"> <b><font color="#CC0033">*</font></b><strong>Documento
                            identidad con el que present� su Ex�men de Estado Icfes&nbsp; </strong> </div>
            </td>
            <td bgcolor="#F3F3F3" width="50%"><strong> 
              <input type="text" name="doc" size="15"  class="dato1"  maxlength="15" onBlur="this.value = ignoreSpaces(this.value);">
              </strong></td>
          </tr>
          
          
          <tr> 
              <td bgcolor="#F3F3F3" width="50%" height="24"> 
                  <div align="right"><b><font color="#CC0033">*</font></b><strong>Tipo Documento 
                                        identidad con el que present� su Ex�men de Estado Icfes&nbsp; </strong></div>
              </td>
              <td bgcolor="#F3F3F3" width="50%" height="24">
                <select name="tip_doc" id='tip_doc' size='1' class="dato1">
                    <option value="null" selected>Seleccione</option>
                    <option value="TI">TI 
                    <option value="CC">CC 
                    <option value="CE">CE 
                    <option value="PC">Pasaporte Colombiano 
                    <option value="PE">Pasaporte Extranjero 
                    <option value="CR">Contrase�a Registradur�a
                </select>
                </td>
            </tr>
          <%if (tipoest.equals("N")) {%>
          <tr> 
            <td bgcolor="#F3F3F3" width="50%"> 
              <div align="right"><b><font color="#CC0033">*</font></b><b>Celular&nbsp;</b></div>
            </td>
            <td bgcolor="#F3F3F3" width="50%"><font size="3"> 
              <input type="text" name="numreg1" maxlength="14" size="14" class="dato1" >
              </font></td>
          </tr>
          <%}%>
          <%}%>
          <!--&& icfes.equals("S")-->
          <% if (tipoest.equals("N")) {%>
          <tr> 
            <td bgcolor="#F3F3F3" width="50%"> 
              <div align="right"><b><font color="#CC0033">*</font></b><b>Prueba 
                de estado (&uacute;nicamente versi&oacute;n a&ntilde;o 2019). 
                N&uacute;mero de registro SNP&nbsp;</b></div>
            </td>
            <td bgcolor="#F3F3F3" width="50%"><font size="3"> 
              <input type="text" name="numreg" maxlength="14" size="14"  class="dato1" >
              </font></td>
          </tr>
          <%}%>
          <%if (tipoest.equals("N")) {%>
          <tr> 
            <td bgcolor="#F3F3F3" width="50%" height="24"> 
              <div align="right"><b><font color="#CC0033">*</font></b><strong>Programa 
                &nbsp; </strong></div>
            </td>
            <td bgcolor="#F3F3F3" width="50%" height="24"> 
              <select name="prog" size="1" id="prog"  class="dato1" >
                <option value="null" selected>Seleccione</option>
                <option value="19">Administraci�n de Empresas</option>
                <option value="18">Econom�a</option>
                <option value="13">Ingenier�a Civil</option>
                <option value="15">Ingenier�a de Sistemas</option>
                <option value="16">Ingenier�a Industrial</option>
                <option value="14">Ingenier�a El�ctrica</option>
                <option value="17">Ingenier�a Electr�nica</option>
                <option value="20">Matem�ticas</option>
                <option value="260">Ingenier�a Mec�nica</option>
                <option value="264">Ingenier�a Ambiental</option>
                <!-- HABILITAR SOLO DENTRO DE LAS FECHAS DE BIOMEDICA -->
                <option value="262">Ingenier�a Biom�dica</option>
              
              </select>
            </td>
          </tr>
          <tr> 
            <td bgcolor="#F3F3F3" width="50%" height="24"> 
              <div align="right"><b><font color="#CC0033">*</font></b><strong>Fecha 
                de grado</strong></div>
            </td>
            <td bgcolor="#F3F3F3" colspan="2" height="42"> 
              <p>Mes 
                <select name="campo19" class="dato1"  id="campo19">
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
                A&ntilde;o 
                <input name="campo20" type="text" class="dato1"  id="campo20" size="4" maxlength="4">
              </p>
            </td>
          </tr>
          <input type="hidden" name="convenio" id="convenio" value="GE">
          <%if(false){%>
          <tr> 
            <td bgcolor="#F3F3F3" width="50%" height="24"> 
              <div align="right"><b><font color="#CC0033">*</font>Seleccione el 
                convenio</b></div>
            </td>
            <td bgcolor="#F3F3F3" width="50%" height="24"> 
              <select name="convenio" size="1" id="convenio"  class="dato1" >
                <option value="null" selected>Seleccione</option>
                <option value="P4">Convenio Nacional SPP4</option>
                <option value="PM">Pilos Mocoa</option>
                <option value="PP">Pilos Pazc�fico</option>
              </select>
            </td>
          </tr>
          <%}%>
          <%}%>
          <tr> 
            <td bgcolor="#F3F3F3" width="50%" height="24"> 
              <div align="right"><b><font color="#CC0033">*</font></b><strong>Puntaje 
                global Icfes &nbsp; </strong></div>
            </td>
            <td bgcolor="#F3F3F3" width="50%" height="24"><font size="3"> 
              <input type="text" name="puntaje" maxlength="3" size="3"  class="dato1" >
              </font> </td>
          </tr>
          <%if (tipoest.equals("M")) {%>
          <input type="hidden" name="ingreso" value="N">
          <%}%>
          <%if ((tipoest.equals("N") || tipoest.equals("S")) && icfes.equals("N")) {%>
          <input type="hidden" name="numreg" value="">
          <%}%>
        </table>
  
     
    <%}
            }%>

 <div class="row">
                        <div class="col-xs-12 col-md-4"></div>
                        <div class="col-xs-12 col-md-7">
                            <div class="submit">
                                <input class="boton" type="submit" value="Enviar" />
                            </div>
                        </div>
                      						
                    </div>
                </form>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
           <div class="row">
                        <div class="col-xs-12 col-md-4"></div>
                        <div class="col-xs-12 col-md-7">
<div class="proteccionDatos"><small>Protecci�n de datos: La Escuela Colombiana de Ingenier�a Julio Garavito le garantizar� a los titulares de la informaci�n, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteraci�n, p�rdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizar�n para informarlos sobre nuestra oferta acad�mica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                                                               </div>
            </div>
        </div>
        </div>
    </div>
     </div>
<!--jsp:include page="piepag">
    <!--jsp:param name="parametro" value="" />
<!--/jsp:include-->
</body>
</html>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Solicitud Referencia Generacion E", e.getMessage());
    }
%>