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

        <% if (prog.equals("290")) {
            prog = "MAESTRIA EN INGENIERIA CIVIL CON ENFASIS EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
        }
        if (prog.equals("291")) {
            prog = "MAESTRIA EN INGENIERIA CIVIL CON ENFASIS EN INGENIERIA ESTRUCTURAL";
        }
        if (prog.equals("292")) {
            prog = "MAESTRIA EN INGENIERIA CIVIL CON ENFASIS EN INGENIERIA AMBIENTAL";
        }
        if (prog.equals("293")) {
            prog = "MAESTRIA EN INGENIERIA CIVIL CON ENFASIS EN GEOTECNIA- MODALIDAD DE PROFUNDIZACIÓN";
        }
        if (prog.equals("294")) {
            prog = "MAESTRIA EN INGENIERIA CIVIL CON ENFASIS EN TRANSITO Y TRANSPORTE - MODALIDAD DE PROFUNDIZACIÓN";
        }
        if (prog.equals("353")) {
            prog = "MAESTRIA EN GESTIÓN DE INFORMACIÓN";
        }

        if (prog.equals("332")) {
            prog = "MAESTRÍA EN INGENIERÍA ELECTRÓNICA-MODALIDAD DE PROFUNDIZACIÓN";
        }
        
         if (prog.equals("333")) {
            prog = "MAESTRÍA EN INGENIERÍA ELECTRÓNICA-MODALIDAD DE INVESTIGACIÓN";
        }

        if (prog.equals("351")) {
            prog = "MAESTRÍA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
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
         if (prog.equals("330")) {
            prog = "MAESTRÍA EN INGENIERIA INDUSTRIAL";
        }
         
         if (prog.equals("335") || prog.equals("336")) {
                                prog = "MAESTRIA EN INGENIERIA ELECTRICA";
                            }
        %>
       
                        <p>Usted debe realizar el pago de los derechos de Inscripción en cualquier oficina <b>del BANCO ITAÚ  </b>a nivel
                            nacional. Imprima este reporte y presénteselo al cajero de la oficina
                        donde realizará el pago.</p>
                        <p><b>Código del Recaudo: 5941</b> </p>
                        <p><b>Referencia de Pago:</b> <strong><big>&nbsp; &nbsp;<%=ref%></big></strong>
                        </p>
                        <p><b>Nombre Aspirante: <%=nom.toUpperCase()%>&nbsp;<%=apellido1.toUpperCase()%> &nbsp;<%=apellido2.toUpperCase()%>
                        </b></p>
                        <p><b>Número de Documento:&nbsp;&nbsp;&nbsp;<%=doc%></b> </p>
                        <p><b> Valor: &nbsp;&nbsp;$99.000=&nbsp; &nbsp;  No se reciben valores diferentes<br>
                        </b></p>
                        <p><b> Programa: <%=prog%></b> </p>
                  
                    <div align="justify">
                        <p><i>(En caso de error en el número del documento de identidad que quedó
                                registrado, por favor envíe a la Oficina de admisiones vía fax al 6762340,
                                copia de su documento de identidad solicitando la correspondiente corrección,
                        antes de realizar su pago". Esto evitará posteriores confusiones).</i></p>
                    </div>
               

       
                        <li>Al día hábil siguiente de haber realizado el pago y a partir de las
                            10:00 a.m., usted podrá diligenciar la solicitud de admisi&oacute;n
                            al programa Académico deseado, para lo cual el sistema le solicitará
                        el número de referencia.</li>
                        <li>Recuerde que deber&aacute; entregar el soporte del pago con el timbre
                   
                    <p align="center">&nbsp;</p>
                    <p align="center"><a href="http://www.escuelaing.edu.co/documentos/directorio.xls">Consulte
                    Directorio de Oficinas BANCO ITAÚ </a></p>
               
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
