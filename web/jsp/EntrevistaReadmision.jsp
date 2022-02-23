<%-- 
    Document   : EntrevistaReadmision
    Created on : 3/12/2009, 04:01:12 PM
    Author     : lrodriguez
--%>
<%@page contentType="text/html"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%String docEst = request.getParameter("documento");
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    //   configeci.configuracion confEci = new configeci.configuracion();
    String prog = "";

    Vector Readmision = bd.EstadoReadmision(docEst, oout);
    String tipoest = request.getParameter("tipprog");
    configeci.configuracion confeci = new configeci.configuracion();
    Vector estado = bd.Entrevistas(docEst, oout, confeci.getPeriodo());
    Vector pregrados = bd.pregrado(oout, confeci.getPeriodo(), tipoest);
    //  Vector estudiante = bd.AdmitidosPregrado(docEst, oout);

%>
<!--PAra este proceso se tendra en cuenta el fac_cor-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Citación Entrevistas Readmisión</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confeci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CITACION ENTREVISTAS READMISIÓN" />
        </jsp:include>

        <div class="container-fluid contenidos">
            <div class="row">

                <div class="col-md-5"></div>
                <div class="col-md-12">
                    <table width=950" border="0" align="center" cellpadding="0" cellspacing="0" class="textoimpremas">
                        <% if (Readmision.size() == 0) {%>
                        <tr> 
                            <td width="100%">No está autorizado para realizar este proceso, por favor comuníquese 
                                con la Oficina de Admisiones. <br>
                                Tel&eacute;fono: 6683600 opción 2 en el menú. </td>
                        </tr>
                        <% } else if (Readmision.size() > 0) {

                            for (int k = 0; k < Readmision.size(); k++) {
                                Vector readmi = (Vector) Readmision.elementAt(k);

                                if (readmi.elementAt(1).equals("13")) {
                                    prog = "INGENIERIA CIVIL";

                                } else if (readmi.elementAt(1).equals("14")) {
                                    prog = "INGENIERIA ELECTRICA";

                                } else if (readmi.elementAt(1).equals("15")) {
                                    prog = "INGENIERIA DE SISTEMAS";

                                } else if (readmi.elementAt(1).equals("16")) {
                                    prog = "INGENIERIA INDUSTRIAL";

                                } else if (readmi.elementAt(1).equals("17")) {
                                    prog = "INGENIERIA ELECTRONICA";

                                } else if (readmi.elementAt(1).equals("18")) {
                                    prog = "ECONOMIA";

                                } else if (readmi.elementAt(1).equals("19")) {
                                    prog = "ADMINISTRACIÓN DE EMPRESAS";

                                } else if (readmi.elementAt(1).equals("20")) {
                                    prog = "MATEMATICAS";

                                } else if (readmi.elementAt(1).equals("260")) {
                                    prog = "INGENIERIA MECANICA";
                                
                                }else if (readmi.elementAt(1).equals("264")) {
                                    prog = "INGENIERIA AMBIENTAL";

          }%>
                        <tr> 
                            <td >&nbsp;</td>
                        </tr>
                        <tr> 
                            <td >&nbsp;</td>
                        </tr>
                        <%if (readmi.elementAt(3).equals("0") && estado.size() > 0) {%>
                        <tr> 
                            <td >Entrevista para el programa de <b><%=prog%></b></td>
                        </tr>
                        <tr> 
                            <td>&nbsp;</td>
                        </tr>
                        <tr> 
                            <td> 
                                <p><%=readmi.elementAt(0)%></p>
                            </td>
                        </tr>
                        <tr> 
                            <td>&nbsp;</td>
                        </tr>
                        <tr> 
                            <td>Apreciado Aspirante:</td>
                        </tr>
                        <tr> 
                            <td>&nbsp;</td>
                        </tr>
                        <tr> 
                            <td> 
                                <p>Como parte del estudio de su solicitud de readmisi&oacute;n le informamos 
                                    que deber&aacute; presentar entrevista el próximo: <b> <%=estado.elementAt(2)%>, 
                                        a las <%=estado.elementAt(3)%> en la <%=estado.elementAt(6)%></b>, con 
                                    PSC: <%=estado.elementAt(7)%>. 
                                    <!--y el pr&oacute;ximo<b> <!%=estado.elementAt(10)%>, a las <!%=estado.elementAt(11)%>
                                            en la <!%=estado.elementAt(14)%></b>, con PSC: <!%=estado.elementAt(13)%>  en <B>COMPAÑIA DE SU ACUDIENTE</B> </p>-->
                                    <br>
                                    <br>
                                    El <font color="#FF0000"><b><%=pregrados.elementAt(6)%></b></font> deberá 
                                    consultar la respuesta a su solicitud en <a href="http://www.escuelaing.edu.co/admisiones/aspirantes_01.htm"> 
                                        Readmisión - Respuesta Admitidos</a> 
                                <p>Cordialmente</p>
                                <p>Oficina de Admisiones</p>
                                <p>6683600 opción 2 en el menú.</p>
                            </td>
                        </tr>
                        <%
  } else if (readmi.elementAt(3).equals("1")) {%>
                        <tr> 
                            <td >Entrevista para el programa de <b><%=prog%></b></td>
                        </tr>
                        <tr> 
                            <td>&nbsp;</td>
                        </tr>
                        <tr> 
                            <td> 
                                <p><%=readmi.elementAt(0)%></p>
                            </td>
                        </tr>
                        <tr> 
                            <td>&nbsp;</td>
                        </tr>
                        <tr> 
                            <td>Apreciado Aspirante:</td>
                        </tr>
                        <tr> 
                            <td>&nbsp;</td>
                        </tr>
                        <tr> 
                            <td > Una vez estudiada su hoja de vida académica, el Comité de 
                                Admisiones conceptuó que no es necesario citarlo(a) a entrevista y su solicitud 
                                ha sido aprobada. 
                                <p>Por lo tanto deberá cursar todas las asignaturas correspondientes al 
                                    plan de estudios vigente para el <%=confeci.getPeriodo()%>, teniendo en 
                                    cuenta el an&aacute;lisis de clasificaci&oacute;n de los puntajes obtenidos 
                                    en las &aacute;reas de inter&eacute;s del ex&aacute;men de Estado con 
                                    el que usted ingres&oacute; la primera vez. Si usted ingres&oacute; por 
                                    transferencia, se le tendr&aacute;n en cuenta las homologaciones iniciales. 
                                    Se le retirarán del Registro todas las calificaciones obtenidas en las 
                                    asignaturas cursadas hasta el momento, aprobados o no aprobados, para 
                                    efectos de las condiciones de permanencia expresadas en el Reglamento 
                                    Estudiantil y la expedición de certificados (Cap&iacute;tulo III, Reglamento Estudiantil). </p>
                                    <%   if (readmi.elementAt(1).equals("13")) {%>
                                <p></p>
                                <p>&nbsp;</p>
                                <p> <a href="http://www.escuelaing.edu.co/programas/ing_civil/imgs/plan_asignaturas.pdf" target="top"> 
                                        VER PLAN ASIGNATURAS </a> 
                                        <% } else if (readmi.elementAt(1).equals("14")) {%>
                                    <a href="http://www.escuelaing.edu.co/programas/ing_electrica/asignaturas_electrica.pdf" target="top"> 
                                        VER PLAN ASIGNATURAS </a> 
                                        <%  } else if (readmi.elementAt(1).equals("15")) {%>
                                    <a href="http://www.escuelaing.edu.co/programas/carreras/sistemas/asignaturas_sistemas.pdf" target="top"> 
                                        VER PLAN ASIGNATURAS </a> 
                                        <% } else if (readmi.elementAt(1).equals("16")) {%>
                                    <a href="http://www.escuelaing.edu.co/programas/carreras/industrial/asignaturas_industrial.pdf" target="top"> 
                                        VER PLAN ASIGNATURAS </a> 
                                        <% } else if (readmi.elementAt(1).equals("17")) {%>
                                    <a href="http://www.escuelaing.edu.co/programas/carreras/electronica/asignaturas_electronica.pdf" target="top"> 
                                        VER PLAN ASIGNATURAS </a> 
                                        <%  } else if (readmi.elementAt(1).equals("18")) {%>
                                    <a href="http://www.escuelaing.edu.co/programas/carreras/economia/asignaturas_economia.pdf" target="top"> 
                                        VER PLAN ASIGNATURAS </a> 
                                        <% } else if (readmi.elementAt(1).equals("19")) {%>
                                    <a href="http://www.escuelaing.edu.co/micrositio/admin/documentos/plan_asignaturas.pdf" target="top"> 
                                        VER PLAN ASIGNATURAS </a> 
                                        <% } else if (readmi.elementAt(1).equals("20")) {%>
                                    <a href="http://copernico.escuelaing.edu.co/ceciba/facultad_matematicas/upload/file/PlanMat2010.pdf" target="top"> 
                                        VER PLAN ASIGNATURAS </a> 
                                        <% } else if (readmi.elementAt(1).equals("260")) {%>
                                    <a href="http://www.escuelaing.edu.co/programas/ing_mecanica/asignaturas_mecanica.pdf" target="top"> 
                                        VER PLAN ASIGNATURAS </a> 
                                        <% }%>
                                </p>
                                <p>Deber&aacute; asistir a la jornada prevista por el Programa de Acompa&ntilde;amiento 
                                    que se desarrollar&aacute; el 28, 29 y 30 de julio de 2010 a partir de 
                                    las 8:00 a.m. Adicionalmente con el &aacute;nimo de favorecer su desempe&ntilde;o 
                                    acad&eacute;mico en la Escuela se requiere la presencia de los padres 
                                    del estudiante el 30 de julio a las 8:00 a.m. donde se dar&aacute; a conocer 
                                    el programa de acompa&ntilde;amiento, as&iacute; como la programaci&oacute;n 
                                    de las reuniones que se desarrollar&aacute;n durante el semestre.</p>
                                <!--  <p>Para efectos de contar con un elemento adicional con fines espec&iacute;ficos
                                  de diagn&oacute;stico en cada &aacute;rea, deber&aacute; presentar ex&aacute;menes
                                  institucionales <a href="Citacion">ASI: </a></p>
                                <p>Si usted lo desea podr&aacute; solicitar <b>
                                  <a href="ValidaReclasifica?idprog=<!%=datos.elementAt(1)%>&docEst=<!%=docEst%>">
                                  AQUI
                                  </a>
                                  </b> su reclasificaci&oacute;n a un nivel inferior o superior entre el
                                  <B>21 de diciembre de 2009 y el 12 de enero de 2010</B> a trav&eacute;s
                                  de la p&aacute;gina web (previa autenticaci&oacute;n con el nombre de
                                  usuario(carnet). La respuesta a esta solicitud ser&aacute; proporcionada
                                  por el Decano de <!%=prog%> el 12 de enero de 2010, para lo cual se tendr&aacute;
                                  en cuenta el resultado obtenido por usted en el examen diagn&oacute;stico.
                                  Para la elaboraci&oacute;n de su horario ese mismo d&iacute;a se ajustar&aacute;
                                  la preinscripci&oacute;n de asignaturas seg&uacute;n sea el caso. <br>
                                </p>-->
                                <p>Adicionalmente deber&aacute; asistir a la jornada de inducci&oacute;n 
                                    entre el <%=pregrados.elementAt(7)%>. All&iacute; se le proporcionar&aacute; 
                                    informaci&oacute;n espec&iacute;fica sobre el programa de <%=prog%>, as&iacute; 
                                    como el procedimiento a seguir para consultar su horario. </p>
                                <p>Deber&aacute; imprimir nuevamente su orden de pago para cancelar los 
                                    derechos de matr&iacute;cula correspondientes, teniendo en cuenta que 
                                    la orden anterior no tiene validez en su caso. Una vez haya cancelado 
                                    deber&aacute; firmar acta de matr&iacute;cula y consultar su horario por 
                                    internet en las fechas programadas para tal fin. </p>
                                <p>Al aceptar su readmisi&oacute;n se compromete a cumplir con el reglamento 
                                    estudiantil de la Escuela y en especial en lo relacionado con las condiciones 
                                    de permanencia expresadas en el Cap&iacute;tulo III, t&iacute;tulo tercero.</p>
                                <p>Le deseamos &eacute;xitos en el desarrollo de sus estudios.<br>
                                </p>
                            <td> 
                        <tr> 
                            <td > 
                                <div align="center"><a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst" ><img src="img/orden.gif" width="185" height="48"></a>
                                    &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.escuelaing.edu.co/documentos/FormalizacionesPS20102.pdf"  target="top"><img src="img/insformaliza.gif" width="185" height="48"></a></div>
                            </td>
                            <td> 
                                <div align="right"> </div>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <p><br>
                        <tr> 
                            <td> Atentamente, <br>
                                Psi. Nancy Barrero Ramírez Jefe de Admisiones 
                                <p></p>
                                <p>&nbsp;</p>
                            </td>
                        </tr>
                        <%} else if (readmi.elementAt(3).equals("3")) {%>
                        <tr> 
                            <td>Entrevista para el programa de <b><%=prog%></b></td>
                        </tr>
                        <tr> 
                            <td>&nbsp;</td>
                        </tr>
                        <tr> 
                            <td > 
                                <p><%=readmi.elementAt(0)%></p>
                            </td>
                        </tr>
                        <tr> 
                            <td >&nbsp;</td>
                        </tr>
                        <tr> 
                            <td>Apreciado Aspirante:</td>
                        </tr>
                        <tr> 
                            <td >&nbsp;</td>
                        </tr>
                        <tr> 
                            <td> Usted solicitó Readmisión. Sin embargo, al finalizar el período 
                                académico su promedio acumulado fue igual o superior a 30. Por lo tanto 
                                esta solicitud será anulada. Sin embargo si a pesar de haber aprobado el 
                                promedio acumulado usted desea iniciar nuevamente sus estudios en el programa 
                                de <%=prog%>, deberá manifestarlo en comunicación escrita firmada por usted 
                                y su acudiente dirigida a la Oficina de Admisiones a más tardar el próximo 
                                21 de julio y enviarla vía fax al Número 6762340. Secretaría General Admisiones 
                                <p>&nbsp;</p>
                                <p> Atentamente, Psi. Nancy Barrero Ramírez Jefe de Admisiones </p>
                            </td>
                        </tr>
                    </table>
                    <%}
                            }
                        }

                    %>


                </div>
            </div>
        </div>
    </body>
</html>
