<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%String titulo = new String("");
configeci.configuracion confEci = new configeci.configuracion();%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instrucciones</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body><jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
    
        </font></h1>
        <h1 align="center"><font size="3"><b><a href="http://www.escuelaing.edu.co/documentos/InstruccionesPS.doc">Instrucciones 
        para la Elaboraci&oacute;n de Horarios <%=confEci.getPeriodo()%> </a></b></font></h1>
        <b><center>Podrá realizar su horario el 12 de Enero de 2010 durante la jornada de inducción.</center></b>
        
       
    </body>
</html>
