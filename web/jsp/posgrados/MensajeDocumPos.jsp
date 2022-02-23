<%-- 
    Document   : MensajeDocumPos
    Created on : 16/03/2016, 01:49:28 PM
    Author     : Lucero
--%>
<% String nom = request.getParameter("nomestud");%>

<html>
    <head>
        <title>Documentación</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function impresion(){
                document.getElementById("tablaboton").style.visibility='hidden';
                window.print();

            }
            --> </script>
    </head>

    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="DOCUMENTACION PROCESO DE ADMISIONES" />
        </jsp:include>
        <div align="center"> 
        <table width="640" align="center" class="textoimpre">
            <tr>
                <td><center>
                        <p><b><%=nom%></b></p>
                        <p>&nbsp;</p>
            </center></td></tr>
            <tr>
                <td>
                    <p>Su archivo ha sido cargado. Una vez la oficina de admisiones revise sus
                    documentos y los encuentre a satisfacción, quedará formalmente inscrito. En caso de encontrar inconsistencia en los documentos
                    nos comunicaremos con usted para darle la instrucción correspondiente.</p>
                    <p><br>
                          <br>
            <div align="center"><a href="http://www.escuelaing.edu.co"><b>SALIR</b></a> </div>   
                   
            </td></tr>
            <!--<tr> <td>
                    <p>No olvide consultar su <a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/Admitidos?prog=AN">
                    RESPUESTA DE ADMISION</a></p>
                    <p>&nbsp;</p>
                    <p align="right"><a href="http://www.escuelaing.edu.co/">SALIR</a></p>
                </td>

            </tr>-->
        </table>
        </div>
        <div align="center"></div>

    </body>
</html>
