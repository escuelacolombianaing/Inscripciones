<%
            String ref, apellido1, apellido2, nom, doc, prog;
            apellido1 = request.getParameter("apellido1");
            apellido2 = request.getParameter("apellido2");
            nom = request.getParameter("nombre");
            doc = request.getParameter("doc");
            ref = request.getParameter("ref");
            prog = request.getParameter("prog");
            configeci.configmaestria confEci = new configeci.configmaestria();
%>
<% if (prog.equals("290")) {
                prog = "MAESTRIA EN INGENIERA CIVIL CON ENFASIS EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
            }
            if (prog.equals("291")) {
                prog = "MAESTRIA EN INGENIERA CIVIL CON ENFASIS EN INGENIERIA ESTRUCTURAL";
            }
            if (prog.equals("292")) {
                prog = "MAESTRIA EN INGENIERA CIVIL CON ENFASIS EN INGENIERIA AMBIENTAL";
            }
            if (prog.equals("293")) {
                prog = "MAESTRIA EN INGENIERA CIVIL CON ENFASIS EN GEOTECNIA- MODALIDAD DE PROFUNDIZACION";
            }
            if (prog.equals("294")) {
                prog = "MAESTRIA EN INGENIERA CIVIL CON ENFASIS EN TRANSITO Y TRANSPORTE - MODALIDAD DE PROFUNDIZACION";
            }
            if (prog.equals("353")) {
                prog = "MAESTRIA EN GESTION DE INFORMACION";
            }

            if (prog.equals("332")) {
                prog = "MAESTRIA EN INGENIERÍA ELECTRÓNICA-MODALIDAD DE PROFUNDIZACIÓN";
            }

            if (prog.equals("333")) {
                prog = "MAESTRIA EN INGENIERÍA ELECTRÓNICA-MODALIDAD DE INVESTIGACIÓN";
            }

            if (prog.equals("351")) {
                prog = "MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
            }
            if (prog.equals("330")) {
            prog = "MAESTRÍA EN INGENIERIA INDUSTRIAL";
        }
            if (prog.equals("371")) {
            prog = "MAESTRÍA EN INFORMÁTICA";
            }
            if (prog.equals("372")) {
            prog = "MAESTRÍA EN CIENCIAS ACTUARIALES";
            }
            if(prog.equals("376") || prog.equals("377")){
                prog="MAESTRÍA EN CIENCIA DE DATOS";
            }
            if (prog.equals("335") || prog.equals("336")) {
                                prog = "MAESTRIA EN INGENIERIA ELECTRICA";
                            }

%>
<html>
    <head>
        <title>Información de Pago de Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
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
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE NUMERO DE REFERENCIA DE PAGO PARA HACER LA INSCRIPCION" />
        </jsp:include>
        <br>
        <table width="640" align="center" class="textocom">

            <tr>
                <td>
                    <p>Usted debe realizar el pago de los derechos de Inscripción ($ 99.000.oo
                        ) con tarjeta d&eacute;bito o cr&eacute;dito en la caja de la Escuela
                        Colombiana de Ingenier&iacute;a. Imprima este reporte y presénteselo al
                        cajero de la Escuela.</p>
                    <p><b>Nombre Aspirante - Programa: <%=nom.toUpperCase()%>&nbsp;<%=apellido1.toUpperCase()%> &nbsp;<%=apellido2.toUpperCase()%>
                            -<%=prog%> </b></p>
                    <p><b>Documento de Identidad:&nbsp;&nbsp;&nbsp;<%=doc%></b> </p>
                    <p><b>Número de referencia:</b> <strong><big>&nbsp; &nbsp;<%=ref%></big></strong>
                    </p>
                    <p>Lo puede realizar &uacute;nicamente en la Caja de la Escuela Colombiana
                        de Ingenier&iacute;a, Bloque A, primer piso de lunes a viernes entre
                        1:00 pm y 4:00 pm .</p>
                    <ol>
                        <li>Sumin&iacute;strele al cajero de la Escuela los siguientes datos:</li>
                        <ul>
                            <li>Nombre del aspirante y nombre del programa al que desea ingresar</li>
                            <li>N&uacute;mero del documento de identidad del aspirante</li>
                            <li>N&uacute;mero de Referencia de pago (el que le asign&oacute; el
                                sistema cuando se registr&oacute;)</li>
                        </ul>
                        <p>&nbsp;</p>
                        <li>Usted no requiere diligenciar comprobante. Una vez realice el pago,
                            el cajero le entregar&aacute; el soporte con el respectivo timbre, el
                            cual deber&aacute; entregar en la oficina de admisiones con el fin de
                            habilitar su pago .<p></li>
                        <li>Una vez habilitado el pago, se le dar&aacute; acceso para diligenciar
                            el formulario de solicitud de admisi&oacute;n en l&iacute;nea. Tenga
                            en cuenta la fecha l&iacute;mite del proceso de inscripciones y los
                            tiempos necesarios para acceder al formulario una vez haya realizado
                            el pago y verifique que este se recibi&oacute; correctamente. </li>
                    </ol>
                    <p>Para atender cualquier dificultad que tenga con su pago, por favor env&iacute;elo
                        v&iacute;a fax al 6762340, Oficina de Admisiones, relacionando el motivo
                        de la dificultad.</p>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" id="tablaboton" >
            <tr>
                <td width="40%">
                    <div align="center">
                        <input name="imprimir" class="boton"  type="submit" id="imprimir3" value="Imprimir"  onClick="impresion()">
                    </div>
                </td>
            </tr>
        </table>
        <p>&nbsp;</p></body>
</html>
