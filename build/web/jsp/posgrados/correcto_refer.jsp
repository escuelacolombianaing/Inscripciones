<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>


<!doctype html>
<%
String nombre = "";
nombre = request.getParameter("nmb");
%>

<html>
<head>
<meta charset="iso-8859-1">
<title>FORMULARIO POSGRADO</title>
<link href="css/estilo-fomularios.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="container">
	<header>
    	<img src="img/banner_pos.jpg" width="100%" height="240"/>
    </header>
    <section>       	  
          <div id="formulario">
              <div id="error">Se carg� y guard� la informaci�n satisfactoriamente para el aspirante <%=nombre%>.</div>
          </div>
      </section>
    <footer>
    	<span class="programa">
            Escuela Colombiana de Ingenier�a Julio Garavito
            <br/>Formulario Posgrados
        </span>
    	<span class="direccion">
            AK.45 No.205-59 (Autopista Norte)<br/>
            PBX: +57(1) 668 3600<br/>
            Call Center: +57(1) 668 3600<br/>
            L�nea Nacional Gratuita: 018000112668<br/>
            www.escuelaing.edu.co<br/>
            Bogot�, D.C. - Colombia<br/>
        </span>
    </footer>
</div>
</body>
</html>
