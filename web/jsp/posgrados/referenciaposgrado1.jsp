<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<html>
    <%
    String plan = request.getParameter("plan");
PrintWriter oout = response.getWriter() ;
    configeci.configPosgrados confEci = new configeci.configPosgrados();
    Vector programas = confEci.getActivos();
    BDadmisiones bd= new BDadmisiones();
    
    %>
    <head>
        <title>Solicitud de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <SCRIPT LANGUAGE="JavaScript">
function comprueba( ){

var ind = document.form1.prog.selectedIndex; 
if ( document.forms.form1.prog.options[ind].value == '0') {
		alert("Usted debe seleccionar alg�n programa acad�mico");
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
	alert("Falta la informacion telef�nica o el dato no es num�rico");
    return false;
}

if ( document.forms.form1.ciudad.value == '') {
		alert("Usted debe proporcionar la ciudad de donde es el n�mero telef�nico.");
		return false;
} 

if ( isNaN(document.forms.form1.doc.value ) || (document.forms.form1.doc.value == '')) {
	alert("El documento de identidad no puede estar en blanco y debe ser dato num�rico");
    return false;
}

if ( document.forms.form1.numreg.value == '') {
		alert("El T�tulo Profesional no puede estar en blanco");
		return false;
} 

return true;
}

function convertSpaces(str) {
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
        
        <script language="JavaScript" type="text/JavaScript">
<!--
function ventanaSecundaria (URL){ 
   window.open(URL,"","width=850,height=750,scrollbars=no,top=100,left=100") 
}
//--> 
        </script> 
    </head>
    
    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Admisiones Posgrado" />
        </jsp:include>
               <table width="680" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr> 
                <td> <fieldset><legend class="textocom"><strong>Solicitud de n&uacute;mero 
                            de referencia de pago para hacer la inscripci&oacute;n a una especializaci&oacute;n </strong>
                        </legend><div align="center">
                            <p align="left" class="textocom">Para inscribirse en alguno de los programas acad&eacute;micos
                                de Posgrado de la Escuela Colombiana de Ingenier&iacute;a Julio Garavito por
                                favor diligencie estos datos b&aacute;sicos, y tome nota del n&uacute;mero
                                de referencia de pago de los derechos de inscripci&oacute;n que el sistema
                                le indicar&aacute; una 
                            vez los haya enviado.</p>
                            <p align="left" class="textocom">Unicamente aparecer&aacute;n disponibles los programas de
                                Especializaci&oacute;n que a la fecha tengan inscripciones abiertas. Cualquier
                                solicitud extempor&aacute;nea 
                                deber&aacute;  ser consultada con el Director de la Especializaci&oacute;n
                            correspondiente. <a href="javascript:ventanaSecundaria('http://www.escuelaing.edu.co/admisiones/contactos.htm')">Contacto</a></p>
                            <p align="center" class="textocom">
                            Los campos marcados con un asterisco (<b><font color=#ff0000>*</font></b>) 
                            son campos obligatorios 
                            <form action="CapturaRefPosgrado" method="post" onSubmit="return comprueba( );" name="form1" id="form1">
                                
          <table width="675" class="textocom" border="0">
            <tr> 
              <td height="25"> 
                <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Programa</b></div>
              </td>
              <td height="25"> 
                <select name="prog" class="campotext" size="1">
                    <%Vector programas = bd.posgrados(plan, oout,per) ;%>
                  <option value="0" selected>Seleccione</option>
                  <%                  for(int i=0; i< programas.size(); i++){
        Vector prog = (Vector)programas.elementAt(i);
                                                %>
                  <option value="<%=prog.elementAt(0)%>"><%=prog.elementAt(1)%></option>
                  <%
                                                }%>
                </select>
              </td>
            </tr>
            <tr> 
              <td> 
                <div align="right"><strong><b><font color="#CC0033">*</font></b>Primer 
                  Apellido del Aspirante</strong></div>
              </td>
              <td><strong> 
                <input type="text" class="campotext" name="apellido1" size="14" maxlength="14">
                </strong></td>
            </tr>
            <tr>
              <td height="22">
                <div align="right"><strong><b><font color="#CC0033">*</font></b>Segundo 
                  Apellido del Aspirante</strong></div>
              </td>
              <td height="22"><strong>
                <input type="text" class="campotext" name="apellido2" size="14" maxlength="14">
                </strong></td>
            </tr>
            <tr> 
              <td> 
                <div align="right"><b><font color="#CC0033">*</font> Nombre completo 
                  del aspirante &nbsp;</b></div>
              </td>
              <td><strong> 
                <input type="text" class="campotext" name="nom" size="28" maxlength="28">
                </strong></td>
            </tr>
            <tr> 
              <td> 
                <div align="right"><strong><font color="#CC0033">*</font> Tel&eacute;fono</strong></div>
              </td>
              <td><strong> 
                <input type="text" class="campotext" name="tel" size="15" maxlength="15">
                </strong> <b>de<strong> 
                <input type="text" class="campotext" name="ciudad" size="15" maxlength="15">
                </strong>(ciudad)</b></td>
            </tr>
            <tr> 
              <td> 
                <div align="right"><strong>Tel&eacute;fono Oficina&nbsp;</strong></div>
              </td>
              <td><strong> 
                <input type="text" class="campotext" name="tel_ofi" size="15" maxlength="15">
                </strong><b>de</b> <strong> 
                <input type="text" class="campotext" name="ciudadofi" size="15" maxlength="15">
                </strong><b>(ciudad)</b></td>
            </tr>
            <tr> 
              <td> 
                <div align="right"><strong>Celular </strong></div>
              </td>
              <td><strong> 
                <input type="text" class="campotext" name="numreg1" size="15" maxlength="15">
                </strong></td>
            </tr>
            <tr> 
              <td> 
                <div align="right"><strong>Direcci&oacute;n&nbsp; Electr&oacute;nica</strong></div>
              </td>
              <td><strong> 
                <input name="ema" type="text" class="campotext" size="50" maxlength="50">
                </strong></td>
            </tr>
            <tr> 
              <td> 
                <div align="right"><strong><font color="#CC0033">*</font> Documento 
                  Identidad&nbsp; <br>
                  (Sin puntos, ni comas ni guiones)&nbsp;</strong></div>
              </td>
              <td><strong> 
                <input type="text" class="campotext" name="doc" size="12" maxlength="12">
                </strong></td>
            </tr>
            <tr> 
              <td> 
                <div align="right"><b><font color="#CC0033">*</font> T&iacute;tulo 
                  Profesional y n&uacute;mero de acta de grado&nbsp;</b></div>
              </td>
              <td><font size="3"> 
                <input type="text" class="campotext" name="numreg" maxlength="50" size="50">
                </font></td>
            </tr>
          </table>
                                <p align="left" class="textocom">Si al momento de hacer su solicitud de admisi&oacute;n 
                                    a&uacute;n no ha obtenido su t&iacute;tulo profesional, comun&iacute;quese 
                                    al tel&eacute;fono 6683600 exts. 274, 263, 101 o al e-mail <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a>, 
                                donde lo orientar&aacute;n al respecto</p>
                                <input type="hidden" name="tipoest" value="P">
                                
                                <p align="center">
                                    <input type="submit" value="Enviar Datos" name="B1"  class="boton">
                                </p>
                            </form>
                        </div>
                </fieldset> </td>
            </tr>
        </table>
    </body>
</html>
