<%-- 
    Document   : nuevaclasificacion
    Created on : 30/09/2009, 10:23:45 AM
    Author     : lrodriguez
--%>


<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties,java.text.SimpleDateFormat" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
        String idEst = request.getParameter("idEst");
        String com1 = request.getParameter("matematicas");
        String com2 = request.getParameter("filosofia");
        String com3 = request.getParameter("fisica");
        String com4 = request.getParameter("lenguaje");
        String com5 = request.getParameter("quimica");
        String clasifica1 = new String();
        String clasifica2 = new String();
        String clasifica3 = new String();
        String clasifica4 = new String();
        String clasifica5 = new String();
        String docEst = request.getParameter("docEst");
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        String prog = new String();
        String idprog = new String();
        String compararact = new String();
        configeci.configuracion confEci = new configeci.configuracion();

%>

<%Vector estudiante = bd.Admitidos(docEst, confEci.getPeriodo(), oout);%>
<%Vector asignaturas = bd.Niveles(estudiante.elementAt(1).toString(),confEci.getPeriodo(), oout);%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Clasificación Actual</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="ASPIRANTES A PRIMER SEMESTRE " />
        </jsp:include>

        <%String niveles = (String.valueOf(com1) + String.valueOf(com2) + String.valueOf(com3) + String.valueOf(com4) + String.valueOf(com5));
        //Se verifica que el estudiante ya este reclasificado
        if (estudiante.elementAt(4).equals(estudiante.elementAt(14))) {
            if (!niveles.equals(estudiante.elementAt(4))) {
                int respuesta = bd.clasificacion(idEst, niveles, oout);
                Date FechaActual = new Date();
                SimpleDateFormat Formato = new SimpleDateFormat("dd/MM/yy kk:mm:ss");
                int chek = bd.logreclasifica(idEst, niveles, oout );
             //   out.println(chek);
            }

            if (com1.equals("B")) {
                clasifica1 = "Básico";
            }

            if (com1.equals("M")) {
                clasifica1 = "Medio";
            }

            if (com1.equals("A")) {
                clasifica1 = "Alto";
            }
        %>

        <% if (com2.equals("B")) {
                clasifica2 = "Básico";
            }

            if (com2.equals("M")) {
                clasifica2 = "Medio";
            }

            if (com2.equals("A")) {
                clasifica2 = "Alto";
            }
        %>

        <% if (com3.equals("B")) {
                clasifica3 = "Básico";
            }

            if (com3.equals("M")) {
                clasifica3 = "Medio";
            }

            if (com3.equals("A")) {
                clasifica3 = "Alto";
            }
        %>

        <% if (com4.equals("B")) {
                clasifica4 = "Básico";
            }

            if (com4.equals("M")) {
                clasifica4 = "Medio";
            }

            if (com4.equals("A")) {
                clasifica4 = "Alto";
            }
        %>

        <% if (com5.equals("B")) {
                clasifica5 = "Básico";
            }

            if (com5.equals("M")) {
                clasifica5 = "Medio";
            }

            if (com5.equals("A")) {
                clasifica5 = "Alto";
            }
        %>

        <%
            if (estudiante.elementAt(1).equals("13")) {
                prog = "INGENIERIA CIVIL";
            } else if (estudiante.elementAt(1).equals("14")) {
                prog = "INGENIERIA ELECTRICA";

            } else if (estudiante.elementAt(1).equals("15")) {
                prog = "INGENIERIA DE SISTEMAS";

            } else if (estudiante.elementAt(1).equals("16")) {
                prog = "INGENIERIA INDUSTRIAL";


            } else if (estudiante.elementAt(1).equals("17")) {
                prog = "INGENIERIA ELECTRONICA";

            } else if (estudiante.elementAt(1).equals("18")) {
                prog = "ECONOMIA";

            } else if (estudiante.elementAt(1).equals("19")) {
                prog = "ADMINISTRACION DE EMPRESAS";

            } else if (estudiante.elementAt(1).equals("20")) {
                prog = "MATEMATICAS";

            } else if (estudiante.elementAt(1).equals("260")) {
                prog = "INGENIERIA MECANICA";

            }%>


        <table width="50%" border="0" align="center" class="textoimpremas">
            <tr>
                <td colspan="3">
                    <div align="right"><b>Nombre:</b></div>
                </td>
                <td><%=estudiante.elementAt(0)%></td>
            </tr>
            <tr>
                <td colspan="3">
                    <p align="right"><b>Programa:</b></p>
                </td>
                <td><%=prog%></td>
            </tr>
            <tr>
                <td colspan="4">
                    <div align="left">
                        <p>&nbsp;</p>
                        <p><b>Reclasificaci&oacute;n</b></p>
                    </div>
                </td>
            </tr>
            <form name="form1" method="post" action="NuevaClasificacion">
                <input type="hidden" name="idEst" value="<%=idEst%>">
                <tr>
                    <%if (estudiante.elementAt(1).equals("13") || estudiante.elementAt(1).equals("14") || estudiante.elementAt(1).equals("15") || estudiante.elementAt(1).equals("17")) {%>
                    <td>Matemáticas:</td>
                    <td><%= estudiante.elementAt(6)%></td>
                    <td><%=clasifica1%></td>
                </tr>
                <tr>
                    <td>F&iacute;sica:</td>
                    <td><%= estudiante.elementAt(8)%></td>
                    <td><%=clasifica3%></td>
                </tr>
                <tr>
                    <td>Lenguaje:</td>
                    <td><%=estudiante.elementAt(9)%></td>
                    <td><%=clasifica4%></td>
                </tr>

                <tr>
                    <td width="42%" colspan="2">
                        <p><b>Asignaturas que cursaría:</b></p>
                        <p>
                            <%  for (int k = 0; k < asignaturas.size(); k++) {
        String nivelesnvos = String.valueOf(com1) + String.valueOf(com2) + String.valueOf(com3);
        Vector nivelasigna = (Vector) asignaturas.elementAt(k);
        String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2));
        if (nivelesnvos.equals(baseicfes)) {
            Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
                        </p>
                        <p>
                            <%  for (int p = 0; p < nomasigna.size(); p++) {
                                    out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
                            <br>
                            <%}
        }
    }%>
                        </p>
                    </td>
                </tr>
                <tr>
                    <% } else if (estudiante.elementAt(1).equals("18") || estudiante.elementAt(1).equals("19")) {%>
                    <td>Matemáticas:</td>
                    <td><%= estudiante.elementAt(6)%></td>
                    <td><%=clasifica1%></td>
                </tr>
                <tr>
                    <td>Filosofía:</td>
                    <td><%= estudiante.elementAt(7)%></td>
                    <td><%=clasifica2%></td>
                </tr>
                <tr>
                    <td>Lenguaje:</td>
                    <td><%=estudiante.elementAt(9)%></td>
                    <td><%=clasifica4%></td>
                </tr>
                <tr>
                    <td width="42%" colspan="2">
                        <p>&nbsp;</p>
                        <p><b>Asignaturas que cursaría:</b> </p>
                        <p>
                        <%  for (int k = 0; k < asignaturas.size(); k++) {
        String nivelesn = String.valueOf(com1) + String.valueOf(com4);
        Vector nivelasigna = (Vector) asignaturas.elementAt(k);
        String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(2));
        if (nivelesn.equals(baseicfes)) {
            Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
                        <%  for (int p = 0; p < nomasigna.size(); p++) {
                                out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
                        <br>
                        <%}
        }
    }%>
                    </td>
                </tr>
                <tr>
                    <% } else if (estudiante.elementAt(1).equals("16") || estudiante.elementAt(1).equals("20") || estudiante.elementAt(1).equals("260")) {%>
                    <td>Matemáticas:</td>
                    <td><%= estudiante.elementAt(6)%></td>
                    <td><%=clasifica1%></td>
                </tr>
                <tr>
                    <td>Física:</td>
                    <td><%= estudiante.elementAt(8)%></td>
                    <td><%=clasifica3%></td>
                </tr>
                <tr>
                    <td>Lenguaje:</td>
                    <td><%=estudiante.elementAt(9)%></td>
                    <td><%=clasifica4%></td>
                </tr>
                <tr>
                    <td>Química</td>
                    <td><%=estudiante.elementAt(11)%></td>
                    <td><%=clasifica5%></td>
                </tr>
                <tr>
                    <td width="42%" colspan="2">
                        <p>&nbsp;</p>
                        <p><b>Asignaturas que cursaría:</b> </p>
                        <p>
                        <%  for (int k = 0; k < asignaturas.size(); k++) {
        String nivelesn = String.valueOf(com1) + String.valueOf(com3) + String.valueOf(com4) + String.valueOf(com5);
        Vector nivelasigna = (Vector) asignaturas.elementAt(k);
        String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2) + String.valueOf(nivelasigna.elementAt(3)));
        if (nivelesn.equals(baseicfes)) {
            Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
                        <%  for (int p = 0; p < nomasigna.size(); p++) {
                                out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
                        <br>
                        <%}
        }
    }%>
                    </td>
                    <td colspan="2">&nbsp; </td>
                </tr>
                <%}%>
                <tr>
                    <td colspan="4">
                        <p>&nbsp;</p>
                        <p><b>Tenga en cuenta que la reclasificaci&oacute;n estar&aacute; sujeta
                                a la aprobaci&oacute;n por parte del Decano. Luego de enviar sus Datos
                        no podr&aacute; volver a realizar este proceso.</b></p>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div align="center"> </div>
                    </td>
                </tr>
            </form>
        </table>
        <h1></h1>
        <%} else
            response.sendRedirect("Reclasificacion?idEst=" + idEst + "&docEst=" + docEst);%>
    </body>
</html>
