<%-- 
    Document   : Validacion
    Created on : 15/01/2013, 12:03:16 PM
    Author     : Lucero
--%>

<%
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
       // BDadmisiones admision = new BDadmisiones();
        String idevento= request.getParameter("idevento");%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Validación</title>
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
<p> <br>
        
<div align="center"><img src="img/suelos.jpg" width="706" height="182" usemap="#m_CABEZOTE"></div>
        
<p>&nbsp;</p>
<table width="39%" border="0" align="center"  class="textocom" >
  <tr> 
    <td height="41" colspan="4"> 
      <center>
        <p><b>Por favor ingrese el documento registrado y la clave que le fu&eacute; 
          enviada en el momento de la inscripción. </b></p>
        <p>&nbsp;</p>
      </center>
    </td>
  </tr>
  <form name="form1" method="post" action="DocumentacionEventos">
    <tr> 
      <td width="28%"> 
        <div align="right">Documento:</div>
      </td>
      <td width="19%"> 
        <div align="left">
          <input name="idevento" type="hidden"  value="<%=idevento%>">
          <input type="text" name="documento" size="12" maxlength="12">
        </div>
      </td>
      <td width="8%">
<div align="center">Clave:</div>
      </td>
      <td width="45%"> 
        <div align="left">
          <input type="text" name="clave" size="8" maxlength="8">
        </div>
      </td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <p>&nbsp;</p>
        <p align="center"> 
          <input type="submit" name="Submit" value="Enviar">
        </p>
      </td>
	  <tr>
	   
      <td colspan="6"> 
        <div align="center"> 
          <p align="left">La Escuela Colombiana de Ingenier&iacute;a Julio Garavito, 
            no se hace responsable de ninguna de las informaciones, opiniones 
            y conceptos t&eacute;cnicos que se emitan, publiquen o distribuyan 
            a trav&eacute;s de esta p&aacute;gina web o de las memorias de eventos 
            anteriores</p>
          <p>&nbsp;</p>
        </div>
        <div align="right"><a href="http://tycho.escuelaing.edu.co/contenido/encuentros-suelosyestructuras/index.html"><font size="2"><b>VOLVER</b></font></a></div>
      </td>
	  </tr>
   
  </form>
</table>
</body>
</html>
