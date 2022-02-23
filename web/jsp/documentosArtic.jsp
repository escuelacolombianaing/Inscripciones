<%-- 
    Document   : documentosArtic
    Created on : 28/04/2014, 02:32:59 PM
    Author     : Lucero
--%>

<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
    <%

String titulo = new String("");
        titulo = "Cargue Documentación";
        configeci.configuracion confEci = new configeci.configuracion();
        response.setHeader("Cache-Control", "no-cache");

        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        int ban = 0;
        String tipoest = request.getParameter("tipoest");
//Convertir el dato String a Date para compararlo mas adelante.
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String fechaActual = formatter.format(hoy);%>
<html>
    <head>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Cargar Documentación</title>
    </head>
    <body>
       <jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="<%=titulo%>" />
</jsp:include>

<form action="DocumentacionArt?on=n&spath=spath" method="POST" name="formvrp" id="formvrp">
<table border="0" cellpadding="0" cellspacing="2" width="50%" align="center" class="textocom">
  <tr> 
    <td colspan="3"> 

      <p align="center" ><b><font color="#000000" size="2">&iexcl;Bienvenido al 
        env&iacute;o EN LINEA de documentos!<br>
        Es f&aacute;cil, seguro y puede hacerlo usted mismo<br>
        Sin gastar tiempo en desplazamientos o haciendo filas</font></b></p>
      <p align="left" ><br>
        <font color="#000000" size="2">Por este v&iacute;nculo o link debe enviar 
        &uacute;nicamente los documentos correspondientes al proceso de ARTICULACIÓN, que son:<br>
        </p>
      <ul>
        <li> Los certificados de notas desde 8 hasta lo que lleven de grado 11.</li>
        <li>Certificado del colegio presentando al aspirante.</li>
        <li>Documento de Identidad.</li>
        <li>Carne del colegio</li>
        <li>Eps</li>
        <li>Recibo de pago <br>
        </li>
      </ul>
      <p align="center"><b><font color="#000000" size="2">PASOS PARA ENVIAR SUS 
        DOCUMENTOS &quot;EN LINEA&quot;</font></b></p>
      <p><font color="#000000" size="2">1. Re&uacute;na todos los documentos anteriores.<br>
        2. Escanee la totalidad de los documentos en formato PDF. Debe obtener 
        UN SOLO archivo de VARIAS PAGINAS.<br>
        3. Digite el n&uacute;mero del documento de identidad del aspirante, sin 
        puntos ni guiones<br>
        4. Ubique el archivo y env&iacute;elo </font><b><br>
        </b> </p>
    </td>
  </tr>
  <tr  bgcolor="#F3F3F3"> 
    <td width="50%" height="38"><strong><font size="3">Documento Identidad&nbsp; 
      <br>
      (Sin puntos, ni comas ni guiones)&nbsp;</font></strong></td>
    <td width="50%" height="38"><strong> 
      <input type="text" name="doc" size="15" class="campotext">
      </strong> 
      <input type="submit" value="Enviar" name="B1"  class="boton" onClick="javascript: return validar();">
    </td>
  </tr>
  <tr  bgcolor="#F3F3F3"> 
    <td colspan="2" height="38"> 
      <p align="center"><strong><font size="2"><b>TIPS para tener en cuenta:</b></font></strong></p>
      <ul>
        <li><font size="2">No env&iacute;e documentaci&oacute;n incompleta ya 
          que no se podr&aacute; iniciar el proceso<br>
          </font></li>
        <li><font size="2">El sistema s&oacute;lo acepta archivos en formato PDF. 
          <br>
          </font></li>
        <li><font size="2">Debe grabar UN SOLO ARCHIVO con la totalidad de los 
          documentos de admisi&oacute;n y UN SOLO ARCHIVO con la totalidad de 
          los documentos de liquidaci&oacute;n.<br>
          </font></li>
        <li><font size="2">Si env&iacute;a un documento a la vez, cada nuevo archivo 
          borrar&aacute; el archivo anterior. Por ejemplo, un archivo con el documento 
          de identidad, otro archivo con el carne del colegio,...<br>
          </font></li>
        <li><font size="2">Al escanear h&aacute;galo preferiblemente en tonos 
          de grises.<br>
          </font></li>
        <li><font size="2">No le coloque claves o contrase&ntilde;as a los archivos<br>
          </font></li>
        <li><font size="2">Si tiene sus documentos en otros formatos (JPG, TIFF) 
          usted mismo puede convertirlos a PDF r&aacute;pida y gratuitamente:</font> 
          <ul>
            <li><font size="2">Convertir un archivo cualquiera en un archivo PDF: 
              http://pdfcreator.uptodown.com/ <br>
              </font></li>
            <li><font size="2">Convertir varios archivos en un s&oacute;lo PDF: 
              http://www.ilovepdf.com/es/ </font></li>
            <li><font size="2"> Para visualizar archivos PDF necesita tener instalado 
              Adobe Reader: http://get.adobe.com/es/reader/ </font></li>
          </ul>
        </li>
      </ul>
      <p>&nbsp;</p>
    </td>
  </tr>
  <tr  bgcolor="#F3F3F3"> 
    <td colspan="2" height="38"> 
      <div align="center"> 
        <p align="left">&nbsp;</p>
      </div>

  <!-- <tr bgcolor="#F3F3F3">
      <td  bgcolor="#F3F3F3" width="50%"><div align="right"><p><strong>No.&nbsp;<BR> Referencia&nbsp; </strong></div></td>
      <td  bgcolor="#F3F3F3" width="50%"><strong><input type="text" name="ref" size="10" class="campotext"></strong></td>
    </tr>-->
</table>
</form>