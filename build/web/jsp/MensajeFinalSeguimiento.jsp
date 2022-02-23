<%
    String ref, apellido1, apellido2, nom, doc, prog;
    apellido1 = request.getParameter("apellido1");
    apellido2 = request.getParameter("apellido2");
    nom = request.getParameter("nombre");
    doc = request.getParameter("doc");
    ref = request.getParameter("ref");
    prog = request.getParameter("prog");
    configeci.configuracion confEci = new configeci.configuracion();
%>

<html>
    <head>
        <title>Información de Pago de Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
        <script language="JavaScript" type="text/JavaScript">


            <!--
            function impresion(){
            document.getElementById("tablaboton").style.visibility='hidden';
            window.print();

            }
            --> </script>
    </head>

    <body>
       
        <jsp:include page="encabezadoP"> 
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="3. SOLICITUD DE NUMERO DE REFERENCIA PARA HACER LA INSCRIPCION" />
        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <p>&nbsp;</p>
                    <p><i>ESTIMADO(A) ASPIRANTE <%=(nom+" "+apellido1+" "+apellido2)%></i></p>
                    <p><b><i>SU NUMERO DE REFERENCIA ES: <%=ref%></i></b></p>
                    <p><b><i>POR FAVOR TOME NOTA DE ESTE NUMERO PORQUE ES UN REQUERIMIENTO PARA CONTINUAR CON SU PROCESO</i></b></p>
                    <p><i>Recuerde diligenciar su 
                                formulario para terminar el proceso de inscripci&oacute;n.</i></p>
                    <p><b><i>Si tiene inquietudes por favor comun&iacute;quese al tel&eacute;fono 
                                6683600 opción 2 en el menú.</i></b></p>

                    <br>
                    <div class="row">    
                        <div class="col-xs-5 col-md-2">			                		
                            <div class="form-group">
                                <small></small>
                            </div>
                        </div>
                        <input name="Salir" class="boton1"  type="submit" id="" value="Regresar" onClick="location.href = 'https://www.escuelaing.edu.co/es/programas/admisiones/pregrado?id=6&itemId=31'; ">
                    </div>

                    <p></div> </div> </div> </p>

</body>
</html>
<!--%
    sesion = request.getSession(false) ;
    sesion.invalidate() ;
%-->
