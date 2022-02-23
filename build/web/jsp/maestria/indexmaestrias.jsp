<%-- 
    Document   : indexmaestrias
    Created on : 3/06/2011, 11:56:23 AM
    Author     : lrodriguez
--%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%
        response.setHeader("Cache-Control", "no-cache");
        configeci.configmaestria confEci = new configeci.configmaestria();
        String titulo = "Inscripciones en línea Maestría en Gestión de Información";
        /*String titulo = "Inscripciones Posgrados";*/
        String arreglo[] = new String[50];
        String texto[] = new String[20];
        String prog;
        String idplan = "";
        int ban = 0;
        BDadmisiones bd = new BDadmisiones();
        PrintWriter oout = response.getWriter();
        idplan = request.getParameter("idplan");
        Vector posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date fechafin = new Date();
        String dato = new String(posgrados.elementAt(3).toString());
        idplan = new String(posgrados.elementAt(1).toString());
        String datofin = new String(posgrados.elementAt(4).toString());
        String fechaActual = formatter.format(hoy);
        Date inicio = formatter.parse(dato);
        Date finall = formatter.parse(datofin);
        String X = formatter.format(inicio);
        String Y = formatter.format(finall);

        if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y)) && (posgrados.elementAt(0).equals("1"))) {
            ban = 1;
        }
%>
<html>
    <head>
        <title>Admisiones</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Fireworks MX Dreamweaver MX target.  Created Wed Aug 16 09:51:45 GMT-0500 (Hora est. del Pacífico de SA) 2006-->
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <script language="JavaScript" type="text/JavaScript">
        <!--
        function ventanaSecundaria (URL){
 <%if (ban == 1) {%>
         window.open(URL,"","width=850,height=600,scrollbars=yes,top=80,left=100");

   <%} else {%>

           alert("Solo se habilitará en las fechas programadas");
   <%}%>
       }
       function textoin(id){
           //document.getElementById(id).style.fontSize='8px';
           document.getElementById(id).style.color='#336699';
       }

       function textout(id){
           //document.getElementById(id).style.fontSize='10px';
           document.getElementById(id).style.color='#FFFFFF';
       }

       function ilum(esto, uno){
           esto.style.backgroundColor=uno;
       }
       //-->
    </script>

    <style type="text/css">
        a{color: white;}
        a:hover{color:#3366CC; }
    </style>
    <body background="img/fondo.gif">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        <table width="640" border="0" align="center" class="textocom">
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                        <tr>
                            <td>
                                <p align="justify">
                                    <!--p>Inscripciones extempor&aacute;neas
                          en línea Aspirantes a primer Semestre:

                          Solo se habilitará en las fechas programadas
                      </p-->
                                </p>
                                <p>

                                </p>
                                <p class="resaltados">Para realizar su solicitud de admisi&oacute;n
                                en l&iacute;nea, siga el siguiente orden:</p>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table width="90%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                        <tr bgcolor="#336699">
                            
          <td height="30" colspan="2" bgcolor="#336699" class="bodystyle"  onMouseOver="textoin('f1'); ilum(this,'#ACC8E3')" onMouseOut="textout('f1'); ilum(this,'#336699')"><a href="http://www.escuelaing.edu.co/admisiones/maestria_gestioninfo.html"><font id="f1" color="FFFFFF"><b>1. 
            Lea las instrucciones y documentaci&oacute;n requerida &nbsp;&nbsp;AQUI</b></font></a></td>
                        </tr>
                        <tr>
                            
          <td width="96%">
            <p><font face="Arial, Helvetica, sans-serif" size="2">Por favor lea 
              las instrucciones y regrese a esta misma p&aacute;gina para continuar 
              con el proceso, en el punto No. 2.</font></p>
           <br>
          </td>
                            
          <td width="4%">&nbsp;</td>
                        </tr>
                        <tr bgcolor="#336699">
                            
          <td colspan="2" bgcolor="#336699" class="bodystyle"  onMouseOver="textoin('f6'); ilum(this,'#ACC8E3')" onMouseOut="textout('f6'); ilum(this,'#336699')" height="54"><a href="javascript:ventanaSecundaria('ReferenciaMaestrias?idplan=<%=idplan%>')" onMouseOut="window.status='  '"
                                                                                                                                                                                           onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#FFFFFF" id="f6"><b>2. 
            Una vez haya leído las instrucciones, regístrese aquí y solicite su 
            número de referencia de pago </b></font></a></td>
                        </tr>
                        <tr valign="top">
                            <td colspan="2"> <font face="Arial, Helvetica, sans-serif" size="2">
                                    <p align="justify">Recuerde que el pago de los derechos de admisi&oacute;n
                                    debe hacerse con la suficiente anticipaci&oacute;n, según la modalidad de pago, para acceder al
                                    formulario de admisi&oacute;n a través de la p&aacute;gina web.
                                    Tenga en cuenta la fecha l&iacute;mite del proceso de inscripciones.
                                    Si usted realiza el pago el &uacute;ltimo d&iacute;a por favor env&iacute;elo
                                    a la Oficina de Admisiones v&iacute;a fax antes de las 5:00 p.m
                                    con sus datos (nombre, documento de identidad, n&uacute;mero de
                                    referencia) al 6762340 para darle acceso al diligenciamiento de
                                    su solicitud de admisi&oacute;n. Verifique antes de las 5:00 p.m
                                    que el fax haya sido recibido correctamente. No aplica para pagos
                                    realizados en jornada adicional.
                            </font> </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
<td colspan="2" bgcolor="#336699" class="bodystyle"  onMouseOver="textoin('f6'); ilum(this,'#ACC8E3')" onMouseOut="textout('f6'); ilum(this,'#336699')" height="31"> 
            <p><font color="#FFFFFF" id="f7"><b>3. Si desea realizar el pago EN L&Iacute;NEA, 
              ingrese por <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst">AQUI</a></b></font></p>
            </td>
                        </tr>
                        <tr>
                            
          <td colspan="2"> 
            <p><font face="Arial, Helvetica, sans-serif" size="2">Si ya solicit&oacute; su n&uacute;mero de referencia y desea realizar 
              el pago de los derechos de inscripci&oacute;n a trav&eacute;s de 
              internet puede hacerlo aqui: <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst"><font color="#000000"><b>PAGOS
              EN LINEA</b>,</font> </a>debe contar con una cuenta corriente o 
              de ahorros para realizar este proceso.</font></p>
            </td>
                        </tr>
						 <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr bgcolor="#336699">
                            
          <td colspan="2" bgcolor="#336699" class="bodystyle"  onMouseOver="textoin('f7'); ilum(this,'#ACC8E3')" onMouseOut="textout('f7'); ilum(this,'#336699')" height="31"><a href="javascript:ventanaSecundaria('SolicitudMaestria?idplan=<%=idplan%>')" onMouseOut="window.status='  '"
                                                                                                                                                                                           onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#FFFFFF" id="f7"><b>4. 
            Una vez haya sido reportado su pago, diligencie aqu&iacute; su solicitud 
            de admisi&oacute;n</b></font></a></td>
                        </tr>
                        <tr>
                            <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">
                                    <p align="justify">Tenga en cuenta que no podr&aacute; diligenciar
                                        el formulario despues de la fecha l&iacute;mite aunque haya realizado
                                        el pago. Si desea verificar el envio de su solicitud de admisi&oacute;n<font color="#336699">
                                            <a href="javascript:ventanaSecundaria('SolicitudMaestria?idplan=<%=idplan%>')" onMouseOut="window.status='  '"
                                               onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#0000FF">haga
                                        click aqu&iacute;</font></a>.</font> Si
                                        ya diligencio su solicitud de admisi&oacute;n <a href="javascript:ventanaSecundaria('SolicitudMaestria?idplan=<%=idplan%>')" onMouseOut="window.status='  '"
                                                                                         onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#336699"><strong>IMPRIMALA
                                    AQUI</strong></font><strong>.</strong></a></p>
                            </font></td>
                        </tr>
                    </table>
                    <p align="left" >Si envió documentaci&oacute;n por servicio de mensajer&iacute;a
                    consulte aqu&iacute; si fu&eacute; recibida</p>
                    <form method="POST" action="ConsultaDocPos">
                        <table border="1" cellpadding="0" cellspacing="0" width="100%" class="textocom">
                            <tr  bgcolor="#F3F3F3">
                                <td  bgcolor="#F3F3F3" width="50%">
                                    <div align="right">
                                        <p align="center"><strong><font size="2">Documento Identidad&nbsp;
                                                <br>
                                            (Sin puntos, ni comas ni guiones)</font><font size="3">&nbsp;</font>
                                        </strong>
                                    </div>
                                </td>
                                <td  bgcolor="#F3F3F3" width="50%"><strong>
                                        <input type="text" name="doc" size="15">
                                </strong></td>
                            </tr>
                        </table>
                        <p align="center">
                            <input type="submit" value="Enviar" name="B1" class="boton">
                        </p>
                    </form>

                    <p ><b class="resaltados">Para cualquier aclaración con respecto al proceso de inscripción, comuníquese con la Oficina de Admisiones a la dirección electrónica <a href="mailto:admisiones@escuelaing.edu.co"><font color="#0000FF">admisiones@escuelaing.edu.co</font></a>
                      o  al tel&eacute;fono 6683600, Exts. 223, 224 y 156, fax 6762655.</b>
                    </p>
                    <p>&nbsp;</p>

                </td>
            </tr>
        </table>
        <jsp:include page="piepag">
            <jsp:param name="parametro" value="" />
        </jsp:include>
    </body>
</html>
