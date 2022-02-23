
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    BDadmisiones admision = new BDadmisiones();
    Vector ciud = admision.getCiudades();
    Vector profes = admision.getProfesiones();
    PrintWriter oout = response.getWriter();
    int i;
    String ref = request.getParameter("ref");
    String doc = request.getParameter("doc");
    String prog = "";
    Vector pginsc = admision.getInscrito(doc, ref);
    //Vector plan = admision.VerificaPlan(prog);
    //String uplan = plan.elementAt(0).toString();
    configeci.configuracion confEci = new configeci.configuracion();
//  prog = (pginsc.elementAt(1).toString());
//  out.println(prog);
//   Vector plan = admision.VerificaPlan(prog);
//String uplan = plan.elementAt(0).toString();
// out.println(uplan);
/*if(pginsc.size()>0){*/
//  String tipo = (String) pginsc.elementAt(6);
%>
<html>
    <head>
        <title>Formulario de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {
            var i, band, valor;
            for(i=0; i<50; i++){
            document.forminsc.elements[i].style.backgroundColor= '#D8E6F1';
            }


            if (document.forminsc.programa.value == "0"){
            alert("Por favor seleccione el programa académico")
            document.forminsc.programa.style.backgroundColor= '#ffcc00';
            document.getElementById("programa").focus();
            return false;
            }


            if (document.forminsc.inmersion.value==""){
            alert("Por favor seleccione el tipo de inmersión total o parcial")
            document.forminsc.inmersion.style.backgroundColor= '#ffcc00';
            document.getElementById("inmersion").focus();
            return false;
            }

            if (document.forminsc.campo1.value==""){
            alert("Por favor ingrese el código del colegio")
            document.forminsc.campo1.style.backgroundColor= '#ffcc00';
            document.getElementById("campo1").focus();
            return false;
            }

            valor = document.forminsc.campo1.value;

            if (isNaN(document.forminsc.campo1.value )){
            alert("EL CODIGO DEL COLEGIO DEBE SER NUMERICO");
            document.forminsc.campo1.style.backgroundColor= '#ffcc00';

            return false;
            }

            band = 0;
            for(i=0; i<50; i++){
            if(document.forminsc.elements[i].value == "null" || document.forminsc.elements[i].value == ""){
            if(document.forminsc.elements[i].name == "campo16" || document.forminsc.elements[i].name == "campo23" || document.forminsc.elements[i].name == "campo30"){
            ban=1
            }else{
            alert("Los campos con * son obligatorios ");
            document.forminsc.elements[i].style.backgroundColor= '#ffcc00';
            return false;
            }
            }
            }

            if (document.forminsc.ape1.value == ""){
            alert("Por favor ingrese su primer apellido");
            document.forminsc.ape1.style.backgroundColor= '#ffcc00';
            document.getElementById("ape1").focus();
            return false;

            }

            if (document.forminsc.ape2.value == ""){
            alert("Por favor ingrese su segundo apellido");
            document.forminsc.ape2.style.backgroundColor= '#ffcc00';
            document.getElementById("ape2").focus();
            return false;
            }

            if (document.forminsc.nombres.value == ""){
            alert("Por favor ingrese sus nombres");
            document.forminsc.nombres.style.backgroundColor= '#ffcc00';
            document.getElementById("nombres").focus();
            return false;
            }

            if(isNaN(document.forminsc.pension.value )){
            alert("El campo de Valor Mensual Pagado debe ser un número");
            document.forminsc.pension.style.backgroundColor= '#ffcc00';
            document.getElementById("pension").focus();
            return false;
            }else{
            for (i=0;i<document.forminsc.pension.value.length;i++) {
            if(document.forminsc.pension.value.charAt(i) == '.'){
            alert("En el campo Valor Mensual Pagado no coloque puntos ni comas");
            document.forminsc.pension.style.backgroundColor= '#ffcc00';
            document.getElementById("pension").focus();
            return false;
            }
            }
            }

            if(isNaN(document.forminsc.campo1.value )){
            alert("El Código del Colegio debe ser un número");
            document.forminsc.campo1.style.backgroundColor= '#ffcc00';
            document.getElementById("campo1").focus();
            return false;
            }

            if(isNaN(document.forminsc.doc_est.value )){
            alert("El documento debe ser numérico");
            document.forminsc.doc_est.style.backgroundColor= '#ffcc00';
            document.getElementById("doc_est").focus();
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
    <body>
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
        <p><br>
            <b> </b> </p>
        <table width="796" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
                <td>
                    <div align="center"><fieldset><legend class="textocom"><b>Formulario de
                                    inscripci&oacute;n-Articulaci&oacute;n</b></legend></fieldset></div>
                    <form action="grabaEstudArtic" method="post" name="forminsc" id="forminsc">
                        <table width="870" border="0" cellpadding="1" cellspacing="1" class="textocom" >
                            <tr>
                                <td colspan="4" height="22"><b><strong><font color="#990000">*</font></strong>Programa
                                        Acad&eacute;mico:
                                        <select name="programa" class="campotext" required="">
                                            <option value="" Selected>Seleccione</option>
                                            <option value="19">ADMINISTRACION DE EMPRESAS</option>
                                            <option value="18">ECONOMIA</option>
                                            <option value="13">INGENIERIA CIVIL</option>
                                            <option value="15">INGENIERIA DE SISTEMAS</option>
                                            <option value="16">INGENIERIA INDUSTRIAL</option>
                                            <option value="14">INGENIERIA ELECTRICA</option>
                                            <option value="17">INGENIERIA ELECTRONICA</option>
                                            <option value="20">MATEMATICAS</option>
                                            <option value="260">INGENIERIA MECANICA</option>
                                            <option value="264">INGENIERIA AMBIENTAL</option>
                                            <option value="262">INGENIERIA BIOMEDICA</option>
                                        </select>
                                    </b></td>
                            </tr>
                            <tr>
                                <td colspan="4"><b>Periodo Acad&eacute;mico:&nbsp;&nbsp;&nbsp;&nbsp;<%=confEci.getPeriodo()%></b></td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong>Tipo
                                        de inmersi&oacute;n:&nbsp;&nbsp;&nbsp;</b>
                                    <select name="inmersion" required="">
                                        <option value="">Seleccione</option>
                                        <option value="1">Total</option>
                                        <option value="2">Parcial</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <hr size="2">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" height="61">
                                    <p><b>INFORMACION DEL COLEGIO</b></p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"> <b><strong><font color="#990000">*</font></strong></b>Seleccione
                                    el colegio:
                                    <select name="campo1" required="">
                                        <option value="">Seleccione</option>
                                        <option value="115352">Colegio Calasanz Bogota</option>
                                        <option value="98574">Colegio Católico de la Sabana</option>
                                        <option value="138461">Colegio Campestre los sauces</option>

                                        <option value="20461">Colegio Esclavas del Sagrado Coraz&oacute;n
                                            de Jes&uacute;s</option>
                                        <option value="23234">Colegio Inglaterra Real</option>
                                        <option value="25239">Colegio Lisa Meitner</option>
                                        <option value="21691">Colegio Nuestra Se&ntilde;ora de la Sabidur&iacute;a
                                            Bogot&aacute;</option>
                                        <option value="20388">Colegio de la Ense&ntilde;anza</option>
                                        <option value="136267">Colegio Reuven Feuerstein</option>
                                        <option value="19794">Colegio Americano de Bogot&aacute;</option>
                                        <option value="107615">Colegio San Josemar&iacute;a Escriv&aacute;
                                            de Balaguer</option>
                                        <option value="160275">Colegio Mayor de Inglaterra</option>
                                        <option value="25304">Colegio Parroquial Santa Isabel de Hungr&iacute;a</option>
                                        <option value="21162">Colegio Emilio Valenzuela</option>
                                        <option value="135806">Colegio Eisenhower</option>
                                        <option value="25577">Colegio Nuestra Se&ntilde;ora del Pilar-Chapinero</option>
                                        <option value="25791">Colegio Canapro</option>
                                        <option value="22145">Colegio del Santo &Aacute;ngel</option>
                                        <option value="80150">Colegio Santo Tomás Chia</option>
                                        <option value="115352">Colegio San José de Calasanz Chia</option>
                                        <option value="107300">Gimnasio Campestre La Cumbre</option>
                                        <option value="81299">Gimnasio Fuentes del Río</option>
                                        <option value="20198">Gimnasio los Andes</option>
                                        <option value="92965">Gimnasio los Arrayanes</option>
                                        <option value="22848">Gimnasio Moderno</option>
                                        <option value="86835">Gimnasio Moderno Santa B&aacute;rbara</option>
                                        <option value="143537">Gimnasio Nuevo Modelia</option>
                                        <option value="25494">Instituto Pedag&oacute;gico Nacional</option>
                                        <option value="23507">Instituto San Bernardo de La Salle</option>
                                        <option value="85605">Liceo Cambridge</option>
                                        <option value="23754">Liceo Colombia</option>
                                        <option value="23846">Liceo Hermano Miguel de la Salle</option>
                                        <option value="56416">Liceo Hypatia.</option>  
                                        <option value="63883">Liceo Vida Amor y Luz.</option>  
                                        <option value="99077">Institución Educativa Departamental Técnico Industrial TOCANCIPÁ.</option>
                                        <option value="032480">Institución Educativa Comercial de TOCANCIPÁ</option>
                                        <option value="23358">Institución Educativa Distrital Andrés Bello</option>
                                        <option value="151589">Institución Educativa la Fuente de TOCANCIPÁ</option>
                                        <option value="23507">Instituto San Bernardo De La Salle</option>        
                                        <option value="133165">Summerhill School</option>
                                        <option value="12138">Colegio La Salle de Cúcuta</option>    
                                        <option value="25254">Colegio Miguel Antonio Caro Bogota</option>
                                        <option value="66845">Instituto Alberto Merani</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Grado
                                    :
                                    <select name="campo2" size="1" required="">
                                        <option value="">Seleccione</option>
                                        <option value="9">Noveno</option>
                                        <option value="10">D&eacute;cimo</option>
                                        <option value="11">Once</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><font color="#990000">*</font> Nombre del coordinador
                                        acad&eacute;mico </b>:
                                        <input type="text" required="" name="campo3" size="39" maxlength="39">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong>Valor
                                        pensi&oacute;n mensual (en pesos sin puntos ni comas):
                                        <input type="number" required="" name="campo4" size="8" maxlength="8">
                                    </b></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <hr size="2">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><strong>DATOS DEL SOLICITANTE</strong></td>
                            </tr>
                            <tr>
                                <td width="198" height="39"><strong><b><strong><font color="#990000">*</font></strong></b>Primer
                                        Apellido:</strong></td>
                                <td width="226" height="39">
                                    <input type="text" class="campotext" required="" name="ape1"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="">
                                </td>
                                <td width="197" height="39"><strong><b><strong><font color="#990000">*</font></strong></b>Segundo
                                        Apellido: </strong></td>
                                <td width="222" height="39"><strong>
                                        <input type="text" required="" class="campotext" name="ape2"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="">
                                    </strong> </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><b><strong><font color="#990000">*</font></strong></b>Nombres:</strong></td>
                                <td colspan="3">
                                    <input type="text" required="" class="campotext" name="nombres"  size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);"  value="">
                                </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><font color="#990000">*</font> Fecha de Nacimiento:</strong></td>
                                <td colspan="3"><strong>Dia</strong>
                                    <select name="campo5" class="campotext" required="" id="campo5">
                                        <option value="" selected>dia</option>
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
                                    <select name="campo6" required="" class="campotext" id="campo6">
                                        <option value="" selected>mes</option>
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
                                    <input name="campo7" required="" type="number" class="campotext" id="campo7" size="5" maxlength="4">
                                </td>
                            </tr>
                            <tr>
                                <td width="198"><font color="#990000">*</font> <strong>Lugar de nacimiento:</strong></td>
                                <td colspan="3">
                                    <select name="campo8" class="campotext" id="campo8" required="">
                                        <option value="" selected>Seleccione</option>
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
                                <td width="198"><strong><b><strong><font color="#990000">*</font></strong></b>Documento
                                        de identidad:</strong></td>
                                <td width="226"><font size="2">
                                    <input name="doc_est" type="number" required="" class="campotext" size="18" maxlength="20" >
                                    </font></td>
                                <td width="197"><b><strong><font color="#990000">*</font></strong>de:
                                        <input type="text" required="" name="campo9" size="30" maxlength="30">
                                    </b></td>
                                <td width="222"><b> </b> </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><font color="#990000">*</font> Tipo de documento</strong>:</td>
                                <td colspan="3"><font size="2"><b>
                                        <select name="tip_doc" class="campotext" required="">
                                            <option value="" selected>Seleccione</option>
                                            <option value="T">TI</option>
                                            <option value="C">CC</option>
                                            <option value="E">CE</option>
                                            <option value="R">RC</option>
                                        </select>
                                    </b> </font><b> </b></td>
                            </tr>
                            <tr>
                                <td colspan="4"><strong><font color="#990000">*</font> Sexo: &nbsp;&nbsp;&nbsp;<font size="2">
                                        <select name="campo10" class="campotext" id="campo9" required="">
                                            <option value="" selected>Seleccione</option>
                                            <option value="M">Masculino</option>
                                            <option value="F">Femenino</option>
                                        </select>
                                        </font><font color="#990000">&nbsp;&nbsp;&nbsp;*</font> Estado Civil:
                                        &nbsp;&nbsp;<font size="2">
                                        <select name="campo11" class="campotext" id="campo10" required="">
                                            <option value="" selected>Seleccione</option>
                                            <option value="S">Soltero(A)</option>
                                            <option value="C">Casado(A)</option>
                                            <option value="P">Separado(A)</option>
                                            <option value="V">Viudo(A)</option>
                                            <option value="U">Unión Libre</option>
                                        </select>
                                        </font></strong></td>
                            </tr>
                            <tr>
                                <td colspan="4"><strong><font color="#990000">*</font> Direcci&oacute;n
                                        correspondencia:
                                        <input name="campo12" type="text" class="campotext" id="campo11" size="50" maxlength="35" required="">
                                    </strong></td>
                            </tr>
                            <tr>
                                <td width="198"><font color="#990000">*</font> <b>Barrio</b></td>
                                <td colspan="3">
                                    <input type="text" name="campo13" required="" maxlength="49">
                                </td>
                            </tr>
                            <tr>
                                <td width="198"><font color="#990000">* </font><b>Eps</b></td>
                                <td colspan="3">
                                    <input type="text" name="campo14" size="50" maxlength="50" required="">
                                </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><font color="#990000">*</font> Ciudad:</strong></td>
                                <td colspan="3">
                                    <select name="campo15" class="campotext" id="campo14" required="">
                                        <option value="" selected>Seleccione</option>
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
                                    <input name="campo16" type="text" class="campotext" id="campo15" maxlength="12">
                                </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><font color="#990000">*</font> Tel&eacute;fono:
                                    </strong></td>
                                <td width="226">
                                    <input name="campo17" type="tel" class="campotext" id="campo16" maxlength="15" required="">
                                </td>
                                <td width="197"><strong><font color="#990000">*</font>Celular:
                                        <input name="celular" type="tel" class="campotext" id="celular" value="" maxlength="10" required="">
                                    </strong></td>
                                <td width="222">&nbsp; </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><font color="#990000">*</font> Correo electr&oacute;nico</strong></td>
                                <td width="226">
                                    <input name="campo18" type="email" class="campotext" id="campo17" value="" maxlength="30" required="">
                                </td>
                                <td width="197">&nbsp;</td>
                                <td width="222">&nbsp; </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <hr size="2">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><strong>DATOS FAMILIARES</strong></td>
                            </tr>
                            <tr>
                                <td width="198"><b><strong><font color="#990000">*</font></strong></b>Nombre
                                    del padre: </td>
                                <td colspan="2">
                                    <input name="campo19" type="text" class="campotext" value="" size="50" maxlength="50" required="">
                                </td>
                                <td width="222">&nbsp;</td>
                                <td width="11">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="198"> <b><strong><font color="#990000">*</font></strong></b>Documento
                                    : </td>
                                <td width="226">
                                    <input type="number" name="campo20" size="12" maxlength="12" required="">
                                </td>
                                <td width="197">&nbsp;</td>
                                <td width="222">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="198"><b><strong><font color="#990000">*</font></strong></b>Direcci&oacute;n
                                    Residencia &nbsp;&nbsp; &nbsp;&nbsp; </td>
                                <td width="226">
                                    <input name="campo21" type="text" class="campotext" value="" size="20" maxlength="27" required="">
                                </td>
                                <td width="197"><b><strong><font color="#990000">*</font></strong></b>Tel&eacute;fono
                                    residencia:
                                    <input name="campo22" type="tel" class="campotext" value="" size="10" maxlength="20" required="">
                                </td>
                                <td width="222">&nbsp; </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Celular
                                    <input name="celularp" type="tel" class="campotext" value="" size="10" maxlength="10" required="">
                                    <b><strong><font color="#990000">*</font></strong></b>E-mail:
                                    <input type="email" name="campo23" maxlength="30" required="">
                                    &nbsp;<b><strong><font color="#990000">*</font></strong></b>Profesi&oacute;n
                                    <select name="profesion" size="1" class="campotext" required="">
                                        <option value="" selected>Seleccione</option>
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
                                <td colspan="4"> <b><strong><font color="#990000">*</font></strong></b>Empresa
                                    donde trabaja:
                                    <input name="campo24" type="text" class="campotext" size="50" maxlength="50" required="">
                                    &nbsp;&nbsp;<b><strong><font color="#990000">*</font></strong></b>Cargo:
                                    <input name="campo25" type="text" class="campotext" size="35" maxlength="35" required="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Nombre
                                    de la madre:
                                    <input name="campo26" type="text" class="campotext" value="" size="50" maxlength="50" required="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"> <b><strong><font color="#990000">*</font></strong></b>Documento
                                    :
                                    <input type="text" name="campo27" size="12" maxlength="12" required="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Direcci&oacute;n
                                    Residencia
                                    <input name="campo28" type="text" class="campotext" value="" size="20" maxlength="27" required="">
                                    &nbsp;&nbsp;<b><strong><font color="#990000">*</font></strong></b>Tel&eacute;fono
                                    residencia:
                                    <input name="campo29" type="tel" class="campotext" value="" size="10" maxlength="20" required="">
                                    &nbsp;&nbsp; </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Celular
                                    <input name="celularm" type="tel" class="campotext" value="" size="10" maxlength="10" required="">
                                    <b><strong><font color="#990000">*</font></strong></b>E-mail:
                                    <input type="email" name="campo30" maxlength="30" required="">
                                    &nbsp;<b><strong><font color="#990000">*</font></strong></b>Profesi&oacute;n
                                    <select name="campo31" size="1" class="campotext" required="">
                                        <option value="" selected>Seleccione</option>
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
                                <td colspan="4"> <b><strong><font color="#990000">*</font></strong></b>Empresa
                                    donde trabaja:
                                    <input name="campo32" type="text" class="campotext" size="50" maxlength="50" required="">
                                    &nbsp;&nbsp;<b><strong><font color="#990000">*</font></strong></b>Cargo:
                                    <input name="campo33" type="text" class="campotext" size="35" maxlength="35" required="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <hr size="2">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b>DATOS DEL ACUDIENTE</b></td>
                            </tr>
                            <tr>
                                <td colspan="3"><b><strong><font color="#990000">*</font></strong></b>Parentesco:
                                    <select name="campo34" class="campotext" id="campo34" required="">
                                        <option value="" selected>Seleccione</option>
                                        <option value="M">Madre</option>
                                        <option value="P">Padre</option>
                                        <option value="A">Abuelo(a)</option>
                                        <option value="T">Tio(a)</option>
                                        <option value="H">Hermano(a)</option>
                                        <option value="R">Primo</option>
                                        <option value="O">Otro</option>
                                        <option value="N">Ninguno</option>
                                    </select>
                                </td>
                                <td width="222">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Nombres:
                                    <input type="text" name="campo35" maxlength="39" required="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Documento:
                                    <input type="number" name="campo36" maxlength="12" required="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Direcci&oacute;n
                                    de residencia:
                                    <input type="text" name="campo37" maxlength="27" required="">
                                </td>
                            </tr>
                            <!-- <tr>
                                <td colspan="4">Total ingresos año anterior $
                                  <input name="campo65" type="text" class="campotext" size="15" maxlength="9" id="campo65">
                                  <strong>(Sin puntos ni comas) </strong> </td>
                                              </tr>-->
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Tel&eacute;fono
                                    de Residencia:
                                    <input type="tel" name="campo38" maxlength="10" required="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Celular:
                                    <input type="tel" name="campo39" maxlength="10" required="">
                                    E -mail:
                                    <input type="email" name="campo40" maxlength="30" required="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <hr size="2">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b>RECONOCIMIENTOS Y PARTICIPACIONES ACADEMICAS</b></td>
                            </tr>
                            <tr>
                                <td colspan="4">1.
                                    <input type="text" name="campo41" size="30" maxlength="30" value="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">2.
                                    <input type="text" name="campo42" size="30" maxlength="30" value="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">3.
                                    <input type="text" name="campo43"  value="" maxlength="30"  size="30">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                            <!--   <tr>
                                <td colspan="4">Total ingresos año anterior $
                                  <input name="campo82" type="text" id="campo82" class="campotext" size="15" maxlength="9">
                                  <strong>(Sin puntos ni comas) </strong></td>
                                              </tr>-->
                            <tr>
                                <td colspan="4"><b>DOCUMENTOS ANEXOS AL FORMULARIO DE SOLICITUD </b>
                                    <p>1. Fotocopia del carn&eacute; del colegio al 150%<br>
                                        2. Fotocopia del documento de identidad al 150%<br>
                                        3. Fotocopia del carn&eacute; de la EPS al 150%<br>
                                        4. Certificado de notas obtenidas por el estudiante en los &uacute;ltimos
                                        cuatro grados del bachillerato (8, 9, 10 y 11)<br>
                                        5. Recomendaci&oacute;n escrita a nombre de los estudiantes<br>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div align="left"></div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div align="center">
                                        <input name="tipoest" type="hidden" id="tipoest" value="<!%=pginsc.elementAt(6)%>">
                                        <input name="numreg" type="hidden" id="numreg" value="<!%=pginsc.elementAt(4)%>">
                                        <input name="nom_est" type="hidden" id="nom_est" value="<!%=pginsc.elementAt(2)%>">
                                        <input name="ref" type="hidden" id="ref" value="<!%=pginsc.elementAt(0)%>">
                                        <input name="celular" type="hidden" id="celular" value="<!%=pginsc.elementAt(10)%>">
                                        <input name="programa2" type="hidden" id="programa" value="<!%=pginsc.elementAt(1)%>">
                                        <input name="interes" type="hidden" id="interes" value="">
                                        <input name="uplan" type="hidden" id="uplan" value="<!%=uplan%>" >
                                        <input name="bi" type="submit" class="boton" value="Enviar Solicitud de Admisión" onClick="javascript: return validar();">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>
<!%
}else
response.sendRedirect("ErrorPago");
%>
