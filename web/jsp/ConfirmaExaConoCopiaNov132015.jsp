<%-- 
    Document   : ConfirmaExaCono
    Created on : 5/11/2015, 11:06:02 AM
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
    String valorM = request.getParameter("valorM");
    String valorF = request.getParameter("valorF");
    String valorQ = request.getParameter("valorQ");
    String carnet = request.getParameter("carnet");
    String examat = request.getParameter("examat");
    String exafil = request.getParameter("exafil");
    String exafis = request.getParameter("exafis");
    String exalen = request.getParameter("exalen");
    String exaqui = request.getParameter("exaqui");
    String exabio = request.getParameter("exabio");
    String icfesmat = request.getParameter("icfesmat");
    String icfesfil = request.getParameter("icfesfil");
    String icfesfis = request.getParameter("icfesfis");
    String icfeslen = request.getParameter("icfeslen");
    String icfesqui = request.getParameter("icfesqui");
    String icfesbio = request.getParameter("icfesbio");
    String idprog = request.getParameter("idprog");

    String sec;

    String nivelicfes = icfesmat + icfesfil + icfesfis + icfeslen + icfesqui + icfesbio;


    String nvonivel = "";
    if (valorM.equals("null") || valorM.equals("0")) {
        nvonivel = icfesmat;
    } else if (valorM.equals("1")) {
        nvonivel = examat;
    }

    nvonivel = nvonivel + icfesfil;

    if (valorF.equals("null") || valorF.equals("0")) {
        nvonivel = nvonivel + icfesfis;
    } else if (valorF.equals("1")) {
        nvonivel = nvonivel + exafis;
    }
    nvonivel = nvonivel + icfeslen;


    if (valorQ.equals("null") || valorQ.equals("0")) {
        nvonivel = nvonivel + icfesqui;
    } else if (valorQ.equals("1")) {
        nvonivel = nvonivel + exaqui;
    }

    nvonivel = nvonivel + icfesbio;


    char nvomat = nvonivel.charAt(0);
    String NivelMat = Character.toString(nvomat);

    char nvofis = nvonivel.charAt(2);
    String NivelFis = Character.toString(nvofis);

    char nvoqui = nvonivel.charAt(4);
    String NivelQui = Character.toString(nvoqui);


    int actualnivel = bd.NuevoNivelIcfes(carnet, nvonivel, oout);
    sec = bd.sigSecuencia("ANOTACION_AUX");

    //out.println(nvonivel);
    int respuesta0 = bd.ConfirExaM(carnet, valorM, oout);
    int respuesta1 = bd.ConfirExaF(carnet, valorF, oout);
    int respuesta2 = bd.ConfirExaQ(carnet, valorQ, oout);
    String anotacion = "Se cambia nivel de clasificación inicial " + nivelicfes + " según exámen de conocimiento y aceptación por: " + nvonivel;
    int Anotacion = bd.InsertaAnotacion(sec, carnet, anotacion, oout);
    int insertatemp = bd.RegistroTemp(carnet, confEci.getPeriodo(), oout);
    Vector asigna_exaM = bd.Asignaturas_exaMat(idprog, NivelMat);
    Vector asigna_exaF = bd.Asignaturas_exaFis(idprog, NivelFis);
    Vector asigna_exaQ = bd.Asignaturas_exaQuim(idprog, NivelQui);
    if (asigna_exaM.size() > 0) {
        String asignaturaM1 = asigna_exaM.elementAt(2).toString();
        String asignaturaM2 = asigna_exaM.elementAt(3).toString();
        String borrar1 = asigna_exaM.elementAt(4).toString();
        String borrar2 = asigna_exaM.elementAt(5).toString();
        String borrar3 = asigna_exaM.elementAt(6).toString();
        String borrar4 = asigna_exaM.elementAt(7).toString();
        String borrar5 = asigna_exaM.elementAt(8).toString();
        String borrar6 = asigna_exaM.elementAt(9).toString();

        if (!asignaturaM1.equals("0")) {
            int InserExaenTemp = bd.InsertaRegistroTempM(idprog, confEci.getPeriodo(), asignaturaM1, NivelMat, carnet);
        }
        if (!asignaturaM2.equals("0")) {
            int InserExaenTemp1 = bd.InsertaRegistroTempM(idprog, confEci.getPeriodo(), asignaturaM2, NivelMat, carnet);
        }

        int BorrarTemp = bd.BorrarAsignaTemp(borrar1, borrar2, borrar3, borrar4, borrar5, borrar6, carnet, confEci.getPeriodo());
        int BorrarPreins = bd.BorrarAsignaPreins(borrar1, borrar2, borrar3, borrar4, borrar5, borrar6, carnet, confEci.getPeriodo());
    }


    if (asigna_exaF.size() > 0) {
        String asignaturaF1 = asigna_exaF.elementAt(2).toString();
        String asignaturaF2 = asigna_exaF.elementAt(3).toString();
        String borrarF1 = asigna_exaF.elementAt(4).toString();
        String borrarF2 = asigna_exaF.elementAt(5).toString();
        String borrarF3 = asigna_exaF.elementAt(6).toString();
        String borrarF4 = asigna_exaF.elementAt(7).toString();
        String borrarF5 = asigna_exaF.elementAt(8).toString();
        String borrarF6 = asigna_exaF.elementAt(9).toString();

        if (!asignaturaF1.equals("0")) {
            int InserExaenTemp = bd.InsertaRegistroTempF(idprog, confEci.getPeriodo(), asignaturaF1, NivelFis, carnet);
        }
        if (!asignaturaF2.equals("0")) {
            int InserExaenTemp1 = bd.InsertaRegistroTempF(idprog, confEci.getPeriodo(), asignaturaF2, NivelFis, carnet);
        }

        int BorrarTemp = bd.BorrarAsignaTemp(borrarF1, borrarF2, borrarF3, borrarF4, borrarF5, borrarF6, carnet, confEci.getPeriodo());
        int BorrarPreins = bd.BorrarAsignaPreins(borrarF1, borrarF2, borrarF3, borrarF4, borrarF5, borrarF6, carnet, confEci.getPeriodo());
    }


    if (asigna_exaQ.size() > 0) {
        String asignaturaQ1 = asigna_exaQ.elementAt(2).toString();
        String asignaturaQ2 = asigna_exaQ.elementAt(3).toString();
        String borrarQ1 = asigna_exaQ.elementAt(4).toString();
        String borrarQ2 = asigna_exaQ.elementAt(5).toString();
        String borrarQ3 = asigna_exaQ.elementAt(6).toString();
        String borrarQ4 = asigna_exaQ.elementAt(7).toString();
        String borrarQ5 = asigna_exaQ.elementAt(8).toString();
        String borrarQ6 = asigna_exaQ.elementAt(9).toString();

        if (!asignaturaQ1.equals("0")) {
            int InserExaenTemp = bd.InsertaRegistroTempF(idprog, confEci.getPeriodo(), asignaturaQ1, NivelQui, carnet);
        }
        if (!asignaturaQ2.equals("0")) {
            int InserExaenTemp1 = bd.InsertaRegistroTempF(idprog, confEci.getPeriodo(), asignaturaQ2, NivelQui, carnet);
        }

        int BorrarTemp = bd.BorrarAsignaTemp(borrarQ1, borrarQ2, borrarQ3, borrarQ4, borrarQ5, borrarQ6, carnet, confEci.getPeriodo());
        int BorrarPreins = bd.BorrarAsignaPreins(borrarQ1, borrarQ2, borrarQ3, borrarQ4, borrarQ5, borrarQ6, carnet, confEci.getPeriodo());
    }



    Vector Fisica = bd.ValidaFisica(carnet, confEci.getPeriodo());
    if (Fisica.size() > 0) {
        if (idprog.equals("262")) {
            int BorrarFisTemp = bd.BorrarFisicaTemp(carnet, confEci.getPeriodo());
            int BorrarFisPreins = bd.BorrarFisicaPreins(carnet, confEci.getPeriodo());
        } else if (!idprog.equals("262")) {
            Vector Calculo = bd.ValidaCal(carnet, confEci.getPeriodo());
            if (Calculo.size() <= 0) {
                int BorrarFisTemp = bd.BorrarFisicaTemp(carnet, confEci.getPeriodo());
                int BorrarFisPreins = bd.BorrarFisicaPreins(carnet, confEci.getPeriodo());
            }
        }

    }
    
    
    int BorrarRegistro =bd.BorrarRegistro(carnet, confEci.getPeriodo());

    if (Anotacion == 1) {

        Vector examen = bd.ExamenConoc(docEst, confEci.getPeriodo(), oout);

        int x = 0, ban = 1;
        char com1, com2, com3, com4, com5, com6, comp1, comp2, comp3, comp4, comp5, comp6;

        String com11 = "", com22 = "", com33 = "", com44 = "", com55 = "", com66 = "", co6 = "";
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
        String clasifica6 = new String();
        String nivelexamen = new String();
        String confirmat = new String();
        String confirfis = new String();
        String confirqui = new String();
        String prog = new String();

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

            </head>
            <body>

                <br>
                <div align="center">Apreciado(a): <%=nombre%> </div>
                <p><br>

                    <%Vector estudiante = bd.AdmitidosPregradoOtros(docEst, oout, confEci.getPeriodo());

                        if (estudiante.size() > 0) {
                            for (int k = 0; k < estudiante.size(); k++) {

                                Vector datos = (Vector) estudiante.elementAt(k);%>
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
                    <%comparar = nivelexamen;%>
                    <%comp1 = comparar.charAt(0);
                        co1 = Character.toString(comp1);
                        comp2 = comparar.charAt(1);
                        co2 = Character.toString(comp2);
                        comp3 = comparar.charAt(2);
                        co3 = Character.toString(comp3);
                        comp4 = comparar.charAt(3);
                        co4 = Character.toString(comp4);
                        comp5 = comparar.charAt(4);
                        co5 = Character.toString(comp5);


                        // Vector asigna_exaM = bd.Asignaturas_exaMat(idprog, co1);
                        //Vector asigna_exaF = bd.Asignaturas_exaFis(idprog, co3);
                        //Vector asigna_exaQ = bd.Asignaturas_exaQuim(idprog, co5);%>



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
                                <%if (valorM.equals("1")) {%>
                                <td width="354"> 
                                    <input type="radio" name="matematicas" value="1" checked>
                                </td>
                                <td width="354"> 
                                    <!--input type="radio" name="matematicas" value="0" -->
                                </td>
                                <%} else {%>
                                <td width="354"> 
                                    <!--input type="radio" name="matematicas" value="1" -->
                                </td>
                                <td width="354"> 
                                    <input type="radio" name="matematicas" value="0" checked >
                                </td>

                                <%}%>
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
                                <%if (valorF.equals("1")) {%>
                                <td width="354"> 
                                    <input type="radio" name="fisica" value="1" checked>
                                </td>
                                <td width="354"> 
                                    <!--input type="radio" name="fisica" value="0"-->
                                </td>
                                <%} else {%>
                                <td width="354"> 
                                    <!--input type="radio" name="fisica" value="1" -->
                                </td>
                                <td width="354"> 
                                    <input type="radio" name="fisica" value="0" checked>
                                </td>
                                <%}%>
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
                                 <%if (valorQ.equals("1")) {%>
                                <td width="354"> 
                                    <input type="radio" name="quimica" value="1" checked>
                                </td>
                                 <%} else {%>
                                <td  width="354"></td>
                                <td width="354"> 
                                    <input type="radio" name="quimica" value="0" ckecked>
                                </td>
                                 <%}%>
                            </tr>
                            <%}
                                }%>

                        </table>

                        <div class="textoimpremas">
                            <p>&nbsp;</p>
                            <%if (!confirmat.equals("No disponible") || !confirfis.equals("No disponible") || !confirfis.equals("No disponible")) {%>

                          

                            <%} else {%>
                            <!--  <p>Esta solicitud deber&aacute; ser revisada con su acudiente antes de ser 
                                  enviada, ya que una vez enviada no podr&aacute; ser modificada. </p>
                              <p>&nbsp;</p>
                              <p> <input type="checkbox" name="acepta" value="S"> Declaro que mi acudiente y yo conocemos y aceptamos las condiciones 
                                  aqu&iacute; expresadas. -->
                            <p>&nbsp;
                            <p align="center"> 
                                <input type="submit" name="Submit" value="Enviar">
                            <p><br>
                        </div>
                        <%}%>

                    </form>

                    <%
                            }
                        }
                    } else {%>
                    <b>Su documento es incorrecto o usted no ha diligenciado la solicitud de admisión. 
                        Verifique e intente nuevamente o comuníquese al 6683600 opción 2 en el menú.**</b> 
                        <%}
                            }%>
                        <%   }%>
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


            </body>
</html>

//response.sendRedirect("RespuestaExaCono") ;
<%    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Exámen de Conocimiento</title>
    </head>
    <body>
        <h1></h1>
    </body>
</html>
