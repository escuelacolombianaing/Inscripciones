<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>


<!doctype html>

<%
String val, mensaje = "";
int idprog = 0;

val = request.getParameter("id");
if(val.equals("0"))
    mensaje = "Error al generar y actualizar la infromaci�n del aspirante";
else if(val.equals("1"))
        mensaje = "El aspirante ya tiene cargada la informaci�n de las Referencias. Gracias.";
else if(val.equals("2"))
        mensaje = "Error al guardar la infromaci�n de la referencia en la Base de Datos.";
else if(val.equals("3"))
        mensaje = "Error, no se registro infromaci�n, hay datos del formularioi incompletos.";
else if(val.equals("4"))
        mensaje = "La informaci�n de su referencia ya fue guardada en el sistema, Gracias.";



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
              <div id="error"><%=mensaje%></div>
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
