<%-- 
    Document   : RespuestaReintegro
    Created on : 23/06/2010, 10:43:50 AM
    Author     : lrodriguez
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
            response.setHeader("Cache-Control", "no-cache");
            String mensaje = "Usted no tiene ninguna solicitud de readmisi�n en curso";
            configeci.configuracion confEci = new configeci.configuracion();
            PrintWriter oout = response.getWriter();
            String tipoest = new String();
            String porcentaje = new String();
            String datofecha = new String();
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String pericfes;
            //esta fecha debe ser cambiada en el admin (ENT_DOCUMENTOS) por Nancy cada vez q hace proceso de admisi�n
            String hoy = request.getParameter("iniproceso");
            // String hoy = "28/06/2010";
            Date ini = formatter.parse(hoy);
            String prog = "";
            String duracion = "";
            BDadmisiones bd = new BDadmisiones();
            String docEst = request.getParameter("documento");
            String fecha = request.getParameter("fecha");
            String induccion = request.getParameter("induccion");
            String resta = request.getParameter("resta");
            String periodo = confEci.getPeriodo();
            String comparar = new String();
            String clasifica1 = new String();
            String clasifica2 = new String();
            String clasifica3 = new String();
            String clasifica4 = new String();
            String clasifica5 = new String();
%>

<%Vector estudiante = bd.AdmitidosPregrado(docEst, oout, periodo);%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Admisiones - Respuesta de Admisi�n Reintegro</title>
        <link rel="stylesheet" href="css/comun.css" type="text/css" >
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="RESPUESTA DE ADMISION" />
        </jsp:include>

        <% if ((estudiante.size()) == 0) {%>

        <table width="70%" border="0" cellspacing="0" cellpadding="0" height="20"  class="textoimpremas" align="center">
            <tr>
                <td>
                    <div align="center"><br>
                        No est� autorizado para realizar este proceso, por favor comun�quese al 6683600 opci�n 2 en el men�. </div>
                </td>
            </tr>
        </table>

        <%} else {
             //Algunos estudiantes presentan dos registros en la BD por eso se requiere el for
             for (int k = 0; k < estudiante.size(); k++) {
                 Vector datos = (Vector) estudiante.elementAt(k);

                 // datofecha = new String(datos.elementAt(17).toString());
                 //   Date inicio = formatter.parse(datofecha); %>

        <%Vector asignaturas = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                 String idprog = datos.elementAt(1).toString();
                 // Vector Anotacion = bd.AnotacionBeca(datos.elementAt(6).toString(), periodo, oout);
                 String ReintegroPrimer = bd.ReintegroPrimerS(datos.elementAt(11).toString(), oout);
                 //Si es igual a 1
                                 /*   if (ReintegroPrimer.equals("1")) {
                 ReintegroPrimer = "2";
                 }*/
                 tipoest = (String) datos.elementAt(12);
                 char idtipo = tipoest.charAt(0);
                 // int respuesta = bd.logconsultaadmitidos(datos.elementAt(10).toString(), datos.elementAt(2).toString(), oout);
        %>

        <table width="65%" border="0" cellspacing="0" cellpadding="0"  align="center" class="textoimpremas">

            <!--VALIDACION PARA ADMITIDOS A REINTEGRO-->
            <% if (!datos.elementAt(13).equals("E")) {%>
            <p>
            <center> No est� autorizado para realizar este proceso, por favor comun�quese al 6683600 opci�n 2 en el men�.</center> <br>

            <% } else if (datos.elementAt(13).equals("E") && ReintegroPrimer.equals("0") && (!datos.elementAt(2).equals("-17") && !datos.elementAt(2).equals("-65"))) {
//&& (ini.after(inicio))
                 comparar = (String) datos.elementAt(4);
                 
                 char com1 = comparar.charAt(0);
                 char com2 = comparar.charAt(1);
                 char com3 = comparar.charAt(2);
                 char com4 = comparar.charAt(3);
                    char com5 = comparar.charAt(4);%>
            <% if (com1 == 'B') {
                     clasifica1 = "B�sico";
                 }

                 if (com1 == 'M') {
                     clasifica1 = "Medio";
                 }

                 if (com1 == 'A') {
                     clasifica1 = "Alto";
                 }
            %>

            <% if (com2 == 'B') {
                     clasifica2 = "B�sico";
                 }

                 if (com2 == 'M') {
                     clasifica2 = "Medio";
                 }

                 if (com2 == 'A') {
                     clasifica2 = "Alto";
                 }%>

            <% if (com3 == 'B') {
                     clasifica3 = "B�sico";
                 }

                 if (com3 == 'M') {
                     clasifica3 = "Medio";
                 }

                 if (com3 == 'A') {
                     clasifica3 = "Alto";
                 }%>

            <% if (com4 == 'B') {
                     clasifica4 = "B�sico";
                 }

                 if (com4 == 'M') {
                     clasifica4 = "Medio";
                 }

                 if (com4 == 'A') {
                     clasifica4 = "Alto";
                 }%>

            <% if (com5 == 'B') {
                     clasifica5 = "B�sico";
                 }

                 if (com5 == 'M') {
                     clasifica5 = "Medio";
                 }

                 if (com5 == 'A') {
                     clasifica5 = "Alto";
                 }%>

            <tr>
                <td colspan="3" >&nbsp;</td>
            </tr>
            <%if (datos.elementAt(1).equals("13")) {
                     prog = "INGENIERIA CIVIL";

                 } else if (datos.elementAt(1).equals("14")) {
                     prog = "INGENIERIA ELECTRICA";


                 } else if (datos.elementAt(1).equals("15")) {
                     prog = "INGENIERIA DE SISTEMAS";

                 } else if (datos.elementAt(1).equals("16")) {
                     prog = "INGENIERIA INDUSTRIAL";

                 } else if (datos.elementAt(1).equals("17")) {
                     prog = "INGENIERIA ELECTRONICA";

                 } else if (datos.elementAt(1).equals("18")) {
                     prog = "ECONOMIA";


                 } else if (datos.elementAt(1).equals("19")) {
                     prog = "ADMINISTRACION DE EMPRESAS";

                 } else if (datos.elementAt(1).equals("20")) {
                     prog = "MATEMATICAS";


                 } else if (datos.elementAt(1).equals("260")) {
                     prog = "INGENIERIA MECANICA";

                 }else if (datos.elementAt(1).equals("264")) {
                     prog = "INGENIERIA AMBIENTAL";

                 }%>
            <%pericfes = datos.elementAt(5).toString().substring(2, 7);%>
            <%String annio = datos.elementAt(5).toString().substring(2, 6);%>
            <%String per = datos.elementAt(5).toString().substring(6, 7);%>
            <%Vector puntajes = bd.baseicfes(pericfes, oout);%>
            <tr>
                <td colspan="3" >Estudio de admisi&oacute;n para el programa de <b><%=prog%></b></td>
            </tr>
            <tr>
                <td colspan="3" >&nbsp;</td>
            </tr>
            <tr>
                <td height="19" colspan="4">
                    <p><%=datos.elementAt(0)%></p>
                </td>
            </tr>
            <tr>
                <td colspan="3" >&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" >Estimado estudiante: </td>
            </tr>
            <tr>
                <td colspan="3"> Le informamos que su solicitud de REINTEGRO para el periodo
                    <%=periodo%> ha sido aprobada. Deber� tener en cuenta: Que debe cumplir
                    con las condiciones de permanencia expresadas en el Cap�tulo III, t�tulo
                    tercero del <a href="http://tycho.escuelaing.edu.co/estudiantes/">Reglamento
                        Estudiantil</a> Para el registro de asignaturas de primer semestre se tendra
                    en cuenta la pol�tica de Admisiones vigente para el periodo <%=periodo%>, es decir estas depender�n del nivel de clasificaci�n obtenido
                    por usted en el ex�men de estado as�:
                    <%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("16") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>

                    <table align="center" width="61%" border="0" class="textoimpremas">
                        <tr>
                            <td width="19%">&nbsp;</td>
                            <td width="30%">Nivel B&aacute;sico <br>
                                Puntajes menores a<br>
                            </td>
                            <td width="20%">Nivel Alto<br>
                                Puntajes mayores a</td>
                            <td width="11%">Su puntaje Icfes</td>
                            <td width="20%"> Su clasificaci&oacute;n</td>
                        </tr>
                        <tr>
                            <td width="19%">Matem&aacute;ticas</td>
                            <td width="30%">
                                <div align="center"> <%=puntajes.elementAt(1)%></div>
                            </td>

                            <td width="20%"><%=puntajes.elementAt(2)%></td>

                            <td width="11%"><%=datos.elementAt(6)%> </td>
                            <td width="20%">
                                <div align="center"><%=clasifica1%> </div>
                            </td>
                        </tr>
                        <!--   <tr>
          <td width="33%">Filosof&iacute;a</td>
          <td width="37%">
            <div align="center"><!%=puntajes.elementAt(5)%></div>
          </td>
          <td width="30%"><!%=puntajes.elementAt(6)%></td>
          <td width="30%"><!%=datos.elementAt(7)%></td>
          <td width="30%">
            <div align="center"><!%=clasifica2%></div>
          </td>
                        </tr>-->
                        <tr>
                            <td width="19%">F&iacute;sica</td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(7)%></div>
                            </td>
                            <td width="20%"><%=puntajes.elementAt(8)%></td>
                            <td width="11%"><%=datos.elementAt(8)%></td>
                            <td width="20%">
                                <div align="center"><%=clasifica3%></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="19%">Lenguaje</td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(3)%></div>
                            </td>
                            <td width="20%"><%=puntajes.elementAt(4)%></td>
                            <td width="11%"><%=datos.elementAt(9)%></td>
                            <td width="20%">
                                <div align="center"><%=clasifica4%></div>
                            </td>
                        </tr>
                    </table>
                    <p><b>
                        </b></p>

                    <!--out.println("<b>Matem�ticas: " + estudiante.elementAt(6) + "&nbsp;&nbsp; " + clasifica1 + "</b><br>");
         out.println("<b>F�sica: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(8) + " &nbsp;&nbsp;&nbsp;&nbsp;" + clasifica3 + "</b><br>");
          out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");-->
                    <% } else if (datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19")) {%>
                    <table align="center" width="61%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                        <tr>
                            <td width="19%">&nbsp;</td>
                            <td width="31%">Nivel B&aacute;sico <br>
                                Puntajes menores a<br>
                            </td>
                            <td width="19%">Nivel Alto<br>
                                Puntajes mayores a</td>
                            <td width="12%">Su puntaje Icfes</td>
                            <td width="19%"> Su clasificaci&oacute;n</td>
                        </tr>
                        <tr>
                            <td width="19%">Matem&aacute;ticas</td>
                            <td width="31%">
                                <div align="center"> <%=puntajes.elementAt(1)%></div>
                            </td>

                            <td width="19%"><%=puntajes.elementAt(2)%></td>

                            <td width="12%"><%=datos.elementAt(6)%> </td>
                            <td width="19%">
                                <div align="center"><%=clasifica1%> </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="19%">Filosof&iacute;a</td>
                            <td width="31%">
                                <div align="center"><%=puntajes.elementAt(5)%></div>
                            </td>
                            <td width="19%"><%=puntajes.elementAt(6)%></td>
                            <td width="12%"><%=datos.elementAt(7)%></td>
                            <td width="19%">
                                <div align="center"><%=clasifica2%></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="19%">Lenguaje</td>
                            <td width="31%">
                                <div align="center"><%=puntajes.elementAt(3)%></div>
                            </td>
                            <td width="19%"><%=puntajes.elementAt(4)%></td>
                            <td width="12%"><%=datos.elementAt(9)%></td>
                            <td width="19%">
                                <div align="center"><%=clasifica4%></div>
                            </td>
                        </tr>
                    </table>
                    <!--  out.println("<b>Matem�ticas:&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(6) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica1 + "</b><br>");
          out.println("<b>Filosof�a:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(7) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica2 + "</b><br>");
          out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");-->

                    <%  }%>

                    <p>
                        Los puntajes intermedios corresponden al Nivel Medio.
                        <%Vector planes = bd.Planestud(docEst, oout);%>

                        <% if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                    <p>De acuerdo con la clasificaci�n anterior, adicionalmente para este programa
                        se analiz� el resultado obtenido por usted en al �rea de QU�MICA para
                        efectos del plan de estudios personalizado que la Escuela tiene previsto
                        para usted el cual est� constituido por las asignaturas del plan de estudios
                        ordinario del programa profesional, m�s las asignaturas que se deba cursar
                        del ciclo de fundamentaci�n, considerando estas �ltimas como parte de
                        su proyecto de formaci�n.
                    <p>&nbsp;
                    <table width="71%" align="center" class="textoimpremas">
                        <tr>
                            <td width="17%">
                                <div align="center"></div>
                            </td>
                            <td width="26%">
                                <div align="center"><b>Nivel B&aacute;sico <br>
                                        Puntajes menores a</b></div>
                            </td>
                            <td width="18%">
                                <div align="center"><b>Nivel Alto<br>
                                        Puntajes mayores a</b></div>
                            </td>
                            <td width="18%">
                                <div align="center"><b>Su puntaje Icfes</b></div>
                            </td>
                            <td width="21%">
                                <div align="center"><b>Su clasificaci&oacute;n</b></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="17%">Qu�mica</td>
                            <td width="26%">
                                <div align="center"><%=puntajes.elementAt(9)%></div>
                            </td>
                            <td width="18%"><%=puntajes.elementAt(10)%></td>
                            <td width="18%"><%=datos.elementAt(10)%></td>
                            <td width="21%">
                                <div align="center"><%=clasifica5%></div>
                            </td>
                        </tr>
                    </table>
                    <%} else {%>

                    <p>De acuerdo con la clasificaci�n anterior, la Escuela tiene previsto un
                        plan de estudios personalizado, constituido por las asignaturas del plan
                        de estudios ordinario del programa profesional, m�s las asignaturas que
                        se deba cursar del ciclo de fundamentaci�n, considerando estas �ltimas
                        como parte de su proyecto de formaci�n.
                        <%}%>
                        <%   if (datos.elementAt(1).equals("13")) {%>
                    </p>
                    <p>&nbsp;</p>
                    <p>
                    <p> <a href="http://www.escuelaing.edu.co/programas/ing_civil/imgs/plan_asignaturas.pdf" target="top">

                            VER PLAN ASIGNATURAS </a>
                            <% } else if (datos.elementAt(1).equals("14")) {%>
                        <a href="http://www.escuelaing.edu.co/programas/ing_electrica/asignaturas_electrica.pdf" target="top">
                            VER PLAN ASIGNATURAS </a>
                            <%  } else if (datos.elementAt(1).equals("15")) {%>
                        <a href="http://www.escuelaing.edu.co/programas/carreras/sistemas/asignaturas_sistemas.pdf" target="top">
                            VER PLAN ASIGNATURAS </a>
                            <% } else if (datos.elementAt(1).equals("16")) {%>
                        <a href="http://www.escuelaing.edu.co/programas/carreras/industrial/asignaturas_industrial.pdf" target="top">
                            VER PLAN ASIGNATURAS </a>
                            <% } else if (datos.elementAt(1).equals("17")) {%>
                        <a href="http://www.escuelaing.edu.co/programas/carreras/electronica/asignaturas_electronica.pdf" target="top">
                            VER PLAN ASIGNATURAS </a>
                            <%  } else if (datos.elementAt(1).equals("18")) {%>
                        <a href="http://www.escuelaing.edu.co/programas/carreras/economia/asignaturas_economia.pdf" target="top">
                            VER PLAN ASIGNATURAS </a>
                            <% } else if (datos.elementAt(1).equals("19")) {%>
                        <a href="http://www.escuelaing.edu.co/micrositio/admin/documentos/plan_asignaturas.pdf" target="top">
                            VER PLAN ASIGNATURAS </a>
                            <% } else if (datos.elementAt(1).equals("20")) {%>
                        <a href="http://copernico.escuelaing.edu.co/ceciba/facultad_matematicas/upload/file/PlanMat2010.pdf" target="top">
                            VER PLAN ASIGNATURAS </a>
                            <% } else if (datos.elementAt(1).equals("260")) {%>
                        <a href="http://www.escuelaing.edu.co/programas/ing_mecanica/asignaturas_mecanica.pdf" target="top">
                            VER PLAN ASIGNATURAS </a>
                            <% }%>


                    </p>
                    <p>A usted le corresponde el plan de estudios No <%=planes.elementAt(1)%> y las asignaturas a cursar en el primer semestre dependen
                        del nivel de clasificaci�n obtenido por usted as�:
                    <p>&nbsp;
                    <table width="50%" border="0" align="left" class="textoimpremas">
                        <% if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17")) {%>
                        <tr>
                            <td ><b>Asignaturas a cursar:</b> <br>
                                <%  for (int p = 0; p < asignaturas.size(); p++) {
                                         String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4);

                                         Vector nivelasigna = (Vector) asignaturas.elementAt(p);%>
                                <%String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2));
                                      if (niveles.equals(baseicfes)) {
                                          Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(),nivelasigna.elementAt(16).toString(),nivelasigna.elementAt(17).toString(),nivelasigna.elementAt(18).toString(), oout);%>
                                <%  for (int f = 0; f < nomasigna.size(); f++) {
                                              out.println(((Vector) nomasigna.elementAt(f)).elementAt(0));%>
                                <br>
                                <%}
                                         }
                                     }%>
                            </td>
                        </tr>
                        &nbsp;
                        <%} else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                        <tr>
                            <td> <b>Asignaturas a cursar:</b> <br>
                                <%  for (k = 0; k < asignaturas.size(); k++) {
                                         String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4) + String.valueOf(com5);
                                         Vector nivelasigna = (Vector) asignaturas.elementAt(k);
                                         String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2) + String.valueOf(nivelasigna.elementAt(3)));
                                         if (niveles.equals(baseicfes)) {
                                             Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(),nivelasigna.elementAt(16).toString(),nivelasigna.elementAt(17).toString(),nivelasigna.elementAt(18).toString(), oout);%>
                                <%  for (int f = 0; f < nomasigna.size(); f++) {
                                                 out.println(((Vector) nomasigna.elementAt(f)).elementAt(0));%>
                                <br>
                                <%}
                                         }
                                     }%>
                            </td>
                        </tr>
                        <%} else if (datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19")) {%>
                        <tr>
                            <td> <b>Asignaturas a cursar:</b> <br>
                                <%  for (k = 0; k < asignaturas.size(); k++) {
                                         String niveles = String.valueOf(com1) + String.valueOf(com4);
                                         Vector nivelasigna = (Vector) asignaturas.elementAt(k);
                                         String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(2));
                                         if (niveles.equals(baseicfes)) {
                                             Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(),nivelasigna.elementAt(16).toString(),nivelasigna.elementAt(17).toString(),nivelasigna.elementAt(18).toString(), oout);%>
                                <%  for (int p = 0; p < nomasigna.size(); p++) {
                                                 out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
                                <br>
                                <%}
                                         }
                                     }%>
                            </td>
                        </tr>
                        <% }%>
                    </table>
                    <p>
                </td>
            </tr>
            <tr>
                <td colspan="3"><br>
                    <!-- Para efectos de contar con un elemento adicional con fines espec�ficos de
                    diagn�stico en cada �rea,deber� presentar ex&aacute;menes institucionales
                    el 06 de Enero a partir de las 12:30 PM y el 07 de Enero a partir de las
                    12:30 A.M. y a partir de las 3:00 P.M.en el sal�n  C1-104.
                    <p>Si usted desea verificar las asignaturas que cursar�a en caso de cambiar
                    de nivel en una o varias �reas de inter�s, haga la simulaci�n correspondiente
                    <b><a href="Simulacion?idprog=<!%=datos.elementAt(1)%>" target="top">AQU�.</a>
                    </b>
                    <p> El aspirante admitido que as� lo desee podr� solicitar <b>
                        <a href="ValidaReclasifica?idprog=<!%=datos.elementAt(1)%>&docEst=<!%=docEst%>">
                            AQUI
                        </a>
      su reclasificaci�n a un nivel inferior o superior entre el<B> 21 de diciembre
      de 2009 y el 12 de enero de 2010 </B>(previa autenticaci�n con el nombre
      de usuario(carnet) que le entreguen el d�a que firme su acta de matr�cula).
      La respuesta a esta solicitud ser� proporcionada por el Decano correspondiente
      el 12 de enero de 2010, para lo cual se tendr� en cuenta el resultado obtenido
      por usted en el examen diagn�stico. Para la elaboraci�n de su horario ese
                    mismo d�a se ajustar� la preinscripci�n de asignaturas seg�n sea el caso. -->
                    <p><b>La jornada de inducci�n</b> inicia el <%=induccion%>. All�
                        se le proporcionar� informaci�n espec�fica sobre el programa de <%=prog%>, as� como el <b>procedimiento a seguir para consultar su horario</b>
                        <!-- <p>Para realizar su horario se habilitar&aacute; el sistema a partir del
                        12 de enero de 2010, para lo cual deber� haber firmado su acta de matr�cula
                        momento en el cual le asignar�n una clave de acceso para la opci�n de
                        Servicios Acad�micos de los estudiantes en el portal web de la Escuela.-->
                    <p>&nbsp;
                </td>
            </tr>
            <tr> 
                <td><a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst"><img src="img/orden.gif" width="150" height="40"></a>
                </td>
                <!--  <td><a href="http://www.escuelaing.edu.co/documentos/FormalizacionReintegro.pdf"><img src="img/insformaliza.gif" width="150" height="40"></a>-->
                </td>
            </tr>
            <% } else if (datos.elementAt(13).equals("E") && !ReintegroPrimer.equals("0") && (!datos.elementAt(2).equals("-17") && !datos.elementAt(2).equals("-65"))) {%>
            <!--&& (ini.after(inicio))           -->
            <TR>
                <TD colspan="3">
            <tr>
                <td width="35%" >&nbsp;</td>
            </tr>
            <%if (datos.elementAt(1).equals("13")) {
                     prog = "INGENIERIA CIVIL";

                 } else if (datos.elementAt(1).equals("14")) {
                     prog = "INGENIERIA ELECTRICA";


                 } else if (datos.elementAt(1).equals("15")) {
                     prog = "INGENIERIA DE SISTEMAS";

                 } else if (datos.elementAt(1).equals("16")) {
                     prog = "INGENIERIA INDUSTRIAL";

                 } else if (datos.elementAt(1).equals("17")) {
                     prog = "INGENIERIA ELECTRONICA";

                 } else if (datos.elementAt(1).equals("18")) {
                     prog = "ECONOMIA";


                 } else if (datos.elementAt(1).equals("19")) {
                     prog = "ADMINISTRACION DE EMPRESAS";

                 } else if (datos.elementAt(1).equals("20")) {
                     prog = "MATEMATICAS";


                 } else if (datos.elementAt(1).equals("260")) {
                     prog = "INGENIERIA MECANICA";

                 }%>
            <tr>
                <td colspan="3" >Estudio de admisi&oacute;n para el programa de <b><%=prog%></b></td>
            </tr>
            <tr>
                <td colspan="3" >&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" >
                    <p><%=datos.elementAt(0)%></p>
                </td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" >Estimado estudiante: </td>
            </tr>
            <tr>
                <td colspan="3">
                    <p>Le informamos que su solicitud de REINTEGRO para el periodo <%=periodo%> ha sido aprobada.
                    </p>
                    <br>
                    <p>Deber� tener en cuenta: </p>
                    <p>1. Que debe cumplir con las condiciones de permanencia expresadas en
                        el Cap�tulo III, t�tulo tercero del<a href="http://tycho.escuelaing.edu.co/estudiantes/">
                            Reglamento Estudiantil </a> </p>
                    <br>
                    <p>2. Verifique el plan de estudios que le corresponde  antes de la elaboraci�n de su horario. En caso que se le haya modificado
                        su plan de estudios y tenga alguna inquietud en relaci�n con las homologaciones
                        correspondientes debera consultar con su Decano el dia de su turno en la semana de registro de horarios.

                    </p>
                    <p>
                        Las instrucciones para imprimir su orden de pago de los derechos de matr�cula lo puede consultar
                        en Servicios a Estudiantes, en el link de Noticias.</p>
                    <p>  La consulta de la orden de matr�cula la puede realizar a partir de las 6:00 p.m.
                        <br>
                    </p>
                    <p>Le deseamos �xitos en el desarrollo de sus estudios. </p>
                    <br>
                </TD>
            </TR>
        </table>
        <p>&nbsp;</p>
        <table width="70%" border="0" align="center" textoimpremas>
            <tr>
                <td width="53%">
                    <div align="center"><a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst"><img src="img/orden.gif" width="150" height="40"></a></div>
                </td>
                <!-- <td width="47%"><a href="http://www.escuelaing.edu.co/documentos/FormalizacionReintegro.pdf"><img src="img/insformaliza.gif" width="150" height="40"></a></td>-->
            </tr>
            <tr>
                <td width="53%">
                    <div align="center">
                        <p></p>
                        <p>&nbsp;
                        <p><em>Secretar&iacute;a General - Admisiones </em>
                    </div>
                </td>
            </tr>
        </table>


        <%} else if (datos.elementAt(13).equals("E") && (datos.elementAt(2).equals("-17"))) {%>
        <!--&& (ini.after(inicio))-->

        <table width="50%" border="0" align="center" class="textoimpremas">
            <tr>
                <td>&nbsp;</td>
            </tr>

            <%if (datos.elementAt(1).equals("13")) {
                     prog = "INGENIERIA CIVIL";

                 } else if (datos.elementAt(1).equals("14")) {
                     prog = "INGENIERIA ELECTRICA";


                 } else if (datos.elementAt(1).equals("15")) {
                     prog = "INGENIERIA DE SISTEMAS";

                 } else if (datos.elementAt(1).equals("16")) {
                     prog = "INGENIERIA INDUSTRIAL";

                 } else if (datos.elementAt(1).equals("17")) {
                     prog = "INGENIERIA ELECTRONICA";

                 } else if (datos.elementAt(1).equals("18")) {
                     prog = "ECONOMIA";


                 } else if (datos.elementAt(1).equals("19")) {
                     prog = "ADMINISTRACION DE EMPRESAS";

                 } else if (datos.elementAt(1).equals("20")) {
                     prog = "MATEMATICAS";


                 } else if (datos.elementAt(1).equals("260")) {
                     prog = "INGENIERIA MECANICA";

                 }%>
            <tr>
                <td >Estudio de admisi&oacute;n para el programa de <b><%=prog%></b></td>
            </tr>
            <tr>
                <td >&nbsp;</td>
            </tr>
            <tr>
                <td >
                    <p><%=datos.elementAt(0)%></p>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td >Estimado estudiante: </td>
            </tr>
            <tr>
                <td>Una vez estudiada su solicitud y los argumentos expuestos por usted, el
                    Comit&eacute; de Admisiones de la ESCUELA COLOMBIANA DE INGENIERIA JULIO
                    GARAVITO, conceptu&oacute; no aceptar su solicitud de Reintegro para continuar
                    en el programa <%=prog%> en el per&iacute;odo <%=periodo%>, despu&eacute;s de haberse
                    ausentado de la Escuela por m&aacute;s de tres per&iacute;odos acad&eacute;micos
                    consecutivos, tiempo m&aacute;ximo permitido para suspender estudios voluntariamente
                    de acuerdo con lo estipulado en el Reglamento Estudiantil.<br>
                    <br>
                    <br>
                    Esperamos que esta decisi&oacute;n no influya en su deseo de superaci&oacute;n
                    y se proyecte otras metas acordes con su situaci&oacute;n personal actual.
                    <p></p>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><em>Secretar&iacute;a General - Admisiones </em> </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
        <% } else if (datos.elementAt(13).equals("E") && (datos.elementAt(2).equals("-65"))) {%>
        <!--&& (ini.after(inicio))-->
        <table width="50%" border="0" align="center" class="textoimpremas">
            <tr>
                <td>&nbsp;</td>
            </tr>

            <%if (datos.elementAt(1).equals("13")) {
                     prog = "INGENIERIA CIVIL";

                 } else if (datos.elementAt(1).equals("14")) {
                     prog = "INGENIERIA ELECTRICA";


                 } else if (datos.elementAt(1).equals("15")) {
                     prog = "INGENIERIA DE SISTEMAS";

                 } else if (datos.elementAt(1).equals("16")) {
                     prog = "INGENIERIA INDUSTRIAL";

                 } else if (datos.elementAt(1).equals("17")) {
                     prog = "INGENIERIA ELECTRONICA";

                 } else if (datos.elementAt(1).equals("18")) {
                     prog = "ECONOMIA";

                 } else if (datos.elementAt(1).equals("19")) {
                     prog = "ADMINISTRACION DE EMPRESAS";

                 } else if (datos.elementAt(1).equals("20")) {
                     prog = "MATEMATICAS";


                 } else if (datos.elementAt(1).equals("260")) {
                     prog = "INGENIERIA MECANICA";

                 }%>
            <tr>
                <td >Estudio de admisi&oacute;n para el programa de <b><%=prog%></b></td>
            </tr>
            <tr>
                <td >&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <p><%=datos.elementAt(0)%></p>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td >Estimado estudiante: </td>
            </tr>
            <tr>
                <td>Dado que usted suspendi� estudios voluntariamente por un lapso mayor
                    a tres per�odos acad�micos consecutivos, <b>y si usted present� la correspondiente justificaci�n
                        de su ausencia en la Oficina de Admisiones,</b> su solicitud de
                    reintegro para el <%=periodo%>, a�n se encuentra en tr�mite. Si no la present� su solicitud ser� rechazada.
                    Una vez el Comit� de Admisiones estudie su caso, la Oficina de Admisiones
                    se comunicar� con usted para informarle la respuesta correspondiente.
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><em>Secretar&iacute;a General - Admisiones </em> </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
        <%} else {%>
        <p>
        <center>
            Consulte la respuesta a solicitud el <%=resta%>.</center

        <%}

                        }
                    }
        %>

        <p>&nbsp;</p>
    </body>
</html>

