<%-- 
    Document   : RespAdmitidos
    Created on : 11/05/2010, 02:53:15 PM
    Author     : lrodriguez
--%>

<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    try {
        String docEst = request.getParameter("documento");
        configeci.configuracion confEci = new configeci.configuracion();
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        String prog = new String();
        String idprog = new String();
        String link = new String();
        String fecha = new String();
        String grupo1 = new String();
        String grupo2 = new String();
        String grupo3 = new String();
        String recibo = new String();
        String comparar = new String();
        String tipoest = new String();
        String clasifica1 = new String();
        String clasifica2 = new String();
        String clasifica3 = new String();
        String clasifica4 = new String();
        String clasifica5 = new String();
        String beca = new String();
        String pericfes;
        String pilopaga = new String();
        int ban = 1;
        int banB = 0;
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String tipprog = request.getParameter("tipprog");
        String postula = new String();
        String induccion = request.getParameter("induccion");
        String vinculo = "";
        Date hoy = new Date();
        String fechaActual = formatter.format(hoy);
        int l, b = 0, a = 0, s = 0;
        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipprog);
        Vector entrevista = bd.consultaEntrevista(docEst);%>
<%  if (pregrados.size() > 0) {
        Date fechafin = new Date();
        String dato = new String(pregrados.elementAt(1).toString());
        prog = new String(pregrados.elementAt(3).toString());
// out.println(prog);
        String datofin = new String(pregrados.elementAt(2).toString());
        Date inicio = formatter.parse(dato);
        Date finall = formatter.parse(datofin);
        String X = formatter.format(inicio);
        String Y = formatter.format(finall);
        if (prog.equals(tipprog)) {
            if ((hoy.after(inicio) && hoy.before(finall) || fechaActual.equals(Y)) && pregrados.elementAt(5).equals("1")) {
                ban = 1;
            }
        }
        if (docEst != null && !docEst.equals("")) {
%>

<html>
    <head>
        <title>Admitidos Pregrado</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <style>
            table.print-friendly tr td, table.print-friendly tr th {
                page-break-inside: avoid;
            }
        </style>
        <div class="no-print">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="ASPIRANTES A PRIMER SEMESTRE " />
        </jsp:include>
        </div>
        <div align="center">
            <div class="container-fluid contenidos">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-10">
                        <%Vector estudiante = bd.AdmitidosPregrado(docEst, oout, confEci.getPeriodo());

                            if (estudiante.size() <= 0) {%>

                        <b>Su documento es incorrecto o usted no ha diligenciado la
                            solicitud de admisión. Verifique e intente nuevamente o comuníquese con
                            la Oficina de Admisiones. <br>
                            Tel&eacute;fono: 6683600 opción 2 en el menú.</b>

                        <% } else {
                            for (int k = 0; k < estudiante.size(); k++) {
                                Vector datos = (Vector) estudiante.elementAt(k);

                                if ((datos.size()) == 0) {%>
                        <b>Su documento es incorrecto o usted no ha diligenciado la
                            solicitud de admisión. Verifique e intente nuevamente o comuníquese al 6683600 opción 2 en el menú.</b>

                        <%} else if (ban == 1) {
                            if (datos.elementAt(1).equals("262")) {
                                out.println("<center>Por favor consulte su respuesta por el programa de Ingeniería Biomédica</center> ");

                            } else {
                                Vector asignaturas = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                                idprog = datos.elementAt(1).toString();
                                pilopaga = datos.elementAt(26).toString();
                                Vector reuniones = bd.encuentropadres(oout, idprog);
                                fecha = reuniones.elementAt(1).toString();
                                grupo1 = reuniones.elementAt(2).toString();
                                grupo2 = reuniones.elementAt(3).toString();
                                grupo3 = reuniones.elementAt(4).toString();
                                recibo = reuniones.elementAt(5).toString();
                                induccion = pregrados.elementAt(7).toString();
                                int respuesta = bd.logconsultaadmitidos(datos.elementAt(11).toString(), datos.elementAt(2).toString(), oout);
                                if (datos.elementAt(1).equals("13")) {
                                    prog = "INGENIERÍA CIVIL";
                                } else if (datos.elementAt(1).equals("14")) {
                                    prog = "INGENIERÍA ELÉCTRICA";
                                    beca = "S";
                                    //  fecha = "Miércoles 28 de Octubre a las 10:00 am en el Aula Máxima , Bloque C, primer piso.";
                                } else if (datos.elementAt(1).equals("15")) {
                                    prog = "INGENIERÍA DE SISTEMAS";
                                } else if (datos.elementAt(1).equals("16")) {
                                    prog = "INGENIERÍA INDUSTRIAL";
                                } else if (datos.elementAt(1).equals("17")) {
                                    prog = "INGENIERÍA ELECTRÓNICA";
                                } else if (datos.elementAt(1).equals("18")) {
                                    prog = "ECONOMÍA";
                                    beca = "S";
                                } else if (datos.elementAt(1).equals("19")) {
                                    prog = "ADMINISTRACIÓN DE EMPRESAS";
                                } else if (datos.elementAt(1).equals("20")) {
                                    prog = "MATEMÁTICAS";
                                    beca = "S";
                                } else if (datos.elementAt(1).equals("260")) {
                                    prog = "INGENIERÍA MECÁNICA";

                                } else if (datos.elementAt(1).equals("264")) {
                                    prog = "INGENIERÍA AMBIENTAL";

                                }%>

                        <%  if ((datos.elementAt(2).equals("-60") || datos.elementAt(2).equals("3") || datos.elementAt(2).equals("-48")) && (datos.elementAt(19).equals("0") || datos.elementAt(19).equals("-2")) || datos.elementAt(2).equals("-59")) {%>

                        <%comparar = (String) datos.elementAt(4);%>
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

                        <%if (datos.elementAt(2).equals("-48") && (!datos.elementAt(21).equals(datos.elementAt(22)))) {%>
                        <%String detalle = datos.elementAt(0).toString();%>

                        <table width="701" border="0" cellspacing="0" cellpadding="0" height="431"  align="center"  class="print-friendly">
                            <tr>
                                <td height="12" colspan="3"><b><i>Nombre: <%=datos.elementAt(0)%></i></b></td>
                            </tr>
                            <tr>
                                <td height="12" colspan="3"><b><i>Activación de cupo: <%=prog%></i></b></td>
                            </tr>
                            <tr>
                                <td valign="top" height="12" colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="369" valign="top" colspan="3">
                                    <p>En nombre de la Escuela Colombiana de Ingeniería Julio Garavito, nos es grato comunicarte que tu
                                        solicitud de activación de cupo para iniciar actividades académicas a partir del segundo semestre del año
                                        2020, ha sido aprobada. Bienvenido a la comunidad académica de una de las Instituciones de Educación Superior con mayor prestigio nacional e internacional. </p>
                                    <br>
                                    <%
                                            //ESTO FUE PORQUE SE POSPUSO SABER 11 2020-1
                                            if(datos.elementAt(5).toString().contains("AC20201")){
                                                %>
                                                <p>
                                                    Hemos decidido darte admisión especial, dado que la presentación del examen Saber 11 del 2020-1 fue pospuesta, debes saber que para formalizar tu matrícula es necesario presentar el examen Saber 11, en la nueva fecha definida por el ICFES.
                                                </p>
                                                <%
                                            }
                                        %>
                                    <br>
                                    <%} else if (!datos.elementAt(2).equals("-48") && datos.elementAt(21).equals(datos.elementAt(22))) {%>
                                    <table width="701" border="0" cellspacing="0" cellpadding="0" height="431"  align="center"  class="print-friendly">
                                        <tr>
                                            <td height="12" colspan="3"><b><i>Estimado aspirante: <%=datos.elementAt(0)%></i></b></td>
                                        </tr>
                                        
                                        <tr>
                                            <td valign="top" height="12" colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr>

                                            <td height="369" valign="top" colspan="3"> 


                                                <div align="left"> En nombre de la Escuela Colombiana de Ingenier&iacute;a 
                                                    Julio Garavito, nos es grato comunicarte que tu solicitud de admisi&oacute;n 
                                                    para el programa de <%=prog%> para el segundo <b>semestre del año 
                                                        2020</b>, ha sido aprobada. Bienvenido a la comunidad académica de una de las Instituciones de Educación Superior con mayor prestigio nacional e internacional. 
                                                        <br>
                                        <%
                                            //ESTO FUE PORQUE SE POSPUSO SABER 11 2020-1
                                            if(datos.elementAt(5).toString().contains("AC20201")){
                                                %>
                                                <p>
                                                    Hemos decidido darte admisión especial, dado que la presentación del examen Saber 11 del 2020-1 fue pospuesta, debes saber que para formalizar tu matrícula es necesario presentar el examen Saber 11, en la nueva fecha definida por el ICFES.
                                                </p>
                                                <%
                                            }
                                        %>
                                    
                                    <br>
                                                    <% }
                                                        if ((!datos.elementAt(2).equals("-48") && datos.elementAt(21).equals(datos.elementAt(22))) || (datos.elementAt(2).equals("-48") && !datos.elementAt(21).equals(datos.elementAt(22)))) {%>
                                                </div>
                                                <%
                                            //ESTO FUE PORQUE SE POSPUSO SABER 11 2020-1
                                            if(!datos.elementAt(5).toString().contains("AC20201")){
                                    %>
                                               
                                                <p>Para la admisi&oacute;n hemos analizado los puntajes obtenidos 
                                                    en el examen de Estado que presentaste con el N&uacute;mero
                                                    de Registro <%=datos.elementAt(5)%> quedando ubicado en uno de tres niveles en el &aacute;rea 
                                                    correspondiente seg&uacute;n sea el caso: B&aacute;sico, Medio o Alto.</p>

                                                <p>El puntaje de corte correspondiente a cada nivel se determin&oacute; 
                                                    seg&uacute;n los resultados generales de todos los examinados en Bogot&aacute;, 
                                                    seg&uacute;n la fecha de presentaci&oacute;n en que presentaste 
                                                    el examen de Estado.</p>
                                                    <%pericfes = datos.elementAt(5).toString().substring(2, 7);%>
                                                    <%String annio = datos.elementAt(5).toString().substring(2, 6);%>
                                                    <%String per = datos.elementAt(5).toString().substring(6, 7);%>

                                                <p>Para el a&ntilde;o <%=annio%> per&iacute;odo <%=per%>, en que usted 
                                                    present&oacute; este examen los puntajes de corte fueron:</p>
                                                <p>&nbsp;</p>
                                                <%Vector puntajes = bd.baseicfes(pericfes, oout);%>
                                               
                                                <p>
                                                    <%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("16") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260") || datos.elementAt(1).equals("264")) {%>
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
                                                <p><b> </b></p>

                                                
                                                <% } else if (datos.elementAt(1).equals("18")) {%>
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
                                                        <td width="19%">Ciencias Sociales</td>
                                                        <td width="31%">
                                                            <div align="center"><%=puntajes.elementAt(11)%></div>
                                                        </td>
                                                        <td width="19%"><%=puntajes.elementAt(12)%></td>
                                                        <td width="12%"><%=datos.elementAt(23)%></td>
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
                                                
                                                <%  } else if (datos.elementAt(1).equals("19")) {%>
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
                                                        <td width="19%">Ciencias Sociales</td>
                                                        <td width="31%">
                                                            <div align="center"><%=puntajes.elementAt(11)%></div>
                                                        </td>
                                                        <td width="19%"><%=puntajes.elementAt(12)%></td>
                                                        <td width="12%"><%=datos.elementAt(23)%></td>
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
                                                
                                                <%  }%>
                                                <!%else if (estudiante.elementAt(1).equals("16") || estudiante.elementAt(1).equals("20") || estudiante.elementAt(1).equals("260")) {%>
                                                

                                                <p> Los puntajes intermedios corresponden al Nivel Medio. 

                                                <p align="left" class="no-print"> 
                                                    
                                                <p class="no-print"> 
                                                   
                                                   <%}%>
                                                    <!%}%>
                                                    <%Vector planes = bd.Planestud(docEst, oout);%>
                                                    <% if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                                                    
                                                <%} else {%>
                                                
                                                    <%}%>
                                                <p class="no-print">
                                                    <%   if (datos.elementAt(1).equals("13")) {%>
                                                </p>
                                                <p class="no-print">&nbsp;</p>
                                                <!--http://www.escuelaing.edu.co/programas/ing_civil/imgs/plan_asignaturas.pdf-->
                                                <p> <a href="https://tycho.escuelaing.edu.co/contenido/index/01-planEstudios-Civil.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("14")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/ing_electrica/asignaturas_electrica.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/02-planEstudios-Electrica.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <%  } else if (datos.elementAt(1).equals("15")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/carreras/sistemas/asignaturas_sistemas.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/03-planEstudios-Sistemas.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("16")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/carreras/industrial/asignaturas_industrial.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/04-planEstudios-Industrial.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("17")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/carreras/electronica/asignaturas_electronica.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/05-planEstudios-Electronica.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <%  } else if (datos.elementAt(1).equals("18")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/carreras/economia/asignaturas_economia.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/08-planEstudios-Economia.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("19")) {%>
                                                    <!--http://www.escuelaing.edu.co/micrositio/admin/documentos/plan_asignaturas.pdf-->
                                                    <a href="http://administracionescuelaing.co/wp-content/uploads/2018/04/Plan-de-Estudios-2018-2.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("20")) {%>
                                                    <!--http://copernico.escuelaing.edu.co/ceciba/facultad_matematicas/upload/file/PlanMat2010.pdf-->
                                                    <a href="https://www.escuelaing.edu.co/escuela/planesEstudio/img/matematicas/Malla-curricular-MATEMATICAS.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("260")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/ing_mecanica/asignaturas_mecanica.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/06-planEstudios-Mecanica.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                    <% }else if(datos.elementAt(1).equals("264")){%>
                                                    <a href="https://www.escuelaing.edu.co/uploads/descargables/3415_plan_de_estudios_ing_ambiental.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                    <%}%>
                                                </p>
                                                <p>Te corresponde el plan de estudios No <%=planes.elementAt(1)%> y las asignaturas a cursar en el primer semestre dependen
                                                    del nivel de clasificación obtenido así:
                                                <p>&nbsp;
                                                <table width="50%" border="0" align="left" class="textoimpremas">
                                                    <% if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("264")) {%>
                                                    <tr>
                                                        <td ><b>Asignaturas a cursar:</b> <br>
                                                            <%  for (int h = 0; h < asignaturas.size(); h++) {
                                                                    String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4);
                                                                    Vector nivelasigna = (Vector) asignaturas.elementAt(h);
                                                                    String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2));
                                                                    if (niveles.equals(baseicfes)) {
                                                                        Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(16).toString(), nivelasigna.elementAt(17).toString(), nivelasigna.elementAt(18).toString(), oout);%>
                                                            <%  for (int p = 0; p < nomasigna.size(); p++) {
                                                                    out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
                                                            <br>
                                                            <%}
                                                                    }
                                                                }%>
                                                        </td>
                                                    </tr>
                                                    &nbsp;
                                                    <%} else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("260")) {%>
                                                    <tr>
                                                        <td colspan="2"> <b>Asignaturas a cursar:</b> <br>
                                                            <%  for (int t = 0; t < asignaturas.size(); t++) {
                                                                    String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4) + String.valueOf(com5);
                                                                    Vector nivelasigna = (Vector) asignaturas.elementAt(t);
                                                                    String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2) + String.valueOf(nivelasigna.elementAt(3)));
                                                                    if (niveles.equals(baseicfes)) {
                                                                        Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(16).toString(), nivelasigna.elementAt(17).toString(), nivelasigna.elementAt(18).toString(), oout);%>
                                                            <%  for (int p = 0; p < nomasigna.size(); p++) {
                                                                    out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
                                                            <br>
                                                            <%}
                                                                    }
                                                                }%>
                                                        </td>
                                                    </tr>
                                                    <%} else if (datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19")) {%>
                                                    <tr>
                                                        <td> <b>Asignaturas a cursar:</b> <br>
                                                            <%  for (int t = 0; t < asignaturas.size(); t++) {
                                                                    String niveles = String.valueOf(com1) + String.valueOf(com4);
                                                                    Vector nivelasigna = (Vector) asignaturas.elementAt(t);
                                                                    String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(2));
                                                                    if (niveles.equals(baseicfes)) {
                                                                        Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(16).toString(), nivelasigna.elementAt(17).toString(), nivelasigna.elementAt(18).toString(), oout);%>
                                                            <%  for (int p = 0; p < nomasigna.size(); p++) {
                                                                    out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
                                                            <br>

                                                            <%}
                                                                    }

                                                                }%>
                                                        </td>
                                                    </tr>
                                                    <% } else if (datos.elementAt(1).equals("20")) {%>
                                                    <tr>
                                                        <td colspan="2"> <b>Asignaturas a cursar:</b> <br>
                                                            <%//Arreglo para evitar repeticion de asignaturas  
                                                            ArrayList<String> asignaturasEstudiante=new ArrayList<String>();
                                                        for (int t = 0; t < asignaturas.size(); t++) {
                                                                    String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4);
                                                                    Vector nivelasigna = (Vector) asignaturas.elementAt(t);
                                                                    String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1) + String.valueOf(nivelasigna.elementAt(2)));
                                                                    if (niveles.equals(baseicfes)) {
                                                                        Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(16).toString(), nivelasigna.elementAt(17).toString(), nivelasigna.elementAt(18).toString(), oout);%>
                                                            <%  for (int p = 0; p < nomasigna.size(); p++) {
                                                                    if(!asignaturasEstudiante.contains((String) ((Vector) nomasigna.elementAt(p)).elementAt(0))){
                                                                        out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));
                                                                        asignaturasEstudiante.add((String) (((Vector) nomasigna.elementAt(p)).elementAt(0)));
                                                                    }
                                                                    %>
                                                            <br>
                                                            <%}
                                                                    }
                                                                }%>
                                                        </td>
                                                    </tr>
                                                    <%}%>
                                                </table>
                                                <p> <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <p>&nbsp;</p>
                                                <!--
                                                <p align="left">La Escuela realiza Exámenes de Conocimiento en diferentes áreas y te proporciona una recomendación sobre las asignaturas a cursar, buscando que tengas un mejor desempeño académico, esto no condiciona el ingreso a la universidad. 
                                                <p align="left"><br>
                                                    De acuerdo con el programa de formación que vas a iniciar, debes presentar los exámenes de:<br>
                                                    <br>
                                                    <font color="#800000"><b>* Matemáticas</b><br>
                                                    <% if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("16") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19") || datos.elementAt(1).equals("260") || datos.elementAt(1).equals("264") || datos.elementAt(1).equals("262") || datos.elementAt(1).equals("20")) {%>
                                                    <b>* Física</b><br>
                                                    <%}
                                                        if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20")) {%>
                                                    <b>* Química.</b></font> 
                                                    <%}%>
                                                <p align="left" class="no-print"><a href="https://tycho.escuelaing.edu.co/contenido/promo/matematicas/examen-conocimientos-escuela.html">Consulta 
                                                        aqu&iacute; las condiciones y temarios de apoyo del examen.</a> 

                                                <p align="left"><font color="#800000">Los exámenes de conocimiento se deben 
                                                    presentar de forma virtual el 19 de junio a partir de las 12:00 p.m. al 22 de junio de 2020 hasta las 12:00 a.m. siempre y cuando canceles los derechos de matrícula, 
                                                    para ingresar a presentar el examen de <a href="http://campusvirtual.escuelaing.edu.co/"> 
                                                        click AQUI.</a> </font> 
                                                <p align="left" class="no-print"><font color="#800000"><a href="http://tycho.escuelaing.edu.co/contenido/transmisiones/institucional/index.html">Ver instrucciones para la presentación del examen.</a></font></p>
                                                <p align="left">El día 23 de junio luego del medio día, puedes ingresar y conocer los resultados y realizar la aceptación de las asignaturas a cursar según la recomendación</p>
                                                -->
                                                    
                                                
                                                    <p class="no-print">Instructivo formalización de matrícula <a href="https://www.escuelaing.edu.co/es/programas/admisiones/pregrado?id=1&itemId=8">aqui.</a></p>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td colspan="3">
                                                <p class="no-print">&nbsp;

                                                   

                                                <p class="no-print">
                                                   
                                                    

                                                <p> 
                                                    <%if (false) {%>
                                                    Por decisión del Ministerio de Educación Nacional, a la Escuela Colombiana de Ingeniería 
                                                    se le ha asignado un cupo máximo de 23 nuevos estudiantes matriculados al programa Ser Pilo Paga IV para el segundo período 
                                                    académico de 2020, por esta razón, el cupo será asignado por nuestra institución según el orden de formalización de la matrícula
                                                    por los aspirantes admitidos al momento de la legalización de la beca en las instalaciones de la Escuela.
                                                <p>
                                                    Tenga presente que debe diligenciar su segundo formulario ante el Icetex para seleccionarnos 
                                                    como su primera opción de la beca a partir del mes de Junio aproximadamente en el siguiente <a href="https://portal.icetex.gov.co/Portal/Home/prensa/2017/11/14/quieres-ser-uno-de-los-pilos-beneficiarios-de-ser-pilo-paga4"> link</a>

                                                <p class="no-print">
                                                    
                                                </p>
                                                <p class="no-print">
                                                    Consulta <a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/ConsultaDoc"> aqu&iacute;</a> el estado de tus documentos. 
                                                </p>
                                                    
                                                    
                                                <p><br>
                                                    
                                                    <br>        
                                                    
                                                    Para firmar el acta de matrícula académica, el estudiante deberá formalizar su beca en la ventanilla de Apoyo financiero a partir del mes de Junio aproximadamente y posteriormente debe entregar en la ventanilla 10 (certificaciones y matrículas), plazoleta del bloque A, los siguientes documentos:
                                                    <br>
                                                    1. Fotocopia del diploma de bachiller y el acta de grado debidamente registrados (número de acta y folio) y firmados.
                                                    <br>
                                                    2. Orden de pago de los derechos de matrícula con el sello de la entidad donde se realizaste el pago.
                                                    <br>
                                                    Una vez firmes el acta, te tomaremos la foto y te entregaremos el carné.

                                                    
                                                    
                                                    <br>
                                      
                                                    
                                                        <p>
                                                            Para obtener información sobre alternativas de Apoyo Financiero, dirígete a la plazoleta del bloque A, primer piso, donde recibirás información de nuestros asesores de servicio o de las entidades financieras en convenio con la Escuela; cualquier inquietud puedes comunicarte al correo apoyofinanciero@escuelaing.edu.co, o los teléfonos 6683600 ext. 107.
                                                        </p>
                                                            
                           
                                                        <br>
                                                            La jornada de inducción se realizará los días <%=induccion%>. 

                                                        <br>
                                                            Inicio de clases: 03 de agosto de 2020
                                                        <br>

                                                            <%}else{%>
                                                            <p class="no-print">
                                                        </p>
                                                        <p class="no-print">
                                                            Consulta <a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/ConsultaDoc"> aqu&iacute;</a> el estado de tus documentos. 
                                                        </p> 
                                                            
                                                            
                                                            
                                                        <p><br>
                                                            Si no has completado la totalidad de los documentos para la liquidaci&oacute;n de matr&iacute;cula, podr&aacute;s consultarla una semana despu&eacute;s de haberla completado.
                                                        </p>    
                                                            
                                                        Para descargar la orden de matrícula dar clic en el <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginAdmitido?id=1">link</a>, 
                                                            seleccionar estudiante nuevo, el usuario es el n&uacute;mero de referencia 
                                                            y la contrase&ntilde;a el documento de identidad. 
                                                        
                                                        <p><br>Para firmar el acta de matr&iacute;cula acad&eacute;mica, el estudiante 
                                                            deber&aacute; entregar en la ventanilla 10 (certificaciones y matr&iacute;culas), 
                                                            plazoleta del bloque A, luego de culminar su proceso de liquidaci&oacute;n de matr&iacute;cula <!--(recuerde que no tendremos atención al público en el periodo de vacaciones colectivas de la Escuela del 21 de diciembre de 2017 al 3 de enero de 2018)-->, 
                                                            los siguientes documentos:
                                                        </p>
                                                        <p><br>
                                                            1. Fotocopia del diploma de bachiller y el acta de grado debidamente 
                                                            registrados (n&uacute;mero de acta y folio) y firmados.<br>
                                                            2. Orden de pago de los derechos de matr&iacute;cula con el sello 
                                                            de la entidad donde se realizaste el pago.<br>
                                                            Una vez firmes el acta, te tomaremos la foto y te entregaremos el carné.<br>
                                                        </p>
                                                            
                                                        </p>
                                                        <p><br>
                                                            Para obtener información sobre alternativas de Apoyo Financiero, dirígete 
                                                            a la plazoleta del bloque A, primer piso, donde recibirás información 
                                                            de nuestros asesores de servicio o de las entidades financieras en 
                                                            convenio con la Escuela; cualquier inquietud puedes comunicarte al 
                                                            correo <a href="mailto:apoyofinanciero@escuelaing.edu.co"> apoyofinanciero@escuelaing.edu.co</a>, 
                                                            o los teléfonos 6683600 ext. 107. 
                                                            <br>
                                                            <br>
                                                        </p>
                                                        <p>La jornada de inducci&oacute;n se realizar&aacute; los d&iacute;as <%=induccion%>
                                                            <br>
                                                            <br>
                                                        </p>
                                                        <p>Inicio de clases: 03 de agosto de 2020
                                                            


                                                            <%}
                                                        }%>
                                                            
                                                        </p>
                                                        <P>
                                                            <br>

                                                        <P>

                                                            
                                                            <% postula = "S";
                                                                Vector pregradoB = bd.pregrado(oout, confEci.getPeriodo(), postula);
                                                                if (pregradoB.size() > 0) {
                                                                    //  String datoB = new String(pregradoB.elementAt(1).toString());
                                                                    Date hoyB = new Date();
                                                                    String fechaActualB = formatter.format(hoy);
                                                                    Date fechafinB = new Date();
                                                                    String datoB = new String(pregradoB.elementAt(1).toString());
                                                                    prog = new String(pregradoB.elementAt(3).toString());
                                                                    // out.println(prog);
                                                                    String datofinB = new String(pregradoB.elementAt(2).toString());
                                                                    Date inicioB = formatter.parse(datoB);
                                                                    Date finallB = formatter.parse(datofinB);
                                                                    String XB = formatter.format(inicioB);
                                                                    String YB = formatter.format(finallB);
                                                                    if (prog.equals(postula)) {
                                                                        if ((hoyB.after(inicioB) && hoyB.before(finallB) || fechaActualB.equals(YB)) && pregradoB.elementAt(5).equals("1")) {
                                                                            banB = 1;
                                                                        }
                                                                    }%>
                                                            
                                                            <% if (banB == 1) {
                                                            if (beca.equals("S") && datos.elementAt(1).equals("20")) {%>
                                                        <p>
                                                            <a href="html/PropuestabecasMatematicas.pdf">PARA ADJUDICACION DE BECAS </a>
                                                            <%}

                                                                //if (beca.equals("S") && datos.elementAt(20).equals("S") && (datos.elementAt(19).equals("0") || datos.elementAt(19).equals("-2"))) {
                                                                //QUITAMOS LA VALIDACION DE QUE LA DOCUMENTACION ESTE COMPLETA POR SOLICITUD CORREO ADMISIONES
                                                                if (beca.equals("S") && datos.elementAt(20).equals("S")) {%>
                                                            <br>
                                                        <p>
                                                            <b> Desea Postularse a la Beca Julio Garavito Armero?</b>

                                                            <!%else {%>
                                                            

                                                        <p>&nbsp;
                                                            </td>
                                                            </tr>
                                                            <BR>
                                                            <br>
                                                        <form name="form1" method="post" action="PostulaBeca">
                                                            <input name="idEst" type="hidden" value="<%=datos.elementAt(11)%>">
                                                            <input name="fac_cor" type="hidden" value="<%=datos.elementAt(16)%>">
                                                            <tr>
                                                                <td height="37" width="186">
                                                                    <p>SI
                                                                        <input type="radio" name="beca" value="1">
                                                                    </p>
                                                                    <p>&nbsp;</p>
                                                                </td>
                                                                <td height="37" width="178">
                                                                    <p>NO
                                                                        <input type="radio" name="beca" value="0">
                                                                    </p>
                                                                    <p>&nbsp; </p>
                                                                </td>
                                                                <td height="37" width="337">
                                                                    <input type="submit" name="Submit" value="Postularme">
                                                                </td>
                                                            </tr>
                                                        </form>
                                                        <%}
                                                                }
                                                            }%>
                                    </table>
                                    <p>&nbsp;</p><table width="70%" border="0" align="center" textoimpremas>
                                        <tr>
                                            
                                        <div align="right">
                                            <td width="32%">&nbsp;</td>

                                            
                                            </tr>
                                            
                                            <tr>
                                                <td width="39%">
                                                    <div align="center">
                                                        <p></p>
                                                        <p>&nbsp;
                                                        <p>Secretar&iacute;a General - Admisiones
                                                    </div>
                                                </td>
                                            </tr>
                                    </table>

                                    <%} else if (datos.elementAt(2).equals("-60") && (datos.elementAt(19).equals("1") || datos.elementAt(19).equals("2") || datos.elementAt(19).equals("-1"))) {%>

                                    <%comparar = (String) datos.elementAt(4);%>
                                    <%

                                        char com1 = comparar.charAt(0);
                                        char com2 = comparar.charAt(1);
                                        char com3 = comparar.charAt(2);
                                        char com4 = comparar.charAt(3);
                                        char com5 = comparar.charAt(4);
                                    %>

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

                                    <table width="701" border="0" cellspacing="0" cellpadding="0" height="431"  align="center"  class="textoimpremas">
                                        <tr>
                                            <td height="12"><b><i>Estimado aspirante: <%=datos.elementAt(0)%></i></b></td>
                                        </tr>
                                        
                                        <tr>
                                            <td valign="top" height="12">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td height="369" valign="top">
                                                <p>En nombre de la Escuela Colombiana de Ingenier&iacute;a Julio Garavito,
                                                    nos es grato comunicarte que tu solicitud de admisi&oacute;n para el programa de <%=prog%>  para el segundo semestre del año
                                                    2020, ha sido aprobada. Bienvenido a la comunidad acad&eacute;mica
                                                    de una de las Instituciones de Educaci&oacute;n Superior con mayor prestigio
                                                    Nacional e Internacional. </p>
                                                <br>
                                    <%
                                            //ESTO FUE PORQUE SE POSPUSO SABER 11 2020-1
                                            if(datos.elementAt(5).toString().contains("AC20201")){
                                                %>
                                                <p>
                                                    Hemos decidido darte admisión especial, dado que la presentación del examen Saber 11 del 2020-1 fue pospuesta, debes saber que para formalizar tu matrícula es necesario presentar el examen Saber 11, en la nueva fecha definida por el ICFES.
                                                </p>
                                                <%
                                            }
                                        %>
                                    <br>
                                    <%
                                            //ESTO FUE PORQUE SE POSPUSO SABER 11 2020-1
                                            if(!datos.elementAt(5).toString().contains("AC20201")){
                                    %>
                                   
                                  
                                                <p>Para la admisi&oacute;n hemos analizado los puntajes obtenidos
                                                     en el examen de Estado que presentaste con el N&uacute;mero de Registro
                                                    <%=datos.elementAt(5)%> quedando ubicado en uno de tres niveles en
                                                    el &aacute;rea correspondiente seg&uacute;n sea el caso: B&aacute;sico,
                                                    Medio o Alto.</p>
                                                <p>El puntaje de corte correspondiente a cada nivel se determin&oacute;
                                                    seg&uacute;n los resultados generales de todos los examinados en Bogot&aacute;,
                                                    seg&uacute;n la fecha de presentaci&oacute;n en que presentaste
                                                    el examen de Estado.</p>
                                                    <%pericfes = datos.elementAt(5).toString().substring(2, 7);%>
                                                    <%String annio = datos.elementAt(5).toString().substring(2, 6);%>
                                                    <%String per = datos.elementAt(5).toString().substring(6, 7);%>
                                                <p>Para el a&ntilde;o <%=annio%> per&iacute;odo <%=per%>, en que usted present&oacute;
                                                    este examen los puntajes de corte fueron:</p>
                                                <p>&nbsp;</p>

                                                <%Vector puntajes = bd.baseicfes(pericfes, oout);%>

                                                <p>
                                                    <%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("16") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260") || datos.elementAt(1).equals("264")) {%>

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

                                                
                                                <% } else if (datos.elementAt(1).equals("18")) {%>
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
                                                        <td width="19%">Ciencias Sociales</td>
                                                        <td width="31%">
                                                            <div align="center"><%=puntajes.elementAt(11)%></div>
                                                        </td>
                                                        <td width="19%"><%=puntajes.elementAt(12)%></td>
                                                        <td width="12%"><%=datos.elementAt(23)%></td>
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

                                                <%  } else if (datos.elementAt(1).equals("19")) {%>
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
                                                        <td width="19%">Ciencias Sociales</td>
                                                        <td width="31%">
                                                            <div align="center"><%=puntajes.elementAt(11)%></div>
                                                        </td>
                                                        <td width="19%"><%=puntajes.elementAt(12)%></td>
                                                        <td width="12%"><%=datos.elementAt(23)%></td>
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

                                                <%  }%>

                                                <p> Los puntajes intermedios corresponden al Nivel Medio. 

                                                <%}%>
                                                <p> 
                                                    
                                                <p> 
                                                    <%Vector planes = bd.Planestud(docEst, oout);%>
                                                    <% if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                                                    
                                                <%} else {%>
                                                
                                                    <%}%>
                                                <p>
                                                    <%   if (datos.elementAt(1).equals("13")) {%>
                                                </p>
                                                <p>&nbsp;</p>
                                                <!--http://www.escuelaing.edu.co/programas/ing_civil/imgs/plan_asignaturas.pdf-->
                                                <p> <a href="https://tycho.escuelaing.edu.co/contenido/index/01-planEstudios-Civil.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("14")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/ing_electrica/asignaturas_electrica.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/02-planEstudios-Electrica.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <%  } else if (datos.elementAt(1).equals("15")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/carreras/sistemas/asignaturas_sistemas.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/03-planEstudios-Sistemas.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("16")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/carreras/industrial/asignaturas_industrial.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/04-planEstudios-Industrial.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("17")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/carreras/electronica/asignaturas_electronica.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/05-planEstudios-Electronica.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <%  } else if (datos.elementAt(1).equals("18")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/carreras/economia/asignaturas_economia.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/08-planEstudios-Economia.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("19")) {%>
                                                    <!--http://www.escuelaing.edu.co/micrositio/admin/documentos/plan_asignaturas.pdf-->
                                                    <a href="http://administracionescuelaing.co/wp-content/uploads/2018/04/Plan-de-Estudios-2018-2.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("20")) {%>
                                                    <!--http://copernico.escuelaing.edu.co/ceciba/facultad_matematicas/upload/file/PlanMat2010.pdf-->
                                                    <a href="https://www.escuelaing.edu.co/escuela/planesEstudio/img/matematicas/Malla-curricular-MATEMATICAS.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% } else if (datos.elementAt(1).equals("260")) {%>
                                                    <!--http://www.escuelaing.edu.co/programas/ing_mecanica/asignaturas_mecanica.pdf-->
                                                    <a href="https://tycho.escuelaing.edu.co/contenido/index/06-planEstudios-Mecanica.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                        <% }else if(datos.elementAt(1).equals("264")){%>
                                                    <a href="https://www.escuelaing.edu.co/uploads/descargables/3415_plan_de_estudios_ing_ambiental.pdf" target="top">
                                                        VER PLAN ASIGNATURAS </a>
                                                    <%}%>
                                                </p>
                        
                                                <p>Te corresponde el plan de estudios No <%=planes.elementAt(1)%> y las asignaturas a cursar en el primer semestre dependen
                                                    del nivel de clasificación obtenido así:
                                                <p>&nbsp;
                                                <table width="50%" border="0" align="left" class="textoimpremas">

                                                    <% if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("264")) {%>


                                                    <tr>
                                                        <td ><b>Asignaturas a cursar:</b>
                                                            <br>
                                                            <%  for (int t = 0; t < asignaturas.size(); t++) {
                                                                    String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4);
                                                                    Vector nivelasigna = (Vector) asignaturas.elementAt(t);
                                                                    String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2));
                                                                    if (niveles.equals(baseicfes)) {
                                                                        Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(16).toString(), nivelasigna.elementAt(17).toString(), nivelasigna.elementAt(18).toString(), oout);%>
                                                            <%  for (int p = 0; p < nomasigna.size(); p++) {
                                                                    out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%> <br>
                                                            <%}

                                                                    }

                                                                }%>
                                                        </td>
                                                    </tr>
                                                    &nbsp;
                                                    <%} else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("260")) {%>


                                                    <tr>
                                                        <td colspan="2"> <b>Asignaturas a cursar:</b>
                                                            <br>
                                                            <%  for (int t = 0; t < asignaturas.size(); t++) {
                                                                    String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4) + String.valueOf(com5);
                                                                    Vector nivelasigna = (Vector) asignaturas.elementAt(t);
                                                                    String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2) + String.valueOf(nivelasigna.elementAt(3)));
                                                                    if (niveles.equals(baseicfes)) {
                                                                        Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(16).toString(), nivelasigna.elementAt(17).toString(), nivelasigna.elementAt(18).toString(), oout);%>
                                                            <%  for (int p = 0; p < nomasigna.size(); p++) {
                                                                    out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%> <br>
                                                            <%}
                                                                    }
                                                                }%>
                                                        </td>
                                                    </tr>
                                                    <%} else if (datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19")) {%>

                                                    <tr>
                                                        <td> <b>Asignaturas a cursar:</b>
                                                            <br>
                                                            <%  for (int t = 0; t < asignaturas.size(); t++) {
                                                                    String niveles = String.valueOf(com1) + String.valueOf(com4);
                                                                    Vector nivelasigna = (Vector) asignaturas.elementAt(t);
                                                                    String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(2));
                                                                    if (niveles.equals(baseicfes)) {
                                                                        Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(16).toString(), nivelasigna.elementAt(17).toString(), nivelasigna.elementAt(18).toString(), oout);%>
                                                            <%  for (int p = 0; p < nomasigna.size(); p++) {
                                                                    out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%> <br>
                                                            <%}
                                                                    }
                                                                }%>
                                                        </td>
                                                    </tr>

                                                    <% } else if (datos.elementAt(1).equals("20")) {%>
                                                    <tr>
                                                        <td colspan="2"> <b>Asignaturas a cursar:</b> <br>
                                                            <%//Arreglo para evitar repeticion de asignaturas  
                                                            ArrayList<String> asignaturasEstudiante=new ArrayList<String>();
                                                            for (int t = 0; t < asignaturas.size(); t++) {
                                                                    String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4);
                                                                    Vector nivelasigna = (Vector) asignaturas.elementAt(t);
                                                                    String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1) + String.valueOf(nivelasigna.elementAt(2)));
                                                                    if (niveles.equals(baseicfes)) {
                                                                        Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(16).toString(), nivelasigna.elementAt(17).toString(), nivelasigna.elementAt(18).toString(), oout);%>
                                                            <%  for (int p = 0; p < nomasigna.size(); p++) {
                                                                    if(!asignaturasEstudiante.contains((String) ((Vector) nomasigna.elementAt(p)).elementAt(0))){
                                                                        out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));
                                                                        asignaturasEstudiante.add((String) (((Vector) nomasigna.elementAt(p)).elementAt(0)));
                                                                    }
                                                            %>
                                                            <br>
                                                            <%}
                                                                    }
                                                                }%>
                                                        </td>
                                                    </tr>
                                                    <%}%>
                                                </table>
                                                <p>
                                                    <br>
                                            </td>
                                        </tr>                                
                                        <BR><br>                                    
                                        <tr>
                                            <td>
                                                <p class="no-print">&nbsp;</p>

                                                <!--
                                                <p align="left">La Escuela realiza Exámenes de Conocimiento en diferentes áreas y te proporciona una recomendación sobre las asignaturas a cursar, buscando que tengas un mejor desempeño académico, esto no condiciona el ingreso a la universidad. <br>
                                                    De acuerdo con el programa de formación que vas a iniciar, debes presentar los exámenes de:<br>
                                                    <br>
                                                    <font color="#800000"><b>* Matemáticas</b><br>
                                                    <% if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("16") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19") || datos.elementAt(1).equals("260") || datos.elementAt(1).equals("264") || datos.elementAt(1).equals("262") || datos.elementAt(1).equals("20")) {%>
                                                    <b>* Física</b><br>
                                                    <%}
                                                        if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20")) {%>
                                                    <b>* Química.</b></font> 
                                                    <%}%>
                                                    
                                                </p>
                                                <p align="left"><a href="https://tycho.escuelaing.edu.co/contenido/promo/matematicas/examen-conocimientos-escuela.html">Consulta 
                                                        aqu&iacute; las condiciones y temarios de apoyo del examen.</a> 
                                                </p>
                                                <p align="left"><font color="#800000">Los Ex&aacute;menes de Conocimiento se deben 
                                                    presentar de forma virtual el 19 de junio a partir de las 12:00 p.m. al 22 de junio de 2020 hasta las 12:00 a.m. siempre y cuando canceles los derechos de matr&iacute;cula, 
                                                    para ingresar a presentar el examen de <a href="http://campusvirtual.escuelaing.edu.co/"> 
                                                        click AQUI.</a> </font> 
                                                </p>
                                                <p align="left"><font color="#800000"><a href="http://tycho.escuelaing.edu.co/contenido/transmisiones/institucional/index.html">Ver instrucciones para la presentación del examen.</a></font></p>
                                                    <p align="left">El día 23 de junio luego del medio día, puedes ingresar y conocer los resultados y realizar la aceptación de las asignaturas a cursar según la recomendación</p>
                                                    -->
                                                    Instructivo formalización de matrícula <a href="https://www.escuelaing.edu.co/es/programas/admisiones/pregrado?id=1&itemId=8">aqui.</a>
                                            </td>
                                        </tr
                                        ><tr>
                                            <td>
                                                <p>&nbsp;

                                                <p> 
                                                  
                                                    <%if (false) {%>
                                                      Por decisión del Ministerio de Educación Nacional, a la Escuela Colombiana de Ingeniería 
                                                    se le ha asignado un cupo máximo de 23 nuevos estudiantes matriculados al programa Ser Pilo Paga IV para el segundo período 
                                                    académico de 2020, por esta razón, el cupo será asignado por nuestra institución según el orden de formalización de la matrícula
                                                    por los aspirantes admitidos al momento de la legalización de la beca en las instalaciones de la Escuela.
                                                <p>
                                                    Tenga presente que debe diligenciar su segundo formulario ante el Icetex para seleccionarnos 
                                                    como su primera opción de la beca a partir del mes de Junio aproximadamente en el siguiente <a href="https://portal.icetex.gov.co/Portal/Home/prensa/2017/11/14/quieres-ser-uno-de-los-pilos-beneficiarios-de-ser-pilo-paga4"> link</a>

                                                <p>
                                                    
                                                <p>
                                                    Consulta <a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/ConsultaDoc"> aqu&iacute;</a> el estado de tus documentos. 
                                                    
                                                    <p><br>
                                                    
                                                <p>
                                                    Para firmar el acta de matrícula académica, el estudiante deberá formalizar su beca en la ventanilla de Apoyo financiero hasta el 10 de mayo de 2018 y posteriormente debe entregar en la ventanilla 10 (certificaciones y matrículas), plazoleta del bloque A, los siguientes documentos:
                                                    <br>
                                                    1. Fotocopia del diploma de bachiller y el acta de grado debidamente registrados (número de acta y folio) y firmados.
                                                    <br>
                                                    2. Orden de pago de los derechos de matrícula con el sello de la entidad donde se realizaste el pago.
                                                    <br>
                                                    Una vez firmes el acta, te tomaremos la foto y te entregaremos el carné.
                                                    
                                                    
                                                    <br>
                                           
                                                    
                                                <p>
                                                    
                                                        <p>
                                                            <br>
                                                            <br>
                                                            Para obtener información sobre alternativas de Apoyo Financiero, dirígete a la plazoleta del bloque A, primer piso, donde recibirás información de nuestros asesores de servicio o de las entidades financieras en convenio con la Escuela; cualquier inquietud puedes comunicarte al correo apoyofinanciero@escuelaing.edu.co, o los teléfonos 6683600 ext. 107.
                                                            <br>
                                                            <br>
                                                            La jornada de inducción se realizará los días <%=induccion%>. 
                                                            <br>
                                                            <br>
                                                            Inicio de clases: 03 de agosto de 2020

                                                    <%} else if (datos.elementAt(1).equals("20")&&false) {%>
                                                    Considerando que tú y tu familia formaran parte de nuestra comunidad 
                                                    queremos invitarlo a un Encuentro de Padres de los nuevos estudiantes 
                                                    con las Directivas de la Universidad, con el objetivo que conozca 
                                                    nuestra institución, nuestra misión, los aspectos de la carrera y 
                                                    todo lo que se le ofrecerá mientras realice su proceso de formación 
                                                    profesional. 
                                                    <br>
                                               
                                                    
                                                    <%}else{%>
                                                    
                                                    
                                                <p>
                                                <p>Consulta <a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/ConsultaDoc">aqu&iacute; </a>el estado de tus documentos. 
                                                
                                                    
                                                <p><br>
                                                    Si no has completado la totalidad de los documentos para la liquidaci&oacute;n de matr&iacute;cula, podr&aacute;s consultarla una semana despu&eacute;s de haberla completado.
                                                    
                                                    <p><br>
                                                    Siguiendo el <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginAdmitido?id=1">link</a>, seleccionar 
                                                    estudiante nuevo, el usuario es el n&uacute;mero de referencia y la 
                                                    contrase&ntilde;a el documento de identidad. <br>
                                                    <br>
                                                    
                                                    Para firmar el acta de matr&iacute;cula acad&eacute;mica, el estudiante 
                                                    deber&aacute; entregar en la ventanilla 10 (certificaciones y matr&iacute;culas), 
                                                    plazoleta del bloque A, 
                                                    los siguientes documentos:
                                                <p>1. Fotocopia del diploma de bachiller y el acta de grado debidamente 
                                                    registrados (n&uacute;mero de acta y folio) y firmados.<br>
                                                    2. Orden de pago de los derechos de matr&iacute;cula con el sello 
                                                    de la entidad donde se realizaste el pago.<br>
                                                    Una vez firmes el acta, te tomaremos la foto y te entregaremos el carné.<br>
                                                    
                                                    <br>
                                                    <br>
                                                    <br>
                                                    
                                                    
                                                    
                                                </p>
                                                <p><br>
                                                    
                                                  
                                                <p><br>
                                                    Para obtener información sobre alternativas de Apoyo Financiero, dirígete 
                                                    a la plazoleta del bloque A, primer piso, donde recibirás información 
                                                    de nuestros asesores de servicio o de las entidades financieras en 
                                                    convenio con la Escuela; cualquier inquietud puedes comunicarte al 
                                                    correo <a href="mailto:apoyofinanciero@escuelaing.edu.co"> apoyofinanciero@escuelaing.edu.co</a>, 
                                                    o los teléfonos 6683600 ext. 107. 

                                                    <br>
                                                    <br>
                                                <p>La jornada de inducci&oacute;n se realizar&aacute; los d&iacute;as <%=induccion%>.
                                                    <br>
                                                    <br>
                                                <p> Inicio de clases: 03 de agosto de 2020
                                                    

                                                    
                                            </td>
                                        </tr>

                                    </table>
                                    <p>&nbsp;</p><table width="70%" border="0" align="center" textoimpremas>
                                        <tr>
                                            
                                            <td width="32%">&nbsp;</td>

                
                                        </tr>
                                        
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

                                    <% }

                                        }%>

                                    <%ban = 1;
                                        //el programa20 se valida en 2010-2 ya se admisiones no desea q los inscritos a este programa puedan consultar la rta de admision
                                        if (datos.elementAt(2).equals("-83") && !datos.elementAt(1).equals("20")) {%>
                                    <br>


                                    <b>Nombre: <%=datos.elementAt(0)%></b> <br>
                                    <b>Programa academico: <%=prog%></b>
                                    <p><b><i>Apreciado aspirante:</i></b>
                                    <p><i><b>Usted no ha entregado  la documentación necesaria para procesar su admisión.
                                                Favor comuníquese al 6683600 opción 2 en el menú.</b> </i>
                                        <br>
                            <center> <input type="button" value="Cerrar ventana" onclick="window.close()" name="cerrar" id="cerrar" class="boton"></center>


                            <%}
                                if (datos.elementAt(2).equals("-85")) {%>
                            <br>

                            <b>Nombre: <%=datos.elementAt(0)%></b>
                            <br>
                            <b>Programa academico: <%=prog%></b>
                            <p><b><i>Apreciado aspirante:</i></b>
                            <p><i><b>Usted no ha diligenciado su formulario de solicitud de admisión.
                                        Por favor comuníquese al 6683600 opción 2 en el menú.</b> </i>
                                <br>
                            <center><input type="button" value="Cerrar ventana" onclick="window.close()" name="cerrar" id="cerrar" class="boton"></center>



                            <%}
                                if (datos.elementAt(2).equals("-70")) {%>
                            <br>

                            <table width="707" border="0" cellspacing="0" cellpadding="0" align="center" class="textoimpremas" >
                                <tr>

                                    <td><b><i>Nombre: <%=datos.elementAt(0)%></i></b> <i><br>
                                            <b>Programa académico: <%=prog%></b>
                                            


                                        </i>
                                        

                                        
                                        <p><i>Apreciado aspirante: </i>
                                        <p>Para la admisi&oacute;n hemos analizado los puntajes obtenidos 
                                            en el examen de Estado que presentaste con el N&uacute;mero de Registro
                                            <%=datos.elementAt(5)%> quedando ubicado en uno de tres niveles en
                                            el &aacute;rea correspondiente seg&uacute;n sea el caso: B&aacute;sico,
                                            intermedio o Alto.
                                        <p>El puntaje de corte correspondiente a cada nivel, se determin&oacute;
                                            seg&uacute;n los resultados generales de todos los examinados en Bogot&aacute;,
                                            seg&uacute;n la fecha de presentaci&oacute;n en que presentaste
                                            el examen de Estado.</p>
                                            <%
                                                pericfes = datos.elementAt(5).toString().substring(2, 7);%>

                                        <%String annio = datos.elementAt(5).toString().substring(2, 6);%>
                                        <%String per = datos.elementAt(5).toString().substring(6, 7);%>
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
                                            dos &aacute;reas de inter&eacute;s en nivel b&aacute;sico, siendo una de ellas matemáticas, bien sea por
                                            no cumplir con los requisitos m&iacute;nimos exigidos en las &aacute;reas
                                            de inter&eacute;s (puntajes inferiores a 45 en el Examen de Estado), o por su desempeño en la entrevista de admisión en dado caso de haber sido citado. 
                                        <p>De acuerdo con el resultado obtenido por usted en las &aacute;reas de
                                            inter&eacute;s del Examen de Estado, qued&oacute; clasificado as&iacute;:</p>
                                        <p></p>
                                        <p>
                                            <%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("16") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260") || datos.elementAt(1).equals("264")) {
                                                    out.println("<b>Matemáticas: " + datos.elementAt(6) + "&nbsp;&nbsp; " + clasifica1 + "</b><br>");
                                                    out.println("<b>Física:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + datos.elementAt(8) + " &nbsp;&nbsp;&nbsp;&nbsp;" + clasifica3 + "</b><br>");
                                                    out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + datos.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");

                                                } else if (datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19")) {
                                                    out.println("<b>Matemáticas:&nbsp;&nbsp;" + datos.elementAt(6) + "&nbsp;" + clasifica1 + "</b><br>");
                                                    out.println("<b>Filosofía:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + datos.elementAt(7) + "&nbsp;&nbsp;" + clasifica2 + "</b><br>");
                                                    out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + datos.elementAt(9) + "&nbsp;" + clasifica4 + "</b><br>");
                                                }%>
                                        <p>No obstante lo anterior, le agradecemos que haya escogido a la Escuela
                                            como una opci&oacute;n para adelantar sus estudios de pregrado y esperamos
                                            que haya una pr&oacute;xima oportunidad para contar con usted como miembro
                                            de nuestra comunidad acad&eacute;mica. Si desea mayor informaci&oacute;n
                                            al respecto por favor comun&iacute;quese con la Oficina de Admisiones.
                                        <p></p>
                                        <p><em>Secretar&iacute;a General - Admisiones </em>
                                        <p><i>
                                            </i> </p>
                                    </td>
                                </tr>
                            </table>
                            <%}
                                if (datos.elementAt(2).equals("-80")) {%>
                            <br>

                            <table width="710" border="0" cellspacing="0" cellpadding="0" align="center" class="textoimpremas">
                                <tr>

                                    <td><b>Nombre: <%=datos.elementAt(0)%></b>
                                        <br>
                                        <b>Programa academico: <%=prog%></b>
                                        <p>Su solicitud de admisión est&aacute; en estudio.

                                        <p>Para mayor información por favor comuníquese al 6683600 opción 2 en el menú.

                                    </td>
                                </tr>
                            </table>
                            <%}
                                if (datos.elementAt(2).equals("-65")) {%>

                            <table width="710" border="0" cellspacing="0" cellpadding="0"  align="center" class="textoimpremas">
                                <tr>              
                                    <td height="278" > 
                                        <p><b>Nombre: <%=datos.elementAt(0)%></b> <br>
                                            <b>Programa academico: <%=prog%></b> </p>

                                        <p><i>Apreciado aspirante:</i>

                                            Le comunicamos que usted se encuentra actualmente en lista de espera. Informaremos el resultado final de su proceso el día 22 de noviembre.<br>
                                            <br>

                                        <p></p>
                                        <p><em>Secretar&iacute;a General - Admisiones </em>
                                        <p>



                                        <p><i>Para mayor información por favor comuníquese al 6683600 opción 
                                                2 en el menú.</i> 


                                        <p>&nbsp;
                                        <p>&nbsp;
                                        <p>&nbsp;
                                        <p>&nbsp;
                                        <p>&nbsp; 
                                </tr>
                                <tr>

                                    <td height="2">&nbsp;</td>
                                </tr>

                            </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%
                    }
                }
            }

        }
    }/** else {

        response.sendRedirect("Admitidos");


    }*/
%>
 <%}}%>

<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Respuesta Admitidos inscripciones", e.getMessage());
    }
%>