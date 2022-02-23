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


<html>
    <head>
        <title>Información de Pago de Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <!--<link REL="stylesheet" TYPE="text/css" HREF="StyleSheet1.css"><script language="JavaScript" src="DatGenPost_Valid.js" type="text/javascript"></script>-->

    </head>

    <body>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE NUMERO DE REFERENCIA DE PAGO PARA HACER LA INSCRIPCION" />
        </jsp:include>


        <table width="640" align="center" class="textocom">
            <tr>
                <td>
                    <br>
                    <p align="justify">Usted debe realizar el pago de los derechos de Inscripción ($
                        99.000.oo en efectivo) en cualquier oficina del Banco de Occidente, utilizando
                        únicamente el comprobante denominado <b>RECAUDO EN LINEA.</b> Si utiliza otro
                        formato su pago no podrá ser identificado. </p>
                        <% if (prog.equals("290")) {
                                prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
                            }
                            if (prog.equals("291")) {
                                prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN INGENIERIA ESTRUCTURAL";
                            }
                            if (prog.equals("292")) {
                                prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN INGENIERIA AMBIENTAL";
                            }
                            if (prog.equals("293")) {
                                prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN GEOTECNIA- MODALIDAD DE PROFUNDIZACION";
                            }
                            if (prog.equals("294")) {
                                prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN TRANSITO Y TRANSPORTE - MODALIDAD DE PROFUNDIZACION";
                            }
                            if (prog.equals("353")) {
                                prog = "MAESTRIA EN GESTION DE INFORMACIÓN";
                            }
                            if (prog.equals("332")) {
                                prog = "MAESTRIA EN INGENIERIA ELECTRONICA-MODALIDAD DE PROFUNDIZACIÓN";
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
                            if (prog.equals("335") || prog.equals("336")) {
                                prog = "MAESTRIA EN INGENIERIA ELECTRICA";
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
                        %>


                    %>
                    <p align="left"><b>Nombre Aspirante: <%=nom.toUpperCase()%>&nbsp;<%=apellido1.toUpperCase()%> &nbsp;<%=apellido2.toUpperCase()%><br>
                            Programa: <%=prog%> <br>
                            Documento de Identidad: &nbsp;&nbsp;<%=doc%></b>
                    <p align="left"><br>
                    <div align="justify">
                        <p><i>(En caso de error en el número del documento de identidad que quedó
                                registrado, por favor envíe a la Oficina de admisiones vía fax al 6762340,
                                copia de su documento de identidad solicitando la correspondiente corrección".
                                Esto evitará posteriores confusiones con su pago)</i></p>

                    </div>
                    El número de referencia para realizar
                    dicho pago es: <strong><big> <%=ref%></big></strong>, y el número de la
                    cuenta corriente para realizar el pago en el Banco de occidente es
                    <strong><big> 255 03548 7. </big></strong>
                    </font></p>
                    <p align="justify"><font color="#CC0000"><b>24 horas después de realizar su pago,
                            ingrese nuevamente a la p&aacute;gina y diligencie su solicitud de admisi&oacute;n.</b></font></p>
                    <p align="center">Este es un ejemplo de como debe diligenciar el formato de Recaudo
                        en L&iacute;nea del Banco de Occidente. </p>
                </td>
            </tr>
        </table>
        <div align="center"><img src="img/recaudo3.jpg" width="734" height="492">

        </div>
        <table width="640" align="center" class="textocom">
            <tr><td>
                    <p align="center">Al día hábil siguiente de haber realizado el pago y a partir
                        de las 10:00 a.m., usted podrá diligenciar la solicitud de admisi&oacute;n al
                        programa Académico deseado, para lo cual el sistema le solicitará este número
                        de referencia:<strong><big> <%=ref%> </big></strong>.</p>
                </td></tr></table>
    </body>
</html>
<!--%
    sesion = request.getSession(false) ;
    sesion.invalidate() ;
%-->
