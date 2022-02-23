<%-- 
    Document   : InscribeGestion
    Created on : 15/05/2012, 11:35:21 AM
    Author     : lrodriguez
--%>

<%@ page contentType="text/html; charset=iso-8859-1" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        BDadmisiones admision = new BDadmisiones();
        PrintWriter oout = response.getWriter();
        String nombres = request.getParameter("nombres");
        String ape1 = request.getParameter("ape1");
        String ape2 = request.getParameter("ape2");
        String telefono = request.getParameter("telefono");
        String doc = request.getParameter("doc_est");
        String empresa = request.getParameter("empresa");
        String correo = request.getParameter("correo");
        Vector valida = admision.ValidaGestion(doc);
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date hoy = new Date();
        if (valida.size()<=0){
          int inscrito = admision.Gestion(doc, nombres, ape1, ape2, correo, telefono, empresa, oout); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>III Jornada en Gestión de Información</title>
    </head>
    <body>
                
                <% response.sendRedirect("gestion?nombres=" + nombres + "&ape1=" + ape1 + "&ape2=" + ape2 + "&telefono=" +telefono + "&doc=" +doc + "&empresa=" + empresa +  "&correo=" + correo );%>

  <!--<center>Su solicitud de inscripción a la II Jornada en Gestión de Información fué recibida.</center>-->
   
            <%} else {%>
            <center>Usted ya se encuentra inscrito al evento.</center>
            <%}%>
       
    </body>
</html>
