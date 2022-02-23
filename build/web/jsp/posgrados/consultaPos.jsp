<%-- 
    Document   : consulta
    Created on : 9/09/2011, 03:23:57 PM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Consulta Número de referencia</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/tablas.css"/>
          <script language="JavaScript" type="text/JavaScript">
               <!--
            function validar() {

                if(document.forms.formegre.doc.value == ""){
                    alert("Por favor ingrese su documento de identificación");
                    document.formegre.doc.style.backgroundColor= '#ffcc00';
                    document.formegre.doc.focus();
                    return false;
                }

            }
    //-->
                </script>
    </head>
    <body>
         <jsp:include page="encabezado">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="Consulta número de referencia" />
        </jsp:include>

<form action="ConsultaRefPos" method="POST" name="formegre" id="formegre">
<input type="hidden" name="id_evento"  value="13">
 <table border="0" cellpadding="0" cellspacing="2" width="50%" align="center" class="textocom">
     <tr  bgcolor="#F3F3F3">
      <td  bgcolor="#F3F3F3" width="50%" height="38">
<div align="right">

             <p><strong><font size="2">Documento Identidad&nbsp; <br>
            (con el que realizó la inscripción. Sin puntos, ni comas, ni guiones):</font></strong>
        </div></td>
      <td  bgcolor="#F3F3F3" width="50%" height="38"><strong>
<input type="text" name="doc" size="15" class="campotext"></strong></td>
    </tr>
 </table>
    <center><p><input type="submit" value="Enviar" name="B1"  class="boton" onClick="javascript: return validar();"></p>
  </center>
</form>

    </body>
</html>