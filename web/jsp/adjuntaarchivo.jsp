<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<html>
    <head>
        <title>Formulario de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        
        <script language="JavaScript" type="text/JavaScript">
<!--
function validar() {
  if(document.forminsc.nombres.value == "" ) {
    alert("Por favor digite el nombre ");
    document.forminsc.nombres.style.backgroundColor= '#ffcc00';
        document.forminsc.nombres.focus();
    return false;
  }
  
  if(document.forminsc.apellidos.value == "" ) {
    alert("Por favor digite los apellidos");
    document.forminsc.apellidos.style.backgroundColor= '#ffcc00';
        document.forminsc.apellidos.focus();
    return false;
  }
  
   if(document.forminsc.doc.value == ""  ) {
    alert("Por favor digite el documento de identidad y confirlmelo");
    document.forminsc.doc.style.backgroundColor= '#ffcc00';
        document.forminsc.doc.focus();
    return false;
  }
  
    if(document.forminsc.doc.value != document.forminsc.doc2.value){
    alert("Los n�meros de documento no concuerdan");
    document.forminsc.doc.style.backgroundColor= '#ffcc00';
    document.forminsc.doc2.style.backgroundColor= '#ffcc00';
    document.forminsc.doc.focus();
    return false;
  }
  
 if(document.forminsc.edad.value == ""  ) {
    alert("Por favor digite la edad");
    document.forminsc.edad.style.backgroundColor= '#ffcc00';
        document.forminsc.edad.focus();
    return false;
  }
  
  if(document.forminsc.tel.value == ""  ) {
    alert("Por favor digite el N�mero telef�nico");
    document.forminsc.tel.style.backgroundColor= '#ffcc00';
        document.forminsc.tel.focus();
    return false;
  }
  
  
  
  if(isNaN(document.forminsc.edad.value )){
			alert("Edad debe ser un n�mero");
                        document.forminsc.edad.style.backgroundColor= '#ffcc00';
                        document.getElementById("edad").focus();
			return false;
	 }
         
             if(isNaN(document.forminsc.tel.value )){
			alert("Tel�fono debe ser un num�rico");
                        document.forminsc.tel.style.backgroundColor= '#ffcc00';
                        document.getElementById("tel").focus();
			return false;
	 }
  
       if(document.forminsc.colegio.value == ""  ) {
    alert("Por favor digite el nombre del colegio");
    document.forminsc.colegio.style.backgroundColor= '#ffcc00';
        document.forminsc.colegio.focus();
    return false;
  }
  
   if ((document.forminsc.correo.value.indexOf ('@', 0) == -1)||(document.forminsc.correo.value.length < 5)) {
    alert("Escriba una direcci�n de correo v�lida en el campo \"Correo electr�nico\".");
    return (false);
  }
  
   if ( !document.forminsc.grado[0].checked && !document.forminsc.grado[1].checked && !document.forminsc.grado[2].checked && !document.forminsc.grado[3].checked && !document.forminsc.grado[4].checked && !document.forminsc.grado[5].checked) {
			alert("Debe seleccionar el grado.");
                        document.forminsc.grado[0].style.backgroundColor= '#ffcc00';
			return false;
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
        <link href="../../estilos.css" rel="stylesheet" type="text/css">
        <style type="text/css">
            <!--
body {
	background-image: url(img/fondo.gif);
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
            -->
    </style></head>
    
    
    <body>
        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
            <tr>
                
                <td bgcolor="#FFF0B3"> <fieldset><legend class="textocom"><img src="img/formulario.jpg" width="750" height="58"></legend> 
                        <div align="center"><form name="form1" enctype="multipart/form-data" method="post" action="mailto:concursomecanica@escuelaing.edu.co">
                                <input type="file" name="file">
                                <input type="submit" name="Submit" value="Enviar">
                            </form> 
                            
                            <table width="95%" border="1" cellpadding="3" cellspacing="0" bordercolor="#FFCC00">
                                <tr bgcolor="#FFF0B3" class="resaltados"> 
                                    <td colspan="7"> 
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <div align="center"> 
                                            <input name="enviar" type="submit" class="boton" value="Enviar" onClick="javascript: return validar();">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            
                        </div>
                    </fieldset>
                </td>
            </tr>
            
        </table>
    </body>
</html>

