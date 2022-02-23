<%-- 
    Document   : temporal
    Created on : 18/08/2017, 11:45:33 AM
    Author     : Mario Mart�nez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <form action="ImpDatosICFES" method="Post">
           
            Tipo Documento:  <input type="text" name="TipoDoc">
            Documento:       <input type="text" name="Doc">
            Codigo ICFES AC: <input type="text" name="SNP">
            <input type="submit">
            
        </form>
        
    </body>
</html>
