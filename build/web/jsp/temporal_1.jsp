<%-- 
    Document   : temporal
    Created on : 18/08/2017, 11:45:33 AM
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cargue Icfes</title>
    </head>
    <body>
        <h1></h1>
        
        <form action="ImpDatosICFES" method="Post">
           
            Tipo Documento:  <input type="text" name="TipoDoc">
            Documento:       <input type="text" name="Doc">
            Codigo ICFES AC: <input type="text" name="SNP">
            <input type="submit">
            
        </form>
        
    </body>
</html>
