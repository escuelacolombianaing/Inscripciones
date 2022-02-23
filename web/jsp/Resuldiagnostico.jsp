<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Resultados exámen de Diagnóstico </title>
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
         <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="EXAMEN DE DIAGNOSTICO" />
        </jsp:include>
  <!--   <table width="440" border="1" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <form name="form1" method="post" action="Resultados">
                        <table align="center" border="0" cellpadding="0" cellspacing="2" width="292" height="98" class="textocom">
                            <tr>
                                <td align=left height="53" width="45%">
                                    <div align="right"><strong>Documento
                                    de Identidad </strong></div>
                                </td>
                                <td align=left width="9%">&nbsp;</td>
                                <td align=left height="53" width="46%">
                                    <div align="left">
                                        <input name="documento" type="password" maxlength="12" size="12" class="campotext">
                                </div></td>
                            </tr>
                            <tr>
                                <td align=left height="39" width="45%">
                                    <div align="right">
                                        <input id="submit1" name="Aceptar"  type="submit" value="Aceptar" title="Aceptar" class="boton" tabindex="Yes">
                                </div></td>
                                <td width="9%" height="39" align=left>&nbsp;</td>
                                <td width="46%" height="39" align=left>
                                    <div align="left">
                                        <input id="submit1" name="Limpiar" type="reset" value="Limpiar" title="Limpiar" class="boton">
                                </div></td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>-->
        <p>
       <center> Las recomendaciones según el exámen de diagnóstico para el periodo 2010-1 ya no se encuentran disponibles.</center>
    </body>
</html>
