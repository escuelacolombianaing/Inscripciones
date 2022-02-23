<%-- 
    Document   : Valida
    Created on : 19/08/2010, 10:19:07 AM
    Author     : lrodriguez
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
   <!--    Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);

        Date fechafin = new Date();
        String dato = new String(pregrados.elementAt(1).toString());
        String prog = new String(pregrados.elementAt(3).toString());
        String datofin = new String(pregrados.elementAt(2).toString());

        Date inicio = formatter.parse(dato);
        Date finall = formatter.parse(datofin);
        String X = formatter.format(inicio);
        String Y = formatter.format(finall);
        if (prog.equals(tipoest)) {
            if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y)) && (pregrados.elementAt(5).equals("1"))) {
                ban = 1;
            }
        }
-->
   <% String tipo= request.getParameter("tipo");
  
    if (tipo.equals("i")){
        titulo="Documentación para Inscripción";
      } else if (tipo.equals("f")){
             titulo="Documentación para Admisión";
             } else if (tipo.equals("m")){
             titulo="Documentación para Matrícula";
             }else if (tipo.equals("t")){
             titulo="Documentación para Transferencia";
             }
    %>
    
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
        
<div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-9">
<form action="Documentacion?on=n&spath=spath" method="POST" name="formvrp" id="formvrp">
<input type="hidden" name="tipo"  value="<%=tipo%>">
<center>
  <table border="0" cellpadding="0" cellspacing="2" width="90%" align="center" class="textocom">
    <tr> 
      <td colspan="3"> 
        <% if (tipo.equals("i")){%>
        <p align="center" ><b><font color="#000000" size="2">&iexcl;Bienvenido 
          al env&iacute;o EN LINEA de documentos!<br>
          Es f&aacute;cil, seguro y puede hacerlo usted mismo<br>
          Sin gastar tiempo en desplazamientos o haciendo filas</font></b></p>
        <p align="left" ><br>
          <font color="#000000" size="2">Por este v&iacute;nculo o link debe enviar 
          &uacute;nicamente los documentos de admisi&oacute;n, que son:<br>
          </font></p>
        <ul>
            <li><font color="#000000" size="2">Foto 3x4cm del aspirante, pedaga en la parte superior izquierda de la carta de acudiente.<br></font></li>
          <li><font color="#000000" size="2">Documento de identidad del aspirante.<br>
            </font></li>
          <li><font color="#000000" size="2">Carta del acudiente debidamente firmada 
            por pu&ntilde;o y letra de ambas personas.  <a href="http://www.escuelaing.edu.co/uploads/descargables/1156_carta_acudiente.doc">Descargala aquí</a><br>
            </font></li>
          <li><font color="#000000" size="2">Documento del acudiente ampliada al 150%</font></li>
          <li><font color="#000000" size="2">Si eres bachiller extranjero debes entregar la homologación del exámen SABER 11 ante el ICFES. Mayor información <a href="http://www.icfes.gov.co/atencion-al-ciudadano/examenes-homologables">AQUI</a></font></li>
        </ul>
        <p align="center"><b><font color="#000000" size="2">PASOS PARA ENVIAR 
          SUS DOCUMENTOS DE ADMISION &quot;EN LINEA&quot;</font></b></p>
        <p><font color="#000000" size="2">1. Re&uacute;na todos los documentos 
          anteriores.<br>
          2. Escanee la totalidad de los documentos en formato PDF. Debe obtener 
          UN SOLO archivo de VARIAS PAGINAS.<br>
          3. Digite el n&uacute;mero del documento de identidad del aspirante, 
          sin puntos ni guiones<br>
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
          <li><font size="2">El sistema s&oacute;lo acepta archivos en 
            formato PDF. <br>
            </font></li>
          <li><font size="2">Debe grabar UN SOLO ARCHIVO con la totalidad 
            de los documentos de admisi&oacute;n y UN SOLO ARCHIVO con la totalidad 
            de los documentos de liquidaci&oacute;n.<br>
            </font></li>
          <li><font size="2">Si env&iacute;a un documento a la vez, cada 
            nuevo archivo borrar&aacute; el archivo anterior.<br>
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
        <%}else if (tipo.equals("f")){%>
        <div align="center"> 
          <p><font size="2"><b>&iexcl;Bienvenido al env&iacute;o EN LINEA de documentos!<br>
            Es f&aacute;cil, seguro y puede hacerlo usted mismo<br>
            Sin gastar tiempo en desplazamientos o haciendo filas </b></font></p>
          <p>&nbsp;</p>
          <p align="left"><font size="2">Por este v&iacute;nculo o link debe enviar 
            &uacute;nicamente los documentos de liquidaci&oacute;n, que son:<br>
            </font></p>
        </div>
        <ul>
          <li><font size="2">Soporte de cu&aacute;nto pagaba por pensi&oacute;n 
            en el colegio<br>
            </font></li>
          <!--li><font size="2">Recibo de luz de la vivienda de los padres<br>
            </font></li-->
          <li><font size="2">Ingresos de los padres</font></li>
        </ul>
        <p align="center"><font size="2"><b>PASOS PARA ENVIAR SUS DOCUMENTOS DE 
          LIQUIDACION &quot;EN LINEA&quot;</b></font></p>
        <p><font size="2">1. Re&uacute;na todos los documentos anteriores.<br>
          2. Escanee la totalidad de los documentos en formato PDF. Debe obtener 
          UN SOLO archivo de VARIAS PAGINAS.<br>
          3. Digite el n&uacute;mero del documento de identidad del aspirante, 
          sin puntos ni guiones<br>
          4. Ubique el archivo y env&iacute;elo </font></p>
        <p><font size="2"><br>
          </font></p>
      </td>
    </tr>
    <tr  bgcolor="#F3F3F3"> 
      <td height="38"><strong>Documento Identidad&nbsp; <br>
        (Sin puntos, ni comas ni guiones)&nbsp;</strong></td>
      <td height="38"><strong> 
        <input type="text" name="doc" size="15" class="campotext">
        <input type="submit" value="Enviar" name="B1"  class="boton" onClick="javascript: return validar();">
        </strong></td>
    </tr>
    <tr  bgcolor="#F3F3F3"> 
      <td colspan="2" height="38"> 
        <div align="center"> 
          <p align="center"><b>TIPS para tener en cuenta:</b></p>
        </div>
        <ul>
          <li> 
            <div align="left"><font size="2">No env&iacute;e documentaci&oacute;n 
              incompleta ya que no se podr&aacute; iniciar el proceso<br>
              </font></div>
          </li>
          <li> 
            <div align="left"><font size="2">El sistema s&oacute;lo acepta archivos 
              en formato PDF. <br>
              </font></div>
          </li>
          <li> 
            <div align="left"><font size="2">Debe grabar UN SOLO ARCHIVO con la 
              totalidad de los documentos de admisi&oacute;n y UN SOLO ARCHIVO 
              con la totalidad de los documentos de liquidaci&oacute;n.<br>
              </font></div>
          </li>
          <li> 
            <div align="left"><font size="2">Si env&iacute;a un documento a la 
              vez, cada nuevo archivo borrar&aacute; el archivo anterior.<br>
              </font></div>
          </li>
          <li> 
            <div align="left"><font size="2">Al escanear h&aacute;galo preferiblemente 
              en tonos de grises.<br>
              </font></div>
          </li>
          <li> 
            <div align="left"><font size="2">No le coloque claves o contrase&ntilde;as 
              a los archivos<br>
              </font></div>
          </li>
          <li> 
            <div align="left"><font size="2">Si tiene sus documentos en otros 
              formatos (JPG, TIFF) usted mismo puede convertirlos a PDF r&aacute;pida
              y gratuitamente:<br>
              </font></div>
            <ul>
              <li> 
                <div align="left"><font size="2">Convertir un archivo cualquiera 
                  en un archivo PDF: http://pdfcreator.uptodown.com/ <br>
                  </font></div>
              </li>
              <li> 
                <div align="left"><font size="2">Convertir varios archivos en 
                  un s&oacute;lo PDF: http://www.ilovepdf.com/es/ <br>
                  </font></div>
              </li>
              <li> 
                <div align="left"><font size="2">Para visualizar archivos PDF 
                  necesita tener instalado Adobe Reader: http://get.adobe.com/es/reader/ 
                  <br>
                  </font> </div>
              </li>
            </ul>
          </li>
        </ul>
        <p align="left">&nbsp; </p>
        <%}else if (tipo.equals("m")){%>
         <div align="center">
          <p><font size="2"><b>&iexcl;Bienvenido al env&iacute;o EN LINEA de documentos!<br>
            Es f&aacute;cil, seguro y puede hacerlo usted mismo<br>
            Sin gastar tiempo en desplazamientos o haciendo filas </b></font></p>
          <p>&nbsp;</p>
          <p align="left"><font size="2">Por este v&iacute;nculo o link debe enviar
            &uacute;nicamente los documentos de matrícula.<br>
            </font></p>
        </div>
      <tr  bgcolor="#F3F3F3">
      <td height="38"><strong>Documento Identidad&nbsp; <br>
        (Sin puntos, ni comas ni guiones)&nbsp;</strong></td>
      <td height="38"><strong>
        <input type="text" name="doc" size="15" class="campotext">
        <input type="submit" value="Enviar" name="B1"  class="boton" onClick="javascript: return validar();">
        </strong></td>
    </tr>
<%}else {%>
    <div align="center">
          <p><font size="2"><b>&iexcl;Bienvenido al env&iacute;o EN LINEA de documentos!<br>
            Es f&aacute;cil, seguro y puede hacerlo usted mismo<br>
            Sin gastar tiempo en desplazamientos o haciendo filas </b></font></p>
          <p>&nbsp;</p>
          <p align="left"><font size="2">Por este v&iacute;nculo o link debe enviar
            &uacute;nicamente los documentos de transferencia.<br>
            </font></p>
        </div>
      <tr  bgcolor="#F3F3F3">
      <td height="38"><strong>Documento Identidad&nbsp; <br>
        (Sin puntos, ni comas ni guiones)&nbsp;</strong></td>
      <td height="38"><strong>
        <input type="text" name="doc" size="15" class="campotext">
        <input type="submit" value="Enviar" name="B1"  class="boton" onClick="javascript: return validar();">
        </strong></td>
    </tr>
    <%}%>
    <!-- <tr bgcolor="#F3F3F3">
      <td  bgcolor="#F3F3F3" width="50%"><div align="right"><p><strong>No.&nbsp;<BR> Referencia&nbsp; </strong></div></td>
      <td  bgcolor="#F3F3F3" width="50%"><strong><input type="text" name="ref" size="10" class="campotext"></strong></td>
    </tr>-->
  </table>
  <div align="center"><center>
      <p>&nbsp;</p>
  </center></div>

</form>
                </div>
            </div>
</div>

    </body>
</html>

<%
            } catch (Exception e) {
                Correo correo = new Correo();
                correo.enviar("Valida en Inscripciones", e.getMessage());
            }
%>
