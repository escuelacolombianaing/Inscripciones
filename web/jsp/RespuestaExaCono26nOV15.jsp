<%-- 
    Document   : RespuestaExaCono
    Created on : 30/10/2015, 09:50:17 AM
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
    int x = 0, ban = 1;
    char com1, com2, com3, com4, com5, com6, comp1, comp2, comp3, comp4, comp5, comp6;
    String idprog = new String();
    String com11 = "", com22 = "", com33 = "", com44 = "", com55 = "", com66 = "", co6 = "";
    String fecha = new String();
    String grupo1 = new String();
    String grupo2 = new String();
    String grupo3 = new String();
    String recibo = new String();
    String comparar = new String();
    String comparar1 = new String();
    String tipoest = new String();
    String clasifica1 = new String();
    String clasifica2 = new String();
    String clasifica3 = new String();
    String clasifica4 = new String();
    String clasifica5 = new String();
    String clasifica6 = new String();
    String nivelexamen = new String();
    String confirmat = new String();
    String confirfis = new String();
    String confirqui = new String();
    String prog = new String();
    String carnet = new String();
    String co1 = new String();
    String co2 = new String();
    String co3 = new String();
    String co4 = new String();
    String co5 = new String();

    if (examen.size() > 0) {

        carnet = examen.elementAt(0).toString();
        String nombre = examen.elementAt(1).toString();
        String correo = examen.elementAt(2).toString();

        Vector DatosExamen = bd.Exa_Cono(carnet, confEci.getPeriodo(), oout);
        if (DatosExamen.size() > 0) {
            nivelexamen = DatosExamen.elementAt(2).toString();
            confirmat = DatosExamen.elementAt(3).toString();
            confirfis = DatosExamen.elementAt(4).toString();
            confirqui = DatosExamen.elementAt(5).toString();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title> Pruebas de Conocimiento</title>
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

            <script language="JavaScript" type="text/JavaScript">

                function validar() {

                if (!document.form1.matematicas[0].checked && !document.form1.matematicas[1].checked) {
                alert("Debes seleccionar si acepta o no la recomendación para el área Matemáticas.");
                return false; 
                }

                if (!document.form1.fisica[0].checked && !document.form1.fisica[1].checked) {
                alert("Debes seleccionar si acepta o no la recomendación para el área Física.");
                return false; 
                }

                if (!document.form1.quimica[0].checked && !document.form1.quimica[1].checked) {
                alert("Debes seleccionar si acepta o no la recomendación para el área Química.");
                return false; 
                }


                }

                function impresion(){
                window.print();

                }

            </script>



        </head>
        <body>



            <%
                Vector Cierre = bd.ControlaCierreRtaExamen(docEst, oout, confEci.getPeriodo());
                if (Cierre.size() > 0) {
                    Vector estudiante = bd.AdmitidosPregradoOtros(docEst, oout, confEci.getPeriodo());

                    if (estudiante.size() > 0) {
                        for (int k = 0; k < estudiante.size(); k++) {

                            Vector datos = (Vector) estudiante.elementAt(k);
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
            <br>
            <div align="center">Apreciado(a): <%=nombre%> </div>
            <div align ="center">Programa: <%=prog%></div>
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
                </tr>
            </table>
            <%
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
            %>
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
            <%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17")) {%>
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
                    com66 = Character.toString(com6);
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
                <%  if (nivelexamen.equals("No disponible") || (nivelexamen.equals("0"))) {%>

                <b><center>Usted no presentó las pruebas de conocimiento</center></b>

                <%} else {%>

                <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                    <tr>
                        <td>
                            <br>
                            <p>Teniendo en cuenta sus resultados en el examen SABER 11 y en la prueba 
                                de conocimientos efectuada en Diciembre de 2015, la Escuela se permite 
                                recomendarle cursar las siguientes asignaturas</p>
                        </td>
                    </tr>
                </table>
                <!--NIVEL OBTENIDO EN EL EXAMEN DE CONOCIMIENTO-->
                <%comparar1 = nivelexamen;%>
                <%comp1 = comparar1.charAt(0);
                    co1 = Character.toString(comp1);
                    comp2 = comparar1.charAt(1);
                    co2 = Character.toString(comp2);
                    comp3 = comparar1.charAt(2);
                    co3 = Character.toString(comp3);
                    comp4 = comparar1.charAt(3);
                    co4 = Character.toString(comp4);
                    comp5 = comparar1.charAt(4);
                    co5 = Character.toString(comp5);


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

                    if (comp4 == 'B') {
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

                    if (datos.elementAt(1).equals("18")) {%>

                <table align="center" width="37%" border="0" class="textoimpremas">
                    <tr>
                        <td width="19%">&nbsp;</td>

                        <td width="19%"> <b>Su clasificaci&oacute;n</b></td>
                    <br>&nbsp;
                    </tr>
                    <%if (!co1.equals(com11)) {%>
                    <tr>
                        <td width="19%"><font color="#990000"><b> Matemáticas</b></font></td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <font color="#990000"><b> <%=clasifica1%></b></font>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td width="19%"> Matemáticas</td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica1%>
                        </td></tr>
                        <%}%>
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

                <%  } else if (datos.elementAt(1).equals("19")) {%>

                <table align="center" width="37%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
                    <tr>
                        <td width="19%">&nbsp;</td>

                        <td width="19%"> Su clasificaci&oacute;n</td>
                    </tr>
                    <%if (!co1.equals(com11)) {%>
                    <tr>
                        <td width="19%"><font color="#990000"><b> Matemáticas</b></font></td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <font color="#990000"><b> <%=clasifica1%></b></font>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td width="19%"> Matemáticas</td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica1%>
                        </td></tr>
                        <%}%>
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

                <p>&nbsp; </p>

                <% if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17")) {%>

                <table align="center" width="37%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">        

                    <tr>
                        <td width="19%">&nbsp;</td>

                        <td width="20%"> Su clasificaci&oacute;n</td>
                    </tr>
                    <%if (!co1.equals(com11)) {%>
                    <tr>
                        <td width="19%"><font color="#990000"><b> Matemáticas</b></font></td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <font color="#990000"><b> <%=clasifica1%></b></font>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td width="19%"> Matemáticas</td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica1%>
                        </td></tr>
                        <%}%>
                        <%if (!co3.equals(com33)) {%>
                    <tr>
                        <td width="19%"><font color="#990000"><b> F&iacute;sica</b></font></td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <font color="#990000"><b> <%=clasifica3%></b></font>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td width="19%"> F&iacute;sica</td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica3%>
                        </td></tr>
                        <%}%>
                    <tr>
                        <td width="19%">Lenguaje</td>

                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica4%></td>
                    </tr>
                </table>



                <%} else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")) {%>

                <p>&nbsp;</p><table align="center" width="60%" border="0" class="textoimpremas">
                    <tr>
                        <td width="19%">&nbsp;</td>

                        <td width="20%"> Su clasificaci&oacute;n</td>
                    </tr>
                    <%if (!co1.equals(com11)) {%>
                    <tr>
                        <td width="19%"><font color="#990000"><b> Matemáticas</b></font></td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <font color="#990000"><b> <%=clasifica1%></b></font>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td width="19%"> Matemáticas</td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica1%>
                        </td></tr>
                        <%}%>
                        <%if (!co3.equals(com33)) {%>
                    <tr>
                        <td width="19%"><font color="#990000"><b> F&iacute;sica</b></font></td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <font color="#990000"><b> <%=clasifica3%></b></font>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td width="19%"> F&iacute;sica</td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica3%>
                        </td></tr>
                        <%}%>
                    <tr>
                        <td width="19%">Lenguaje</td>

                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica4%></td>
                    </tr>

                    <%if (!co5.equals(com55)) {%>
                    <tr>
                        <td width="19%"><font color="#990000"><b> Química</b></font></td>
                        <td width="20%"> 
                            <div align="left"></div>
                            <font color="#990000"><b> <%=clasifica5%></b></font>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td width="19%">Química</td>
                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica5%>
                        </td></tr>
                        <%}%>

                    <tr>

                        <td height="19"> 
                            <p>&nbsp;</p>

                        </td>
                    </tr>
                </table>
                <% } else if (datos.elementAt(1).equals("262")) {
                    comp6 = comparar.charAt(5);
                    co6 = Character.toString(comp6);
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

                <table align="center" width="36%" border="0" class="textoimpremas">
                    <tr>
                        <td width="19%">&nbsp;</td>

                        <td width="20%"><b> Su clasificaci&oacute;n</b></td>
                    <br>&nbsp;
                    </tr>
                    <%if (!co1.equals(com11)) {%>
                    <tr>
                        <td width="19%"><font color="#990000"><b> Matemáticas</b></font></td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <font color="#990000"><b> <%=clasifica1%></b></font>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td width="19%"> Matemáticas</td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica1%>
                        </td></tr>
                        <%}%>
                        <%if (!co3.equals(com33)) {%>
                    <tr>
                        <td width="19%"><font color="#990000"><b> F&iacute;sica</b></font></td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <font color="#990000"><b> <%=clasifica3%></b></font>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td width="19%"> F&iacute;sica</td>


                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica3%>
                        </td></tr>
                        <%}%>
                    <tr>
                        <td width="19%">Lenguaje</td>

                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica4%></td>
                    </tr>
                    <%if (!co5.equals(com55)) {%>
                    <tr>
                        <td width="19%"><font color="#990000"><b> Química</b></font></td>
                        <td width="20%"> 
                            <div align="left"></div>
                            <font color="#990000"><b> <%=clasifica5%></b></font>
                        </td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td width="19%">Química</td>
                        <td width="20%"> 
                            <div align="left"></div>
                            <%=clasifica5%>
                        </td></tr>
                        <%}%>
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
                    </td></tr>
                    <%}%>
                </table>

                <p>&nbsp;</p>
                <div class="textoimpremas">


                    <p align="left">Tenga en cuenta que si en su plan de estudios debe cursar la 
                        asignatura Física Mecánica y de Fluidos (FIMF) se requiere:</p>
                    <p align="left"> 1. Estudiantes de Ingeniería Biomédica haber cursado y aprobado 
                        Cálculo Diferencial (CALD) .</p>
                    <p align="left">2. Estudiantes de los demás programas de Ingeniería y Matemáticas 
                        pueden cursarla simultáneamente con Cálculo Diferencial (CALD) o verla posteriormente 
                        si ha aprobado Cálculo Diferencial (CALD). </p>
                    <p align="left">&nbsp;</p>
                </div>
                <%if (comparar.equals(comparar1)) {%>
                <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                    <tr>
                        <td>
                            <br>

                            <p><font color="#800000">Teniendo en cuenta sus resultados en el examen 
                                SABER 11 y en la prueba de conocimientos efectuada en Diciembre de 2015 sus niveles de clasificación fueron los mismos por lo tanto las asignaturas a cursar serán las mencionadas anteriormente. </font></p>
                        </td>
                    </tr>
                </table>
                <%} else {%>

                <div align="center">ASIGNATURAS A CURSAR<br>
                </div>
                <p>&nbsp;</p>
                <!--ConfirmaExaCono-->



                <form name="form1" method="post" action="AceptaExamen"> 

                    <input name="idprog" type="hidden"  value="<%=idprog%>">
                    <input name="carnet" type="hidden"  value="<%=carnet%>">
                    <input name="examat" type="hidden"  value="<%=co1%>">
                    <input name="exafil" type="hidden"  value="<%=co2%>">
                    <input name="exafis" type="hidden"  value="<%=co3%>">
                    <input name="exalen" type="hidden"  value="<%=co4%>">
                    <input name="exaqui" type="hidden"  value="<%=co5%>">
                    <input name="exabio" type="hidden"  value="<%=co6%>">  
                    <input name="icfesmat" type="hidden"  value="<%=com11%>">
                    <input name="icfesfil" type="hidden"  value="<%=com22%>">
                    <input name="icfesfis" type="hidden"  value="<%=com33%>">
                    <input name="icfeslen" type="hidden"  value="<%=com44%>">
                    <input name="icfesqui" type="hidden"  value="<%=com55%>">
                    <input name="icfesbio" type="hidden"  value="<%=com66%>">
                    <input name="docEst" type="hidden"  value="<%=docEst%>">

                    <table width="500"  align="center" border="3" class="textoimpremas" >
                        <tr> 
                            <td colspan="2" height="22">&nbsp;</td>
                            <td colspan="2" height="22"> 
                                <div align="center"><b>ACEPTA LA RECOMENDACION</b></div>
                            </td>
                        </tr>
                        <tr> 
                            <td width="192"><b>AREA</b></td>
                            <td width="192"><b>NOMBRE ASIGNATURA(S)</b></td>
                            <td width="354"><b><br>
                                    SI</b></td>
                            <td width="354"><b><br>
                                    NO</b></td>
                        </tr>
                        <%if (!co1.equals(com11)) {%>
                        <%if (asigna_exaM.size() > 0) {%>
                        <tr> 
                            <td width="192">MATEMATICAS</td>
                            <td width="192"> 
                                <%String asignatura1 = asigna_exaM.elementAt(2).toString();
                                    String asignatura2 = asigna_exaM.elementAt(3).toString();%>
                                <% Vector nomasignaturasExamen = bd.nomasignaturasExamen(asignatura1, asignatura2, oout);
                                    for (int j = 0; j < nomasignaturasExamen.size(); j++) {%>
                                <% Vector nombreasig = (Vector) nomasignaturasExamen.elementAt(j);
                                    String asigna1 = nombreasig.elementAt(0).toString();
                                    // String asigna2 = nombreasig.elementAt(1).toString();%>
                                <%=asigna1%> <br>
                                <%}

                                    }%>
                            </td>
                            <td width="354"> 
                                <input type="radio" name="matematicas" value="1">
                            </td>
                            <td width="354"> 
                                <input type="radio" name="matematicas" value="0">
                            </td>
                        </tr>
                        <%}%>
                        <%if (!co3.equals(com33)) {%>
                        <%  if (asigna_exaF.size() > 0) {
                        %>
                        <tr> 
                            <td width="192">FISICA</td>
                            <td width="192"> 
                                <% String asignatura1 = asigna_exaF.elementAt(2).toString();
                                    String asignatura2 = asigna_exaF.elementAt(3).toString();%>
                                <% Vector nomasignaturasExamen = bd.nomasignaturasExamen(asignatura1, asignatura2, oout);
                                    for (int j = 0; j < nomasignaturasExamen.size(); j++) {%>
                                <% Vector nombreasig = (Vector) nomasignaturasExamen.elementAt(j);
                                    String asigna1 = nombreasig.elementAt(0).toString();%>
                                <%=asigna1%> <br>
                                <%}%>
                            </td>
                            <td width="354"> 
                                <input type="radio" name="fisica" value="1">
                            </td>
                            <td width="354"> 
                                <input type="radio" name="fisica" value="0">
                            </td>
                        </tr>
                        <% }
                            }%>
                        <%if (!co5.equals(com55)) {%>
                        <% if (asigna_exaQ.size() > 0) {%>
                        <tr> 
                            <td width="192">QUIMICA</td>
                            <td width="192"> 
                                <%String asignatura1 = asigna_exaQ.elementAt(2).toString();
                                    String asignatura2 = asigna_exaQ.elementAt(3).toString();%>
                                <% Vector nomasignaturasExamen = bd.nomasignaturasExamen(asignatura1, asignatura2, oout);
                                    for (int j = 0; j < nomasignaturasExamen.size(); j++) {
                                        Vector nombreasig = (Vector) nomasignaturasExamen.elementAt(j);
                                        String asigna1 = nombreasig.elementAt(0).toString();%>
                                <%=asigna1%> <br>
                                <%}%>
                            </td>
                            <td width="354"> 
                                <input type="radio" name="quimica" value="1">
                            </td>
                            <td width="354"> 
                                <input type="radio" name="quimica" value="0">
                            </td>
                        </tr>
                        <%}
                            }%>

                    </table>

                    <div class="textoimpremas">
                        <p>&nbsp;</p>

                        <!--  <p>Esta solicitud deber&aacute; ser revisada con su acudiente antes de ser 
                              enviada, ya que una vez enviada no podr&aacute; ser modificada. </p>
                          <p>&nbsp;</p>
                          <p> <input type="checkbox" name="acepta" value="S"> Declaro que mi acudiente y yo conocemos y aceptamos las condiciones 
                              aqu&iacute; expresadas. -->
                        <p>&nbsp;
                        <p align="center"> 
                            <input type="submit" name="Submit" value="Siguiente" onclick=" return validar();">
                        <p><br>
                    </div>


                </form>

                <%}
                        }
                    }
                } else {%>
                <b> Su documento es incorrecto o usted no ha diligenciado la solicitud de admisión. 
                    Verifique e intente nuevamente o comuníquese al 6683600 opción 2 en el menú.</b> 
                <div align="center">
                    <input name="atras" class="boton"  type="submit" id="" value="Atrás" onClick="location.href = 'ConsultaExamen?documento=<%=docEst%>'">
                    <input name="Salir" class="boton"  type="submit" id="" value="Salir" onClick="location.href = 'http://www.escuelaing.edu.co'">
                </div>
                <%}
                    } else {%>
                <b><center>
                        <p>La consulta de respuesta del exámen de conocimiento ya no se encuentra disponible.</p>
                        <p>&nbsp;</p>
                    </center>
                    <div align="center">
                        <input name="atras" class="boton"  type="submit" id="" value="Atrás" onClick="location.href = 'ConsultaExamen?documento=<%=docEst%>'">
                        <input name="Salir" class="boton"  type="submit" id="" value="Salir" onClick="location.href = 'http://www.escuelaing.edu.co'">
                    </div>
                    <%  }
                            }
                        }%>
                    <p><footer> </footer></p>



                    <p><footer><span class="programa">Escuela Colombiana de Ingeniería Julio Garavito 
                        </span> <span class="direccion"> AK.45 No.205-59 (Autopista Norte)<br/>
                            PBX: +57(1) 668 3600<br/>
                            Call Center: +57(1) 668 3600<br/>
                            Línea Nacional Gratuita: 018000112668<br/>
                            www.escuelaing.edu.co<br/>
                            Bogotá, D.C. - Colombia<br/>
                        </span> </footer></p>


                    </body>
                    </html>
