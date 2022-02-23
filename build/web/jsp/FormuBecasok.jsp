<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        BDadmisiones admision = new BDadmisiones();
        Vector ciud = admision.getCiudades();
        Vector profes = admision.getProfesiones();
        int i;
        String tipo = "S";
        String ref = "0";
        configeci.configuracion confeci = new configeci.configuracion();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {
                var i, band, valor;
                for(i=0; i<45; i++){
                    document.forminsc.elements[i].style.backgroundColor= '#D8E6F1';
                }
                if(document.forminsc.medio.value == "0"){
                    alert("Por favor señale el medio por el cual se entero de la ECI");
                    document.forminsc.medio.style.backgroundColor= '#ffcc00';
                    document.forminsc.medio.focus();
                    return false;
                }
                if(document.forminsc.doc_est.value != document.forminsc.doc_est2.value){
                    alert("Los números de documento no concuerdan");
                    document.forminsc.doc_est.style.backgroundColor= '#ffcc00';
                    document.forminsc.doc_est2.style.backgroundColor= '#ffcc00';
                    document.forminsc.doc.focus();
                    return false;
                }

                if(isNaN(document.forminsc.campo3.value )){
                    alert("Año debe ser un número");
                    document.forminsc.campo3.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo3").focus();
                    return false;
                }



                if (document.forminsc.campo4.value == ""){
                    alert("Por favor seleccione la ciudad de nacimiento");
                    return false;

                }

                valor = document.forminsc.campo18.value;

                if (/^\s+$/.test(valor) ){
                    alert("POR FAVOR INGRESE EL CODIGO DEL COLEGIO, NO DEBE INGRESAR ESPACIOS EN BLANCO");
                    document.forminsc.campo18.style.backgroundColor= '#ffcc00';

                    return false;
                }

                if(isNaN(document.forminsc.campo18.value )){
                    alert("El Código del Colegio debe ser un número");
                    document.forminsc.campo18.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo18").focus();
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
                        alert("El número de registro ICFES no es correcto o no es de una version 2000 en adelente");
                        return false;
                    }
                }

                if (document.forms.form1.numreg.value.length !=  14) {
                    alert("El número de registro ICFES no es correcto, verifique que lo esta digitando bien.");
                    return false;
               }

                if(isNaN(document.forminsc.campo20.value )){
                    alert("Año debe ser un número");
                    document.forminsc.campo20.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo20").focus();
                    return false;
                }

                if(isNaN(document.forminsc.campo47.value )){
                    alert("El Número de carnet debe ser numérico");
                    document.forminsc.campo47.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo47").focus();
                    return false;
                }

                if(isNaN(document.forminsc.campo49.value )){
                    alert("El Número de carnet debe ser numérico");
                    document.forminsc.campo49.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo49").focus();
                    return false;
                }




                band = 0;
                for(i=0; i<45; i++){
                    if(document.forminsc.elements[i].value == "null" || document.forminsc.elements[i].value == ""){
                        if(document.forminsc.elements[i].name == "campo6" || document.forminsc.elements[i].name == "campo7" || document.forminsc.elements[i].name == "campo8" || document.forminsc.elements[i].name == "campo9"){
                            band = 1;
                        }else if(document.forminsc.elements[i].name == "campo12" && document.forminsc.campo11.value != "O"){
                            band = 1;
                        }else if(document.forminsc.elements[i].name == "campo15" && document.forminsc.campo14.value != "0"){
                            band = 1;
                        }else if(document.forminsc.elements[i].name == "campo28" && document.forminsc.campo26.value != ""){
                            band = 1;
                        }else{
                            alert("Los campos con * son obligatorios ");
                            document.forminsc.elements[i].style.backgroundColor= '#ffcc00';

                            if(i<27)
                                document.getElementById("campo18").focus();
                            return false;
                        }
                    }
                }


                if (document.forminsc.interes.value == ""){
                    alert("Por favor Ingrese el interés Académico");
                    document.forminsc.interes.style.backgroundColor= '#ffcc00';
                    document.getElementById("interes").focus();
                    return false;

                }


                if((document.forminsc.campo51.value == "" || document.forminsc.campo54.value == "")&&(document.forminsc.campo68.value == "" || document.forminsc.campo71.value == "") ){
                    alert("Ingrese la información de por lo menos uno de los padres");
                    return false;
                }

                if(isNaN(document.forminsc.ingresosp.value )){
                    alert("El campo ingresos del padre debe ser un número sin puntos ni comas");
                    return false;
                }

                if(isNaN(document.forminsc.ingresosm.value )){
                    alert("El campo ingresos de la madre debe ser un número sin puntos ni comas");
                    return false;
                }

            }


            function convertTildes(str) {
                var out = "", flag = 0;
                for (i = 0; i < str.length; i++) {
                    if ((str.charAt(i)!="í") && (str.charAt(i)!="á") && (str.charAt(i)!="é") && (str.charAt(i)!="ó") && (str.charAt(i)!="ú")
                        && (str.charAt(i)!="Á") && (str.charAt(i)!="É") && (str.charAt(i)!="Í") && (str.charAt(i)!="Ó") && (str.charAt(i)!="Ú")){
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
                    }
                }
                return out;
            }
            //-->
        </script>
    </head>
    <title>Becas Julio Garavito Armero</title>
    </head>
    <body>
        <br>

        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td><fieldset><legend class="textocom"><strong><font size="+1">Convocatoria
                        Becas <%=confeci.getPeriodo()%></font></strong></legend>
                        <div align="center" class="textocom"><a href="Ayuda<%=tipo%>" target="_blank"><b>&gt;&gt;Instructivo
                        para diligenciar el Formulario&lt;&lt;</b></a></div>

                        <div align="center">
                            <form action="GrabaEstudiante" method="post" name="forminsc" id="forminsc">

                                <table width="660" border="0" cellpadding="1" cellspacing="1" class="textocom">
                                    <tr>
                                        <td colspan="2"><b> <font color="#990000">*</font> Se&ntilde;ale
                                                el medio por el cual se enter&oacute; de la Escuela Colombiana
                                        de Ingenier&iacute;a Julio Garavito: </b></td>
                                        <td colspan="2"><b>
                                                <select name="medio" class="campotext">
                                                    <option value="0" Selected><font size="3">Seleccione</font></option>
                                                    <option value="1"><font size="3">Alumnos de la Escuela</font></option>
                                                    <option value="2"><font size="3">Exalumnos de la Escuela</font></option>
                                                    <option value="3"><font size="3">Docentes o Empleados de la
                                                    Escuela</font></option>
                                                    <option value="4"><font size="3">Boletín del ICFES</font></option>
                                                    <option value="5"><font size="3">Directorio Telefónico</font></option>
                                                    <option value="6"><font size="3">Visitas a su colegio (charlas
                                                    de orientación profesional)</font></option>
                                                    <option value="7"><font size="3">Ferias Universitarias</font></option>
                                                    <option value="8"><font size="3">Página Web de la ECI</font></option>
                                                    <option value="9"><font size="3">Directivos o profesores de
                                                    su colegio</font></option>
                                                    <option value="10"><font size="3">Aviso de prensa</font></option>
                                                    <option value="11"><font size="3">Revista Especializada en Educación
                                                    Superior</font></option>
                                                </select>
                                        </b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="86"><strong>Primer Apellido del aspirante:</strong></td>
                                        <td width="193">
                                            <input type="text" class="campotext" name="ape1"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  >
                                        </td>
                                        <td width="122"><strong>Segundo Apellido del aspirante:</strong></td>
                                        <td width="268">
                                            <input type="text" class="campotext" name="ape2"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong>Nombres del aspirante:</strong><strong>
                                                <input type="text" name="nombres"  size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);">
                                        </strong></td>
                                    </tr>
                                    <tr>
                                        <td width="86"><strong>Documento de identidad:</strong></td>
                                        <td width="193"><font size="2">
                                                <input name="doc_est" type="text" class="campotext" size="18" maxlength="20" >
                                        </font></td>
                                        <td width="122"><strong><font color="#990000">*</font> Confirmar
                                        documento:</strong></td>
                                        <td width="268"><b> <font size="2">
                                                    <input name="doc_est2" type="text" class="campotext" id="doc_est2" size="18" maxlength="20">
                                        </font> </b></td>
                                    </tr>
                                    <tr>
                                        <td width="86"><strong><font color="#990000">*</font> Tipo de documento</strong>:</td>
                                        <td colspan="3"><font size="2"><b>
                                                    <select name="tip_doc" class="campotext">
                                                        <option value="null" selected>Seleccione</option>
                                                        <option value="T">TI
                                                        <option value="C">CC
                                                        <option value="E">CE
                                                        <option value="R">RC
                                                    </select>
                                        </b> </font><b> </b></td>
                                    </tr>
                                    <tr>
                                        <td width="86"><strong>Programa acad&eacute;mico:</strong></td>
                                        <td width="193">
                                            <select name="programa" class="campotext">
                                                <option value="18">ECONOMIA</option>
                                                <option value="14">INGENIERIA ELECTRICA</option>
                                                <option value="20">MATEMATICAS</option>
                                            </select>
                                        </td>
                                        <td width="122"><strong>No. Registro(ICFES):<b> (&uacute;nicamente
                                                    versi&oacute;n a&ntilde;o 2000 &nbsp;en adelante) N&uacute;mero
                                        de registro SNP</b></strong></td>
                                        <td width="268"><font size="3">
                                                <input type="text" name="numreg" id="numreg" maxlength="14" size="15">
                                        </font></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3"><b><font color="#990000">*</font> N&uacute;mero
                                                de documento de identidad con el que present&oacute; el Ex&aacute;men
                                        de Estado Icfes</b></td>
                                        <td width="268"><font size="3">
                                                <input type="text" name="docicfes" maxlength="15" size="15" class="campotext">
                                        </font></td>
                                    </tr>
                                    <%if (tipo.equals("T")) {%>
                                    <tr>
                                        <td colspan="4"><b>Prueba de Estado ICFES (versi&oacute;n anterior
                                            a&ntilde;o 2000)</b>&nbsp; (Si es su caso) <strong><b>Puntaje
                                                    Total&nbsp;
                                                    <input name="ptotal" type="text" value="0" size="5" maxlength="10" class="campotext">
                                        </b></strong> <strong></strong></td>
                                    </tr>
                                    <%}%>
                                    <tr>
                                        <td colspan="4"> <b>INTERES ACADEMICO</b>
                                            <p><strong><b><font color="#990000">*</font></b>Indique las razones
                                            por las cuales desea estudiar el programa elegido:</strong></p>
                                            <p>
                                                 <input type="text" name="interes" value="" maxlength="240" size="100">
                                                <!--<textarea name="interes" cols="85" rows="2" wrap="VIRTUAL" onBlur="this.value = convertTildes(this.value);"></textarea>-->
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong>DATOS DEL ASPIRANTE</strong></td>
                                    </tr>
                                    <tr>
                                        <td width="86"><strong><font color="#990000">*</font> Fecha de Nacimiento:</strong></td>
                                        <td colspan="2"><strong>Dia</strong>
                                            <select name="campo1" class="campotext" id="campo1">
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
                                            &nbsp;&nbsp;<strong>Mes</strong>
                                            <select name="campo2" class="campotext" id="campo2">
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
                                            &nbsp;&nbsp;<strong>A&ntilde;o</strong>
                                            <input name="campo3" type="text" class="campotext" id="campo3" size="5" maxlength="4">
                                        </td>
                                        <td width="268">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="86"><font color="#990000">*</font> <strong>Lugar de nacimiento:</strong></td>
                                        <td colspan="3">
                                            <select name="campo4" class="campotext" id="campo4">
                                                <option value="null" selected>Seleccione</option>
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
                                        <font size="2">&nbsp; </font> </td>
                                    </tr>
                                    <tr>
                                        <td width="86">Prest&oacute; servicio militar?</td>
                                        <td colspan="3">Si
                                            <input type="radio" name="campo6" value="si">
                                            No
                                            <input type="radio" name="campo6" value="no" checked>
                                            Libreta militar No.
                                            <input name="campo7" type="text" class="campotext" id="campo7" size="10" maxlength="15">
                                            Distrito No.<strong> </strong>
                                            <input name="campo8" type="text" class="campotext" id="campo8" size="3" maxlength="3">
                                            En tr&aacute;mite<strong><font size="2">
                                                    <select name="campo9" class="campotext" id="campo9">
                                                        <option value="Si" selected>Si</option>
                                                        <option value="No">No</option>
                                                    </select>
                                        </font></strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong><font color="#990000">*</font> Sexo: <font size="2">
                                                    <select name="campo10" class="campotext" id="campo10">
                                                        <option value="M" selected>Masculino
                                                        <option value="F">Femenino
                                                    </select>
                                                </font><font color="#990000">*</font> Estado Civil: <font size="2">
                                                    <select name="campo11" class="campotext" id="campo11">
                                                        <option value="S" selected>Soltero(A)
                                                        <option value="C">Casado(A)
                                                        <option value="P">Separado(A)
                                                        <option value="V">Viudo(A)
                                                        <option value="U">Unión Libre
                                                    </select>
                                        </font></strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong><font color="#990000">*</font> Direcci&oacute;n
                                                correspondencia:
                                                <input name="campo13" type="text" class="campotext" id="campo13" size="50" maxlength="35">
                                        </strong></td>
                                    </tr>
                                    <tr>
                                        <td width="86"><strong><font color="#990000">*</font> Ciudad:</strong></td>
                                        <td colspan="3">
                                            <select name="campo14" class="campotext" id="campo14">
                                                <option value="null" selected>Seleccione</option>
                                                <%
        for (i = 0; i < ciud.size(); i++) {
            detciud = (Vector) ciud.elementAt(i);
                                                %>
                                                <option value="<%=detciud.elementAt(0)%>"><%=detciud.elementAt(1)%></option>
                                                <%
        }
                                                %>
                                                <option value="0">Otra</option>
                                            </select>
                                            <strong>Si es otra cual?:</strong>
                                            <input name="campo15" type="text" class="campotext" id="campo15" maxlength="12">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="86"><strong><font color="#990000">*</font> Tel&eacute;fono:
                                        </strong></td>
                                        <td width="193">
                                            <input name="campo16" type="text" class="campotext" id="campo16" maxlength="15">
                                        </td>
                                        <td width="122"><strong><font color="#990000">*</font> Correo electr&oacute;nico</strong></td>
                                        <td width="268">
                                            <input name="campo17" type="text" class="campotext" id="campo17"  maxlength="30">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong> Celular:
                                                <input name="celular" type="text" class="campotext" id="celular"  maxlength="30">
                                        </strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong>EDUCACI&Oacute;N SECUNDARIA</strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><font color="#990000">*</font> C&oacute;digo Colegio
                                        (El que aparece en el informe ICFES):</td>
                                        <td colspan="2">
                                            <input name="campo18" type="text" class="campotext" id="campo18" maxlength="10">
                                            <a href="" onClick="window.open('http://w3.icfes.gov.co:8080/refcol/icfes_default.asp','','width=630,height=350, toolbar=yes,scrollbars=yes,location=yes,directories=yes,status=yes,menubar=yes,resizable=yes');return false"><strong>Ver
                                        Ayuda</strong></a></td>
                                    . </tr>
                                    <tr>
                                        <td colspan="2">
                                            <p><font color="#990000">*</font>Fecha de grado: </p>
                                            <p>Mes
                                                <select name="campo19" class="campotext" id="campo19">
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
                                                <input name="campo20" type="text" class="campotext" id="campo20" size="4" maxlength="4">
                                            </p>
                                        </td>
                                        <td colspan="2">Obtuvo validaci&oacute;n del bachillerato con el
                                            ICFES?
                                            <select name="campo21" class="campotext" id="campo21">
                                                <option value="N" selected>No
                                                <option value="S">Si
                                            </select>
                                        </td>
                                    </tr>
                                    <%if (tipo.equals("T")) {%>
                                    <tr>
                                        <td colspan="4"><strong>TRANSFERENCIA</strong></td>
                                    </tr>
                                    <tr>
                                        <td width="86">Universidad de procedencia:</td>
                                        <td colspan="3">
                                            <select name="uproc" id="uproc" class="campotext">
                                                <option value="null" selected>SELECCIONE</option>
                                                <option value="1">UNIVERSIDAD DE LOS ANDES</option>
                                                <option value="2">UNIVERSIDAD CATOLICA DE COLOMBIA</option>
                                                <option value="3">UNIVERSIDAD NACIONAL</option>
                                                <option value="4">UNIVERSIDAD DISTRITAL</option>
                                                <option value="5">UNIVERSIDAD CENTRAL</option>
                                                <option value="6">UNIVERSIDAD PILOTO DE COLOMBIA</option>
                                                <option value="7">UNIVERSIDAD JAVERIANA</option>
                                                <option value="8">UNIVERSIDAD ANTONIO NARIÑO</option>
                                                <option value="11">UNIVERSIDAD DE CARTAGENA</option>
                                                <option value="10">OTRA</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <%        }
                                    %>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong>INFORMACI&Oacute;N FAMILIAR Y ECON&Oacute;MICA</strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><strong>Composici&oacute;n Familiar</strong></td>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong><font color="#990000">*</font> </strong>Padre
                                            y madre unidos<strong>
                                                <input name="campo22" type="radio" value="2" checked>
                                            </strong>Padres separados<strong>
                                                <input type="radio" name="campo22" value="3">
                                            </strong>Padres viudos <strong>
                                                <input type="radio" name="campo22" value="5">
                                            </strong>Padres sin sociedad conyugal <strong>
                                                <input type="radio" name="campo22" value="10">
                                        </strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong><font color="#990000">*</font> La vivienda
                                            de habitaci&oacute;n de su hogar es:</strong>
                                            <select name="campo30" class="campotext" id="campo30">
                                                <option value="1">Arriendo
                                                <option value="2" selected>Propia pagada
                                                <option value="3">Propia deuda
                                                <option value="5">Familiar
                                            </select>
                                            <strong>Estrato de los servicios p&uacute;blicos:
                                                <input name="campo35" type="text" class="campotext" id="campo35" size="3" maxlength="2">
                                        </strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong>DATOS DEL ACUDIENTE</strong> (Preferiblemente
                                        el padre o la madre)</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><font color="#990000">*</font> Parentesco
                                            <select name="campo37" class="campotext" id="campo37">
                                                <option value="null" selected>Seleccione</option>
                                                <option value="M">Madre</option>
                                                <option value="P">Padre</option>
                                                <option value="A">Abuelo(a)</option>
                                                <option value="T">Tio(a)</option>
                                                <option value="H">Hermano(a)</option>
                                                <option value="R">Primo</option>
                                                <option value="O">Otro</option>
                                                <option value="N">Ninguno</option>
                                            </select>
                                            Nombre Completo
                                            <input name="campo38" type="text" class="campotext" id="campo38" onBlur="this.value = convertTildes(this.value);" size="25" maxlength="35">
                                            C.C. No.
                                            <input name="campo39" type="text" class="campotext" size="10" maxlength="10">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><font color="#990000">*</font> Direcci&oacute;n
                                            <input name="campo40" type="text" class="campotext" id="campo40" size="25" maxlength="35">
                                            Tel&eacute;fono
                                            <input name="campo41" type="text" class="campotext" id="campo41" size="10" maxlength="20">
                                            Ciudad
                                            <input name="campo42" type="text" class="campotext" id="campo42" size="15" maxlength="15">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>Persona diferente del acudiente, residente en
                                        Bogot&aacute;. D. C. (Con tel&eacute;fono diferente)</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">Nombre completo
                                            <input name="campo43" type="text" class="campotext" onBlur="this.value = convertTildes(this.value);" size="25" maxlength="35">
                                            Direcci&oacute;n
                                            <input name="campo44" type="text" class="campotext" size="25" maxlength="35">
                                            Tel&eacute;fono
                                            <input name="campo45" type="text" class="campotext" size="10" maxlength="20">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>INFORMACI&Oacute;N ACERCA DE LOS HERMANOS QUE
                                        ACTUALMENTE ESTUDIAN EN LA ESCUELA</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Nombre</td>
                                        <td colspan="2">N&uacute;mero de carnet estudiantil de la Escuela
                                        Colombiana de Ingenier&iacute;a</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input name="campo46" type="text" class="campotext" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
                                        </td>
                                        <td colspan="2">
                                            <input name="campo47" type="text" class="campotext" id="campo47" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input name="campo48" type="text" class="campotext" id="campo48" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
                                        </td>
                                        <td colspan="2">
                                            <input name="campo49" type="text" class="campotext" id="campo49" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><font color="#990000">*</font> Usted ingresar&aacute;
                                            simult&aacute;neamente con un hermano? &nbsp;&nbsp;<b>Si
                                                <input type="radio" name="simultaneo" value="S">
                                                &nbsp;&nbsp;No
                                                <input type="radio" name="simultaneo" value="N" checked>
                                        </b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Apellidos y Nombres</td>
                                        <td width="122">Documento</td>
                                        <td width="268">
                                            <input name="docher" type="text" class="campotext" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <input name="hermano" type="text" class="campotext"  onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
                                        </td>
                                        <td width="268">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>INFORMACI&Oacute;N FAMILIAR</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><strong>Acerca del Padre</strong></td>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">Vive? S&iacute;
                                            <input type="radio" name="campo50" value="S" checked>
                                            No
                                            <input type="radio" name="campo50" value="N">
                                            &nbsp;&nbsp;Nombre Completo
                                            <input name="campo51" type="text" class="campotext" value="" size="30" maxlength="40">
                                            Celular
                                            <input name="celularp" type="text" class="campotext" value="" size="10" maxlength="20">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">Direcci&oacute;n Residencia
                                            <input name="campo53" type="text" class="campotext" value="" size="20" maxlength="27">
                                            &nbsp;&nbsp;Tel&eacute;fono
                                            <input name="campo54" type="text" class="campotext" value="" size="10" maxlength="20">
                                            &nbsp;&nbsp;Ciudad
                                            <input name="campo55" type="text" class="campotext" value="" size="15" maxlength="9">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">Educaci&oacute;n
                                            <select name="campo56" size="1" class="campotext">
                                                <option value="X" selected>Seleccione
                                                <option value="P">Primaria
                                                <option value="S">Secundaria
                                                <option value="U">Universitaria
                                                <option value="E">Estudiante Universitario
                                                <option value="T">T&eacute;cnico
                                                <option value="L">Tecn&oacute;logo
                                            </select>
                                            &nbsp;&nbsp;Profesi&oacute;n
                                            <select name="campo57" size="1" class="campotext">
                                                <option value="0" selected>Seleccione</option>
                                                <%
        Vector profesion = new Vector();
        for (i = 0; i < profes.size(); i++) {
            profesion = (Vector) profes.elementAt(i);
                                                %>
                                                <option value="<%=profesion.elementAt(0)%>"><%=profesion.elementAt(1)%></option>
                                                <%
        }
                                                %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>Ocupaci&oacute;n Actual</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <select name="campo58" size="1" class="campotext">
                                                <option value="9">Empleado</option>
                                                <option value="5">Empresario</option>
                                                <option value="7">Trabajo Independiente</option>
                                                <option value="6">Profesional Independiente</option>
                                                <option value="15">Pensionado</option>
                                                <option value="4">Hogar</option>
                                                <option value="0" selected>Otro</option>
                                            </select>
                                            &nbsp;&nbsp;Entidad donde labora
                                            <input name="campo59" type="text" class="campotext" size="20" maxlength="50">
                                            &nbsp;&nbsp;Cargo
                                            <input name="campo60" type="text" class="campotext" size="20" maxlength="20">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">Antiguedad (n&uacute;mero de meses)
                                            <input type="text" name="antiguedadp" size="5" maxlength="5">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Ingresos mensuales(en miles de pesos sin puntos
                                        ni comas)</td>
                                        <td width="268">
                                            <input type="text" name="ingresosp" size="8" maxlength="8">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Direcci&oacute;n de correo electr&oacute;nico:</td>
                                        <td width="268">
                                            <input type="text" name="correop" size="50" maxlength="50">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">Dirección
                                            <input name="campo62" type="text" class="campotext" size="15" maxlength="27">
                                            &nbsp;&nbsp;Teléfono
                                            <input name="campo63" type="text" class="campotext" size="10" maxlength="20">
                                            &nbsp;&nbsp;Ciudad &nbsp;
                                            <input name="campo64" type="text" class="campotext" size="15" maxlength="9">
                                        &nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><strong>Acerca de la Madre</strong></td>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;Vive? S&iacute;
                                            <input type="radio" name="campo67" value="S" checked>
                                            No
                                            <input type="radio" name="campo67" value="N">
                                            &nbsp;&nbsp;Nombre Completo
                                            <input name="campo68" type="text" class="campotext" value="" size="30" maxlength="40">
                                            Celular
                                            <input name="celularm" type="text" class="campotext" value="" size="10" maxlength="20">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">Direcci&oacute;n Residencia
                                            <input name="campo70" type="text" class="campotext" value="" size="25" maxlength="27">
                                            &nbsp;&nbsp;Tel&eacute;fono
                                            <input name="campo71" type="text" class="campotext" value="" size="10" maxlength="20">
                                            &nbsp;&nbsp;Ciudad &nbsp; <b><b>
                                                    <input name="campo72" type="text" class="campotext" value="" size="15" maxlength="9">
                                        </b></b>&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">Educaci&oacute;n
                                            <select name="campo73" size="1" class="campotext" id="campo73">
                                                <option value="X" selected>Seleccione
                                                <option value="P">Primaria
                                                <option value="S">Secundaria
                                                <option value="U">Universitaria
                                                <option value="E">Estudiante Universitario
                                                <option value="T">T&eacute;cnico
                                                <option value="L">Tecn&oacute;logo
                                            </select>
                                            &nbsp;&nbsp; &nbsp;&nbsp;Profesi&oacute;n
                                            <select name="campo74" size="1" class="campotext">
                                                <option value="0" selected>Seleccione</option>
                                                <%
        profesion = new Vector();
        for (i = 0; i < profes.size(); i++) {
            profesion = (Vector) profes.elementAt(i);
                                                %>
                                                <option value="<%=profesion.elementAt(0)%>"><%=profesion.elementAt(1)%></option>
                                                <%
        }
                                                %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong>Ocupaci&oacute;n Actual</strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <select name="campo75" size="1" class="campotext">
                                                <option value="9">Empleado</option>
                                                <option value="5">Empresario</option>
                                                <option value="7">Trabajo Independiente</option>
                                                <option value="6">Profesional Independiente</option>
                                                <option value="15">Pensionado</option>
                                                <option value="4">Hogar</option>
                                                <option value="0" selected>Otro</option>
                                            </select>
                                            &nbsp;&nbsp;Entidad donde labora
                                            <input name="campo76" type="text" class="campotext" size="20" maxlength="50">
                                            &nbsp;&nbsp;Cargo
                                            <input name="campo77" type="text" class="campotext" size="20" maxlength="20">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">Antiguedad (n&uacute;mero de meses)
                                            <input type="text" name="antiguedadm" size="5" maxlength="5">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Ingresos mensuales(en miles de pesos sin puntos
                                        ni comas)</td>
                                        <td width="268">
                                            <input type="text" name="ingresosm" size="8" maxlength="8">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Direcci&oacute;n de correo electr&oacute;nico:</td>
                                        <td width="268">
                                            <input type="text" name="correom" size="50" maxlength="50">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">Dirección
                                            <input name="campo79" type="text" class="campotext" size="15" maxlength="27">
                                            &nbsp;&nbsp;Teléfono
                                            <input name="campo80" type="text" class="campotext" size="10" maxlength="20">
                                            &nbsp;&nbsp;Ciudad &nbsp; <b><b>
                                                    <input name="campo81" type="text" class="campotext" size="15" maxlength="9">
                                        </b></b>&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><font color="#990000">*</font> Alguno de sus padres
                                            es egresado de la Escuala Colombiana de Ingenier&iacute;a &nbsp;&nbsp;<b>
                                                <select name="egresado">
                                                    <option value="P" >Padre
                                                    <option value="M">Madre
                                                    <option value="A">Ambos Padres
                                                    <option value="N" selected>Ninguno
                                                </select>
                                        </b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <div align="center"><b>Me someto a la MATR&Iacute;CULA M&Aacute;XIMA
                                                    y, por lo tanto, declaro que no presento los documentos que
                                                    acrediten el ingreso familiar. &nbsp;&nbsp;Si
                                                    <input type="radio" name="campo101" value="S">
                                                    &nbsp;&nbsp;No
                                                    <input type="radio" name="campo101" value="N" checked>
                                            </b></div>
                                            <br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <div align="center"><b>Declaramos expresamente que la informaci&oacute;n
                                                    aqu&iacute; consignada es cierta y autorizamos su verificaci&oacute;n.
                                                    <br>
                                                    En el caso de encontrar falsedad de los datos consignados, esta
                                            solicitud se anular&aacute;.</b></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <div align="center">
                                                <input name="tipoest" type="hidden" id="tipoest" value="S">
                                                <input name="prog" type="hidden" id="prog" value="EB">
                                                <input name="ref" type="hidden" id="ref" value="0">
                                                <input name="estado" type="hidden" id="estado" value="-83">
                                                <input name="bi" type="submit" class="boton" value="Enviar Datos" onClick="javascript: return validar();">
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
        </table>
        <h1>&nbsp;</h1>



    </body>
</html>
