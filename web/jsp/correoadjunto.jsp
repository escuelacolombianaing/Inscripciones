<!%@ include file="../secure.jsp" %>
<%@ page import="javax.naming.*, 
                 javax.rmi.PortableRemoteObject, 
                 java.text.*,
                 java.util.*"%>

<%
    HttpSession sesion;
    response.setHeader("Cache-Control","no-cache"); 
   // login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness)session.getAttribute("empleado");
 //   inicio.conectaEJB conEjb = new inicio.conectaEJB();
   // BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    String setPath= ("correo");
    //Vector asignaturas = profesor.getAsignaturas(empleado.getPerHorario(), empleado.getIdProf());
  //  eci.BackupAdmin lista = new eci.BackupAdmin(usuario, empleado.getPath());
    otros.enviarMail enviar = new otros.enviarMail();
    String texto;
    if(texto == null)
        texto = "";
%>
<html> 
<head>
<title>Archivo adjunto</title> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"> 
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head> 
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
<!--
    function validar(){
	if(document.getElementById("asunto").value == ""){
		alert("Ingrese por favor el Asunto del correo");
		return false;
	}else if(document.getElementById("paragrupo").value == "null"){
		alert("Seleccione el curso al cual desea enviar el correo");
		return false;
	}
	else{
		document.formulario.action = "enviarCorreoEst";
		return true;	
	}
    }

    function adjuntar(){
            document.formulario.action = "Backup";
            //window.open("", "ventanaImpreNotas", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            ///document.formulario.submit();
    }
-->
</script>
<body background="img/fondo.gif" onLoad="preloadImg();MM_preloadImages('img/atachmenta.gif')">
<p class="textocom">&nbsp;</p>
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<!%=empleado.getNomemp()%>" />
	<jsp:param name="doblenc" value="inicio" />
        <jsp:param name="titulo" value="Enviar Correo a estudiantes" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22"> 
    <div align="center"> 
	<form action="" method="post" name="formulario" id="formulario">
      
      <input name="on" type="hidden" id="on" value="n">
      <input name="spath" type="hidden" id="spath" value="correo">
      <input name="anterior" type="hidden" id="anterior" value="CorreoAdjunto">
        <table width="550" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom"> 
                       
              <tr valign="middle">
                <td height="50" colspan="2"><div align="center">
                    
                    <input type="submit" name="adjSubmit" value="Adjuntar" onClick="javascript: return adjuntar();" class="boton">
                  <p><!--a href="Backup?on=n&spath=correo&anterior=EnviarCorreoEstud&texto=<%=texto%>" onMouseOver="MM_swapImage('ImageAta','','img/atachmenta.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="img/atachment.gif" name="ImageAta" width="100" height="25" border="0" id="ImageAta"></a--></p>
                  </div></td>
              </tr>
              
              <tr>
                <td height="30" valign="top"><div align="right"><strong>Archivos&nbsp;&nbsp;&nbsp;<br>Adjuntos:&nbsp;&nbsp;&nbsp;</strong></div></td>
                <td height="30" valign="top">
                <%
      for (int i=0 ; i < lista.nArchivos() ; i++ ){
%>
            &nbsp;<%=lista.nomArchivo(i)%> - <%=lista.tamarch(i)%> Kb<br>      <%
      }
%>
                </td>
              </tr>
              <tr align="center" valign="middle">
                <td colspan="2" valign="middle"><div align="center">
                    <p>
					<input name="userimpre" type="hidden" id="userimpre" value="<!%=empleado.getUsrname()%>">
					<input name="bi" type="submit" class="boton" id="bi" value="Enviar Correo" onClick="javascript: return validar();">
                  </p>
                </div></td>
              </tr>
        </table> 
		</form>
      </div>
    </td>
  </tr>
  <tr class="textocom">
    <td height="22">
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="Menu" />
	    </jsp:include>
      </div>
	</td>
  </tr>
</table>
</body> 
</html> 