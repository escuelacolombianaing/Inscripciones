<%-- 
    Document   : ValidarSimulacion
    Created on : 23/09/2009, 09:54:32 AM
    Author     : lrodriguez
--%>

<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
        String idprog = request.getParameter("idprog");
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        configeci.configuracion confEci = new configeci.configuracion();
        String nivel1 = request.getParameter("nivel1");
        String nivel2 = request.getParameter("nivel2");
        String nivel3 = request.getParameter("nivel3");
        String nivel4 = request.getParameter("nivel4");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Asignaturas según validación</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SIMULACION CAMBIO DE NIVELES" />
        </jsp:include>
        <%Vector asignaturas = bd.Niveles(idprog,confEci.getPeriodo(), oout);%>
        <% if (idprog.equals("13") || idprog.equals("14") || idprog.equals("15") || idprog.equals("17")) {%>
        <tr>

            <td ><b>Asignaturas a cursar:</b>
                <p>
                <%  for (int k = 0; k < asignaturas.size(); k++) {
         String niveles = nivel1 + nivel2 + nivel3;
         Vector nivelasigna = (Vector) asignaturas.elementAt(k);
         String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2));
         if (niveles.equals(baseicfes)) {
             Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
                <%  for (int p = 0; p < nomasigna.size(); p++) {
                        out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%> <br>
                <%}
         }
     }%>
            </td>
        </tr>
        <%} else if (idprog.equals("16") || idprog.equals("20") || idprog.equals("260")) {%>

        <tr>

            <td ><b>Asignaturas a cursar:</b>
                <p>
                <%  for (int k = 0; k < asignaturas.size(); k++) {
         String niveles = nivel1 + nivel2 + nivel3 + nivel4;
         Vector nivelasigna = (Vector) asignaturas.elementAt(k);
         String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2) + String.valueOf(nivelasigna.elementAt(3)));
         if (niveles.equals(baseicfes)) {
             Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
                <%  for (int p = 0; p < nomasigna.size(); p++) {
                        out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%> <br>
                <%}
         }
     }%>
            </td>
        </tr>

        <%} else if (idprog.equals("18") || idprog.equals("19")) {%>

        <tr>
            <td> <b>Asignaturas a cursar:</b>
                <p>
                <%  for (int k = 0; k < asignaturas.size(); k++) {
         String niveles = nivel1 + nivel3;
         Vector nivelasigna = (Vector) asignaturas.elementAt(k);
         String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(2));
         if (niveles.equals(baseicfes)) {
             Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
                <%  for (int p = 0; p < nomasigna.size(); p++) {
                        out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%> <br>
                <%}
         }
     }%>
            </td>
        </tr>
        <%}%>
    </body>
</html>
