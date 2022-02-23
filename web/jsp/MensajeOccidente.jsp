<%
    String ref, apellido1, apellido2, nom, doc, prog;
    apellido1 = request.getParameter("apellido1");
    apellido2 = request.getParameter("apellido2");
    nom = request.getParameter("nombre");
    doc = request.getParameter("doc");
    ref = request.getParameter("ref");
    prog = request.getParameter("prog");
    if(ref.equals("1122597")){
        response.sendRedirect("http://www.escuelaing.edu.co/es/programas/admisiones/pregrado?id=1&itemId=3");
    }
    configeci.configuracion confEci = new configeci.configuracion();
%>

<html>
    <head>
        <title>Información de Pago de Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <!--<link REL="stylesheet" TYPE="text/css" HREF="StyleSheet1.css"><script language="JavaScript" src="DatGenPost_Valid.js" type="text/javascript"></script>-->

    </head>

    <body>
        <%if (prog.equals("370")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="INSTRUCCIONES PARA EL PAGO EN EFECTIVO EN EL BANCO DE OCCIDENTE" />
        </jsp:include>
        <%} else {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="INSTRUCCIONES PARA EL PAGO EN EFECTIVO EN EL BANCO DE OCCIDENTE" />
        </jsp:include>
        <%  }%>

        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <br>
                    <p align="justify">Usted debe realizar el pago de los derechos de inscripción 
                        ($ 99.000 en efectivo) en cualquier oficina del Banco de Occidente, utilizando
                        únicamente el comprobante denominado <b>RECAUDO EN LINEA.</b> Si utiliza 
                        otro formato su pago no podrá ser identificado. </p>
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
                                prog = "ESPECIALIZACION EN PROCESAMIENTO DE POLIMEROS";
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
                            if (prog.equals("321")) {
                                prog = "MAESTRIA EN INGENIERIA ELECTRONICA";
                            }
                            if (prog.equals("351")) {
                                prog = "MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
                            }
                        %>

                    <p align="left"><b>Nombre Aspirante: <%=nom.toUpperCase()%>&nbsp;&nbsp;<%=apellido1.toUpperCase()%> &nbsp;<%=apellido2.toUpperCase()%> <br>
                            Programa: <%=prog%> <br>
                            Documento de Identidad: &nbsp;&nbsp;<%=doc%></b> 
                    <p align="left"><br>
                    <div align="justify"> 
                        <p><i>(En caso de error en el número del documento de identidad que quedó 
                                registrado, por favor envíe a la Oficina de admisiones al correo electr&oacute;nico 
                                admisiones@escuelaing.edu.co, , copia de su documento de identidad solicitando 
                                la correspondiente corrección". Esto evitará posteriores confusiones 
                                con su pago)</i></p>

                    </div>
                    El número de referencia para realizar 
                    dicho pago es: <strong><%=ref%></strong>, y el número de la 
                    cuenta corriente para realizar el pago en el Banco de occidente es 
                    <strong> 255 03548 7. </strong>
                    </font></p>
                    <p align="justify"><font color="#CC0000"><b>Al d&iacute;a h&aacute;bil siguiente 
                            de haber realizado el pago a partir de las 10:00am, usted podr&aacute; 
                            ingresar al sitio web de la Escuela Colombiana de Ingenier&iacute;a y 
                            diligenciar su solicitud de admisi&oacute;n al programa acad&eacute;mico 
                            deseado, para lo cual el sistema le solicitar&aacute; este n&uacute;mero 
                            de referencia: <%=ref%>.</b></font></p>
                    <p>
                        Para atender cualquier inquietud que tenga con su pago, por favor envíela al correo electrónico admisiones@escuelaing.edu.co, Oficina de Admisiones, relacionando sus datos.
                    <p align="center">Este es un ejemplo de como debe diligenciar el formato de Recaudo 
                        en L&iacute;nea del Banco de Occidente. </p>

                    <div align="center"><img src="img/recaudo3.jpg" width="734" height="492"> 

                    </div>

                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-md-4">			                		
                            <div class="form-group">
                                <small></small>
                            </div>
                        </div>
                        <input name="Salir" class="boton1"  type="submit" id="" value="Regresar" onClick="location.href = 'http://www.escuelaing.edu.co/es/programas/admisiones/pregrado?id=1&itemId=3'">
                    </div>

                </div> </div> </div> 
    </body>
</html>
<!--%
    sesion = request.getSession(false) ;
    sesion.invalidate() ;
%-->
