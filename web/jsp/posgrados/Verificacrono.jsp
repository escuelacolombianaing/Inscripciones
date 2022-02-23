<%@page import="utiles.Correo"%>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%  try {
        response.setHeader("Cache-Control", "no-cache");
        configeci.configuracion confEci = new configeci.configuracion();
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MMMM/yyyy");
        int ban = 0;
        String idplan = request.getParameter("idplan");
        
        
        //Se redirige a los homepages de los programas 
        String urlAdmision=bd.getHomepagePrograma(idplan);
        if(!urlAdmision.equals("")){
            response.sendRedirect(urlAdmision);
        }
        
        String prog = "";
        String inicio, fin;
        String titulo = "Inscripciones en línea";
        Vector cronograma = bd.CronogramasPos(oout, confEci.getPeriodo(), idplan);
        if (cronograma.size() <= 0) {
            out.println("No existen datos");
        } else {

            // String dato = new String(cronograma.elementAt(29).toString());
            //   Date fecinicio = formatter.parse(dato);
            //  String ini = formatter.format(fecinicio);%>

<html>
    <head>
        <title>Cronogramas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/FormularioPosgrado.css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

        <script language="JavaScript" type="text/JavaScript">
        </script>
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <%if (idplan.equals("290")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Cronograma Maestría en Ingeniería Civil" />
        </jsp:include>
        <%} else if (idplan.equals("353")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Cronograma Maestría en Gestión de Información" />
        </jsp:include>
        <%} else if (idplan.equals("321")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Cronograma Maestría en Ingeniería Electrónica" />
        </jsp:include>
        <%} else if (idplan.equals("351")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Cronograma Maestría en Desarrollo y Gerencia Integral de proyectos" />
        </jsp:include>
        <%} else if (idplan.equals("371")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Cronograma Maestría en Informática" />
        </jsp:include>
        <%} else if (idplan.equals("372")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Cronograma Maestría en Ciencias Actuariales" />
        </jsp:include>
        <%}else if (idplan.equals("376")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Cronograma Maestría en Ciencia de Datos" />
        </jsp:include>
        <%}else {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Cronograma" />
        </jsp:include>
        <%}%>

        <!--Se envia a la página de contacto segun la especializacion -->
        <%  
            String link = "";
            if (idplan.equals("312")) {
                link = "es/programas/especializacion/Estructuras/contacto";
                prog = "ESPECIALIZACION EN ESTRUCTURAS";
            }

            if (idplan.equals("374")) {
                link = "es/programas/especializacion/Desarrollo+y+Gerencia+Integral+de+Proyectos/contacto";
                prog = "ESPECIALIZACION EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
            }

            if (idplan.equals("267")) {
                link = "es/programas/especializacion/Dise%C3%B1o%2C+Construcci%C3%B3n+y+Conservaci%C3%B3n+de+V%C3%ADas/contacto";
                prog = "ESPECIALIZACION EN DISEÑO CONSTRUCCION Y CONSERVACION DE VIAS";
            }

            if (idplan.equals("313")) {
                link = "es/programas/especializacion/Econom%C3%ADa+para+Ingenieros/contacto";
                prog = "ESPECIALIZACION EN ECONOMIA PARA INGENIEROS";
            }

            if (idplan.equals("370")) {
                link = "es/programas/especializacion/Gesti%C3%B3n+Integrada+QHSE/contacto";
                prog = "ESPECIALIZACIÓN EN GESTIÓN INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE";
            }

            if (idplan.equals("310")) {
                link = "es/programas/especializacion/Recursos+Hidr%C3%A1ulicos+y+Medio+Ambiente/contacto";
//            link = "programas/posgrados/esp/hidraulicos/contacto.htm";
                prog = "ESPECIALIZACION EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
            }

            if (idplan.equals("309")) {
                link = "es/programas/especializacion/Saneamiento+Ambiental/contacto";
                prog = "ESPECIALIZACION EN SANEAMIENTO AMBIENTAL";
            }
            if (idplan.equals("324")) {
                link = "es/programas/especializacion/Telem%C3%A1tica+Aplicada+a+Negocios/contacto";
                prog = "ESPECIALIZACION EN TELEMATICA APLICADA A NEGOCIOS";
            }
            if (idplan.equals("285")) {
                link = "es/programas/especializacion/Procesamiento+de+Pol%C3%ADmeros/contacto";
                prog = "ESPECIALIZACION EN PROCESAMIENTO DE POLIMEROS";
            }
            if (idplan.equals("320")) {
                link = "es/programas/especializacion/Ingenier%C3%ADa+de+Fundaciones/contacto";
                //  link = "programas/posgrados/esp/fundaciones/contacto.htm";
                prog = "ESPECIALIZACION EN INGENIERIA DE FUNDACIONES";
            }
            if (idplan.equals("373")) {
                link = "es/programas/especializacion/Gerencia+de+Producci%C3%B3n+Industrial/contacto";
                prog = "ESPECIALIZACION EN GERENCIA DE OPERACIONES";
            }
            if (idplan.equals("290")) {
                link = "es/programas/maestria/Ingeniería+Civil/contacto";
                prog = "MAESTRIA EN INGENIERIA CIVIL";
            }
            if (idplan.equals("321")) {
                link = "es/programas/maestria/Ingeniería+Electrónica/contacto";
                prog = "MAESTRIA EN INGENIERIA ELECTRONICA";
            }
            if (idplan.equals("351")) {
                link = "es/programas/maestria/Desarrollo+y+gerencia+integral+de+proyectos/contacto";
                prog = "MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
            }
            if (idplan.equals("330")) {
                link = "es/programas/maestria/Ingeniería+Industrial/contacto";
                prog = "MAESTRIA EN INGENIERIA INDUSTRIAL";
            }
            if (idplan.equals("353")) {
                link = "es/programas/maestria/Gestión+de+información/contacto";
                prog = "MAESTRIA EN GESTION DE INFORMACION";
            }
            if (idplan.equals("372")) {
                link = "escuela/maestria/ciencias-actuariales/contacto.html";
                prog = "MAESTRÍA EN CIENCIAS ACTUARIALES";
            }
            if (idplan.equals("376")) {
                link = "escuela/maestria/ciencia-de-datos/contacto.html";
                prog = "MAESTRÍA EN CIENCIA DE DATOS";
            }
            if (idplan.equals("371")) {
                link = "escuela/maestria/informatica/contacto.html";
                prog = "MAESTRÍA EN INFORMÁTICA";
            }
            if (idplan.equals("335")) {
                link = "es/programas/maestria/Ingeniería+Eléctrica/contacto";
                prog = "MAESTRÍA EN INGENIERÍA ELÉCTRICA";
            }
        %>

        <p>
        <table width="80%" border="0" cellspacing="0" cellpadding="0" align="center" class="textoimpremas">
            <tr valign="top">
                <td width="60%" height="31">Si desea ser tenido en cuenta para la próxima
                    convocatoria contáctenos </td>
                    <% if (!idplan.equals("290")) {%>
                <td width="10%" height="31"> <a href="http://www.escuelaing.edu.co/<%=link%>"><img src="img/aqui.jpg" width="37" height="22" border="0"></a>
                        <%} else {%>
                <td width="10%" height="31"> <a href="http://www.escuelaing.edu.co/<%=link%>"><img src="img/aqui.jpg" width="37" height="22" border="0"></a>
                        <%}%>
                </td>
            </tr>
        </table>
        <p>&nbsp;</p>    

        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-12">
                    <% if (cronograma.size() > 1) {%>


                    <table width="53%" border="1" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                        <tr>
                            <td colspan="3" height="26"><center><b><%=prog%></b></center></td>
                        </tr>

                        <% //for (int p=0; p<cronograma.size();p++){ 
                            Vector dato1 = (Vector) cronograma.elementAt(0);
                            Vector dato2 = (Vector) cronograma.elementAt(1);
                            if (idplan.equals("309")) {%>
                        <tr>

                            <td width="15%"  height="26">&nbsp; </td>

                            <td width="11%"  height="26"><b>INTERMEDIO<b> </td>

                                        <td width="13%"  height="26">&nbsp; </td>
                                        </tr>
                                        <tr>

                                            <td width="15%"  height="26"><b>Fecha inicio inscripciones</b></td>
                                            <% if (dato1.elementAt(3).equals("") || (dato1.elementAt(3).equals("No disponible"))) {%>

                                            <td width="11%">&nbsp; </td>
                                            <%} else if (dato1.elementAt(25).equals("1")) {%>

                                            <td width="13%"><%=dato1.elementAt(29)%></td>


                                            <td width="18%"><%=dato2.elementAt(29)%></td>
                                            <%}%>

                                        </tr>
                                        <tr>

                                            <td width="15%" height="26"><b>Fecha final de inscripciones</b></td>
                                            <% if (dato1.elementAt(4).equals("") || (dato1.elementAt(4).equals("No disponible"))) {%>

                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>

                                            <td width="13%"><%=dato1.elementAt(30)%></td>

                                            <td width="18%"><%=dato2.elementAt(30)%></td>
                                            <%}%>
                                        </tr>
                                        <% if (!idplan.equals(317)) {%>
                                        <tr>

                                            <td width="15%" height="26"><b>Citaci&oacute;n a entrevistas</b></td>
                                            <% if (dato1.elementAt(7).equals("") || (dato1.elementAt(7).equals("No disponible"))) {%>

                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26" ><%=dato1.elementAt(7)%></td>

                                            <td width="18%" height="26" ><%=dato2.elementAt(7)%></td>
                                            <%}%>
                                        </tr>
                                        <%} else {%>
                                        <tr>

                                            <td width="15%" height="26"><b>Entrevistas</b></td>
                                            <% if (dato1.elementAt(31).equals("") || (dato1.elementAt(31).equals("No disponible"))) {%>

                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26" ><%=dato1.elementAt(31)%></td>

                                            <td width="18%" height="26" ><%=dato2.elementAt(31)%></td>
                                            <%}%>
                                        </tr>
                                        <%}%>

                                        <tr>

                                            <td width="15%" height="26" ><b>Entrevistas si el comite lo considera necesario</b></td>
                                            <% if (dato1.elementAt(8).equals("") || (dato1.elementAt(8).equals("No disponible"))) {%>

                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>

                                            <td width="13%" height="26" ><%=dato1.elementAt(8)%></td>

                                            <td width="18%" height="26" ><%=dato2.elementAt(8)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>

                                            <td width="15%" height="26" ><b>Inscripciones a cursos preparatorios</b></td>
                                            <% if (dato1.elementAt(5).equals("") || (dato1.elementAt(5).equals("No disponible"))) {%>

                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>

                                            <td width="13%" height="26"><%=dato1.elementAt(5)%></td>

                                            <td width="18%" height="26"><%=dato2.elementAt(5)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>

                                            <td width="15%" height="26"><b>Cursos preparatorios</b></td>
                                            <% if (dato1.elementAt(6).equals("") || (dato1.elementAt(6).equals("No disponible"))) {%>

                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>

                                            <td width="13%" height="26"><%=dato1.elementAt(6)%></td>

                                            <td width="18%" height="26"><%=dato2.elementAt(6)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>


                                            <td width="15%" height="26"><b>Ex&aacute;men</b></td>
                                            <% if (dato1.elementAt(9).equals("") || (dato1.elementAt(9).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26" ><%=dato1.elementAt(9)%></td>

                                            <td width="18%" height="26" ><%=dato2.elementAt(9)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>


                                            <td width="15%" height="26" ><b>Respuesta de admisi&oacute;n al nivelatorio</b></td>
                                            <% if (dato1.elementAt(11).equals("") || (dato1.elementAt(11).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26" ><%=dato1.elementAt(11)%></td>

                                            <td width="18%" height="26" ><%=dato2.elementAt(11)%></td>
                                            <%}%>
                                        </tr>
                                        <% if (!idplan.equals(317)) {%>
                                        <tr>


                                            <td width="15%" height="26" ><b>Respuesta de admisi&oacute;n</b></td>
                                            <% if (dato1.elementAt(10).equals("") || (dato1.elementAt(10).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26" ><%=dato1.elementAt(10)%></td>

                                            <td width="18%" height="26" ><%=dato2.elementAt(10)%></td>
                                            <%}%>
                                        </tr>
                                        <% } else {%>
                                        <tr>


                                            <td width="15%" height="26" ><b>Respuesta de admisi&oacute;n</b></td>
                                            <% if (dato1.elementAt(32).equals("") || (dato1.elementAt(32).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26" ><%=dato1.elementAt(32)%></td>

                                            <td width="18%" height="26" ><%=dato2.elementAt(32)%></td>
                                            <%}%>
                                        </tr>
                                        <%}%>
                                        <tr>

                                            <td width="15%" height="26" ><b>Publicaci&oacute;n de &oacute;rdenes de pago 
                                                    nivelatorio</b></td>
                                                    <% if (dato1.elementAt(12).equals("") || (dato1.elementAt(12).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26"><%=dato1.elementAt(12)%></td>

                                            <td width="18%" height="26"><%=dato2.elementAt(12)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>

                                            <td width="15%" height="26"><b>Publicaci&oacute;n de &oacute;rdenes de pago 
                                                </b></td>
                                                <% if (dato1.elementAt(13).equals("") || (dato1.elementAt(13).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26" ><%=dato1.elementAt(13)%></td>

                                            <td width="18%" height="26" ><%=dato2.elementAt(13)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>

                                            <td width="15%" height="26" ><b>Pagos nivelatorio</b></td>
                                            <% if (dato1.elementAt(14).equals("") || (dato1.elementAt(14).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26" ><%=dato1.elementAt(14)%></td>

                                            <td width="18%" height="26" ><%=dato2.elementAt(14)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>

                                            <td width="15%" height="26"><b>Pagos </b></td>
                                            <% if (dato1.elementAt(15).equals("") || (dato1.elementAt(15).equals("No disponible"))) {%>

                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26" ><%=dato1.elementAt(15)%></td>

                                            <td width="18%" height="26" ><%=dato2.elementAt(15)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>


                                            <td width="15%" height="26"><b>Inducci&oacute;n</b></td>
                                            <% if (dato1.elementAt(16).equals("") || (dato1.elementAt(16).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26"><%=dato1.elementAt(16)%></td>

                                            <td width="18%" height="26" ><%=dato2.elementAt(16)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>


                                            <td width="15%" height="26"><b>Firma de acta de matr&iacute;cula y carnetizaci&oacute;n 
                                                    nivelatorio</b></td>
                                                    <% if (dato1.elementAt(17).equals("") || (dato1.elementAt(17).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26"><%=dato1.elementAt(17)%></td>

                                            <td width="18%" height="26"><%=dato2.elementAt(17)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>


                                            <td width="15%" height="26"><b>Inicio de clases nivelatorio y contenido</b></td>
                                            <% if (dato1.elementAt(18).equals("") || (dato1.elementAt(18).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26"><%=dato1.elementAt(18)%></td>

                                            <td width="18%" height="26"><%=dato2.elementAt(18)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>


                                            <td width="15%" height="26"><b>Firma de acta de matr&iacute;cula y carnetizaci&oacute;n 
                                                </b></td>
                                                <% if (dato1.elementAt(19).equals("") || (dato1.elementAt(19).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26"><%=dato1.elementAt(19)%></td>

                                            <td width="18%" height="26"><%=dato2.elementAt(19)%></td>
                                            <%}%>
                                        </tr>
                                        <tr>


                                            <td width="15%" height="26"><b>Inicio de clases</b></td>
                                            <% if (dato1.elementAt(20).equals("") || (dato1.elementAt(20).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26"><%=dato1.elementAt(20)%> 
                                            <td width="18%" height="26"><%=dato2.elementAt(20)%> 
                                                <%if (dato1.elementAt(28).equals("") || dato1.elementAt(28).equals("No disponible")) {%>
                                                &nbsp; 
                                                <%} else {%>
                                                <%=dato1.elementAt(28)%> <%=dato2.elementAt(28)%></td>
                                                <%}
                }%>
                                        </tr>
                                        <tr>
                                            <%if (!idplan.equals("290")) {%>

                                            <td width="15%" height="26"><b>Preinscripci&oacute;n</b></td>
                                            <% if (dato1.elementAt(26).equals("") || (dato1.elementAt(26).equals("No disponible"))) {%>


                                            <td width="11%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="13%" height="26"><%=dato1.elementAt(26)%></td>

                                            <td width="18%" height="26"><%=dato2.elementAt(26)%></td>
                                            <%}

                                            } else {%>

                                            <td width="1%" height="26"><b>Homologación</b></td>
                                            <% if (dato1.elementAt(26).equals("") || (dato1.elementAt(26).equals("No disponible"))) {%>


                                            <td width="15%">&nbsp; </td>
                                            <%} else {%>


                                            <td width="5%" height="26"><%=dato1.elementAt(26)%></td>

                                            <td width="22%" height="26"><%=dato2.elementAt(26)%></td>
                                            <%}
                                                }
                                            %>
                                        </tr>
                                        </table>        
                                        <% }

                                            //}

                                        %>
                                        <%} else {
                                            Vector dato1 = (Vector) cronograma.elementAt(0);

                                        %>      
                                        <table width="53%" border="1" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                                            <tr>
                                                <td colspan="2" height="26"><center><b><%=prog%></b></center></td>
                                            </tr>

                                            <tr>
                                                <td width="19%"  height="26"><b>Fecha inicio inscripciones</b></td>
                                                <% if (dato1.elementAt(3).equals("") || (dato1.elementAt(3).equals("No disponible"))) {%>
                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>
                                                <td width="22%"><%=dato1.elementAt(29)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>
                                                <td width="19%" height="26"><b>Fecha final de inscripciones</b></td>
                                                <% if (dato1.elementAt(4).equals("") || (dato1.elementAt(4).equals("No disponible"))) {%>
                                                <td width="13%"> 
                                                    <div align="center"></div>
                                                </td>
                                                <%} else {%>
                                                <td width="22%"><%=dato1.elementAt(30)%></td>
                                                <%}%>
                                            </tr>
                                            <% if (!idplan.equals("353")) {%>
                                            <tr>
                                                <td width="19%" height="26"><b>Citaci&oacute;n a entrevistas</b></td>
                                                <% if (dato1.elementAt(7).equals("") || (dato1.elementAt(7).equals("No disponible"))) {%>
                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26" ><%=dato1.elementAt(7)%></td>
                                                <%}%>
                                            </tr>
                                            <%} else {%>
                                            <tr>

                                                <td width="19%" height="26"><b>Entrevistas</b></td>
                                                <% if (dato1.elementAt(31).equals("") || (dato1.elementAt(31).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>


                                                <td width="22%" height="26" ><%=dato1.elementAt(31)%></td>

                                                <%}%>
                                            </tr>
                                            <%}%>
                                            <tr>
                                                <td width="19%" height="26" ><b>Entrevistas si el comite lo considera necesario</b></td>
                                                <% if (dato1.elementAt(8).equals("") || (dato1.elementAt(8).equals("No disponible"))) {%>
                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>
                                                <td width="22%" height="26" ><%=dato1.elementAt(8)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>
                                                <td width="19%" height="26" ><b>Inscripciones a cursos preparatorios</b></td>
                                                <% if (dato1.elementAt(5).equals("") || (dato1.elementAt(5).equals("No disponible"))) {%>
                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>
                                                <td width="22%" height="26"><%=dato1.elementAt(5)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>
                                                <td width="19%" height="26"><b>Cursos preparatorios</b></td>
                                                <% if (dato1.elementAt(6).equals("") || (dato1.elementAt(6).equals("No disponible"))) {%>
                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>
                                                <td width="22%" height="26"><%=dato1.elementAt(6)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>

                                                <td width="19%" height="26"><b>Ex&aacute;men</b></td>
                                                <% if (dato1.elementAt(9).equals("") || (dato1.elementAt(9).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26" ><%=dato1.elementAt(9)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>

                                                <td width="19%" height="26" ><b>Respuesta de admisi&oacute;n al nivelatorio</b></td>
                                                <% if (dato1.elementAt(11).equals("") || (dato1.elementAt(11).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26" ><%=dato1.elementAt(11)%></td>
                                                <%}%>
                                            </tr>

                                            <% if (!idplan.equals("353")) {%>
                                            <tr>

                                                <td width="19%" height="26" ><b>Respuesta de admisi&oacute;n </b></td>
                                                <% if (dato1.elementAt(10).equals("") || (dato1.elementAt(10).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26" ><%=dato1.elementAt(10)%></td>
                                                <%}%>
                                            </tr>
                                            <%} else {%>
                                            <tr>

                                                <td width="19%" height="26" ><b>Respuesta de admisi&oacute;n</b></td>
                                                <% if (dato1.elementAt(32).equals("") || (dato1.elementAt(32).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26" ><%=dato1.elementAt(10)%></td>
                                                <%}%>
                                            </tr>

                                            <%}%>
                                            <tr>
                                                <td width="19%" height="26" ><b>Publicaci&oacute;n de &oacute;rdenes de pago 
                                                        nivelatorio</b></td>
                                                        <% if (dato1.elementAt(12).equals("") || (dato1.elementAt(12).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26"><%=dato1.elementAt(12)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>
                                                <td width="19%" height="26"><b>Publicaci&oacute;n de &oacute;rdenes de pago 
                                                    </b></td>
                                                    <% if (dato1.elementAt(13).equals("") || (dato1.elementAt(13).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26" ><%=dato1.elementAt(13)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>
                                                <td width="19%" height="26" ><b>Pagos nivelatorio</b></td>
                                                <% if (dato1.elementAt(14).equals("") || (dato1.elementAt(14).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26" ><%=dato1.elementAt(14)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>
                                                <td width="19%" height="26"><b>Pagos </b></td>
                                                <% if (dato1.elementAt(15).equals("") || (dato1.elementAt(15).equals("No disponible"))) {%>
                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26" ><%=dato1.elementAt(15)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>

                                                <td width="19%" height="26"><b>Inducci&oacute;n</b></td>
                                                <% if (dato1.elementAt(16).equals("") || (dato1.elementAt(16).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26"><%=dato1.elementAt(16)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>

                                                <td width="19%" height="26"><b>Firma de acta de matr&iacute;cula y carnetizaci&oacute;n 
                                                        nivelatorio</b></td>
                                                        <% if (dato1.elementAt(17).equals("") || (dato1.elementAt(17).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26"><%=dato1.elementAt(17)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>

                                                <td width="19%" height="26"><b>Inicio de clases nivelatorio y contenido</b></td>
                                                <% if (dato1.elementAt(18).equals("") || (dato1.elementAt(18).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26"><%=dato1.elementAt(18)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>

                                                <td width="19%" height="26"><b>Firma de acta de matr&iacute;cula y carnetizaci&oacute;n 
                                                    </b></td>
                                                    <% if (dato1.elementAt(19).equals("") || (dato1.elementAt(19).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26"><%=dato1.elementAt(19)%></td>
                                                <%}%>
                                            </tr>
                                            <tr>

                                                <td width="19%" height="26"><b>Inicio de clases</b></td>
                                                <% if (dato1.elementAt(20).equals("") || (dato1.elementAt(20).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26"><%=dato1.elementAt(20)%> 
                                                    <%if (dato1.elementAt(28).equals("") || dato1.elementAt(28).equals("No disponible")) {%>
                                                    &nbsp; 
                                                    <%} else {%>
                                                    <%=dato1.elementAt(28)%></td>
                                                    <%}
            }%>
                                            </tr>
                                            <tr>
                                                <%if (!idplan.equals("290")) {%>
                                                <td width="19%" height="26"><b>Preinscripci&oacute;n</b></td>
                                                <% if (dato1.elementAt(26).equals("") || (dato1.elementAt(26).equals("No disponible"))) {%>

                                                <td width="13%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="22%" height="26"><%=dato1.elementAt(26)%></td>
                                                <%}

                                                } else {%>
                                                <td width="12%" height="26"><b>Homologación</b></td>
                                                <% if (dato1.elementAt(26).equals("") || (dato1.elementAt(26).equals("No disponible"))) {%>

                                                <td width="7%">&nbsp; </td>
                                                <%} else {%>

                                                <td width="27%" height="26"><%=dato1.elementAt(26)%></td>
                                                <%}
            }
        }%>
                                            </tr>
                                        </table>
                                        </div>
                                        </div>
                                        </div>
                                        <%}%>
                                        <p>&nbsp;</p>
                                        </body>
                                        </html>
                                        <%
                                            } catch (Exception e) {
                                                Correo correo = new Correo();
                                                correo.enviar("Verifica Cronograma", e.getMessage());
                                            }
                                        %>