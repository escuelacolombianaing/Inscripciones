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
        String ref = request.getParameter("ref");
        String doc = request.getParameter("doc");
        Vector pginsc = admision.getInscrito(doc, ref);
        /*if(pginsc.size()>0){*/
        String tipo = (String) pginsc.elementAt(6);
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


                valor = document.forminsc.campo18.value;

                if (/^\s+$/.test(valor) ){
                    alert("POR FAVOR INGRESE EL CODIGO DEL COLEGIO, NO DEBE INGRESAR ESPACIOS EN BLANCO");
                    document.forminsc.campo18.style.backgroundColor= '#ffcc00';

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
                for(i=0; i<43; i++){
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

                if (document.forminsc.campo4.value == ""){
                    alert("Por favor seleccione la ciudad de nacimiento");
                    return false;

                }



                if((document.forminsc.campo51.value == "" || document.forminsc.campo54.value == "")&&(document.forminsc.campo68.value == "" || document.forminsc.campo71.value == "") ){
                    alert("Ingrese la información de por lo menos uno de los padres");
                    return false;
                }
                if(isNaN(document.forminsc.campo26.value )){
                    alert("El campo de Valor Mensual Pagado debe ser un número");
                    document.forminsc.campo26.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo26").focus();
                    return false;
                }else{
                    for (i=0;i<document.forminsc.campo26.value.length;i++) {
                        if(document.forminsc.campo26.value.charAt(i) == '.'){
                            alert("En el campo Valor Mensual Pagado no coloque puntos ni comas");
                            document.forminsc.campo26.style.backgroundColor= '#ffcc00';
                            document.getElementById("campo26").focus();
                            return false;
                        }
                    }
                }
                if(isNaN(document.forminsc.campo18.value )){
                    alert("El Código del Colegio debe ser un número");
                    document.forminsc.campo18.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo18").focus();
                    return false;
                }




                if(isNaN(document.forminsc.campo3.value )){
                    alert("Año debe ser un número");
                    document.forminsc.campo3.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo3").focus();
                    return false;
                }

                if(isNaN(document.forminsc.campo20.value )){
                    alert("Año debe ser un número");
                    document.forminsc.campo20.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo20").focus();
                    return false;
                }

                if(isNaN(document.forminsc.campo27.value )){
                    alert("Año debe ser un número");
                    document.forminsc.campo27.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo27").focus();
                    return false;
                }
                document.forminsc.campo65.style.backgroundColor= '#D8E6F1';
                document.forminsc.campo82.style.backgroundColor= '#D8E6F1';
                if(isNaN(document.forminsc.campo65.value )){
                    alert("Los ingresos deben ser un número");
                    document.forminsc.campo65.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo65").focus();
                    return false;
                }else{
                    for (i=0;i<document.forminsc.campo65.value.length;i++) {
                        if(document.forminsc.campo65.value.charAt(i) == '.'){
                            alert("En el campo de ingresos no coloque puntos ni comas");
                            document.forminsc.campo65.style.backgroundColor= '#ffcc00';
                            document.getElementById("campo65").focus();
                            return false;
                        }
                    }
                    //document.forminsc.campo65.value = document.forminsc.campo65.value.replace('.', '');
                }
                if(isNaN(document.forminsc.campo82.value )){
                    alert("Los ingresos deben ser un número");
                    document.forminsc.campo82.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo82").focus();
                    return false;
                }else{
                    for (i=0;i<document.forminsc.campo82.value.length;i++) {
                        if(document.forminsc.campo82.value.charAt(i) == '.'){
                            alert("En el campo de ingresos no coloque puntos ni comas");
                            document.forminsc.campo82.style.backgroundColor= '#ffcc00';
                            document.getElementById("campo82").focus();
                            return false;
                        }
                    }
                    //document.forminsc.campo82.value = document.forminsc.campo82.value.replace('.', '');
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
        <br>
        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
                
    <td><fieldset><legend class="textocom"><strong>Entrevista Becas Julio Garavito</strong></legend> 
      <div align="center" class="textocom">
        <p>&nbsp;</p>
      </div>
      <div align="center">
<form action="GrabaEstudiante" method="post" name="forminsc" id="forminsc">
                                
          <table width="666" border="0" cellpadding="1" cellspacing="1" class="textocom">
            <tr> 
              <td width="172"><strong>Nombres y apellidos del aspirante:</strong></td>
              <td colspan="3"> 
                <input type="text" name="nombres" size="80" maxlength="80">
              </td>
            </tr>
            <tr> 
              <td width="172"><strong><font color="#990000">*</font> Fecha de 
                Nacimiento:</strong></td>
              <td width="100"><strong>Dia</strong> 
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
                &nbsp;&nbsp;<strong>&nbsp;</strong>&nbsp;&nbsp;<strong>&nbsp;</strong></td>
              <td width="130"><strong>Mes</strong> 
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
              </td>
              <td width="273"><strong>A&ntilde;o</strong> 
                <input name="campo3" type="text" class="campotext" id="campo3" size="5" maxlength="4">
              </td>
            </tr>
            <tr> 
              <td width="101"><font color="#990000">*</font> <strong>Lugar de 
                nacimiento:</strong></td>
              <td colspan="3"> 
                <select name="campo4" class="campotext" id="campo4">
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
              <td colspan="4"> 
                <p><b>* Direcci&oacute;n: 
                  <input type="text" name="textfield" size="60" maxlength="60">
                  </b></p>
              </td>
            </tr>
            <br>
            <tr> 
              <td colspan="4"> 
                <p>Informantes: 
                  <input type="text" name="textfield2" size="80" maxlength="80">
                </p>
              </td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <p><b>Programa al que aspira: 
                  <input type="text" name="textfield3" size="40" maxlength="40">
                  </b></p>
              </td>
            </tr>
            <%if (tipo.equals("T")) {%>
            <tr> 
              <td colspan="4">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <table width="100%" border="1">
                  <tr> 
                    <td width="33%"><b>Nombres y Apellidos</b></td>
                    <td width="10%"><b>C.C</b></td>
                    <td width="20%"><b>Parentesco</b></td>
                    <td width="6%"><b>Edad</b></td>
                    <td width="14%"><b>Nivel Escolar</b></td>
                    <td width="17%"><b>Ocupacion Actual</b></td>
                  </tr>
                  <tr> 
                    <td width="33%"> 
                      <input type="text" name="textfield4" size="40" maxlength="40">
                    </td>
                    <td width="10%"> 
                      <input type="text" name="textfield5" size="10" maxlength="10">
                    </td>
                    <td width="20%"> 
                      <input type="text" name="textfield6">
                    </td>
                    <td width="6%"> 
                      <input type="text" name="textfield7" size="2" maxlength="2">
                    </td>
                    <td width="14%"> 
                      <input type="text" name="textfield8" size="16" maxlength="16">
                    </td>
                    <td width="17%"> 
                      <input type="text" name="textfield9" size="25" maxlength="25">
                    </td>
                  </tr>
                  <tr> 
                    <td width="33%"> 
                      <input type="text" name="textfield42" size="40" maxlength="40">
                    </td>
                    <td width="10%"> 
                      <input type="text" name="textfield52" size="10" maxlength="10">
                    </td>
                    <td width="20%"> 
                      <input type="text" name="textfield62">
                    </td>
                    <td width="6%"> 
                      <input type="text" name="textfield72" size="2" maxlength="2">
                    </td>
                    <td width="14%"> 
                      <input type="text" name="textfield82" size="16" maxlength="16">
                    </td>
                    <td width="17%"> 
                      <input type="text" name="textfield92" size="25" maxlength="25">
                    </td>
                  </tr>
                  <tr> 
                    <td width="33%"> 
                      <input type="text" name="textfield43" size="40" maxlength="40">
                    </td>
                    <td width="10%"> 
                      <input type="text" name="textfield53" size="10" maxlength="10">
                    </td>
                    <td width="20%"> 
                      <input type="text" name="textfield63">
                    </td>
                    <td width="6%"> 
                      <input type="text" name="textfield73" size="2" maxlength="2">
                    </td>
                    <td width="14%"> 
                      <input type="text" name="textfield83" size="16" maxlength="16">
                    </td>
                    <td width="17%"> 
                      <input type="text" name="textfield93" size="25" maxlength="25">
                    </td>
                  </tr>
                  <tr> 
                    <td width="33%"> 
                      <input type="text" name="textfield44" size="40" maxlength="40">
                    </td>
                    <td width="10%"> 
                      <input type="text" name="textfield54" size="10" maxlength="10">
                    </td>
                    <td width="20%"> 
                      <input type="text" name="textfield64">
                    </td>
                    <td width="6%"> 
                      <input type="text" name="textfield74" size="2" maxlength="2">
                    </td>
                    <td width="14%"> 
                      <input type="text" name="textfield84" size="16" maxlength="16">
                    </td>
                    <td width="17%"> 
                      <input type="text" name="textfield94" size="25" maxlength="25">
                    </td>
                  </tr>
                  <tr> 
                    <td width="33%"> 
                      <input type="text" name="textfield45" size="40" maxlength="40">
                    </td>
                    <td width="10%"> 
                      <input type="text" name="textfield55" size="10" maxlength="10">
                    </td>
                    <td width="20%"> 
                      <input type="text" name="textfield65">
                    </td>
                    <td width="6%"> 
                      <input type="text" name="textfield75" size="2" maxlength="2">
                    </td>
                    <td width="14%"> 
                      <input type="text" name="textfield85" size="16" maxlength="16">
                    </td>
                    <td width="17%"> 
                      <input type="text" name="textfield95" size="25" maxlength="25">
                    </td>
                  </tr>
                  <tr> 
                    <td width="33%"> 
                      <input type="text" name="textfield46" size="40" maxlength="40">
                    </td>
                    <td width="10%"> 
                      <input type="text" name="textfield56" size="10" maxlength="10">
                    </td>
                    <td width="20%"> 
                      <input type="text" name="textfield66">
                    </td>
                    <td width="6%"> 
                      <input type="text" name="textfield76" size="2" maxlength="2">
                    </td>
                    <td width="14%"> 
                      <input type="text" name="textfield86" size="16" maxlength="16">
                    </td>
                    <td width="17%"> 
                      <input type="text" name="textfield96" size="25" maxlength="25">
                    </td>
                  </tr>
                  <tr> 
                    <td width="33%"> 
                      <input type="text" name="textfield47" size="40" maxlength="40">
                    </td>
                    <td width="10%"> 
                      <input type="text" name="textfield57" size="10" maxlength="10">
                    </td>
                    <td width="20%"> 
                      <input type="text" name="textfield67">
                    </td>
                    <td width="6%"> 
                      <input type="text" name="textfield77" size="2" maxlength="2">
                    </td>
                    <td width="14%"> 
                      <input type="text" name="textfield87" size="16" maxlength="16">
                    </td>
                    <td width="17%"> 
                      <input type="text" name="textfield97" size="25" maxlength="25">
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr> 
              <td colspan="4">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <p>1. Presentan personas de la familia enfermedades del S.N.C 
                  psiqui&aacute;tricas, desnutrici&oacute;n, alcoholismo, R:M. 
                  otras.</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>&nbsp;S&iacute; </b> 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>No</b> 
                  <input type="radio" name="radiobutton" value="radiobutton">
                </p>
              </td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <p>2. Existen conductas desfavorables reportadas (agresiones, 
                  pasividad, irresponsabilidad, inestabilidad) en la familia?</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>&nbsp;S&iacute; </b> 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>No</b> 
                  <input type="radio" name="radiobutton" value="radiobutton">
                </p>
              </td>
              <p> 
            </tr>
            <tr> 
              <td colspan="4"> 
                <p>&nbsp;</p>
                <p>En la familia del candidato existe</p>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="61">3. Comunicaci&oacute;n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;S&iacute; 
                </b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>No</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4">4. Control &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;S&iacute; 
                </b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>No</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4">5. Expresi&oacute;n de sentimientos<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;S&iacute; </b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>No</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> &nbsp; 
              <td colspan="4"> 
                <p>6. La relaci&oacute;n entre los padres del candidato es: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Favorable 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Desfavorable 
                  <input type="radio" name="radiobutton" value="radiobutton">
                </p>
              </td>
            </tr>
            <tr> 
              <td colspan="4">7. La relaci&oacute;n entre los hermanos y el candidato 
                es: &nbsp;&nbsp;&nbsp;&nbsp;Favorable 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Desfavorable 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4">8. La relaci&oacute;n del candidato con sus padres 
                es : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Favorable 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Desfavorable 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4">9. Presentaci&oacute;n personal &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp; Favorable 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Desfavorable 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="42">10. Motivaciones especiales<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                S&iacute; </b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>No</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp; </td>
            </tr>
            <%if (tipo.equals("T")) {%>
            <tr> 
              <td colspan="4">11. Presenta actitud de colaboraci&oacute;n y de 
                participaci&oacute;n <b>&nbsp;&nbsp;&nbsp; S&iacute; </b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>No</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <%        }
                                    %>
            <tr> 
              <td colspan="4">12. Posee h&aacute;bitos - disciplina <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                S&iacute; </b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>No</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4">13.Percepci&oacute;n que tiene la familia de &eacute;l 
                o de ella:<b>&nbsp; Favorable</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Desfavorable</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4">14.Presenta habilidades de soluci&oacute;n de problemas? 
                <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S&iacute; 
                </b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>No</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <!-- <tr>
              <td colspan="4"><strong><font color="#990000">*</font> Valor mensual
                pagado en el &uacute;ltimo a&ntilde;o de estudios en colegio:
                Si usted realiz&oacute; un solo pago en el a&ntilde;o div&iacute;dalo
                por 10 y el resultado reg&iacute;strelo en la casilla de valor</strong></td>
            </tr>
            <tr>
              <td colspan="4">Valor $<strong> </strong> <strong>(Sin puntos ni
                <input name="campo26" type="text" class="campotext" id="campo26" maxlength="7">
                comas) </strong>Fecha de pago Mes
                <select name="mes" class="campotext" id="select2">
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
                <input name="campo27" type="text" class="campotext" id="campo27" size="4" maxlength="4">
              </td>
            </tr>
            <tr>
              <td height="15" colspan="4"><b>Valor pagado por matr&iacute;cula
                en el &uacute;ltimo semestre</b> (Si es su caso)</td>
            </tr>
            <tr>
              <td colspan="4">Fecha del &uacute;ltimo pago (dd-mm-aaaa)
                <input name="campo28" type="text" class="campotext" size="25" maxlength="25">
                Valor $
                <input name="campo29" type="text" class="campotext" value="0" size="10" maxlength="8">
                <strong>(Sin puntos ni comas) </strong> </td>
                                    </tr>-->
            <tr> 
              <td colspan="4"> 
                <p>15.Vivienda durante la permanencia en la escuela para los candidatos 
                  de fuera de Bogot&aacute;</p>
                <p>&nbsp;&nbsp;&nbsp; Facilidad 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  &nbsp;&nbsp;&nbsp; Dificultad 
                  <input type="radio" name="radiobutton" value="radiobutton">
                </p>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="71">16.Recibe apoyo econ&oacute;mico de 
                su familia? <b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;S&iacute; </b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b> No</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4">17.Tendr&iacute;a posibilidades de pagar un porcentaje 
                de la matr&iacute;cula? <b>&nbsp;&nbsp;S&iacute; </b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b> No</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr>
              <td colspan="4">18.Muestra vocaci&oacute;n y conocimiento de la 
                carrera? <b>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;S&iacute; 
                </b> 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b> No</b> 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <p>Observaciones-Recomendaci&oacute;n</p>
                <p>
                  <textarea name="textfield10" cols="60" rows="4"></textarea>
                </p>
                <p>&nbsp;</p>
              </td>
            </tr>
            <!-- <tr>
              <td colspan="4">Total ingresos año anterior $
                <input name="campo65" type="text" class="campotext" size="15" maxlength="9" id="campo65">
                <strong>(Sin puntos ni comas) </strong> </td>
                                    </tr>-->
            <!--   <tr>
              <td colspan="4">Total ingresos año anterior $
                <input name="campo82" type="text" id="campo82" class="campotext" size="15" maxlength="9">
                <strong>(Sin puntos ni comas) </strong></td>
                                    </tr>-->
            <tr> 
              <td colspan="4"> 
                <div align="left"> 
                  <hr size="2">
                  <b> </b></div>
              </td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <div align="center"> 
                  <input name="tipoest" type="hidden" id="tipoest" value="<%=pginsc.elementAt(6)%>">
                  <input name="numreg" type="hidden" id="numreg" value="<%=pginsc.elementAt(4)%>">
                  <input name="nom_est" type="hidden" id="nom_est" value="<%=pginsc.elementAt(2)%>">
                  <input name="ref" type="hidden" id="ref" value="<%=pginsc.elementAt(0)%>">
                  <input name="celular" type="hidden" id="celular" value="<%=pginsc.elementAt(10)%>">
                  <input name="bi" type="submit" class="boton" value="Ingresar Datos" onClick="javascript: return validar();">
                </div>
              </td>
            </tr>
            <tr> 
              <td colspan="4">&nbsp;</td>
            </tr>
          </table>
                            </form>
                        </div>
                    </fieldset>
                </td>
            </tr>
        </table>
    </body>
</html>
<!%
}else
response.sendRedirect("ErrorPago");
%>
