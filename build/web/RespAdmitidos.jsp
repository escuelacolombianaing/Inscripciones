<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
        String docEst = request.getParameter("documento");
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        String prog = new String();
        String idprog = new String();
        String link = new String();
        String fecha = new String();
        String comparar = new String();
        String tipoest = new String();
        String clasifica1 = new String();
        String clasifica2 = new String();
        String clasifica3 = new String();
        String clasifica4 = new String();
        String clasifica5 = new String();
        String pericfes;
        int ban = 0;
        configeci.configuracion confEci = new configeci.configuracion();
        if (docEst != null && !docEst.equals("")) {
%>

<html>
    <head>
        <title>Admitidos Pregrado</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">

    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="ASPIRANTES A PRIMER SEMESTRE " />
        </jsp:include>

        <%Vector estudiante = bd.Admitidos(docEst, confEci.getPeriodo(), oout);%>

        <%if ((estudiante.size()) == 0) {%>

        <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
            <tr>
                <td>
                    <b>Su documento es incorrecto o usted no ha diligenciado la
                        solicitud de admisión. Verifique e intente nuevamente o comuníquese al 6683600 opción 2 en el menú.</b>

                </td>
            </tr>
        </table>

        <%} else {
    Vector asignaturas = bd.Niveles(estudiante.elementAt(1).toString(), confEci.getPeriodo(), oout);
    idprog = estudiante.elementAt(1).toString();
    int respuesta = bd.logconsultaadmitidos(estudiante.elementAt(10).toString(), estudiante.elementAt(2).toString(), oout);
    if (estudiante.elementAt(1).equals("13")) {
        prog = "INGENIERIA CIVIL";
        fecha = "Jueves 29 de Octubre  en el Aula Máxima , Bloque C, primer piso.";
    } else if (estudiante.elementAt(1).equals("14")) {
        prog = "INGENIERIA ELECTRICA";
        fecha = "Miércoles 28 de Octubre a las 10:00 am en el Aula Máxima , Bloque C, primer piso.";
    } else if (estudiante.elementAt(1).equals("15")) {
        prog = "INGENIERIA DE SISTEMAS";
        fecha = "Miércoles 28 de Octubre a las 7:30 am en el Aula Máxima , Bloque C, primer piso.";%>
        <%} else if (estudiante.elementAt(1).equals("16")) {
            prog = "INGENIERIA INDUSTRIAL";
            fecha = "Viernes 30 de octubre  en el Aula Máxima , Bloque C, primer piso";
        %>
        <%} else if (estudiante.elementAt(1).equals("17")) {
            prog = "INGENIERIA ELECTRONICA";
            fecha = "Miércoles 28 de Octubre a las 2:00 pm en el Aula Máxima, Bloque C, primer piso.";%>
        <% } else if (estudiante.elementAt(1).equals("18")) {
            prog = "ECONOMIA";
            fecha = "Miércoles 28 de Octubre a las 9:00 am en la sala de Estudio, Bloque C, segundo piso.";%>
        <%} else if (estudiante.elementAt(1).equals("19")) {
            prog = "ADMINISTRACION DE EMPRESAS";
            fecha = "Viernes 30 de Octubre a las 9:00 am en el salón A-105, Bloque A primer piso.";%>
        <%} else if (estudiante.elementAt(1).equals("20")) {
            prog = "MATEMATICAS";
            fecha = "Miércoles 28 de Octubre a las 11:00 am en el salón A-105, Bloque A primer piso.";%>
        <%} else if (estudiante.elementAt(1).equals("260")) {
            prog = "INGENIERIA MECANICA";
            fecha = "Jueves 29 de Octubre A LAS 2:00 p.m en el Aula Máxima, Bloque C, primer piso";
        }%>

        <%comparar = (String) estudiante.elementAt(4);%>

        <% char com1 = comparar.charAt(0);
    char com2 = comparar.charAt(1);
    char com3 = comparar.charAt(2);
    char com4 = comparar.charAt(3);
    char com5 = comparar.charAt(4);%>

        <% if (com1 == 'B') {
        clasifica1 = "Básico";
    }

    if (com1 == 'M') {
        clasifica1 = "Medio";
    }

    if (com1 == 'A') {
        clasifica1 = "Alto";
    }
        %>

        <% if (com2 == 'B') {
        clasifica2 = "Básico";
    }

    if (com2 == 'M') {
        clasifica2 = "Medio";
    }

    if (com2 == 'A') {
        clasifica2 = "Alto";
    }
        %>

        <% if (com3 == 'B') {
        clasifica3 = "Básico";
    }

    if (com3 == 'M') {
        clasifica3 = "Medio";
    }

    if (com3 == 'A') {
        clasifica3 = "Alto";
    }
        %>

        <% if (com4 == 'B') {
        clasifica4 = "Básico";
    }

    if (com4 == 'M') {
        clasifica4 = "Medio";
    }

    if (com4 == 'A') {
        clasifica4 = "Alto";
    }
        %>

        <% if (com5 == 'B') {
        clasifica5 = "Básico";
    }

    if (com5 == 'M') {
        clasifica5 = "Medio";
    }

    if (com5 == 'A') {
        clasifica5 = "Alto";
    }
        %>

        <%  if ((estudiante.elementAt(2).equals("-60") || estudiante.elementAt(2).equals("60")) && ban == 0) {%>
        <table width="701" border="0" cellspacing="0" cellpadding="0" height="431"  align="center"  class="textoimpremas">
            <tr>
                <td height="12"><b><i>Nombre: <%=estudiante.elementAt(0)%></i></b></td>
            </tr>
            <tr>
                <td height="12"><b><i>Usted fué admitido al programa: <%=prog%></i></b></td>
            </tr>
            <tr>
                <td valign="top" height="12">&nbsp;</td>
            </tr>
            <tr>
                <td height="369" valign="top">
                    <p>En nombre de la Escuela Colombiana de Ingenier&iacute;a Julio Garavito,
                        nos es grato comunicarle que su solicitud de admisi&oacute;n para iniciar
                        actividades acad&eacute;micas a partir del <b>primer semestre del año
                        2010</b>, ha sido aprobada. Usted har&aacute; parte de la comunidad acad&eacute;mica
                        de una de las Instituciones de Educaci&oacute;n Superior con mayor prestigio
                    Nacional e Internacional. </p>
                    <p>Para la admisi&oacute;n se analizaron los puntajes obtenidos por usted
                        en el ex&aacute;men de Estado que present&oacute; con el N&uacute;mero de Registro
                        <%=estudiante.elementAt(5)%> quedando ubicado en uno de tres niveles en
                        el &aacute;rea correspondiente seg&uacute;n sea el caso: B&aacute;sico,
                    intermedio o Alto.</p>
                    <p>El puntaje de corte correspondiente a cada nivel, se determin&oacute;
                        seg&uacute;n los resultados generales de todos los examinados en Bogot&aacute;,
                        seg&uacute;n la fecha de presentaci&oacute;n en que usted present&oacute;
                    el examen de Estado.</p>
                    <%
      pericfes = estudiante.elementAt(5).toString().substring(2, 7);%>
                    <%String annio = estudiante.elementAt(5).toString().substring(2, 6);%>
                    <%String per = estudiante.elementAt(5).toString().substring(6, 7);%>
                    <p>Para el a&ntilde;o <%=annio%> per&iacute;odo <%=per%>, en que usted present&oacute;
                    este examen, los puntajes de corte fueron:</p>
                    <p>&nbsp;</p>

                    <%Vector puntajes = bd.baseicfes(pericfes, oout);%>
                    <table align="center" width="61%" border="0" class="textoimpremas">
                        <tr>
                            <td width="33%">&nbsp;</td>
                            <td width="37%">Nivel B&aacute;sico <br>
                                Puntajes menores a<br>
                            </td>
                            <td width="30%">Nivel Alto<br>
                                Puntajes mayores a<br>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">Matem&aacute;ticas</td>
                            <td width="37%">
                                <div align="center"> <%=puntajes.elementAt(1)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(2)%></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">Filosof&iacute;a</td>
                            <td width="37%">
                                <div align="center"><%=puntajes.elementAt(5)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(6)%></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">F&iacute;sica</td>
                            <td width="37%">
                                <div align="center"><%=puntajes.elementAt(7)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(8)%></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">Lenguaje</td>
                            <td width="37%">
                                <div align="center"><%=puntajes.elementAt(3)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(4)%></div>
                            </td>
                        </tr>
                    </table>
                    <p><b>
                            Los puntajes intermedios corresponden al Nivel Medio.
                    </b></p>
                    <p>De acuerdo con el resultado obtenido en las &aacute;reas de inter&eacute;s
                    del Examen de Estado, usted qued&oacute; clasificado as&iacute;:</p>
                    <b>CLASIFICACION ACTUAL</b>
                    <p>
                        <%if (estudiante.elementAt(1).equals("13") || estudiante.elementAt(1).equals("14") || estudiante.elementAt(1).equals("15") || estudiante.elementAt(1).equals("17")) {
          out.println("<b>Matemáticas: " + estudiante.elementAt(6) + "&nbsp;&nbsp; " + clasifica1 + "</b><br>");
          out.println("<b>Física: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(8) + " &nbsp;&nbsp;&nbsp;&nbsp;" + clasifica3 + "</b><br>");
          out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");

      } else if (estudiante.elementAt(1).equals("18") || estudiante.elementAt(1).equals("19")) {

          out.println("<b>Matemáticas:&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(6) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica1 + "</b><br>");
          out.println("<b>Filosofía:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(7) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica2 + "</b><br>");
          out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");

      } else if (estudiante.elementAt(1).equals("16") || estudiante.elementAt(1).equals("20") || estudiante.elementAt(1).equals("260")) {
          out.println("<b>Matemáticas: " + estudiante.elementAt(6) + "&nbsp;&nbsp; " + clasifica1 + "</b><br>");
          out.println("<b>Física: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(8) + " &nbsp;&nbsp;&nbsp;&nbsp;" + clasifica3 + "</b><br>");
          out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");
          out.println("<b>Química:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(11) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica5 + "</b><br>");
      }%>

                        <%Vector planes = bd.Planestud(docEst, oout);%>
                    </p>

                    <p>A usted le corresponde el plan de estudios No <%=planes.elementAt(1)%> y las asignaturas a cursar en el primer semestre dependen
                    del nivel de clasificación obtenido por usted así:
                    <p>&nbsp;
                    <table width="50%" border="0" align="left" class="textoimpremas">

                        <% if (estudiante.elementAt(1).equals("13") || estudiante.elementAt(1).equals("14") || estudiante.elementAt(1).equals("15") || estudiante.elementAt(1).equals("17")) {%>


                        <tr>
                            <td ><b>Asignaturas a cursar:</b>
                                <br>
                                <%  for (int k = 0; k < asignaturas.size(); k++) {
         String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4);
         Vector nivelasigna = (Vector) asignaturas.elementAt(k);
         String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2));
         if (niveles.equals(baseicfes)) {
             Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
                                <%  for (int p = 0; p < nomasigna.size(); p++) {
                                        out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%> <br>
                                <%}
         }
     }%>
                            </td>
                        </tr>
                        &nbsp;
                        <%} else if (estudiante.elementAt(1).equals("16") || estudiante.elementAt(1).equals("20") || estudiante.elementAt(1).equals("260")) {%>

                        <tr>
                            <td colspan="2"> <b>Asignaturas a cursar:</b>
                                <br>
                                <%  for (int k = 0; k < asignaturas.size(); k++) {
         String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4) + String.valueOf(com5);
         Vector nivelasigna = (Vector) asignaturas.elementAt(k);
         String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2) + String.valueOf(nivelasigna.elementAt(3)));
         if (niveles.equals(baseicfes)) {
             Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
                                <%  for (int p = 0; p < nomasigna.size(); p++) {
                                        out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%> <br>
                                <%}
         }
     }%>
                            </td>
                        </tr>
                        <%} else if (estudiante.elementAt(1).equals("18") || estudiante.elementAt(1).equals("19")) {%>

                        <tr>
                            <td> <b>Asignaturas a cursar:</b>
                                <br>
                                <%  for (int k = 0; k < asignaturas.size(); k++) {
         String niveles = String.valueOf(com1) + String.valueOf(com4);
         Vector nivelasigna = (Vector) asignaturas.elementAt(k);
         String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(2));
         if (niveles.equals(baseicfes)) {
             Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
                                <%  for (int p = 0; p < nomasigna.size(); p++) {
                                        out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%> <br>
                                <%}
         }
     }%>
                            </td>
                        </tr>

                        <% }
                        %>

                    </table>
                    <p>
                </td>
            </tr>
            <tr>
                <td>
                    <br> Para efectos de contar con un elemento adicional con fines específicos
                    de diagnóstico en cada área, todos los estudiantes admitidos deben presentar
                    ex&aacute;menes institucionales entre el 18 y el 19 de Diciembre.
                    <b> <br> <!--El 11 de diciembre a partir de las 2:00 pm
                        usted deberá consultar en este mismo sitio la fecha y hora de presentación de los mismos.--><a href="Citacion">CONSULTE AQUI
                        la fecha y hora de presentación de los EXÁMENES DE DIAGNÓSTICO</a>
                    </b>
                    <p>Si usted desea verificar las asignaturas que cursaría en caso de cambiar
                    de nivel en una o varias áreas de interés, haga la simulación correspondiente
                    <b><a href="Simulacion?idprog=<%=estudiante.elementAt(1)%>" target="top">AQUÍ.</a> </b>
                    <p> El aspirante admitido que así lo desee podrá solicitar <b><!--a href="ValidaReclasifica?idprog=<!%=estudiante.elementAt(1)%>&docEst=<!%=docEst%>">AQUI<!---</a>--></b>
                    su reclasificación a un nivel inferior o superior entre el<B> 21 de diciembre
                    de 2009 y el 12 de enero de 2010 </B>(previa autenticación con el nombre de
                    usuario(carnet) que le entreguen el día que firme su acta de matrícula).
                    La respuesta a esta solicitud será proporcionada por el Decano correspondiente
                    el 12 de enero de 2010, para lo cual se tendrá en cuenta el resultado
                    obtenido por usted en el examen diagnóstico. Para la elaboración de su
                    horario ese mismo día se ajustará la preinscripción de asignaturas según
                    sea el caso.

                    <p><b>La jornada de inducción</b> inicia el ****<!%=induccion%>. Allí se le proporcionará
                    información específica sobre el programa de <%=prog%>, así como el <b>procedimiento a seguir para elaborar
                    su horario</b>
                    <p>Para realizar su horario se habilitar&aacute; el sistema a partir del
                    12 de enero de 2010, para lo cual deberá haber firmado su acta de matrícula momento en el cual le asignarán
                    una clave de acceso para la opci ón de Servicios Académicos de los estudiantes en el portal web de
                    la Escuela.
                    <p>Actualmente se est&aacute;n realizando los estudios socioecon&oacute;micos
                    del grupo familiar de cada aspirante para determinar el valor espec&iacute;fico
                    de su matr&iacute;cula.
                    <!--Para inscripciones normales.  Se comentariza cuando comienzan las extemporaneas-->
                    <!%if (estudiante.elementAt(1).equals("16")) {%>
                    <!--  Por todo lo anterior, los  Directivos de la Institución le invitan a una reuni&oacute;n a usted y a su acudiente
                        el d&iacute;a Viernes 30 de Octubre en el Aula Máxima Bloque C, primer piso.

                        Para apellidos del aspirante que estén <font color="#0000FF">entre las letras A-F  </font>la
                        reunión será <font color="#0000FF">a las 7:30 a.m</font>

                        Para los apellidos que estén <font color="#0000FF">entre las letras
                            G-O</font> la reunión será  <font color="#0000FF">a las 10:00 a.m </font>
                        Para los apellidos que estén <font color="#0000FF">entre las letras
                            P-Z</font> la reunión será  <font color="#0000FF">a las 2:00 p.m </font>
                        Una vez finalizada esta reuni&oacute;n se le entregar&aacute; el
                        recibo de pago correspondiente a los derechos de matr&iacute;cula.-->
                    <!--Después del encuentro de padres solicitan cambiar por este mensaje-->
                    El recibo de pago correspondiente a los derechos de matr&iacute;cula y
                    las instrucciones necesarias para formalizar la misma (documentos requeridos
                    y procedimiento a seguir), los puede reclamar el jueves 17 de Diciembre de
                    2009, de 2:00 p.m a 5 p.m. en la Oficina de Apoyo Financiero, primer piso,
                    Bloque A.
                    <!--    Por todo lo anterior, los </i> <font size="3" color="#000000"><i> Directivos
                            de la Institución le invitan a una reuni&oacute;n a usted y a su acudiente
                            <b>el d&iacute;a Viernes 31 de Octubre en el Aula Máxima Bloque C, primer
                            piso. Para apellidos del aspirante que estén <font color="#0000FF">entre
                            las letras A-O </font>la reunión será <font color="#0000FF">a las 7:30 a.m</font>
                        .</font> Para los apellidos que estén <font color="#0000FF">entre las letras
                        P-Z</font> la reunión será el <font color="#0000FF">a las 10:00 a.m </font>
                        </b>.Una vez finalizada esta reuni&oacute;n se le entregar&aacute; <b>e</b></i></font><i><b><font size="3" color="#000000">l
                                    recibo de pago correspondiente a los derechos de matr&iacute;cula y las
                            instrucciones necesarias para formalizar la misma</font></b><font size="3" color="#000000">
                        (documentos requeridos y procedimiento a seguir).</font></i></p>-->
                    <!%} else if (estudiante.elementAt(1).equals("13")) {%>
                    <!-- Por todo lo anterior, los  Directivos de la Institución le invitan a una reuni&oacute;n a usted y a su acudiente
                        el d&iacute;a Jueves 29 de Octubre en el Aula Máxima Bloque C, primer piso.

                        Para apellidos del aspirante que estén <font color="#0000FF">entre las letras A-J  </font>la
                        reunión será <font color="#0000FF">a las 7:30 a.m</font>

                        Para los apellidos que estén <font color="#0000FF">entre las letras
                            K-Z</font> la reunión será  <font color="#0000FF">a las 10:00 a.m </font>

                        Una vez finalizada esta reuni&oacute;n se le entregar&aacute; el
                        recibo de pago correspondiente a los derechos de matr&iacute;cula. -->
                        <!--Después del encuentro de padres solicitan cambiar por este mensaje-->
                        <!--El recibo de pago correspondiente a los derechos de matr&iacute;cula y
                        las instrucciones necesarias para formalizar la misma (documentos requeridos
                        y procedimiento a seguir), los puede reclamar el Martes 28 de Julio de
                        2009, de 2:00 p.m a 5 p.m. en la Oficina de Apoyo Financiero, primer piso,
                        Bloque A. -->
                        <!--    Por todo lo anterior, los </i> <font size="3" color="#000000"><i> Directivos
                            de la Institución le invitan a una reuni&oacute;n a usted y a su acudiente
                            <b>el d&iacute;a Viernes 31 de Octubre en el Aula Máxima Bloque C, primer
                            piso. Para apellidos del aspirante que estén <font color="#0000FF">entre
                            las letras A-O </font>la reunión será <font color="#0000FF">a las 7:30 a.m</font>
                        .</font> Para los apellidos que estén <font color="#0000FF">entre las letras
                        P-Z</font> la reunión será el <font color="#0000FF">a las 10:00 a.m </font>
                        </b>.Una vez finalizada esta reuni&oacute;n se le entregar&aacute; <b>e</b></i></font><i><b><font size="3" color="#000000">l
                                    recibo de pago correspondiente a los derechos de matr&iacute;cula y las
                            instrucciones necesarias para formalizar la misma</font></b><font size="3" color="#000000">
                        (documentos requeridos y procedimiento a seguir).</font></i></p>-->
                    <!%} else {%>
                    <!--Este mensaje es para las inscripciones normales-->
                       <!-- Por todo lo anterior, los Directivos de la Escuela Colombiana de Ingeniería
                        le invitan a una reuni&oacute;n a usted y a su acudiente <b>el d&iacute;a
                            <!%=fecha%>
                        </b>. Una vez finalizada esta reuni&oacute;n se le entregar&aacute; <b>e</b><b>l
                            recibo de pago correspondiente a los derechos de matr&iacute;cula .</b></p>
                    Si usted ya reclamó la orden de matrícula, haga caso omiso a este mensaje.-->
                </td>
            </tr>
            <!%=fecha%>
            <!%}%>
        </table>
        <p>&nbsp;</p><table width="70%" border="0" align="center" textoimpremas>
            <tr>
                <td width="39%">
                    <div align="center"><a href="InstruccionesPS"><img src="img/inshorario.gif" width="150" height="40"></a></div>
                </td>

                <td width="32%"><a href="http://www.escuelaing.edu.co/documentos/FormalizacionesPS20101.pdf"><img src="img/insformaliza.gif" width="150" height="40"></a></td>

               <!-- <td width="29%"><a href="Guias?idprog=<%=idprog%>"><img src="img/guiasexamen.gif" width="150" height="40"></a></td>-->
            </tr>
            <!--  <tr>
          <td width="49%">
            <div align="center"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="150" height="60">
                <param name="movie" value="boton1.swf">
                <param name="quality" value="high">
                <embed src="boton1.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="150" height="60">
                </embed>
              </object></div>
          </td>
          <td width="51%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="150" height="60">
              <param name="movie" value="boton2.swf">
              <param name="quality" value="high">
              <embed src="boton2.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="150" height="60">
              </embed>
    </object></td>-->
            <tr>
                <td width="39%">
                    <div align="center">
                        <p></p>
                        <p>&nbsp;
                        <p><em>Secretar&iacute;a General - Admisiones </em>
                    </div>
                </td>
            </tr>
        </table>


        <%}%>

        <%ban = 1;

    if (estudiante.elementAt(2).equals("-83") || estudiante.elementAt(2).equals("-80")) {%>
        <br>

        <table width="702" border="0" cellspacing="0" cellpadding="0" align="center" class="textoimpremas">
            <tr>

                <td><b>Nombre: <%=estudiante.elementAt(0)%></b> <br>
                    <b>Programa academico: <%=prog%></b>
                    <p><b><i>Apreciado aspirante:</i></b>
                    <p><i><b>Usted no ha formalizado su inscripción, debe entregar la documentación
                            correspondiente en las fechas señaladas. Favor comuníquese al 6683600 opción 2 en el menú.</b> </i>
                </td>
            </tr>
        </table>
        <%}
    if (estudiante.elementAt(2).equals("-85")) {%>
        <br>

        <table width="707" border="0" cellspacing="0" cellpadding="0" align="center" class="textoimpremas">
            <tr>

                <td><b>Nombre: <%=estudiante.elementAt(0)%></b>
                    <br>
                    <b>Programa academico: <%=prog%></b>
                    <p><b><i>Apreciado aspirante:</i></b>
                    <p><i><b>Usted no ha diligenciado su formulario de solicitud de admisión.
                            <font size="3">Por favor comuníquese al 6683600 opción 2 en el menú.</font></b> </i>
                </td>
            </tr>
        </table>


        <%}
    if (estudiante.elementAt(2).equals("-70")) {%>
        <br>

        <table width="707" border="0" cellspacing="0" cellpadding="0" align="center" class="textoimpremas" >
            <tr>

                <td><b><i>Nombre: <%=estudiante.elementAt(0)%></i></b> <i><br>
                        <b>Programa académico: <%=prog%></b>
                        <!--este if  es para matemáticas cuando no hay estudiantes -->
                        <!%if (estudiante.elementAt(1).equals("20")){%>
                    </i>
                    <!--  <p><i><b>Su solicitud de admisión est&aacute; en estudio.</b> Por tal motivo
        le invitamos a usted y su acudiente a una reuni&oacute;n con el Director
        del Departamento de Ciencias B&aacute;sicas, Ing. Eduardo Silva, el pr&oacute;ximo
        <b>Miércoles 1 de Noviembre a las 11:00 am en el Salón D- 206, Bloque
        D, segundo piso</b>. </i>
      <p><i>Esperamos su puntual asistencia. </i>
      <p><i>Cordialmente <br>
        Dirección de Ciencias Básicas. </b> </i>
      <p><i><b><font size="3">Para mayor información por favor comuníquese con
        la Oficina de Admisiones. <br>
        <br>
                    Tel&eacute;fono: 6683600 Ext: 263-274-101 </font></b> -->
                    <!%} else {%>

                    <p><i>Apreciado aspirante: </i>
                    <p>Para la admisi&oacute;n se analizaron los puntajes obtenidos por usted
                    en el examen de Estado que present&oacute; con el N&uacute;mero de Registro
                    <%=estudiante.elementAt(5)%> quedando ubicado en uno de tres niveles en
                    el &aacute;rea correspondiente seg&uacute;n sea el caso: B&aacute;sico,
                    intermedio o Alto.
                    <p>El puntaje de corte correspondiente a cada nivel, se determin&oacute;
                        seg&uacute;n los resultados generales de todos los examinados en Bogot&aacute;,
                        seg&uacute;n la fecha de presentaci&oacute;n en que usted present&oacute;
                    el examen de Estado.</p>
                    <%
            pericfes = estudiante.elementAt(5).toString().substring(2, 7);%>

                    <%String annio = estudiante.elementAt(5).toString().substring(2, 6);%>
                    <%String per = estudiante.elementAt(5).toString().substring(6, 7);%>
                    <p>Para el a&ntilde;o <%=annio%> per&iacute;odo <%=per%>, en que usted present&oacute;
                    este examen, los puntajes de corte fueron:</p>
                    <p>&nbsp;</p>
                    <%Vector puntajes = bd.baseicfes(pericfes, oout);%>
                    <table align="center" width="61%" border="0" class="textoimpremas">
                        <tr>
                            <td width="33%">&nbsp;</td>
                            <td width="37%">Nivel B&aacute;sico <br>
                                Puntajes menores a<br>
                            </td>
                            <td width="30%">Nivel Alto<br>
                                Puntajes mayores a<br>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">Matem&aacute;ticas</td>
                            <td width="37%">
                                <div align="center"> <%=puntajes.elementAt(1)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(2)%></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">Filosof&iacute;a</td>
                            <td width="37%">
                                <div align="center"><%=puntajes.elementAt(5)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(6)%></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">F&iacute;sica</td>
                            <td width="37%">
                                <div align="center"><%=puntajes.elementAt(7)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(8)%></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">Lenguaje</td>
                            <td width="37%">
                                <div align="center"><%=puntajes.elementAt(3)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(4)%></div>
                            </td>
                        </tr>
                    </table>

                    <p align="center"><b>Los puntajes intermedios corresponden al Nivel Medio.</b></p>

                    <p>Lamentamos que en esta oportunidad no haya sido aceptada su solicitud
                    de admisi&oacute;n bien sea por haber quedado clasificado al menos en
                    dos &aacute;reas de inter&eacute;s en nivel b&aacute;sico, siendo una de ellas matemáticas, o bien sea por
                    no cumplir con los requisitos m&iacute;nimos exigidos en las &aacute;reas
                    de inter&eacute;s (puntajes inferiores a 35 en el Examen de Estado).
                    <p>De acuerdo con el resultado obtenido por usted en las &aacute;reas de
                    inter&eacute;s del Examen de Estado, qued&oacute; clasificado as&iacute;:</p>
                    <p></p>
                    <p>
                    <%if (estudiante.elementAt(1).equals("13") || estudiante.elementAt(1).equals("14") || estudiante.elementAt(1).equals("15") || estudiante.elementAt(1).equals("16") || estudiante.elementAt(1).equals("17") || estudiante.elementAt(1).equals("20") || estudiante.elementAt(1).equals("260")) {
                out.println("<b>Matemáticas: " + estudiante.elementAt(6) + "&nbsp;&nbsp; " + clasifica1 + "</b><br>");
                out.println("<b>Física:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(8) + " &nbsp;&nbsp;&nbsp;&nbsp;" + clasifica3 + "</b><br>");
                out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");

            } else if (estudiante.elementAt(1).equals("18") || estudiante.elementAt(1).equals("19")) {
                out.println("<b>Matemáticas:&nbsp;&nbsp;" + estudiante.elementAt(6) + "&nbsp;" + clasifica1 + "</b><br>");
                out.println("<b>Filosofía:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(7) + "&nbsp;&nbsp;" + clasifica2 + "</b><br>");
                out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;" + clasifica4 + "</b><br>");
            }%>
                    <p>No obstante lo anterior, le agradecemos que haya escogido a la Escuela
                    como una opci&oacute;n para adelantar sus estudios de pregrado y esperamos
                    que haya una pr&oacute;xima oportunidad para contar con usted como miembro
                    de nuestra comunidad acad&eacute;mica. Si desea mayor informaci&oacute;n
                    al respecto por favor comun&iacute;quese con la Oficina de Admisiones.
                    <p></p>
                    <p><em>Secretar&iacute;a General - Admisiones </em>
                    <p><i>
                            <!%}%>
                    </i> </p>
                </td>
            </tr>
        </table>
        <%}
    if (estudiante.elementAt(2).equals("-80")) {%>
        <br>

        <table width="710" border="0" cellspacing="0" cellpadding="0" align="center" class="textoimpremas">
            <tr>

                <td><b>Nombre: <%=estudiante.elementAt(0)%></b>
                    <br>
                    <b>Programa academico: <%=prog%></b>
                    <p>Su solicitud de admisión est&aacute; en estudio.
                    <%//if (estudiante.elementAt(1).equals("20")){%>
                    <!--Por tal motivo le invitamos a usted y su acudiente a una reuni&oacute;n con el Director del Departamento de Ciencias B&aacute;sicas, Ing. Eduardo         Silva, el pr&oacute;ximo mi&eacute;rcoles 16 de noviembre a las 12:00 del d&iacute;a en el Bloque D tercer piso.
            <p>Esperamos su puntual asistencia.
            <p>Cordialmente <br> Dirección de Ciencias Básicas.-->
                    <%//} else {%>

                    <p>Para mayor información por favor comuníquese al 6683600 opción 2 en el menú.
                    <%//}%>
                </td>
            </tr>
        </table>
        <%}
    if (estudiante.elementAt(2).equals("-65")) {%>
        <table width="710" border="0" cellspacing="0" cellpadding="0"  align="center" class="textoimpremas">
            <tr>
                <td>

                    <p><b>Nombre: <%=estudiante.elementAt(0)%></b> <br>
                    <b>Programa academico: <%=prog%></b> </p>
                    <p align="right"><a href='html/listadeespera.htm'>VER LISTA DE ESPERA</a></p>

                    <p><i>Apreciado aspirante:</i>
                    <p>Para la admisi&oacute;n se analizaron los puntajes obtenidos por usted
                    en el examen de Estado que present&oacute; con el N&uacute;mero de Registro
                    <%=estudiante.elementAt(5)%> quedando ubicado en uno de tres niveles en
                    el &aacute;rea correspondiente seg&uacute;n sea el caso: B&aacute;sico,
                    intermedio o Alto.
                    <p>El puntaje de corte correspondiente a cada nivel, se determin&oacute;
                        seg&uacute;n los resultados generales de todos los examinados en Bogot&aacute;,
                        seg&uacute;n la fecha de presentaci&oacute;n en que usted present&oacute;
                    el examen de Estado.</p>
                    <%
            pericfes = estudiante.elementAt(5).toString().substring(2, 7);%>
                    <%String annio = estudiante.elementAt(5).toString().substring(2, 6);%>
                    <%String per = estudiante.elementAt(5).toString().substring(6, 7);%>
                    <p>Para el a&ntilde;o <%=annio%> per&iacute;odo <%=per%>, en que usted present&oacute;
                    este examen, los puntajes de corte fueron:</p>
                    <p>&nbsp;</p>
                    <%Vector puntajes = bd.baseicfes(pericfes, oout);%>
                    <table align="center" width="61%" border="0" class="textoimpremas">
                        <tr>
                            <td width="33%">&nbsp;</td>
                            <td width="37%">Nivel B&aacute;sico <br>
                                Puntajes menores a<br>
                            </td>
                            <td width="30%">Nivel Alto<br>
                                Puntajes mayores a<br>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">Matem&aacute;ticas</td>
                            <td width="37%">
                                <div align="center"> <%=puntajes.elementAt(1)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(2)%></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">Filosof&iacute;a</td>
                            <td width="37%">
                                <div align="center"><%=puntajes.elementAt(5)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(6)%></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">F&iacute;sica</td>
                            <td width="37%">
                                <div align="center"><%=puntajes.elementAt(7)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(8)%></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%">Lenguaje</td>
                            <td width="37%">
                                <div align="center"><%=puntajes.elementAt(3)%></div>
                            </td>
                            <td width="30%">
                                <div align="center"><%=puntajes.elementAt(4)%></div>
                            </td>
                        </tr>
                    </table>

                    <p align="center"><b>Los puntajes intermedios corresponden al Nivel Medio.</b></p>
                    <p><br>
                        Su solicitud de admisi&oacute;n qued&oacute; en lista de espera, debido
                        a que usted qued&oacute; clasificado en al menos dos &aacute;reas en nivel
                        b&aacute;sico a excepci&oacute;n del &aacute;rea de matem&aacute;ticas.<br>
                        <br>
                        De acuerdo con el resultado obtenido por usted en las &aacute;reas de
                    inter&eacute;s del Examen de Estado, qued&oacute; clasificado as&iacute;:</p>
                    <p>
                        <%if (estudiante.elementAt(1).equals("13") || estudiante.elementAt(1).equals("14") || estudiante.elementAt(1).equals("15") || estudiante.elementAt(1).equals("16") || estudiante.elementAt(1).equals("17") || estudiante.elementAt(1).equals("20") || estudiante.elementAt(1).equals("260")) {
                out.println("<b>Matemáticas: " + estudiante.elementAt(6) + "&nbsp;&nbsp; " + clasifica1 + "</b><br>");
                out.println("<b>Física:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(8) + " &nbsp;&nbsp;&nbsp;" + clasifica3 + "</b><br>");
                out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");

            } else if (estudiante.elementAt(1).equals("18") || estudiante.elementAt(1).equals("19")) {
                out.println("<b>Matemáticas:&nbsp;&nbsp;" + estudiante.elementAt(6) + "&nbsp;" + clasifica1 + "</b><br>");
                out.println("<b>Filosofía:&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(7) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica2 + "</b><br>");
                out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");
            }%>
                    </p>
                    <p>Lo anterior significa que a m&aacute;s tardar el 11 de Diciembre se le informar&aacute;
                        una respuesta definitiva, raz&oacute;n por la cual deber&aacute; consultar
                    permanentemente en el link de &quot;admitidos pregrado&quot;.</p>
                    <p></p>
                    <p><em>Secretar&iacute;a General - Admisiones </em>
                    <p>
                    <%//if (estudiante.elementAt(1).equals("20")){%>
                    <!--Por tal motivo le invitamos a usted y su acudiente a una reuni&oacute;n con el Director del Departamento de Ciencias B&aacute;sicas, Ing. Eduardo         Silva, el pr&oacute;ximo mi&eacute;rcoles 16 de noviembre a las 12:00 del d&iacute;a en el Bloque D tercer piso.
            <p>Esperamos su puntual asistencia.
            <p>Cordialmente <br> Dirección de Ciencias Básicas.-->
                    <%//} else {%>
                    <p><i>Para mayor información por favor comuníquese al 6683600 opción 2 en el menú.</i>
                    <%}%>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>

        </table>

    </body>
</html>
<%
            }
        } else {

            response.sendRedirect("Admitidos");

        }
%>
