<%-- 
    Document   : examen
    Created on : 8/07/2015, 10:49:31 AM
    Author     : Lucero
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="iso-8859-1">
<title>Examen Conocimiento</title>

<link href="css/estilo-resultadoconocimiento.css" rel="stylesheet" type="text/css" media="all">
</head>

<body>
<div id="container">
	<header>
    	<div class="logoescuela">
        <img src="img/logo-ESCUELA.svg"/>
        </div>
            <img src="img/banner.jpg" />
        <div class="osiris">Desarrollado por: Direcci&oacute;n de Tecnolog&iacute;a Osiris y Direcci&oacute;n de Comunicaciones y Mercadeo</div>
    </header>
    <section>
         <div id="formulario">
        <h1>Login</h1><br/>
        <!--RespuestaExamen-->
		  <form name="form1" method="post" action="ConsultaExamen">
		    <p>
		      <input name="documento" type="text"/>
		      <input name="password" type="text" />
              <p style="font-family:'Trebuchet MS', Arial, Helvetica, sans-serif; font-size:12px; color:#999">*Digite su documento de identidad en los dos campos</p>
              <br/>
		      <input name="boton" type="submit" value="Enviar"/>
		    
                  </form>
        </div>
    </section>
        <footer>
    	<span class="programa">
            Escuela Colombiana de Ingeniería Julio Garavito
        </span>
    	<span class="direccion">
            AK.45 No.205-59 (Autopista Norte) costado occidental<br/>
            Contact Center: +57(1) 668 3600<br/>
            Línea Nacional Gratuita: 018000112668<br/>
            www.escuelaing.edu.co<br/>
            Bogotá, D.C. - Colombia<br/>
        </span>
    </footer>
</div>
</body>
</html>
