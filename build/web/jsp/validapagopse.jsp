 
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%
	configeci.configuracion confEci = new configeci.configuracion();
%>
<html>
<head><title>Autenticaci�n para Inscripci�n</title>
<link href="css/comun.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function validar() {
  if(document.formvrp.ref.value == "" || document.formvrp.doc.value == ""){
    alert("Los campos no pueden estar vacios");
    return false;
  }
 }
 //-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="PAGO DERECHOS DE INSCRIPCI�N" />
</jsp:include>  
<p></p>
<b>Por problemas t�cnicos no podemos procesar su pago v�a Web, por favor intente ma�ana, o realice el pago en las entidades 
    financieras BANCO ITA�  o Banco de Occidente, o en efectivo, tarjeta d�bito, tarjeta cr�dito,
cheque o mixto directamente en la Caja de la Escuela Colombiana de Ingenier�a.</b>

  <!--<table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><p class="textocom">Por favor ingrese 
  el N�mero de referencia de pago de sus derechos de inscripci�n, el n&uacute;mero
  de Documento de Identidad registrado y finalmente haga click en enviar para
  continuar con el pago.</p></td>
    </tr>
</table>
<form action="PagoenLineaPSE" method="GET" name="formvrp" id="formvrp">
  <table border="0" cellpadding="0" cellspacing="2" width="50%" align="center" class="textocom">
    <tr bgcolor="#F3F3F3">
      <td  bgcolor="#F3F3F3" width="50%"><div align="right"><p><strong>No.&nbsp;<BR> Referencia&nbsp; </strong></div></td>
      <td  bgcolor="#F3F3F3" width="50%"><strong><input type="text" name="nsol" size="10" class="campotext"></strong></td>
    </tr>
    <tr  bgcolor="#F3F3F3">
      <td  bgcolor="#F3F3F3" width="50%" height="38">
<div align="right"><p><strong>Documento Identidad&nbsp; <br>(Sin puntos, ni comas ni guiones)&nbsp; </strong></div></td>
      <td  bgcolor="#F3F3F3" width="50%" height="38"><strong>
<input type="text" name="doc" size="15" class="campotext"></strong></td>
    </tr>
  </table>
  <div align="center"><center><p><input type="submit" value="Enviar" name="B1"  class="boton" onClick="javascript: return validar();"></p>
  </center></div>
</form>-->
<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>
</body>
</html>
