<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>


<%
HttpSession sesion;
response.setHeader("Cache-Control","no-cache");
eci.adjuntar adjuntar;

String spath ="correo";
//  String operacion = new String((String)request.getParameter("on"));

if (spath.equals("p"))
    out.println("Error");
else{
    
    adjuntar = new eci.adjuntar("", "C:/Sun/doc_pregrado/20102/sistemas");
   // adjuntar = new eci.adjuntar("concursomecanica", "/usr/local/SUN/mecanica");
    String operacion = request.getParameter("on");
    if(operacion == null)
        operacion = "n";
    else{
        if (operacion.compareTo("ar")==0){
            out.println("entra");
            String[] chElim;
            int lngCh;
            Integer idRec;
            chElim = request.getParameterValues("chElim");
            lngCh = chElim.length;
            for ( int i=0 ; i < lngCh ; i++ ){
                if (chElim[i].compareTo("null")!= 0){
                    adjuntar.rmArchivo( (String)chElim[i]);
                }
                
            }%>

<html>
    <head>
        <meta target="principal" http-equiv="Refresh" content="0; url=Mecanica?on=n&spath=spath">
        <style type="text/css">
            
            
        </style>
        <link href="../estilos.css" rel="stylesheet" type="text/css">
    </head>
</html>

<%
        }else{
%>
<html>
    <head>
        <title>Formulario de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="JavaScript">  
<!--


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



function ValidarMod(){  
var max = document.fmArchivos.chElim.length  
var j = 0  
    for ( i=0 ; i<max ; i++ ){  
            if  (document.fmArchivos.chElim[i].checked == true)  
                    j++ ;  
    }  
    if ( j = 0 ){  
            alert("Para modificar tiene que seleccionar un recurso")  
    }else if ( j > 1 ){  
            alert("Solo puede seleccionar un campo")  
    }else{  
            document.action = 'LA OTRA ACCION'  
            document.submit()  
    }	  
}  


function ValidarChk(temp){  
    var max = document.fmArchivos.chElim.length  
    var vall = false
    for ( i=0 ; i<max ; i++ ){  
            if  (document.fmArchivos.chElim[i].checked == true)  
                    vall =true  
    }  
    if(temp == 1){
        vall = true
    }
    if (vall == true)  
            document.fmArchivos.submit()  
    else  
            alert ("Para eliminar tiene que seleccionar algun recurso")  
}  

function chkAll(){  
    var max = document.fmArchivos.chElim.length  
    var vall   
    if (document.fmArchivos.chAll.checked == true)  
            vall = true  
    else  
            vall = false	  
    for ( i=0 ; i<max ; i++ ){  
            document.fmArchivos.chElim[i].checked = vall  
    }  
}  


function chkUn(){  
    var max = document.fmArchivos.chElim.length  
    var vall = true  
    if (document.fmArchivos.chAll.checked == true)  
            document.fmArchivos.chAll.checked = false  
    for ( i=0 ; i<max ; i++ ){  
            vall = vall && document.fmArchivos.chElim[i].checked  
    }  
    if (vall == true)  
            document.fmArchivos.chAll.checked = true  
}  



    function validar(){
	
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
  
   if ( !document.forminsc.grado[0].checked && !document.forminsc.grado[1].checked && !document.forminsc.grado[2].checked) {
			alert("Debe seleccionar el grado.");
                        document.forminsc.grado[0].style.backgroundColor= '#ffcc00';
			return false;
	} 
        
         if ( !document.forminsc.categoria[0].checked && !document.forminsc.categoria[1].checked) {
			alert("Debe seleccionar la categoria a la cual se va a inscribir .");
                        document.forminsc.categoria[0].style.backgroundColor= '#ffcc00';
			return false;
	} 
    
    
		document.forminsc.action = "enviarCorreoEst";
		return true;	
	}
    

    function adjuntar(){
            document.forminsc.action = "Backup";
            //window.open("", "ventanaImpreNotas", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            ///document.formulario.submit();
    }


    
    
//-->
        </script>  
    </head> 
    <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
    <link href="css/comun.css" rel="stylesheet" type="text/css">
    
    
    <body background="img/fondo2.gif">
        
        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
        <tr>
        
        <td align="center" bgcolor="#FFF0B3"> <fieldset><legend class="textocom"></legend> 
        </fieldset>
        
        <table width="740" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td colspan="3"><div align="center"><img src="img/cabezote1.jpg" width="740" height="85"></div></td>
            </tr>
            <tr>
                <td width="14" rowspan="2" background="img/izquierda1.jpg"><div align="center"></div></td>
                <td bgcolor="#FFFFFF">&nbsp;</td>
                <td width="14" rowspan="2" background="img/dercha1.jpg">&nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#FFFFFF"><div align="center">
                        <table width="85%" border="0" cellpadding="7" cellspacing="0" >
                            <tr>
                                <td><div align="center"><span class="titulos"><b><font size="2">Por favor adjunte el archivo correspondiente a la propuesta, haciendo clik en el bot&oacute;n adjuntar archivo; luego ingrese los datos correspondientes al formulario y haga click en enviar correo, para que sus datos puedan ser enviados correctamente.</font></b></span></div></td>
                            </tr>
                        </table>
                        <% 
                        if(operacion.equals("n")){
                            int i = 0;
                        %>
                        <table width="550" border="0" align="center" cellspacing="0" class="textocom">
                            <tr>
                                <td width="120" valign="top">
                                <div align="right" class="resaltados"><strong>Archivos Subidos:</strong></div></td>
                                <td>
                                    <form name="fmArchivos" method="post" action="Mecanica?on=ar&spath=correo">
                                        <table width="100%" border=1 cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFD006" class="textocom">
                                            <tr>
                                                <td width="10%" bgcolor="#EABB00">
                                                    <div align=center>
                                                        <input type="checkbox" name="chAll" onClick="chkAll()">
                                                </div></td>
                                                <td width="50%" bgcolor="#EABB00" class="titulos">
                                                <div align=center><b>Nombre</b></div></td>
                                                <td width="20%" bgcolor="#EABB00" class="titulos">
                                                <div align="center"><strong>Tama&ntilde;o</strong></div></td>
                                                <td width="20%" bgcolor="#EABB00" class="titulos">
                                                <div align="center"><strong>Fecha</strong></div></td>
                                            </tr>
                                            <%
                                            for (i=0 ; i < adjuntar.nArchivos() ; i++ ){
                                DateFormat dateFormatter = DateFormat.getDateInstance(DateFormat.MEDIUM);
                                Date fec = new Date(adjuntar.fecArchivo(i));
                                            %>
                                            <tr>
                                                <td width="10%" bgcolor="#EABB00">
                                                    <div align="center">
                                                        <input type="checkbox" name="chElim" onClick="chkUn()" value = "<%=adjuntar.nomArchivo(i)%>">
                                                </div></td>
                                                <td>
                                                    <div align="center"> </div>
                                                <div align="center"><%=adjuntar.nomArchivo(i)%> </div></td>
                                                <td width="20%">
                                                <div align="center"><%=adjuntar.tamarchH(i)%> </div></td>
                                                <td width="20%">
                                                <div align="center"><%=dateFormatter.format(fec)%></div></td>
                                            </tr>
                                            <%          }
                                            %>
                                            <tr>
                                                <td bgcolor="#EABB00">
                                                <div align="right" class="resaltados"><strong>Tama&ntilde;o total: </strong></div></td>
                                                <td>
                                                <div align="center"><strong><%=adjuntar.tamtotH()%></strong></div></td>
                                                <td width="20%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <div align="left">
                                                        <input type="button" name="eliminar" value="Eliminar" onClick="ValidarChk(<%=i%>)"  class="boton">
                                                    </div>
                                                <div align="center"> </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                <div align="left"></div></td>
                                            </tr>
                                        </table>
                                    </form>
                                    <table width="550" border="0" align="center" cellspacing="0" class="textocom">
                                        <tr>
                                            <td width="120" valign="top" bgcolor="#D9AD00">
                                            <div align="left" class="resaltados">Adjuntar Archivos:</div></td>
                                            <form enctype="multipart/form-data" method="post" action="FileUpload?on=n&spath=correo&fpath=C:/Sun/doc_pregrado/20102/sistemas&doc=52331389&ref=1021009">
                                                <input name="spath" type="hidden" id="spath3" value="correo">
                                                <td>
                                                    <table width="100%" border="1" cellspacing="0" bordercolor="#FFD006" bgcolor="#D9AD00">
                                                        <tr>
                                                            <td>
                                                                <p align="left">
                                                                    <input type="file" size="30" maxlength="300" name="file1" class="campotext">
                                                                </p>
                                                                <p>
                                                                    <center>
                                                                        <input type="submit" name="uploadservlet" value="Adjuntar Archivo"  class="boton">
                                                                    </center>
                                                            </p></td>
                                                        </tr>
                                                </table></td>
                                            </form>
                                        </tr>
                                    </table>
                                    <%
                                    }else{
                                    %>
                                    <div align="center" class="textocom"><strong class="titulos">Ha ocurrido un error al subir el archivo: </strong> <br>
                                        <span class="contenidos">- Recuerde que el tama&ntilde;o del archivo no debe ser superior a 50 Mb<br>
                                            - Compruebe la ruta de la cual esta tomando el archivo<br>
                                            - Evite las rutas largas<br>
                                            - <em><font color="#990000" size="1"><%=operacion%></font></em><br>
                                    <a href="Mecanica?on=n&spath=<%=spath%>">Volver</a></span></div>
                                    <%
                                    }
                                    %>
                                    <form action="" method="post" name="forminsc" id="forminsc">
                                        <table width="95%" border="1" cellpadding="3" cellspacing="0" bordercolor="#FFCC00">
                                            <tr bgcolor="#FFF0B3" class="resaltados">
                                                <td colspan="4" bgcolor="#FFCC00">Nombres:</td>
                                                <td width="26%"><b><font size="2">
                                                            <input name="nombres" type="text" class="campotext" id="nombres3" size="20" maxlength="20">
                                                </font></b></td>
                                                <td width="14%" bgcolor="#FFCC00">Apellidos</td>
                                                <td width="22%"><b><font size="2">
                                                            <input name="apellidos" type="text" class="campotext" id="apellidos3" size="20" maxlength="20">
                                                </font></b></td>
                                            </tr>
                                            <tr bgcolor="#FFF0B3" class="resaltados">
                                                <td colspan="4">Documento de Identidad</td>
                                                <td width="26%"><b><font size="2">
                                                            <input name="doc" type="text" class="campotext" id="doc4" size="18" maxlength="20">
                                                </font></b></td>
                                                <td width="14%">Confirmar Documento</td>
                                                <td width="22%"><b><font size="2">
                                                            <input name="doc2" type="text" class="campotext" id="doc23" size="20" maxlength="20">
                                                </font></b></td>
                                            </tr>
                                            <tr bgcolor="#FFF0B3" class="resaltados">
                                                <td height="31" colspan="4">Edad</td>
                                                <td width="26%" height="5"><b><font size="2">
                                                            <input name="edad" type="text" class="campotext" id="edad3" size="3" maxlength="3">
                                                </font></b></td>
                                                <td width="14%" height="31">Tel&eacute;fono</td>
                                                <td width="22%" height="31"><b><font size="2">
                                                            <input name="tel" type="text" class="campotext" id="tel3" size="12" maxlength="12">
                                                </font></b></td>
                                            </tr>
                                            <tr bgcolor="#FFF0B3" class="resaltados">
                                                <td colspan="5">Colegio: <b><font size="2">
                                                            <input name="colegio" type="text" class="campotext" id="colegio3" size="40" maxlength="40">
                                                </font></b></td>
                                                <td colspan="2"><b><font size="2"> </font></b></td>
                                            </tr>
                                            <tr bgcolor="#FFF0B3" class="resaltados">
                                                <td colspan="7">
                                                    
                                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                                        <tr class="resaltados"> 
                                                            <td width="27%">Nivel Acad&eacute;mico</td>
                                                            <td width="20%">D&eacute;cimo: 
                                                                <input type="radio" name="grado"   value="10">
                                                            </td>
                                                            <td width="18%">Once: 
                                                                <input type="radio" name="grado"  value="11">
                                                            </td>
                                                            <td width="35%">Universitario: 
                                                                <input type="radio" name="grado"  value="U">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr bgcolor="#FFF0B3" class="resaltados">
                                                <td colspan="7">Correo electr&oacute;nico: <b><font size="2">
                                                            <input name="correo" type="text" class="campotext" id="correo2"30" maxlength="30">
                                                       </font></b></td>
                                            </tr>
                                            <tr bgcolor="#FFF0B3" class="resaltados">
                                                <td colspan="7">
                                                    <table width="100%" border="0" cellpadding="2" cellspacing="0">
                                                        <tr class="resaltados">
                                                            <td width="8%">Categor&iacute;a</td>
                                                            <td width="15%">B&aacute;sica:
                                                                <input type="radio" name="categoria"   value="B">
                                                            </td>
                                                            <td width="17%">Avanzada:
                                                                <input type="radio" name="categoria"  value="A">
                                                            </td>
                                                        </tr>
                                                </table></td>
                                            </tr>
                                            <tr bgcolor="#FFF0B3" class="resaltados">
                                                <td colspan="7">
                                                    <div align="center">
                                                        <input name="bi" type="submit" class="boton" id="bi3" value="Enviar Correo" onClick="javascript: return validar();">
                                                </div></td>
                                            </tr>
                                        </table>
                                </form></td>
                            </tr>
                        </table>
                </div></td>
            </tr>
            <tr>
                <td colspan="3"><div align="center"><img src="img/abajo1.jpg" width="740" height="34"></div></td>
            </tr>
        </table>
    </body> 
</html> 
<%
}
}
}
%>
