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
            prog = "MAESTRIA EN INGENIERIA ELECTRÓNICA-MODALIDAD DE PROFUNDIZACIÓN";
        }

         if (prog.equals("333")) {
            prog = "MAESTRIA EN INGENIERIA ELECTRÓNICA-MODALIDAD DE INVESTIGACIÓN";
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
        if (prog.equals("376")) {
            prog = "MAESTRÍA EN CIENCIA DE DATOS - MODALIDAD DE PROFUNDIZACIÓN";
        }
        if (prog.equals("377")) {
            prog = "MAESTRÍA EN CIENCIA DE DATOS - MODALIDAD DE INVESTIGACIÓN";
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
        <p>&nbsp;</p>
        <table width="640" align="center" class="textocom">
            <tr>
                <td>
                    <p>Usted va a realizar el pago de los derechos de Inscripción ($ 99.000.oo
                        ) en el link que aparece en la parte inferior de esta p&aacute;gina. Despu&eacute;s
                    de realizar el pago imprima el soporte y anexelo a los documentos de inscripci&oacute;n.</p>
                    <p><b>Nombre Aspirante - Programa: <%=nom.toUpperCase()%>&nbsp;<%=apellido1.toUpperCase()%> &nbsp;<%=apellido2.toUpperCase()%>
                    - <%=prog%> </b></p>
                    <p><b>Documento de Identidad:&nbsp;&nbsp;&nbsp;<%=doc%></b> </p>
                    <p><b>Número de referencia:</b> <strong><big>&nbsp; &nbsp;<%=ref%></big></strong>
                    </p>
                    <div align="justify"> </div>
                    <p align="center">
                        
                    <p>No olvide hacer clic en el bot&oacute;n <strong>"REGRESAR A LA TIENDA"</strong> al terminar el pago en PSE para que su pago quede registrado.</p>
                        
                    <p>Si desea puede realizar el pago de los derechos de inscripci&oacute;n <strong>a
                        trav&eacute;s de internet</strong> haciendo <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst"><strong>&lt;&lt;CLIK
                        AQUI&gt;&gt;</strong></a>, para realizar este proceso debe contar con una cuenta
                        corriente o de ahorros a nivel nacional.

                    </p>
                    <p><i>(En caso de error en el número del documento de identidad que quedó registrado,
                            por favor envíe a la Oficina de admisiones vía fax al 6762340, copia de
                            su documento de identidad solicitando la correspondiente corrección, antes
                    de realizar su pago". Esto evitará posteriores confusiones)</i></p>
                <p>&nbsp;</p></td>
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
    </body>
</html>
