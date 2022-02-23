<%-- 
    Document   : consultacorreo
    Created on : 14/06/2017, 11:57:10 AM
    Author     : lucero.rodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Consulta Correo</title>
     
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
            <jsp:param name="titulo" value="Consulta correo" />
        </jsp:include>
        <div align="center">
		   <form name="form1" method="post" action="CorreoNuevos">
        <p>&nbsp;</p><table width="443" border="0" align="center">
            <tr> 
                
        <td width="156"> 
          <p>Documento de identidad:<br>
            (Sin puntos ni comas)</p>
          </td>
          
                
        <td width="277"> 
          <input type="text" name="documento" maxlength="12">

                        </td>
                        </tr>
                        <tr> 
                            <td colspan="2">

                                <div align="center">
                                    
            <p>&nbsp;</p>
            <p>
              <input type="submit" name="Submit" value="Enviar">
            </p>
          </div>  
                </td>
            </tr>
        </table>
		</form>
		</div>
    </body>
</html>