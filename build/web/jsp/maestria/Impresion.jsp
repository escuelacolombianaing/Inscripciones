<%-- 
    Document   : Impresion
    Created on : 9/05/2013, 02:52:09 PM
    Author     : Lucero
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%@page contentType="text/html"%>


<%HttpSession sesion;
            String docEst = request.getParameter("docEst");
            String idplan = request.getParameter("idplan");
            Vector cronograma = new Vector();
            PrintWriter oout = response.getWriter();
            configeci.configmaestria confEci = new configeci.configmaestria();
            String respadm = "", induccion = "", fecinicio = "", valorniv = "", ordenesp = "", firmaesp = "";
            String programa = "", titulo = "", fecordenes = "", fecpagos = "", fecniv = "", firmaniv = "", valortotal = "", creditos = "", valcredito = "";
            otros.rutas ruta = new otros.rutas();
            String formato = request.getParameter("formato");
            out.println(formato);
            BDadmisiones bd = new BDadmisiones();
            String titulos = "Aspirantes a la Maestría";
            int val = 0;
            int ban = 0;

            if (docEst != null && !docEst.equals("")) {
                //confEci.getPeriodoActual()
                //  Vector listado = dbgen.InsPregrados(confEci.getPeriodoSig(), dpto), tmp;
                if ((formato != null) && (formato.equals("word"))) {
                    response.setContentType("application/vnd.ms-word");
                    response.setHeader("Content-Disposition", "inline; filename=respuesta.doc");

                }%>

<html>
    <script language="JavaScript" type="text/JavaScript">
        <!--
        function impresion(){
            document.getElementById("tablaboton").style.visibility='hidden';
            window.print();
            window.close();
        }
        -->
    </script>
    <%
                    if (!((formato != null) && (formato.equals("word")))) {
    %>
    <link href="css/comun.css" rel="stylesheet" type="text/css">
    <%        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JSP Page</title>
    </head>
    <body>
        <table width="100%" border="0" id="tablaboton">
            <tr>
                <td width="40%">
                    <div align="right">
                        <% if (!((formato != null) && (formato.equals("word")))) {
                        %>
                        <input name="imprimir" type="submit" id="imprimir" value="Imprimir" class="boton" onClick="impresion()">
                        <%        }
                        %>
                    </div>
                </td>
            </tr>
        </table>


        <%if (idplan.equals("353")) {
                            programa = "MAESTRIA EN GESTIÓN DE INFORMACIÓN";
                            titulo = "CONSULTA ADMITIDOS A LA MAESTRÍA EN GESTIÓN DE INFORMACIÓN";%>

        <%} else if (idplan.equals("321")) {
            programa = "MAESTRIA EN INGENIERÍA ELECTRÓNICA";
            titulo = "CONSULTA ADMITIDOS A LA MAESTRÍA EN INGENIERÍA ELECTRÓNICA-MODALIDAD DE PROFUNDIZACIÓN";%>

        <%} else if (idplan.equals("322")) {
            programa = "MAESTRIA EN INGENERÍA ELECTRÓNICA";
            titulo = "CONSULTA ADMITIDOS A LA MAESTRÍA EN INGENIERÍA ELECTRÓNICA-MODALIDAD DE INVESTIGACIÓN";%>

        <%} else if (idplan.equals("351")) {
            programa = "MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
            titulo = "CONSULTA ADMITIDOS A LA MAESTRÍA  EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";%>

        <%} else if (idplan.equals("330") || idplan.equals("331")) {
            programa = "MAESTRIA EN INGENIERIA INDUSTRIAL";
            titulo = "CONSULTA ADMITIDOS A LA MAESTRÍA  EN INGENIERIA INDUSTRIAL";%>

        <% }else if (idplan.equals("371")) {
            programa = "MAESTRÍA EN INFORMÁTICA";
            titulo = "CONSULTA ADMITIDOS A LA MAESTRÍA EN INFORMÁTICA";%>

        <% }else if (idplan.equals("372")) {
            programa = "MAESTRÍA EN CIENCIAS ACTUARIALES";
            titulo = "CONSULTA ADMITIDOS A LA MAESTRÍA EN CIENCIAS ACTUARIALES";%>

        <% }else if (idplan.equals("376")|| idplan.equals("377")) {
            programa = "MAESTRÍA EN CIENCIA DE DATOS";
            titulo = "CONSULTA ADMITIDOS A LA MAESTRÍA EN CIENCIA DE DATOS";%>

        <% }else {
            programa = "MAESTRIA EN INGENIERIA CIVIL";
            titulo = "CONSULTA ADMITIDOS A LA MAESTRÍA EN INGENIERÍA CIVIL";%>

        <%}%>

        <%Vector estud = bd.AdmitidosPos(docEst, idplan, confEci.getPeriodo(), oout);%>

        <%if (idplan.equals("331")) {
                            cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), "330");
                        } else if (idplan.equals("322")) {
                            cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), "321");
                        } else {
                            cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
                        }%>
        <%Vector tutor = bd.Tutores(docEst, oout);
                        Vector estudios = bd.Titulo((String) estud.elementAt(0));
                        if ((estudios.size()) > 0) {
                            for (int m = 0; m < estudios.size(); m++) {
                                Vector estudiosant = (Vector) estudios.elementAt(m);
                                titulo = (String) estudiosant.elementAt(1);
                                if (titulo.equals("OTRA")) {
                                    titulo = "ASPIRANTE";
                                }
                            }
                        }
        %>
        <!--<p><img src="img/cabezote_profes_r3_c1.jpg"></p>-->
        <% if (estud.elementAt(3).equals("-179") && (tutor.size() == 0)) {

                            out.println("<p><center>No tiene consejero asignado, comuníquese con la Dirección de la Maestría.</center></p>");
                            } else if (estud.size() == 0) {%>

        <table width="70%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas">
            <tr>
                <td><img src="img/cabezote_profes_r3_c1.jpg">
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <div align="center">
                        <h3><center>
                                <p>&nbsp;</p>
                                <p>Su documento es incorrecto o usted no formaliz&oacute; la solicitud
                                    de admisión para este programa académico. <br>
                                    Verifique e intente nuevamente o comuníquese con la Oficina de Admisiones.
                                    <br>
                                    Tel&eacute;fono: 6683600 opción 2 en el menú. </p>
                            </center></h3> </div>
                </td>
            </tr>
        </table>
        <%} else {%>

        <!--Para La respta de ADMITIDOS de QHSE cdo hay dos cohores a la vez se crea cronogramaqhse.txt
        y se valida aqui la cohorte por eje esta es la cohorte 12(2008-1) y el cronograma.txt va la cohorte 11-->

        <%if (estud.elementAt(3).equals("-179") || estud.elementAt(3).equals("-91") && ban == 0) {%>
        <BR>
        <form name="formulario" method="post" action="">
            <input type="hidden" name="idplan" value="<%=idplan%>">
            <table width="70%" border="0" cellspacing="0" cellpadding="0" class="textoimpre" align="center">
                <tr>                 
                    <td>

                        <p><b><%=titulo%></b></p>
                        <p>&nbsp;</p>
                    </td>
                </tr>
                <tr>
                    <td><b><%=estud.elementAt(1)%></b></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td >
                        <p align="justify">En nombre de la Escuela Colombiana de Ingenier&iacute;a
                            Julio Garavito, nos es grato comunicarle que ha sido aprobada su solicitud
                            de admisi&oacute;n al Programa de <b><%=programa%></b>, para iniciar
                            actividades acad&eacute;micas a partir <b>del <%=cronograma.elementAt(20)%></b>. Usted
                            har&aacute; parte de la comunidad acad&eacute;mica de una de las Instituciones
                            de Educaci&oacute;n Superior con mayor prestigio Nacional e Internacional,
                            que le da a usted una cordial bienvenida. </p>
                        <p>Para dar inicio a su proceso de matr&iacute;cula deber&aacute; tener en
                            cuenta lo siguiente:</p>
                        <p>
                            <!--Maestría-->
                            <%if (estud.elementAt(2).equals("290") || estud.elementAt(2).equals("291") || estud.elementAt(2).equals("292") || estud.elementAt(2).equals("293") || estud.elementAt(2).equals("294")) {%>
                        </p>
                        <p><b>1.</b>
                            <!--Cordialmente lo invitamos a una reuni&oacute;n informativa sobre
                              aspectos generales de la maestr&iacute;a en Ingenier&iacute;a Civil, resolver inquietudes sobre los procesos
                              administrativos y opciones de Financiaci&oacute;n Educativa el 25 de Julio en el sal&oacute;n D111
                            a las 8:00 a.m.-->
                            Su consejero Académico será el (la) <b>Ing.<%=tutor.elementAt(1)%></b>, correo
                            electrónico:<%=tutor.elementAt(3)%>, con quien deberá acordar la propuesta
                            de las asignaturas que conformarán su plan de estudios, durante los días
                            <b><%=cronograma.elementAt(27)%></b>, para efectos de liquidación de la orden de matrícula
                            correspondiente al periodo <%=cronograma.elementAt(2)%>.
                            <!--El director del énfasis enviará por correo electrónico
                            sugerencias para su registro académico basados en los intereses que usted manifestó en la entrevista y su
                            disponibilidad horaria.-->
                            <b><%=cronograma.elementAt(13)%></b> podrá pagar los derechos de matrícula o imprimir su orden
                            siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co//uploads/descargables/2932_manual_matriculas_posgrados.pdf">manual
                                de pagos en línea.</a>
                        <p> Para quienes hayan obtenido un título de postgrado de la Escuela Colombiana
                            de Ingeniería y deseen solicitar homologación de asignaturas, deberán entregar
                            por escrito dicha solicitud dirigida al Director de la Maestría, a más tardar
                            el  <b><%=cronograma.elementAt(26)%></b> indicando la lista de asignaturas cuya homologación se solicita.
                        <p>
                <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional
                    al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa
                    entrega de la orden de pago. Del <b><%=cronograma.elementAt(15)%></b>
                    <!-- El valor total de la Maestría
                    es de <b><!%=valortotal%></b> correspondiente a <b><!%=creditos%></b> cr&eacute;ditos. -->
                </li>
                <blockquote>
                    <p>El pago extraordinario tiene un recargo del 5%.</p>
                    <p><b>Valor del cr&eacute;dito: $<%=cronograma.elementAt(22)%>.oo</b></p>
                </blockquote>
                <p><b>2. Financiaci&oacute;n: </b>Ofrecemos diversas alternativas de financiaci&oacute;n
                    en corto y largo plazo, para cubrir hasta el 100% del valor de la matr&iacute;cula,
                    para mayor informaci&oacute;n cumun&iacute;quese con la Oficina de Apoyo
                    Financiero al 6683600 ext.107 &oacute; 356.</p>
                <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
                <p align="justify">Una vez haya realizado el pago, deber&aacute; Formalizar
                    su matr&iacute;cula, as&iacute;:</p>
                <blockquote>
                    <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n:
                        </b> </p>
                    <ul>
                        <li>
                            <p align="justify">La matr&iacute;cula es el acto voluntario de una
                                persona natural mediante el cual se adquiere la calidad de estudiante
                                de la Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento
                                de todos los requisitos se&ntilde;alados para la misma. Mediante este
                                acto, el estudiante se compromete a cumplir el reglamento y las dem&aacute;s
                                normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
                                el derecho a cursar el programa de formaci&oacute;n previsto.</p>
                        </li>
                        <li>
                            <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos
                                del estudiante y a los deberes que de ellos se desprenden. Especialmente
                                significa que el estudiante comparte los postulados contenidos en
                                la Declaraci&oacute;n de Principios de la Escuela.</p>
                        </li>
                        <li>
                            <p align="justify">La matr&iacute;cula la legaliza el estudiante con
                                su firma, para lo cual deber&aacute; presentarse del <b><%=cronograma.elementAt(19)%></b>
                                con el comprobante de pago de los derechos de matr&iacute;cula. Una
                                vez haya firmado, ser&aacute; carnetizado como estudiante de la Maestría.
                        </li>
                        <li>Inicio de clases de la Maestría: <b><%=cronograma.elementAt(20)%></b>.</li>
                        <li>Inducción: <b><%=cronograma.elementAt(16)%></b>.</li>
                    </ul>
                    <p></p>
                </blockquote>
                <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a
                    y a la <b>MAESTRIA EN INGENIERIA CIVIL.</b></p>
                <p>Cordialmente,</p>
                <p>Direcci&oacute;n Maestría </p>

                <p>Para mayor informaci&oacute;n:</p>

                <p>Dr. Germán Santos Granados <br>
                    Director <a href="mailto: maestriacivil@escuelaing.edu.co">maestriacivil@escuelaing.edu.co</a>
                    <br>
                    <a href="mailto: german.santos@escuelaing.edu.co">german.santos@escuelaing.edu.co</a>
                    Teléfono. 668 3600, exts. 164 y 147</p>
                <p align="right"> <br>
                </p>
            </table>
            <%} else if (estud.elementAt(2).equals("353") || estud.elementAt(2).equals("321") || estud.elementAt(2).equals("322") || estud.elementAt(2).equals("330") || estud.elementAt(2).equals("331") || estud.elementAt(2).equals("371") || estud.elementAt(2).equals("372")) {%>

            <p><b>1.</b>
                <!--Cordialmente lo invitamos a una reuni&oacute;n informativa sobre
                      aspectos generales de la maestr&iacute;a en Ingenier&iacute;a Civil, resolver inquietudes sobre los procesos
                      administrativos y opciones de Financiaci&oacute;n Educativa el 25 de Julio en el sal&oacute;n D111
                a las 8:00 a.m.-->
                Su consejero Académico será el (la) <b>Ing.<%=tutor.elementAt(1)%></b>, correo
                electrónico:<%=tutor.elementAt(3)%>, con quien deberá acordar la propuesta
                de las asignaturas que conformarán su plan de estudios,<!-- durante los días
                <b><!%=cronograma.elementAt(27)%></b>--> para efectos de liquidación de la orden de matrícula
                correspondiente al periodo <%=cronograma.elementAt(2)%>, podrá pagar los derechos de matrícula o imprimir su orden
                siguiendo los pasos mencionados en este enlace <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst">
                    pagos en línea.</a>
            <p> Para quienes hayan obtenido un título de postgrado de la Escuela Colombiana
                de Ingeniería y deseen solicitar homologación de asignaturas, deberán entregar
                por escrito dicha solicitud dirigida al Director de la Maestría, <!--a más tardar
                el  <b><!%=cronograma.elementAt(26)%></b>--> indicando la lista de asignaturas cuya homologación se solicita.
            <p>

            <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional
                al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, en las fechas
                y con la orden de pago emitidas porla Escuela. El pago extraordinario tiene
                un recargo del 5%.
                <p><b>Valor del cr&eacute;dito: $<%=cronograma.elementAt(22)%>.oo</b></p>
                <p><b>2. Financiaci&oacute;n: </b>Ofrecemos diversas alternativas de financiaci&oacute;n
                    en corto y largo plazo, para cubrir hasta el 100% del valor de la matr&iacute;cula,
                    para mayor informaci&oacute;n comun&iacute;quese con la Oficina de Apoyo Financiero
                    al 6683600 ext.107 &oacute; 356.</p>
                <blockquote>
                    <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n:
                        </b> </p>
                    <ul>
                        <li>
                            <p align="justify">La matr&iacute;cula es el acto voluntario de una persona
                                natural mediante el cual se adquiere la calidad de estudiante de la
                                Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos
                                los requisitos se&ntilde;alados para la misma. Mediante este acto, el
                                estudiante se compromete a cumplir el reglamento y las dem&aacute;s
                                normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
                                el derecho a cursar el programa de formaci&oacute;n previsto.</p>
                        </li>
                        <li>
                            <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos
                                del estudiante y a los deberes que de ellos se desprenden. Especialmente
                                significa que el estudiante comparte los postulados contenidos en la
                                Declaraci&oacute;n de Principios de la Escuela.</p>
                        </li>
                        <li>
                            <p align="justify">La matr&iacute;cula la legaliza el estudiante con su
                                firma, para lo cual deber&aacute; presentarse con el comprobante de
                                pago de los derechos de matr&iacute;cula en la plazoleta del Bloque
                                A. Una vez haya firmado, ser&aacute; carnetizado como estudiante de
                                la Maestría.
                        </li>
                        <li>Inicio de clases de la Maestría: <b><%=cronograma.elementAt(20)%></b>.</li>
                        <li>Inducción: <b><%=cronograma.elementAt(16)%></b>.</li>
                    </ul>
                    <p></p>
                </blockquote>
                <%} else if (estud.elementAt(2).equals("351")) {%>
                <p><b>1.</b>
                    <!--Cordialmente lo invitamos a una reuni&oacute;n informativa sobre
                                  aspectos generales de la maestr&iacute;a en Ingenier&iacute;a Civil, resolver inquietudes sobre los procesos
                                  administrativos y opciones de Financiaci&oacute;n Educativa el 25 de Julio en el sal&oacute;n D111
                            a las 8:00 a.m.-->
                    Su consejero Académico será el (la) <b>Ing.<%=tutor.elementAt(1)%></b>, correo
                    electrónico:<%=tutor.elementAt(3)%>, con quien deberá acordar la propuesta
                    de las asignaturas que conformarán su plan de estudios.
                    <!-- durante los días
                            <b><!%=cronograma.elementAt(27)%></b>-->
                <p> <b>2. </b>Para efectos de liquidación de la orden de matrícula correspondiente
                    al periodo <%=cronograma.elementAt(2)%>, podrá pagar los derechos de matrícula
                    o imprimir su orden siguiendo los pasos mencionados en este enlace <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst">
                        pagos en línea.</a> y seg&uacute;n el cronograma vigente presentado al final
                    de esta comunicaci&oacute;n.
                <p> <b>3.</b>Para quienes hayan obtenido un título de postgrado de la Escuela Colombiana
                    de Ingeniería y deseen solicitar homologación de asignaturas, deberán entregar
                    por escrito dicha solicitud dirigida al Director de la Maestría, a más tardar
                    el <b><%=cronograma.elementAt(26)%>,</b> indicando la lista de asignaturas
                    cuya homologación se solicita.
                <p><b>4.</b><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional
                    al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, en las fechas
                    presentadas al final de esta comunicaci&oacute;n y en la p&aacute;gina de
                    internet y con la orden de pago emitidas por la Escuela. El pago extraordinario
                    tiene un recargo del 5%. Tenga en cuenta que el Valor del cr&eacute;dito acad&eacute;mico
                    es de <b>$<%=cronograma.elementAt(22)%>.oo</b>
                <p>


                <p><b>Financiaci&oacute;n: </b>Ofrecemos diversas alternativas de financiaci&oacute;n
                    en corto y largo plazo, para cubrir hasta el 100% del valor de la matr&iacute;cula,
                    para mayor informaci&oacute;n comun&iacute;quese con la Oficina de Apoyo Financiero
                    al 6683600 ext.107 &oacute; 356.</p>
                <blockquote>
                    <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n:
                        </b> </p>
                    <ul>
                        <li>
                            <p align="justify"> La matr&iacute;cula es el acto voluntario de una persona
                                natural mediante el cual se adquiere la calidad de estudiante de la
                                Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos
                                los requisitos se&ntilde;alados para la misma. Mediante este acto, el
                                estudiante se compromete a cumplir el reglamento y las dem&aacute;s
                                normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
                                el derecho a cursar el programa de formaci&oacute;n previsto.</p>
                        </li>
                        <li>
                            <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos
                                del estudiante y a los deberes que de ellos se desprenden. Especialmente
                                significa que el estudiante comparte los postulados contenidos en la
                                Declaraci&oacute;n de Principios de la Escuela.</p>
                        </li>
                        <li>
                            <p align="justify">La matr&iacute;cula la legaliza el estudiante con su
                                firma, para lo cual deber&aacute; presentarse con el comprobante de
                                pago de los derechos de matr&iacute;cula en la plazoleta del Bloque
                                A. Una vez haya firmado, ser&aacute; carnetizado como estudiante de
                                la Maestr&iacute;a. <br>
                            </p>
                        </li>
                    </ul>
                    <p>Fechas clave:</p>
                    <p><br>
                        <b>Emisi&oacute;n de &oacute;rdenes de pago:</b> 31 de julio de 2012<br>
                        <b> Matr&iacute;cula Ordinaria:</b> 31 de julio al 6 de agosto de 2012<br>
                        <b> Matr&iacute;cula Extraordinaria: </b>8 de agosto de 2012<br>
                        <b>Curso de Inducci&oacute;n al programa (asistencia obligatoria):</b> 9 de agosto
                        de 2012, 3:00 p.m.<br>
                        <b>Inicio de clases de la Maestr&iacute;a:</b> 10 de Agosto de 2012.<br>
                    </p>
                </blockquote>
                <%}%>
                <% if (estud.elementAt(2).equals("353")) {%>
                <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a
                    y a la <b>MAESTRIA EN GESTIÓN DE INFORMACIÓN.</b></p>
                <p>Cordialmente,</p>
                <p>Direcci&oacute;n Maestría </p>
                <p>Para mayor informaci&oacute;n:</p>
                <p>Ing. Victoria Eugenia Ospina Becerra<br>
                    Director <br>
                    <a href="mailto: victoria.ospina@escuelaing.edu.co">victoria.ospina@escuelaing.edu.co</a>
                    <a href="mailto:maestria.gestioninf@escuelaing.edu.co">maestria.gestioninf@escuelaing.edu.co</a><br>
                    <%} else if (estud.elementAt(2).equals("332") || estud.elementAt(2).equals("333")) {%>
                <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a
                    y a la <b>MAESTRIA EN INGENIERÍA ELECTRÓNICA.</b></p>
                <p>Cordialmente,</p>
                <p>Direcci&oacute;n Maestría </p>
                <br>
                <p> Ing. Alexánder Pérez Ruíz <br>
                    Director <a href="mailto: maestriaelectronica@escuelaing.edu.co">maestria.electronica@escuelaing.edu.co</a>
                    <br>
                    <a href="mailto: alexander.perez@escuelaing.edu.co">alexander.perez@escuelaing.edu.co</a>
                    Teléfono. 668 3600, exts. 164 y 147<br>
                </p>
                <%} else if (estud.elementAt(2).equals("351")) {%>
                <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a
                    y a la <b>MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS.</b></p>
                <p>Cordialmente,</p>
                <p>Direcci&oacute;n Maestría </p>
                <br>
                <p> Ing. Ricardo Arturo Benavides Bolaños<br>
                    Director <a href="mailto: maestria.gerencia@escuelaing.edu.co">maestria.gerencia@escuelaing.edu.co</a>
                    <br>
                    Teléfono. 668 3600, ext. 337<br>
                </p>
                <%}%></table>
                <%
                     }
                     if (estud.elementAt(3).equals("-181")) {%>
                <br>
                <table width="70%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="center">
                    <tr>
                        <td><b>Nombre: <%=estud.elementAt(1)%></b> <br>
                            <p>Una vez estudiada su hoja de vida acad&eacute;mica, profesional y laboral,
                                resultados de la entrevista, as&iacute; como otros aspectos del proceso
                                de selecci&oacute;n, lamentamos informarle que la Direcci&oacute;n de
                                la Maestría conceptu&oacute; no aprobar su solicitud de admisi&oacute;n.
                                No obstante lo anterior le agradecemos que haya escogido la Escuela
                                como una opci&oacute;n para adelantar sus estudios de posgrado y esperamos
                                que haya una pr&oacute;xima oportunidad para contar con usted como miembro
                                de nuestra comunidad acad&eacute;mica.
                            <p> Si desea mayor informaci&oacute;n al respecto por favor comuníquese
                                con la Dirección de la Maestría.</p><b>
                                <p>
                                    <%if (idplan.equals("353")) {
                                                                 programa = "MAESTRIA EN GESTIÓN DE INFORMACIÓN";%>
                                    Ing. Victoria Eugenia Ospina Becerra <br>
                                    Director<br>
                                    <a href="mailto:maestria.gestioninf@escuelaing.edu.co">maestria.gestioninf@escuelaing.edu.co</a><br>
                                    <a href="mailto:victoria.ospina@escuelaing.edu.co">victoria.ospina@escuelaing.edu.co</a><br>
                                    <%} else if (idplan.equals("290") || idplan.equals("291") || idplan.equals("292") || idplan.equals("293") || idplan.equals("294")) {%>
                                <p>Dr. Germán Santos Granados <br>
                                    Director <a href="mailto: maestriacivil@escuelaing.edu.co">maestriacivil@escuelaing.edu.co</a>
                                    <br>
                                    <a href="mailto: german.santos@escuelaing.edu.co">german.santos@escuelaing.edu.co</a>
                                    Teléfono. 668 3600, exts. 164 y 147<br>
                                    <%} else if (idplan.equals("332") || idplan.equals("333")) {%>
                                <p> Ing. Carlos Andrés Agualimpia Arriaga <br>
                                    Director <a href="mailto: maestriaelectronica@escuelaing.edu.co">maestria.electronica@escuelaing.edu.co</a>
                                    <br>
                                    <a href="mailto: alexander.perez@escuelaing.edu.co">alexander.perez@escuelaing.edu.co</a>
                                    Teléfono. 668 3600, exts. 164 y 147<br>
                                </p>
                                <b> </b> </td>
                    </tr>
                </table>
                <%}
                     }
                     if (estud.elementAt(3).equals("-185")) {%>
                <br>
                <table width="70%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="center">
                    <tr>
                        <td><b>Nombre: <%=estud.elementAt(1)%></b> <br>
                            <p>Su solicitud de admisión esta en estudio. Para mayor información por
                                favor comuníquese con la Dirección de la Maestría
                                    <p>
                                        <%if (idplan.equals("353")) {
                                                                     programa = "MAESTRIA EN GESTIÓN DE INFORMACIÓN";%>
                                        Ing. Victoria Eugenia Ospina Becerra<br>
                                        Director<br>
                                        <a href="mailto:maestria.gestioninf@escuelaing.edu.co">maestria.gestioninf@escuelaing.edu.co</a><br>
                                        <a href="mailto:victoria.ospina@escuelaing.edu.co">victoria.ospina@escuelaing.edu.co</a><br>
                                        <%} else if (idplan.equals("290")) {%>
                                    <p>Dr. Germán Santos Granados <br>
                                        Director <a href="mailto: maestriacivil@escuelaing.edu.co">maestriacivil@escuelaing.edu.co</a>
                                        <br>
                                        <a href="mailto: german.santos@escuelaing.edu.co">german.santos@escuelaing.edu.co</a>
                                        Teléfono. 668 3600, exts. 164 y 147<br>
                                        <%} else if (idplan.equals("332") || idplan.equals("333")) {%>
                                    <p> Ing. Alexander Pérez Ruíz <br>
                                        Director <a href="mailto: maestriaelectronica@escuelaing.edu.co">maestria.electronica@escuelaing.edu.co</a>
                                        <br>
                                        <a href="mailto: alexander.perez@escuelaing.edu.co">alexander.perez@escuelaing.edu.coo</a>
                                        Teléfono. 668 3600, exts. 164 y 147<br>
                                        </td>
                                        </tr>
                                        </table>
                                        <%}
                                                             } else if (estud.elementAt(3).equals("-111")) {%>


                                    <table align="center" width="70%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas">
                                        <tr>
                                            <td>&nbsp; </td>
                                        </tr>
                                        <tr>
                                            <td><b><%=titulos%></b></td>
                                        </tr>
                                        <tr>
                                            <td><b><%=estud.elementAt(1)%></b></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td valign="top" height="1000">
                                                <p align="justify"> </p>
                                                Después de realizado el proceso de selección, le informamos que inicialmente
                                                no fue seleccionado para iniciar actividades académicas el <%=cronograma.elementAt(20)%>. Sin embargo, teniendo en cuenta su hoja de vida académica
                                                y profesional y su desempeño en la entrevista a la que fue citado, usted
                                                quedó en <b>lista de espera.</b> En caso que por algún motivo, alguno
                                                de los seleccionados no utilice el cupo asignado, usted será uno de
                                                los opcionados para su reasignación. Inmediatamente queden cupos disponibles,
                                                nos comunicaremos con usted para continuar con el proceso de matrícula.
                                                <p> Cordialmente,<br>
                                                    Dirección Maestría<br>
                                                    Para mayor información: Teléfono<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" height="1000">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td valign="top" height="1000">&nbsp;</td>
                                        </tr>
                                    </table>
                                    <%}


                                     }%>


                                    </form>
                                    <%                      }
                                    %>
