
<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    
    String error = request.getParameter("error");
    String snp = request.getParameter("snp");
    String tip_doc=request.getParameter("tip_doc");
    String doc=request.getParameter("doc");

%>
<html>
    <head>
        <title>Admisi�n a Programas de Pregrado</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">

    </head>

    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LOS PROGRAMAS ACAD�MICOS DE PREGRADO" />           
        </jsp:include>
        <div align="center">
          
            <p>
            <center><b>	

                    <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                            <p align="center">Como es de su conocimiento su Examen Saber11 con c�digo SNP <%=snp%> para el tipo de documento <%=tip_doc%> y n�mero de documento <%=doc%>, reporta  <%=error%>  por tal motivo no es posible dar continuidad a su admisi�n. Para mayor informaci�n comun�quese con el ICFES a la l�nea local 4841410 o a la l�nea nacional gratuita 018000519535.</b></p>
                        </div>
                    </div>
                    </div>
            </center>

            
           

    </body>
</html>
