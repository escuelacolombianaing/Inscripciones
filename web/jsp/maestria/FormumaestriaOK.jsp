<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
    configeci.configmaestria confEci = new configeci.configmaestria();
//Vector programas = confEci.getActivos();
    BDadmisiones admision = new BDadmisiones();
    String ref = request.getParameter("ref");
    String doc = request.getParameter("doc");
    Vector pginsc = admision.getInscrito(doc, ref);
    String idplan = request.getParameter("idplan");
    Vector ciud = admision.getCiudades();
    Vector pais = admision.getPaises();
    String prog = "";
    if (idplan.equals("290")) {
        prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
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
    if(idplan.equals("371")){
        prog="MAESTRÍA EN INFORMÁTICA";
    }
    if(idplan.equals("372")){
        prog="MAESTRÍA EN CIENCIAS ACTUARIALES";
    }
    if(idplan.equals("376")){
        prog="MAESTRÍA EN CIENCIA DE DATOS - MODALIDAD DE PROFUNDIZACIÓN";
    }
    if(idplan.equals("377")){
        prog="MAESTRÍA EN CIENCIA DE DATOS - MODALIDAD DE INVESTIGACIÓN";
    }
    if (pginsc.size() > 0) {
%>
<html>
    <head>
        <title>Formulario de Inscripci&oacute;n Maestría</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
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

                var indice = document.form1.campo1.selectedIndex;
                var in1 = document.form1.campo26.selectedIndex;
                var in2 = document.form1.campo30.selectedIndex;
                var in3 = document.form1.campo31.selectedIndex;
                var in4 = document.form1.campo36.selectedIndex;
                var in5 = document.form1.campo10.selectedIndex;
                var valor;

                if ( document.forms.form1.campo1.options[indice].value == 0) {
                    alert("Usted debe seleccionar el énfasis al cual aspira ingresar.");
                    document.form1.campo1.style.backgroundColor= '#ffcc00';
                    return false;
                }

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

                


                var indice1 = document.form1.campo5.selectedIndex;
                if ( document.forms.form1.campo5.options[indice1].value == 'N') {
                    alert("Usted debe seleccionar un día de nacimiento");
                    document.form1.campo5.style.backgroundColor= '#ffcc00';
                    return false;
                }

              

                var ind = document.form1.campo6.selectedIndex;
                if ( document.forms.form1.campo6.options[ind].value == 'N') {
                    alert("Usted debe seleccionar un mes de nacimiento");
                    document.form1.campo6.style.backgroundColor= '#ffcc00';    return false;
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
                
                if ( document.forms.form1.campo8.value=='M' ) {
                    if ( (document.forms.form1.libreta.value == "") || (document.forms.form1.distrito.value == "")) {
                        alert("La información de Libreta Militar y Distrito NO pueden estar en blanco");
                        document.form1.libreta.style.backgroundColor= '#ffcc00';
                        return false;
                    }
                }

                indice = document.getElementById("campo10").selectedIndex;
                if( indice == null || indice == 0 ) {
                    alert("Usted debe seleccionar el PAIS de nacimiento");
                    return false;
                }

                if ( document.forms.form1.campo11.value == '') {
                    alert("El campo de documento no puede estar en blanco");
                    document.form1.campo11.style.backgroundColor= '#ffcc00';
                    return false;
                }
                if ( isNaN(document.forms.form1.campo11.value ) ) {
                    alert("El documento de identidad debe ser un dato numérico");
                    document.form1.campo11.style.backgroundColor= '#ffcc00';
                    return false;
                }

                if ( !document.forms.form1.campo12.value == 'null' ) {
                    alert("Debe seleccionar un tipo de Documento de identidad");
                    document.form1.campo12.style.backgroundColor= '#ffcc00';
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


                if (document.forms.form1.promedio.value == ''){
                    alert("Debe digitar el promedio de la carrera.");
                    document.form1.promedio.style.backgroundColor= '#ffcc00';
                    return false;
                }

                var ind11 = document.form1.campo16.selectedIndex;
                if ( document.forms.form1.campo16.options[ind11].value == '0') {
                    alert("Usted debe seleccionar una ciudad de residencia");
                    document.form1.campo16.style.backgroundColor= '#ffcc00';
                    return false;
                }


                valor = document.form1.campo20.value;

                if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)){
                    return (true);
                } else {
                    alert("Error: Por favor ingrese una direccion de correo válida");
                    return (false);
                }

                if ( document.forms.form1.campo22.value == '' || document.forms.form1.campo23.value == '' || document.forms.form1.campo24.value == '') {
                    alert("Los campos de nombre, dirección y teléfono de la persona a quien se puede contactar no deben estar en blanco");
                    document.form1.campo22.style.backgroundColor= '#ffcc00';
                    document.form1.campo23.style.backgroundColor= '#ffcc00';
                    return false;
                }

                if ( isNaN(document.forms.form1.campo24.value ) ) {
                    alert("Recuerde que el número telefónico debe ser un dato numérico");
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
                        alert("El año de inicio de estudios universitarios de pregrado debe ser dato numérico");
                        document.form1.campo33.style.backgroundColor= '#ffcc00';
                        return false;
                    }
                    if (document.forms.form1.campo33.value == ''){
                        alert("Debe digitar el año de inicio de estudios universitarios de pregrado");
                        document.form1.campo33.style.backgroundColor= '#ffcc00';
                        return false;
                    }
                    if (document.forms.form1.campo33.value.length != 4) {
                        alert("El año de inicio de estudios universitarios de pregrado no esta correcto, recuerde es de cuatro digitos");
                        document.form1.campo33.style.backgroundColor= '#ffcc00';
                        return false;
                    }
                    if ( isNaN(document.forms.form1.campo34.value ) ) {
                        alert("El año de finalización de estudios universitarios de pregrado debe ser dato numérico");
                        document.form1.campo34.style.backgroundColor= '#ffcc00';
                        return false;
                    }
                    if (document.forms.form1.campo34.value == ''){
                        alert("Debe digitar el año de finalización de estudios universitarios de pregrado");
                        document.form1.campo34.style.backgroundColor= '#ffcc00';
                        return false;
                    }
                    if (document.forms.form1.campo34.value.length != 4) {
                        alert("El año de finalización de estudios universitarios de pregrado no esta correcto, recuerde es de cuatro digitos");
                        document.form1.campo34.style.backgroundColor= '#ffcc00';
                        return false;
                    }
                    if ( document.forms.form1.campo32.value == '' || document.forms.form1.campo35.value == '') {
                        alert("Los campos de programa y grado obtenido en los estudios universitario de pregrado no deben estar en blanco");
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
                        document.form1.campo45.style.backgroundColor= '#ffcc00';
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

                /* if ( !document.forms.form1.campo77[0].checked && !document.forms.form1.campo77[1].checked && !document.forms.form1.campo77[2].checked && !document.forms.form1.campo77[3].checked &&
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
    </head>
    <body>

        <A name="arriba" id="arriba"/>
        <table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
            <!-- fwtable fwsrc="encabezado.png" fwbase="encabezado.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
            <tr>
                <td><img src="img/spacer.gif" width="97" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="123" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="155" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="265" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="1" height="1" border="0" alt=""></td>
            </tr>
            <tr>
                <td rowspan="2"><img name="encabezado_r1_c1" src="img/encabezado_r1_c1.gif" width="97" height="70" border="0" alt=""></td>
                <td rowspan="2"><img name="encabezado_r1_c2" src="img/encabezado_r1_c2.gif" width="123" height="70" border="0" alt=""></td>
                <td><img name="encabezado_r1_c3" src="img/encabezado_r1_c3.gif" width="155" height="37" border="0" alt=""></td>
                <td rowspan="2"><img name="encabezado_r1_c4" src="img/encabezado_r1_c4.gif" width="265" height="70" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="1" height="37" border="0" alt=""></td>
            </tr>
            <tr>
                <td><img name="encabezado_r2_c3" src="img/encabezado_r2_c3.gif" width="155" height="33" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="1" height="33" border="0" alt=""></td>
            </tr>
        </table>
        <br>
        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td> <fieldset><legend class="textocom"><strong>Solicitud de Admisión a la Maestría </strong></legend>
                        <div align="center" class="textocom"><br></div>

                        <legend class="textocom">Los campos marcados con un asterisco (<b><font color=#ff0000>*</font></b>)
                            son campos obligatorios

                            <form  name="form1"  method="post" onSubmit="return comprueba( );" action="GrabaEstudianteMa" >
                                <table width="640" border="0" cellpadding="1" cellspacing="1" class="textocom">
                                    <tr>
                                        <td colspan="2"><b> <b><font color="#990000">*</font></b>Programa: </b> </td>
                                        <td colspan="2">
                                            <%if (idplan.equals("353")||idplan.equals("371")||idplan.equals("372")) {%>
                                            <select name="campo1" class="campotext">
                                                <option value="N" ><b>Seleccione</b>

                                                <option value="<%=idplan%>" selected><%=prog%></option>

                                            </select>
                                            <%} else if (idplan.equals("321")) {%>
                                            <select name="campo1" class="campotext">
                                                <option value="N" ><b>Seleccione</b>
                                                <option value="321" <%if (pginsc.elementAt(1).equals("321")) {
                                                        out.println("selected");
                                                    }%>>MODALIDAD DE PROFUNDIZACIÓN</option>
                                                <option value="322" <%if (pginsc.elementAt(1).equals("322")) {
                                                        out.println("selected");
                                                    }%>>MODALIDAD DE INVESTIGACIÓN</option>
                                            </select>
                                            <%} else if (idplan.equals("351")) {%>
                                            <select name="campo1" class="campotext">
                                                <option value="N" ><b>Seleccione</b></option>
                                                <option value="351" <%if (pginsc.elementAt(1).equals("351")) {
                                                        out.println("selected");
                                                    }%>>MODALIDAD DE PROFUNDIZACIÓN</option>

                                            </select>
                                            <%} else if (idplan.equals("330")) {%>
                                            <select name="campo1" class="campotext">
                                                <option value="N" ><b>Seleccione</b></option>
                                                <option value="330" <%if (pginsc.elementAt(1).equals("330")) {
                                                        out.println("selected");
                                                    }%>>MODALIDAD DE PROFUNDIZACIÓN</option>
                                                <option value="331" <%if (pginsc.elementAt(1).equals("331")) {
                                                        out.println("selected");
                                                    }%>>MODALIDAD DE INVESTIGACIÓN</option>
                                            </select>
                                            <%} else {%>
                                            <select name="campo1" class="campotext">
                                                <option value="N" ><b>Seleccione</b></option>
                                                <option value="290" <%if (pginsc.elementAt(1).equals("290")) {
                                                        out.println("selected");
                                                    }%>>ENFASIS EN RECURSOS HIDRAULICOS Y MEDIO
                                                    AMBIENTE</option>
                                                <option value="291" <%if (pginsc.elementAt(1).equals("291")) {
                                                        out.println("selected");
                                                    }%>>ENFASIS EN INGENIERIA ESTRUCTURAL</option>
                                                <option value="292" <%if (pginsc.elementAt(1).equals("292")) {
                                                        out.println("selected");
                                                    }%>>ENFASIS EN INGENIERIA AMBIENTAL</option>
                                                <option value="293" <%if (pginsc.elementAt(1).equals("293")) {
                                                        out.println("selected");
                                                    }%>>ENFASIS EN GEOTECNICA-PROFUNDIZACION</option>
                                                <option value="294" <%if (pginsc.elementAt(1).equals("294")) {
                                                        out.println("selected");
                                                    }%>>ENFASIS EN TRANSITO Y TRANSPORTE-PROFUNDIZACION</option>

                                            </select>
                                            <%}%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong>I. DATOS PERSONALES</strong> </td>
                                    </tr>
                                    <tr>
                                        <td width="89"><b><b><font color="#990000">*</font></b>Primer Apellido</b></td>
                                        <td width="262">
                                            <input type="text" class="campotext" name="ape1"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(7)%>">
                                        </td>
                                        <td colspan="2">
                                            <div align="left"><b>Segundo Apellido</b>
                                                <input type="text" class="campotext" name="ape2"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(8)%>">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> <b><b><font color="#990000">*</font></b>Nombre completo del Aspirante:</b>
                                        </td>
                                        <td>
                                            <input type="text" class="campotext" name="campo2"  size="30" maxlength="30" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(9)%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="85"> <strong><font color="#990000">*</font>Ciudad de nacimiento:</strong></td>
                                        <td width="260"><b>
                                                <select name="campo4" class="campotext" id="campo4">
                                                    <option value="" selected> Seleccione</option>
                                                    <%
                                                        Vector detciud = new Vector();
                                                        for (int i = 0; i < ciud.size(); i++) {
                                                            detciud = (Vector) ciud.elementAt(i);
                                                    %>
                                                    <option value="<%=detciud.elementAt(0)%>"><%=detciud.elementAt(1)%></option>
                                                    <%
                                                        }
                                                    %>
                                                    <option value="0">Otra</option>
                                                </select>
                                            </b></td>

                                        <td width="328">
                                            <p><font color="#990000">*</font> <strong>Pa&iacute;s de nacimiento:
                                                    <select name="campo10" class="campotext" id="campo10">
                                                        <option value="" selected><strong>Seleccione</strong></option>
                                                        <%
                                                            Vector detpais = new Vector();
                                                            for (int i = 0; i < pais.size(); i++) {
                                                                detpais = (Vector) pais.elementAt(i);
                                                        %>
                                                        <option value="<%=detpais.elementAt(0)%>"><strong><%=detpais.elementAt(1)%></strong></option>
                                                            <%
                                                                }
                                                            %>
                                                        <option value="0"><strong>Otra</strong></option>
                                                    </select>
                                                </strong></p>
                                        </td>

                                        <td width="198"><strong> </strong></td>
                                    </tr>
                                    <tr>
                                        <td width="89"><strong> <b><b><font color="#990000">*</font></b></b>Fecha
                                                de Nacimiento:</strong></td>
                                        <td colspan="3"><b> <strong>Dia</strong>
                                                <select name="campo5" class="campotext" id="campo5">
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
                                                &nbsp;&nbsp;<strong>&nbsp;Mes</strong>
                                                <select name="campo6" class="campotext" id="campo6">
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
                                                &nbsp;&nbsp;<strong>&nbsp;A&ntilde;o</strong>
                                                <input name="campo7" type="text" class="campotext" id="campo7" size="5" maxlength="4">
                                            </b></td>
                                    </tr>
                                    <tr>
                                        <td width="89"><strong> Sexo: </strong></td>
                                        <td width="262"><strong>
                                                <select name="campo8" class="campotext" id="campo8">
                                                    <option value="M" selected>Masculino
                                                    <option value="F">Femenino
                                                </select>
                                            </strong> </td>
                                        <td width="324">
                                            <div align="left"><strong><b><b><font color="#990000">*</font></b></b>Estado
                                                    Civil:
                                                    <select name="campo9" class="campotext" id="campo9">
                                                        <option value="S" selected><strong>Soltero(A) </strong>
                                                        <option value="C"><strong>Casado(A) </strong>
                                                        <option value="P"><strong>Separado(A) </strong>
                                                        <option value="V"><strong>Viudo(A) </strong>
                                                        <option value="U"><strong>Unión Libre </strong>
                                                    </select>
                                                </strong></div>
                                        </td>
                                        <td width="192"><strong> </strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><strong><b><b><font color="#990000">*</font></b></b>Documento
                                                de identidad No:</strong>
                                            <input type="text" class="campotext" name="campo11"  size="18" maxlength="20" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(3)%>">
                                        </td>
                                        <td width="324"><strong><b><b><font color="#990000">*</font></b></b>Tipo
                                                de documento</strong>:<b>
                                                <select name="campo12" class="campotext">
                                                    <option value="null" selected><b>Seleccione</b></option>
                                                    <option value="C"><b>CC </b>
                                                    <option value="E"><b>CE </b>
                                                    <option value="O"><b>OTRO </b>
                                                </select>
                                            </b> </td>
                                        <td width="192">
                                            <div align="left"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="89" height="37"><b><font color="#990000">*</font>Libreta
                                                militar No.</b> </td>
                                        <td width="262" height="37">
                                            <input name="libreta" type="text" class="campotext" id="libreta" size="10" maxlength="15">
                                        </td>
                                        <td width="324" height="37">
                                            <div align="left"><b><font color="#990000">*</font>Distrito No.</b><strong>
                                                    <input name="distrito" type="text" class="campotext" id="distrito" size="3" maxlength="3">
                                                </strong> </div>
                                        </td>
                                        <td width="192" height="37">&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3"><strong><b><b><font color="#990000">*</font></b></b>Direcci&oacute;n
                                                de residencia:
                                                <input name="campo14" type="text" class="campotext" id="campo13" size="50" maxlength="35">
                                            </strong></td>
                                        <td width="192">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="89"><strong>Tel&eacute;fono: </strong></td>
                                        <td width="262">
                                            <input name="campo15" type="text" class="campotext" id="campo15" maxlength="15">
                                        </td>
                                        <td width="324">
                                            <div align="left"><strong> Ciudad:</strong>
                                                <select name="campo16" class="campotext">
                                                    <option value="0" selected>SELECCIONE</option>
                                                    <option value="691">ACACIAS-META</option>
                                                    <option value="137">ARAUCA-ARAUCA</option>
                                                    <option value="138">ARAUQUITA-ARAUCA</option>
                                                    <option value="27">ARMENIA-ANTIOQUIA</option>
                                                    <option value="962">ARMERO-TOLIMA</option>
                                                    <option value="28">BARBOSA-ANTIOQUIA</option>
                                                    <option value="852">BARRANCABERMEJA-SANTANDER</option>
                                                    <option value="619">BARRANCAS-GUAJIRA</option>
                                                    <option value="144">BARRANQUILLA-ATLANTICO</option>
                                                    <option value="210">BELEN-BOYACA</option>
                                                    <option value="1">BOGOTA-CUNDINAMARCA</option>
                                                    <option value="846">BUCARAMANGA-SANTANDER</option>
                                                    <option value="511">CAJICA-CUNDINAMARCA</option>
                                                    <option value="1003">CALI-VALLE</option>
                                                    <option value="513">CAQUEZA-CUNDINAMARCA</option>
                                                    <option value="514">CARMEN DE CARUPA-CUNDINAMARCA</option>
                                                    <option value="174">CARTAGENA-BOLIVAR</option>
                                                    <option value="967">CHAPARRAL-TOLIMA</option>
                                                    <option value="516">CHIA-CUNDINAMARCA</option>
                                                    <option value="222">CHIQUINQUIRA-BOYACA</option>
                                                    <option value="518">CHOACHI-CUNDINAMARCA</option>
                                                    <option value="227">CIENEGA-BOYACA</option>
                                                    <option value="520">COGUA-CUNDINAMARCA</option>
                                                    <option value="937">COROZAL-SUCRE</option>
                                                    <option value="521">COTA-CUNDINAMARCA</option>
                                                    <option value="770">CUCUTA-NTE SANTANDER</option>
                                                    <option value="695">CUMARAL-META</option>
                                                    <option value="237">DUITAMA-BOYACA</option>
                                                    <option value="181">EL GUAMO-BOLIVAR</option>
                                                    <option value="169">ENGATIVA-CUNDINAMARCA</option>
                                                    <option value="972">ESPINAL-TOLIMA</option>
                                                    <option value="525">FACATATIVA-CUNDINAMARCA</option>
                                                    <option value="354">FLORENCIA-CAQUETA</option>
                                                    <option value="526">FOMEQUE-CUNDINAMARCA</option>
                                                    <option value="698">FUENTE DE ORO-META</option>
                                                    <option value="528">FUNZA-CUNDINAMARCA</option>
                                                    <option value="530">FUSAGASUGA-CUNDINAMARCA</option>
                                                    <option value="532">GACHANCIPA-CUNDINAMARCA</option>
                                                    <option value="533">GACHETA-CUNDINAMARCA</option>
                                                    <option value="244">GARAGOA-BOYACA</option>
                                                    <option value="641">GARZON-HUILA</option>
                                                    <option value="642">GIGANTE-HUILA</option>
                                                    <option value="1022">GINEBRA-VALLE</option>
                                                    <option value="535">GIRARDOT-CUNDINAMARCA</option>
                                                    <option value="976">GUAMO-TOLIMA</option>
                                                    <option value="538">GUASCA-CUNDINAMARCA</option>
                                                    <option value="246">GUATEQUE-BOYACA</option>
                                                    <option value="978">HONDA-TOLIMA</option>
                                                    <option value="957">IBAGUE-TOLIMA</option>
                                                    <option value="546">LA CALERA-CUNDINAMARCA</option>
                                                    <option value="253">LA CAPILLA-BOYACA</option>
                                                    <option value="336">LA DORADA-CALDAS</option>
                                                    <option value="547">LA MESA-CUNDINAMARCA</option>
                                                    <option value="553">MADRID-CUNDINAMARCA</option>
                                                    <option value="182">MAGANGUE-BOLIVAR</option>
                                                    <option value="377">MANI-CASANARE</option>
                                                    <option value="262">MONIQUIRA-BOYACA</option>
                                                    <option value="486">MONTELIBANO-CORDOBA</option>
                                                    <option value="475">MONTERIA-CORDOBA</option>
                                                    <option value="378">MONTERREY-CASANARE</option>
                                                    <option value="556">MOSQUERA-CUNDINAMARCA</option>
                                                    <option value="985">NATAGAIMA-TOLIMA</option>
                                                    <option value="631">NEIVA-HUILA</option>
                                                    <option value="558">NEMOCON-CUNDINAMARCA</option>
                                                    <option value="792">OCA\A-NTE SANTANDER</option>
                                                    <option value="1063">OCAÑA-NTE SANTANDER</option>
                                                    <option value="00">OTRA</option>
                                                    <option value="566">PARATEBUENO-CUNDINAMARCA</option>
                                                    <option value="714">PASTO-NARIÑO</option>
                                                    <option value="381">PAZ DE ARIPORO-CASANARE</option>
                                                    <option value="830">PEREIRA-RISARALDA</option>
                                                    <option value="277">PESCA-BOYACA</option>
                                                    <option value="655">PITALITO-HUILA</option>
                                                    <option value="391">POPAYAN-CAUCA</option>
                                                    <option value="907">PUENTE NACIONAL-SANTANDER</option>
                                                    <option value="279">PUERTO BOYACA-BOYACA</option>
                                                    <option value="455">QUIBDO-CHOCO</option>
                                                    <option value="618">RIOHACHA-GUAJIRA</option>
                                                    <option value="97">SABANALARGA-ANTIOQUIA</option>
                                                    <option value="994">SALDA\A-TOLIMA</option>
                                                    <option value="453">SAN MARTIN-CESAR</option>
                                                    <option value="669">SANTA MARTA-MAGDALENA</option>
                                                    <option value="295">SANTA ROSA DE VITERBO-BOYACA</option>
                                                    <option value="581">SESQUILE-CUNDINAMARCA</option>
                                                    <option value="584">SIMIJACA-CUNDINAMARCA</option>
                                                    <option value="933">SINCELEJO-SUCRE</option>
                                                    <option value="585">SOACHA-CUNDINAMARCA</option>
                                                    <option value="302">SOCHA-BOYACA</option>
                                                    <option value="303">SOGAMOSO-BOYACA</option>
                                                    <option value="304">SOMONDOCO-BOYACA</option>
                                                    <option value="586">SOPO-CUNDINAMARCA</option>
                                                    <option value="306">SOTAQUIRA-BOYACA</option>
                                                    <option value="171">SUBA-CUNDINAMARCA</option>
                                                    <option value="588">SUESCA-CUNDINAMARCA</option>
                                                    <option value="592">TABIO-CUNDINAMARCA</option>
                                                    <option value="388">TAURAMENA-CASANARE</option>
                                                    <option value="595">TENJO-CUNDINAMARCA</option>
                                                    <option value="312">TENZA-BOYACA</option>
                                                    <option value="314">TIBASOSA-BOYACA</option>
                                                    <option value="665">TIMANA-HUILA</option>
                                                    <option value="599">TOCANCIPA-CUNDINAMARCA</option>
                                                    <option value="1038">TULUA-VALLE</option>
                                                    <option value="206">TUNJA-BOYACA</option>
                                                    <option value="603">UBATE-CUNDINAMARCA</option>
                                                    <option value="127">VALDIVIA-ANTIOQUIA</option>
                                                    <option value="431">VALLEDUPAR-CESAR</option>
                                                    <option value="256">VILLA DE LEIVA-BOYACA</option>
                                                    <option value="204">VILLANUEVA-BOLIVAR</option>
                                                    <option value="610">VILLAPINZON-CUNDINAMARCA</option>
                                                    <option value="690">VILLAVICENCIO-META</option>
                                                    <option value="611">VILLETA-CUNDINAMARCA</option>
                                                    <option value="372">YOPAL-CASANARE</option>
                                                    <option value="328">ZETAQUIRA-BOYACA</option>
                                                    <option value="615">ZIPAQUIRA-CUNDINAMARCA</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td width="192">&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td width="89"><strong>Direcci&oacute;n de Oficina: </strong></td>
                                        <td width="262"><strong>
                                                <input name="campo17" type="text" class="campotext" id="campo18" size="50" maxlength="35">
                                            </strong></td>
                                        <td width="324">&nbsp;</td>
                                        <td width="192">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="89"><strong>Tel&eacute;fono: </strong></td>
                                        <td width="262">
                                            <input name="campo18" type="text" class="campotext" id="campo18" maxlength="15">
                                        </td>
                                        <td width="324">
                                            <div align="left"><strong>Ciudad:</strong> <font size="3"><font color="#00714D"><font color="#00714D"><font color="#000000">
                                                <select name="campo19" class="campotext">
                                                    <option value="0" selected>SELECCIONE</option>
                                                    <option value="691">ACACIAS-META</option>
                                                    <option value="137">ARAUCA-ARAUCA</option>
                                                    <option value="138">ARAUQUITA-ARAUCA</option>
                                                    <option value="27">ARMENIA-ANTIOQUIA</option>
                                                    <option value="962">ARMERO-TOLIMA</option>
                                                    <option value="28">BARBOSA-ANTIOQUIA</option>
                                                    <option value="852">BARRANCABERMEJA-SANTANDER</option>
                                                    <option value="619">BARRANCAS-GUAJIRA</option>
                                                    <option value="144">BARRANQUILLA-ATLANTICO</option>
                                                    <option value="210">BELEN-BOYACA</option>
                                                    <option value="1">BOGOTA-CUNDINAMARCA</option>
                                                    <option value="846">BUCARAMANGA-SANTANDER</option>
                                                    <option value="511">CAJICA-CUNDINAMARCA</option>
                                                    <option value="1003">CALI-VALLE</option>
                                                    <option value="513">CAQUEZA-CUNDINAMARCA</option>
                                                    <option value="514">CARMEN DE CARUPA-CUNDINAMARCA</option>
                                                    <option value="174">CARTAGENA-BOLIVAR</option>
                                                    <option value="967">CHAPARRAL-TOLIMA</option>
                                                    <option value="516">CHIA-CUNDINAMARCA</option>
                                                    <option value="222">CHIQUINQUIRA-BOYACA</option>
                                                    <option value="518">CHOACHI-CUNDINAMARCA</option>
                                                    <option value="227">CIENEGA-BOYACA</option>
                                                    <option value="520">COGUA-CUNDINAMARCA</option>
                                                    <option value="937">COROZAL-SUCRE</option>
                                                    <option value="521">COTA-CUNDINAMARCA</option>
                                                    <option value="770">CUCUTA-NTE SANTANDER</option>
                                                    <option value="695">CUMARAL-META</option>
                                                    <option value="237">DUITAMA-BOYACA</option>
                                                    <option value="181">EL GUAMO-BOLIVAR</option>
                                                    <option value="169">ENGATIVA-CUNDINAMARCA</option>
                                                    <option value="972">ESPINAL-TOLIMA</option>
                                                    <option value="525">FACATATIVA-CUNDINAMARCA</option>
                                                    <option value="354">FLORENCIA-CAQUETA</option>
                                                    <option value="526">FOMEQUE-CUNDINAMARCA</option>
                                                    <option value="698">FUENTE DE ORO-META</option>
                                                    <option value="528">FUNZA-CUNDINAMARCA</option>
                                                    <option value="530">FUSAGASUGA-CUNDINAMARCA</option>
                                                    <option value="532">GACHANCIPA-CUNDINAMARCA</option>
                                                    <option value="533">GACHETA-CUNDINAMARCA</option>
                                                    <option value="244">GARAGOA-BOYACA</option>
                                                    <option value="641">GARZON-HUILA</option>
                                                    <option value="642">GIGANTE-HUILA</option>
                                                    <option value="1022">GINEBRA-VALLE</option>
                                                    <option value="535">GIRARDOT-CUNDINAMARCA</option>
                                                    <option value="976">GUAMO-TOLIMA</option>
                                                    <option value="538">GUASCA-CUNDINAMARCA</option>
                                                    <option value="246">GUATEQUE-BOYACA</option>
                                                    <option value="978">HONDA-TOLIMA</option>
                                                    <option value="957">IBAGUE-TOLIMA</option>
                                                    <option value="546">LA CALERA-CUNDINAMARCA</option>
                                                    <option value="253">LA CAPILLA-BOYACA</option>
                                                    <option value="336">LA DORADA-CALDAS</option>
                                                    <option value="547">LA MESA-CUNDINAMARCA</option>
                                                    <option value="553">MADRID-CUNDINAMARCA</option>
                                                    <option value="182">MAGANGUE-BOLIVAR</option>
                                                    <option value="377">MANI-CASANARE</option>
                                                    <option value="262">MONIQUIRA-BOYACA</option>
                                                    <option value="486">MONTELIBANO-CORDOBA</option>
                                                    <option value="475">MONTERIA-CORDOBA</option>
                                                    <option value="378">MONTERREY-CASANARE</option>
                                                    <option value="556">MOSQUERA-CUNDINAMARCA</option>
                                                    <option value="985">NATAGAIMA-TOLIMA</option>
                                                    <option value="631">NEIVA-HUILA</option>
                                                    <option value="558">NEMOCON-CUNDINAMARCA</option>
                                                    <option value="792">OCA\A-NTE SANTANDER</option>
                                                    <option value="1063">OCAÑA-NTE SANTANDER</option>
                                                    <option value="00">OTRA</option>
                                                    <option value="566">PARATEBUENO-CUNDINAMARCA</option>
                                                    <option value="714">PASTO-NARIÑO</option>
                                                    <option value="381">PAZ DE ARIPORO-CASANARE</option>
                                                    <option value="830">PEREIRA-RISARALDA</option>
                                                    <option value="277">PESCA-BOYACA</option>
                                                    <option value="655">PITALITO-HUILA</option>
                                                    <option value="391">POPAYAN-CAUCA</option>
                                                    <option value="907">PUENTE NACIONAL-SANTANDER</option>
                                                    <option value="279">PUERTO BOYACA-BOYACA</option>
                                                    <option value="455">QUIBDO-CHOCO</option>
                                                    <option value="618">RIOHACHA-GUAJIRA</option>
                                                    <option value="97">SABANALARGA-ANTIOQUIA</option>
                                                    <option value="994">SALDA\A-TOLIMA</option>
                                                    <option value="453">SAN MARTIN-CESAR</option>
                                                    <option value="669">SANTA MARTA-MAGDALENA</option>
                                                    <option value="295">SANTA ROSA DE VITERBO-BOYACA</option>
                                                    <option value="581">SESQUILE-CUNDINAMARCA</option>
                                                    <option value="584">SIMIJACA-CUNDINAMARCA</option>
                                                    <option value="933">SINCELEJO-SUCRE</option>
                                                    <option value="585">SOACHA-CUNDINAMARCA</option>
                                                    <option value="302">SOCHA-BOYACA</option>
                                                    <option value="303">SOGAMOSO-BOYACA</option>
                                                    <option value="304">SOMONDOCO-BOYACA</option>
                                                    <option value="586">SOPO-CUNDINAMARCA</option>
                                                    <option value="306">SOTAQUIRA-BOYACA</option>
                                                    <option value="171">SUBA-CUNDINAMARCA</option>
                                                    <option value="588">SUESCA-CUNDINAMARCA</option>
                                                    <option value="592">TABIO-CUNDINAMARCA</option>
                                                    <option value="388">TAURAMENA-CASANARE</option>
                                                    <option value="595">TENJO-CUNDINAMARCA</option>
                                                    <option value="312">TENZA-BOYACA</option>
                                                    <option value="314">TIBASOSA-BOYACA</option>
                                                    <option value="665">TIMANA-HUILA</option>
                                                    <option value="599">TOCANCIPA-CUNDINAMARCA</option>
                                                    <option value="1038">TULUA-VALLE</option>
                                                    <option value="206">TUNJA-BOYACA</option>
                                                    <option value="603">UBATE-CUNDINAMARCA</option>
                                                    <option value="127">VALDIVIA-ANTIOQUIA</option>
                                                    <option value="431">VALLEDUPAR-CESAR</option>
                                                    <option value="256">VILLA DE LEIVA-BOYACA</option>
                                                    <option value="204">VILLANUEVA-BOLIVAR</option>
                                                    <option value="610">VILLAPINZON-CUNDINAMARCA</option>
                                                    <option value="690">VILLAVICENCIO-META</option>
                                                    <option value="611">VILLETA-CUNDINAMARCA</option>
                                                    <option value="372">YOPAL-CASANARE</option>
                                                    <option value="328">ZETAQUIRA-BOYACA</option>
                                                    <option value="615">ZIPAQUIRA-CUNDINAMARCA</option>
                                                </select>
                                                </font></font></font></font></div>
                                        </td>
                                        <td width="192"><font size="3"><font color="#00714D"><font color="#00714D"><font color="#000000">
                                            </font></font></font></font></td>
                                    </tr>
                                    <tr>
                                        <td width="89"><strong>Correo electr&oacute;nico</strong>: </td>
                                        <td width="262">
                                            <input type="text" class="campotext" name="campo20" size="20" maxlength="30">
                                        </td>
                                        <td width="324">
                                            <div align="left"><b>Celular:
                                                    <input name="campo21" type="text" class="campotext" size="10" maxlength="10">
                                                </b></div>
                                        </td>
                                        <td width="192">&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b><b><font color="#990000">*</font></b>Persona a
                                                quien contactar en caso de emergencia:
                                                <input type="text" class="campotext" name="campo22" size="50" maxlength="40"  onBlur="this.value = convertTildes(this.value);">
                                            </b></td>
                                    </tr>
                                    <tr>
                                        <td width="89"><strong><b><b><font color="#990000">*</font></b></b>Direcci&oacute;n
                                            </strong> :</td>
                                        <td width="262">
                                            <input type="text" class="campotext" name="campo23" size="30" maxlength="30">
                                        </td>
                                        <td width="324">&nbsp;</td>
                                        <td width="192">&nbsp;</td>
                                    </tr>
                                    <!%if(tipo.equals("T")){%>
                                    <tr>
                                        <td width="89"><strong><b><b><font color="#990000">*</font></b></b>Tel&eacute;fono:
                                            </strong></td>
                                        <td width="262">
                                            <input name="campo24" type="text" class="campotext" id="campo24" maxlength="15">
                                        </td>
                                        <td width="324">
                                            <div align="left"><strong>Ciudad:</strong>
                                                <select name="campo25" class="campotext" >
                                                    <option value="0" selected>SELECCIONE</option>
                                                    <option value="691">ACACIAS-META</option>
                                                    <option value="137">ARAUCA-ARAUCA</option>
                                                    <option value="138">ARAUQUITA-ARAUCA</option>
                                                    <option value="27">ARMENIA-ANTIOQUIA</option>
                                                    <option value="962">ARMERO-TOLIMA</option>
                                                    <option value="28">BARBOSA-ANTIOQUIA</option>
                                                    <option value="852">BARRANCABERMEJA-SANTANDER</option>
                                                    <option value="619">BARRANCAS-GUAJIRA</option>
                                                    <option value="144">BARRANQUILLA-ATLANTICO</option>
                                                    <option value="210">BELEN-BOYACA</option>
                                                    <option value="1">BOGOTA-CUNDINAMARCA</option>
                                                    <option value="846">BUCARAMANGA-SANTANDER</option>
                                                    <option value="511">CAJICA-CUNDINAMARCA</option>
                                                    <option value="1003">CALI-VALLE</option>
                                                    <option value="513">CAQUEZA-CUNDINAMARCA</option>
                                                    <option value="514">CARMEN DE CARUPA-CUNDINAMARCA</option>
                                                    <option value="174">CARTAGENA-BOLIVAR</option>
                                                    <option value="967">CHAPARRAL-TOLIMA</option>
                                                    <option value="516">CHIA-CUNDINAMARCA</option>
                                                    <option value="222">CHIQUINQUIRA-BOYACA</option>
                                                    <option value="518">CHOACHI-CUNDINAMARCA</option>
                                                    <option value="227">CIENEGA-BOYACA</option>
                                                    <option value="520">COGUA-CUNDINAMARCA</option>
                                                    <option value="937">COROZAL-SUCRE</option>
                                                    <option value="521">COTA-CUNDINAMARCA</option>
                                                    <option value="770">CUCUTA-NTE SANTANDER</option>
                                                    <option value="695">CUMARAL-META</option>
                                                    <option value="237">DUITAMA-BOYACA</option>
                                                    <option value="181">EL GUAMO-BOLIVAR</option>
                                                    <option value="169">ENGATIVA-CUNDINAMARCA</option>
                                                    <option value="972">ESPINAL-TOLIMA</option>
                                                    <option value="525">FACATATIVA-CUNDINAMARCA</option>
                                                    <option value="354">FLORENCIA-CAQUETA</option>
                                                    <option value="526">FOMEQUE-CUNDINAMARCA</option>
                                                    <option value="698">FUENTE DE ORO-META</option>
                                                    <option value="528">FUNZA-CUNDINAMARCA</option>
                                                    <option value="530">FUSAGASUGA-CUNDINAMARCA</option>
                                                    <option value="532">GACHANCIPA-CUNDINAMARCA</option>
                                                    <option value="533">GACHETA-CUNDINAMARCA</option>
                                                    <option value="244">GARAGOA-BOYACA</option>
                                                    <option value="641">GARZON-HUILA</option>
                                                    <option value="642">GIGANTE-HUILA</option>
                                                    <option value="1022">GINEBRA-VALLE</option>
                                                    <option value="535">GIRARDOT-CUNDINAMARCA</option>
                                                    <option value="976">GUAMO-TOLIMA</option>
                                                    <option value="538">GUASCA-CUNDINAMARCA</option>
                                                    <option value="246">GUATEQUE-BOYACA</option>
                                                    <option value="978">HONDA-TOLIMA</option>
                                                    <option value="957">IBAGUE-TOLIMA</option>
                                                    <option value="546">LA CALERA-CUNDINAMARCA</option>
                                                    <option value="253">LA CAPILLA-BOYACA</option>
                                                    <option value="336">LA DORADA-CALDAS</option>
                                                    <option value="547">LA MESA-CUNDINAMARCA</option>
                                                    <option value="553">MADRID-CUNDINAMARCA</option>
                                                    <option value="182">MAGANGUE-BOLIVAR</option>
                                                    <option value="377">MANI-CASANARE</option>
                                                    <option value="262">MONIQUIRA-BOYACA</option>
                                                    <option value="486">MONTELIBANO-CORDOBA</option>
                                                    <option value="475">MONTERIA-CORDOBA</option>
                                                    <option value="378">MONTERREY-CASANARE</option>
                                                    <option value="556">MOSQUERA-CUNDINAMARCA</option>
                                                    <option value="985">NATAGAIMA-TOLIMA</option>
                                                    <option value="631">NEIVA-HUILA</option>
                                                    <option value="558">NEMOCON-CUNDINAMARCA</option>
                                                    <option value="792">OCA\A-NTE SANTANDER</option>
                                                    <option value="1063">OCAÑA-NTE SANTANDER</option>
                                                    <option value="566">PARATEBUENO-CUNDINAMARCA</option>
                                                    <option value="714">PASTO-NARIÑO</option>
                                                    <option value="381">PAZ DE ARIPORO-CASANARE</option>
                                                    <option value="830">PEREIRA-RISARALDA</option>
                                                    <option value="277">PESCA-BOYACA</option>
                                                    <option value="655">PITALITO-HUILA</option>
                                                    <option value="391">POPAYAN-CAUCA</option>
                                                    <option value="907">PUENTE NACIONAL-SANTANDER</option>
                                                    <option value="279">PUERTO BOYACA-BOYACA</option>
                                                    <option value="455">QUIBDO-CHOCO</option>
                                                    <option value="618">RIOHACHA-GUAJIRA</option>
                                                    <option value="97">SABANALARGA-ANTIOQUIA</option>
                                                    <option value="994">SALDA\A-TOLIMA</option>
                                                    <option value="453">SAN MARTIN-CESAR</option>
                                                    <option value="669">SANTA MARTA-MAGDALENA</option>
                                                    <option value="295">SANTA ROSA DE VITERBO-BOYACA</option>
                                                    <option value="581">SESQUILE-CUNDINAMARCA</option>
                                                    <option value="584">SIMIJACA-CUNDINAMARCA</option>
                                                    <option value="933">SINCELEJO-SUCRE</option>
                                                    <option value="585">SOACHA-CUNDINAMARCA</option>
                                                    <option value="302">SOCHA-BOYACA</option>
                                                    <option value="303">SOGAMOSO-BOYACA</option>
                                                    <option value="304">SOMONDOCO-BOYACA</option>
                                                    <option value="586">SOPO-CUNDINAMARCA</option>
                                                    <option value="306">SOTAQUIRA-BOYACA</option>
                                                    <option value="171">SUBA-CUNDINAMARCA</option>
                                                    <option value="588">SUESCA-CUNDINAMARCA</option>
                                                    <option value="592">TABIO-CUNDINAMARCA</option>
                                                    <option value="388">TAURAMENA-CASANARE</option>
                                                    <option value="595">TENJO-CUNDINAMARCA</option>
                                                    <option value="312">TENZA-BOYACA</option>
                                                    <option value="314">TIBASOSA-BOYACA</option>
                                                    <option value="665">TIMANA-HUILA</option>
                                                    <option value="599">TOCANCIPA-CUNDINAMARCA</option>
                                                    <option value="1038">TULUA-VALLE</option>
                                                    <option value="206">TUNJA-BOYACA</option>
                                                    <option value="603">UBATE-CUNDINAMARCA</option>
                                                    <option value="127">VALDIVIA-ANTIOQUIA</option>
                                                    <option value="431">VALLEDUPAR-CESAR</option>
                                                    <option value="256">VILLA DE LEIVA-BOYACA</option>
                                                    <option value="204">VILLANUEVA-BOLIVAR</option>
                                                    <option value="610">VILLAPINZON-CUNDINAMARCA</option>
                                                    <option value="690">VILLAVICENCIO-META</option>
                                                    <option value="611">VILLETA-CUNDINAMARCA</option>
                                                    <option value="372">YOPAL-CASANARE</option>
                                                    <option value="328">ZETAQUIRA-BOYACA</option>
                                                    <option value="615">ZIPAQUIRA-CUNDINAMARCA</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td width="192">&nbsp; </td>
                                    </tr>
                                    <!%}%>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <p><strong>II. EDUCACION <b> &nbsp;&nbsp;</b></strong></p>
                                            <p><strong><b>&nbsp;<b><font color="#990000">*</font></b>&nbsp;Estudios
                                                        Universitarios de pregrado(T&iacute;tulo Profesional) Promedio
                                                        de la carrera <b><b><b>
                                                                    <input type="text" class="campotext" name="promedio" size="2" maxlength="2">
                                                                </b></b></b>(Dos d&iacute;gitos sin puntos)</b></strong></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table width="680" border="3"  class="textocom">
                                                <tr>
                                                    <td rowspan="2" width="180">
                                                        <div align="center"><b>Universidad(Nombre Oficial como aparece
                                                                en su diploma o acta de grado)</b></div>
                                                    </td>
                                                    <td rowspan="2" width="60">
                                                        <div align="center"><b>Pa&iacute;s</b></div>
                                                    </td>
                                                    <td rowspan="2" width="110">
                                                        <div align="center"><b>Programa</b></div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div align="center"><b>Fechas(a&ntilde;o)</b></div>
                                                    </td>
                                                    <td rowspan="2" width="194">
                                                        <div align="center"><b>T&iacute;tulo Obtenido</b></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="24" width="43">
                                                        <div align="center"><b>Desde</b></div>
                                                    </td>
                                                    <td height="24" width="40">
                                                        <div align="center"><b>Hasta</b></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="180" class="textocom">
                                                        <select name="campo26" class="campotext" >
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
                                                                PRUDENCIO PADILLA"">ESC NAVAL DE CADETES</option>
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
                                                    </td>
                                                    <td width="60"><b><b><b> <b><b>
                                                                            <input type="text" class="campotext" name="pais" size="10" maxlength="30">
                                                                        </b></b></b></b></b></td>
                                                    <td width="110"><b><b><b>
                                                                    <input type="text" class="campotext" name="campo27" size="20" maxlength="50">
                                                                </b></b></b></td>
                                                    <td width="43"><b><b><b>
                                                                    <input type="text" class="campotext" name="campo28" size="4" maxlength="4">
                                                                </b></b></b></td>
                                                    <td width="40"><b><b><b>
                                                                    <input type="text" class="campotext" name="campo29" size="4" maxlength="4">
                                                                </b></b></b></td>
                                                    <td width="194">
                                                        <select name="campo30" class="campotext">
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
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <div align="center"></div>
                                            <p><b>Otros estudios formales (Aquellos que conducen a t&iacute;tulo)</b></p>
                                            <table width="675" border="3" height="147" class="textocom">
                                                <tr>
                                                    <td rowspan="2" width="180">
                                                        <div align="center"><b>Universidad(Nombre Oficial como aparece
                                                                en su diploma o acta de grado)</b></div>
                                                    </td>
                                                    <td rowspan="2" width="180">
                                                        <div align="center"><b>Programa</b></div>
                                                    </td>
                                                    <td colspan="2">
                                                        <div align="center"><b>Fechas(a&ntilde;o) </b> </div>
                                                        <div align="center"></div>
                                                    </td>
                                                    <td rowspan="2" width="180">
                                                        <div align="center"><b>&nbsp;&nbsp;Grado Obtenido<br>
                                                                (Digite el nombre completo)</b></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="60">
                                                        <div align="center"><b>Desde</b></div>
                                                    </td>
                                                    <td width="60">
                                                        <div align="center"><b>Hasta</b></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="35%">
                                                        <div align="center"><b><b><b>
                                                                        <select name="campo31" class="campotext" >
                                                                            <option value="N" selected>SELECCIONE</option>
                                                                            <option value="CORPORACION UNIVERSITARIA DE IBAGUE">CORP
                                                                                UNIV DE IBAGUE</option>
                                                                            <option value="CORPORACION UNIVERSITARIA DE LA COSTA">CORP
                                                                                UNIV DE LA COSTA</option>
                                                                            <option value="ESCUELA COLOMBIANA DE INGENIERIA JULIO GARAVITO">ESC
                                                                                COL DE INGENIERIA JULIO GARAVITO</option>
                                                                            <option value="ESCUELA DE ADMINISTRACION DE NEGOCIOS">ESC
                                                                                DE ADM DE NEGOCIOS</option>
                                                                            <option value="ESCUELA NAVAL DE CADETES "ALMIRANTE JOSE PRUDENCIO PADILLA"">ESC
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
                                                                    </b></b></b></div>
                                                    </td>
                                                    <td width="25%">
                                                        <div align="center"><b><b><b>
                                                                        <input type="text" class="campotext" name="campo32" size="20" maxlength="50"  onBlur="this.value = convertTildes(this.value);">
                                                                    </b></b></b></div>
                                                    </td>
                                                    <td width="9%">
                                                        <div align="center"><b><b><b>
                                                                        <input type="text" class="campotext" name="campo33" size="4" maxlength="4">
                                                                    </b></b></b></div>
                                                    </td>
                                                    <td width="8%">
                                                        <div align="center"><b><b><b>
                                                                        <input type="text" class="campotext" name="campo34" size="4" maxlength="4">
                                                                    </b></b></b></div>
                                                    </td>
                                                    <td width="23%">
                                                        <div align="center"><b><b><b>
                                                                        <input type="text" class="campotext" name="campo35" size="25" maxlength="60" onBlur="this.value = convertTildes(this.value);">
                                                                    </b></b></b></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="35%">
                                                        <div align="center"><b><b><b>
                                                                        <select name="campo36" class="campotext" >
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
                                                                    </b></b></b></div>
                                                    </td>
                                                    <td width="25%">
                                                        <div align="center"><b><b><b> <b><b>
                                                                                <input type="text" class="campotext" name="campo37" size="20" maxlength="50"  onBlur="this.value = convertTildes(this.value);">
                                                                            </b></b></b></b></b></div>
                                                    </td>
                                                    <td width="9%">
                                                        <div align="center"><b><b><b>
                                                                        <input type="text" class="campotext" name="campo38" size="4" maxlength="4">
                                                                    </b></b></b></div>
                                                    </td>
                                                    <td width="8%">
                                                        <div align="center"><b><b><b>
                                                                        <input type="text" class="campotext" name="campo39" size="4" maxlength="4">
                                                                    </b></b></b></div>
                                                    </td>
                                                    <td width="23%">
                                                        <div align="center"><b><b><b>
                                                                        <input type="text" class="campotext" name="campo40" size="25" maxlength="60" onBlur="this.value = convertTildes(this.value);">
                                                                    </b></b></b></div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <hr size="2" align="left">
                                            <strong></strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong><font color="#000000">III. EXPERIENCIA</font></strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table width="675" border="3" height="147" class="textocom">
                                                <tr>
                                                    <td colspan="9"><b>Haga referencia a la experiencia actual (la
                                                            m&aacute;s representativa)</b></td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2" width="22%">
                                                        <div align="center"><b>Entidad</b></div>
                                                    </td>
                                                    <td rowspan="2" colspan="2"><b>Fechas (mm-aaaa)<br>
                                                            Desde&nbsp;&nbsp;&nbsp;Hasta</b></td>
                                                    <td rowspan="2" width="7%">
                                                        <div align="center"><b>Cargo</b></div>
                                                    </td>
                                                    <td colspan="3">
                                                        <div align="center"><b>Experiencia</b></div>
                                                    </td>
                                                    <td rowspan="2" width="9%">
                                                        <div align="center"><b>Jefe Inmediato</b></div>
                                                    </td>
                                                    <td rowspan="2" width="17%">
                                                        <div align="center">
                                                            <p><b>Tel. del Jefe</b></p>
                                                            <p><b>(N&uacute;mero y extensi&oacute;n) </b></p>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="7%">
                                                        <div align="center"><b>Laboral</b></div>
                                                    </td>
                                                    <td width="8%">
                                                        <div align="center"><b>Docente</b></div>
                                                    </td>
                                                    <td width="11%">
                                                        <div align="center"><b>Investigativa</b></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="22%" height="31">
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo41" size="15" maxlength="40" >
                                                        </div>
                                                    </td>
                                                    <td width="9%" height="31">
                                                        <div align="center"><b><b><b><b><b><b>
                                                                                    <input type="text" class="campotext" name="campo42" size="5" maxlength="7" >
                                                                                </b></b></b></b></b></b></div>
                                                    </td>
                                                    <td width="10%" height="31">
                                                        <div align="center"><b><b><b><b><b><b>
                                                                                    <input type="text" class="campotext" name="campo43" size="5" maxlength="7" >
                                                                                </b></b></b></b></b></b></div>
                                                    </td>
                                                    <td width="7%" height="31">

                                                        <input type="text" class="campotext" name="campo44" size="10" maxlength="40">
                                                    </td>
                                                    <td width="7%" height="31">
                                                        <div align="center">
                                                            <input type="radio" class="campotext" name="campo45" value="L">
                                                        </div>
                                                    </td>
                                                    <td width="8%" height="31">
                                                        <div align="center">
                                                            <input type="radio" class="campotext" name="campo45" value="D">
                                                        </div>
                                                    </td>
                                                    <td width="11%" height="31">
                                                        <div align="center">
                                                            <input type="radio" class="campotext" name="campo45" value="I">
                                                        </div>
                                                    </td>
                                                    <td width="9%" height="31">
                                                        <input type="text" class="campotext" name="campo46" size="15" maxlength="40" onBlur="this.value = convertTildes(this.value);">
                                                    </td>
                                                    <td width="17%" height="31">
                                                        <div align="center"><b><b><b><b><b><b> <b><b><b><b><b>
                                                                                                        <input type="text" class="campotext" name="campo47" size="10" maxlength="20" >
                                                                                                    </b></b></b></b></b></b></b></b></b></b></b></div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <p>Si es posible adjunte copia de sus trabajos más relevantes. Indique
                                                la entidad en la que hizo sus trabajos o investigaciones y el
                                                nombre de las personas que le colaboraron o lo asesoraron; así
                                                mismo indique si alguno de estos trabajos ha sido publicado y
                                                en qué medio.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>&iquest;Ha sido usted objeto de distinciones y
                                                premios (acad&eacute;micos, profesionales u otros), y en caso dado,
                                                en cu&aacute;les?</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table width="675" border="3" class="textocom">
                                                <tr>
                                                    <td>
                                                        <div align="center"><b>Distincion</b></div>
                                                    </td>
                                                    <td>
                                                        <div align="center"><b>Entidad</b></div>
                                                    </td>
                                                    <td>
                                                        <div align="center"><b>A&ntilde;o</b></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo48" maxlength="60" size="35">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo49" size="35" maxlength="50">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo50" size="4" maxlength="4">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo51" maxlength="60" size="35">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo52" size="35" maxlength="50">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo53" size="4" maxlength="4">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong>Califique su conocimiento de idiomas diferentes
                                                al espa&ntilde;ol, de acuerdo con la siguiente convenci&oacute;n:
                                                MUY BIEN, BIEN, REGULAR</strong></td>
                                    </tr>
                                    <!%if(tipo.equals("T")){%>
                                    <tr>
                                        <td colspan="4">
                                            <table width="675" border="3" class="textocom">
                                                <tr >
                                                    <td width="26%">
                                                        <div align="center"><b>IDIOMA</b></div>
                                                    </td>
                                                    <td width="24%">
                                                        <div align="center"><b>COMPRENDE AL LEER</b></div>
                                                    </td>
                                                    <td width="21%">
                                                        <div align="center"><b>COMPRENDE AL OIR</b></div>
                                                    </td>
                                                    <td width="14%">
                                                        <div align="center"><b>HABLA</b></div>
                                                    </td>
                                                    <td width="15%">
                                                        <div align="center"><b>ESCRIBE</b></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div align="center">
                                                            <select name="campo54" class="campotext">
                                                                <option value="" selected></option>
                                                                <option value="Ingles">Ingles</option>
                                                                <option value="Frances">Frances</option>
                                                                <option value="Aleman">Aleman</option>
                                                                <option value="Italiano">Italiano</option>
                                                                <option value="Portugues">Portugues</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <select name="campo55" class="campotext">
                                                                <option value="" selected></option>
                                                                <option value="0" selected>0-20%</option>
                                                                <option value="2">21-40%</option>
                                                                <option value="4">41-60%</option>
                                                                <option value="6">61-80%</option>
                                                                <option value="8">81-100%</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <select name="campo56" class="campotext" >
                                                                <option value="" selected></option>
                                                                <option value="0" selected>0-20%</option>
                                                                <option value="2">21-40%</option>
                                                                <option value="4">41-60%</option>
                                                                <option value="6">61-80%</option>
                                                                <option value="8">81-100%</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <select name="campo57" class="campotext">
                                                                <option value="" selected></option>
                                                                <option value="0" selected>0-20%</option>
                                                                <option value="2">21-40%</option>
                                                                <option value="4">41-60%</option>
                                                                <option value="6">61-80%</option>
                                                                <option value="8">81-100%</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <select name="campo58" class="campotext">
                                                                <option value="" selected></option>
                                                                <option value="0" selected>0-20%</option>
                                                                <option value="2">21-40%</option>
                                                                <option value="4">41-60%</option>
                                                                <option value="6">61-80%</option>
                                                                <option value="8">81-100%</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div align="center">
                                                            <select name="campo59" class="campotext" >
                                                                <option value="" selected></option>
                                                                <option value="Ingles">Ingles</option>
                                                                <option value="Frances">Frances</option>
                                                                <option value="Aleman">Aleman</option>
                                                                <option value="Italiano">Italiano</option>
                                                                <option value="Portugues">Portugues</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <select name="campo60" class="campotext" >
                                                                <option value="" selected></option>
                                                                <option value="0" selected>0-20%</option>
                                                                <option value="2">21-40%</option>
                                                                <option value="4">41-60%</option>
                                                                <option value="6">61-80%</option>
                                                                <option value="8">81-100%</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <select name="campo61" class="campotext">
                                                                <option value="" selected></option>
                                                                <option value="0" selected>0-20%</option>
                                                                <option value="2">21-40%</option>
                                                                <option value="4">41-60%</option>
                                                                <option value="6">61-80%</option>
                                                                <option value="8">81-100%</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <select name="campo62" class="campotext" >
                                                                <option value="" selected></option>
                                                                <option value="0" selected>0-20%</option>
                                                                <option value="2">21-40%</option>
                                                                <option value="4">41-60%</option>
                                                                <option value="6">61-80%</option>
                                                                <option value="8">81-100%</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <select name="campo63" class="campotext">
                                                                <option value="" selected></option>
                                                                <option value="0" selected>0-20%</option>
                                                                <option value="2">21-40%</option>
                                                                <option value="4">41-60%</option>
                                                                <option value="6">61-80%</option>
                                                                <option value="8">81-100%</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <!%
                                    }
                                    %>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>IV. INTERES ACADEMICO</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b><font color="#990000">*</font>Indique las razones
                                                por las cuales desea seguir este énfasis??, o los factores que lo
                                                llevaron a pensar que ser&iacute;a de gran utilidad en el desarrollo
                                                de su vida &nbsp;&nbsp;profesional y laboral, intereses acad&eacute;micos
                                                y profesionales y planes futuros. (m&aacute;ximo 255 caracteres)</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <textarea name="campo64" cols="85" rows="2" wrap="VIRTUAL" onBlur="this.value = convertTildes(this.value);"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong><font color="#990000">*</font>V.REFERENCIAS
                                                ACADEMICAS O LABORALES</strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;<b>*</b> &nbsp;<b>Preferiblemente de sus profesores
                                                universitarios o jefes inmediatos</b> </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table width="678" class="textocom" border="3">
                                                <tr>
                                                    <td>
                                                        <div align="center"><b>NOMBRE</b></div>
                                                    </td>
                                                    <td>
                                                        <div align="center"><b>ENTIDAD</b></div>
                                                    </td>
                                                    <td>
                                                        <div align="center"><b>CARGO</b></div>
                                                    </td>
                                                    <td>
                                                        <div align="center"><b>TEL&Eacute;FONO</b><br>
                                                            (N&uacute;mero y extensi&oacute;n)</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo65" maxlength="30" size="20" onBlur="this.value = convertTildes(this.value);">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo66" size="20" maxlength="30">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo67" size="20" maxlength="40" value="">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo68" maxlength="30" size="15">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo69" size="20" maxlength="30" onBlur="this.value = convertTildes(this.value);">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo70" size="20" maxlength="30">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo71" size="20" maxlength="40" value="">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo72" size="15" maxlength="30">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo73" size="20" maxlength="30" onBlur="this.value = convertTildes(this.value);">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo74" size="20" maxlength="30">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo75" size="20" maxlength="40" value="">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div align="center">
                                                            <input type="text" class="campotext" name="campo76" size="15" maxlength="30">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>VI. OTRA INFORMACION</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;<b><font color="#990000">*</font></b> <b>&iquest;C&oacute;mo
                                                se enter&oacute; de la existencia de este programa de Maestría?</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" height="47">Prensa
                                            <select name="campo77" class="campotext">
                                                <option value="" Selected><font size="3">Seleccione</font></option>
                                                <%   Vector medios = new Vector();
                                                    Vector medio = admision.Medios();
                                                    for (int x = 0; x < medio.size(); x++) {
                                                        medios = (Vector) medio.elementAt(x);%>
                                                <option value="<%=medios.elementAt(0)%>"><font size="3"><%=medios.elementAt(1)%></font></option>
                                                <% }%>
                                            </select>
                                            <!-- <input type="radio" class="campotext" name="campo77" value="10">
                                               Revista
                                               <input type="radio" class="campotext" name="campo77" value="11">
                                               Folleto
                                               <input type="radio" class="campotext" name="campo77" value="12">
                                               Feria acad&eacute;mica
                                               <input type="radio" class="campotext" name="campo77" value="7">
                                               Familiar o Amigo
                                               <input type="radio" class="campotext" name="campo77" value="1">
                                               Internet
                                               <input type="radio" class="campotext" name="campo77" value="8">
                                               Llamada telefónica
                                               <input type="radio" class="campotext" name="campo77" value="13">
                                               <br>
                                               Cartelera en la Escuela
                                               <input type="radio" class="campotext" name="campo77" value="14">
                                               Docente o empleado de la Escuela
                                               <input type="radio" class="campotext" name="campo77" value="3">-->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b><font color="#990000">*</font></b> <b>&iquest;C&oacute;mo
                                                piensa financiar sus estudios?</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">Pr&eacute;stamo
                                            <input type="radio" class="campotext" name="campo78" value="4">
                                            Beca
                                            <input type="radio" class="campotext" name="campo78" value="1">
                                            Entidad donde trabaja
                                            <input type="radio" class="campotext" name="campo78" value="5">
                                            Familia
                                            <input type="radio" class="campotext" name="campo78" value="3">
                                            Recursos propios
                                            <input type="radio" class="campotext" name="campo78" value="2">
                                            Mixto
                                            <input type="radio" class="campotext" name="campo78" value="20">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <div align="center">
                                                <input name="numreg" type="hidden" id="numreg" value="<!%=pginsc.elementAt(4)%>">
                                                <input name="nom_est" type="hidden" id="nom_est" value="<%=pginsc.elementAt(2)%>">
                                                <input name="ref" type="hidden" id="ref" value="<%=pginsc.elementAt(0)%>">
                                                <input name="bi" type="submit" class="boton" value="Enviar Solicitud de Admisión" >
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;</td>
                                    </tr>
                                </table>
                            </form>
                            </div>
                    </fieldset> </td>
            </tr>
        </table></body>
</html> 
<p>&nbsp;</p>
<p><% } else
        response.sendRedirect("ErrorPago");%> </p>
