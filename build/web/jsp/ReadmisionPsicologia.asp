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
                    alert("Por favor se�ale el medio por el cual se entero de la ECI");
                    document.forminsc.medio.style.backgroundColor= '#ffcc00';
                    document.forminsc.medio.focus();
                    return false;
                }
                if(document.forminsc.doc_est.value != document.forminsc.doc_est2.value){
                    alert("Los n�meros de documento no concuerdan");
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
                    alert("El N�mero de carnet debe ser num�rico");
                    document.forminsc.campo47.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo47").focus();
                    return false;
                }

                if(isNaN(document.forminsc.campo49.value )){
                    alert("El N�mero de carnet debe ser num�rico");
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
                    alert("Ingrese la informaci�n de por lo menos uno de los padres");
                    return false;
                }
                if(isNaN(document.forminsc.campo26.value )){
                    alert("El campo de Valor Mensual Pagado debe ser un n�mero");
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
                    alert("El C�digo del Colegio debe ser un n�mero");
                    document.forminsc.campo18.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo18").focus();
                    return false;
                }




                if(isNaN(document.forminsc.campo3.value )){
                    alert("A�o debe ser un n�mero");
                    document.forminsc.campo3.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo3").focus();
                    return false;
                }

                if(isNaN(document.forminsc.campo20.value )){
                    alert("A�o debe ser un n�mero");
                    document.forminsc.campo20.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo20").focus();
                    return false;
                }

                if(isNaN(document.forminsc.campo27.value )){
                    alert("A�o debe ser un n�mero");
                    document.forminsc.campo27.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo27").focus();
                    return false;
                }
                document.forminsc.campo65.style.backgroundColor= '#D8E6F1';
                document.forminsc.campo82.style.backgroundColor= '#D8E6F1';
                if(isNaN(document.forminsc.campo65.value )){
                    alert("Los ingresos deben ser un n�mero");
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
                    alert("Los ingresos deben ser un n�mero");
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
                
    <td><fieldset><legend class="textocom"><strong>Entrevista Readmisi&oacute;n</strong></legend> 
      <div align="center" class="textocom">
        <p>&nbsp;</p>
      </div>
      <div align="center">
<form action="GrabaEstudiante" method="post" name="forminsc" id="forminsc">
                                
          <table width="666" border="0" cellpadding="1" cellspacing="1" class="textocom">
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
                  <option value="4"><font size="3">Bolet�n del ICFES</font></option>
                  <option value="5"><font size="3">Directorio Telef�nico</font></option>
                  <option value="6"><font size="3">Visitas a su colegio (charlas 
                  de orientaci�n profesional)</font></option>
                  <option value="7"><font size="3">Ferias Universitarias</font></option>
                  <option value="8"><font size="3">P�gina Web de la ECI</font></option>
                  <option value="9"><font size="3">Directivos o profesores de 
                  su colegio</font></option>
                  <option value="10"><font size="3">Aviso de prensa</font></option>
                  <option value="11"><font size="3">Revista Especializada en Educaci�n 
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
              <td width="99"><strong>Nombres y apellidos del aspirante:</strong></td>
              <td colspan="3"> 
                <input type="text" class="campotext" name="nombres"  size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(9)%>">
              </td>
            </tr>
            <tr> 
              <td width="99"><strong>Fecha:</strong></td>
              <td width="155"><font size="2"> 
                <input name="doc_est" type="text" class="campotext" size="18" maxlength="20" value="<%=pginsc.elementAt(3)%>">
                </font></td>
              <td width="131"><strong><font color="#990000">*</font> Programa 
                Acad&eacute;mico:</strong></td>
              <td width="268"><b> <font size="2"> 
                <input name="doc_est2" type="text" class="campotext" id="doc_est2" size="18" maxlength="20">
                </font> </b></td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <p><strong><font color="#990000">* </font> Identifica las causas 
                  que provocaron su situaci&oacute;n acad&eacute;mica actual?</strong></p>
                <p> &nbsp;&nbsp;&nbsp;S&iacute; &nbsp; 
                  <input type="radio" name="campo1" value="radiobutton">
                  &nbsp;&nbsp;&nbsp; No &nbsp;&nbsp; 
                  <input type="radio" name="campo1" value="radiobutton">
                </p>
              </td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <p><b><font color="#990000">*</font> Identifica el punto de vista 
                  acad&eacute;mico, mencione los aspectos espec&iacute;ficos que 
                  hayan tenido incidencia en su situaci&oacute;n actual?</b></p>
                <p><b>Los menciona claramente?</b><font size="3"> 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  &nbsp; &nbsp; <font color="#000000"><b>No es claro</b> </font> 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  </font></p>
              </td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <p>&nbsp;</p>
                <p><b>3. Realice una auto-evaluaci&oacute;n de su situaci&oacute;n 
                  actual (Nivel de comprensi&oacute;n de lo que pasa).</b></p>
              </td>
            </tr>
            <%if (tipo.equals("T")) {%>
            <tr> 
              <td colspan="2"> 
                <p>a) Apoyo Familiar</p>
              </td>
              <td width="131"> 
                <p>Si 
                  <input type="radio" name="radiobutton" value="radiobutton">
                </p>
              </td>
              <td width="268"> 
                <p>No 
                  <input type="radio" name="radiobutton" value="radiobutton">
                </p>
              </td>
            </tr>
            <tr> 
              <td colspan="2">b) Trabaja Actualmente</td>
              <td width="131">Si 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
              <td width="268">No 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="2">c) Fracaso Acad&eacute;mico (Actitud)</td>
              <td width="131">Positiva 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
              <td width="268">Negativa 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="2">d) Relaciones sociales padres, pareja</td>
              <td width="131">Positiva 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
              <td width="268">Negativa 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="2">e) Relaci&oacute;n con los profesores-Universitario</td>
              <td width="131">Positiva 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
              <td width="268">Negativa 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <%}%>
            <tr> 
              <td colspan="4"> 
                <p><b>4. Define claramente su responsabilidad y compromiso frente 
                  a su situaci&oacute;n actual?</b></p>
                <p>&nbsp; &nbsp; &nbsp; &nbsp; S&iacute; 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  &nbsp; &nbsp; &nbsp; &nbsp; No 
                  <input type="radio" name="radiobutton" value="radiobutton">
                </p>
              </td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <p><strong>5. Tiene plan para enfrentar las dificultades : &nbsp;&nbsp;&nbsp;&nbsp;</strong>S&iacute; 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  &nbsp; &nbsp; &nbsp; &nbsp; No 
                  <input type="radio" name="radiobutton" value="radiobutton">
                </p>
              </td>
            </tr>
            <tr> 
              <td colspan="4"><strong> Ya lo inicio? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;S&iacute; 
                <input type="radio" name="radiobutton" value="radiobutton">
                &nbsp; &nbsp; &nbsp; &nbsp; No 
                <input type="radio" name="radiobutton" value="radiobutton">
                </strong></td>
              <p> 
            </tr>
            <tr> 
              <td colspan="4"> 
                <p><b>6. Define claramente porqu&eacute; esta elecci&oacute;n 
                  vocacional es la correcta? (Ha contemplado otras opciones?)</b> 
                  S&iacute; 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  &nbsp; &nbsp; &nbsp; &nbsp; No 
                  <input type="radio" name="radiobutton" value="radiobutton">
                </p>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="61"> 
                <p><b>7. Porqu&eacute; desea ingresar a la instituci&oacute;n 
                  y no a otra?</b></p>
                <p><b>Motivaci&oacute;n Personal 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  Motivaci&oacute;n Externa 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  </b></p>
              </td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <p><strong>8. De qui&eacute;n surgi&oacute; la idea del regreso? 
                  Propia 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  Otras personas 
                  <input type="radio" name="radiobutton" value="radiobutton">
                  </strong></p>
              </td>
            </tr>
            <tr> 
              <td colspan="4"><b>9. Cu&aacute;l fu&eacute; el proceso de elecci&oacute;n 
                de carrera? </b></td>
            </tr>
            <tr> 
              <td colspan="4">Planeaci&oacute;n 
                <input type="radio" name="radiobutton" value="radiobutton">
                No planeada 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4"> Con orientaci&oacute;n 
                <input type="radio" name="radiobutton" value="radiobutton">
                Sin orientaci&oacute;n 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4">10. Acompa&ntilde;amiento y control familiar Si 
                <input type="radio" name="radiobutton" value="radiobutton">
                No 
                <input type="radio" name="radiobutton" value="radiobutton">
              </td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <p>Qui&eacute;n lo realiza? 
                  <input type="text" name="textfield" size="60" maxlength="60">
                </p>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="42"> 
                <p>Parentesco : 
                  <input type="text" name="textfield2" size="20" maxlength="20">
                </p>
              </td>
            </tr>
            <%if (tipo.equals("T")) {%>
            <tr> 
              <td colspan="4"><strong>Tel&eacute;fonos: 
                <input type="text" name="textfield3" size="40" maxlength="40">
                </strong></td>
            </tr>
            <%        }
                                    %>
            <tr> 
              <td colspan="4"> 
                <p>11.Actividades de esparcimiento</p>
              </td>
            </tr>
            <tr> 
              <td colspan="4"><strong>Tipo: 
                <input type="text" name="textfield4" size="80" maxlength="80">
                </strong></td>
            </tr>
            <tr> 
              <td colspan="4"><strong>Frecuencia : 
                <input type="text" name="textfield5" size="40" maxlength="40">
                </strong></td>
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
              <td colspan="4"><strong>Duraci&oacute;n : 
                <input type="text" name="textfield6" size="40" maxlength="40">
                </strong></td>
            </tr>
            <tr>
              <td colspan="4">Observaci&oacute;nes y Recomendaci&oacute;n:</td>
            </tr>
            <tr> 
              <td colspan="4">
                <textarea name="textfield7" cols="50" rows="4"></textarea>
              </td>
            </tr>
            <!-- <tr>
              <td colspan="4">Total ingresos a�o anterior $
                <input name="campo65" type="text" class="campotext" size="15" maxlength="9" id="campo65">
                <strong>(Sin puntos ni comas) </strong> </td>
                                    </tr>-->
            <!--   <tr>
              <td colspan="4">Total ingresos a�o anterior $
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
                  <input name="interes" type="interes" id="interes" value="">
                  <input name="bi" type="submit" class="boton" value="Enviar Solicitud de Admisi�n" onClick="javascript: return validar();">
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
