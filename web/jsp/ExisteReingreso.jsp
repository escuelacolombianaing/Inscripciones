
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
 
<%
	String acepto = request.getParameter("acepto");
	configeci.configuracion confEci = new configeci.configuracion();
        String impre = request.getParameter("impre");     
%>

<html>
<head><title>Autenticación para Inscripción</title>
<link href="css/comun.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function validar() {
  if(document.formvrp.ref.value == "" || document.formvrp.doc.value == "" || document.formvrp.clave.value == ""){
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
        <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LOS PROGRAMAS ACADÉMICOS DE PREGRADO" />
</jsp:include>
    <form method="POST" action="VerificaSeguimiento">
          <input type="hidden" name="impre" value="<%=impre%>">
  <table border="0" align="center" cellpadding="0" cellspacing="2" width="50%" class="textocom">
    <tr bgcolor="#F3F3F3"> 
      <td  bgcolor="#F3F3F3" width="50%" height="31"> 
        <p align="right"><strong>No.&nbsp;<br>
          Referencia del pago&nbsp; </strong> 
      </td>
      <td  bgcolor="#F3F3F3" width="50%" height="31"><strong> 
        <input type="text" name="ref" size="10" class="campotext">
        </strong></td>
    </tr>
    <tr  bgcolor="#F3F3F3"> 
      <td  bgcolor="#F3F3F3" width="50%" height="39"> 
        <p align="right"><strong>Número&nbsp; <br>
          carné&nbsp; </strong> 
      </td>
      <td  bgcolor="#F3F3F3" width="50%" height="39"><strong> 
        <input type="text" name="idest" size="15" class="campotext">
        </strong></td>
    </tr>
  </table>
  <div align="center"><center><p><input type="submit" value="Enviar" name="B1" class="boton"></p>
  </center></div>
</form>
<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>
</body>
</html>
