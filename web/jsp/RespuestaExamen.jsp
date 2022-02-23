<%-- 
    Document   : RespuestaExamen
    Created on : 8/07/2015, 11:08:51 AM
    Author     : Lucero
--%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% String docEst = request.getParameter("docEst");
    configeci.configuracion confEci = new configeci.configuracion();
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    Vector examen = bd.ExamenConoc(docEst, confEci.getPeriodo(), oout);
    int x = 0;
    char com1, com2, com3, com4, com5, com6, comp1, comp2, comp3, comp4, comp5, comp6;
    String idprog = new String();
    String com11 = "", com22 = "", com33 = "", com44 = "", com55 = "", com66 = "";
    if (examen.size() > 0) {

        String carnet = examen.elementAt(0).toString();
        String nombre = examen.elementAt(1).toString();
        String correo = examen.elementAt(2).toString();

        Vector DatosExamen = bd.Exa_Cono(carnet, confEci.getPeriodo(), oout);
        if (DatosExamen.size() > 0) {
            String nivelexamen = DatosExamen.elementAt(2).toString();

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title> Examen de Conocimiento</title>
        <link href="css/estilo-resultadoconocimiento.css" rel="stylesheet" type="text/css" media="all">
    </head>

    <body>
        <div id="container">
            <header>
                <div class="logoescuela">
                    <img src="img/logo-ESCUELA.svg"/>
                </div>
                <img src="img/banner.jpg"/>
                <div class="osiris">Desarrollado por: Direcci&oacute;n de Tecnolog&iacute;a Osiris y Direcci&oacute;n de Comunicaciones y Mercadeo</div>
            </header>
            <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
            <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
            <link href="css/comun.css" rel="stylesheet" type="text/css">
            </head>
            <body>

                <br>
                <div align="center">Apreciado(a): <%=nombre%> </div>
                <p><br>
                    <%     if (nivelexamen.equals("No disponible") || (nivelexamen.equals("0"))) {

                            String prog = new String();

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
                            String clasifica6 = new String();%>

                <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                    <tr>
                        <td>

                            <p>&nbsp;</p>
                            <p>De acuerdo con la información enviada en el documento de admisión y teniendo 
                                en cuenta sus resultados en la prueba SABER 11 así como el plan de estudios 
                                de su programa de formación, usted fue clasificado en los siguientes niveles: 
                            </p>
                            <p>&nbsp; </p>
                        </td>
                    <P>
                        </tr>
                        <%Vector estudiante = bd.AdmitidosPregradoOtros(docEst, oout, confEci.getPeriodo());

                            if (estudiante.size() <= 0) {%>

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

                <%} else {
                    Vector asignaturas = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                    Vector asignaturasBio = bd.NivelesBio(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                    //  Vector asignaturasBio = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
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
                    } else if (datos.elementAt(1).equals("15")) {
                        prog = "INGENIERÍA DE SISTEMAS";
                    } else if (datos.elementAt(1).equals("16")) {
                        prog = "INGENIERÍA INDUSTRIAL";
                    } else if (datos.elementAt(1).equals("17")) {

                        prog = "INGENIERÍA ELECTRÓNICA";
                    } else if (datos.elementAt(1).equals("18")) {
                        prog = "ECONOMÍA";

                    } else if (datos.elementAt(1).equals("19")) {
                        prog = "ADMINISTRACIÓN DE EMPRESAS";
                    } else if (datos.elementAt(1).equals("20")) {
                        prog = "MATEMÁTICAS";

                    } else if (datos.elementAt(1).equals("260")) {
                        prog = "INGENIERÍA MECÁNICA";

                    } else if (datos.elementAt(1).equals("262")) {
                        prog = "INGENIERÍA BIOMEDICA";

                    }%>
                <%comparar = (String) datos.elementAt(4);%>
                <% com1 = comparar.charAt(0);
                    com11 = Character.toString(com1);
                    com2 = comparar.charAt(1);
                    com22 = Character.toString(com2);
                    com3 = comparar.charAt(2);
                    com33 = Character.toString(com3);
                    com4 = comparar.charAt(3);
                    com44 = Character.toString(com4);
                    com5 = comparar.charAt(4);
                    com55 = Character.toString(com5);
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
                <%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15")  || datos.elementAt(1).equals("17")) {%>
                <div align="center">
                    <table align="center" width="36%" border="0" class="textoimpremas">
                        <tr> 
                            <td width="19%">&nbsp;</td>
                            <td width="20%"> Su clasificaci&oacute;n</td>
                        </tr>
                        <tr> 
                            <td width="19%">Matem&aacute;ticas</td>
                            <td width="20%"> <%=clasifica1%></td>
                        </tr>
                        <tr> 
                            <td width="19%">F&iacute;sica</td>
                            <td width="20%"> 
                                <div align="left"></div>
                                <%=clasifica3%></td>
                        </tr>
                        <tr> 
                            <td width="19%">Lenguaje</td>
                            <td width="20%"> 
                                <div align="left"></div>
                                <%=clasifica4%></td>
                        </tr>
                    </table>
                    <% } else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                    <div align="center">
                        <table align="center" width="36%" border="0" class="textoimpremas">
                            <tr> 
                                <td width="19%">&nbsp;</td>
                                <td width="20%"> Su clasificaci&oacute;n</td>
                            </tr>
                            <tr> 
                                <td width="19%">Matem&aacute;ticas</td>
                                <td width="20%"> <%=clasifica1%></td>
                            </tr>
                            <tr> 
                                <td width="19%">F&iacute;sica</td>
                                <td width="20%"> 
                                    <div align="left"></div>
                                    <%=clasifica3%></td>
                            </tr>
                            <tr> 
                                <td width="19%">Lenguaje</td>
                                <td width="20%"> 
                                    <div align="left"></div>
                                    <%=clasifica4%></td>
                            </tr>

                            <tr> 
                                <td width="19%">Química</td>
                                <td width="20%"> 
                                    <div align="left"></div>
                                    <%=clasifica5%></td>
                            </tr>
                        </table>

                        <%} else if (datos.elementAt(1).equals("18")) {%>
                    </div>
                    <table align="center" width="36%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                        <tr>
                            <td width="19%">&nbsp;</td>

                            <td width="19%"> Su clasificaci&oacute;n</td>
                        </tr>
                        <tr>
                            <td width="19%">Matem&aacute;ticas</td>


                            <td width="19%"> <%=clasifica1%> 
                                <div align="left"></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="19%">Filosof&iacute;a</td>


                            <td width="19%"> 
                                <div align="left"></div>
                                <%=clasifica2%></td>
                        </tr>
                        <tr>
                            <td width="19%">Lenguaje</td>


                            <td width="19%"> 
                                <div align="left"></div>
                                <%=clasifica4%></td>
                        </tr>
                    </table>
                    <!--  out.println("<b>Matemáticas:&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(6) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica1 + "</b><br>");
            out.println("<b>Filosofía:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(7) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica2 + "</b><br>");
            out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");-->
                    <%  } else if (datos.elementAt(1).equals("19")) {%>

                    <table align="center" width="36%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                        <tr>
                            <td width="19%">&nbsp;</td>

                            <td width="19%"> Su clasificaci&oacute;n</td>
                        </tr>
                        <tr>
                            <td width="19%">Matem&aacute;ticas</td>

                            <td width="19%"> <%=clasifica1%></td>
                        </tr>
                        <tr>
                            <td width="19%">Ciencias Sociales</td>


                            <td width="19%"> 
                                <div align="left"></div>
                                <%=clasifica2%></td>
                        </tr>
                        <tr>
                            <td width="19%">Lenguaje</td>


                            <td width="19%"> 
                                <div align="left"></div>
                                <%=clasifica4%></td>
                        </tr>
                    </table>


                    <%} else if (datos.elementAt(1).equals("262")) {
                        com6 = comparar.charAt(5);
                        if (com6 == 'B') {
                            clasifica6 = "Básico";
                        }

                        if (com6 == 'M') {
                            clasifica6 = "Medio";
                        }

                        if (com6 == 'A') {
                            clasifica6 = "Alto";
                        }
                    %>
                    <table align="center" width="36%" border="0" class="textoimpremas">
                        <tr>
                            <td width="19%">&nbsp;</td>

                            <td width="20%"> Su clasificaci&oacute;n</td>
                        </tr>
                        <tr>
                            <td width="19%">Matem&aacute;ticas</td>


                            <td width="20%"> <%=clasifica1%></td>
                        </tr>
                        <tr>
                            <td width="19%">F&iacute;sica</td>


                            <td width="20%"> 
                                <div align="left"></div>
                                <%=clasifica3%></td>
                        </tr>
                        <tr>
                            <td width="19%">Lenguaje</td>

                            <td width="20%"> 
                                <div align="left"></div>
                                <%=clasifica4%></td>
                        </tr>
                        <tr>
                            <td width="19%">Química</td>

                            <td width="20%">
                                <div align="left"></div><%=clasifica5%>

                            </td>
                        </tr>
                        <tr>
                            <td width="17%">Biología</td>

                            <td width="20%">
                                <div align="left"></div><%=clasifica6%>
                            </td>
                        </tr>

                    </table>

                    <%}%>

                    ******************************
                    <div align="center">
                        <table width="36%" border="0" align="center" class="textoimpremas">
                            <% if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17")) {%>
                            <tr> 
                                <td >
                                    <p>&nbsp;</p>
                                    <p><b>Asignaturas a cursar:</b> </p>
                                    <p><br>
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
                                    </p>
                                </td>
                            </tr>
                            &nbsp; 
                            <%} else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                            <tr> 
                                <td colspan="2"> 
                                    <p>&nbsp;</p>
                                    <p><b>Asignaturas a cursar:</b> </p>
                                    <p><br>
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
                                    </p>
                                </td>
                            </tr>
                            <%} else if (datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19")) {%>
                            <tr> 
                                <td> 
                                    <p>&nbsp;</p>
                                    <p><b>Asignaturas a cursar:</b> </p>
                                    <p><br>
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
                                    </p>
                                </td>
                            </tr>
                            <% } else if (datos.elementAt(1).equals("262")) {
                            com6 = comparar.charAt(5);%>
                            <tr>
                                <td colspan="2"> 
                                    <p>&nbsp;</p>
                                    <p><b>Asignaturas a cursar:</b> </p><br>
                                    <p>
                                        <%  for (int t = 0; t < asignaturasBio.size(); t++) {
                                                String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4) + String.valueOf(com5) + String.valueOf(com6);
                                                Vector nivelasigna = (Vector) asignaturasBio.elementAt(t);
                                                String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2) + String.valueOf(nivelasigna.elementAt(3)) + String.valueOf(nivelasigna.elementAt(4)));
                                                if (niveles.equals(baseicfes)) {
                                                    Vector nomasigna = bd.nomasignaturasBio(nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(17).toString(), nivelasigna.elementAt(18).toString(), nivelasigna.elementAt(19).toString(), oout);%>
                                        <%  for (int p = 0; p < nomasigna.size(); p++) {
                                            out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
                                        <br>
                                        <%}
                                                }
                                            }%>
                                </td>
                            </tr>
                            <%}%>
                        </table>

                        *****************
                        <%                }
                                }
                            }%>
                        <br>
                        <b><center>Usted no presentó el examen de conocimiento</center></b>
                                <%} else {

                                    String prog = new String();
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
                                    String clasifica6 = new String();%>
                        <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                            <tr>
                                <td>

                                    <p>&nbsp;</p>
                                    <p>De acuerdo con la información enviada en el documento de admisión y teniendo 
                                        en cuenta sus resultados en la prueba SABER 11 así como el plan de estudios 
                                        de su programa de formación, usted fue clasificado en los siguientes niveles: 
                                    </p>
                                    <p>&nbsp; </p>
                                </td>
                            <P>
                                </tr>
                                <%Vector estudiante = bd.AdmitidosPregradoOtros(docEst, oout, confEci.getPeriodo());

                                    if (estudiante.size() <= 0) {%>

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

                        <%} else {
                            //BASPREINSNUEVOS
                            Vector asignaturas = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                            Vector asignaturasBio = bd.NivelesBio(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                            //  Vector asignaturasBio = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
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
                            } else if (datos.elementAt(1).equals("15")) {
                                prog = "INGENIERÍA DE SISTEMAS";
                            } else if (datos.elementAt(1).equals("16")) {
                                prog = "INGENIERÍA INDUSTRIAL";
                            } else if (datos.elementAt(1).equals("17")) {

                                prog = "INGENIERÍA ELECTRÓNICA";
                            } else if (datos.elementAt(1).equals("18")) {
                                prog = "ECONOMÍA";

                            } else if (datos.elementAt(1).equals("19")) {
                                prog = "ADMINISTRACIÓN DE EMPRESAS";
                            } else if (datos.elementAt(1).equals("20")) {
                                prog = "MATEMÁTICAS";

                            } else if (datos.elementAt(1).equals("260")) {
                                prog = "INGENIERÍA MECÁNICA";

                            } else if (datos.elementAt(1).equals("262")) {
                                prog = "INGENIERÍA BIOMEDICA";

                            }%>
                        <!--comparar= clasificacion icfes o nivel icfes-->
                        <%comparar = (String) datos.elementAt(4);%>
                        <%com1 = comparar.charAt(0);
                            com2 = comparar.charAt(1);
                            com3 = comparar.charAt(2);
                            com4 = comparar.charAt(3);
                            com5 = comparar.charAt(4);
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
                        <%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("16") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                        <div align="center">
                            <table align="center" width="36%" border="0" class="textoimpremas">
                                <tr> 
                                    <td width="19%">&nbsp;</td>
                                    <td width="20%"> Su clasificaci&oacute;n</td>
                                </tr>
                                <tr> 
                                    <td width="19%">Matem&aacute;ticas</td>
                                    <td width="20%"> <%=clasifica1%></td>
                                </tr>
                                <tr> 
                                    <td width="19%">F&iacute;sica</td>
                                    <td width="20%"> 
                                        <div align="left"></div>
                                        <%=clasifica3%></td>
                                </tr>
                                <tr> 
                                    <td width="19%">Lenguaje</td>
                                    <td width="20%"> 
                                        <div align="left"></div>
                                        <%=clasifica4%></td>
                                </tr>
                            </table>
                            <% }
                            if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                            <table>
                                <tr> 
                                    <td width="19%">Química</td>
                                    <td width="20%"> <%=clasifica5%></td>
                                </tr>
                            </table>
                            <%} else if (datos.elementAt(1).equals("18")) {%>
                        </div>
                        <table align="center" width="36%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                            <tr>
                                <td width="19%">&nbsp;</td>

                                <td width="19%"> Su clasificaci&oacute;n</td>
                            </tr>
                            <tr>
                                <td width="19%">Matem&aacute;ticas</td>


                                <td width="19%"> <%=clasifica1%> 
                                    <div align="left"></div>
                                </td>
                            </tr>
                            <tr>
                                <td width="19%">Filosof&iacute;a</td>


                                <td width="19%"> 
                                    <div align="left"></div>
                                    <%=clasifica2%></td>
                            </tr>
                            <tr>
                                <td width="19%">Lenguaje</td>


                                <td width="19%"> 
                                    <div align="left"></div>
                                    <%=clasifica4%></td>
                            </tr>
                        </table>
                        <!--  out.println("<b>Matemáticas:&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(6) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica1 + "</b><br>");
                out.println("<b>Filosofía:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(7) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica2 + "</b><br>");
                out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");-->
                        <%  } else if (datos.elementAt(1).equals("19")) {%>

                        <table align="center" width="36%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                            <tr>
                                <td width="19%">&nbsp;</td>

                                <td width="19%"> Su clasificaci&oacute;n</td>
                            </tr>
                            <tr>
                                <td width="19%">Matem&aacute;ticas</td>

                                <td width="19%"> <%=clasifica1%></td>
                            </tr>
                            <tr>
                                <td width="19%">Ciencias Sociales</td>


                                <td width="19%"> 
                                    <div align="left"></div>
                                    <%=clasifica2%></td>
                            </tr>
                            <tr>
                                <td width="19%">Lenguaje</td>


                                <td width="19%"> 
                                    <div align="left"></div>
                                    <%=clasifica4%></td>
                            </tr>
                        </table>


                        <%} else if (datos.elementAt(1).equals("262")) {
                            com6 = comparar.charAt(5);
                            if (com6 == 'B') {
                                clasifica6 = "Básico";
                            }

                            if (com6 == 'M') {
                                clasifica6 = "Medio";
                            }

                            if (com6 == 'A') {
                                clasifica6 = "Alto";
                            }
                        %>
                        <table align="center" width="36%" border="0" class="textoimpremas">
                            <tr>
                                <td width="19%">&nbsp;</td>

                                <td width="20%"> Su clasificaci&oacute;n</td>
                            </tr>
                            <tr>
                                <td width="19%">Matem&aacute;ticas</td>


                                <td width="20%"> <%=clasifica1%></td>
                            </tr>
                            <tr>
                                <td width="19%">F&iacute;sica</td>


                                <td width="20%"> 
                                    <div align="left"></div>
                                    <%=clasifica3%></td>
                            </tr>
                            <tr>
                                <td width="19%">Lenguaje</td>

                                <td width="20%"> 
                                    <div align="left"></div>
                                    <%=clasifica4%></td>
                            </tr>
                            <tr>
                                <td width="19%">Química</td>

                                <td width="20%">
                                    <div align="left"></div><%=clasifica5%>

                                </td>
                            </tr>
                            <tr>
                                <td width="17%">Biología</td>

                                <td width="20%">
                                    <div align="left"></div><%=clasifica6%>
                                </td>
                            </tr>

                        </table>

                        <%}%>


                        <div align="center">
                            <table width="36%" border="0" align="center" class="textoimpremas">
                                <% if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17")) {%>
                                <tr> 
                                    <td >
                                        <p>&nbsp;</p>
                                        <p><b>Asignaturas a cursar:</b> </p>
                                        <p><br>
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
                                        </p>
                                    </td>
                                </tr>
                                &nbsp; 
                                <%} else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                                <tr> 
                                    <td colspan="2"> 
                                        <p>&nbsp;</p>
                                        <p><b>Asignaturas a cursar:</b> </p>
                                        <p><br>
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
                                        </p>
                                    </td>
                                </tr>
                                <%} else if (datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19")) {%>
                                <tr> 
                                    <td> 
                                        <p>&nbsp;</p>
                                        <p><b>Asignaturas a cursar:</b> </p>
                                        <p><br>
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
                                        </p>
                                    </td>
                                </tr>
                                <% } else if (datos.elementAt(1).equals("262")) {
                                com6 = comparar.charAt(5);%>
                                <tr>
                                    <td colspan="2"> 
                                        <p>&nbsp;</p>
                                        <p><b>Asignaturas a cursar:</b> </p><br>
                                        <p>
                                            <%  for (int t = 0; t < asignaturasBio.size(); t++) {
                                                    String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4) + String.valueOf(com5) + String.valueOf(com6);
                                                    Vector nivelasigna = (Vector) asignaturasBio.elementAt(t);
                                                    String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2) + String.valueOf(nivelasigna.elementAt(3)) + String.valueOf(nivelasigna.elementAt(4)));
                                                    if (niveles.equals(baseicfes)) {
                                                        Vector nomasigna = bd.nomasignaturasBio(nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(17).toString(), nivelasigna.elementAt(18).toString(), nivelasigna.elementAt(19).toString(), oout);%>
                                            <%  for (int p = 0; p < nomasigna.size(); p++) {
                                                out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
                                            <br>
                                            <%}
                                                    }
                                                }%>
                                    </td>
                                </tr>
                                <%}%>
                            </table>
                            <%                }
                                    }
                                }%>
                        </div>
                        <p><br>
                        </p>

                        <% if (estudiante.size() <= 0) {%>
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
                        <%} else {
                            //VALIDACIONES PARA NIVELES OBTENIDOS EN EL EXAMEN DE CONOCIMIENTO
                            //CAMBIOS PARA EL 2016-1 

                            //  Vector asignaturas = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                            //  Vector asignaturasBio = bd.NivelesBio(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                            idprog = datos.elementAt(1).toString();
                            Vector reuniones = bd.encuentropadres(oout, idprog);
                            fecha = reuniones.elementAt(1).toString();
                            // grupo1 = reuniones.elementAt(2).toString();
                            // grupo2 = reuniones.elementAt(3).toString();
                            // grupo3 = reuniones.elementAt(4).toString();
                            //  recibo = reuniones.elementAt(5).toString();

                            int respuesta = bd.logconsultaadmitidos(datos.elementAt(11).toString(), datos.elementAt(2).toString(), oout);
                            if (datos.elementAt(1).equals("13")) {
                                prog = "INGENIERÍA CIVIL";
                            } else if (datos.elementAt(1).equals("14")) {
                                prog = "INGENIERÍA ELÉCTRICA";
                            } else if (datos.elementAt(1).equals("15")) {
                                prog = "INGENIERÍA DE SISTEMAS";
                            } else if (datos.elementAt(1).equals("16")) {
                                prog = "INGENIERÍA INDUSTRIAL";
                            } else if (datos.elementAt(1).equals("17")) {
                                prog = "INGENIERÍA ELECTRÓNICA";
                            } else if (datos.elementAt(1).equals("18")) {
                                prog = "ECONOMÍA";

                            } else if (datos.elementAt(1).equals("19")) {
                                prog = "ADMINISTRACIÓN DE EMPRESAS";
                            } else if (datos.elementAt(1).equals("20")) {
                                prog = "MATEMÁTICAS";

                            } else if (datos.elementAt(1).equals("260")) {
                                prog = "INGENIERÍA MECÁNICA";

                            }%>
                        <!--NIVEL OBTENIDO EN EL EXAMEN DE CONOCIMIENTO-->
                        <%comparar = nivelexamen;%>
                        <%comp1 = comparar.charAt(0);
                            String co1 = Character.toString(comp1);
                            comp2 = comparar.charAt(1);
                            comp3 = comparar.charAt(2);
                            String co3 = Character.toString(comp3);
                            comp4 = comparar.charAt(3);
                            comp5 = comparar.charAt(4);
                            String co5 = Character.toString(comp5);
                            if (co3.equals(com33)) {%>
                        CAMBIO FISICA

                        <%}

                            Vector asigna_exaM = bd.Asignaturas_exaMat(idprog, co1);
                            Vector asigna_exaF = bd.Asignaturas_exaFis(idprog, co3);
                        Vector asigna_exaQ = bd.Asignaturas_exaQuim(idprog, co5);%>



                        <% if (comp1 == 'B') {
                                clasifica1 = "Básico";
                            }

                            if (comp1 == 'M') {
                                clasifica1 = "Medio";
                            }

                            if (comp1 == 'A') {
                                clasifica1 = "Alto";
                            }
                        %>

                        <% if (comp2 == 'B') {
                                clasifica2 = "Básico";
                            }

                            if (comp2 == 'M') {
                                clasifica2 = "Medio";
                            }

                            if (comp2 == 'A') {
                                clasifica2 = "Alto";
                            }
                        %>

                        <% if (comp3 == 'B') {
                                clasifica3 = "Básico";
                            }

                            if (comp3 == 'M') {
                                clasifica3 = "Medio";
                            }

                            if (comp3 == 'A') {
                                clasifica3 = "Alto";
                            }
                        %>

                        <% if (comp4 == 'B') {
                                clasifica4 = "Básico";
                            }

                            if (comp4 == 'M') {
                                clasifica4 = "Medio";
                            }

                            if (comp4 == 'A') {
                                clasifica4 = "Alto";
                            }
                        %>

                        <% if (comp5 == 'B') {
                                clasifica5 = "Básico";
                            }

                            if (comp5 == 'M') {
                                clasifica5 = "Medio";
                            }

                            if (comp5 == 'A') {
                                clasifica5 = "Alto";
                            }
                        %>


                        -------------------------------

                        <%  if (datos.elementAt(1).equals("18")) {%>

                        <table align="center" width="37%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                            <tr>
                                <td width="19%">&nbsp;</td>

                                <td width="19%"> Su clasificaci&oacute;n</td>
                            </tr>
                            <tr>
                                <td width="19%">Matem&aacute;ticas</td>


                                <td width="19%"> <%=clasifica1%></td>
                            </tr>
                            <tr>
                                <td width="19%">Filosof&iacute;a</td>


                                <td width="19%"> 
                                    <div align="left"></div>
                                    <%=clasifica2%></td>
                            </tr>
                            <tr>
                                <td width="19%">Lenguaje</td>


                                <td width="19%"> 
                                    <div align="left"></div>
                                    <%=clasifica4%></td>
                            </tr>
                        </table>
                        <!--  out.println("<b>Matemáticas:&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(6) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica1 + "</b><br>");
                out.println("<b>Filosofía:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(7) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica2 + "</b><br>");
                out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");-->
                        <%  } else if (datos.elementAt(1).equals("19")) {%>

                        <table align="center" width="37%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                            <tr>
                                <td width="19%">&nbsp;</td>

                                <td width="19%"> Su clasificaci&oacute;n</td>
                            </tr>
                            <tr>
                                <td width="19%">Matem&aacute;ticas</td>

                                <td width="19%"> <%=clasifica1%></td>
                            </tr>
                            <tr>
                                <td width="19%">Ciencias Sociales</td>


                                <td width="19%"> 
                                    <div align="left"></div>
                                    <%=clasifica2%></td>
                            </tr>
                            <tr>
                                <td width="19%">Lenguaje</td>


                                <td width="19%"> 
                                    <div align="left"></div>
                                    <%=clasifica4%></td>
                            </tr>
                        </table>

                        <% }%>

                        <p>&nbsp;</p>
                        <div align="center">
                            <table width="36%" border="0" align="center" class="textoimpremas">
                                <% if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17")) {%>
                                <tr>
                                    <td >

                                        <p><br>

                                        <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                                            <tr>
                                                <td>

                                                    <p>Teniendo en cuenta sus resultados en el examen SABER 11 y en la prueba 
                                                        de conocimientos efectuada el 25 de Diciembre de 2015, la Escuela se permite 
                                                        recomendarle cursar las siguientes asignaturas</p>
                                                    <p>&nbsp; </p>
                                                </td>
                                            </tr>
                                        </table>
                                        <p>&nbsp;</p>
                                        <table align="center" width="37%" border="0" class="textoimpremas">
                                            <tr>
                                                <td width="19%">&nbsp;</td>

                                                <td width="20%"> Su clasificaci&oacute;n</td>
                                            </tr>
                                            <tr>
                                                <td width="19%">Matem&aacute;ticas</td>


                                                <td width="20%"> <%=clasifica1%></td>
                                            </tr>
                                            <tr>
                                                <td width="19%">F&iacute;sica</td>


                                                <td width="20%"> 
                                                    <div align="left"></div>
                                                    <%=clasifica3%></td>
                                            </tr>
                                            <tr>
                                                <td width="19%">Lenguaje</td>

                                                <td width="20%"> 
                                                    <div align="left"></div>
                                                    <%=clasifica4%></td>
                                            </tr>
                                        </table>


                                    </td>
                                </tr>
                                &nbsp;
                                <%} else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                                <tr>
                                    <td colspan="2"> 

                                        <p><br>

                                        <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                                            <tr>
                                                <td>

                                                    <p>Teniendo en cuenta sus resultados en el examen SABER 11 y en la prueba 
                                                        de conocimientos efectuada el 27 de julio de 2015, la Escuela se permite 
                                                        recomendarle cursar las siguientes asignaturas</p>
                                                    <p>&nbsp; </p>
                                                </td>
                                            </tr>
                                        </table>
                                        <table align="center" width="60%" border="0" class="textoimpremas">
                                            <tr>
                                                <td width="19%">&nbsp;</td>

                                                <td width="20%"> Su clasificaci&oacute;n</td>
                                            </tr>
                                            <tr>
                                                <td width="19%">Matem&aacute;ticas</td>
                                                <td width="20%"> <%=clasifica1%></td>
                                            </tr>
                                            <tr>
                                                <td width="19%">F&iacute;sica</td>


                                                <td width="20%"> 
                                                    <div align="left"></div>
                                                    <%=clasifica3%></td>
                                            </tr>
                                            <tr>
                                                <td width="19%">Lenguaje</td>

                                                <td width="20%"> 
                                                    <div align="left"></div>
                                                    <%=clasifica4%></td>
                                            </tr>

                                            <tr>
                                                <td width="19%">Química</td>

                                                <td width="20%"> 
                                                    <div align="left"></div>
                                                    <%=clasifica5%></td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <p>&nbsp;</p>

                                                    </p>
                                                </td>
                                            </tr>
                                            <%} else if (datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19")) {%>
                                            <tr>
                                                <td> 
                                                    <p><b>Asignaturas a cursar:</b> </p>
                                                    <p><br>

                                                    <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                                                        <tr>
                                                            <td>

                                                                <p>Teniendo en cuenta sus resultados en el examen SABER 11 y en la prueba 
                                                                    de conocimientos efectuada el 27 de julio de 2015, la Escuela se permite 
                                                                    recomendarle cursar las siguientes asignaturas</p>
                                                                <p>&nbsp; </p>
                                                            </td>
                                                        </tr>
                                                    </table>



                                                    </p>
                                                </td>
                                            </tr>
                                            <% } else if (datos.elementAt(1).equals("262")) {
                                                comp6 = comparar.charAt(5);
                                                if (comp6 == 'B') {
                                                    clasifica6 = "Básico";
                                                }

                                                if (comp6 == 'M') {
                                                    clasifica6 = "Medio";
                                                }

                                                if (comp6 == 'A') {
                                                    clasifica6 = "Alto";
                                                }%>

                                            <p>

                                            <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                                                <tr>
                                                    <td>

                                                        <p>Teniendo en cuenta sus resultados en el examen SABER 11 y en la prueba 
                                                            de conocimientos efectuada el 27 de julio de 2015, la Escuela se permite 
                                                            recomendarle cursar las siguientes asignaturas</p>
                                                        <p>&nbsp; </p>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table align="center" width="36%" border="0" class="textoimpremas">
                                                <tr>
                                                    <td width="19%">&nbsp;</td>

                                                    <td width="20%"> Su clasificaci&oacute;n</td>
                                                </tr>
                                                <tr>
                                                    <td width="19%">Matem&aacute;ticas</td>


                                                    <td width="20%"> <%=clasifica1%></td>
                                                </tr>
                                                <tr>
                                                    <td width="19%">F&iacute;sica</td>


                                                    <td width="20%"> 
                                                        <div align="left"></div>
                                                        <%=clasifica3%></td>
                                                </tr>
                                                <tr>
                                                    <td width="19%">Lenguaje</td>

                                                    <td width="20%"> 
                                                        <div align="left"></div>
                                                        <%=clasifica4%></td>
                                                </tr>
                                                <tr>
                                                    <td width="19%">Química</td>

                                                    <td width="20%">
                                                        <div align="left"></div><%=clasifica5%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="17%">Biología</td>

                                                    <td width="20%">
                                                        <div align="left"></div><%=clasifica6%>
                                                    </td>
                                                </tr>


                                                <p>&nbsp;</p>
                                                <tr>
                                                <p>&nbsp;</p>
                                                <td>  <p>&nbsp;</p>

                                                </td>


                                                </tr>
                                                <%}%>
                                            </table>
                                            </div>
                                            <p>&nbsp;</p>
                                            <table align="center" width="710" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                                                <tr>
                                                    <td>
                                                        <%if (x == 0) {%>
                                                        <p><b><font size="3">Para conocer las recomendaciones del Exámen de Conocimientos la Vicerectoría Académica se contactará con usted al correo: <%=correo%>. Por favor estar pendiente.</font></b></p><br>
                                                                <%}%>
                                                    </td></tr><tr>
                                                    <td> 
                                                        <p>Como se le inform&oacute; en la comunicaci&oacute;n de admisi&oacute;n, 
                                                            esta recomendaci&oacute;n no tiene car&aacute;cter obligatorio. Se sugiere 
                                                            analizar con su acudiente la situaci&oacute;n y en caso de aceptar la 
                                                            recomendaci&oacute;n, enviar <a href="http://tycho.escuelaing.edu.co/contenido/documentos/PRUEBADECONOCIMIENTO.docx"> 
                                                                diligenciado el formato adjunto</a> antes del 29 de julio a las 
                                                            3:00 p.m. a su respectiva decanatura. Se le recuerda que la firma del 
                                                            acudiente en este documento es indispensable para poder hacer el cambio 
                                                            de asignaturas. Si su acudiente est&aacute; fuera de la ciudad, deber&aacute; 
                                                            enviar el formato con la firma escaneada, a su respectiva decanatura, 
                                                            con el compromiso de entregar en f&iacute;sico el documento a m&aacute;s 
                                                            tardar el martes 4 de agosto. </p>
                                                    </td>
                                                </tr>
                                            </table>
                                            <p></p>
                                            <%                }
                                                        }
                                                    }
                                                }
                                            } else {%>
                                            <html>
                                                <head>
                                                    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
                                                    <title> Exámen de Conocimiento</title>
                                                    <link href="css/estilo-resultadoconocimiento.css" rel="stylesheet" type="text/css" media="all">
                                                </head>

                                                <body>
                                                    <div id="container">
                                                        <header>
                                                            <div class="logoescuela">
                                                                <img src="img/logo-ESCUELA.svg"/>
                                                            </div>
                                                            <img src="img/banner.jpg"/>
                                                            <div class="osiris">Desarrollado por: Direcci&oacute;n de Tecnolog&iacute;a Osiris y Direcci&oacute;n de Comunicaciones y Mercadeo</div>
                                                        </header>
                                                        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
                                                        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
                                                        <link href="css/comun.css" rel="stylesheet" type="text/css">
                                                        </head>
                                                        <p>

                                                            <%  String prog = new String();

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
                                                                String clasifica6 = new String();%>

                                                        <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                                                            <tr>
                                                                <td>

                                                                    <p>&nbsp;</p>
                                                                    <p>De acuerdo con la información enviada en el documento de admisión y teniendo 
                                                                        en cuenta sus resultados en la prueba SABER 11 así como el plan de estudios 
                                                                        de su programa de formación, usted fue clasificado en los siguientes niveles: 
                                                                    </p>
                                                                    <p>&nbsp; </p>
                                                                </td>
                                                            <P>
                                                                </tr>
                                                                <%Vector estudiante = bd.AdmitidosPregradoOtros(docEst, oout, confEci.getPeriodo());

                                                                    if (estudiante.size() <= 0) {%>

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

                                                        <%} else {
                                                            Vector asignaturas = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                                                            Vector asignaturasBio = bd.NivelesBio(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                                                            //  Vector asignaturasBio = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
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
                                                            } else if (datos.elementAt(1).equals("15")) {
                                                                prog = "INGENIERÍA DE SISTEMAS";
                                                            } else if (datos.elementAt(1).equals("16")) {
                                                                prog = "INGENIERÍA INDUSTRIAL";
                                                            } else if (datos.elementAt(1).equals("17")) {

                                                                prog = "INGENIERÍA ELECTRÓNICA";
                                                            } else if (datos.elementAt(1).equals("18")) {
                                                                prog = "ECONOMÍA";

                                                            } else if (datos.elementAt(1).equals("19")) {
                                                                prog = "ADMINISTRACIÓN DE EMPRESAS";
                                                            } else if (datos.elementAt(1).equals("20")) {
                                                                prog = "MATEMÁTICAS";

                                                            } else if (datos.elementAt(1).equals("260")) {
                                                                prog = "INGENIERÍA MECÁNICA";

                                                            } else if (datos.elementAt(1).equals("262")) {
                                                                prog = "INGENIERÍA BIOMEDICA";

                                                            }%>
                                                        <%comparar = (String) datos.elementAt(4);%>
                                                        <% com1 = comparar.charAt(0);
                                                            com2 = comparar.charAt(1);
                                                            com3 = comparar.charAt(2);
                                                            com4 = comparar.charAt(3);
                                                            com5 = comparar.charAt(4);
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
                                                        <%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("16") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                                                        <div align="center">
                                                            <table align="center" width="36%" border="0" class="textoimpremas">
                                                                <tr> 
                                                                    <td width="19%">&nbsp;</td>
                                                                    <td width="20%"> Su clasificaci&oacute;n</td>
                                                                </tr>
                                                                <tr> 
                                                                    <td width="19%">Matem&aacute;ticas</td>
                                                                    <td width="20%"> <%=clasifica1%></td>
                                                                </tr>
                                                                <tr> 
                                                                    <td width="19%">F&iacute;sica</td>
                                                                    <td width="20%"> 
                                                                        <div align="left"></div>
                                                                        <%=clasifica3%></td>
                                                                </tr>
                                                                <tr> 
                                                                    <td width="19%">Lenguaje</td>
                                                                    <td width="20%"> 
                                                                        <div align="left"></div>
                                                                        <%=clasifica4%></td>
                                                                </tr>
                                                            </table>
                                                            <% } else if (datos.elementAt(1).equals("18")) {%>
                                                        </div>
                                                        <table align="center" width="36%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                                                            <tr>
                                                                <td width="19%">&nbsp;</td>

                                                                <td width="19%"> Su clasificaci&oacute;n</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="19%">Matem&aacute;ticas</td>


                                                                <td width="19%"> <%=clasifica1%> 
                                                                    <div align="left"></div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="19%">Filosof&iacute;a</td>


                                                                <td width="19%"> 
                                                                    <div align="left"></div>
                                                                    <%=clasifica2%></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="19%">Lenguaje</td>


                                                                <td width="19%"> 
                                                                    <div align="left"></div>
                                                                    <%=clasifica4%></td>
                                                            </tr>
                                                        </table>
                                                        <!--  out.println("<b>Matemáticas:&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(6) + "&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica1 + "</b><br>");
                                                out.println("<b>Filosofía:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(7) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica2 + "</b><br>");
                                                out.println("<b>Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + estudiante.elementAt(9) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + clasifica4 + "</b><br>");-->
                                                        <%  } else if (datos.elementAt(1).equals("19")) {%>

                                                        <table align="center" width="36%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                                                            <tr>
                                                                <td width="19%">&nbsp;</td>

                                                                <td width="19%"> Su clasificaci&oacute;n</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="19%">Matem&aacute;ticas</td>

                                                                <td width="19%"> <%=clasifica1%></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="19%">Ciencias Sociales</td>


                                                                <td width="19%"> 
                                                                    <div align="left"></div>
                                                                    <%=clasifica2%></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="19%">Lenguaje</td>


                                                                <td width="19%"> 
                                                                    <div align="left"></div>
                                                                    <%=clasifica4%></td>
                                                            </tr>
                                                        </table>


                                                        <%} else if (datos.elementAt(1).equals("262")) {
                                                            com6 = comparar.charAt(5);
                                                            if (com6 == 'B') {
                                                                clasifica6 = "Básico";
                                                            }

                                                            if (com6 == 'M') {
                                                                clasifica6 = "Medio";
                                                            }

                                                            if (com6 == 'A') {
                                                                clasifica6 = "Alto";
                                                            }
                                                        %>
                                                        <table align="center" width="36%" border="0" class="textoimpremas">
                                                            <tr>
                                                                <td width="19%">&nbsp;</td>

                                                                <td width="20%"> Su clasificaci&oacute;n</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="19%">Matem&aacute;ticas</td>


                                                                <td width="20%"> <%=clasifica1%></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="19%">F&iacute;sica</td>


                                                                <td width="20%"> 
                                                                    <div align="left"></div>
                                                                    <%=clasifica3%></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="19%">Lenguaje</td>

                                                                <td width="20%"> 
                                                                    <div align="left"></div>
                                                                    <%=clasifica4%></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="19%">Química</td>

                                                                <td width="20%">
                                                                    <div align="left"></div><%=clasifica5%>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="17%">Biología</td>

                                                                <td width="20%">
                                                                    <div align="left"></div><%=clasifica6%>
                                                                </td>
                                                            </tr>

                                                        </table>

                                                        <%}%>
                                                        <div align="center">
                                                            <table width="36%" border="0" align="center" class="textoimpremas">
                                                                <% if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17")) {%>
                                                                <tr> 
                                                                    <td >
                                                                        <p>&nbsp;</p>
                                                                        <p><b>Asignaturas a cursar:</b> </p>
                                                                        <p><br>
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
                                                                        </p>
                                                                    </td>
                                                                </tr>
                                                                &nbsp; 
                                                                <%} else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>
                                                                <tr> 
                                                                    <td colspan="2"> 
                                                                        <p>&nbsp;</p>
                                                                        <p><b>Asignaturas a cursar:</b> </p>
                                                                        <p><br>
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
                                                                        </p>
                                                                    </td>
                                                                </tr>
                                                                <%} else if (datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19")) {%>
                                                                <tr> 
                                                                    <td> 
                                                                        <p>&nbsp;</p>
                                                                        <p><b>Asignaturas a cursar:</b> </p>
                                                                        <p><br>
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
                                                                        </p>
                                                                    </td>
                                                                </tr>
                                                                <% } else if (datos.elementAt(1).equals("262")) {
                                                                com6 = comparar.charAt(5);%>
                                                                <tr>
                                                                    <td > 
                                                                        <p>&nbsp;</p>
                                                                        <p><b>Asignaturas a cursar:</b> </p><br>
                                                                        <p>
                                                                            <%  for (int t = 0; t < asignaturasBio.size(); t++) {
                                                                                    String niveles = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4) + String.valueOf(com5) + String.valueOf(com6);
                                                                                    Vector nivelasigna = (Vector) asignaturasBio.elementAt(t);
                                                                                    String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2) + String.valueOf(nivelasigna.elementAt(3)) + String.valueOf(nivelasigna.elementAt(4)));
                                                                                    if (niveles.equals(baseicfes)) {
                                                                                        Vector nomasigna = bd.nomasignaturasBio(nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(15).toString(), nivelasigna.elementAt(17).toString(), nivelasigna.elementAt(18).toString(), nivelasigna.elementAt(19).toString(), oout);%>
                                                                            <%  for (int p = 0; p < nomasigna.size(); p++) {
                                                                                out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
                                                                            <br>
                                                                            <%}
                                                                                    }
                                                                                }%>
                                                                    </td>
                                                                </tr>
                                                                <%}%>
                                                            </table>
                                                            <%                }
                                                                    }
                                                                }%>
                                                            <br>
                                                            <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                                                                <tr>
                                                                    <td>

                                                                        <p><b>Usted no presentó el examen de conocimiento. <br>
                                                                            </b> </p>
                                                                        <p>&nbsp; </p>
                                                                    </td>
                                                                </tr>

                                                            </table>
                                                            <% }


                                                            } else {%>

                                                            <html>
                                                                <head>
                                                                    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
                                                                    <title> Exámen de Conocimiento</title>
                                                                    <link href="css/estilo-resultadoconocimiento.css" rel="stylesheet" type="text/css" media="all">
                                                                </head>

                                                                <body>
                                                                    <div id="container">
                                                                        <header>

                                                                            <div class="logoescuela">
                                                                                <img src="img/logo-ESCUELA.svg"/>
                                                                            </div>
                                                                            <img src="img/banner.jpg"/>
                                                                            <div class="osiris">Desarrollado por: Direcci&oacute;n de Tecnolog&iacute;a Osiris y Direcci&oacute;n de Comunicaciones y Mercadeo</div>
                                                                        </header>
                                                                        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
                                                                        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
                                                                        <link href="css/comun.css" rel="stylesheet" type="text/css">
                                                                        </head>
                                                                        <p>
                                                                        <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                                                                            <tr>
                                                                                <td>

                                                                                    <p><b>Su documento es incorrecto o usted no ha diligenciado la solicitud 
                                                                                            de admisión. Verifique e intente nuevamente o comuníquese al 6683600 opción 2 en el menú.</b> </p>
                                                                                    <p>&nbsp; </p>
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                        <%}%>
                                                                        <div align="center"><a href="http://www.escuelaing.edu.co"><b>SALIR</b></a> </div>
                                                                        <p><footer> </footer></p>
                                                                        <p><footer><span class="programa">Escuela Colombiana de Ingeniería Julio Garavito 
                                                                            </span> <span class="direccion"> AK.45 No.205-59 (Autopista Norte)<br/>
                                                                                PBX: +57(1) 668 3600<br/>
                                                                                Call Center: +57(1) 668 3600<br/>
                                                                                Línea Nacional Gratuita: 018000112668<br/>
                                                                                www.escuelaing.edu.co<br/>
                                                                                Bogotá, D.C. - Colombia<br/>
                                                                            </span> </footer></p>
                                                                    </div>
                                                                </body>
                                                            </html>
