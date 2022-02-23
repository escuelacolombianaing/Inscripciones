<%-- 
    Document   : Consulta
    Created on : 21/03/2013, 09:37:21 AM
    Author     : Lucero
--%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            BDadmisiones admision = new BDadmisiones();
            String idevento = request.getParameter("idevento");
            String doc = request.getParameter("documento");
            Vector Datos = admision.ConsultaClave(doc, idevento);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Consulta Clave </title>
    </head>
    <body>
 <body>
     <div align="center"><img src="img/suelos.jpg" width="706" height="182" usemap="#m_CABEZOTE"></div>
<% if (Datos.size()>0){%>

<p>
        <center>Nombres: <%=Datos.elementAt(1)%> <%=Datos.elementAt(2)%> <%=Datos.elementAt(3)%> </center>

        <center> Clave:<%=Datos.elementAt(4)%></center>
        <%} else {%>
        <p>
        <center>
    <p>Su documento no se encuentra registrado en nuestra base de datos. Por favor 
      verifiquelo.</p>
   
  </center>
        <%}%>
		 
<p align="center"><a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/Validacion?idevento=225"><font size="2"><b>VOLVER</b></font></a></p>
    </body>
</html>
