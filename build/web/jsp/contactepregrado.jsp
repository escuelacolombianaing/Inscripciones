<%-- 
    Document   : contactepregrado
    Created on : 3/09/2010, 09:51:04 AM
    Author     : lrodriguez
--%>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%   BDadmisiones bd = new BDadmisiones();
        PrintWriter oout = response.getWriter();
        String programa = request.getParameter("programa");
        String nombres = request.getParameter("nombre");
        String grado = request.getParameter("grado");
        String fechagrad = request.getParameter("fechagrad");
        String colegio = request.getParameter("colegio");
        String ciudad = request.getParameter("ciudad");
        String tel = request.getParameter("tel");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        String comentarios = request.getParameter("comentarios");
        int respuesta = bd.contactenos(programa, nombres, grado, fechagrad, colegio, ciudad, tel, celular, email, comentarios, oout);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <title>Contáctenos Pregrado</title>
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE INFORMACIÓN PROGRAMAS DE PREGRADO" />
        </jsp:include>
        <%if (respuesta > 0) {%>
        <P>
        <CENTER>Su solicitud ha sido enviada exitosamente, pronto le estaremos contactando</CENTER>
        <%} else {%>
        <CENTER>Sus datos no fueron registrados, por favor revise que esté ingresando todos los campos</CENTER>
        <%}%>
    </body>
</html>
