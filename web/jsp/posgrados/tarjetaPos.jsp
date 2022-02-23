<%
    String ref, apellido1, apellido2, nom, doc, prog;
    apellido1 = request.getParameter("apellido1");
    apellido2 = request.getParameter("apellido2");
    nom = request.getParameter("nombre");
    doc = request.getParameter("doc");
    ref = request.getParameter("ref");
    prog = request.getParameter("prog");
    configeci.configPosgrados confEci = new configeci.configPosgrados();
%>

<html>
    <head>
        <title>Informaci�n de Pago de Inscripci�n del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function impresion(){
            document.getElementById("imprimir").style.visibility='hidden';
            window.print();

            }
            -->

        </script>

    </head>
    <body>

        <%if (prog.equals("370")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="INSTRUCCIONES PARA EL PAGO MIXTO" />
        </jsp:include>
        <%} else {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="INSTRUCCIONES PARA EL PAGO MIXTO" />
        </jsp:include>
        <%  }%>
        <br>
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
                prog = "ADMINISTRACION";
            }
            if (prog.equals("20")) {
                prog = "MATEMATICAS";
            }
            if (prog.equals("260")) {
                prog = "INGENIERIA MECANICA";
            }
            if (prog.equals("285")) {
                prog = "PROCESAMIENTO DE POLIMEROS";
            }
            if (prog.equals("370")) {
                prog = "GESTI�N INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE";
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
                prog = "ESPECIALIZACION EN DISE�O, CONSTRUCCION Y CONSERVACION DE VIAS";
            }
            if (prog.equals("332")) {
                prog = "MAESTRIA EN INGENIERIA ELECTRONICA";
            }
            if (prog.equals("333")) {
                prog = "MAESTRIA EN INGENIERIA ELECTRONICA";
            }
            if (prog.equals("351")) {
                prog = "MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
            }
            if (prog.equals("290") || prog.equals("290") || prog.equals("292") || prog.equals("293") || prog.equals("294")) {
                prog = "MAESTRIA EN INGENIERIA CIVIL";
            }
            if (prog.equals("353")) {
                prog = "MAESTRIA EN GESTION DE INFORMACION";
            }
            if (prog.equals("330")) {
                prog = "MAESTRIA EN INGENIERIA INDUSTRIAL";
            }
            if (prog.equals("371")) {
                prog = "MAESTR�A EN INFORM�TICA";
            }
            if (prog.equals("372")) {
                prog = "MAESTR�A EN CIENCIAS ACTUARIALES";
            }
            if (prog.equals("376") || prog.equals("377")) {
                prog = "MAESTRIA EN CIENCIA DE DATOS";
            }
            if (prog.equals("335") || prog.equals("336")) {
                prog = "MAESTRIA EN INGENIERIA ELECTRICA";
            }
            if(prog.equals("277")){
                prog="DOCTORADO EN INGENIERIA";
            }
        %>	
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <p>Si usted desea pagar los derechos de inscripci�n (99.000) combinando
                        efectivo y tarjeta d&eacute;bito, efectivo y tarjeta cr&eacute;dito, efectivo 
                        y cheque o con cualquier tarjeta d&eacute;bito o cr&eacute;dito, �nicamente 
                        podr� hacerlo en la caja de la Escuela Colombiana de Ingenier&iacute;a, 
                        Bloque A, primer piso, de 8:00 a.m a 12 m. y de 1:00p.m a 4:00p.m</p>
                    <p align="center"><b>Para ello imprima este reporte y pres&eacute;ntelo 
                            en la caja de la Escuela.</b></p>
                    <p><b>Nombre Aspirante - Programa: <%=nom.toUpperCase()%>&nbsp;&nbsp;<%=apellido1.toUpperCase()%> 
                            &nbsp;<%=apellido2.toUpperCase()%> - <%=prog%> </b></p>
                    <p><b>Documento de Identidad:&nbsp;&nbsp;&nbsp;<%=doc%></b> </p>
                    <p><b>N�mero de referencia:</b> <strong>&nbsp; &nbsp;<%=ref%></strong> 
                    </p>
                    <ol>
                        <p>&nbsp;</p>
                        <p><li>Usted no requiere diligenciar comprobante. Una vez realice el pago,
                            el cajero le entregar&aacute; el soporte con el respectivo sello el 
                            cual deber&aacute; entregar en la Oficina de Admisiones con el fin de 
                            habilitar su pago .</li> </p>
                        <p>
                        <li>Una vez habilitado el pago, se le dar&aacute; acceso para diligenciar 
                            el formulario de solicitud de admisi&oacute;n en l&iacute;nea. Tenga 
                            en cuenta la fecha l&iacute;mite del proceso de inscripciones y los 
                            tiempos necesarios para acceder al formulario una vez haya realizado 
                            el pago, y verifique que este se recibi&oacute; correctamente 
                    </ol>

                    <p>(En caso de error en el n&uacute;mero del documento de identidad que 
                        qued&oacute; registrado, por favor env&iacute;e a la Oficina de admisiones 
                        al correo electr&oacute;nico admisiones@escuelaing.edu.co, copia de 
                        su documento de identidad solicitando la correspondiente correcci&oacute;n&quot;. 
                        Esto evitar&aacute; posteriores confusiones con su pago)</p>
                    <p>Para atender cualquier inquietud que tenga con su pago, por favor env&iacute;ela 
                        al correo electr&oacute;nico admisiones@escuelaing.edu.co, Oficina de 
                        Admisiones, relacionando sus datos.<br>
                    </p>


                    <div align="center">
                        <input name="imprimir" class="boton"  type="submit" id="imprimir" value="Imprimir"  onClick="impresion()">
                    </div>
                </div>
            </div>
        </div>
        <p>&nbsp;</p></body>
</html>
