<%-- 
    Document   : validareclasifica
    Created on : 22/09/2009, 04:01:49 PM
    Author     : lrodriguez
--%>

<%@page contentType="text/html"%>
<%
        configeci.configuracion confEci = new configeci.configuracion();
        String docEst = request.getParameter("docEst");
        String idprog = request.getParameter("idprog");

//out.println(impre);
%>
<html>
    <head><title>SOLICITAR RECLASIFICACION</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE RECLASIFICACION" />
        </jsp:include>
        <table width="640" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
            <tr>
                <td><p>Para realizar la solicitud de reclasificación, por favor registre el n&uacute;mero
                de carnet.</p></td>
            </tr>
        </table>
        <form method="POST" action="Reclasificacion">
            <input type="hidden" name="docEst" value="<%=docEst%>">
            <input type="hidden" name="idprog" value="<%=idprog%>">
            <table border="0" align="center" cellpadding="0" cellspacing="2" width="50%" class="textocom">
                <tr  bgcolor="#F3F3F3">
                    <td  bgcolor="#F3F3F3" width="50%" height="39">
                        <p align="right"><strong>Carnet <br>
                        &nbsp; </strong>
                    </td>
                 <td  bgcolor="#F3F3F3" width="50%" height="39"><strong>
                            <input name="idEst" type="text" class="campotext" size="15" maxlength="15">
                    </strong></td>
                </tr>
                <!--<tr  bgcolor="#F3F3F3">
                    <td  bgcolor="#F3F3F3" width="50%">
                        <p align="right"><strong>Password&nbsp; <br>
                        </strong>
                    </td>
                    <td  bgcolor="#F3F3F3" width="50%"><strong>
                            <input name="clave" type="password" class="campotext" size="15" maxlength="20">
                    </strong></td>
                </tr>-->
            </table>
            <div align="center"><center><p><input type="submit" value="Enviar" name="B1" class="boton"></p>
            </center></div>
        </form>
        <jsp:include page="piepag">
            <jsp:param name="parametro" value="" />
        </jsp:include>
    </body>
</html>