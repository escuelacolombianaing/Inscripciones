<%-- 
    Document   : Documentos
    Created on : 13/09/2011, 10:14:31 AM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Consulta Documentación</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/tablas.css"/>
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <script language="JavaScript" type="text/JavaScript">
             
            <!--
            function validar() {

                if(document.forms.formegre.doc.value == ""){
                    alert("Por favor ingrese su documento de identificación");
                    document.formegre.doc.style.backgroundColor= '#ffcc00';
                    document.formegre.doc.focus();
                    return false;
                }
            }
            //-->
        </script>
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="Consulta Documentación" />
        </jsp:include>
        <form action="DocumentosPregrado" method="POST" name="formegre" id="formegre">
            <input type="hidden" name="id_evento"  value="13">
            <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <form action="ConsultaRef" method="POST" name="formegre" id="formegre">
                        <input type="hidden" name="id_evento"  value="13">
                        <div class="col-xs-12 col-md-5 col-md-offset-1">	
                            <p><strong>Documento Identidad&nbsp; <br>(Sin puntos, ni comas ni guiones)&nbsp; </strong></div>
                        <div class="col-xs-80 col-md-2">
                            <div class="form-group espaciado">
                                <strong> 
                                    <input type="text" name="doc"  size="12" class="form-control" ></strong>
                            </div>
                        </div>
                        <div class="row">
                        <div class="col-xs-12 col-md-2"></div>
                        <div class="col-xs-12 col-md-9">
                            <div class="submit">
                                <input class="btn btn-primary btn-lg" type="submit" value="Enviar Datos" onClick="javascript: return validar();"/>
                                 
                            </div>
                          
                        </div><div class="col-xs-12 col-md-4"></div>								
                    </div>
                </div>
            </div></div>
           
        </form>

    </body>
</html>