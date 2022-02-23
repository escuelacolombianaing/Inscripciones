

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
        titulo = " Inscripciones en línea";
        /* Inscripciones Extemporáneas*/

        if (tipoest.equals("E") || tipoest.equals("T")) {
            titulo = "Inscripciones en línea";
        }

        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);
        if (pregrados.size() <= 0) {
            out.println("Este proceso no se encuentra habilitado o Falta información");
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

            if (tipoest.equals("N") || tipoest.equals("T")) {
                bachiller = request.getParameter("bachiller");
                icfes = request.getParameter("icfes");
                pais = request.getParameter("pais");
                colegio = request.getParameter("colegio");

            }

            if ((tipoest.equals("N") || tipoest.equals("T")) && (bachiller.equals("S") || bachiller.equals("N")) && icfes.equals("N")) {
                tipoest = "S";
            }

%>

<title>Solicitud de Inscripción</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link href="css/comun.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/estilo-fomularios.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

<SCRIPT LANGUAGE="JavaScript">
    function compruebanue() {
    var indi = document.form1.ingreso.selectedIndex;
    var tmp, valor;
    if (document.forms.form1.ingreso.options[indi].value == '0') {
    alert("Usted debe seleccionar si ingreso en alguna oportunidad a la Escuela");
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
    alert("Falta la informacion telefonica o el dato no es numérico");
    return false;
    }

    if (document.forms.form1.tel.value.length < 7) {
    alert("Por favor verifique el número de teléfono e ingrese un número válido.");
    return false;
    }

    if (document.forms.form1.ciudad.value == '') {
    alert("Usted debe proporcionar la ciudad de donde es el numero telefónico.");
    return false;
    }

    if (isNaN(document.forms.form1.doc.value) || (document.forms.form1.doc.value == '')) {
    alert("El documento de identidad no puede estar en blanco y debe ser dato numérico");
    return false;
    }

    if (document.forms.form1.numreg1.value == '') {
    alert("Por favor ingrese el número de Celular");
    return false;
    }

    if (document.forms.form1.numreg.value == '') {
    alert("El número de registro ICFES no puede estar en blanco");
    return false;
    }


    if (!(document.forms.form1.numreg.value == '')) {
    cadena = "";
    for (i = 0; i < 4; i++) {
    CActual = document.forms.form1.numreg.value.charAt(i)
    cadena = cadena + CActual;
    }
    cadena = cadena.toUpperCase();
    if ((cadena != 'AC20') && (cadena != 'VG20')) {
    alert("El número de registro ICFES no es correcto o no es de una version 2000 en adelante");
    return false;
    }
    }

    if (document.forms.form1.numreg.value.length != 14) {
    alert("El número de registro ICFES no es correcto, verifique que lo esta digitando bien.");
    return false;
    }


    if (document.getElementById("prog").value == "null") {
    alert("Usted debe seleccionar algún programa académico");
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


    function compruebanuext() {
    var indi = document.form1.ingreso.selectedIndex;
    var tmp;
    if (document.forms.form1.ingreso.options[indi].value == '0') {
    alert("Usted debe seleccionar si ingreso en alguna oportunidad a la Escuela");
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
    alert("Falta la informacion telefonica o el dato no es numérico");
    return false;
    }

    if (document.forms.form1.tel.value.length < 7) {
    alert("Por favor verifique el número de teléfono e ingrese un número válido.");
    return false;
    }

    if (document.forms.form1.ciudad.value == '') {
    alert("Usted debe proporcionar la ciudad de donde es el numero telefónico.");
    return false;
    }

    if (document.forms.form1.doc.value == '') {
    alert("El documento de identidad no puede estar en blanco.");
    return false;
    }

    /* if ( isNaN(document.forms.form1.doc.value ) || (document.forms.form1.doc.value == '')) {
    alert("El documento de identidad no puede estar en blanco y debe ser dato numérico");
    return false;
    }*/


    if (document.getElementById("prog").value == "null") {
    alert("Usted debe seleccionar algún programa académico");
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


    function compruebatrans( ) {

    var indi = document.form1.ingreso.selectedIndex;
    if (document.forms.form1.ingreso.options[indi].value == '0') {
    alert("Usted debe seleccionar si ingreso en alguna oportunidad a la Escuela");
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
    alert("Por favor verifique el número de teléfono e ingrese un número válido.");
    return false;
    }

    if (document.forms.form1.ciudad.value == '') {
    alert("Usted debe proporcionar la ciudad de donde es el numero telefónico.");
    return false;
    }

    if (isNaN(document.forms.form1.doc.value) || (document.forms.form1.doc.value == '')) {
    alert("El documento de identidad no puede estar en blanco y debe ser dato numérico");
    return false;
    }


    if ((document.forms.form1.numreg.value == '') && (document.forms.form1.numreg1.value == '')) {
    alert("Recuerde que usted debe registrar un número de registro ICFES, según sea su caso.");
    return false;
    }

    if ((!document.forms.form1.numreg.value == '') && (!document.forms.form1.numreg1.value == '')) {
    alert("Recuerde que usted debe ingresar sólo un número de registro ICFES, según sea su caso y no los dos.");
    return false;
    }

    if (!(document.forms.form1.numreg1.value == '')) {
    if (document.forms.form1.numreg1.value.length != 12) {
    alert("El número de registro ICFES no es correcto, verifique que lo esta digitando bien.");
    return false;
    }
    }

    if (!(document.forms.form1.numreg.value == '')) {
    if (document.forms.form1.numreg.value.length != 14) {
    alert("El número de registro ICFES no es correcto, verifique que lo esta digitando bien.");
    return false;
    }
    cadena = "";
    for (i = 0; i < 4; i++) {
    CActual = document.forms.form1.numreg.value.charAt(i)
    cadena = cadena + CActual;
    }
    cadena = cadena.toUpperCase();
    if ((cadena != 'AC20')) {
    alert("El número de registro ICFES no es correcto o no es de una version 2000 en adelente");
    return false;
    }
    }

    if (document.getElementById("prog").value == "null") {
    alert("Usted debe seleccionar algún programa académico");
    return false;
    }
    //else {

    //  if ( document.getElementById("prog").value == "260") {
    //    alert("Recuerde que INGENIERIA MECÁNICA  inició labores a partir del segundo periodo de 2009, por lo tanto para este programa, sólo se podrán homologar las asignaturas que correspondan a los tres primeros semestres del programa");
    //return false;
    //}
    //}

    valor = document.forms.form1.ema.value;

    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)) {
    return (true);
    } else {
    alert("Error: Por favor ingrese una dirección de correo válida");
    return (false);
    }

    return true;
    }



    function compruebareing( ) {

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
    alert("Falta la informacion telefonica o el dato no es numérico");
    return false;
    }

    if (document.form1.tel.value.length < 7) {
    alert("Por favor verifique el número de teléfono e ingrese un número válido.");
    return false;
    }

    if (document.forms.form1.ciudad.value == '') {
    alert("Usted debe proporcionar la ciudad de donde es el numero telefónico.");
    return false;
    }


    if (isNaN(document.forms.form1.doc.value) || (document.forms.form1.doc.value == '')) {
    alert("El documento de identidad no puede estar en blanco y debe ser dato numérico");
    return false;
    }

    if (document.getElementById("prog").value == "null") {
    alert("Usted debe seleccionar algún programa académico");
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

<script language="JavaScript" type="text/javascript">

    <!-- Begin
    function ignoreSpaces(string) {
    var temp = "";
    string = '' + string;
    splitstring = string.split(" ");
    for (i = 0; i < splitstring.length; i++)
    temp += splitstring[i];
    return temp;
    }
    //  End -->
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000">
    <%
        titulo="SOLICITUD DE NÚMERO DE REFERENCIA DE PAGO PARA HACER LA INSCRIPCIÓN";
        if (tipoest.equals("N") || tipoest.equals("S")) {
            titulo = "SOLICITUD DE NÚMERO DE REFERENCIA DE PAGO PARA HACER "
                    + "LA INSCRIPCIÓN A PRIMER SEMESTRE";
        }
        if (tipoest.equals("T")) {
            titulo = "SOLICITUD DE NÚMERO DE REFERENCIA DE PAGO PARA HACER "
                    + "LA INSCRIPCIÓN A TRANSFERENCIA";
        }
        if (tipoest.equals("M")) {
            titulo = "SOLICITUD DE NÚMERO DE REFERENCIA PARA HACER "
                    + "LA INSCRIPCIÓN A SEGUIMIENTO ACADÉMICO";
        }%>
    <jsp:include page="encabezado">
        <jsp:param name="titulo" value="" />
    </jsp:include>
    <div class="container-fluid contenidos">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <%if (ban == 0) {%>
                <p>
                <center><b>Este proceso sólo se habilitará en las fechas programadas que aparecen en el calendario de admisiones,<br> para cualquier información adicional,comuníquese al 6683600 opción 2 en el menú.</b></center>

                <%} else {%>

                <h5 align="center"><%=titulo%></h5>

                <table width="600" align="left">
                    <tr><td class="textocom">         
                            La Escuela se reserva el derecho de verificar la información
                            suministrada por usted respecto al Examen de Estado, por lo tanto, no
                            es necesario adjuntar el resultado impreso para efectos de su inscripción
                            pero asegúrese de registrar correctamente el número de registro SNP en
                            el formulario de admisión. 

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
                    }%>" action="CapturaSolicitud">

                    <input type="hidden" name="tipoest" value="<%=tipoest%>">
                    <input type="hidden" name="bachiller" value="<%=bachiller%>">
                    <input type="hidden" name="icfes" value="<%=icfes%>">
                    <input type="hidden" name="pais" value="<%=pais%>">
                    <input type="hidden" name="colegio" value="<%=colegio%>">

                    <table border="0" cellpadding="2" cellspacing="2" width="900" height="277" align="left" class="textocom">
                        <%if ((tipoest.equals("N")) || (tipoest.equals("T")) || (tipoest.equals("S"))) {%>
                        <tr bgcolor="#F3F3F3"> 
                            <td width="46%" height="23"> 
                                <div align="right"><b><font color="#CC0033">* </font>Ha ingresado 
                                        (matriculado) en alguna oportunidad anterior a un programa de pregrado 
                                        en la Escuela?</b></div>
                            </td>
                            <td  width="54%" height="23">&nbsp; 
                                <select name="ingreso" size="1" class="dato">
                                    <option value="0" selected>Seleccione</option>
                                    <option value="S">Si</option>
                                    <option value="N">No</option>
                                </select>
                            </td>
                        </tr>
                        <%}%>
                        <%if (tipoest.equals("N") || (tipoest.equals("T")) || (tipoest.equals("M")) || (tipoest.equals("S"))) {%>
                        <tr bgcolor="#F3F3F3"> 
                            <td bgcolor="#F3F3F3" width="42%" height="29"> 
                                <div align="right"> <b><font color="#CC0033">* </font></b> <b>Primer 
                                        apellido del aspirante </b></div>
                            </td>
                            <td bgcolor="#F3F3F3" width="58%" height="29"><strong> 
                                    <input type="text" class="dato" name="apellido1" size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);" >
                                </strong></td>
                        </tr>
                        <tr bgcolor="#F3F3F3"> 
                            <td bgcolor="#F3F3F3" width="42%" height="22"> 
                                <div align="right"><strong><b><font color="#CC0033">* </font></b>Segundo 
                                        apellido del aspirante&nbsp;</strong></div>
                            </td>
                            <td bgcolor="#F3F3F3" width="58%" height="22"><strong> 
                                    <input type="text" class="dato" name="apellido2" size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);" >
                                </strong></td>
                        </tr>
                        <tr bgcolor="#F3F3F3"> 
                            <td bgcolor="#F3F3F3" width="42%" height="22"> 
                                <div align="right"><b><font color="#CC0033">* </font>Nombres completos 
                                        del aspirante &nbsp;</b></div>
                            </td>
                            <td bgcolor="#F3F3F3" width="58%" height="22"><strong> 
                                    <input type="text"  class="dato" name="nom" size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);">
                                </strong></td>
                        </tr>
                        <tr bgcolor="#F3F3F3"> 
                            <td bgcolor="#F3F3F3" width="42%" height="50"> 
                                <div align="right">
                                    <p><b><font color="#CC0033">* </font>Teléfono</b></p>

                                </div>
                            </td>
                            <td bgcolor="#F3F3F3" width="58%" height="50"> 
                                <input type="text" class="dato1" name="tel" size="12"  >
                                <b>de ciudad</b> 
                                <input type="text" class="dato1" name="ciudad" size="15" maxlength="15">
                            </td>

                        </tr>
                        <tr> 
                            <td bgcolor="#F3F3F3" width="42%"> 
                                <div align="right"> <b></b> 
                                    <p><strong><b><font color="#CC0033">*</font></b>Dirección&nbsp; 
                                            <br>
                                            electrónica&nbsp; </strong> 
                                </div>
                            </td>
                            <td bgcolor="#F3F3F3" width="58%"><strong> 
                                    <input name="ema" class="dato" type="text"  size="35" maxlength="35">
                                </strong></td>
                        </tr>
                        <tr> 
                            <td bgcolor="#F3F3F3" width="42%"> 
                                <div align="right"> <b><font color="#CC0033">*</font></b><strong>Tipo Documento 
                                        identidad con el que presentó su Exámen de Estado Icfes&nbsp; <br>
                                    </strong> </div>
                            </td>
                            <td bgcolor="#F3F3F3" width="58%" height="24"> 
                                    <select name="tip_doc" class="dato">
                                        <option value="null" selected>Seleccione</option>
                                        <option value="TI">TI 
                                        <option value="CC">CC 
                                        <option value="CE">CE 
                                        <option value="PC">Pasaporte Colombiano 
                                        <option value="PE">Pasaporte Extranjero 
                                        <option value="CR">Contraseña Registraduría
                                    </select>
                                </td>
                        </tr>
                        <tr> 
                            <td bgcolor="#F3F3F3" width="42%"> 
                                <div align="right"> <b><font color="#CC0033">*</font></b><strong>Documento
                            identidad con el que presentó su Exámen de Estado Icfes&nbsp; </strong> </div>
                            </td>
                            <td bgcolor="#F3F3F3" width="58%"><strong> 
                                    <input type="text"  class="dato" name="doc" size="15"   maxlength="15" onBlur="this.value = ignoreSpaces(this.value);">
                                </strong></td>
                        </tr>
                        <%if (tipoest.equals("N") || tipoest.equals("S")) {%>
                        <tr> 
                            <td bgcolor="#F3F3F3" width="42%"> 
                                <div align="right"><b><font color="#CC0033">*</font></b><b>Celular&nbsp;</b></div>
                            </td>
                            <td bgcolor="#F3F3F3" width="58%"><font size="3"> 
                                <input type="text"  class="dato" name="numreg1" maxlength="14" size="14" >
                                </font></td>
                        </tr>
                        <%}%>
                        <%}%>
                        <!--&& icfes.equals("S")-->
                        <% if (tipoest.equals("N") || tipoest.equals("T")) {%>
                        <tr> 
                            <td bgcolor="#F3F3F3" width="42%"> 
                                <div align="right"><b><font color="#CC0033">*</font></b><b>Prueba 
                                        de estado (&uacute;nicamente versi&oacute;n a&ntilde;o 2000 &nbsp;en 
                                        adelante). N&uacute;mero de registro SNP&nbsp;</b></div>
                            </td>
                            <td bgcolor="#F3F3F3" width="58%"><font size="3"> 
                                <input type="text" class="dato" name="numreg" maxlength="14" size="14"  >
                                </font></td>
                        </tr>
                        <%}%>
                        <%if (tipoest.equals("T")) {%>
                        <tr> 
                            <td bgcolor="#F3F3F3" width="42%"> 
                                <div align="right"><b><font color="#CC0033">*</font></b><b>Prueba 
                                        de estado ICFES (versi&oacute;n ANTERIOR a&ntilde;o 2000 &nbsp;). 
                                        N&uacute;mero de registro SNP&nbsp;</b></div>
                            </td>
                            <td bgcolor="#F3F3F3" width="58%"><font size="3"> 
                                <input type="text" class="dato"  name="numreg1" maxlength="12" size="12" >
                                </font></td>
                        </tr>
                        <%}%>
                        <%if (tipoest.equals("N") || (tipoest.equals("M")) || (tipoest.equals("S"))) {%>
                        <tr> 
                            <td bgcolor="#F3F3F3" width="42%" height="24"> 
                                <div align="right"><b><font color="#CC0033">*</font></b><strong>Programa 
                                        &nbsp; </strong></div>
                            </td>
                            <td bgcolor="#F3F3F3" width="58%" height="24"> 
                                <select name="prog" size="1" id="prog"  class="dato">
                                    <option value="null" selected>Seleccione</option>
                                    <option value="19">Administración de Empresas</option>
                                    <option value="18">Economía</option>
                                    <option value="264">Ingeniería Ambiental</option>
                                    <option value="262">Ingeniería Biomédica</option>
                                    <option value="13">Ingeniería Civil</option>
                                    <option value="15">Ingeniería de Sistemas</option>
                                    <option value="16">Ingeniería Industrial</option>
                                    <option value="14">Ingeniería Eléctrica</option>
                                    <option value="17">Ingeniería Electrónica</option>
                                    <option value="260">Ingeniería Mecánica</option>
                                    <option value="20">Matemáticas</option>

                                    <input type="hidden" name="prog" value="prog"> 
                                </select>
                            </td>
                        </tr>
                        <%} else if (tipoest.equals("T")) {%>
                        <tr> 
                            <td bgcolor="#F3F3F3" width="42%" height="24"> 
                                <div align="right"><b><font color="#CC0033">*</font></b><strong>Programa 
                                        &nbsp; </strong></div>
                            </td>
                            <td  width="58%" height="24"> 
                                <select name="prog" size="1" id="prog"  class="dato">
                                    <option value="null" selected>Seleccione</option>
                                    <option value="19">Administración de Empresas</option>
                                    <option value="18">Economía</option>
                                    <option value="264">Ingeniería Ambiental</option>
                                    <option value="13">Ingeniería Civil</option>
                                    <option value="15">Ingeniería de Sistemas</option>
                                    <option value="16">Ingeniería Industrial</option>
                                    <option value="14">Ingeniería Eléctrica</option>
                                    <option value="17">Ingeniería Electrónica</option>
                                    <option value="20">Matemáticas</option>
                                    <option value="260">Ingeniería Mecánica</option>
                                    <!-- HABILITAR SOLO DENTRO DE LAS FECHAS DE BIOMEDICA -->
                                    <option value="262">Ingeniería Biomédica</option><input type="hidden" name="prog" value="prog"> 
                                </select>
                            </td>
                        </tr>
                        <% }%>
                        <%if (tipoest.equals("M")) {%>
                        <input type="hidden" name="ingreso" value="N">
                        <%}%>
                        <%if ((tipoest.equals("N") || tipoest.equals("S")) && icfes.equals("N")) {%>
                        <input type="hidden" name="numreg" value="">
                        <%}%>
                    </table>
                    <%}
                        }%>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-xs-12 col-md-3"></div>
                        <div class="col-xs-12 col-md-7">
                            <div class="submit">
                                <input class="boton" type="submit" value="Enviar Datos" />
                            </div>
                        </div>

                    </div>
                </form>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       

                <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Solicitud Referencia", e.getMessage());
    }
%>