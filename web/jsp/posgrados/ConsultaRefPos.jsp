<%-- 
    Document   : ConsultaRef
    Created on : 9/09/2011, 03:40:43 PM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% String docEst = request.getParameter("doc");
        configeci.configuracion confEci = new configeci.configuracion();
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        //confEci.getPeriodo()
        Vector consulta = bd.Referencia(docEst, oout, confEci.getPeriodo());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Consulta N�mero de Referencia</title>
    </head>
    <body>
        <%if (consulta.size() <= 0) {%>
        <h3><center> No existen registros con este n�mero de documento, por favor verifique e intente nuevamente.<br> Recuerde que debe ingresar el n�mero con el que solicit� referencia.</center></h3>

        <%} else {%>
        <h3><center>Aspirante: <%=consulta.elementAt(1)%></center></h3>
        <br> <h3> <center>Su n�mero de referencia es:     <%=consulta.elementAt(0)%></center> </h3>
        <%}%>
    </body>
</html>
