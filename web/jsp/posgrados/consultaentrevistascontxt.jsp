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
        configeci.configPosgrados confEci = new configeci.configPosgrados();%>

<%if (docEst != null && !docEst.equals("")) {
%>

<html>
    <head>
        <title>Consulta Entrevistas Posgrados</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>

    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Consulta Entrevistas Posgrados" />
        </jsp:include>
        <!--<table width="90%" border="0" cellspacing="0" cellpadding="0" height="20">
            <tr>
                <td rowspan="4" width="133" valign="top"><img src="img/Escudo.gif" width="95" height="96"></td>

                <td height="2" width="582">
                    <div align="center"> </div>
                </td>
            </tr>
            <tr>
                <td height="11" width="582">
                    <div align="center"> <font color="#C10000" size="3"><b><font size="4">ESCUELA
                    COLOMBIANA DE INGENIERIA JULIO GARAVITO</font></b></font> </div>
                </td>
            </tr>
            <tr>
                <td width="582">
                    <div align="center"> <font color="#C10000" size="4"><b>ADMISIONES</b></font>
                    </div>
                </td>
            </tr>
            <tr>

                <td height="27" width="582">
                    <div align="center"> <font color="#C10000" size="4"><b><font size="3">ASPIRANTES
                                    A UN PROGRAMA DE ESPECIALIZACION<BR>
                    ENTREVISTAS</font></b></font> </div>
                </td>
            </tr>
        </table>-->
        <p>

        <%Vector estud = bd.Entrevistas(docEst, idplan, oout, confEci.getPeriodo());%>

        <% //Este if es para cuando no se programan entrevistas y ya es admitido el aspirante, no existe informacion en la tabla dispentrev
        /*if (idplan.equals("129")){
    sesion.setAttribute("docEst", docEst);
    response.sendRedirect("ConsultaEntrevAmb");
    //estud = est.getnoentrevistas(docEst, idplan, oout, per ) ;
    } */
    /*else {		*/

    //estud = est.getentrevistas("75090176", "370", oout, per ) ;%>
        <% if ((estud.size()) == 0) {%>

        <table align="center" width="50%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas">
            <tr>
                <td><br>No existe información
                    registrada para este proceso, por favor comuníquese con la Oficina de Admisiones.
                    <br>
                Tel&eacute;fono: 6683600 Ext: 274, 263 o 101. </td>
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

        <% } else {
        %>

        <!--LECTURA DE ARCHIVO CRONOGRAMA - PARA LEER FECHA DE RESULTADO DE LA SOLICITUD DE ADMON A LA ESPECIALIZACION>   -->
        <%
     String arreg[] = new String[5000];
     String valor[] = new String[5000];
     int p = 0;
     int kk = 0;
     try {
         FileReader rta = new FileReader(ruta.valruta() + "posgrados" + ruta.tokenruta() + "cronograma.txt");
         //FileReader rta = new FileReader("/usr/local/jakarta-tomcat-3.2.1/confEci/posgrados/cronograma.txt");
         BufferedReader entrada = new BufferedReader(rta);
         String s;
         while ((s = entrada.readLine()) != null) {
             arreg[p] = s;
             p = p + 1;
         }
         entrada.close();
         rta.close();%>
        <% } catch (java.io.FileNotFoundException fnfex) {
            System.out.println("Archivo no encontrado: " + fnfex);%>
        <p>Archivo no encontrado
        <%     } catch (java.io.IOException ioex) {
     }
     for (int jj = 0; jj < p; jj++) {
         StringTokenizer st = new StringTokenizer(arreg[jj], "*");
         kk = 0;%>
        <%while (st.hasMoreTokens()) {
                valor[kk] = st.nextToken();
                kk = kk + 1;
            }%>
        <%if (idplan.equals(valor[0])) {
                jj = p - 1;
                fecadmin = valor[9];
                programa = valor[1];
                fecinicio = valor[18];
                examen = valor[25];

            }%>
        <%}%>
        <% for (int j = 0; j < estud.size(); j++) {
         Vector estudiante = (Vector) estud.elementAt(j);%>

        <table width="50%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="center">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Estudio de admisi&oacute;n para la  <b><%=programa%></b></td>
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
                        y por lo tanto deberá consultar el <!--próximo--> <b> <%=fecadmin%></b>, en la
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
                    acad&eacute;mica. </p>

                </td>
            </tr>
            <%} else {%>
            <tr>

                <td>>No existe
                    información registrada para este proceso, por favor comuníquese con la Oficina
                    de Admisiones. <br>
                Tel&eacute;fono: 6683600 Ext: 274, 263 o 101. </td>
            </tr>
            <%}%>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>

                <td>Direcci&oacute;n
                    <br>
                <%=programa%></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>

                <td>Cualquier
                    inquietud por favor comun&iacute;quese a: <a href="http://www.escuelaing.edu.co/admisiones/contactos.htm" target="_blank">Ver
                contacto</a></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>

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
        <jsp:include page="piepag">
            <jsp:param name="parametro" value="" />
        </jsp:include>
    </body>
</html>

