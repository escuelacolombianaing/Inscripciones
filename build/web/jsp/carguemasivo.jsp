<%-- 
    Document   : carguemasivo
    Created on : 17/01/2018, 11:46:39 AM
    Author     : lucero.rodriguez
--%>

<%@page import="otros.rutas"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<% eci.adjuntar adjuntar;
    String spath = "correo";
    String ruta = new String();
    //ruta = "/home/shares/icfes";
    ruta=new rutas().valrutaicfes();
    //ruta = "C:/Sun/icfes";
    //  ruta = "//10.1.0.50/tycho";

    adjuntar = new eci.adjuntar("carguemasivo", ruta);%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Cargar archivo icfes</title>
        <script language="JavaScript">
            function validar(formulario, archivo) {
                var b = archivo.split('.');
                if (b[b.length - 1] == 'txt') {
                    var nomar = document.formulario.archivoupload.value;
                    var x = archivo.split('\\');
                    nomar = x[x.length - 1];
                    document.formulario.action = 'FileUploadIcfes';
                    return true;
                }

                else {
                    alert('Error: El archivo debe ser .txt');
                    return false;
                }

            }

            //-->
        </script>
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Cargue Documentos" />
        </jsp:include>
        <table width="850" border="0" align="center" cellspacing="0" class="textocom">
            <tr>
                <td width="120" valign="top" >
                    <div align="center" class="resaltados">Subir Archivos:</div></td>
            <form enctype="multipart/form-data" method="post" name="formulario" action="FileUploadIcfes">

                <td>
                    <table width="100%" border="1" cellspacing="0" bordercolor="#FFD006" >
                        <tr>
                            <td>
                                <p align="left">
                                    <input type="file" size="30" maxlength="300" name="archivoupload" class="campotext">
                                </p>
                                <p>
                                <center>
                                    <input type="submit" name="uploadservlet" value="Adjuntar Archivo"  class="boton" onclick="return validar(this.formulario, this.form.archivoupload.value)">
                                </center>
                                </p>
                            </td>
                        </tr>
                    </table>
                </td>
</form>
</tr>
</table>
</body>
</html>
