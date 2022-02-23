<%-- 
    Document   : MensajeDocumentacion
    Created on : 30/04/2010, 09:26:47 AM
    Author     : lrodriguez
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

<div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-9">
        
                    <p>Su archivo ha sido cargado. Una vez la oficina de admisiones revise sus
                    documentos y los encuentre a satisfacción, quedará formalmente inscrito. En caso de encontrar inconsistencia en los documentos
                    nos comunicaremos con usted para darle la instrucción correspondiente.</p>
                    <p><br>
                    </p>
           
                    <p>No olvide consultar su <a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/Admitidos?prog=AN">
                    RESPUESTA DE ADMISION</a></p>
                    <p>&nbsp;</p>
                    <p align="right"><a href="http://www.escuelaing.edu.co/">SALIR</a></p>
               
                </div>
            </div></div>

    </body>
</html>
