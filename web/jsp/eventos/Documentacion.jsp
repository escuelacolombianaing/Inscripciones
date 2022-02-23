<%-- 
    Document   : Documentacion
    Created on : 16/01/2013, 10:09:07 AM
    Author     : Lucero
--%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            BDadmisiones admision = new BDadmisiones();
            String doc = request.getParameter("documento");
            // String correo = request.getParameter("mail");
            String clave = request.getParameter("clave");
            String idevento = request.getParameter("idevento");
            String docinsc = "";
            String mailins = "";
            String claveins = "";

            Vector inscritos = admision.ValidaExternos(doc, idevento);
            if (inscritos.size() > 0) {
                docinsc = inscritos.elementAt(0).toString();
                //mailins = inscritos.elementAt(1).toString();
                claveins = inscritos.elementAt(2).toString();
            } else {%>
<center Su documento no se encuentra registrado en nuestra base de datos. Por favor verifique e intente nuevamente.</center>
<%}%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Documentación</title>
    </head>
    <body>
        <% if (doc.equals(docinsc) && (clave.equals(claveins))) {

                        response.sendRedirect("http://tycho.escuelaing.edu.co/contenido/encuentros-suelosyestructuras/lista-encuentros.html");
                    } else {%>
        <center>Los datos ingresados no corresponden a los registrados en el proceso de inscripción. Por favor verifique e intente nuevamente.</center>

        <%}%>

    </body>
</html>
