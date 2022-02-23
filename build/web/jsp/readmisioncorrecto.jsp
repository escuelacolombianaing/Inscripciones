<%-- 
    Document   : readmisioncorrecto
    Created on : 1/09/2009, 12:15:38 PM
    Author     : lrodriguez
--%>
<%@page contentType="text/html"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
        HttpSession sesion;
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        String nsol = request.getParameter("solicitud");
        String nombre = request.getParameter("nombre");
        String prog = request.getParameter("prog");
        String acud = request.getParameter("acud");
        String documento = request.getParameter("docestud");
        String tipoest = request.getParameter("tipoest");
        configeci.configuracion confeci = new configeci.configuracion();
        Vector pregrados = bd.pregrado(oout, confeci.getPeriodo(), tipoest);

// String fecread= confeci.getFecRead();
%>

<html>
    <head>
        <title>Formulario Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <!--<link REL="stylesheet" TYPE="text/css" HREF="StyleSheet1.css"><script language="JavaScript" src="DatGenPost_Valid.js" type="text/javascript"></script>-->
    </head>

    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confeci.getPeriodo()%>" />
            <jsp:param name="titulo" value="ASPIRANTES A PRIMER SEMESTRE " />
        </jsp:include>
        <%SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date currentTime_1 = new Date();
        String dateString = formatter.format(currentTime_1); %>
       <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-9">
        
                    <p>
                    <p align="left"><b>Solicitud de readmisión No: <%=nsol%></b></p>
                    <p align="left"><b>Nombre del aspirante: <%=nombre%></b></p>
                    <p align="left"><b>Programa acad&eacute;mico: <%=prog%></b></p>
                    <p align="left"><b>Fecha: <%=dateString%></b>
                    <p align="left">La respuesta a su solicitud deberá consultarla por la página web. </p>
               
        <form>
            <p align="left">&nbsp;</p>
            <p align="center"><INPUT type=button name=print value="Imprimir" onClick="javascript:window.print()" class="textoimpremas">&nbsp;&nbsp;<input type="button" value="Cerrar ventana" onclick="window.close()" class="textoimpremas" >
        </form>
                    </div>
            </div>
       </div>
    </body>
</html>
