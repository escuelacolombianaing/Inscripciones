<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
HttpSession sesion;
response.setHeader("Cache-Control","no-cache");
BDadmisiones admision = new BDadmisiones();
Vector ciud = admision.getCiudades();
Vector profes = admision.getProfesiones();
int i;
String ref = request.getParameter("ref");
String doc = request.getParameter("doc");
Vector pginsc = admision.getInscrito(doc, ref);
if(pginsc.size()>0){
    String tipo = (String)pginsc.elementAt(6);
%>
<html>
    <head>
        <title>Formulario de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
<!--
function validar() {
  var i, band;
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
  
      

  band = 0;
  for(i=0; i<43; i++){
        if(document.forminsc.elements[i].value == "null" || document.forminsc.elements[i].value == ""){
            if(document.forminsc.elements[i].name == "campo5" && document.forminsc.campo4.value != "0"){
                band = 1;
            }else if(document.forminsc.elements[i].name == "campo6" || document.forminsc.elements[i].name == "campo7" || document.forminsc.elements[i].name == "campo8" || document.forminsc.elements[i].name == "campo9"){
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
                	document.getElementById("arriba").focus();
				else
					document.getElementById("campo18").focus();
                return false;
            }
        }
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
        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                
    <td>
      <div align="center">
<form action="GrabaEstudiante" method="post" name="forminsc" id="forminsc">
                                
          <table width="666" border="0" cellpadding="1" cellspacing="1" class="textocom">
            <tr> 
              <td colspan="4" height="30"><B>INFORMACION PERSONAL</B></td>
            </tr>
            <tr> 
              <td width="110"><strong>Primer Apellido del aspirante:</strong></td>
              <td width="178"> 
                <input type="text" class="campotext" name="ape1"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(7)%>">
              </td>
              <td width="141"><strong>Segundo Apellido del aspirante:</strong></td>
              <td width="224"> 
                <input type="text" class="campotext" name="ape2"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(8)%>">
              </td>
            </tr>
            <tr> 
              <td width="110"><strong>Nombres del aspirante:</strong></td>
              <td colspan="3"> 
                <input type="text" class="campotext" name="nombres"  size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(9)%>">
              </td>
            </tr>
            <tr> 
              <td width="110"><strong>Documento de identidad:</strong></td>
              <td width="178"><font size="2"> 
                <input name="doc_est" type="text" class="campotext" size="18" maxlength="20" value="<%=pginsc.elementAt(3)%>">
                </font></td>
              <td width="141"><strong><font color="#990000">*</font> Confirmar 
                documento:</strong></td>
              <td width="224"><b> <font size="2"> 
                <input name="doc_est2" type="text" class="campotext" id="doc_est2" size="18" maxlength="20">
                </font> </b></td>
            </tr>
            <tr> 
              <td width="110"><strong><font color="#990000">*</font> Tipo de documento</strong>:</td>
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
              <td colspan="3"><b><font color="#990000">*</font> Correo electr&oacute;nico: 
                <font size="3"> 
                <input type="text" name="docicfes" maxlength="40" size="40" class="campotext">
                </font> </b></td>
              <td width="224"><font size="3">Tel&eacute;fono: <b><font size="2"> 
                <input name="telefono" type="text" class="campotext" id="telefono" size="14" maxlength="14">
                </font></b></font></td>
            </tr>
            <%if(tipo.equals("T")){%>
            <tr> 
              <td colspan="4"><strong></strong></td>
            </tr>
            <%}%>
            <tr> 
              <td colspan="4"> 
                <hr size="2">
              </td>
            </tr>
            <tr> 
              <td colspan="4"><strong>INFORMACION DEL COLEGIO</strong></td>
            </tr>
            <tr> 
              <td colspan="4"><b><font color="#990000">*</font>Nombre : <font size="3"> 
                <input type="text" name="nomempre" maxlength="50" size="50" class="campotext">
                </font></b></td>
            </tr>
            <tr> 
              <td width="110"><font color="#990000">*</font> <strong>Calendario</strong></td>
              <td > 
                <select name="calendario" class="campotext" id="calendario">
                  <option value="null" selected>Seleccione</option>
                  <option value="A">A</option>
                  <option value="B">B</option>
                  <option value="C">C</option>
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="4"><strong><font color="#990000">*</font> Direcci&oacute;n 
                : 
                <input name="campo13" type="text" class="campotext" id="campo13" size="50" maxlength="35">
                </strong></td>
            </tr>
            <tr> 
              <td width="110"><strong><font color="#990000">*</font> Ciudad:</strong></td>
              <td colspan="3"> 
                <select name="campo14" class="campotext" id="campo14">
                  <option value="null" selected>Seleccione</option>
                  <%
                                                for(i=0;i<ciud.size();i++){
                                                    detciud = (Vector)ciud.elementAt(i);
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
              <td width="110"><strong><font color="#990000">*</font> Tel&eacute;fono: 
                </strong></td>
              <td width="178"> 
                <input name="campo16" type="text" class="campotext" id="campo16" maxlength="15">
              </td>
              <td width="141"><strong><font color="#990000">*</font>Celular: </strong></td>
              <td width="224"> 
                <input name="celular" type="text" class="campotext" id="celular" value="<%=pginsc.elementAt(10)%>" maxlength="10">
              </td>
            </tr>
            <tr> 
              <td width="110"><strong> Correo electr&oacute;nico institucional 
                </strong></td>
              <td width="178"> 
                <input name="campo17" type="text" class="campotext" id="campo17" value="<%=pginsc.elementAt(5)%>" maxlength="30">
              </td>
              <td width="141">&nbsp;</td>
              <td width="224">&nbsp; </td>
            </tr>
            <tr> 
              <td colspan="4"> 
                <hr size="2">
              </td>
            </tr>
            <tr> 
              <td colspan="4"><strong>Seleccione el tipo de v&iacute;nculo con 
                el colegio: </strong></td>
            </tr>
            <tr> 
              <td colspan="2"> 
                <p>Estudiante : 
                  <input type="radio" name="vinculo" value="EST">
                </p>
              </td>
              <td>Empleado: 
                <input type="radio" name="vinculo" value="EMP">
              </td>
              <td>Otro:Cu&aacute;l? 
                <input name="vinculo" type="text" class="campotext" id="vinculo" maxlength="25">
              </td>
            </tr>
            <tr> 
              <td colspan="2" height="42"> 
                <p><font color="#990000">*</font> Fecha de grado:</p>
                <p align="center"> Mes 
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
              <td colspan="2" height="42">Obtuvo validaci&oacute;n del bachillerato 
                con el ICFES? 
                <select name="campo21" class="campotext" id="campo21">
                  <option value="N" selected>No 
                  <option value="S">Si 
                </select>
              </td>
            </tr>
            <%if(tipo.equals("T")){%>
            <%
                                    }
                                    %>
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
              <td colspan="4">Grado:</td>
            </tr>
            <tr> 
              <td colspan="4">Cargo espec&iacute;fico: 
                <input name="cargo" type="text" class="campotext" size="40" maxlength="40">
              </td>
            </tr>
            <!-- <tr> 
              <td colspan="4">Total ingresos año anterior $ 
                <input name="campo65" type="text" class="campotext" size="15" maxlength="9" id="campo65">
                <strong>(Sin puntos ni comas) </strong> </td>
            </tr>-->
            <tr> 
              <td colspan="4"> Area : 
                <input name="area" type="text" class="campotext" size="40" maxlength="40">
              </td>
            </tr>
            <!--   <tr> 
              <td colspan="4">Total ingresos año anterior $ 
                <input name="campo82" type="text" id="campo82" class="campotext" size="15" maxlength="9">
                <strong>(Sin puntos ni comas) </strong></td>
            </tr>-->
            <tr> 
              <td colspan="4"> 
                <hr size="2">
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
                  <input name="bi" type="submit" class="boton" value="Enviar Solicitud de Admisión" onClick="javascript: return validar();">
                </div>
              </td>
            </tr>
            <tr> 
              <td colspan="4">&nbsp;</td>
            </tr>
          </table>
                            </form>
                        </div>
                    
    </td>
            </tr>
        </table>
    </body>
</html>
<%
}else
    response.sendRedirect("ErrorPago");
%>
