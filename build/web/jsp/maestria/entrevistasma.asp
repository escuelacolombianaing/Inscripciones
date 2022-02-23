
<%@ page import = "javax.servlet.http.HttpSession" %>

<%response.setHeader("Cache-Control","no-cache");
HttpSession  sesion;
sesion = request.getSession(true);
String idplan = request.getParameter("idplan");
configeci.configPosgrados confEci = new configeci.configPosgrados();
boolean entrevistas = confEci.getEntrevistas(idplan);
if (idplan != null && !idplan.equals("")) {   
%>	
<html>
    <head>
        <title>Consulta de Entrevistas </title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
    </head>
    <table align=center 
           border=0 bordercolor=white cellpadding=0 cellspacing=2 
           width=306 height=109 >
        <tr> 
            <td height="77" colspan="3"> 
        <p align="center"><img src="file:///C|/J2EE/inscripciones/web/jsp/posgrados/img/Escudo.gif" width="125" height="126"></p></td></tr>
        
        <tr bgcolor="#C5201A"> 
            <td align=left colspan="2" height="18"> 
                <div align="center"><strong><em><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF">CONSULTA 
                - ENTREVISTAS POSGRADOS</font></em></strong></div>
            </td>
        </tr>
    </table>
    <%if (entrevistas == true) {%>
    <table border="0" width="550" align="center">
        <tr> 
            <td height="77" colspan="3"> 
                
                <form name="form1" method="post" action="file:///C|/J2EE/inscripciones/web/jsp/posgrados/ConsultaEntrevistasPosgrado">
                    <input name="idplan" type="hidden" id="idplan" value="<%=idplan%>">
                    
        <table align=center 
                           border=0 bordercolor=white cellpadding=0 cellspacing=2 
                           width=306 height=109 >
          <tr> 
            <td align=left height="53" width="50%"> 
              <div align="right"><strong><em><font face="Arial" size="2">Documento 
                de Identidad </font></em></strong></div>
            </td>
            <td align=left height="53" width="50%"> 
              <div align="left"> 
                <input name=documento type=password maxlength=12 style="HEIGHT: 22px; WIDTH: 110px" size="12">
              </div>
            </td>
          </tr>
          <tr> 
            <td align=left height="39" width="50%">
              <div align="right"><b><font face="Arial, Helvetica, sans-serif" size="2"><i>Seleccione 
                el Enfasis al cual se inscribi&oacute;</i></font></b></div>
            </td>
            <td align=left height="39" width="50%">
              <select name="idplan" class="campotext">
                <option value="N" selected><b>Seleccione</b></option>
                <option value="291">Enfasis en Ingenier&iacute;a Estructural</option>
                <option value="290">Enfasis en Recursos Hidr&aacute;ulicos y Medio 
                Ambiente</option>
                <option value="292">Enfasis en Ingenier&iacute;a Ambiental</option>
                <option value="293">Enfasis en Geotecnia Mod. de Profundizaci&oacute;n</option>
                <option value="294">Enfasis en Tr&aacute;nsito y Transporte Mod. 
                de Profundizaci&oacute;n</option>
              </select>
            </td>
          </tr>
          <tr> 
            <td align=left height="39" width="50%"> 
              <div align="center"> 
                <input id=submit1 name=Aceptar style="HEIGHT: 27px; LEFT: 200px; TOP: 99px; WIDTH: 110px" type=submit value=Aceptar title=Aceptar tabindex="Yes">
              </div>
            </td>
            <td align=left height="39" width="50%"> 
              <div align="center"> 
                <input id=submit1 name=Limpiar style="HEIGHT: 27px; LEFT: 200px; TOP: 99px; WIDTH: 110px" type=reset value=Limpiar title=Limpiar>
              </div>
            </td>
          </tr>
        </table>
                </form>
            </td>
        </tr>
        <tr> 
            <td colspan="3" height="10"> 
                <div align="center"><img src="file:///C|/J2EE/inscripciones/web/jsp/posgrados/img/rojo.jpg" width="580" height="2"></div>
            </td>
        </tr>
        <tr> 
            <td colspan="3"> 
                <p align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Avenida 
                    13 No 205-59 - Kilómetro 13 Autopista Norte <br>
                    Bogotá - Colombia - Sur América <br>
                    PBX: +57(1)6683600. Fax: 57(1)6762340  <br>
                <a href="mailto:webmaster@escuelaing.edu.co">Webmaster</a></font> 
            </td>
        </tr>
    </table>
    
    <%} else {%>
    <p>&nbsp;
    <table width="95%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
            <td bgcolor="#E4E4E4">&nbsp;</td>
        </tr>
        <tr> 
            <td>&nbsp;</td>
        </tr>
        <% if (idplan.equals("263")){%>
        <tr> 
            <td height="43"><font face="Verdana, Arial, Helvetica, sans-serif">La citación a entrevista podrá consultarse el 21 de Enero después de las 5:00 P.M </font></td>
        </tr>
        <% //}else if(idplan.equals("370")){%>
        <!-- <tr> 
    <td><font face="Verdana, Arial, Helvetica, sans-serif">El proceso de consulta 
      de <b>entrevistas</b> para esta especializaci&oacute;n estará disponible el 18 de mayo después de las 2:00 p.m. 
      <!--<a href="VerificaCronograma?idplan=<!%=idplan%>"><b>consulte aqu&iacute;</a> 
      la programaci&oacute;n></font>. 
 
    </td>
  </tr-->
        <%} else {%>
        <tr> 
            <td><font face="Verdana, Arial, Helvetica, sans-serif">El proceso de consulta 
                    de <b>entrevistas</b> para esta especializaci&oacute;n no se encuentra disponible. 
                    <!--<a href="VerificaCronograma?idplan=<%=idplan%>"><b>consulte aqu&iacute;</a> 
                la programaci&oacute;n--></font>. 
                
            </td>
        </tr>
        <%}
        }%>
        <!--  <tr> 
    <td> 
      <p>&nbsp;</p>
      <p><font face="Verdana, Arial, Helvetica, sans-serif">Para cualquier informaci&oacute;n 
        adicional comun&iacute;quese al tel&eacute;fono 6683600 exts. 274 &oacute; 
        263 &oacute; 101 &oacute; al e-mail </font><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a></font></b></p>
    </td>
  </tr>-->
        <tr> 
            <td>&nbsp;</td>
        </tr>
        <tr> 
            <td bgcolor="#E4E4E4">&nbsp;</td>
        </tr>
    </table>
    <p>&nbsp;
    </body>
</html>
<%}%>