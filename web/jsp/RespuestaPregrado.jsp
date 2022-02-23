<%-- 
    Document   : AdmitidosPregrado
    Created on : 25/08/2009, 03:57:24 PM
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
            String tipo = new String();
            String porcentaje = new String();
            String datofecha = new String();
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

//  String hoy = "15/06/2010";
// Date ini = formatter.parse(hoy);
            String prog = "";
            String duracion = "";
            BDadmisiones bd = new BDadmisiones();
            String docEst = request.getParameter("documento");
            String fecha = request.getParameter("fecha");
            String induccion = request.getParameter("induccion");
            String periodo = confEci.getPeriodo();
            String comparar = new String();
            String clasifica1 = new String();
            String clasifica2 = new String();
            String clasifica3 = new String();
            String clasifica4 = new String();
            String clasifica5 = new String();

            Vector estudiante = bd.AdmitidosOtros(docEst, oout, confEci.getPeriodo());
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Admisiones - Respuesta de Admisi�n </title>
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
                 Vector datos = (Vector) estudiante.elementAt(k);%>

        <%
                         Vector asignaturas = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                         String idprog = datos.elementAt(1).toString();
                         Vector Anotacion = bd.AnotacionBeca(datos.elementAt(11).toString(), periodo, oout);
                         String ReintegroPrimer = bd.ReintegroPrimerS(datos.elementAt(11).toString(), oout);
                         //Si es igual a 1
                         if (ReintegroPrimer.equals("1")) {
                             ReintegroPrimer = "2";
                         }
                         tipoest = (String) datos.elementAt(12);
                         tipo = (String) datos.elementAt(13);
                         char idtipo = tipoest.charAt(0);
                         int respuesta = bd.logconsultaadmitidos(datos.elementAt(11).toString(), datos.elementAt(2).toString(), oout);
        %>

        <table width="65%" border="0" cellspacing="0" cellpadding="0"  align="center" class="textoimpremas">
            <!--NO SELECCIONADO A BECAS JULIO GARAVITO FAC_COR=-5-->
            <% if ((tipo.equals("N")) && datos.elementAt(2).equals("-60") && datos.elementAt(16).equals("-5")) {%>
            <% if (datos.elementAt(1).equals("14")) {
                     prog = "INGENIERIA ELECTRICA";
                     duracion = "10";

                 } else if (datos.elementAt(1).equals("18")) {
                     prog = "ECONOMIA";
                     duracion = "9";

                 } else if (datos.elementAt(1).equals("20")) {
                     prog = "MATEMATICAS";
                     duracion = "9";

                 }%>
            <tr>
                <td colspan="3" >Estudio de asignaci�n de beca para el programa de <b><%=prog%></b></td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
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
                <td colspan="3" >Estimado Aspirante: </td>
            </tr>
            <tr>
                <td colspan="3">

                    <p>Despu�s de realizado el proceso de selecci�n, lamentamos informarle que
                        en esta oportunidad no fue aceptada su postulaci�n para ser beneficiario
                        de las Becas JULIO GARAVITO ARMERO. Le invitamos a vincularse a nuestra
                        instituci�n donde de acuerdo con sus condiciones acad�micas estamos seguros
                        que obtendr� los mejores resultados y eventualmente podr� aplicar a las
                        becas de Excelencia Acad�mica que ofrece la Escuela.
                    <p>En caso de requerirlo le sugerimos conocer las diferentes alternativas
                        de financiaci&oacute;n que coordina la oficina de apoyo financiero, quienes
                        se encuentran ubicados en la plazoleta del primer piso del bloque A. (apoyofinanciero@escuelaing.edu.co).
                    <p>Cordial Saludo,</p>
                    <p>Ing. Ricardo Alfredo L�pez Cualla
                        <br>
                        Secretario General
                    </p>

                </td>
            </tr>
            <!--SELECCIONADO A BECAS JULIO GARAVITO-->
            <%} else if (tipo.equals("N") && (datos.elementAt(2).equals("-60")) && Anotacion.size() > 0 && datos.elementAt(16).equals("3")) {%>
            <tr>
                <td colspan="3" >&nbsp;</td>
            </tr>
            <% if (datos.elementAt(1).equals("14")) {
                     prog = "INGENIERIA ELECTRICA";
                     duracion = "10";

                 } else if (datos.elementAt(1).equals("18")) {
                     prog = "ECONOMIA";
                     duracion = "9";

                 } else if (datos.elementAt(1).equals("20")) {
                     prog = "MATEMATICAS";
                     duracion = "9";

                 }%>
            <tr>
                <td colspan="3">Estudio de asignaci�n de beca para el programa de <b><%=prog%></b></td>
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
                <td colspan="3" >&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" >Estimado Aspirante:<br> </td>
            </tr>
            <%  porcentaje = (String) Anotacion.elementAt(4);
                 String porciento = porcentaje.substring(32);%>
            <tr>
                <td colspan="3">
                    <p>Para la Escuela Colombiana de Ingenier&iacute;a es muy grato comunicarle
                        que fue seleccionado como uno de los beneficiarios de la Beca Julio Garavito
                        Armero para iniciar actividades acad&eacute;micas en el Programa de <%=prog%> a partir del per&iacute;odo acad&eacute;mico <%=periodo%></p>
                    <p>Nos permitimos felicitarle por este logro y nos complace contribuir a
                        que bachilleres como usted alcancen las metas por sus propios m&eacute;ritos.
                        Este es tan solo el comienzo de una nueva etapa que con su dedicaci&oacute;n
                        y esfuerzo y por supuesto de nuestro apoyo, ser&aacute; culminada con
                        &eacute;xito.<br>
                    </p>

                    <p>Para formalizar su ingreso, usted podr� presentarse a partir del 23 de junio al 2020 desde las 8:00 am, 
                        en la Oficina de admisiones, donde
                        deber&aacute; entregar una carta de aceptaci&oacute;n de la beca firmada
                        por usted y su acudiente; y copia del diploma y acta de grado de bachiller
                        como condici&oacute;n para firmar acta de matr&iacute;cula. El plazo m&aacute;ximo
                        de aceptaci&oacute;n de la beca y formalizaci&oacute;n de matr&iacute;cula
                        es el 02 de julio de 2020. En caso de no entregar la documentaci&oacute;n
                        mencionada anteriormente en la fecha indicada, se entender&aacute; que
                        no se acepta la beca y por lo tanto la Escuela proceder&aacute; a la reasignaci&oacute;n
                        de la misma.
                    <p>
                        La matr&iacute;cula acad&eacute;mica en la Escuela formaliza el acceso
                        del estudiante a los derechos y a los deberes de que ella se desprende.
                        Especialmente significa que el estudiante comparte los postulados contenidos
                        en la Declaraci&oacute;n de Principios de la Escuela. La firma del acta
                        de matr&iacute;cula es personal e indelegable por parte del estudiante
                        y solo se considera matriculado quien la haya firmado.</p>
                    <p>Para el per&iacute;odo <%=periodo%> la beca corresponde al <%=porciento%> del valor de los derechos de matr&iacute;cula,
                        y no es acumulable con otros beneficios financieros. </p>
                    <p>Para los siguientes semestres, la beca podr&aacute; tener una cobertura
                        total o parcial dependiendo del promedio acumulado en la carrera, para
                        lo cual ser&aacute; necesario que cumpla los siguientes requisitos:</p>
                    <p>1. Obtener un promedio acumulado igual o superior a 4.00 para el 100%
                        de cobertura; obtener un promedio acumulado entre 3.75 y 3.99 para el
                        75% de cobertura u obtener un promedio acumulado entre 3.50 y 3.74 para
                        el 50% de cobertura.</p>

                    <p>2.En caso de que el promedio acumulado est&eacute; entre 3.00 y 3.49, no
                        se tendr&aacute; acceso a porcentaje de beca. Sin embargo este podr&aacute;
                        ser recuperado si en semestres posteriores se obtiene un promedio acumulado
                        igual o superior a 3.50 de acuerdo con lo consignado anteriormente.</p>

                    <p>3. Participar en el programa de acompa&ntilde;amiento dirigido a los
                        beneficiarios del Fondo de Becas Julio Garavito Armero, ofrecido por Bienestar
                        Universitario y asistir a las reuniones convocadas para tal fin, las cuales
                        se realizar�n el 01 de agosto de 2020 a partir de las 8:00
                        am. Adicionalmente se requiere la participaci�n de su acudiente en este
                        programa, por lo cual se solicita su asistencia el d�a 10 de julio
                        de 2017 a partir de las 8:00 am.</p>

                    <p>4.Los estudiantes becarios deber&aacute;n cumplir con un m&aacute;ximo
                        de 20 horas durante el semestre como monitores administrativos. La asignaci&oacute;n
                        de monitores a las diferentes actividades es una responsabilidad de la
                        vicerrector&iacute;a acad&eacute;mica.</p>
                    <p>La beca se perder&aacute; de manera definitiva en cualquiera de los siguientes
                        casos y el estudiante ser&aacute; responsable del pago por el valor total
                        de la matr&iacute;cula para los per&iacute;odos acad&eacute;micos restantes:</p>
                    <p> * Incumplir cualquiera de las condiciones de permanencia establecidas en el Reglamento estudiantil.
                        La aceptaci�n por parte de la Escuela en un programa especial como Readmisi�n o Seguimiento Acad�mico, no dar�
                        lugar a la continuidad de la Beca.</p>
                    <p> * Ser sancionado disciplinariamente, exceptuando el retiro de clase o la amonestaci�n verbal </p>
                    <p>
                        Si usted solicita cancelaci�n del semestre motivado por la prestaci�n del Servicio Militar, podr� conservar
                        la beca en el momento de su Reintegro. Si la cancelaci�n del semestre se solicita por motivos diferentes al
                        Servicio Militar, perder� la beca pero podr� solicitar la renovaci�n de la misma y ser� el Consejo Acad�mico
                        quien decida sobre su otorgamiento.
                    </p>
                    <p>La beca es exclusiva para el Programa acad&eacute;mico al que fue otorgada
                        y es personal, intransferible e inaplazable. La beca se adjudica por un
                        per&iacute;odo m&aacute;ximo de <%=duracion%> semestres, duraci&oacute;n nominal de este programa.</p>
                    <p>Todos los Beneficiarios de las Becas Julio Garavito Armero
                        deben asistir a la jornada de inducci�n que se realizar�  <%=induccion%>
                    <p>


                    <p>Cualquier informaci&oacute;n o aclaraci&oacute;n adicional por favor
                        comun&iacute;quese con la Oficina de Admisiones con la Ingeniera Angela
                        Daniela Prieto o el Economista Felipe Jaimes Monroy a los tel�fonos 6 68 36 00
                        ext. 513, 146 o 518.</p>
                    <p>Ser&aacute; muy grato para nosotros que se vincule a nuestra comunidad
                        acad&eacute;mica.</p>
                    <p></p>
                    <p>Cordial Saludo,</p>
                    <p>Ing. Ricardo Alfredo L�pez Cualla
                        <br>
                        Secretario General
                    </p>
                    <p></p>

                    <p></p>
                    <p></p>
                    <p></p>
                    <!--   <p align="center"><a href="http://www.escuelaing.edu.co/documentos/FormalizacionesPS20102.pdf"><font size="4">Consulte
                aqu&iacute; las Instrucciones para su Matricula</font></a></p>-->
                </td>
            </tr>
            <!--postulado a BECA EN LISTA DE ESPERA-->
            <% } else if (tipo.equals("N") && datos.elementAt(2).equals("-60") && datos.elementAt(16).equals("-6")) {%>
            <% if (datos.elementAt(1).equals("14")) {
                     prog = "INGENIERIA ELECTRICA";
                     duracion = "10";

                 } else if (datos.elementAt(1).equals("18")) {
                     prog = "ECONOMIA";
                     duracion = "9";

                 } else if (datos.elementAt(1).equals("20")) {
                     prog = "MATEMATICAS";
                     duracion = "9";

                 }%>
            <tr>
                <td colspan="3">Estudio de asignaci�n de beca  para el programa de <b><%=prog%></b></td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
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
                <td colspan="3" >Estimado Aspirante </td>
            </tr>
            <tr>
                <td colspan="3" >
                    <p>
                        Despu�s de realizado el proceso de selecci�n, le informamos que inicialmente no le fue asignada la beca Julio Garavito
                        Armero. Sin embargo, teniendo en cuenta sus resultados en el Examen de Estado y su desempe�o en las entrevistas a las que
                        fue citado, usted qued� en lista de espera. En caso de que alguno de los beneficiarios no acepte la beca por alg�n motivo,
                        usted ser� uno de los opcionados para su reasignaci�n. A partir del  13 de diciembre de 2017 le daremos una respuesta definitiva al respecto.
                    <p>Cordial Saludo,</p>
                    <p>Ing. Ricardo Alfredo L�pez Cualla
                        <br>
                        Secretario General
                    </p>
                    <br>

                </td>
            </tr>
            <p><br>
                <!-- becas 50% -->
                <%} else if (tipo.equals("N") && datos.elementAt(2).equals("-60") && datos.elementAt(16).equals("6") && datos.elementAt(1).equals("20")) {%>
                <%  if (datos.elementAt(1).equals("20")) {
                         prog = "MATEMATICAS";
                     }%>
            <tr>
                <td colspan="3" >Estudio de asignaci�n de Becas para el programa de  <b><%=prog%></b></td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
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
                <td colspan="3" >Estimado Aspirante: </td>
            </tr>
            <tr>
                <td colspan="3" >

                    <p>Para la Escuela Colombiana de Ingenier�a es muy grato comunicarle que
                        fue seleccionado como uno de los beneficiarios de una Beca Julio Garavito
                        Armero
                        <!--del 50% del valor de la matr�cula -->
                        para iniciar actividades acad�micas en el Programa de <%=prog%> a
                        partir del per�odo acad�mico <%=periodo%>.
                        
                    <p>Nos permitimos felicitarle por este logro y nos complace contribuir a que bachilleres como usted alcancen las metas por
                        sus propios m�ritos. Este es tan solo el comienzo de una nueva etapa que con su dedicaci�n y esfuerzo y por supuesto de
                        nuestro apoyo, ser� culminada con �xito.

                    <p> Para formalizar su ingreso, usted podr� presentarse a partir del 23 de junio al 2020 desde las 8:00 am en la Oficina de admisiones, donde
                        deber&aacute; entregar una carta de aceptaci&oacute;n de la beca firmada
                        por usted y su acudiente; y copia del diploma y acta de grado de bachiller
                        como condici&oacute;n para firmar acta de matr&iacute;cula. El plazo m&aacute;ximo
                        de aceptaci&oacute;n de la beca y formalizaci&oacute;n de matr&iacute;cula
                        es el 02 de julio de 2020. En caso de no entregar la documentaci&oacute;n
                        mencionada anteriormente en la fecha indicada, se entender&aacute; que
                        no se acepta la beca y por lo tanto la Escuela proceder&aacute; a la reasignaci&oacute;n
                        de la misma.
                    <p>
                        La matr�cula acad�mica en la Escuela formaliza el acceso del estudiante a los derechos y a los deberes que de ella se
                        desprende. Especialmente significa que el estudiante comparte los postulados contenidos en la Declaraci�n de
                        Principios de la Escuela. La firma del acta de matr�cula es personal e indelegable por parte del estudiante y solo se
                        considera matriculado quien la haya firmado.
                    <p> Para el periodo <%=periodo%> la beca corresponde al 50%  del valor de los derechos
                        de matr�cula y no es acumulable con otros beneficios financieros.
                    <p>Para los siguientes semestres, la beca podr� ser renovada siempre y cuando obtenga un promedio acumulado igual o
                        superior a 3.5.

                    <p><!-- Deber� participar en el programa de acompa�amiento dirigido a los becarios
                        de la Escuela, ofrecido por Bienestar Universitario y asistir a las reuniones
                        convocadas para tal fin, las cuales se realizar�n el 10 y 11 de julio
                        de 2017 a partir de las 8:00 am. Adicionalmente se requiere la participaci�n
                        de su acudiente en este programa, por lo cual se solicita su asistencia
                        el d�a 10 de julio de 2017 a partir de las 8:00 am.-->
                    <p> La beca se perder� de manera definitiva en cualquiera de los siguientes
                        casos y el estudiante ser� responsable del pago por el valor total de
                        la matr�cula para los per�odos acad�micos restantes:
                    <p>* Incumplir cualquiera de las condiciones de permanencia establecidas en el Reglamento estudiantil. La aceptaci�n por parte de la Escuela en un programa especial como Readmisi�n o Seguimiento Acad�mico, no dar� lugar a la continuidad de la Beca.
                    <p>* Ser sancionado disciplinariamente, exceptuando el retiro de clase o la amonestaci�n verbal.

                        <!--<p> Obtener un promedio acumulado inferior a 3.5. -->
                    <p>Los estudiantes becarios deben cumplir con un m�ximo de 20 horas durante
                        el semestre como monitores administrativos. La asignaci�n de monitores
                        a las diferentes actividades es una responsabilidad de la Vicerector�a
                        Acad�mica.
                    <p>Si usted solicita cancelaci�n del semestre motivado por la prestaci�n del Servicio Militar, podr� conservar la beca en el momento de su Reintegro. Si la cancelaci�n del semestre se solicita por motivos diferentes al Servicio Militar, perder� la beca pero podr� solicitar la renovaci�n de la misma y ser� el Consejo Acad�mico quien decida sobre su otorgamiento.
                    <p>La beca es exclusiva para el Programa acad�mico de <%=prog%> y es personal, intransferible e inaplazable. La beca se adjudica por un per�odo m�ximo de 9 semestres, duraci�n nominal de este programa. <!--y no es acumulable con
                        otros beneficios escon�micos que pudiera tener.-->

                    <p>Todos los Beneficiarios de las becas Julio Garavito Armero deben asistir
                        a la Jornada de inducci�n que se realizar�  <%=induccion%>

                    <p>Cualquier informaci�n o aclaraci�n adicional por favor comun�quese a
                        la oficina de Admisiones con la Ingeniera Angela Daniela Prieto o el Ingeniero
                        Robert Ariza a los tel�fonos 6 68 36 00 ext. 513, 146 o 518.
                    <p> Ser� muy grato para nosotros que se vincule a nuestra comunidad acad�mica.
                    <p>Secretar�a General - Oficina de Admisiones.

                </td>
            </tr>
            <!--VALIDACION PARA READMISION -->

            <%} else if (datos.elementAt(13).equals("E")) {%>
            <center> No est� autorizado para realizar este proceso, por favor comun�quese al 6683600 opci�n 2 en el men�. </center>
                <%    } else if (datos.elementAt(2).equals("-13") && datos.elementAt(16).equals("1")) {
                     //datofecha = new String(datos.elementAt(18).toString());
                     //          Date inicio = formatter.parse(datofecha);

                     if (datos.elementAt(1).equals("13")) {
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

                     } else if (datos.elementAt(1).equals("262")) {
                         prog = "INGENIERIA BIOMEDICA";

                     }

                %>
            <tr>
                <td colspan="3" >Estudio de admisi&oacute;n para el programa de <b><%=prog%></b></td>
            </tr>
            <tr>
                <td colspan="3" >&nbsp;</td>
            </tr>
            <tr>
                <td height="19" colspan="4">
                    <p><%=datos.elementAt(0)%>
                    </p>
                </td>
            </tr>
            <tr>
                <td colspan="3" >&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" >Estimado estudiante: </td>
            </tr>
            <tr>
                <td colspan="3">
                    <p>&nbsp;</p>
                    <p>Le informamos que su solicitud de Readmisi&oacute;n para el periodo <%=confEci.getPeriodo()%>, ha sido aprobada. <br>
                    </p>
                    <p>Deber� cursar todas las asignaturas correspondientes al plan de estudios
                        vigente para el <%=confEci.getPeriodo()%>, teniendo en cuenta el an&aacute;lisis de clasificaci&oacute;n
                        de los puntajes obtenidos en las &aacute;reas de inter&eacute;s del ex&aacute;men
                        de Estado con el que usted ingres&oacute; la primera vez. Si usted ingres&oacute;
                        por transferencia, se le tendr&aacute;n en cuenta las homologaciones iniciales.
                        Se le retirar�n del Registro todas las calificaciones obtenidas en las
                        asignaturas cursadas hasta el momento, aprobados o no aprobados, para
                        efectos de las condiciones de permanencia expresadas en el Reglamento
                        Estudiantil y la expedici�n de certificados (Cap&iacute;tulo III, Reglamento Estudiantil). </p>
                        <%   if (datos.elementAt(1).equals("13")) {%>

                    <p>&nbsp;</p>
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
<!--
                    <p>Deber� asistir a la jornada prevista por el Programa de Acompa&ntilde;amiento
                        que se desarrollar&aacute; los d�as 08 y 09 de julio a
                        las 8:00 a.m. y presentarse en el Departamento de psicolog�a de Bienestar Universitario,
                        donde le orientar�n acerca del plan de trabajo a seguir a nivel personal. Adicionalmente con el &aacute;nimo de favorecer su desempe&ntilde;o
                        acad&eacute;mico en la Escuela se requiere la presencia del acudiente
                        del estudiante el 09 de julio a las 8:00 a.m. donde se dar&aacute;
                        a conocer el programa de acompa&ntilde;amiento, as&iacute; como la programaci&oacute;n
                        de las reuniones que se desarrollar&aacute;n durante el semestre. La asistencia al Programa de Acompa�amiento que organiza Bienestar Universitario, es de car�cter obligatorio, y debe cumplirse con el 100% de asistencia a las actividades para obtener la aprobaci�n correspondiente.</p>-->
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
                    <!--p>Deber&aacute; asistir a la jornada de inducci&oacute;n
                        del <%=induccion%>. All&iacute;
                        se le proporcionar&aacute; informaci&oacute;n espec&iacute;fica sobre
                        el programa de <%=prog%>, as&iacute; como el procedimiento a seguir para consultar
                        su horario. </p-->
                    <p>Deber&aacute; imprimir nuevamente su orden de pago para cancelar los
                        derechos de matr&iacute;cula correspondientes, la cual podr� consultar a partir del 10 de julio del 2020 a las 6:00 p.m, teniendo en cuenta que
                        la orden anterior no tiene validez en su caso. Una
                        vez haya cancelado deber&aacute; firmar acta de matr&iacute;cula y consultar
                        su horario por internet en las fechas programadas para tal fin. </p>
                    <p>Al aceptar su readmisi&oacute;n se compromete a cumplir con el reglamento
                        estudiantil de la Escuela y en especial en lo relacionado con las condiciones
                        de permanencia expresadas en el Cap&iacute;tulo III, t&iacute;tulo tercero.</p>
                    <p>Le deseamos &eacute;xitos en el desarrollo de sus estudios.<br>
                    </p>
                    <p><br>
                        Atentamente, <br>
                        Ricardo Alfredo L�pez Cualla<br>
                        Secretario General
                    </p>
                    <p>&nbsp;</p>
                </td>
            </tr>
            <tr> <!--onclick="alert('A partir del 22 de Diciembre usted podr� imprimir una nueva orden de matricula con fecha de pago ordinario hasta el 29 de Diciembre.'");-->
                <td><a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst" ><img src="img/orden.gif" width="185" height="48"></a></td>
                <!-- <td><a href="http://www.escuelaing.edu.co/documentos/FormalizacionReadmision.pdf"><img src="img/insformaliza.gif" width="185" height="48"></a>  </td>-->

            <!-- <td colspan="3"><a onClick="window.open('http://admisiones.escuelaing.edu.co/inscripcioneslinea/Guias?idprog=<%=datos.elementAt(1)%>','','width=850,height=600,scrollbars=yes,top=80,left=100');"><img src="img/guiasexamen.gif" width="180" height="48" align="right"></a>
      <div align="center"></div>
                </td>-->
            </tr>
            <!--PAra este proceso se tendra en cuenta el estado mas no el fac_cor es decir el fac_cor seguira siendo el mismoq ue estba cuando es citado a entrevista-->

            <%} else if (datos.elementAt(2).equals("-19") && datos.elementAt(16).equals("-1")) {%>
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

                 } else if (datos.elementAt(1).equals("262")) {
                     
                     prog = "INGENIERIA BIOMEDICA";

                 }
            %>
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
                
                <td colspan="3" >Estimado Aspirante: </td>
            <br>
            <br>
            </tr>
            
            <tr>
                <td colspan="3"> Una vez estudiado y discutido su caso, analizado su hoja de vida acad�mica y/o debido a que no asisti� parcial o completamente
                    a la jornada prevista del programa de acompa�amiento, lamentamos informarle que el comit� de Admisiones
                    conceptu� no aprobar su solicitud de readmisi�n.
                    <br>
                    <!--  <br>
                Si a�n est� interesado en ingresar por readmisi�n en el 2011-1, deber� presentarse en Bienestar Universitario
                el 12 de Enero de 2011 a las 8:00 a.m en compa��a de su acudiente.-->
                    <br>
                    <br>
                    <br>

                    Atentamente, <br>
                    Ricardo Alfredo L�pez Cualla<br>
                    Secretario General</td>
            </tr>

            <%} else if (datos.elementAt(2).equals("1") && (datos.elementAt(16).equals("-300"))) {%>
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
                <td height="19" colspan="4">
                    <p><%=datos.elementAt(0)%></p>
                </td>
            </tr>
            <tr>
                <td colspan="3" >&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" >Estimado Aspirante: </td>
            </tr>
            <tr>
                <td colspan="3"> Una vez finalizado el semestre, su promedio ponderado fu� aprobatorio, por lo cual
                    se hizo caso omiso a su solicitud. Cualquier inquietud en relaci�n con su orden de matr�cula, por favor comun�quese
                    en la Oficina de Apoyo Financiero con la Ingeniera Claudia Jaime a la ext.356. <p>

                        Atentamente, <br>
                        Ricardo Alfredo L�pez Cualla<br>
                        Secretario General </td>
            </tr>

            <%} else if ((!datos.elementAt(2).equals("-13") && !datos.elementAt(2).equals("-19")) && (datos.elementAt(16).equals("-300"))) {%>
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
                <td height="19" colspan="4">
                    <p><%=datos.elementAt(0)%></p>
                </td>
            </tr>
            <tr>
                <td colspan="3" >&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" >Estimado Aspirante: </td>
            </tr>
            <tr>
                <td colspan="3">Como condici�n para estudiar su solicitud de readmisi�n, deber� presentarse en Bienestar Universitario
                    los d�as 07 y 08 de julio de 2014 a las 8:00 a.m en compa��a de su acudiente.  <p>
                    <p>
                        Atentamente, <br>
                        Ricardo Alfredo L�pez Cualla<br>
                        Secretario General</td>
            </tr>
            <!--VALIDACION PARA ADMITIDOS A REINTEGRO  PEGAR AQUI LO SIGUIENTE DESPUES DEL }-->
            <%}
                            }
                        }
            %></table>

        <p>&nbsp;</p>
    </body>
</html>

