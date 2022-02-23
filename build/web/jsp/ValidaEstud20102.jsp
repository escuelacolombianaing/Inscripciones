<%-- 
    Document   : ValidaEstud
    Created on : 16/03/2010, 03:26:51 PM
    Author     : lrodriguez
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>

<%

	configeci.configuracion confEci = new configeci.configuracion();
%>
<html>
<head><title>Autenticación para cargar documentos</title>
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
        <jsp:param name="titulo" value="DOCUMENTACION PROCEDIMIENTO" />
</jsp:include>

  <table width="640" border="0" align="center" cellpadding="0" cellspacing="0" class="textoimpre">
    
  <tr> 
    <td> 
      <p ><b>1. Aseg&uacute;rese de tener los documentos completos.</b></p>
      <p class="textocom"><b>2. Escanee todos los documentos en un s&oacute;lo 
        archivo con extensi&oacute;n pdf en escala de grises en el siguiente orden:</b></p>
      <p class="textocom"><b>PARA INSCRIPCI&Oacute;N:</b></p>
      <ul>
        <li>Recibo de Pago de Inscripci&oacute;n</li>
        <li>Formulario de Inscripci&oacute;n impreso con foto</li>
        <li>Carta de presentaci&oacute;n firmada por el acudiente y el aspirante</li>
        <li>Fotocopia del documento de identidad por ambas caras</li>
        <li>Certificaci&oacute;n o &uacute;ltimo recibo de pago de pensi&oacute;n 
          del colegio.</li>
        <li>Fotocopia del &uacute;ltimo recibo p&uacute;blico de la luz</li>
        <li>Documentos de ingresos del padre (si es su caso)</li>
        <li>Documentos de ingresos de la madre (si es su caso)</li>
        <li>Documentos de ingresos del tercero (si es su caso)</li>
      </ul>
      <p><b>PARA MATR&Iacute;CULA</b></p>
      <ul>
        <li>Orden de matr&iacute;cula cancelada</li>
        <li>Fotocopia de la c&eacute;dula de ciudadan&iacute;a</li>
        <li>Copia del Diploma de Grado de Bachiller con registro de folio o n&uacute;mero 
          de acta, debidamente firmada por el Rector y Secretario del Colegio</li>
      </ul>
      <p>&nbsp;</p>
      <p>Si desea consultar la documentaci&oacute;n requerida haga click <A HREF="http://www.escuelaing.edu.co/admisiones/2010/primer_documentos.htm">AQUI</A></p>
      <p><b>3. Cuando tenga listo el archivo, por favor registre el n&uacute;mero 
        de Documento de Identidad con el que realizó su inscripción para cargar 
        el mismo.</b></p>
      <p class="textocom">&nbsp;</p>
    </td>
    </tr>
</table>
<form action="Documentacion?on=n&spath=spath" method="POST" name="formvrp" id="formvrp">
  <table border="0" cellpadding="0" cellspacing="2" width="50%" align="center" class="textocom">
   <!-- <tr bgcolor="#F3F3F3">
      <td  bgcolor="#F3F3F3" width="50%"><div align="right"><p><strong>No.&nbsp;<BR> Referencia&nbsp; </strong></div></td>
      <td  bgcolor="#F3F3F3" width="50%"><strong><input type="text" name="ref" size="10" class="campotext"></strong></td>
    </tr>-->
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
