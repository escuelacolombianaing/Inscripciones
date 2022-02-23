<%-- 
    Document   : consultadmiposnvo
    Created on : 8/07/2010, 10:46:30 AM
    Author     : lrodriguez
--%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    String docEst = request.getParameter("documento");
    String idplan = request.getParameter("idplan");
    PrintWriter oout = response.getWriter();
    configeci.configPosgrados confEci = new configeci.configPosgrados();
    String respadm = "", induccion = "", fecinicio = "", valorniv = "", ordenesp = "", firmaesp = "";
    String programa = "", fecordenes = "", fecpagos = "", fecniv = "", firmaniv = "", valortotal = "", creditos = "", valcredito = "";
    otros.rutas ruta = new otros.rutas();
    BDadmisiones bd = new BDadmisiones();
    int val = 0;
    int ban = 0;
    String titulo = "Aspirantes a un programa de posgrado";
    if (docEst != null && !docEst.equals("")) {
%>
<html>
    <head>
        <title>Consulta Admisiones</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function ventanaSecundaria (URL){
            window.open(URL,"","width=800,height=430,scrollbars=no,top=100,left=100")
            }
            //-->
        </script>
    </head>

    <!%=confEci.getPeriodoant()%>
    <body bgcolor="#FFFFFF" text="#000000">
        <%if (idplan.equals("370")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        <%} else {%>

        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        <%}%>
        <!--getperiodoant solo para cuando se crucen los periodos 2008-1-2008-2
        por ejemplo se requiere publicar admitidos QHSE 2008-1 y las inscripciones de las otras especializa
        ciones son para 2008-2-->

        <% Vector estud = new Vector();
            Vector cronograma = new Vector();
            if (idplan.equals("370")) {
                estud = bd.AdmitidosPos(docEst, idplan, confEci.getPeriodo(), oout);

                // Vector cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
                // ESTE PERIODO SE COLOCA MANUAL SOLO POR DOS SEMANAS YA Q SE ESTAN CRUZANDO EN ESTA FECHA SEPTO2010LOS PERIODOS10-2 Y 11-1
                cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
            } else {
                estud = bd.AdmitidosPos(docEst, idplan, confEci.getPeriodo(), oout);

                cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
            }

            String prog = "";
            String titulos = "";%>


        <%  String link = "";
            if (idplan.equals("312")) {
                prog = "ESPECIALIZACION EN ESTRUCTURAS";
            }

            if (idplan.equals("374")) {
                prog = "ESPECIALIZACI�N EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
            }

            if (idplan.equals("267")) {
                prog = "ESPECIALIZACION EN DISE�O CONSTRUCCION Y CONSERVACION DE VIAS";
            }

            if (idplan.equals("313")) {
                prog = "ESPECIALIZACION EN ECONOMIA PARA INGENIEROS";
            }

            if (idplan.equals("370")) {
                prog = "ESPECIALIZACI�N EN GESTI�N INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE";
            }

            if (idplan.equals("310")) {
                prog = "ESPECIALIZACION EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
            }

            if (idplan.equals("309")) {
                prog = "ESPECIALIZACION EN SANEAMIENTO AMBIENTAL";
            }
            if (idplan.equals("324")) {
                prog = "ESPECIALIZACION EN TELEMATICA APLICADA A NEGOCIOS";
            }
            if (idplan.equals("285")) {
                prog = "ESPECIALIZACION EN PROCESAMIENTO DE POLIMEROS";
            }
            if (idplan.equals("320")) {
                prog = "ESPECIALIZACION EN INGENIERIA DE FUNDACIONES";
            }
            if (idplan.equals("373")) {
                prog = "ESPECIALIZACION EN GERENCIA DE OPERACIONES";
            }
            if (idplan.equals("353")) {
                prog = "MAESTRIA EN GESTI�N DE INFORMACI�N";
            }

            if (idplan.equals("351")) {
                prog = "MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS ";
            }
            if (idplan.equals("335") || idplan.equals("336")) {
                prog = "MAESTRIA EN INGENIERIA EL�CTRICA";
            }

            if (idplan.equals("330") || idplan.equals("331")) {
                prog = "MAESTRIA EN INGENIERIA INDUSTRIAL";
            }

            if (idplan.equals("332") || idplan.equals("333")) {
                prog = "MAESTRIA EN INGENIERIA ELECTR�NICA";
            }

            if (idplan.equals("290") || idplan.equals("291") || idplan.equals("292") || idplan.equals("293")) {
                prog = "MAESTRIA EN INGENIERIA CIVIL";
            }
            
            if (idplan.equals("371")) {
                prog = "MAESTR�A EN INFORM�TICA";
            }
            
            if (idplan.equals("372")) {
                prog = "MAESTR�A EN CIENCIAS ACTUARIALES";
            }
            if (idplan.equals("376") || idplan.equals("377")) {
                prog = "MAESTR�A EN CIENCIA DE DATOS";
            }

            if ((estud.size()) == 0) {%>

        <table align="center" width="70%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas">
            <tr>
                <td valign="top">
                    <div align="center">

                        <p>&nbsp;</p>

                        <p>Su documento es incorrecto o usted no formaliz&oacute; la solicitud
                            de admisi�n para este programa acad�mico. <br>
                            Verifique e intente nuevamente o comun�quese con la Oficina de Admisiones.
                            <br>
                            Tel&eacute;fono: 6683600 opci�n 2 en el men�. </p>
                        </h3> </div>
                </td>
            </tr>
        </table>
        <%} else {

            Vector estudios = bd.Titulo((String) estud.elementAt(0));
            if ((estudios.size()) > 0) {
                for (int m = 0; m < estudios.size(); m++) {
                    Vector estudiosant = (Vector) estudios.elementAt(m);
                    titulos = (String) estudiosant.elementAt(1);
                    if (titulos.equals("OTRA")) {
                        titulos = "ASPIRANTE";
                    }
                }
            }


            Vector tutor = bd.Tutores(docEst, oout);%>



        <!--Para La respta de ADMITIDOS de QHSE cdo hay dos cohores a la vez se crea cronogramaqhse.txt
        y se valida aqui la cohorte por eje esta es la cohorte 12(2008-1) y el cronograma.txt va la cohorte 11-->

        <%if ((estud.elementAt(3).equals("-179") || estud.elementAt(3).equals("-106")) && ban == 0) {%>
        <BR>

        <div align="center">
            <table align="center" width="63%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas">
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
                        <p align="justify">En nombre de la Escuela Colombiana de Ingenier&iacute;a 
                            Julio Garavito, nos es grato comunicarle que su solicitud de admisi&oacute;n 
                            a nuestro programa de <b><%=prog%></b>, ha sido aprobada para iniciar 
                            actividades acad&eacute;micas a partir <b>del <%=cronograma.elementAt(20)%></b>. 
                            Usted har&aacute; parte de la comunidad acad&eacute;mica de una de las 
                            Instituciones de Educaci&oacute;n Superior con mayor prestigio nacional 
                            e internacional, que le da a usted una cordial bienvenida. </p>
                        <p>Para dar inicio a su proceso de matr&iacute;cula deber&aacute; tener 
                            en cuenta lo siguiente:</p>
                        <!--Especializacion en Pol�meros -->
                        <%if (estud.elementAt(2).equals("285")) {%>
                        <ul>
                            <li><b>
                                    <p align="justify"> <b><%=cronograma.elementAt(13)%> se publicar� en 
                                            la p�gina Web la &oacute;rden de pago de los derechos de matr&iacute;cula 
                                        </b> <br>
                                </b></li>
                            <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
                                al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa 
                                entrega de la orden de pago. </li>
                        </ul>
                        
                            <p>El pago extraordinario tiene un recargo del 5%.</p>
                            <p><b>Valor del cr&eacute;dito: $ <%=cronograma.elementAt(22)%>.oo</b></p>
                            <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
                                                (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
                                                el correspondiente desprendible en la Oficina de Apoyo     Financiero
                                                de la Escuela, Bloque A, primer piso, para registrar dicho
                                                pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
                                            carnetizarse y asignarle su horario.</p>-->
                       
                        <ul>
                            <li><b>Financiaci&oacute;n:</b> 
                                <p align="justify">Si usted requiere solicitar financiaci&oacute;n, 
                                    deber&aacute; tramitarla con una semana de anticipaci&oacute;n a la 
                                    fecha l&iacute;mite de pago para lo cual deber&aacute; acercarse a 
                                    la <a href="http://www.escuelaing.edu.co/es/financiacion/financiacion_posgrado/corto_plazo" target="_blank">Oficina 
                                        de apoyo financiero a estudiantes</a>. Para mayor informaci�n comun�quese con la Oficina de Apoyo Financiero 
                                        al 6683600 ext.107 � 356.</p>
                            </li>
                        </ul>
                        <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
                        <p align="justify">Una vez haya realizado el pago, deber� formalizar su 
                            matr&iacute;cula, as&iacute;:</p>
                       
                            <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
                                </b> </p>
                            <ul>
                                <li>
                                    <p align="justify">La matr&iacute;cula es el acto voluntario de una 
                                        persona natural mediante el cual se adquiere la calidad de estudiante 
                                        de la Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento 
                                        de todos los requisitos se&ntilde;alados para la misma. Mediante 
                                        este acto, el estudiante se compromete a cumplir el reglamento y 
                                        las dem&aacute;s normas establecidas por la Instituci&oacute;n y 
                                        por el Estado y adquiere el derecho a cursar el programa de formaci&oacute;n 
                                        previsto.</p>
                                </li>
                                <li>
                                    <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos 
                                        del estudiante y a los deberes que de ellos se desprenden. Especialmente 
                                        significa que el estudiante comparte los postulados contenidos en 
                                        la Declaraci&oacute;n de Principios de la Escuela.</p>
                                </li>
                                <li>
                                    <p align="justify">La matr&iacute;cula la legaliza el estudiante con 
                                        su firma, para lo cual deber&aacute; presentarse el <b><%=cronograma.elementAt(19)%></b> 
                                        en la Oficina de Secretar&iacute;a General, Primer Piso, Bloque 
                                        A con el comprobante de pago de los derechos de matr&iacute;cula. 
                                        Una vez haya firmado, ser&aacute; carnetizado como estudiante de 
                                        la Especializaci&oacute;n.
                                </li>
                                <li>Inicio de clases de la Especializaci&oacute;n: <b><%=cronograma.elementAt(20)%></b>.</p></li>
                            </ul>
                            <p></p>
                       
                        <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
                            y a la Especializaci&oacute;n en <b><%=prog%></b></p>
                        <p>Cordialmente,</p>
                        <p>Direcci&oacute;n Especializaci&oacute;n </p>
                        <p>Para mayor informaci&oacute;n:</p>
                        <p>William Moreno <a href="mailto: william.moreno@escuelaing.edu.co"> william.moreno@escuelaing.edu.co 
                            </a> 
                            <%}%>
                            <!--Especializacion en Gerencia de proyectos-->
                            <%if (estud.elementAt(2).equals("374")) {%>
                        </p>
                        <p>1. Su consejero Acad�mico ser� el (la) <b>Ing.<%=tutor.elementAt(1)%></b>, cuyo 
                            correo electr�nico es <%=tutor.elementAt(3)%> 
                        </p>
                        <p> 
                        <p>2. Las asignaturas que usted cursar� en el periodo <%=confEci.getPeriodo()%> son:</p>
                        <p>&nbsp;</p>
                        <p> 
                <li>Fundamentos - FTOS (E) (3 cr&eacute;ditos) 
                <li>Gerencia de Proyectos b&aacute;sica - GPBA (E) (3 cr&eacute;ditos) 
                <li>Estrategia y Formulaci&oacute;n de Proyectos - ESFO (E) (3 cr&eacute;ditos) 
                    <p>Cualquier inquietud con respecto a la inscripci�n de asignaturas, debe 
                        ser tratada con su consejero. </p>
                    <p>3. Podr� pagar los derechos de matr�cula o imprimir su orden de pago 
                        siguiendo los pasos mencionados en este <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst"> 
                            pagos en l�nea</a>, y seg�n el cronograma vigente presentado al final 
                        de esta comunicaci�n. </p>
                    <p>4. Quienes deseen solicitar homologaci�n de asignaturas cursadas en 
                        un programa de posgrado de la Escuela o de otra instituci�n, deber�n 
                        solicitarlo por escrito mediante comunicaci�n dirigido al Director de 
                        la Especializaci�n, a m�s tardar el 10 de agosto de 2018, indicando 
                        la lista de asignaturas cuya homologaci�n se solicita, seg�n formato 
                        suministrado por la direcci�n del programa. </p>
                    <p>5. Pagos: el valor de la matricula cada per�odo es directamente proporcional 
                        al n�mero de cr�ditos a cursar y se debe pagar a su inicio, en las fechas 
                        presentadas al final de esta comunicaci�n y en la p�gina de internet 
                        y con la orden de pago emitida por la Escuela. El pago extraordinario 
                        tiene un recargo del 5%. Tenga en cuenta que el valor del cr�dito acad�mico 
                        para el a�o <%=cronograma.elementAt(2)%> es de $<%=cronograma.elementAt(22)%>. 
                    </p>
                    <p>6. Financiaci�n: diferentes entidades ofrecen alternativas de financiaci�n 
                        a corto y largo plazo, para cubrir hasta el 100 % del valor de la matr�cula. 
                        Para mayor informaci�n comun�quese con la Oficina de Apoyo Financiero 
                        al 6683600 ext.107 � 356. </p>
                    <p>7. Formalizaci�n de matr�cula y carnetizaci�n: </p>
                    <p> 
                    <ul>
                        <li>La matr�cula es el acto voluntario de una persona natural mediante el 
                            cual se adquiere la calidad de estudiante de la Escuela Colombiana de 
                            Ingenier�a, previo el cumplimiento de todos los requisitos se�alados para 
                            la misma. Mediante este acto, el estudiante se compromete a cumplir el 
                            reglamento y las dem�s normas establecidas por la Instituci�n y por el 
                            Estado y adquiere el derecho a cursar el programa de formaci�n previsto. 
                        <li>Seg�n el Reglamento Estudiantil de Posgrados, la matr�cula formaliza 
                            el acceso a los derechos del estudiante y a los deberes que de ellos se 
                            desprenden. Especialmente significa que el estudiante comparte los postulados 
                            contenidos en la Declaraci�n de Principios de la Escuela. 
                        <li>La matr�cula la legaliza el estudiante con su firma, para lo cual deber� 
                            presentarse a m�s tardar el 4 de agosto de 2018 Ventanilla 10 (certificaciones y matriculas) Bloque A 1er piso; con el comprobante de pago de los derechos de matr�cula.Una 
                            vez haya firmado, ser� carnetizado como estudiante de la Especializaci�n. </ul>
                    <p>8. Fechas importantes a tener en cuenta: 
                <li>Emisi�n de �rdenes de pago: <%=cronograma.elementAt(13)%> 
                <li>Matr�cula: <%=cronograma.elementAt(15)%>
                <li>Curso de Inducci�n al programa (asistencia obligatoria): <%=cronograma.elementAt(16)%> 

                <li>Inicio de clases de la Especializaci�n: <%=cronograma.elementAt(20)%> 
                    <p>&nbsp;</p>
                    Sea usted bienvenido a la Escuela Colombiana de Ingenier�a y a la ESPECIALIZACI�N 
                    EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS. 
                    <p> Cordialmente, 
                    <p>Ing. Ricardo Arturo Benavides Bola�os
                    <p> Director Especializaci�n en Desarrollo y Gerencia de Proyectos
                    <p><a href="mailto: ricardo.benavides@escuelaing.edu.co"> ricardo.benavides@escuelaing.edu.co 
                        </a>
                    <p> Tel�fono. 668 3600, ext. 575 
                        <%}%>
                        <!--Especializaci�n en Econom�a -->
                        <%if (estud.elementAt(2).equals("313")) {%>
                    </p>
                    <ul>
                        <li><b> 
                                <p align="justify"> El <b><%=cronograma.elementAt(13)%> podr� pagar 
                                        los derechos de matr�cula o imprimir su orden siguiendo los pasos 
                                        mencionados en este enlace <a href="http://www.escuelaing.edu.co//uploads/descargables/2932_manual_matriculas_posgrados.pdf">manual 
                                            de pagos en l�nea</a> <br>
                                        </li>
                                        <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
                                            al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa 
                                            entrega de la orden de pago. 
                                            </ul>
                                            
                                                <p>El pago extraordinario tiene un recargo del 5%.</p>
                                                <p><b>Valor del cr&eacute;dito: $<%=cronograma.elementAt(22)%>.oo</b></p>
                                                <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
                                                                                          (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
                                                                                          el correspondiente desprendible en la Oficina de Apoyo Financiero
                                                                                          de la Escuela, Bloque A, primer piso, para registrar dicho
                                                                                          pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
                                                                                      carnetizarse y asignarle su horario.</p>-->
                                           
                                            <ul>
                                                <li><b>Financiaci&oacute;n:</b> 
                                                    <p align="justify">Si usted requiere solicitar financiaci&oacute;n, 
                                                        deber&aacute; tramitarla con una semana de anticipaci&oacute;n a 
                                                        la fecha l&iacute;mite de pago para lo cual deber&aacute; acercarse 
                                                        a la <a href="http://www.escuelaing.edu.co/es/financiacion/financiacion_posgrado/corto_plazo" target="_blank">Oficina 
                                                            de apoyo financiero a estudiantes</a>. Para mayor informaci�n comun�quese con la Oficina de Apoyo Financiero 
                                                            al 6683600 ext.107 � 356.</p>
                                                </li>
                                            </ul>
                                            <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
                                            <p align="justify">Una vez haya realizado el pago, deber� formalizar su 
                                                matr&iacute;cula, as&iacute;:</p>
                                          
                                                <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
                                                    </b> </p>
                                                <ul>
                                                    <li> 
                                                        <p align="justify">La matr&iacute;cula es el acto voluntario de 
                                                            una persona natural mediante el cual se adquiere la calidad de 
                                                            estudiante de la Escuela Colombiana de Ingenier&iacute;a, previo 
                                                            el cumplimiento de todos los requisitos se&ntilde;alados para 
                                                            la misma. Mediante este acto, el estudiante se compromete a cumplir 
                                                            el reglamento y las dem&aacute;s normas establecidas por la Instituci&oacute;n 
                                                            y por el Estado y adquiere el derecho a cursar el programa de 
                                                            formaci&oacute;n previsto.</P>
                                                    </li>
                                                    <li> 
                                                        <p align="justify">La matr&iacute;cula formaliza el acceso a los 
                                                            derechos del estudiante y a los deberes que de ellos se desprenden. 
                                                            Especialmente significa que el estudiante comparte los postulados 
                                                            contenidos en la Declaraci&oacute;n de Principios de la Escuela.</P>
                                                    </li>
                                                    <li> 
                                                        <p align="justify">La matr&iacute;cula la legaliza el estudiante 
                                                            con su firma, para lo cual deber&aacute; presentarse el <b><%=cronograma.elementAt(19)%></b> 
                                                            en la Oficina de Secretar&iacute;a General, Primer Piso, Bloque 
                                                            A con el comprobante de pago de los derechos de matr&iacute;cula. 
                                                            Una vez haya firmado, ser&aacute; carnetizado como estudiante 
                                                            de la Especializaci&oacute;n. 
                                                    </li>
                                                    <li>Inicio de clases de la Especializaci&oacute;n: <b><%=cronograma.elementAt(20)%></b>.</P></li>
                                                </ul>
                                                <p></p>
                                            
                                            <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
                                                y a la Especializaci&oacute;n en <b><%=prog%></b></p>
                                            <p>Cordialmente,</p>
                                            <p>Direcci&oacute;n Especializaci&oacute;n </p>
                                            <p>Para mayor informaci&oacute;n:</p>
                                            <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                                                Tel Directo: 6762288 <br>
                                                PBX: 6683600 exts. 374, 129 y 310.<br>
                                                <a href="mailto:beatriz.torres@escuelaing.edu.co">Beatriz.torres@escuelaing.edu.co</a> 
                                            </p>
                                            <%}%>
                                            <%if (estud.elementAt(2).equals("312")) {
                                                    if (tutor.size() <= 0) {%>
                                            <br>
                                            No tiene consejero acad�mico asignado

                                            <%} else {%>
                                            <p><b>1.</b> 
                                                <!--Cordialmente lo invitamos a una reuni&oacute;n informativa sobre
                                                                                        aspectos generales de la maestr&iacute;a en Ingenier&iacute;a Civil, resolver inquietudes sobre los procesos
                                                                                        administrativos y opciones de Financiaci&oacute;n Educativa el 25 de Julio en el sal&oacute;n D111
                                                                                      a las 8:00 a.m.-->
                                                Su consejero Acad�mico ser� el (la) Ing.<%=tutor.elementAt(1)%>, correo 
                                                electr�nico:<%=tutor.elementAt(3)%>, con quien deber� acordar la propuesta 
                                                de las asignaturas que conformar�n su plan de estudios a m�s tardar 
                                                el <%=cronograma.elementAt(27)%>, para efectos de liquidaci�n de la 
                                                orden de matr�cula correspondiente al periodo <%=cronograma.elementAt(2)%>. 
                                                <!--El director del �nfasis enviar� por correo electr�nico
                                                                                      sugerencias para su registro acad�mico basados en los intereses que usted manifest� en la entrevista y su
                                                                                      disponibilidad horaria.-->
                                                <b><%=cronograma.elementAt(13)%></b>,podr� pagar los derechos de matr�cula 
                                                o imprimir su orden siguiendo los pasos mencionados en el enlace <a href="http://www.escuelaing.edu.co//uploads/descargables/2932_manual_matriculas_posgrados.pdf">manual 
                                                    de pagos en l�nea</a> <br>
                                            </p>
                                            <p>Si tiene alguna duda sobre el proceso de inscripci�n, puede comunicarse 
                                                al 668 36 00 exts 230 y 324. </p>
                                            <p> 
                                        <li><b>Pagos</b>: El valor de cada per�odo es directamente proporcional 
                                            al n�mero de cr�ditos y se debe pagar a su inicio, previa entrega de la 
                                            orden de pago. 
                                            <!--El valor total de la Especializaci�n para el a�o 2010 es de  <b><!%=valortotal%></b> correspondiente a  <b><!%=creditos%></b>  cr�ditos.-->
                                            <p> El pago extraordinario tiene un recargo del 5%. <br>
                                            <p><b>Valor del cr&eacute;dito acad�mico: $ <%=cronograma.elementAt(22)%>.oo</b></p>
                                            <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
                                                                                (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
                                                                                el correspondiente desprendible en la Oficina de Apoyo Financiero
                                                                                de la Escuela, Bloque A, primer piso, para registrar dicho
                                                                                pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
                                                                                carnetizarse y asignarle su horario.</p>-->
                                            <p> 2. <b>Financiaci&oacute;n:</b> 
                                            <p align="justify">Ofrecemos diversas alternativas de financiaci�n en 
                                                corto y largo plazo, para cubrir hasta el 100% del valor de la matr�cula, 
                                                para mayor informaci�n comun�quese con la Oficina de Apoyo Financiero 
                                                al 6683600 ext. 107 � 356.</p>
                                        </li>
                                        <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
                                        <p align="justify">Una vez haya realizado el pago, deber� formalizar su 
                                            matr&iacute;cula, as&iacute;:</p>
                                       
                                            <p align="justify"><b> Firma del acta de matr�cula y carnetizaci&oacute;n: 
                                                </b> </p>
                                            <ul>
                                                <li>
                                                    <p align="justify">La matr�cula es el acto voluntario de una persona 
                                                        natural mediante el cual se adquiere la calidad de estudiante de 
                                                        la Escuela Colombiana de Ingenier�a, previo el cumplimiento de todos 
                                                        los requisitos se�alados por la misma. Mediante este acto, el estudiante 
                                                        se compromete a cumplir el reglamento y las dem�s normas establecidas 
                                                        por la Instituci�n y por el Estado y adquiere el derecho a cursar 
                                                        el programa de formaci�n previsto.</P>
                                                </li>
                                                <li>
                                                    <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos 
                                                        del estudiante y a los deberes que de ellos se desprenden. Especialmente 
                                                        significa que el estudiante comparte los postulados contenidos en 
                                                        la Declaraci&oacute;n de Principios de la Escuela.</P>
                                                </li>
                                                <li>
                                                    <p align="justify">La matr&iacute;cula la legaliza el estudiante con 
                                                        su firma, para lo cual deber&aacute; presentarse <b><%=cronograma.elementAt(19)%></b> 
                                                        , con el comprobante de pago de los derechos de matr&iacute;cula. 
                                                        Una vez haya firmado, ser&aacute; carnetizado como estudiante de 
                                                        la Especializaci&oacute;n.
                                                </li>
                                                <li>Inducci�n: <b><%=cronograma.elementAt(16)%></b>.</li>
                                                <li>Inicio de clases de la Especializaci&oacute;n: <b><%=cronograma.elementAt(20)%></b>.</li>
                                            </ul>
                                            <p></p>
                                      
                                        <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
                                            y a la Especializaci&oacute;n en <b><%=prog%></b></p>
                                        <p>Cordialmente,</p>
                                        <p>Direcci&oacute;n Especializaci&oacute;n </p>
                                        <p>Para mayor informaci&oacute;n:</p>
                                        Dr. Pedro Nel Quiroga Saavedra<br>
                                        Director<br>
                                        <a href="mailto:pedro.quiroga@escuelaing.edu.co">pedro.quiroga@escuelaing.edu.co</a> 
                                        <br>
                                        Tel. 6683600 Ext. 267.<br>
                                        <p> </p>
                                        <p> 
                                            <%}
                                                }%>
                                            <!--Especializacion Gerencia de Producci�n Industrial-->
                                            <%if (estud.elementAt(2).equals("373")) {%>
                                        </p><
                                        <ul>
                                            <li><b>
                                                    <p align="justify"> El <b><%=cronograma.elementAt(13)%> podr� pagar 
                                                            los derechos de matr�cula o imprimir su orden siguiendo los pasos 
                                                            mencionados en este enlace <a href="http://www.escuelaing.edu.co//uploads/descargables/2932_manual_matriculas_posgrados.pdf">manual 
                                                                de pagos en l�nea</a> <br>
                                                            </li>
                                                            <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
                                                                al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa 
                                                                entrega de la orden de pago. 
                                                                </ul>
                                                               
                                                                    <p>El pago extraordinario tiene un recargo del 5%.</p>
                                                                    <p><b>Valor del cr&eacute;dito: $<%=cronograma.elementAt(22)%>.oo</b></p>
                                                                    <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
                                                                                                                                    (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
                                                                                                                                    el correspondiente desprendible en la Oficina de Apoyo Financiero
                                                                                                                                    de la Escuela, Bloque A, primer piso, para registrar dicho
                                                                                                                                    pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
                                                                                                                                carnetizarse y asignarle su horario.</p>-->
                                                               
                                                                <ul>
                                                                    <li><b>Financiaci&oacute;n:</b> 
                                                                        <p align="justify">Si usted requiere solicitar financiaci&oacute;n, 
                                                                            deber&aacute; tramitarla con una semana de anticipaci&oacute;n a la 
                                                                            fecha l&iacute;mite de pago para lo cual deber&aacute; acercarse a 
                                                                            la <a href="http://www.escuelaing.edu.co/es/financiacion/financiacion_posgrado/corto_plazo" target="_blank">Oficina 
                                                                                de apoyo financiero a estudiantes</a>. Para mayor informaci�n comun�quese con la Oficina de Apoyo Financiero 
                                                                                    al 6683600 ext.107 � 356.</p>
                                                                    </li>
                                                                </ul>
                                                                <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
                                                                <p align="justify">Una vez haya realizado el pago, deber� formalizar su 
                                                                    matr&iacute;cula, as&iacute;:</p>
                                                               
                                                                    <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
                                                                        </b> </p>
                                                                    <ul>
                                                                        <li>
                                                                            <p align="justify">La matr&iacute;cula es el acto voluntario de una 
                                                                                persona natural mediante el cual se adquiere la calidad de estudiante 
                                                                                de la Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento 
                                                                                de todos los requisitos se&ntilde;alados para la misma. Mediante 
                                                                                este acto, el estudiante se compromete a cumplir el reglamento y 
                                                                                las dem&aacute;s normas establecidas por la Instituci&oacute;n y 
                                                                                por el Estado y adquiere el derecho a cursar el programa de formaci&oacute;n 
                                                                                previsto.</P>
                                                                        </li>
                                                                        <li>
                                                                            <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos 
                                                                                del estudiante y a los deberes que de ellos se desprenden. Especialmente 
                                                                                significa que el estudiante comparte los postulados contenidos en 
                                                                                la Declaraci&oacute;n de Principios de la Escuela.</P>
                                                                        </li>
                                                                        <li>
                                                                            <p align="justify">La matr&iacute;cula la legaliza el estudiante con 
                                                                                su firma, para lo cual deber&aacute; presentarse el <b><%=cronograma.elementAt(19)%></b> 
                                                                                en la Oficina de Secretar&iacute;a General, Primer Piso, Bloque 
                                                                                A con el comprobante de pago de los derechos de matr&iacute;cula. 
                                                                                Una vez haya firmado, ser&aacute; carnetizado como estudiante de 
                                                                                la Especializaci&oacute;n.
                                                                        </li>
                                                                        <li>Inicio de clases de la Especializaci&oacute;n: <b><%=cronograma.elementAt(20)%></b>.</P></li>
                                                                    </ul>
                                                                    <p></p>
                                                               
                                                                <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
                                                                    y a la <b><%=prog%></b></p>
                                                                <p>Cordialmente,</p>
                                                                <p>Direcci&oacute;n Especializaci&oacute;n </p>
                                                                <p>Para mayor informaci&oacute;n:</p>
                                                                Coordinaci&oacute;n Especializaci�n<br>
                                                                <a href="mailto:carlosr.ruiz@escuelaing.edu.co">carlosr.ruiz@escuelaing.edu.co 
                                                                </a></p> 
                                                                <%}%>
                                                                <%if (estud.elementAt(2).equals("324")) {%>
                                                                <!--Especializacion Telematica--></p>
                                                               
                                                                <ul>
                                                                    <li><b>
                                                                            <p align="justify"> El <b><%=cronograma.elementAt(13)%> podr� pagar 
                                                                                    los derechos de matr�cula o imprimir su orden siguiendo los pasos 
                                                                                    mencionados en este enlace <a href="http://www.escuelaing.edu.co//uploads/descargables/2932_manual_matriculas_posgrados.pdf">manual 
                                                                                        de pagos en l�nea</a> <br>
                                                                                    <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
                                                                                        al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa 
                                                                                        entrega de la orden de pago. </li>
                                                                                    </ul>
                                                                                   
                                                                                        <p>El pago extraordinario tiene un recargo del 5%.</p>
                                                                                        <p><b>Valor del cr&eacute;dito: $<%=cronograma.elementAt(22)%>.oo</b></p>
                                                                                        <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
                                                                                                                                                                            (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
                                                                                                                                                                            el correspondiente desprendible en la Oficina de Apoyo Financiero
                                                                                                                                                                            de la Escuela, Bloque A, primer piso, para registrar dicho
                                                                                                                                                                            pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
                                                                                                                                                                        carnetizarse y asignarle su horario.</p>-->
                                                                                  
                                                                                    <ul>
                                                                                        <li><b>Financiaci&oacute;n:</b> 
                                                                                            <p align="justify">Si usted requiere solicitar financiaci&oacute;n, 
                                                                                                deber&aacute; tramitarla con una semana de anticipaci&oacute;n a la 
                                                                                                fecha l&iacute;mite de pago para lo cual deber&aacute; acercarse a 
                                                                                                la <a href="http://www.escuelaing.edu.co/es/financiacion/financiacion_posgrado/corto_plazo" target="_blank">Oficina 
                                                                                                    de apoyo financiero a estudiantes</a>. Para mayor informaci�n comun�quese con la Oficina de Apoyo Financiero 
                                                                                                    al 6683600 ext.107 � 356.</p>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
                                                                                    <p align="justify">Una vez haya realizado el pago, deber� formalizar su 
                                                                                        matr&iacute;cula, as&iacute;:</p>
                                                                                   
                                                                                        <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
                                                                                            </b> </p>
                                                                                        <ul>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula es el acto voluntario de una 
                                                                                                    persona natural mediante el cual se adquiere la calidad de estudiante 
                                                                                                    de la Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento 
                                                                                                    de todos los requisitos se&ntilde;alados para la misma. Mediante 
                                                                                                    este acto, el estudiante se compromete a cumplir el reglamento y 
                                                                                                    las dem&aacute;s normas establecidas por la Instituci&oacute;n y 
                                                                                                    por el Estado y adquiere el derecho a cursar el programa de formaci&oacute;n 
                                                                                                    previsto.</P>
                                                                                            </li>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos 
                                                                                                    del estudiante y a los deberes que de ellos se desprenden. Especialmente 
                                                                                                    significa que el estudiante comparte los postulados contenidos en 
                                                                                                    la Declaraci&oacute;n de Principios de la Escuela.</P>
                                                                                            </li>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula la legaliza el estudiante con 
                                                                                                    su firma, para lo cual deber&aacute; presentarse el <b><%=cronograma.elementAt(19)%></b> 
                                                                                                    en la Oficina de Secretar&iacute;a General, Primer piso, Bloque 
                                                                                                    A con el comprobante de pago de los derechos de matr&iacute;cula. 
                                                                                                    Una vez haya firmado, ser&aacute; carnetizado como estudiante de 
                                                                                                    la Especializaci&oacute;n.
                                                                                            </li>
                                                                                            <li>Inicio de clases de la Especializaci&oacute;n: <b><%=cronograma.elementAt(20)%></b>.</P></li>
                                                                                        </ul>
                                                                                        <p></p>
                                                                                   
                                                                                    <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
                                                                                        y a la Especializaci&oacute;n en <b><%=prog%></b></p>
                                                                                    <p>Cordialmente,</p>
                                                                                    <p>Direcci&oacute;n Especializaci&oacute;n </p>
                                                                                    <p>Para mayor informaci&oacute;n:</p>
                                                                                    <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico: <br>
                                                                                        <br>
                                                                                        <a href="mailto:telemati@escuelaing.edu.co">telem&aacute;tica@escuelaing.edu.co 
                                                                                        </a><br>
                                                                                        Coordinaci&oacute;n Acad&eacute;mica: Tel. 668 3600 Ext.223- 224 � 377<br>
                                                                                        <a href="mailto:claudia.santiago@escuelaing.edu.co">claudia.santiago@escuelaing.edu.co 
                                                                                        </a></p>
                                                                                    <%}%>
                                                                                    <%if (estud.elementAt(2).equals("370")) {%>
                                                                                    <!--Especializacion QHSE-->
                                                                                    <ul>
                                                                                        <li>
                                                                                            <p align="justify"> </b> A partir del <b><%=cronograma.elementAt(13)%></b> 
                                                                                                podr� pagar los derechos de matr�cula o imprimir su orden siguiendo 
                                                                                                los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co//uploads/descargables/2932_manual_matriculas_posgrados.pdf">manual 
                                                                                                    de pagos en l�nea.</a> <br>
                                                                                                El plazo para pago de los derechos de matr�cula ser&aacute; desde 
                                                                                                el <b><%=cronograma.elementAt(15)%> </b>.
                                                                                        </li>
                                                                                        <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
                                                                                            al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa 
                                                                                            entrega de la orden de pago.</li>
                                                                                    </ul>
                                                                                    
                                                                                        <p>El pago extraordinario tiene un recargo del 5%.</p>
                                                                                        <!--Por cruce de periodos-->
                                                                                        <p><b>Valor del cr�dito para el periodo <%=cronograma.elementAt(2)%> 
                                                                                                <!%=confEci.getPeriodo()%>
                                                                                                es : $<%=cronograma.elementAt(22)%>.oo</b></p>
                                                                                        <!-- <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
                                                                                                                                                                            (en la Caja de la Escuela, en cualquier sucursal del Banco de Occidente o Banco Santander) , debe entregar
                                                                                                                                                                            el correspondiente desprendible en la Direcci&oacute;n Administrativa
                                                                                                                                                                            y Financiera de la Escuela, Bloque A, segundo piso, para registrar dicho
                                                                                                                                                                            pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
                                                                                                                                                                            carnetizarse, asignarle su horario y autoriz�rsele por parte de la Direcci�n del
                                                                                                                                                                        Programa su asistencia a clases.</p>-->
                                                                                    
                                                                                    <ul>
                                                                                        <li><b>Financiaci&oacute;n:</b> 
                                                                                            <p align="justify">Si usted requiere solicitar financiaci&oacute;n, 
                                                                                                deber&aacute; tramitarla con una semana de anticipaci&oacute;n a la 
                                                                                                fecha l&iacute;mite de pago para lo cual deber&aacute; acercarse a 
                                                                                                la <a href="http://www.escuelaing.edu.co/es/financiacion/financiacion_posgrado/corto_plazo" target="_blank">Oficina 
                                                                                                    de Apoyo Financiero a estudiantes</a>. Para mayor informaci�n comun�quese con la Oficina de Apoyo Financiero 
                                                                                                    al 6683600 ext.107 � 356.</p>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <p><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
                                                                                    <p align="justify">Una vez haya realizado el pago, deber� formalizar su 
                                                                                        matr&iacute;cula as&iacute;:</p>
                                                                                   
                                                                                        <p><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
                                                                                            </b> </p>
                                                                                        <ul>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula es el acto voluntario de una 
                                                                                                    persona natural mediante el cual se adquiere la calidad de estudiante 
                                                                                                    de la Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento 
                                                                                                    de todos los requisitos se&ntilde;alados para la misma. Mediante 
                                                                                                    este acto, el estudiante se compromete a cumplir el reglamento y 
                                                                                                    las dem&aacute;s normas establecidas por la Instituci&oacute;n y 
                                                                                                    por el Estado y adquiere el derecho a cursar el programa de formaci&oacute;n 
                                                                                                    previsto.</P>
                                                                                            </li>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos 
                                                                                                    del estudiante y a los deberes que de ellos se desprenden. Especialmente 
                                                                                                    significa que el estudiante comparte los postulados contenidos en 
                                                                                                    la Declaraci&oacute;n de Principios de la Escuela, acata el Reglamento 
                                                                                                    de Posgrados y el Reglamento Interno de la Especializaci�n.</P>
                                                                                            </li>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula la legaliza el estudiante con 
                                                                                                    su firma, para lo cual deber&aacute; presentarse del <b><%=cronograma.elementAt(19)%></b> 
                                                                                                    <!--en la Oficina
                                                                                                                                                                                          de Secretar&iacute;a General, Primer Piso, Bloque A-->
                                                                                                    con el comprobante de pago de los derechos de matr&iacute;cula. 
                                                                                                    Una vez haya firmado, ser&aacute; carnetizado como estudiante de 
                                                                                                    la Especializaci&oacute;n. De lo contrario no podr� ingresar a las 
                                                                                                    clases que se inician el <%=fecinicio%>. </P>
                                                                                            </li>
                                                                                            <li>
                                                                                                <p align="justify">La inducci�n, se realizar&aacute; el <b><%=cronograma.elementAt(16)%> 
                                                                                                        .</b> </P>
                                                                                            </li>
                                                                                            <li>Inicio de clases de la Especializaci&oacute;n: <b><%=cronograma.elementAt(20)%></b>.</li>
                                                                                        </ul>
                                                                                   
                                                                                        <p align="justify">Al manifestarle nuestra complacencia por contarlo entre 
                                                                                            los alumnos de la ESCUELA, le deseo que su permanencia en ella sea fructifera 
                                                                                            y agradable y que los nuevos estudios contribuyan a su realizaci&oacute;n 
                                                                                            profesional y personal.</p>
                                                                                        <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
                                                                                            y a la Especializaci&oacute;n en <b><%=prog%></b></p>
                                                                                        <p>Cordialmente,</p>
                                                                                        <p>Direcci&oacute;n Especializaci&oacute;n en Gesti�n Integrada en Seguridad, Salud en el Trabajo, Calidad y Medio Ambiente</p>
                                                                                    
                                                                                        <p>Para mayor informaci&oacute;n:</p>
                                                                                        <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                                                                                            Tel. 6683600 ext. 133.<br>
                                                                                            <a href="mailto:jairo.chacon@escuelaing.edu.co">jairo.chacon@escuelaing.edu.co</a> 
                                                                                        </p>
                                                                                        <p> 
                                                                                            <%}%>
                                                                                        </p>
                                                                                    
                                                                                    <%if (estud.elementAt(2).equals("309")) {%>
                                                                                    <!--Especializacion Saneamiento-->
                                                                                    <ul>
                                                                                        <li>
                                                                                            <p align="justify"> <b><%=cronograma.elementAt(13)%></b> podr� pagar 
                                                                                                los derechos de matr�cula o imprimir su orden siguiendo los pasos 
                                                                                                mencionados en este enlace <a href="http://www.escuelaing.edu.co//uploads/descargables/2932_manual_matriculas_posgrados.pdf">manual 
                                                                                                    de pagos en l�nea.</a> <br>
                                                                                        </li>
                                                                                        <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
                                                                                            al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa 
                                                                                            entrega de la orden de pago. El valor del cr�dito acad�mico para el 
                                                                                            periodo <%=confEci.getPeriodo()%>  es : $<%=cronograma.elementAt(22)%>.oo. 
                                                                                            El valor por per�odo depender� del n�mero de cr�ditos que tome el estudiante.
                                                                                            <!--El valor total de la Especializaci&oacute;n
                                                                                                                                                                              es de <b><!%=valortotal%></b> correspondiente a <b><!%=creditos%></b>
                                                                                                                                                                          cr&eacute;ditos. --></P>
                                                                                        </li>
                                                                                    </ul>
                                                                                   
                                                                                        <p>El pago extraordinario tiene un recargo del 5%.</p>
                                                                                        <p><b>
                                                                                                <!--Valor del cr&eacute;dito: <!%=valcredito%>.oo-->
                                                                                            </b></p>
                                                                                        <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
                                                                                                                                                                            (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
                                                                                                                                                                            el correspondiente desprendible en la Oficina de Apoyo Financiero
                                                                                                                                                                            de la Escuela, Bloque A, primer piso, para registrar dicho
                                                                                                                                                                            pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
                                                                                                                                                                        carnetizarse y asignarle su horario.</p>-->
                                                                                   
                                                                                    <ul>
                                                                                        <li><b>Financiaci&oacute;n:</b> 
                                                                                            <p align="justify">Si usted requiere solicitar financiaci&oacute;n, 
                                                                                                deber&aacute; tramitarla con una semana de anticipaci&oacute;n a la 
                                                                                                fecha l&iacute;mite de pago para lo cual deber&aacute; acercarse a 
                                                                                                la <a href="http://www.escuelaing.edu.co/es/financiacion/financiacion_posgrado/corto_plazo" target="_blank">Oficina 
                                                                                                    de apoyo financiero a estudiantes</a>. Para mayor informaci�n comun�quese con la Oficina de Apoyo Financiero 
                                                                                                    al 6683600 ext.107 � 356.</p>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
                                                                                    <p align="justify">Una vez haya realizado el pago, deber� formalizar su 
                                                                                        matr&iacute;cula, as&iacute;:</p>
                                                                                    
                                                                                        <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
                                                                                            </b> </p>
                                                                                        <ul>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula es el acto voluntario de una 
                                                                                                    persona natural mediante el cual se adquiere la calidad de estudiante 
                                                                                                    de la Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento 
                                                                                                    de todos los requisitos se&ntilde;alados para la misma. Mediante 
                                                                                                    este acto, el estudiante se compromete a cumplir el reglamento y 
                                                                                                    las dem&aacute;s normas establecidas por la Instituci&oacute;n y 
                                                                                                    por el Estado y adquiere el derecho a cursar el programa de formaci&oacute;n 
                                                                                                    previsto.</P>
                                                                                            </li>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos 
                                                                                                    del estudiante y a los deberes que de ellos se desprenden. Especialmente 
                                                                                                    significa que el estudiante comparte los postulados contenidos en 
                                                                                                    la Declaraci&oacute;n de Principios de la Escuela.</P>
                                                                                            </li>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula la legaliza el estudiante con 
                                                                                                    su firma, para lo cual deber&aacute; presentarse del <b><%=cronograma.elementAt(19)%></b> 
                                                                                                    en la Oficina de Secretar&iacute;a General, Primer piso, Bloque 
                                                                                                    A con el comprobante de pago de los derechos de matr&iacute;cula. 
                                                                                                    Una vez haya firmado, ser&aacute; carnetizado como estudiante de 
                                                                                                    la Especializaci&oacute;n.
                                                                                            </li>
                                                                                            <li>Inicio de clases de la Especializaci&oacute;n: <b><%=cronograma.elementAt(20)%></b>.</P></li>
                                                                                            <li>Inducci�n: <b><%=cronograma.elementAt(16)%></b>.</P></li>
                                                                                        </ul>
                                                                                        <p></p>
                                                                                   
                                                                                    <p>Al manifestarle nuestra complacencia por contarlo entre los alumnos de 
                                                                                        la ESCUELA, le deseo que su permanencia en ella sea fructifera y agradable 
                                                                                        y que los nuevos estudios contribuyan a su realizaci&oacute;n profesional 
                                                                                        y personal.</p>
                                                                                    <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
                                                                                        y a la Especializaci&oacute;n en <b><%=prog%></b></p>
                                                                                    <p>Cordialmente,</p>
                                                                                    <p>Direcci&oacute;n Especializaci&oacute;n </p>
                                                                                    <p>Para mayor informaci&oacute;n:</p>
                                                                                    <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                                                                                        <a href="mailto:hector.matamoros@escuelaing.edu.co">hector.matamoros@escuelaing.edu.co</a> 
                                                                                        Tel: 6683600 exts. 283-234 <br>
                                                                                    </p>
                                                                                    <%}%>
                                                                                    <%if (estud.elementAt(2).equals("310")) {%>
                                                                                    <!--Especializaci�n Recursos Hidr�ulicos-->
                                                                                    <p><b>1.</b> 
                                                                                        <!--Cordialmente lo invitamos a una reuni&oacute;n informativa sobre
                                                                                                                                                                          aspectos generales de la maestr&iacute;a en Ingenier&iacute;a Civil, resolver inquietudes sobre los procesos
                                                                                                                                                                          administrativos y opciones de Financiaci&oacute;n Educativa el 25 de Julio en el sal&oacute;n D111
                                                                                                                                                                        a las 8:00 a.m.-->
                                                                                        Su consejero Acad�mico ser� el <b>Ing.<%=tutor.elementAt(1)%></b>, correo 
                                                                                        electr�nico:<%=tutor.elementAt(3)%>, con quien deber� acordar la propuesta 
                                                                                        de las asignaturas que conformar�n su plan de estudios, durante los d�as 
                                                                                        <%=cronograma.elementAt(27)%>, para efectos de liquidaci�n de la orden 
                                                                                        de matr�cula correspondiente al periodo <%=cronograma.elementAt(2)%>. 
                                                                                        <br>
                                                                                        <!--El director del �nfasis enviar� por correo electr�nico
                                                                                                                                                                        sugerencias para su registro acad�mico basados en los intereses que usted manifest� en la entrevista y su
                                                                                                                                                                        disponibilidad horaria.-->
                                                                                        <b><%=cronograma.elementAt(13)%></b> podr� pagar los derechos de matr�cula 
                                                                                        o imprimir su orden siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co//uploads/descargables/2932_manual_matriculas_posgrados.pdf">manual 
                                                                                            de pagos en l�nea.</a> <br>
                                                                                    </p>
                                                                                    <p><b>2. Pagos</b>: El valor que hay que pagar en cada per�odo es directamente 
                                                                                        proporcional al n�mero de cr�ditos que se va a cursar, y se debe pagar 
                                                                                        a su inicio, previa entrega de la orden de pago. <b><%=cronograma.elementAt(15)%></b></p>

                                                                                    <p>El pago extraordinario tiene un recargo del 5%.</p>
                                                                                    <p><b>Valor del cr&eacute;dito para el periodo <%=cronograma.elementAt(2)%> 
                                                                                            es : $<%=cronograma.elementAt(22)%>.oo</b></p>
                                                                                    <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
                                                                                                                                                                        (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
                                                                                                                                                                        el correspondiente desprendible en la Oficina de Apoyo Financiero
                                                                                                                                                                        de la Escuela, Bloque A, primer piso, para registrar dicho
                                                                                                                                                                        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
                                                                                                                                                                    carnetizarse y asignarle su horario.</p>-->

                                                                                    <ul>
                                                                                        <li><b>Financiaci&oacute;n:</b> 
                                                                                            <p align="justify">Si usted requiere solicitar financiaci&oacute;n, 
                                                                                                deber&aacute; tramitarla con una semana de anticipaci&oacute;n a la 
                                                                                                fecha l&iacute;mite de pago para lo cual deber&aacute; acercarse a 
                                                                                                la <a href="http://www.escuelaing.edu.co/es/financiacion/financiacion_posgrado/corto_plazo" target="_blank">Oficina 
                                                                                                    de apoyo financiero a estudiantes</a>. Para mayor informaci�n comun�quese con la Oficina de Apoyo Financiero 
                                                                                                    al 6683600 ext.107 � 356.</p>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
                                                                                    <p align="justify">Una vez haya realizado el pago, deber� formalizar su 
                                                                                        matr&iacute;cula, as&iacute;:</p>

                                                                                    <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
                                                                                        </b> </p>
                                                                                    <ul>
                                                                                        <li>
                                                                                            <p align="justify">La matr&iacute;cula es el acto voluntario de una 
                                                                                                persona natural mediante el cual se adquiere la calidad de estudiante 
                                                                                                de la Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento 
                                                                                                de todos los requisitos se&ntilde;alados para la misma. Mediante 
                                                                                                este acto, el estudiante se compromete a cumplir el reglamento y 
                                                                                                las dem&aacute;s normas establecidas por la Instituci&oacute;n y 
                                                                                                por el Estado y adquiere el derecho a cursar el programa de formaci&oacute;n 
                                                                                                previsto.</P>
                                                                                        </li>
                                                                                        <li>
                                                                                            <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos 
                                                                                                del estudiante y a los deberes que de ellos se desprenden. Especialmente 
                                                                                                significa que el estudiante comparte los postulados contenidos en 
                                                                                                la Declaraci&oacute;n de Principios de la Escuela.</P>
                                                                                        </li>
                                                                                        <li>
                                                                                            <p align="justify">La matr&iacute;cula la legaliza el estudiante con 
                                                                                                su firma, para lo cual deber&aacute; presentarse  <b><%=cronograma.elementAt(19)%></b> 
                                                                                                en la Oficina de Secretar&iacute;a General, Primer piso, Bloque 
                                                                                                A con el comprobante de pago de los derechos de matr&iacute;cula. 
                                                                                                Una vez haya firmado, ser&aacute; carnetizado como estudiante de 
                                                                                                la Especializaci&oacute;n.
                                                                                        </li>
                                                                                        <li>Inicio de clases de la Especializaci&oacute;n: <b><%=cronograma.elementAt(20)%></b>.</li>
                                                                                        <li>Induccion: <b><%=cronograma.elementAt(16)%></b>.</li>
                                                                                    </ul>
                                                                                    <p></p>

                                                                                    <p>Al manifestarle nuestra complacencia por contarlo entre los alumnos de 
                                                                                        la ESCUELA, le deseo que su permanencia en ella sea fructifera y agradable 
                                                                                        y que los nuevos estudios contribuyan a su realizaci&oacute;n profesional 
                                                                                        y personal.</p>
                                                                                    <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
                                                                                        y a la Especializaci&oacute;n en <b><%=prog%></b></p>
                                                                                    <p>Cordialmente,</p>
                                                                                    <p>Direcci&oacute;n Especializaci&oacute;n </p>
                                                                                    <p>Para mayor informaci&oacute;n:</p>
                                                                                    <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                                                                                        Tel. 6683600 Ext. 218.<br>
                                                                                        <a href="mailto:alfonso.rodriguez@escuelaing.edu.co">alfonso.rodriguez@escuelaing.edu.co</a> 
                                                                                    </p>
                                                                                    <%}%>
                                                                                    <p> 
                                                                                        <%if (estud.elementAt(2).equals("267")) {%>
                                                                                        <!--Especializacion en Vias-->
                                                                                    </p>
                                                                                    <ul>
                                                                                        <li> 
                                                                                            <p align="justify"><b> <b><%=cronograma.elementAt(13)%> podr� pagar 
                                                                                                        los derechos de matr�cula o imprimir su orden siguiendo los pasos 
                                                                                                        mencionados en este enlace <a href="http://www.escuelaing.edu.co//uploads/descargables/2932_manual_matriculas_posgrados.pdf">manual 
                                                                                                            de pagos en l�nea</a></b> <br>
                                                                                                    </li>
                                                                                                    <li><b>Pagos</b>: El valor del cr�dito acad�mico para el periodo <%=cronograma.elementAt(2)%> 
                                                                                                        es de $<%=cronograma.elementAt(22)%>.oo. El valor por per�odo depender� 
                                                                                                        del n�mero de cr�ditos que tome el estudiante. </li>
                                                                                    </ul>
                                                                                    
                                                                                        <p>El pago extraordinario tiene un recargo del 5%.</p>
                                                                                        <!-- <p><b>Valor del cr&eacute;dito: <!%=valcredito%>.oo</b></p>-->
                                                                                        <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
                                                                                                                                                                            (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
                                                                                                                                                                            el correspondiente desprendible en la Oficina de Apoyo Financiero
                                                                                                                                                                            de la Escuela, Bloque A, primer piso, para registrar dicho
                                                                                                                                                                            pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
                                                                                                                                                                        carnetizarse y asignarle su horario.</p>-->
                                                                                   
                                                                                    <ul>
                                                                                        <li><b>Financiaci&oacute;n:</b> 
                                                                                            <p align="justify">Si usted requiere solicitar financiaci&oacute;n, 
                                                                                                deber&aacute; tramitarla con una semana de anticipaci&oacute;n a la 
                                                                                                fecha l&iacute;mite de pago para lo cual deber&aacute; acercarse a 
                                                                                                la <a href="http://www.escuelaing.edu.co/es/financiacion/financiacion_posgrado/corto_plazo" target="_blank">Oficina 
                                                                                                    de apoyo financiero a estudiantes</a>. Para mayores informes comun&iacute;quese 
                                                                                                con la oficina de Apoyo Financiero a estudiantes, telefono 6683600 ext. 356.</p>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
                                                                                    <p align="justify">Una vez haya realizado el pago, deber� formalizar su 
                                                                                        matr&iacute;cula, as&iacute;:</p>
                                                                                   
                                                                                        <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
                                                                                            </b> </p>
                                                                                        <ul>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula es el acto voluntario de una 
                                                                                                    persona natural mediante el cual se adquiere la calidad de estudiante 
                                                                                                    de la Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento 
                                                                                                    de todos los requisitos se&ntilde;alados para la misma. Mediante 
                                                                                                    este acto, el estudiante se compromete a cumplir el reglamento y 
                                                                                                    las dem&aacute;s normas establecidas por la Instituci&oacute;n y 
                                                                                                    por el Estado y adquiere el derecho a cursar el programa de formaci&oacute;n 
                                                                                                    previsto.</P>
                                                                                            </li>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos 
                                                                                                    del estudiante y a los deberes que de ellos se desprenden. Especialmente 
                                                                                                    significa que el estudiante comparte los postulados contenidos en 
                                                                                                    la Declaraci&oacute;n de Principios de la Escuela.</P>
                                                                                            </li>
                                                                                            <li>
                                                                                                <p align="justify">La matr&iacute;cula la legaliza el estudiante con 
                                                                                                    su firma, para lo cual deber&aacute; presentarse del <b><%=cronograma.elementAt(19)%></b> 
                                                                                                    con el comprobante de pago de los derechos de matr&iacute;cula. 
                                                                                                    Una vez haya firmado, ser&aacute; carnetizado como estudiante de 
                                                                                                    la Especializaci&oacute;n.
                                                                                            </li>
                                                                                            <li>Inicio de clases de la Especializaci&oacute;n: <b><%=cronograma.elementAt(20)%></b>.</li>
                                                                                            <li>Induccion: <b><%=cronograma.elementAt(16)%></b>.</li>
                                                                                        </ul>
                                                                                        <p></p>
                                                                                    
                                                                                    <p>Al manifestarle nuestra complacencia por contarlo entre los alumnos de 
                                                                                        la ESCUELA, le deseo que su permanencia en ella sea fructifera y agradable 
                                                                                        y que los nuevos estudios contribuyan a su realizaci&oacute;n profesional 
                                                                                        y personal.</p>
                                                                                    <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
                                                                                        y a la Especializaci&oacute;n en <b><%=prog%></b></p>
                                                                                    <p>Cordialmente,</p>
                                                                                    <p>Direcci&oacute;n Especializaci&oacute;n </p>
                                                                                    <p>Para mayor informaci&oacute;n:</p>
                                                                                    <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                                                                                        Tel. 6683600 Ext. 238 y 114.<br>
                                                                                        <a href="mailto:santiago.henao@escuelaing.edu.co">santiago.henao@escuelaing.edu.co</a> 
                                                                                    </p>
                                                                                   
                                                                                        <%}%>
                                                                                    
                                                                                    <!--Especializacion en Fundaciones -->
                                                                                    <%if (estud.elementAt(2).equals("320")) {%>
                                                                                    <ul>
                                                                                        <li>Usted deber� acordar la propuesta de las asignaturas que conformar�n 
                                                                                            su plan de estudios con el Director de la Especializaci�n. 
                                                                                        <li> Para efectos de liquidaci�n de la orden de matr�cula correspondiente 
                                                                                            al primer periodo <%=cronograma.elementAt(2)%>, deber� descargar <a href="http://www.escuelaing.edu.co/documentos/fundaciones.xls">ESTE 
                                                                                                FORMATO,</a> diligenciarlo teniendo en cuenta lo acordado con el consejero acad�mico
                                                                                            y enviarlo v�a mail a <a href="mailto:lina.garzon@escuelaing.edu.co">lina.garzon@escuelaing.edu.co</a> 
                                                                                            a m�s tardar el <%=cronograma.elementAt(27)%>. 
                                                                                            <!--El director del �nfasis enviar� por correo electr�nico
                                                                                                                                                                          sugerencias para su registro acad�mico basados en los intereses que usted manifest� en la entrevista y su
                                                                                                                                                                          disponibilidad horaria. Posteriormente la entrega de &oacute;rdenes
                                                                                                                                                                              de pago de los derechos de matr&iacute;cula</b> se har&aacute; del <b><!%=ordenesp%></b>,
                                                                                                                                                                          en la Oficina de Apoyo Financiero de 8:00 a.m 1:00 pm. y de 2:00 p.m a
                                                                                                                                                                          4:30 p.m.-->
                                                                                        </li>
                                                                                        <li>
                                                                                            <p align="justify"><b> <b>El <%=cronograma.elementAt(13)%> podr� pagar los 
                                                                                                        derechos de matr�cula o imprimir su orden siguiendo los pasos mencionados 
                                                                                                        en este enlace <a href="http://www.escuelaing.edu.co//uploads/descargables/2932_manual_matriculas_posgrados.pdf">manual 
                                                                                                            de pagos en l�nea.</a> <br>
                                                                                                        </li>
                                                                                                        <li><b>Pagos</b>: El valor del cr�dito acad�mico para el periodo <%=cronograma.elementAt(2)%> es 
                                                                                                            de $<%=cronograma.elementAt(22)%>. El valor por per�odo depender� del 
                                                                                                            n�mero de cr�ditos que tome el estudiante.</li>
                                                                                                        </ul>

                                                                                                        <p>El pago extraordinario tiene un recargo del 5%.</p>
                                                                                                        <!--  <p><b>Valor del cr&eacute;dito: <!%=valcredito%>.oo</b></p>-->
                                                                                                        <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
                                                                                                                                                                                                    (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
                                                                                                                                                                                                    el correspondiente desprendible en la Oficina de Apoyo Financiero
                                                                                                                                                                                                    de la Escuela, Bloque A, primer piso, para registrar dicho
                                                                                                                                                                                                    pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
                                                                                                                                                                                                    carnetizarse y asignarle su horario.</p>-->

                                                                                                        <ul>
                                                                                                            <li><b>Financiaci&oacute;n:</b> 
                                                                                                                <p align="justify">Si usted requiere solicitar financiaci&oacute;n, 
                                                                                                                    deber&aacute; tramitarla con una semana de anticipaci&oacute;n a la 
                                                                                                                    fecha l&iacute;mite de pago para lo cual deber&aacute; acercarse a 
                                                                                                                    la <a href="http://www.escuelaing.edu.co/es/financiacion/financiacion_posgrado/corto_plazo" target="_blank">Oficina 
                                                                                                                        de apoyo financiero a estudiantes</a>. Para mayor informaci�n comun�quese con la Oficina de Apoyo Financiero 
                                                                                                                        al 6683600 ext.107 � 356.</p>
                                                                                                            </li>
                                                                                                        </ul>
                                                                                                        <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
                                                                                                        <p align="justify">Una vez haya realizado el pago, deber� formalizar su 
                                                                                                            matr&iacute;cula, as&iacute;:</p>

                                                                                                        <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
                                                                                                            </b> </p>
                                                                                                        <ul>
                                                                                                            <li>
                                                                                                                <p align="justify">La matr&iacute;cula es el acto voluntario de una 
                                                                                                                    persona natural mediante el cual se adquiere la calidad de estudiante 
                                                                                                                    de la Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento 
                                                                                                                    de todos los requisitos se&ntilde;alados para la misma. Mediante 
                                                                                                                    este acto, el estudiante se compromete a cumplir el reglamento y 
                                                                                                                    las dem&aacute;s normas establecidas por la Instituci&oacute;n y 
                                                                                                                    por el Estado y adquiere el derecho a cursar el programa de formaci&oacute;n 
                                                                                                                    previsto.</P>
                                                                                                            </li>
                                                                                                            <li>
                                                                                                                <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos 
                                                                                                                    del estudiante y a los deberes que de ellos se desprenden. Especialmente 
                                                                                                                    significa que el estudiante comparte los postulados contenidos en 
                                                                                                                    la Declaraci&oacute;n de Principios de la Escuela.</P>
                                                                                                            </li>
                                                                                                            <li>
                                                                                                                <p align="justify">La matr&iacute;cula la legaliza el estudiante con 
                                                                                                                    su firma, para lo cual deber&aacute; presentarse  <b><%=cronograma.elementAt(19)%></b> 
                                                                                                                    en la Oficina de Secretar&iacute;a General, Primer Piso, Bloque 
                                                                                                                    A con el comprobante de pago de los derechos de matr&iacute;cula. 
                                                                                                                    Una vez haya firmado, ser&aacute; carnetizado como estudiante de 
                                                                                                                    la Especializaci&oacute;n.
                                                                                                            </li>
                                                                                                            <li>Inicio de clases de la Especializaci&oacute;n: <b><%=cronograma.elementAt(20)%></b>.</li>
                                                                                                            <li>Inducci�n: <b><%=cronograma.elementAt(16)%></b>.</li>
                                                                                                        </ul>
                                                                                                        <p></p>

                                                                                                        <p>Al manifestarle nuestra complacencia por contarlo entre los alumnos de 
                                                                                                            la ESCUELA, le deseo que su permanencia en ella sea fructifera y agradable 
                                                                                                            y que los nuevos estudios contribuyan a su realizaci&oacute;n profesional 
                                                                                                            y personal.</p>
                                                                                                        <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
                                                                                                            y a la Especializaci&oacute;n en <b><%=prog%></b></p>
                                                                                                        <p> 
                                                                                                        <p>Cordialmente,</p>
                                                                                                        <p>Direcci&oacute;n Especializaci&oacute;n </p>
                                                                                                        <p>Para mayor informaci&oacute;n:</p>
                                                                                                        <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                                                                                                            Tel. 6683600 Ext. 340 y 238.<br>
                                                                                                        <p> 
                                                                                                            </a></p>
                                                                                                            <%}%>
                                                                                                        </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td valign="top" height="1000">&nbsp;</td>
                                                                                                        </tr>
                                                                                                        </table>
                                                                                                        <p>
                                                                                                        <p>
                                                                                                            <%} else if (estud.elementAt(3).equals("-111") && estud.elementAt(2).equals("374")) {%>

                                                                                                        <div align="center">
                                                                                                        <table align="center" width="49%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas">
                                                                                                            <tr>
                                                                                                                <td>&nbsp;

                                                                                                                </td>
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
                                                                                                                <td valign="top" height="1000"><p align="justify">

                                                                                                                    </p>

                                                                                                                    <p>Despu�s de realizado el proceso de selecci�n, le informamos que inicialmente, 
                                                                                                                        por restricci&oacute;n de cupos no fue seleccionado para iniciar actividades 
                                                                                                                        acad�micas el <%=cronograma.elementAt(20)%>. Sin embargo, teniendo en 
                                                                                                                        cuenta su hoja de vida acad�mica y profesional y su desempe�o en el examen 
                                                                                                                        y la entrevista a la que fue citado, usted qued� en <b>lista de espera.</b> 
                                                                                                                        En caso que por alg�n motivo, alguno de los seleccionados no utilice el 
                                                                                                                        cupo asignado, usted ser� uno de los opcionados para su reasignaci�n.</p>
                                                                                                                    <p> Inmediatamente queden cupos disponibles, nos comunicaremos con usted 
                                                                                                                        para continuar con el proceso de matr�cula. </p>
                                                                                                                    <p>&nbsp;</p>
                                                                                                                    <p>

                                                                                                                        Ing. Ricardo Arturo Benavides Bola�os<br>
                                                                                                                        Director <br>
                                                                                                                        ricardo.benavides@escuelaing.edu.co <br>
                                                                                                                        Tel�fono. 668 3600, ext. 337<br>

                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                                        </div>
                                                                                                        </div>
                                                                                                        <%}%>

                                                                                                        <%  if (estud.elementAt(3).equals("-190")) {%>
                                                                                                        <div align="center"><br>
                                                                                                        </div>

                                                                                                        <table width="51%" border="0" cellspacing="0" cellpadding="0" align="center">
                                                                                                            <tr>

                                                                                                                <td><b>Nombre: <%=estud.elementAt(1)%></b> <br>
                                                                                                                    <b>Programa academico: <%=prog%></b>
                                                                                                                    <p>Usted no ha formalizado su inscripci�n, debe entregar la documentaci�n
                                                                                                                        correspondiente en las fechas se�aladas. Favor comun�quese
                                                                                                                        con la Oficina de Admisiones. <br>
                                                                                                                        Tel&eacute;fono: 6683600 opci�n 2 en el men�.
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                        <%}
                                                                                                            if (estud.elementAt(3).equals("-181") && estud.elementAt(2).equals("374")) {%>
                                                                                                        <div align="center">
                                                                                                            <table width="51%" border="0" cellspacing="0" cellpadding="0" align="center">
                                                                                                                <tr>

                                                                                                                    <td>
                                                                                                                        <p>&nbsp;</p>
                                                                                                                        <p><b>Nombre: <%=estud.elementAt(1)%></b> <br>
                                                                                                                            <b>Programa academico: <%=prog%></b> </p>
                                                                                                                        <P> Una vez estudiada su hoja de vida acad&eacute;mica, profesional y laboral, 
                                                                                                                            resultados de la entrevista as� como otros aspectos del proceso de selecci�n, 
                                                                                                                            lamentamos informarle que la Direcci�n de la Especializaci&oacute;n conceptu&oacute; 
                                                                                                                            no aprobar su solicitud de admisi&oacute;n. <br>
                                                                                                                        <P>&nbsp;
                                                                                                                        <P>No obstante lo anterior, le agradecemos que haya escogido la Escuela 
                                                                                                                            como una opci&oacute;n para adelantar sus estudios de posgrado y esperamos 
                                                                                                                            que haya una pr�xima oportunidad para contar con usted como miembro de 
                                                                                                                            nuestra comunidad acad�mica. 
                                                                                                                        <p> Si desea mayor informaci&oacute;n al respecto por favor comun�quese 
                                                                                                                            con la Direcci�n de la Especializaci�n.
                                                                                                                        <p><br>
                                                                                                                            Ing. Ricardo Arturo Benavides Bola�os<br>
                                                                                                                            Director <br>
                                                                                                                            ricardo.benavides@escuelaing.edu.co <br>
                                                                                                                            Tel�fono. 668 3600, ext. 575 <b> </b> <b> </b> 
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </div>
                                                                                                        <%} else if (estud.elementAt(3).equals("-181")) {%>
                                                                                                        <div align="center"><br>


                                                                                                            <table width="51%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="center">
                                                                                                                <tr>

                                                                                                                    <td><b>Nombre: <%=estud.elementAt(1)%></b>
                                                                                                                        <br>
                                                                                                                        <b>Programa academico: <%=prog%></b>
                                                                                                                        <p>Una vez estudiada su hoja de vida acad&eacute;mica, profesional y laboral, resultados de la entrevista,
                                                                                                                            as&iacute; como otros aspectos del proceso de selecci&oacute;n, lamentamos
                                                                                                                            informarle que la Direcci&oacute;n de la Especializaci&oacute;n conceptu&oacute;
                                                                                                                            no aprobar su solicitud de admisi&oacute;n.  No obstante lo anterior le agradecemos que haya escogido
                                                                                                                            la Escuela como una opci&oacute;n
                                                                                                                            para adelantar sus estudios de posgrado y esperamos que haya una pr&oacute;xima
                                                                                                                            oportunidad para contar con usted como miembro de nuestra comunidad
                                                                                                                            acad&eacute;mica.
                                                                                                                        <p> Si desea mayor informaci&oacute;n al respecto por favor
                                                                                                                            comun�quese con la Direcci�n de la Especializaci�n.<b>
                                                                                                                                <a href="http://tycho.escuelaing.edu.co/contenido/admisiones/contactos.htm" target="_blank">Contacto</a></b>
                                                                                                                            <b> </b>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </div>
                                                                                                        <%}
                                                                                                            if (estud.elementAt(3).equals("-185")) {%>
                                                                                                        <br>
                                                                                                        <div align="center">

                                                                                                            <table width="51%" border="0" cellspacing="0" cellpadding="0" align="center">
                                                                                                                <tr>
                                                                                                                    <td><b>Nombre: <%=estud.elementAt(1)%></b> <br>
                                                                                                                        <b>Programa academico: <%=prog%></b>

                                                                                                                        <p>Su solicitud de admisi�n est&aacute; en estudio. Para mayor informaci�n
                                                                                                                            por favor comun�quese con la Direcci�n de la Especializaci�n. <a href="http://tycho.escuelaing.edu.co/contenido/admisiones/contactos.htm" target="_blank">Contacto</a></b>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </div>
                                                                                                        <%}
                                                                                                            if (estud.elementAt(3).equals("-183")) {%>
                                                                                                        <br>
                                                                                                        <div align="center">

                                                                                                            <table width="51%" border="0" cellspacing="0" cellpadding="0" align="center">
                                                                                                                <tr>
                                                                                                                    <td><b>Nombre: <%=estud.elementAt(1)%></b> <br>
                                                                                                                        <b>Programa academico: <%=prog%></b>
                                                                                                                        <%//if (estud.elementAt(2).equals("324")) {%>
                                                                                                                        <!--<p>Su solicitud de ingreso a la Especializaci�n actulamente se encuentra en estudio. Para mayor informaci�n
                                                                                                                            por favor comun�quese con la Direcci�n de la Especializaci�n.-->
                                                                                                                        <%//} else {%>
                                                                                                                        <p>No existe informaci�n registrada para este proceso. Para mayor informaci�n
                                                                                                                            por favor comun�quese con la Direcci�n de la Especializaci�n.
                                                                                                                            <a href="http://tycho.escuelaing.edu.co/contenido/admisiones/contactos.htm" target="_blank">Contacto</a></b>
                                                                                                                            <%//}%>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </div>
                                                                                                        <%}%>

                                                                                                        <%}%>
                                                                                                        <%
                                                                                                            //sesion = request.getSession(false) ;
                                                                                                            //sesion.removeAttribute("idplan");
                                                                                                            //sesion.invalidate() ;
                                                                                                        %>
                                                                                                        </body>
                                                                                                        </html>
                                                                                                        <%} //}
                                                                                                        else {
                                                                                                        %>
                                                                                                        <html>
                                                                                                            <body>
                                                                                                                <p>&nbsp;</p>
                                                                                                                <p align="center"><h3><center>Usted no se autentico correctamente o no es un usario autorizado.</center></h3>
                                                                                                            </body>
                                                                                                        </html>
                                                                                                        <%            }
                                                                                                        %>


