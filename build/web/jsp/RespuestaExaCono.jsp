<%-- 
    Document   : RespuestaExaCono
    Created on : 26/11/2015, 03:10:57 PM
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
    int x = 0, ban = 0;
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
    String clasificaExa1 = new String();
    String clasificaExa2 = new String();
    String clasificaExa3 = new String();
    String clasificaExa4 = new String();
    String clasificaExa5 = new String();
    String clasificaExa6 = new String();
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
        // int insertatemp = bd.RegistroTemp(carnet, confEci.getPeriodo(), oout);
        if (DatosExamen.size() > 0) {
            nivelexamen = DatosExamen.elementAt(2).toString();
            confirmat = DatosExamen.elementAt(3).toString();
            confirfis = DatosExamen.elementAt(4).toString();
            confirqui = DatosExamen.elementAt(5).toString();
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

            <script language="JavaScript" type="text/JavaScript">

                function validar() {

                 if (!document.form1.matematicas[0].disabled && !document.form1.matematicas[1].disabled){
                if (!document.form1.matematicas[0].checked && !document.form1.matematicas[1].checked) {
                alert("Debe seleccionar si acepta o no la recomendación para el área Matemáticas.");
                return false; 
                }
                 }

                if (!document.form1.fisica[0].disabled && !document.form1.fisica[1].disabled){
                if (!document.form1.fisica[0].checked && !document.form1.fisica[1].checked) {
                alert("Debe seleccionar si acepta o no la recomendación para el área Física.");
                return false; 
                }
                }

                /**
                if (!document.form1.quimica[0].disabled && !document.form1.quimica[1].disabled){
                if (!document.form1.quimica[0].checked && !document.form1.quimica[1].checked) {
                alert("Debe seleccionar si acepta o no la recomendación para el área Química.");
                return false; 
                }
                }
				
				*/


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

                            } else if (datos.elementAt(1).equals("264")) {
                                prog = "INGENIERÍA AMBIENTAL";

                            }%>
            <br>
            <div align="center">Apreciado(a): <%=nombre%> </div>
            <div align ="center">Programa: <%=prog%></div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                <tr>
                    <td>

                        <p>&nbsp;</p>
                        <p align="justify">Teniendo en cuenta sus resultados en la prueba de estado SABER 11, la Escuela Colombiana de Ingeniería Julio Garavito le ha asignado un nivel en cada una de las áreas.
                            Por otra parte, con el fin de facilitar su proceso de adaptación y éxito académico, la Escuela lo invitó a presentar el examen de conocimiento para darle elementos adicionales a usted
                            y a su acudiente para decidir sobre el nivel más adecuedo de las asignaturas de primer semestre que debe cursar.
                           <br>
                           En la siguinete tabla usted podrá encontrar su clasificación en cada área de acuerdo con la prueba SABER 11 comparada con sus resultados en el examen de conocimiento.
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
               /* fecha = reuniones.elementAt(1).toString();
                grupo1 = reuniones.elementAt(2).toString();
                grupo2 = reuniones.elementAt(3).toString();
                grupo3 = reuniones.elementAt(4).toString();
                recibo = reuniones.elementAt(5).toString();
*/
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
                
                if (datos.elementAt(1).equals("262")) {
                com6 = comparar.charAt(5);
                com66 = Character.toString(com6);
                }
                
                Vector asigna_SaberM = bd.Asignaturas_exaMat(idprog, com11);
                Vector asigna_SaberF = bd.Asignaturas_exaFis(idprog, com33);
                Vector asigna_SaberQ = bd.Asignaturas_exaQuim(idprog, com55);
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
                    clasificaExa1 = "Básico";
                }

                if (comp1 == 'M') {
                    clasificaExa1 = "Medio";
                }

                if (comp1 == 'A') {
                    clasificaExa1 = "Alto";
                }
            %>

            <% if (comp2 == 'B') {
                    clasificaExa2 = "Básico";
                }

                if (comp2 == 'M') {
                    clasificaExa2 = "Medio";
                }

                if (comp2 == 'A') {
                    clasificaExa2 = "Alto";
                }
            %>

            <% if (comp3 == 'B') {
                    clasificaExa3 = "Básico";
                }

                if (comp3 == 'M') {
                    clasificaExa3 = "Medio";
                }

                if (comp3 == 'A') {
                    clasificaExa3 = "Alto";
                }

                if (comp4 == 'B') {
                    clasificaExa4 = "Básico";
                }

                if (comp4 == 'M') {
                    clasificaExa4 = "Medio";
                }

                if (comp4 == 'A') {
                    clasificaExa4 = "Alto";
                }
            %>

            <% if (comp5 == 'B') {
                    clasificaExa5 = "Básico";
                }

                if (comp5 == 'M') {
                    clasificaExa5 = "Medio";
                }

                if (comp5 == 'A') {
                    clasificaExa5 = "Alto";
                }
            %>

            <%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("262")) {%>
            <div align="center">

                <table align="center" width="36%" border="1" class="textoimpremas">
                    <tr> 
                        <td width="19%">Area</td>
                        <td width="20%">Clasificaci&oacute;n saber 11</td>
                        <td width="20%"> Clasificaci&oacute;n examen de conocimiento</td>
                    </tr>
                    <tr> 
                        <td width="19%">Matem&aacute;ticas</td>
                        <td width="20%"> <%=clasifica1%></td>
                        <%if (!co1.equals(com11)) {%>

                        <td width="20%"> 
                            <div align="left"></div>
                            <font color="#990000"><b> <%=clasificaExa1%></b></font>
                        </td>

                        <%} else {%>

                        <td width="20%">  <%=clasificaExa1%></td>
                    </tr>
                    <%}%>
                    <tr> 
                        <td width="19%">F&iacute;sica</td>
                        <td width="20%"> <%=clasifica3%></td>
                        <%if (!co3.equals(com33)) {%>

                        <td width="20%"> <font color="#990000"><b> <%=clasificaExa3%></b></font>
                        </td>

                        <%} else {%>

                        <td width="20%"> <%=clasificaExa3%>
                        </td></tr>
                        <%}%>

                </table>
                <% } else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260") || datos.elementAt(1).equals("264")) {%>
                <div align="center">
                    <table align="center" width="36%" border="1" class="textoimpremas">
                        <tr> 
                            <td width="19%">Area</td>
                            <td width="20%">Clasificaci&oacute;n saber 11</td>
                            <td width="20%"> Clasificaci&oacute;n examen de conocimiento</td>
                        </tr>
                        <tr> 
                            <td width="19%">Matem&aacute;ticas</td>
                            <td width="20%"> <%=clasifica1%></td>
                            <%if (!co1.equals(com11)) {%>

                            <td width="20%"> 
                                <div align="left"></div>
                                <font color="#990000"><b> <%=clasificaExa1%></b></font>
                            </td>

                            <%} else {%>

                            <td width="20%">  <%=clasificaExa1%></td>
                        </tr>
                        <%}%>
                        <tr> 
                            <td width="19%">F&iacute;sica</td>
                            <td width="20%"> <%=clasifica3%></td>
                            <%if (!co3.equals(com33)) {%>

                            <td width="20%"> <font color="#990000"><b> <%=clasificaExa3%></b></font>
                            </td>

                            <%} else {%>

                            <td width="20%"> <%=clasificaExa3%>
                            </td></tr>
                            <%}%>

                        <tr> 
                            <td width="19%">Química</td>
                            <td width="20%"><%=clasifica5%></td>
                            <%if (!co5.equals(com55)) {%>

                            <td width="20%"> <font color="#990000"><b> <%=clasificaExa5%></b></font>
                            </td>

                            <%} else {%>

                            <td width="20%"> 
                                <div align="left"></div>
                                <%=clasificaExa5%>
                            </td></tr>
                            <%}%>
                    </table>

                    <% } else if (datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19")) {%>
             <div align="center">
                <table align="center" width="36%" border="1" class="textoimpremas" dwcopytype="CopyTableRow">
                    <tr>
                        <td width="19%">Area</td>
                        <td width="19%"> Su clasificaci&oacute;n saber 11</td>
                        <td width="20%"> Clasificaci&oacute;n examen de conocimiento</td>
                     <tr> 
                            <td width="19%">Matem&aacute;ticas</td>
                            <td width="20%"> <%=clasifica1%></td>
                            <%if (!co1.equals(com11)) {%>

                            <td width="20%"> 
                                <div align="left"></div>
                                <font color="#990000"><b> <%=clasificaExa1%></b></font>
                            </td>

                            <%} else {%>

                            <td width="20%">  <%=clasificaExa1%></td>
                        </tr>
                        <%}%>
                </table>
                <%}%>

                <%  if (nivelexamen.equals("No disponible") || (nivelexamen.equals("0"))) {%>
                <br><br>
                <b><center>Usted no presentó el examen de conocimiento. Consulte nuevamente su citación.</center></b>

                <%} else {%>


                <%if (comparar.equals(comparar1)) {%>
                <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
                    <tr>
                        <td>
                            <br>

                            <p><font color="#800000">Teniendo en cuenta sus resultados en el examen SABER 11 y en la prueba de conocimientos, sus niveles de clasificación fueron los mismos por lo tanto sus niveles de clasificación serán los mencionados anteriormente. </font></p>
                        </td>
                    </tr>
                </table>
                <%} else {%>
                <div class="textoimpremas">
                    <p align="left">
                        Nos permitimos poner a su consideración los niveles de clasificación en las diferentes áreas, de acuerdo con sus resultados en  nuestros exámenes de conocimientos, 
                        así como las asignaturas que le sugerimos cursar de acuerdo con esta nueva clasificación:
                        <br><br>
                    </p></div>

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

                    <table width="700"  align="center" border="3" class="textoimpremas" >
                        <tr> 
                            <td colspan="2" height="22">&nbsp;</td>
                            <td colspan="3" height="22"> 
                                <div align="center"><b>ACEPTA LA RECOMENDACION</b></div>
                            </td>
                        </tr>
                        <tr> 
                            <td width="100"><b>AREA</b></td>
                            <td width="240"><b>Asignaturas a cursar de acuerdo con el nivel de clasificación según sus resultados en la prueba Saber 11</b></td>
                            <td width="240"><b>Sugerencia de asignaturas a cursar según sus resultados en los exámenes de conocimientos de la Escuela</b></td>
                            <td width="70"><div align="center"> <b><br>
                                        SI</b></div></td>
                            <td width="70"><div align="center"><b><br>
                                        NO</b></div></td>
                        </tr>
                        <%if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17") || datos.elementAt(1).equals("262")) {%>
                        <input name="quimica" type="hidden"  value="0">
                        <tr> <td width="100">MATEMATICAS</td>

                            <td width="240"> 
                                <%String asignaturaS1 = asigna_SaberM.elementAt(2).toString();
                                    String asignaturaS2 = asigna_SaberM.elementAt(3).toString();%>
                                <% Vector nomasignaturasSaber = bd.nomasignaturasExamen(asignaturaS1, asignaturaS2, oout);
                                    for (int j = 0; j < nomasignaturasSaber.size(); j++) {%>
                                <% Vector nombreasig = (Vector) nomasignaturasSaber.elementAt(j);
                                    String asignaS1 = nombreasig.elementAt(0).toString();
                                    // String asigna2 = nombreasig.elementAt(1).toString();%>
                                <%=asignaS1%> <br>
                                <%}

                                    //}%>
                            </td>

                            <!--%if (!co1.equals(com11)) {%-->
                            <%if (asigna_exaM.size() > 0) {%>

                            <td width="240"> 
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

                            <%if (co1.equals(com11)||(co1.equals("B")&&com11.equals("M"))||(co1.equals("M")&&com11.equals("B"))) {
                            %>
                        <input name="matematicas" type="hidden"  value="0">
                        <td width="70"> <div align="center">
                                <input type="radio" disabled align="center" name="matematicas" value="1"></div>
                        </td>
                        <td width="70"> <div align="center">
                                <input type="radio" disabled align="center" name="matematicas" value="0" checked></div>
                        </td>
                        </tr>
                        <% } else {%>
                        <td width="70"> <div align="center">
                                <input type="radio" name="matematicas" value="1"></div>
                        </td>
                        <td width="70"> <div align="center">
                                <input type="radio" name="matematicas" value="0"></div>
                        </td>
                        </tr>
                        <%}%>
                        <!--%if (!co3.equals(com33)) {%-->

                        <tr> <td width="100">FISICA</td>
                            <td width="240"> 
                                <%String asignaturaFS1 = asigna_SaberF.elementAt(2).toString();
                                    String asignaturaFS2 = asigna_SaberF.elementAt(3).toString();%>
                                <% Vector nomasignaturasSaberF = bd.nomasignaturasExamen(asignaturaFS1, asignaturaFS2, oout);
                                    for (int j = 0; j < nomasignaturasSaberF.size(); j++) {%>
                                <% Vector nombreasig = (Vector) nomasignaturasSaberF.elementAt(j);
                                    String asignaS1 = nombreasig.elementAt(0).toString();
                                    // String asigna2 = nombreasig.elementAt(1).toString();%>
                                <%=asignaS1%> <br>
                                <%}

                                    //}%>
                            </td>

                            <%  if (asigna_exaF.size() > 0) {
                            %>

                            <td width="240"> 
                                <% String asignatura1 = asigna_exaF.elementAt(2).toString();
                                    String asignatura2 = asigna_exaF.elementAt(3).toString();%>
                                <% Vector nomasignaturasExamen = bd.nomasignaturasExamen(asignatura1, asignatura2, oout);
                                    for (int j = 0; j < nomasignaturasExamen.size(); j++) {%>
                                <% Vector nombreasig = (Vector) nomasignaturasExamen.elementAt(j);
                                    String asigna1 = nombreasig.elementAt(0).toString();%>
                                <%=asigna1%> <br>
                                <%}%>
                            </td>

                            <%if (co3.equals("B") && com33.equals("M") || co3.equals("M") && com33.equals("B") || co3.equals(com33)) {%>
                        <input name="fisica" type="hidden"  value="0">
                        <td width="70"> <div align="center">
                                <input type="radio" disabled name="fisica" value="1"></div>
                        </td>
                        <td width="70"> <div align="center">
                                <input type="radio" disabled name="fisica" value="0" checked></div>
                        </td>
                        </tr>

                        <% } else {%>
                        <td width="70"> <div align="center">
                                <input type="radio"  name="fisica" value="1"></div>
                        </td>
                        <td width="70"> <div align="center">
                                <input type="radio"  name="fisica" value="0"></div>
                        </td>
                        </tr>

                        <%}
                            }
                        } else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260") || datos.elementAt(1).equals("264")) {%>
                        <tr> <td width="100">MATEMATICAS</td>

                            <td width="240"> 
                                <%String asignaturaS1 = asigna_SaberM.elementAt(2).toString();
                                    String asignaturaS2 = asigna_SaberM.elementAt(3).toString();%>
                                <% Vector nomasignaturasSaber = bd.nomasignaturasExamen(asignaturaS1, asignaturaS2, oout);
                                    for (int j = 0; j < nomasignaturasSaber.size(); j++) {%>
                                <% Vector nombreasig = (Vector) nomasignaturasSaber.elementAt(j);
                                    String asignaS1 = nombreasig.elementAt(0).toString();
                                    // String asigna2 = nombreasig.elementAt(1).toString();%>
                                <%=asignaS1%> <br>
                                <%}

                                    //}%>
                            </td>

                            <!--%if (!co1.equals(com11)) {%-->
                            <%if (asigna_exaM.size() > 0) {%>

                            <td width="240"> 
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

                            <%if (co1.equals(com11)||(co1.equals("B")&&com11.equals("M"))||(co1.equals("M")&&com11.equals("B"))) {%>
                        <input name="matematicas" type="hidden"  value="0">
                        <td width="70"> <div align="center">
                                <input type="radio" disabled align="center" name="matematicas" value="1"></div>
                        </td>
                        <td width="70"> <div align="center">
                                <input type="radio" disabled align="center" name="matematicas" value="0" checked></div>
                        </td>
                        </tr>
                        <% } else if(datos.elementAt(1).equals("264") && (co1.equals("B") && com11.equals("M") || co1.equals("M") && com11.equals("B"))){%>
                        <input name="matematicas" type="hidden"  value="0">
                        <td width="70"> <div align="center">
                                <input type="radio" disabled align="center" name="matematicas" value="1"></div>
                        </td>
                        <td width="70"> <div align="center">
                                <input type="radio" disabled align="center" name="matematicas" value="0" checked></div>
                        </td>
                        </tr>
                        
                        <% } else {%>
                        <td width="70"> <div align="center">
                                <input type="radio" name="matematicas" value="1"></div>
                        </td>
                        <td width="70"> <div align="center">
                                <input type="radio" name="matematicas" value="0"></div>
                        </td>
                        </tr>
                        <%}%>
                        <!--%if (!co3.equals(com33)) {%-->

                        <tr> <td width="100">FISICA</td>
                            <td width="240"> 
                                <%String asignaturaFS1 = asigna_SaberF.elementAt(2).toString();
                                    String asignaturaFS2 = asigna_SaberF.elementAt(3).toString();%>
                                <% Vector nomasignaturasSaberF = bd.nomasignaturasExamen(asignaturaFS1, asignaturaFS2, oout);
                                    for (int j = 0; j < nomasignaturasSaberF.size(); j++) {%>
                                <% Vector nombreasig = (Vector) nomasignaturasSaberF.elementAt(j);
                                    String asignaS1 = nombreasig.elementAt(0).toString();
                                    // String asigna2 = nombreasig.elementAt(1).toString();%>
                                <%=asignaS1%> <br>
                                <%}

                                    //}%>
                            </td>

                            <%  if (asigna_exaF.size() > 0) {
                            %>

                            <td width="240"> 
                                <% String asignatura1 = asigna_exaF.elementAt(2).toString();
                                    String asignatura2 = asigna_exaF.elementAt(3).toString();%>
                                <% Vector nomasignaturasExamen = bd.nomasignaturasExamen(asignatura1, asignatura2, oout);
                                    for (int j = 0; j < nomasignaturasExamen.size(); j++) {%>
                                <% Vector nombreasig = (Vector) nomasignaturasExamen.elementAt(j);
                                    String asigna1 = nombreasig.elementAt(0).toString();%>
                                <%=asigna1%> <br>
                                <%}
                                    }%>
                            </td>

                            <%if (co3.equals("B") && com33.equals("M") || co3.equals("M") && com33.equals("B") || co3.equals(com33)) {%>
                        <input name="fisica" type="hidden"  value="0">
                        <td width="70"> <div align="center">
                                <input type="radio" disabled name="fisica" value="1"></div>
                        </td>
                        <td width="70"> <div align="center">
                                <input type="radio" disabled name="fisica" value="0" checked></div>
                        </td>
                        </tr>

                        <% } else {%>
                        <td width="70"> <div align="center">
                                <input type="radio"  name="fisica" value="1"></div>
                        </td>
                        <td width="70"> <div align="center">
                                <input type="radio"  name="fisica" value="0"></div>
                        </td>
                        </tr>
                        <%}
                        //EL CODIGO DE QUIMICA NO SE EJECUTA POR RENOVACION CURRICULAR
                        Boolean Quimica=false;
                        if(Quimica){
                                            %>
                                            <tr> 
                                                <td width="100">QUIMICA</td>
                                                <td width="240"> 
                                                    <%String asignaturaQS1 = asigna_SaberQ.elementAt(2).toString();
                                                        String asignaturaQS2 = asigna_SaberQ.elementAt(3).toString();%>
                                                    <% Vector nomasignaturasSaberQ = bd.nomasignaturasExamen(asignaturaQS1, asignaturaQS2, oout);
                                                        for (int j = 0; j < nomasignaturasSaberQ.size(); j++) {%>
                                                    <% Vector nombreasig = (Vector) nomasignaturasSaberQ.elementAt(j);
                                                        String asignaS1 = nombreasig.elementAt(0).toString();
                                                        // String asigna2 = nombreasig.elementAt(1).toString();%>
                                                    <%=asignaS1%> <br>
                                                    <%}

                                                        //}%>
                                                </td>
                                                <!--%if (!co5.equals(com55)) {%-->
                                                <% if (asigna_exaQ.size() > 0) {%>

                                                <td width="240"> 
                                                    <%String asignatura1 = asigna_exaQ.elementAt(2).toString();
                                                        String asignatura2 = asigna_exaQ.elementAt(3).toString();%>
                                                    <% Vector nomasignaturasExamen = bd.nomasignaturasExamen(asignatura1, asignatura2, oout);
                                                        for (int j = 0; j < nomasignaturasExamen.size(); j++) {
                                                            Vector nombreasig = (Vector) nomasignaturasExamen.elementAt(j);
                                                            String asigna1 = nombreasig.elementAt(0).toString();%>
                                                    <%=asigna1%> <br>
                                                    <%}
                                                        }%>
                                                </td>
                                                <%if (datos.elementAt(1).equals("264")) {%>
                                                 <input name="quimica" type="hidden"  value="0">
                                            <td width="70">  <div align="center">
                                                <input type="radio" disabled  name="quimica" value="1"></div>
                                            </td>
                                            <td width="70">  <div align="center">
                                                    <input type="radio" disabled  name="quimica" value="0" checked></div>
                                            </td>
                                            </tr>
                                                <%}else if (co5.equals("B") && com55.equals("M") || co5.equals("M") && com55.equals("B") || co5.equals(com55)) {%>
                                            <input name="quimica" type="hidden"  value="0">
                                            <td width="70">  <div align="center">
                                                <input type="radio" disabled  name="quimica" value="1"></div>
                                            </td>
                                            <td width="70">  <div align="center">
                                                    <input type="radio" disabled  name="quimica" value="0" checked></div>
                                            </td>
                                            </tr>
                                            <% } else {%>
                                            <td width="70"> <div align="center">
                                                    <input type="radio"  name="quimica" value="1"></div>
                                            </td>
                                            <td width="70"> <div align="center">
                                                    <input type="radio"  name="quimica" value="0"></div>
                                            </td>
                                            </tr>

                                            <%}
                        }
                            //}
                        } else if (datos.elementAt(1).equals("18") || datos.elementAt(1).equals("19")) {%>
                        <input name="fisica" type="hidden"  value="0">
                        <input name="quimica" type="hidden"  value="0">
                        <tr> <td width="100">MATEMATICAS</td>
                            
                            <td width="240"> 
                                <%String asignaturaS1 = asigna_SaberM.elementAt(2).toString();
                                    String asignaturaS2 = asigna_SaberM.elementAt(3).toString();%>
                                <% Vector nomasignaturasSaber = bd.nomasignaturasExamen(asignaturaS1, asignaturaS2, oout);
                                    for (int j = 0; j < nomasignaturasSaber.size(); j++) {%>
                                <% Vector nombreasig = (Vector) nomasignaturasSaber.elementAt(j);
                                    String asignaS1 = nombreasig.elementAt(0).toString();
                                    // String asigna2 = nombreasig.elementAt(1).toString();%>
                                <%=asignaS1%> <br>
                                <%}

                                    //}%>
                            </td>
                            
                            
                                  <%if (asigna_exaM.size() > 0) {%>

                            <td width="240"> 
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

                            <%if (co1.equals(com11)) {%>
                        <input name="matematicas" type="hidden"  value="0">
                        <td width="70"> <div align="center">
                                <input type="radio" disabled align="center" name="matematicas" value="1"></div>
                        </td>
                        <td width="70"> <div align="center">
                                <input type="radio" disabled align="center" name="matematicas" value="0" checked></div>
                        </td>
                        </tr>
                        <% } else {%>
                        <td width="70"> <div align="center">
                                <input type="radio" name="matematicas" value="1"></div>
                        </td>
                        <td width="70"> <div align="center">
                                <input type="radio" name="matematicas" value="0"></div>
                        </td>
                        </tr>
                        <%}%>

                          
                        <%}%>

                    </table>
                    <p>&nbsp;</p>
                    <div class="textoimpremas">
                        <p align="left">Tenga en cuenta que dependiendo del programa, estas asignaturas no necesariamente deberán ser cursadas en su primera matrícula.</p>
                        <br><br>

                        <p align="left">&nbsp;</p>
                    </div>
                    <div>
                        <input class="boton" type="submit" name="Submit" value="Siguiente"  onclick="return validar();">

                    </div>


                </form>
                <div align="center"> 
                    <input class="boton" type="submit" name="Submit" value="Salir"  onClick="location.href = 'http://www.escuelaing.edu.co'">

                    <input class="boton" type="submit" name="Submit" value="Regresar"  onClick="location.href = 'ConsultaExamen?documento=<%=docEst%>'">
                </div>


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
                        </span> 
                        
                        <span class="direccion">
                            AK.45 No.205-59 (Autopista Norte) costado occidental<br/>
                            Contact Center: +57(1) 668 3600<br/>
                            Línea Nacional Gratuita: 018000112668<br/>
                            www.escuelaing.edu.co<br/>
                            Bogotá, D.C. - Colombia<br/>
                        </span>
                    
                    </footer></p>


                    </body>
                    </html>
