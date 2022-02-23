<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    String docEst = request.getParameter("documento");
    PrintWriter oout = response.getWriter();
    String programa = "", titulo = "", nombre = "", fecha = "", hora = "", lugar = "", entrev = "", fecadmin = "", fecinicio = "", iddpto = "", examen = "";
    HttpSession sesion;
    otros.rutas ruta = new otros.rutas();
    int val = 0;
    int ban = 0;
    sesion = request.getSession(true);
    BDadmisiones bd = new BDadmisiones();
    String idplan = request.getParameter("idplan");

    configeci.configmaestria confEci = new configeci.configmaestria();
    Vector posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
    if (posgrados.size() > 0) {
        examen = posgrados.elementAt(9).toString();
    }
%>

<%if (docEst != null && !docEst.equals("")) {%>

<html>
    <head>
        <title>Consulta Entrevistas Maestría </title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <%if (idplan.equals("353")) {
                programa = "MAESTRÍA EN GESTIÓN DE INFORMACIÓN";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN GESTIÓN DE INFORMACIÓN" />
        </jsp:include>
        <%} else if (idplan.equals("332")) {
            programa = "MAESTRÍA EN  INGENIERÍA ELECTRÓNICA- MODALIDAD DE PROFUNDIZACIÓN";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERÍA ELECTRÓNICA" />
        </jsp:include>
        <%} else if (idplan.equals("333")) {
            programa = "MAESTRÍA EN  INGENIERÍA ELECTRÓNICA- MODALIDAD DE INVESTIGACIÓN";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERÍA ELECTRÓNICA" />
        </jsp:include>
        <%} else if (idplan.equals("351")) {
            programa = "MAESTRÍA EN  EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS" />
        </jsp:include>
        <%} else if (idplan.equals("330") || idplan.equals("331")) {
            programa = "MAESTRÍA EN  INGENIERIA INDUSTRIAL";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERIA INDUSTRIAL" />
        </jsp:include>
        <%} else if (idplan.equals("335") || idplan.equals("336")) {
            programa = "MAESTRÍA EN  INGENIERIA ELÉCTRICA";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERIA ELECTRICA" />
        </jsp:include>
        <%}else if (idplan.equals("371")) {
            programa = "MAESTRÍA EN INFORMÁTICA";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERIA ELECTRICA" />
        </jsp:include>
        <%}else if (idplan.equals("372")) {
            programa = "MAESTRÍA EN CIENCIAS ACTUARIALES";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERIA ELECTRICA" />
        </jsp:include>
        <%}else if (idplan.equals("376")|| idplan.equals("377")) {
            programa = "MAESTRÍA EN CIENCIA DE DATOS";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN CIENCIA DE DATOS" />
        </jsp:include>
        <%}else {
            programa = "MAESTRIA EN INGENIERIA CIVIL";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERÍA CIVIL" />
        </jsp:include>
        <%}%>

    <body bgcolor="#FFFFFF" text="#000000">

        <p>

            <%Vector estud = bd.Entrevistas(docEst, idplan, oout, confEci.getPeriodo());%>

            <%//Este if es para cuando no se programan entrevistas y ya es admitido el aspirante, no existe informacion en la tabla dispentrev
            /*if (idplan.equals("309")){
                 sesion.setAttribute("docEst", docEst);
                 response.sendRedirect("ConsultaEntrevAmb");
                 //estud = est.getnoentrevistas(docEst, idplan, oout, per ) ;
                 } */
                /*else {		*/

                //estud = est.getentrevistas("75090176", "370", oout, per ) ;
                if ((estud.size()) == 0) {%>



        <div align="center">
            <table width="50%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas" align="center">
                <tr>
                    <td><br>No existe información
                        registrada para este proceso, por favor comuníquese con la Oficina de Admisiones.
                        <br>
                        Tel&eacute;fono: 6683600 opción 2 en el menú. </td>
                    <!--<td valign="top">
              <div align="center">
                <h3><center>
                   <p>&nbsp;</p>
                    <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Su
                      documento es incorrecto o usted no formaliz&oacute; la solicitud
                      de admisión para este programa académico. <br>
                      Verifique e intente nuevamente o comuníquese con la Oficina de Admisiones.
                      <br>
                      Tel&eacute;fono: 6683600 Ext: 274, 263 o 101</font> </p>
                  </center></h3> </div>
            </td>-->
                </tr>
            </table>
        </div>

        <%        } else {
            for (int j = 0; j < estud.size(); j++) {
                Vector estudiante = (Vector) estud.elementAt(j);%>
        <div align="center">
            <table width="50%" border="0" cellspacing="0" cellpadding="0"   class="textoimpremas" >
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Estudio de
                        admisi&oacute;n para la  <b><%=programa%></b></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><%=(String) estudiante.elementAt(9)%></td>
                </tr>
                <tr>
                    <td height="19">
                        <p><%=estudiante.elementAt(0)%></p>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>

                    <td>Apreciado
                        Aspirante:</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <%if (estudiante.elementAt(10).equals("-185") && (idplan.equals("291"))) {%>
                <tr>
                    <td>
                        <p>Como parte
                            del estudio de su solicitud de admisi&oacute;n y proceso de selecci&oacute;n,
                            le informamos que deber&aacute; presentar los exámenes de conocimiento <!--el día--> <b><!%=examen%></b> <!--Igualmente, se deberá presentar-->  y la entrevista el pr&oacute;ximo:<b>
                                <%=estudiante.elementAt(3)%>, a las <%=estudiante.elementAt(4)%> en
                                <%=estudiante.elementAt(7)%></b>, con el Ingeniero(a): <%=estudiante.elementAt(8)%>
                            <!--<p>
                                Los estudiantes con  <B>ÉNFASIS EN INGENIERÍA ESTRUCTURAL </B> deberán presentar un exámen clasificatorio el día <!%=examen%>, para el cual es indispensable traer <b>CALCULADORA</b>; los temas  que trataran en el mencionado exámen son:<br>
    
                                Estática: equilibrio, fuerzas internas (armaduras, vigas, marcos), diagramas de fuerzas internas, centroides y momentos de inercia.<br>
    
                                Resistencia de materiales: Cálculo de esfuerzos (por corte axial, por torsión, por reflexión), transformación de esfuerzos, círculo de Mohr.<br>
    
                                Análisis estructural: métodos de la viga conjugada y giro deflexión, métodos de energía, análisis matricial. Uso de las Normas NSR-98 en el análisis.<br>
    
                                Diseño de estructuras de concreto: diseño de vigas, placas y columnas.<br>
    
                                Suelos: mecánica de suelos.
    
                            Esperamos su puntual asistencia.</p>-->
                        <p>Cordialmente</p>
                    </td>
                </tr>
                <%} else if (estudiante.elementAt(10).equals("-185") && (idplan.equals("351"))) {%>
                <tr>
                    <td>
                        <p>Como parte
                            del estudio de su solicitud de admisi&oacute;n y proceso de selecci&oacute;n,
                            le informamos que deber&aacute; presentar el exámen de competencias el día <%=examen%> y la Entrevista el  pr&oacute;ximo:<b>
                                <%=estudiante.elementAt(3)%>, a las <%=estudiante.elementAt(4)%> en el
                                <%=estudiante.elementAt(7)%></b>, con el profesor(a): <%=estudiante.elementAt(8)%>.<br>
                            Esperamos su puntual asistencia.</p>
                        <p>Cordialmente</p>
                    </td>
                </tr>        
                <%} else if (estudiante.elementAt(10).equals("-185")) {%>
                <tr>
                    <td>

                        <p>Como parte
                            del estudio de su solicitud de admisi&oacute;n y proceso de selecci&oacute;n,
                            le informamos que deber&aacute; presentar <!--los exámenes de conocimiento el día <b><!%=examen%></b> Igualmente, se deberá presentar a--> la entrevista el pr&oacute;ximo:<b>
                                <%=estudiante.elementAt(3)%>, a las <%=estudiante.elementAt(4)%> en
                                <%=estudiante.elementAt(7)%></b>, con el Ingeniero(a): <%=estudiante.elementAt(8)%>
                            <!--<p>
                                Los estudiantes con  <B>ÉNFASIS EN INGENIERÍA ESTRUCTURAL </B> deberán presentar un exámen clasificatorio el día <%=examen%>, para el cual es indispensable traer <b>CALCULADORA</b>; los temas  que trataran en el mencionado exámen son:<br>
    
                                Estática: equilibrio, fuerzas internas (armaduras, vigas, marcos), diagramas de fuerzas internas, centroides y momentos de inercia.<br>
    
                                Resistencia de materiales: Cálculo de esfuerzos (por corte axial, por torsión, por reflexión), transformación de esfuerzos, círculo de Mohr.<br>
    
                                Análisis estructural: métodos de la viga conjugada y giro deflexión, métodos de energía, análisis matricial. Uso de las Normas NSR-98 en el análisis.<br>
    
                                Diseño de estructuras de concreto: diseño de vigas, placas y columnas.<br>
    
                                Suelos: mecánica de suelos.
    
                            Esperamos su puntual asistencia.</p>-->
                        <p>Cordialmente</p>
                    </td>
                </tr>

                <% } else if (estudiante.elementAt(10).equals("-179")) {%>
                <tr>
                    <td>

                        <p>El Comité
                            de la Especialización conceptu&oacute; que no es necesario citarlo a entrevista
                            y por lo tanto deberá consultar el <!--próximo--> <b> <%=posgrados.elementAt(10)%> </b>, en la
                            sección de Admitidos, el procedimiento a seguir para el tr&aacute;mite
                            de su matr&iacute;cula.</p>
                        <p>Cordialmente</p>
                    </td>
                </tr>
                <%} else if (estudiante.elementAt(10).equals("-181")) {%>
                <tr>
                    <td>
                        <p>Una vez estudiada
                            su hoja de vida acad&eacute;mica, profesional y laboral, as&iacute; como
                            otros aspectos del proceso de selecci&oacute;n, lamentamos informarle
                            que la Direcci&oacute;n de la Especializaci&oacute;n conceptu&oacute;
                            no aprobar su solicitud de admisi&oacute;n para iniciar actividades acad&eacute;micas
                            el <b><%=fecinicio%></b>.No obstante lo anterior
                            le agradecemos que haya escogido la Escuela como una opci&oacute;n para
                            adelantar sus estudios de posgrado y esperamos que haya una pr&oacute;xima
                            oportunidad para contar con usted como un miembro de nuestra comunidad
                            acad&eacute;mica.</p>
                    </td>
                </tr>
                <%} else {%>
                <tr>
                    <td>No existe
                        información registrada para este proceso, por favor comuníquese con la Oficina
                        de Admisiones. <br>
                        Tel&eacute;fono: 6683600 Ext: 145, 146 o 101.</td>
                </tr>
                <%}%>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <p>Direcci&oacute;n
                            <br>

                            <%=programa%>
                        </p>
                        <% if (idplan.equals("353")) {%>

                        <p>Ingeniera Victoria Eugenia Ospina Becerra
                            <br>Directora<br>
                            <a href="mailto:maestria.gestioninf@escuelaing.edu.co">maestria.gestioninf@escuelaing.edu.co</a><br>
                            <a href="mailto:victoria.ospina@escuelaing.edu.co">victoria.ospina@escuelaing.edu.co</a><br>


                            <%} else if (idplan.equals("321") || idplan.equals("322")) {%>
                        <p>Ingeniero. Carlos Agualimpia Arriaga
                            <br>Director<br>
                            <a href="mailto:maestria.electronica@escuelaing.edu.co">maestria.electronica@escuelaing.edu.co</a><br>

                            Tel&eacute;fono. 668 3600, exts. 252</p>
                            <%} else if (idplan.equals("351")) {%>
                        <P>Ing. Ricardo Arturo Benavides Bolaños
                            <br>Director Unidad de proyectos
                            <br>Teléfono: 668 3600 ext.337
                            <br>maestria.gerencia@escuelaing.edu.co

                            <%} else if (idplan.equals("330") || idplan.equals("331")) {%>

                            <br>Ing. Sonia Jaimes
                            <br>Directora
                            <br> <a href="mailto:sonia.jaimes@escuelaing.edu.co">sonia.jaimes@escuelaing.edu.co</a>
                            <br> <a href="mailto:maestria.industrial@escuelaing.edu.co">maestria.industrial@escuelaing.edu.co</a>
                            <br>Teléfono. 668 3600, exts. 278 - 279

                            <%} else if (idplan.equals("335") || idplan.equals("336")) {%>

                            <br>Ing. Paula Ximena Ríos Reyes
                            <br>Coordinadora
                            <br><a href="mailto:maestria.electrica@escuelaing.edu.co">maestria.electrica@escuelaing.edu.co</a>
                            <br><a href="mailto:paula.rios@escuelaing.edu.co">paula.rios@escuelaing.edu.co</a>

                            <br>Teléfono. 668 3600, exts. 588, 143 y 369

                            <%} else {%>
                        <p>Dr. Germán
                            Santos Granados
                            <br>Director<br>
                            <a href="mailto:maestriacivil@escuelaing.edu.co">maestriacivil@escuelaing.edu.co</a><br>
                            <a href="mailto:german.santos@escuelaing.edu.co">german.santos@escuelaing.edu.co</a><br>
                            Tel&eacute;fono. 668 3600, exts. 164 y 147</p>
                            <%}%>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <br>
    </body>
</html>

<%}
    }//else - for%>
<!%} // IF de ambiental%>
<%} else {
%>
<html>
    <body>
        <p>&nbsp;</p>
        <p align="center"><h3><center>Usted no se autenticó correctamente o no es un usario autorizado.</center></h3>
    </body>
</html>
<%        }
%>
