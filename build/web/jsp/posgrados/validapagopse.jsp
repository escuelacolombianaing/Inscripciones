
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%
	configeci.configPosgrados confEci = new configeci.configPosgrados();
%>
<html>
<head><title>Autenticación para Inscripción</title>
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
        <jsp:param name="titulo" value="PAGO DERECHOS DE INSCRIPCIÓN" />
</jsp:include>  
  <table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><p class="textocom">Por favor ingrese 
  el Número de referencia de pago de sus derechos de inscripción, el n&uacute;mero
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
</form>
<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>
</body>
</html>
