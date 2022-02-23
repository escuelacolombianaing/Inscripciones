<%-- 
    Document   : PostulaBeca
    Created on : 24/08/2010, 08:34:12 AM
    Author     : lrodriguez
--%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%String postula = request.getParameter("beca");
            String existepos = request.getParameter("fac_cor");
            String idEst = request.getParameter("idEst");
            PrintWriter oout = response.getWriter();
            BDadmisiones bd = new BDadmisiones();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Postulación a Beca</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="POSTULACION A BECAS JULIO GARAVITO ARMERO" />
        </jsp:include>

        <!--Si ya se postuló fac_cor queda en 0 no puede volver a postularse ni cambiar esta decisión es decir ingresar nuevamente y seleccionar No-->
        <% if (existepos.equals("0")) {%>
        <p>&nbsp;</p><p align="center"><b>Usted ya se encuentra postulado para ser beneficiario de las Becas
                JULIO GARAVITO ARMERO. </b></p>
        <p align="center"><b><a href="http://www.escuelaing.edu.co/es/programas/admisiones/pregrado?grupo=4#info">CONSULTE AQUI </a>las fechas de citación a entrevistas para continuar
                con este proceso. </b> <br>
            <!--Si desea postularse y fac_cor es diferente de 0 permite hacer la postulación-->
            <% } else if (postula.equals("1") && !existepos.equals("0")) {
             int respuesta = bd.becas(idEst, oout);%>
        <p>&nbsp;</p><p align="center"><b>Usted quedó postulado para ser beneficiario de las Becas
                JULIO GARAVITO ARMERO. </b></p>
        <p align="center"><b> <a href="http://www.escuelaing.edu.co/es/programas/admisiones/pregrado?grupo=4#info">CONSULTE AQUI </a> las fechas de citación a entrevistas para continuar
                con este proceso. </b> <br>
        </p>
        <p align="center">&nbsp;</p>
        <p align="center"><em>Secretar&iacute;a General - Admisiones </em>
            <!--Si no desea postularse mensaje de proceso normal-->
            <%} else {%>
            Usted deberá seguir el proceso normal de admisión.
            <%}%>
        </p>
    </body>
</html>
