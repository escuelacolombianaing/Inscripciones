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
        <title>Información de Pago de Inscripción del Aspirante</title>
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
            <jsp:param name="titulo" value="INSTRUCCIONES PARA EL PAGO EN EFECTIVO EN BANCO ITAÚ " />
        </jsp:include>
        <%} else {%>
        <jsp:include page="encabezadoP">
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
            if (prog.equals("285")) {
                prog = "PROCESAMIENTO DE POLIMEROS";
            }
            if (prog.equals("370")) {
                prog = "GESTIÓN INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE";
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
            if (prog.equals("335") || prog.equals("336")) {
                prog = "MAESTRIA EN INGENIERIA ELECTRICA";
            }
            if (prog.equals("371")) {
                prog = "MAESTRÍA EN INFORMÁTICA";
            }
            if (prog.equals("372")) {
                prog = "MAESTRÍA EN CIENCIAS ACTUARIALES";
            }
            if(prog.equals("277")){
                prog="DOCTORADO EN INGENIERIA";
            }
            if (prog.equals("376")|| prog.equals("377")){
               prog="MAESTRÍA EN CIENCIA DE DATOS";
            }
        %>	
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">

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
                    </div>

                    <p>Al siguiente día hábil  de haber realizado el pago y a partir de las 
                        10:00 a.m., usted podrá ingresar al sitio web de la Escuela Colombiana 
                        de Ingenier&iacute;a y diligenciar la solicitud de admisi&oacute;n al 
                        programa académico deseado, para lo cual el sistema le solicitará el 
                        número de referencia.
                    <p align="left">Para atender cualquier inquietud que tenga con su pago, 
                        por favor env&iacute;ela al correo electr&oacute;nico admisiones@escuelaing.edu.co, 
                        Oficina de Admisiones, relacionando sus datos. </p>
                    <p align="center">&nbsp;</p>

                    <p align="center"><a href="http://www.escuelaing.edu.co/documentos/directorio.xls">Consulte 
                            directorio de oficinas Banco Itaú</a></p>

                    <div align="center">
                        <input name="imprimir" class="boton"  type="submit" id="imprimir" value="Imprimir"  onClick="impresion()">
                    </div>
                </div></div></div>

    </body>
</html>
