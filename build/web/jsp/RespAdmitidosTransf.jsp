<%-- 
    Document   : RespAdmitidosTransf
    Created on : 2/07/2015, 02:33:55 PM
    Author     : Lucero
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
        int ban = 0;
        int banB = 0;
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String tipprog = request.getParameter("tipprog");
        String postula = new String();
        String induccion = request.getParameter("induccion");
        String vinculo = "";
        Date hoy = new Date();
        String fechaActual = formatter.format(hoy);
        int l, b = 0, a = 0, s = 0;
        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipprog);%>
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

    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="ASPIRANTES A SEGUNDO SEMESTRE " />
        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-10">
                    <%Vector estudiante = bd.AdmitidosPregrado(docEst, oout, confEci.getPeriodo());

                        if (estudiante.size() <= 0) {%>
                    <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                        <tr>
                            <td>
                                <b>Su documento es incorrecto o usted no ha diligenciado la
                                    solicitud de admisión. Verifique e intente nuevamente o comuníquese al 6683600 opción 2 en el menú.</b>

                            </td>
                        </tr>
                    </table>
                    <% } else {

                        for (int k = 0; k < estudiante.size(); k++) {

                            Vector datos = (Vector) estudiante.elementAt(k);

                            if ((datos.size()) == 0) {%>

                    <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                        <tr>
                            <td>
                                <b>Su documento es incorrecto o usted no ha diligenciado la
                                    solicitud de admisión. Verifique e intente nuevamente o comuníquese al 6683600 opción 2 en el menú.</b>

                            </td>
                        </tr>
                    </table>

                    <%} else if (ban == 1) {
                        /*  if (datos.elementAt(1).equals("262")) {
                         out.println("<center>Por favor consulte su respuesta por el programa de Ingeniería Biomédica</center> ");

                         } else {*/
                        Vector asignaturas = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                        idprog = datos.elementAt(1).toString();
                        Vector reuniones = bd.encuentropadres(oout, idprog);
                        fecha = reuniones.elementAt(1).toString();
                        grupo1 = reuniones.elementAt(2).toString();
                        grupo2 = reuniones.elementAt(3).toString();
                        grupo3 = reuniones.elementAt(4).toString();
                        recibo = reuniones.elementAt(5).toString();

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

                        } else if (datos.elementAt(1).equals("262")) {
                            prog = "INGENIERÍA BIOMEDICA";

                        }

                    %>
                    <% if (datos.elementAt(2).equals("-61")) {
                comparar = (String) datos.elementAt(4);%>
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
                    </table>
                    <table  width="701" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                        <tr>



                            <td height="351"> 
                                <p><b>Estudiante:<br>
                                        <%=datos.elementAt(0)%></b> <br>
                                    <b>Ciudad</b> </p>
                                <p>Estimado(a) </p>
                                <p>EL COMIT&Eacute; DE ADMISIONES de la ESCUELA COLOMBIANA DE INGENIER&Iacute;A 
                                    JULIO GARAVITO reunido el d&iacute;a 17 de junio de 2020, estudi&oacute; 
                                    las solicitudes para el segundo período académico del año 2020 y en su caso particular acord&oacute;: 
                                <p> Aprobar su solicitud de transferencia para ingresar al Programa 
                                    de <%=prog%>.</p>

                                <p> Se analizaron los puntajes obtenidos por usted en el examen 
                                    de estado con el fin de identificar las asignaturas que le corresponden 
                                    en su plan de estudios personalizado del ciclo de nivelaci&oacute;n, 
                                    quedando ubicado en uno de tres niveles en el &aacute;rea correspondiente, 
                                    B&Aacute;SICO, MEDIO o ALTO. En su caso particular, usted qued&oacute; 
                                    clasificado as&iacute;:</p>
                                <p> <p>El puntaje de corte correspondiente a cada nivel, se determin&oacute;
                                    seg&uacute;n los resultados generales de todos los examinados en Bogot&aacute;,
                                    seg&uacute;n la fecha de presentaci&oacute;n en que usted present&oacute;
                                    el examen de Estado.</p></p>

                                <%pericfes = datos.elementAt(5).toString().substring(2, 7);%>
                                <%String annio = datos.elementAt(5).toString().substring(2, 6);%>
                                <%String per = datos.elementAt(5).toString().substring(6, 7);%>
                                <p>Para el a&ntilde;o <%=annio%> per&iacute;odo <%=per%>, en que usted present&oacute; este examen, los puntajes de
                                    corte fueron:</p>
                                <p>&nbsp;</p>
                                <%Vector puntajes = bd.baseicfes(pericfes, oout);%>


                                <p>
                                    <%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("16") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260") || datos.elementAt(1).equals("262")) {%>
                                <table align="center" width="61%" border="0" class="textoimpremas">
                                    <tr>

                                        <td width="18%">&nbsp;</td>

                                        <td width="29%">Nivel B&aacute;sico <br>
                                            Puntajes menores a<br>
                                        </td>

                                        <td width="19%">Nivel Alto<br>
                                            Puntajes mayores a</td>

                                        <td width="16%"><b>Su puntaje Saber 11</b></td>
                                        <td width="18%"> <b>Su clasificaci&oacute;n</b></td>
                                    </tr>
                                    <tr>

                                        <td width="18%">Matem&aacute;ticas</td>

                                        <td width="29%"> 
                                            <div align="center"> <%=puntajes.elementAt(1)%></div>
                                        </td>

                                        <td width="19%"><%=puntajes.elementAt(2)%></td>

                                        <td width="16%"><b><%=datos.elementAt(6)%> </b></td>

                                        <td width="18%"> 
                                            <div align="center"><b><%=clasifica1%> </b></div>
                                        </td>
                                    </tr>

                                    <tr>

                                        <td width="18%">F&iacute;sica</td>

                                        <td width="29%"> 
                                            <div align="center"><%=puntajes.elementAt(7)%></div>
                                        </td>

                                        <td width="19%"><%=puntajes.elementAt(8)%></td>

                                        <td width="16%"><b><%=datos.elementAt(8)%></b></td>

                                        <td width="18%"> 
                                            <div align="center"><b><%=clasifica3%></b></div>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td width="18%">Lenguaje</td>

                                        <td width="29%"> 
                                            <div align="center"><%=puntajes.elementAt(3)%></div>
                                        </td>

                                        <td width="19%"><%=puntajes.elementAt(4)%></td>

                                        <td width="16%"><b><%=datos.elementAt(9)%></b></td>

                                        <td width="18%"> 
                                            <div align="center"><b><%=clasifica4%></b></div>
                                        </td>
                                    </tr>
                                </table>
                                <p><b> </b></p>
                                <% } else if (datos.elementAt(1).equals("18")) {%>

                                <table align="center" width="64%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                                    <tr>

                                        <td width="18%">&nbsp;</td>

                                        <td width="30%">Nivel B&aacute;sico <br>
                                            Puntajes menores a<br>
                                        </td>

                                        <td width="18%">Nivel Alto<br>
                                            Puntajes mayores a</td>

                                        <td width="15%"><b>Su puntaje Saber 11</b></td>
                                        <td width="19%"> <b>Su clasificaci&oacute;n</b></td>
                                    </tr>
                                    <tr>

                                        <td width="18%">Matem&aacute;ticas</td>

                                        <td width="30%"> 
                                            <div align="center"> <%=puntajes.elementAt(1)%></div>
                                        </td>

                                        <td width="18%"><%=puntajes.elementAt(2)%></td>

                                        <td width="15%"><b><%=datos.elementAt(6)%> </b></td>

                                        <td width="19%"> 
                                            <div align="center"><b><%=clasifica1%> </b></div>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td width="18%">Filosof&iacute;a</td>

                                        <td width="30%"> 
                                            <div align="center"><%=puntajes.elementAt(5)%></div>
                                        </td>

                                        <td width="18%"><%=puntajes.elementAt(6)%></td>

                                        <td width="15%"><b><%=datos.elementAt(7)%></b></td>

                                        <td width="19%"> 
                                            <div align="center"><b><%=clasifica2%></b></div>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td width="18%">Lenguaje</td>

                                        <td width="30%"> 
                                            <div align="center"><%=puntajes.elementAt(3)%></div>
                                        </td>

                                        <td width="18%"><%=puntajes.elementAt(4)%></td>

                                        <td width="15%"><b><%=datos.elementAt(9)%></b></td>

                                        <td width="19%"> 
                                            <div align="center"><b><%=clasifica4%></b></div>
                                        </td>
                                    </tr>
                                </table>

                                <%  } else if (datos.elementAt(1).equals("19")) {%>

                                <table align="center" width="62%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                                    <tr>
                                        <td width="19%">&nbsp;</td>

                                        <td width="28%">Nivel B&aacute;sico <br>
                                            Puntajes menores a<br>
                                        </td>

                                        <td width="18%">Nivel Alto<br>
                                            Puntajes mayores a</td>

                                        <td width="17%"><b>Su puntaje Saber 11</b></td>
                                        <td width="18%"> <b>Su clasificaci&oacute;n</b></td>
                                    </tr>
                                    <tr>
                                        <td width="19%">Matem&aacute;ticas</td>

                                        <td width="28%"> 
                                            <div align="center"> <%=puntajes.elementAt(1)%></div>
                                        </td>

                                        <td width="18%"><%=puntajes.elementAt(2)%></td>

                                        <td width="17%"><b><%=datos.elementAt(6)%></b> </td>

                                        <td width="18%"> 
                                            <div align="center"><b><%=clasifica1%> </b></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="19%">Ciencias Sociales</td>

                                        <td width="28%"> 
                                            <div align="center"><%=puntajes.elementAt(11)%></div>
                                        </td>

                                        <td width="18%"><%=puntajes.elementAt(12)%></td>

                                        <td width="17%"><b><%=datos.elementAt(23)%></b></td>

                                        <td width="18%"> 
                                            <div align="center"><b><%=clasifica2%></b></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="19%">Lenguaje</td>

                                        <td width="28%"> 
                                            <div align="center"><%=puntajes.elementAt(3)%></div>
                                        </td>

                                        <td width="18%"><%=puntajes.elementAt(4)%></td>

                                        <td width="17%"><b><%=datos.elementAt(9)%></b></td>

                                        <td width="18%"> 
                                            <div align="center"><b><%=clasifica4%></b></div>
                                        </td>
                                    </tr>
                                </table>

                                <%  }%>

                    </table>
                    <!--ANTES CAMBIADA EL 06 DE JULIO DE 2015-->
                    <!%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("16") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>


                    <!--table align="center" width="20%" border="1" class="textoimpremas">
                        <tr> 
                            <td width="10%">&nbsp;</td>
                            <td width="10%"> Su clasificaci&oacute;n</td>
                        </tr>
                        <tr> 
                            <td width="10%">Matem&aacute;ticas</td>
                            <td width="10%"> 
                                <div align="center"><!%=clasifica1%> </div>
                            </td>
                        </tr>
                        <tr> 
                            <td width="10%">F&iacute;sica</td>
                            <td width="10%"> 
                                <div align="center"><!%=clasifica3%></div>
                            </td>
                        </tr>
                        <tr> 
                            <td width="10%">Lenguaje</td>
                            <td width="10%"> 
                                <div align="center"><!%=clasifica4%></div>
                            </td>
                        </tr>
                    </table-->

                    <p>
                        <!--out.println("<b>Matemáticas: " + estudiante.elementAt(6) + "&nbsp;&nbsp; " + clasifica1 + "</b><br>");
                               out.println("<b>Física: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(8) + " &nbsp;&nbsp;&nbsp;&nbsp;" + clasifica3 + "</b><br>");
                                out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");-->
                        <!% } else if (datos.elementAt(1).equals("18")) {%>
                    </p>

                    <!--table align="center" width="20%" border="1" class="textoimpremas" >
                        <tr> 
                            <td width="10%">&nbsp;</td>
                            <td width="10%"> Su clasificaci&oacute;n</td>
                        </tr>
                        <tr> 
                            <td width="10%">Matem&aacute;ticas</td>
                            <td width="10%"> 
                                <div align="center"><!%=clasifica1%> </div>
                            </td>
                        </tr>
                        <tr> 
                            <td width="10%">Filosof&iacute;a</td>
                            <td width="10%"> 
                                <div align="center"><!%=clasifica2%></div>
                            </td>
                        </tr>
                        <tr> 
                            <td width="10%">Lenguaje</td>
                            <td width="10%"> 
                                <div align="center"><!%=clasifica4%></div>
                            </td>
                        </tr>
                    </table-->

                    <!%  } else if (datos.elementAt(1).equals("19")) {%>

                    <!--table align="center" width="20%" border="1" class="textoimpremas" >
                        <tr> 
                            <td width="10%">&nbsp;</td>
                            <td width="10%"> Su clasificaci&oacute;n</td>
                        </tr>
                        <tr> 
                            <td width="10%">Matem&aacute;ticas</td>
                            <td width="10%"> 
                                <div align="center"><!%=clasifica1%> </div>
                            </td>
                        </tr>
                        <tr> 
                            <td width="10%">Ciencias Sociales</td>
                            <td width="10%"> 
                                <div align="center"><!%=clasifica2%></div>
                            </td>
                        </tr>
                        <tr> 
                            <td width="10%">Lenguaje</td>
                            <td width="10%"> 
                                <div align="center"><!%=clasifica4%></div>
                            </td>
                        </tr>
                    </table-->



                    <!%  }%>
                    <table  width="701" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                        <tr> 
                            <td  colspan="2" height="57"> 
                                <p>Una vez analizada su hoja de vida acad&eacute;mica, se acord&oacute; 
                                    homologar las siguientes asignaturas: </p>
                            </td>
                        <tr>

                            <td height="39"> 
                                <div align="center">
                                    <p><b>Asignatura</b></p>
                                </div>
                            </td>

                            <td height="39"> 
                                <p align="center"><b>Calificación</b></p>
                            </td>
                        </tr>
                        <%Vector homologa = bd.Homologa(datos.elementAt(11).toString());
                            for (int p = 0; p < homologa.size(); p++) {

                                Vector homo = (Vector) homologa.elementAt(p);
                        %>


                        <tr> 

                            <td width="308"><%=homo.elementAt(2)%></td>
                            <td align="center" width="387"><%=homo.elementAt(1)%></td>
                        </tr>
                        <%}%>
                    </table>
                    <br>
                    <table  width="701" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                        <tr> 
                            <td> 
                                <p>El estudio de homologaci&oacute;n de asignaturas se hace 
                                    una sola vez en el transcurso de la carrera y con base en los documentos 
                                    entregados en el momento de su inscripci&oacute;n. 
                                <p></p>
                                <p></p>

                                <p>Las calificaciones que fueron aceptadas, s&oacute;lo entrar&aacute;n 
                                    a formar parte de su promedio al finalizar el Programa de <%=prog%>. 
                                    Las asignaturas que no fueron incluidas en esta comunicaci&oacute;n, 
                                    no se aceptaron por el Comit&eacute;, dado que no se encontr&oacute; 
                                    la equivalencia requerida tanto en contenidos program&aacute;ticos 
                                    como en la calificaci&oacute;n final obtenida por usted en la Universidad 
                                    de origen. </p>
                                <p>Si usted actualmente est&aacute; cursando algunas asignaturas 
                                    cuyo certificado de calificaciones no present&oacute; para esta 
                                    admisi&oacute;n, puede solicitar el estudio de las mismas para su 
                                    convalidaci&oacute;n. Dicha solicitud debe hacerla en la Oficina 
                                    de Admisiones a m&aacute;s tardar el 03 de julio de 2020, anexando 
                                    el correspondiente certificado de calificaciones con intensidad 
                                    horaria y los contenidos tem&aacute;ticos correspondientes. No se 
                                    aceptar&aacute;n solicitudes posteriores.</p>
                                <p>Como requisito de grado y prerrequisito de inscripci&oacute;n 
                                    de electivas human&iacute;sticas usted deber&aacute; presentar el 
                                    examen de clasificaci&oacute;n de ingl&eacute;s, este examen se 
                                    deber&aacute; presentar en las fechas programadas por la Vicerrector&iacute;a 
                                    Acad&eacute;mica al inicio del semestre. </p>
                                <!--p>
                                    Para formalizar la entrega de su respuesta de admisión por transferencia, 
                                    usted se debe presentar a partir del 26 de junio de 2020 desde las 2:00 pm, 
                                    en la Oficina de admisiones y recibir el resultado de su estudio de Homologación 
                                    y hacerle devolución de los contenidos programáticos.
                                </p-->
                                <p>En el momento en que formalice su matr&iacute;cula con la 
                                    firma del acta y entrega de los documentos correspondientes declara 
                                    que conoce y acepta las condiciones aqu&iacute; estipuladas.</p>
                                <p><br>
                                    Le deseamos &eacute;xitos en el desarrollo de sus estudios.</p>
                                <p><br>
                                    Atentamente,</p>
                                <p></p>
                                <p><br>
                                    <b>Ing. Ricardo Alfredo L&oacute;pez Cualla</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Ing. Angela Daniela Prieto Parra</b><br>
                                    Secretario General&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jefe de Admisiones </p>
                                <p></p>
                                <p></p>
                                <p></p>
                                <p></p>
                            </td>
                        </tr>

                        <tr>

                            <td>&nbsp;
                        </tr>
                    </table>                         



                    <%} else if (datos.elementAt(2).equals("-71")) {%>
                    <table  width="701" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">

                        <tr>
                            <td> <p><b><br>Estudiante:<br>
                                        <%=datos.elementAt(0)%></b> <br>
                                    <b>Ciudad</b> </p>
                                <p>Estimado(a): </p>

                                EL COMITÉ DE ADMISIONES de la ESCUELA COLOMBIANA DE INGENIERIA JULIO GARAVITO reunido el día 17 de junio de 2020, estudió las solicitudes para el segundo período académico del año 2020, y en su caso particular y una vez analizada su hoja de vida académica, entrevista, revisar su certificado de 
                                calificaciones y contenidos programáticos; Acordó no aceptar su solicitud de transferencia al programa de <%=prog%>  de la Escuela.
                                <p>
                                    Esperamos que esta decisión no influya en su deseo de superación, por el contrario, le sugerimos que realice un análisis de sus fortalezas para proyectarse otras metas
                                    acordes con sus aptitudes y con su situación personal y familiar actual y pueda así considerar otras opciones que le garanticen el éxito que usted y nosotros deseamos.
                                <p><br>
                                    Atentamente,</p>
                                <p></p>
                                <p><br>
                                    Ing. Ricardo Alfredo L&oacute;pez Cualla&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Ing. Angela Daniela Prieto Parra</b><br>
                                    Secretario General&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Jefe de Admisiones</b> </p>
                                <p></p>
                                <p></p>
                            </td>
                        </tr>

                    </table>
                    <%}%>

                </div>
            </div>
        </div>
    </body>
</html>

<%
                            //}
                        }
                    }
                }
            } else {

                response.sendRedirect("Admitidos");

            }
        }
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Respuesta Admitidos inscripciones", e.getMessage());
    }
%>