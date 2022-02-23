<%-- 
    Document   : ValidaDoc
    Created on : 6/04/2018, 04:03:43 PM
    Author     : andres.rojas
--%>

<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
try{
String titulo = new String("");
        titulo = "Cargue Documentación Doctorado";
        configeci.configDoctorado confEci = new configeci.configDoctorado();
        response.setHeader("Cache-Control", "no-cache");

        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        int ban = 0;
        String tipoest = request.getParameter("tipoest");
//Convertir el dato String a Date para compararlo mas adelante.
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String fechaActual = formatter.format(hoy);%>
   
   <% String tipo= request.getParameter("tipo");%>
    
<html>
    <head>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Cargar Documentación Doctorado</title>
    </head>
    <body>
       <jsp:include page="encabezadoP">
        <jsp:param name="parametro" value="<%=confEci.getPeriodoSiguiente()%>" />
        <jsp:param name="titulo" value="<%=titulo%>" />
</jsp:include>

<form action="DocumentacionDoctorado?on=n&spath=spath" method="POST" name="formvrp" id="formvrp">
<input type="hidden" name="tipo"  value="<%=tipo%>">
<center>
  <table border="0" cellpadding="0" cellspacing="2" width="50%" align="center" class="textocom">
      <tr> 
        <td colspan="3"> 
          <p align="center" ><b><font color="#000000" size="2">&iexcl;Bienvenido 
            al env&iacute;o EN LINEA de documentos!<br>
            Es f&aacute;cil, seguro y puede hacerlo usted mismo<br>
            Sin gastar tiempo en desplazamientos o haciendo filas.</font></b></p>
          <p align="center" ><font color="#990000"><b><font size="3">Despu&eacute;s 
            de cargar sus documentos, puede verificar el estado al siguiente d&iacute;a 
            h&aacute;bil despu&eacute;s de la 1:00 p.m.</font></b></font><font size="3"><br>
            </font> </p>
          <blockquote>
            <p><font color="#000000" size="2">Por este v&iacute;nculo o link debe 
              enviar &uacute;nicamente los documentos de admisi&oacute;n, que 
              son:<br>
              </font> </p>
            <ul>
              <li><font color="#000000" size="2">Formulario impreso con fotografía 
                a color 3x4cm.</font></li>
              <li><font color="#000000" size="2">Carta de presentaci&oacute;n 
                del aspirante (1 p&aacute;gina m&aacute;ximo)</font></li>
              <li><font color="#000000" size="2">Hoja de vida resumida (2 p&aacute;ginas 
                m&aacute;ximo y sin anexos)</font></li>
              <li><font color="#000000" size="2">Fotocopia del documento de identidad 
                ampliada al 150%.</font></li>
              <li><font color="#000000" size="2">Fotocopia de la tarjeta profesional 
                de ingeniero</font></li>
              <li><font color="#000000" size="2">Fotocopia legible del diploma 
                o del acta de grado que acredite el grado profesional del aspirante</font></li>
              <li><font color="#000000" size="2"> Fotocopia del certificado de 
                notas de las calificaciones de pregrado que incluya el promedio 
                de la carrera.<br>
                </font></li>
              <li><font color="#000000" size="2"> Fotocopia del certificado de 
                notas de las calificaciones de pregrado que incluya el promedio 
                de la carrera.<br>
                </font></li>
              <li><font color="#000000" size="2"> Fotocopia de libreta militar<br>
                </font></li>
              <li><font color="#000000" size="2"> Fotocopia de Recibo de Pago de Inscripción<br>
                </font></li>
              <li><font color="#000000" size="2"> Esctiro de Motivación<br>
                </font></li>
              <li><font color="#000000" size="2"> Propuesta de Investigación<br>
                </font></li>
              <li><font color="#000000" size="2"> Soporte de Publicaciones Científicas<br>
                </font></li>
              <li><font color="#000000" size="2"> Resultado de Examen de Inglés<br>
                </font></li>
              <li><font color="#000000" size="2"> Examen Intitucional de Conocimientos y Competencias<br>
                </font></li>
              <li><font color="#000000" size="2"> Soportes de Financiamiento del Programa<br>
                </font></li>
            </ul>
            <p><b><font color="#000000" size="2">PASOS PARA ENVIAR SUS DOCUMENTOS 
              DE ADMISION &quot;EN LINEA&quot;</font></b></p>
            <p><font color="#000000" size="2">1. Re&uacute;na todos los documentos 
              anteriores.<br>
              2. Escanee la totalidad de los documentos en formato PDF. Debe obtener 
              UN SOLO archivo de VARIAS PAGINAS.<br>
              3. Digite el n&uacute;mero del documento de identidad del aspirante, 
              sin puntos ni guiones<br>
              4. Ubique el archivo y env&iacute;elo </font><b><br>
              </b> </p>
          </blockquote>
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
    <tr > 
      <td colspan="2" height="38"> 
        <p align="center"><strong><font size="2"><b>TIPS para tener en cuenta:</b></font></strong></p>
        <ul>
          <li><font size="2">No env&iacute;e documentaci&oacute;n incompleta ya 
            que no se podr&aacute; iniciar el proceso<br>
            </font></li>
          <li><font size="2">El sistema s&oacute;lo acepta archivos en 
            formato PDF. <br>
            </font></li>
          <li><font size="2">Debe grabar UN SOLO ARCHIVO con la totalidad 
            de los documentos de admisi&oacute;n.<br>
            </font></li>
          <li><font size="2">Si env&iacute;a un documento a la vez, cada 
            nuevo archivo borrar&aacute; el archivo anterior. <br>
            </font></li>
          <li><font size="2">Al escanear h&aacute;galo preferiblemente 
            en tonos de grises.<br>
            </font></li>
          <li><font size="2">No le coloque claves o contrase&ntilde;as a los archivos<br>
            </font></li>
          <li><font size="2">Si tiene sus documentos en otros formatos 
            (JPG, TIFF) usted mismo puede convertirlos a PDF r&aacute;pida y gratuitamente:</font>
            <ul>
              <li><font size="2">Convertir un archivo cualquiera en un 
                archivo PDF: http://pdfcreator.uptodown.com/ <br>
                </font></li>
              <li><font size="2">Convertir varios archivos en un s&oacute;lo 
                PDF: http://www.ilovepdf.com/es/ </font></li>
              <li><font size="2"> Para visualizar archivos PDF necesita 
                tener instalado Adobe Reader: http://get.adobe.com/es/reader/ 
                </font><b><br>
                </b> </li>
            </ul>
          </li>
        </ul>
      
  </table>
</center>
  <div align="center"><center>
      <p>&nbsp;</p>
  </center></div>

</form>

    </body>
</html>

<%
            } catch (Exception e) {
                Correo correo = new Correo();
                correo.enviar("Valida en Inscripciones", e.getMessage());
            }
%>
