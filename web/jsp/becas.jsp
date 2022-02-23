<html>

<head>
<title>Convocatoria Becas Julio Garavito Armero</title>
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
		alert("La dirección de correspondencia no puede estar en blanco");
		return false;
} 

if ( isNaN(document.forms.form1.tel.value ) || (document.forms.form1.tel.value == '')) {
	alert("Falta la informacion telefonica o el dato no es numérico");
    return false;
}
if ( document.forms.form1.ciudad.value == '') {
		alert("La información de ciudad no puede estar en blanco");
		return false;
} 
if ( isNaN(document.forms.form1.doc.value ) || (document.forms.form1.doc.value == '')) {
	alert("El documento de identidad no puede estar en blanco y debe ser dato numérico");
    return false;
}

if ( document.forms.form1.numreg.value == '') {
		alert("El número de registro ICFES no puede estar en blanco");
		return false;
} 

if (!( document.forms.form1.numreg.value == '')) {
        cadena = "";
	for (i=0;i<4;i++){
            CActual = document.forms.form1.numreg.value.charAt(i) 
            cadena=cadena+CActual;
            }
            cadena=cadena.toUpperCase();
        if ((cadena != 'AC20')){
            alert("El número de registro ICFES no es correcto o no es de una version 2000 en adelente");	
            return false;
        }		
  }

if (document.forms.form1.numreg.value.length !=  14) {
     alert("El número de registro ICFES no es correcto, verifique que lo esta digitando bien.");	
     return false;
  }
if ( document.forms.form1.codcol.value == '') {
		alert("La información de código de colegio no puede estar en blanco");
		return false;
} 

var ind = document.form1.prog.selectedIndex; 
if ( document.forms.form1.prog.options[ind].value == '0') {
		alert("Usted debe seleccionar algún programa académico");
		return false;
} 

if ( document.forms.form1.justi.value == '') {
		alert("Usted debe enunciar las razones por las cuales desea ingresar al programa elegido");
		return false;
}

return true;
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
        <p><font size="3"><b>CONVOCATORIA BECAS 2008-2</b></font></p>
        </div>
      </td>
    </tr>
  </table>

<p>La Escuela se reserva el derecho de verificar la informaci&oacute;n suministrada 
  por usted, por lo tanto para evitar incurrir en falsedad en documento p&uacute;blico, 
  el cual es investigado por la Fiscal&iacute;a General de la Naci&oacute;n y 
  es sancionado con pena privativa de la libertad, aseg&uacute;rese de registrar 
  correctamente el n&uacute;mero de registro SNP del ex&aacute;men de Estado (ICFES).</p>
<p>Las solicitudes de aspirantes que no cumplan con el requisito m&iacute;nimo 
  de puntajes en las &aacute;reas de inter&eacute;s, ser&aacute;n rechazadas. 
</p>
<form name="form1" method="POST" onSubmit="return comprueba( );" action="Guardabeca">
  <table border="1" cellpadding="0" cellspacing="0" width="95%">
    <tr bgcolor="#F3F3F3"> 
      <td bgcolor="#F3F3F3" width="47%" height="23"> 
        <div align="right"> 
          <p><strong>Apellidos del aspirante&nbsp; </strong> 
        </div>
      </td>
      <td bgcolor="#F3F3F3" width="53%" height="23"><strong> &nbsp; 
        <input type="text" name="apellidos" size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);">
        </strong></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td bgcolor="#F3F3F3" width="47%" height="22"> 
        <div align="right"><b>Nombre completo del aspirante &nbsp;</b></div>
      </td>
      <td bgcolor="#F3F3F3" width="53%" height="22"><strong> &nbsp; 
        <input type="text" name="nom" size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);">
        </strong></td>
    </tr>
    <tr> 
      <td bgcolor="#F3F3F3" width="47%"> 
        <div align="right"><strong>Direcci&oacute;n de correspondencia&nbsp; </strong></div>
      </td>
      <td bgcolor="#F3F3F3" width="53%"><strong> &nbsp; 
        <input type="text" name="dircor" size="40" maxlength="40">
        </strong></td>
    </tr>
    <tr> 
      <td bgcolor="#F3F3F3" width="47%"> 
        <div align="right"> 
          <p><strong>Teléfono&nbsp; </strong> 
        </div>
      </td>
      <td bgcolor="#F3F3F3" width="53%"><strong> &nbsp; 
        <input type="text" name="tel" size="12" maxlength="15">
        </strong></td>
    </tr>
    <tr> 
      <td bgcolor="#F3F3F3" width="47%"> 
        <div align="right"><strong>Ciudad &nbsp; </strong> </div>
      </td>
      <td bgcolor="#F3F3F3" width="53%"><strong> &nbsp; 
        <input type="text" name="ciudad" size="30" maxlength="40" onBlur="this.value = convertTildes(this.value);">
        </strong></td>
    </tr>
    <tr> 
      <td bgcolor="#F3F3F3" width="47%"> 
        <div align="right"> 
          <p><strong>Dirección&nbsp; <br>
            Electrónica&nbsp; </strong> 
        </div>
      </td>
      <td bgcolor="#F3F3F3" width="53%"><strong> &nbsp; 
        <input type="text" name="email" size="50">
        </strong></td>
    </tr>
    <tr> 
      <td bgcolor="#F3F3F3" width="47%"> 
        <div align="right"> 
          <p><strong>Documento Identidad&nbsp; <br>
            (Sin puntos, ni comas ni guiones)&nbsp; </strong> 
        </div>
      </td>
      <td bgcolor="#F3F3F3" width="53%"><strong> &nbsp; 
        <input type="text" name="doc" size="15" maxlength="15">
        </strong></td>
    </tr>
    <tr> 
      <td bgcolor="#F3F3F3" width="47%"> 
        <div align="right"><b>Prueba de Estado ICFES (&uacute;nicamente versi&oacute;n 
          a&ntilde;o 2000 &nbsp;en adelante) N&uacute;mero de registro SNP&nbsp;</b></div>
      </td>
      <td bgcolor="#F3F3F3" width="53%"><font size="3"> &nbsp; 
        <input type="text" name="numreg" maxlength="14" size="15">
        </font></td>
    </tr>
    <tr> 
      <td bgcolor="#F3F3F3" width="47%" height="24"> 
        <div align="right"><b>Código de Colegio (El que aparece en el informe 
          ICFES)</b>&nbsp;</div>
      </td>
      <td bgcolor="#F3F3F3" width="53%" height="24"><font size="3"> &nbsp; 
        <input type="text" name="codcol" size="6" maxlength="6">
        </font></td>
    </tr>
    <input type="hidden" name="tip" value="N">
    <tr> 
      <td bgcolor="#F3F3F3" width="47%" height="24"> 
        <div align="right"><strong>Programa &nbsp; </strong></div>
      </td>
      <td bgcolor="#F3F3F3" width="53%" height="24"> <font size="3"> &nbsp; 
        <select name="prog">
          <option value="0" Selected><font size="3">SELECCIONE</font></option>
          <option value="ECONOMIA"><font size="3">ECONOMIA</font></option>
          <option value="INGENIERIA ELECTRICA"><font size="3">INGENIERIA ELECTRICA</font></option>
           <option value="MATEMÁTICAS"><font size="3">MATEMÁTICAS</font></option>
        </select>
        </font></td>
    </tr>
    <tr> 
      <td bgcolor="#F3F3F3" width="47%" height="23"> 
        <div align="right"><strong>Razones por las cuales desea estudiar el programa 
          elegido &nbsp; </strong></div>
      </td>
      <td bgcolor="#F3F3F3" width="53%" height="23"> <font size="3"> &nbsp; 
        <input type="text" name="justi" size="50" value="" maxlength="1000">
        </font></td>
    </tr>
  </table>
  <div align="center"><center><p><input type="submit" value="Enviar Datos" name="B1"></p>
  </center></div>
</form>
</body>
</html>
