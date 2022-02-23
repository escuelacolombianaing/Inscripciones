<%-- 
    Document   : Colegios
    Created on : 9/04/2015, 04:04:03 PM
    Author     : Lucero
--%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            BDadmisiones admision = new BDadmisiones();
            String colegio = request.getParameter("campo18");     
            String ref = request.getParameter("ref");
            String documento = request.getParameter("doc_est");
            
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Colegios</title>
    </head>
    <body>
         
        <%Vector colegios = admision.Colegios(colegio) ;%>
        <!%=colegios.elementAt(0)%>
          <%if  (colegios.size()>0) {
               response.sendRedirect("FormularioPregrado?doc=" + documento + "&ref="+ref + "&col=" + colegios.elementAt(0) + "&idcol=" + colegio );

             
          }else {%>
    <center>
        Por favor verifique el código del colegio.
    </center>
          <%}%>
           </body>
</html>
