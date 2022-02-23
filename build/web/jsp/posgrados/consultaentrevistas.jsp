<%-- 
    Document   : consultaentrevistas
    Created on : 22/07/2010, 09:12:31 AM
    Author     : lrodriguez
--%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    String docEst = request.getParameter("documento");
    PrintWriter oout = response.getWriter();
    String programa = "", titulo = "", nombre = "", fecha = "", hora = "", lugar = "", entrev = "", fecadmin = "", fecinicio = "", iddpto = "", examen = "";
    HttpSession sesion;
    otros.rutas ruta = new otros.rutas();
    String prog = "";
    int val = 0;
    int ban = 0;
    sesion = request.getSession(true);
    BDadmisiones bd = new BDadmisiones();
    String idplan = request.getParameter("idplan");
    configeci.configPosgrados confEci = new configeci.configPosgrados();
    //confEci.getPeriodo()
    Vector posgrados = new Vector();
    Vector estud = new Vector();
    if (idplan.equals("370")) {
        posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
    } else {
        posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
        if (posgrados.size()>0){
            examen= posgrados.elementAt(9).toString();
        }
    }

    if (idplan.equals("312")) {
        prog = "ESPECIALIZACION EN ESTRUCTURAS";
    }
    if (idplan.equals("374")) {
        prog = "ESPECIALIZACION EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
    }

    if (idplan.equals("267")) {
        prog = "ESPECIALIZACION EN DISEÑO CONSTRUCCION Y CONSERVACION DE VIAS";
    }

    if (idplan.equals("313")) {
        prog = "ESPECIALIZACION EN ECONOMIA PARA INGENIEROS";
    }

    if (idplan.equals("370")) {
        prog = "ESPECIALIZACIÓN EN GESTIÓN INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE";
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
        prog = "MAESTRIA EN GESTIÓN DE INFORMACIÓN";
    }

    if (idplan.equals("351")) {
        prog = "MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS ";
    }
    if (idplan.equals("335") || idplan.equals("336")) {
        prog = "MAESTRIA EN INGENIERIA ELÉCTRICA";
    }

    if (idplan.equals("330") || idplan.equals("331")) {
        prog = "MAESTRIA EN INGENIERIA INDUSTRIAL";
    }

    if (idplan.equals("332") || idplan.equals("333")) {
        prog = "MAESTRIA EN INGENIERIA ELECTRÓNICA";
    }

    if (idplan.equals("290") || idplan.equals("291") || idplan.equals("292") || idplan.equals("293")) {
        prog = "MAESTRIA EN INGENIERIA CIVIL";
    }
    
    if (idplan.equals("371")) {
        prog = "MAESTRÍA EN INFORMÁTICA";
    }
    
    if (idplan.equals("372")) {
        prog = "MAESTRÍA EN CIENCIAS ACTUARIALES";
    }
    if (idplan.equals("376") || idplan.equals("377")) {
        prog = "MAESTRÍA EN CIENCIA DE DATOS";
     }
%>

<%if (docEst != null && !docEst.equals("")) {
%>
<html>
    <head>
        <title>Consulta Entrevistas Posgrados</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>

    <body bgcolor="#FFFFFF" text="#000000">
        <%if (idplan.equals("370")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Consulta Entrevistas Posgrados" />
        </jsp:include>
        <%} else {%>

        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Consulta Entrevistas Posgrados" />
        </jsp:include>
        <%}%>
        <p>

            <%if (idplan.equals("370")) {
                    estud = bd.Entrevistas(docEst, idplan, oout, confEci.getPeriodo());
                } else {
                    estud = bd.Entrevistas(docEst, idplan, oout, confEci.getPeriodo());

                }%>
            <!%Vector estud = bd.Entrevistas(docEst, idplan, oout, "2012-2");%>

            <% //Este if es para cuando no se programan entrevistas y ya es admitido el aspirante, no existe informacion en la tabla dispentrev
            /*if (idplan.equals("309")){
                 sesion.setAttribute("docEst", docEst);
                 response.sendRedirect("ConsultaEntrevAmb");
                 //estud = est.getnoentrevistas(docEst, idplan, oout, per ) ;
                 } */
                /*else {		*/

                //estud = est.getentrevistas("75090176", "370", oout, per ) ;%>
            <% if ((estud.size()) == 0) {%>
 <div align="center"> 
        <table align="center" width="50%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas">
            <tr>
                <td><br>No existe información
                    registrada para este proceso, por favor comuníquese con la Oficina de Admisiones.
                    <br>
                    Tel&eacute;fono: 6683600 opción 2 en el menú. </td>
            </tr>
        </table>
 </div>
        <% } else {%>


        <% for (int j = 0; j < estud.size(); j++) {
                Vector estudiante = (Vector) estud.elementAt(j);%>
 <div align="center"> 
        <table width="50%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="center">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Estudio de admisi&oacute;n: Citación a Entrevista para el programa de <%=prog%><b></b></td>
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
                <td>Apreciado Aspirante:</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <%if (estudiante.elementAt(10).equals("-185") && (idplan.equals("312"))) {%>
            <tr>
                <td>
                    <p>Como parte
                        del estudio de su solicitud de admisi&oacute;n y proceso de selecci&oacute;n,
                        le informamos que deber&aacute; presentar los exámenes de conocimiento  y la Entrevista el  pr&oacute;ximo:<b>
                            <%=estudiante.elementAt(3)%>, a las <%=estudiante.elementAt(4)%> en el
                            <%=estudiante.elementAt(7)%></b>, con el profesor(a): <%=estudiante.elementAt(8)%>.<br>
                        Esperamos su puntual asistencia.</p>
                    <p>Cordialmente</p>
                </td>
            </tr>
            <%} else if (estudiante.elementAt(10).equals("-185") && (idplan.equals("351") || (idplan.equals("374")))) {%>
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
                        le informamos que <!-- deber&aacute; presentar los exámenes de conocimiento el día <b><!%=examen%>.</b> Igualmente,--> se deberá presentar a la entrevista el pr&oacute;ximo:<b>
                            <%=estudiante.elementAt(3)%>, a las <%=estudiante.elementAt(4)%> en la
                            <%=estudiante.elementAt(7)%></b>, con el profesor(a): <%=estudiante.elementAt(8)%><br>
                        Esperamos su puntual asistencia.</p>
                    <p>Cordialmente</p>
                </td>
            </tr>
            <%} else if (estudiante.elementAt(10).equals("-179")) {%>
            <tr>
                <td>
                    <p>El Comité
                        de la Especialización conceptu&oacute; que no es necesario citarlo a entrevista
                        y por lo tanto deberá consultar el <!--próximo--> <b> <%=posgrados.elementAt(10)%></b>, en la
                        sección de Admitidos, el procedimiento a seguir para el tr&aacute;mite
                        de su matr&iacute;cula.</p>
                    <p>Cordialmente</p>
                </td>
            </tr>
            <!--%else if (estudiante.elementAt(10).equals("-181")) {%>
            <!-- <tr>
                 <td>
                     <p>Una vez estudiada
                         su hoja de vida acad&eacute;mica, profesional y laboral, as&iacute; como
                         otros aspectos del proceso de selecci&oacute;n, lamentamos informarle
                         que la Direcci&oacute;n de la Especializaci&oacute;n conceptu&oacute;
                         no aprobar su solicitud de admisi&oacute;n para iniciar actividades acad&eacute;micas
                         el <b><!%=posgrados.elementAt(20)%></b>.No obstante lo anterior
                         le agradecemos que haya escogido la Escuela como una opci&oacute;n para
                         adelantar sus estudios de posgrado y esperamos que haya una pr&oacute;xima
                         oportunidad para contar con usted como un miembro de nuestra comunidad
                         acad&eacute;mica. </p>
                 </td>
                        </tr>-->
            <!--}-->
            <% } else {%>
            <tr>
                <td>No existe
                    información registrada para este proceso, por favor comuníquese con la Oficina
                    de Admisiones. <br>
                    Tel&eacute;fono: 6683600 opción 2 en el menú. </td>
            </tr>
            <%}%>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Direcci&oacute;n
                    <br>
                    <%=prog%></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Cualquier
                    inquietud por favor comun&iacute;quese a: <a href="http://tycho.escuelaing.edu.co/contenido/admisiones/contactos.htm" target="_blank">Ver
                        contacto</a></td>
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
        <p align="center"><h3><center>Usted no se autenticó correctamente o no es un usuario autorizado.</center></h3>
                <%        }
                %>
        <p></p>
        <p></p>
        <div align="center">
        <jsp:include page="piepag">
            <jsp:param name="parametro" value="" />
        </jsp:include>
            </div>
    </body>
</html>

