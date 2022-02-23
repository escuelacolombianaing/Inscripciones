<%-- 
    Document   : nuevaclasificacion
    Created on : 30/09/2009, 10:23:45 AM
    Author     : lrodriguez
--%>


<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
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

        <%  String niveles = (String.valueOf(com1) + String.valueOf(com2) + String.valueOf(com3) + String.valueOf(com4) + String.valueOf(com5));

        int respuesta = bd.clasificacion(idEst, niveles, oout);%>
        <% if (com1.equals("B")) {
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

       } %>

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
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp; </td>
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
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
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
                    <td colspan="4">
                        <p>&nbsp;</p>
                        <p><b>Asignaturas que cursaría:</b></p>
                        <p>&nbsp;</p>
                    </td>
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
    </body>
</html>
