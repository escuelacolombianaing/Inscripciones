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
            -->

        </script>

    </head>

    <body>

        <%if (prog.equals("370")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="INSTRUCCIONES PARA EL PAGO EN EFECTIVO EN BANCO ITAÚ " />
        </jsp:include>
        <%} else {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="INSTRUCCIONES PARA EL PAGO EN EFECTIVO EN BANCO ITAÚ " />
        </jsp:include>
        <% }%>
        <% if (prog.equals("13")) {
                prog = "INGENIERIA CIVIL";
            }
            if (prog.equals("14")) {
                prog = "INGENIERIA ELECTRICA";
            }
            if (prog.equals("15")) {
                prog = "INGENIERIA DE SISTEMAS";
            }
            if (prog.equals("16")) {
                prog = "INGENIERIA INDUSTRIAL";
            }
            if (prog.equals("17")) {
                prog = "INGENIERIA ELECTRONICA";
            }
            if (prog.equals("18")) {
                prog = "ECONOMIA";
            }
            if (prog.equals("19")) {
                prog = "ADMINISTRACIÓN DE EMPRESAS";
            }
            if (prog.equals("20")) {
                prog = "MATEMATICAS";
            }
            if (prog.equals("260")) {
                prog = "INGENIERIA MECANICA";
            }
            if (prog.equals("264")) {
                prog = "INGENIERIA AMBIENTAL";
            }
            if (prog.equals("285")) {
                prog = "PROCESAMIENTO DE POLIMEROS";
            }
            if (prog.equals("370")) {
                prog = "ESPECIALIZACIÓN EN GESTIÓN INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE";
            }
            if (prog.equals("312")) {
                prog = "ESPECIALIZACION EN ESTRUCTURAS";
            }
            if (prog.equals("310")) {
                prog = "ESPECIALIZACION EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
            }
            if (prog.equals("324")) {
                prog = "ESPECIALIZACION EN TELEMATICA APLICADA A NEGOCIOS";
            }
            if (prog.equals("374")) {
                prog = "ESPECIALIZACION EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
            }
            if (prog.equals("320")) {
                prog = "ESPECIALIZACION EN INGENIERIA DE FUNDACIONES";
            }
            if (prog.equals("309")) {
                prog = "ESPECIALIZACION EN SANEAMIENTO AMBIENTAL";
            }
            if (prog.equals("313")) {
                prog = "ESPECIALIZACION EN ECONOMIA PARA INGENIEROS";
            }
            if (prog.equals("373")) {
                prog = "ESPECIALIZACION EN GERENCIA DE OPERACIONES";
            }
            if (prog.equals("267")) {
                prog = "ESPECIALIZACION EN DISEÑO, CONSTRUCCION Y CONSERVACION DE VIAS";
            }


        %>	
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <br>

                    <p>Usted debe realizar el pago de los derechos de Inscripción en cualquier 
                        oficina <b>del Banco Itaú </b>en todo el terrirorio. Imprima este
                        reporte y presénteselo al cajero de la oficina donde realizará el pago.</p>

                    <p><b>Código del recaudo: 5941 </b> </p>

                    <p><b>Referencia de pago:</b> <strong>&nbsp; &nbsp;<%=ref%></strong> 
                    </p>

                    <p><b>Nombre aspirante: <%=nom.toUpperCase()%>&nbsp;&nbsp;<%=apellido1.toUpperCase()%> 
                            &nbsp;<%=apellido2.toUpperCase()%> </b></p>

                    <p><b>Número de documento:&nbsp;&nbsp;&nbsp;<%=doc%></b> </p>
                    <p><b> Valor: &nbsp;&nbsp;$99.000=&nbsp; &nbsp;  No se reciben valores diferentes<br>
                        </b></p>
                    <p><b> Programa: <%=prog%></b> </p>

                    <div align="justify"> 

                        <p><i>(En caso de error en el número del documento de identidad que quedó 
                                registrado, por favor envíe a la Oficina de admisiones al correo electrónico 
                                admisiones@escuelaing.edu.co, copia de su documento de identidad solicitando 
                                la correspondiente corrección, antes de realizar su pago". Esto evitará 
                                posteriores confusiones con su pago).</i></p>
                        <p>Al día hábil siguiente de haber realizado el pago a partir de las 10:00 
                            a.m., usted podrá ingresar al sitio web de la Escuela Colombiana de 
                            Ingenier&iacute;a y diligenciar la solicitud de admisi&oacute;n al programa 
                            académico deseado, para lo cual el sistema le solicitará el número de 
                            referencia.</p>
                        <p align="left">Para atender cualquier inquietud que tenga con su pago, 
                            por favor env&iacute;ela al correo electr&oacute;nico admisiones@escuelaing.edu.co, 
                            Oficina de Admisiones, relacionando sus datos. </p>
                        <p>&nbsp;</p>
                    </div>

                    <table width="100%" border="0" id="tablaboton" >
                        <tr>
                            <td width="100%">

                                <input name="imprimir" class="boton"  type="submit" id="imprimir3" value="Imprimir  " onClick="impresion()">

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input name="Salir" class="boton"  type="submit" id="" value="Regresar" onClick="location.href = 'http://www.escuelaing.edu.co/es/programas/admisiones/pregrado?id=1&itemId=3'">
                            </td>
                        </tr>
                    </table>
                   
                </div> </div> </div> 
    </body>
</html>
