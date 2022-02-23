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
        <title>Informaci�n de Pago de Inscripci�n del Aspirante</title>
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
            prog = "MAESTRIA EN INGENIERIA CIVIL CON ENFASIS EN GEOTECNIA- MODALIDAD DE PROFUNDIZACI�N";
        }
        if (prog.equals("294")) {
            prog = "MAESTRIA EN INGENIERIA CIVIL CON ENFASIS EN TRANSITO Y TRANSPORTE - MODALIDAD DE PROFUNDIZACI�N";
        }
        if (prog.equals("353")) {
            prog = "MAESTRIA EN GESTI�N DE INFORMACI�N";
        }

        if (prog.equals("332")) {
            prog = "MAESTR�A EN INGENIER�A ELECTR�NICA-MODALIDAD DE PROFUNDIZACI�N";
        }
        
         if (prog.equals("333")) {
            prog = "MAESTR�A EN INGENIER�A ELECTR�NICA-MODALIDAD DE INVESTIGACI�N";
        }

        if (prog.equals("351")) {
            prog = "MAESTR�A EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
        }
        if (prog.equals("371")) {
            prog = "MAESTR�A EN INFORM�TICA";
        }
        if (prog.equals("372")) {
            prog = "MAESTR�A EN CIENCIAS ACTUARIALES";
        }
        if(prog.equals("376") || prog.equals("377")){
                prog="MAESTR�A EN CIENCIA DE DATOS";
            }
         if (prog.equals("330")) {
            prog = "MAESTR�A EN INGENIERIA INDUSTRIAL";
        }
         
         if (prog.equals("335") || prog.equals("336")) {
                                prog = "MAESTRIA EN INGENIERIA ELECTRICA";
                            }
        %>
       
                        <p>Usted debe realizar el pago de los derechos de Inscripci�n en cualquier oficina <b>del BANCO ITA�  </b>a nivel
                            nacional. Imprima este reporte y pres�nteselo al cajero de la oficina
                        donde realizar� el pago.</p>
                        <p><b>C�digo del Recaudo: 5941</b> </p>
                        <p><b>Referencia de Pago:</b> <strong><big>&nbsp; &nbsp;<%=ref%></big></strong>
                        </p>
                        <p><b>Nombre Aspirante: <%=nom.toUpperCase()%>&nbsp;<%=apellido1.toUpperCase()%> &nbsp;<%=apellido2.toUpperCase()%>
                        </b></p>
                        <p><b>N�mero de Documento:&nbsp;&nbsp;&nbsp;<%=doc%></b> </p>
                        <p><b> Valor: &nbsp;&nbsp;$99.000=&nbsp; &nbsp;  No se reciben valores diferentes<br>
                        </b></p>
                        <p><b> Programa: <%=prog%></b> </p>
                  
                    <div align="justify">
                        <p><i>(En caso de error en el n�mero del documento de identidad que qued�
                                registrado, por favor env�e a la Oficina de admisiones v�a fax al 6762340,
                                copia de su documento de identidad solicitando la correspondiente correcci�n,
                        antes de realizar su pago". Esto evitar� posteriores confusiones).</i></p>
                    </div>
               

       
                        <li>Al d�a h�bil siguiente de haber realizado el pago y a partir de las
                            10:00 a.m., usted podr� diligenciar la solicitud de admisi&oacute;n
                            al programa Acad�mico deseado, para lo cual el sistema le solicitar�
                        el n�mero de referencia.</li>
                        <li>Recuerde que deber&aacute; entregar el soporte del pago con el timbre
                   
                    <p align="center">&nbsp;</p>
                    <p align="center"><a href="http://www.escuelaing.edu.co/documentos/directorio.xls">Consulte
                    Directorio de Oficinas BANCO ITA� </a></p>
               
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
