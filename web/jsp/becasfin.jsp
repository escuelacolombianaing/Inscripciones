<html>

<head>
<title>Solicitud de Inscripci�n</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<SCRIPT LANGUAGE="JavaScript">
function comprueba( ){

if ( document.forms.form1.apellidos.value == '') {
		alert("Los apellidos del aspirante no pueden estar en blanco");
		return false;
} 
if ( document.forms.form1.nom.value == '') {
		alert("El nombre del aspirante no puede estar en blanco");
		return false;
} 
if ( document.forms.form1.dircor.value == '') {
		alert("La direcci�n de correspondencia no puede estar en blanco");
		return false;
} 

if ( isNaN(document.forms.form1.tel.value ) || (document.forms.form1.tel.value == '')) {
	alert("Falta la informacion telefonica o el dato no es num�rico");
    return false;
}
if ( document.forms.form1.ciudad.value == '') {
		alert("La informaci�n de ciudad no puede estar en blanco");
		return false;
} 
if ( isNaN(document.forms.form1.doc.value ) || (document.forms.form1.doc.value == '')) {
	alert("El documento de identidad no puede estar en blanco y debe ser dato num�rico");
    return false;
}

if ( document.forms.form1.numreg.value == '') {
		alert("El n�mero de registro ICFES no puede estar en blanco");
		return false;
} 

if (!( document.forms.form1.numreg.value == '')) {
        cadena = "";
	for (i=0;i<5;i++){ 
            CActual = document.forms.form1.numreg.value.charAt(i) 
            cadena=cadena+CActual;
            }
            cadena=cadena.toUpperCase();
        if ((cadena != 'AC200')){
            alert("El n�mero de registro ICFES no es correcto o no es de una version 2000 en adelente");	
            return false;
        }		
  }

if (document.forms.form1.numreg.value.length !=  14) {
     alert("El n�mero de registro ICFES no es correcto, verifique que lo esta digitando bien.");	
     return false;
  }
if ( document.forms.form1.codcol.value == '') {
		alert("La informaci�n de c�digo de colegio no puede estar en blanco");
		return false;
} 

var ind = document.form1.prog.selectedIndex; 
if ( document.forms.form1.prog.options[ind].value == '0') {
		alert("Usted debe seleccionar alg�n programa acad�mico");
		return false;
} 

return true;
}

</SCRIPT>


</head>

<body bgcolor="#FFFFFF" text="#000000">
  
<table width="98%" border="0" height="74">
  <tr> 
      
    <td width="11%" height="76"><img src="img/logo.gif" width="83" height="90"></td>
      
    <td width="1%" height="76">&nbsp;</td>
      
    <td width="88%" height="76"> 
      <div align="center">
          
        <p><b><font size="3" color="#CC0000">ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
          JULIO GARAVITO</font></b></p>
        <p><font size="3"><b>CONVOCATORIA BECAS 2009-1</b></font></p>
        </div>
      </td>
    </tr>
  </table>
<p align="center"><b>La convocatoria de Becas 2009-1 ha finalizado.</b></p>
<p align="center"><b>Para cualquier informaci&oacute;n adicional comun�quese al 6683600 opci�n 2 en el men�.</b></p>
<p>&nbsp;</p>
</body>
</html>
