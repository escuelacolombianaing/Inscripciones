<%-- 
    Document   : index
    Created on : 2/02/2010, 09:08:32 AM
    Author     : lrodriguez
--%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
        response.setHeader("Cache-Control", "no-cache");
        configeci.configuracion confEci = new configeci.configuracion();
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        int ban = 0;
        String tipoest = request.getParameter("tipprog");
//Convertir el dato String a Date para compararlo mas adelante.
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String fechaActual = formatter.format(hoy);
        String titulo = " Inscripciones en línea";
        /* Inscripciones Extemporáneas*/
        if (tipoest.equals("E") || tipoest.equals("T")) {
            titulo = "Inscripciones en línea";
        }

        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);

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
%>

<html>
<head>
    <title>Admisiones</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <!-- Fireworks MX Dreamweaver MX target.  Created Wed Aug 16 09:51:45 GMT-0500 (Hora est. del Pacífico de SA) 2006-->
    <link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" type="text/JavaScript">
    <!--
    function ventanaSecundaria (URL){
 <%if (ban == 1) {%>
         window.open(URL,"","width=850,height=600,scrollbars=yes,top=80,left=100");

   <%} else {%>

           alert("Solo se habilitará en las fechas programadas, para cualquier información comuníquese al 6683600 opción 2 en el menú.");
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
}
</style>
<body background="img/fondo.gif">
<jsp:include page="encabezado">
    <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
    <jsp:param name="titulo" value="<%=titulo%>" />
</jsp:include>

<table width="640" border="0" align="center" class="textocom">
<tr>
<td>
    <% if (tipoest.equals("N")) {%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="textocom">
        <tr>
            <td width="82%">
                <p align="justify"><b>Para hacer la solicitud de admisión no se requiere
                        tener el resultado del Examen de Estado. Únicamente se requiere
                        el número de registro del examen con el cual es citado el estudiante.
                        La escuela se encarga de verificar oportunamente los resultados
                obtenidos directamente con el ICFES.</b></p>
                <!--p>Inscripciones extempor&aacute;neas
                          en línea Aspirantes a primer Semestre:
                          Solo se habilitará enlas fechas programadas
                </p-->
            Para realizar su solicitud de admisión, siga el siguiente orden:</td>
            <td width="18%">
                <div align="left"><img src="img/selloacreditacion.gif" width="100" height="100"></div>
            </td>
        </tr>
    </table>
    <br>
    <table width="95%" border="0" cellspacing="0" cellpadding="0" class="textocom">
    <tr>
        <td height="20" colspan="2" bgcolor="#336699" class="bodystyle"  onMouseOver="textoin('f1'); ilum(this,'#ACC8E3')" onMouseOut="textout('f1'); ilum(this,'#336699')"><a href="http://www.escuelaing.edu.co/admisiones/instrucps.htm"><font id="f1" color="FFFFFF"><b>1.
        Lea las instrucciones y documentaci&oacute;n requerida</b></font></a></td>
    </tr>
    <tr>
        <td height="17">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" bgcolor="#336699" class="bodystyle"  onMouseOver="textoin('f6'); ilum(this,'#ACC8E3')" onMouseOut="textout('f6'); ilum(this,'#336699')">
            <a href="javascript:ventanaSecundaria('ValidaExtranjero?tipoest=N')" onMouseOut="window.status=' '"onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#FFFFFF" id="f6"><b>2.
                        Una vez haya leído las instrucciones, regístrese aquí y solicite su
        número de referencia de pago </b></font></a></td>
    </tr>
    <tr>
        <td>Recuerde que el pago de los derechos de admisi&oacute;n debe hacerse
            con la suficiente anticipaci&oacute;n, según la modalidad de pago,
            para acceder al formulario de admisi&oacute;n a través de la p&aacute;gina
            web. Tenga en cuenta la fecha l&iacute;mite del proceso de inscripciones.
            Si usted realiza el pago el &uacute;ltimo d&iacute;a por favor env&iacute;elo
            a la Oficina de Admisiones v&iacute;a fax antes de las 5:00 p.m con
            sus datos (nombre, documento de identidad, n&uacute;mero de referencia)
            al 6762340 para darle acceso al diligenciamiento de su solicitud de
            admisi&oacute;n. Verifique antes de las 5:00 p.m que el fax haya sido
            recibido correctamente. No aplica para pagos realizados en jornada
        adicional. </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td><strong>&#8226;Si ya solicit&oacute; su n&uacute;mero de referencia</strong>
            y desea realizar el pago de los derechos de inscripci&oacute;n <strong>a
            trav&eacute;s de internet</strong> puede hacerlo aqui: <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginAdmitido?id=1"><strong><font color="#336699">&lt;&lt;PAGOS
            EN LINEA&gt;&gt;</font></strong></a>, debe contar con una cuenta corriente
        o de ahorros para realizar este proceso.</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" bgcolor="#336699" class="bodystyle"  onMouseOver="textoin('f7'); ilum(this,'#ACC8E3')" onMouseOut="textout('f7'); ilum(this,'#336699')"><a href="javascript:ventanaSecundaria('SolicitudAdm?tipoest=N')" onMouseOut="window.status='  '"
                                                                                                                                                                       onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#FFFFFF" id="f7"><b>3.
                        Una vez haya sido reportado su pago, diligencie aqu&iacute; su solicitud
        de admisi&oacute;n</b></font></a></td>
    </tr>
    <tr>
        <td>
            <p>Tenga en cuenta que no podr&aacute; diligenciar el formulario después
                de la fecha l&iacute;mite aunque haya realizado el pago. Si desea
                verificar el envío de su solicitud de admisi&oacute;n en línea <a href="javascript:ventanaSecundaria('SolicitudAdm?tipoest=N')" onMouseOut="window.status='  '"
                                                                                  onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><strong><font color="#336699">haga
                click aqu&iacute;</font></strong></a><strong>.</strong> Si ya diligencio
                su solicitud de admisi&oacute;n <a href="javascript:ventanaSecundaria('SolicitudAdm?tipoest=N')" onMouseOut="window.status='  '"
                                                   onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#336699"><strong>IMPRIMALA
            AQUI</strong></font><strong>.</strong></a></p>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr><td colspan="2" bgcolor="#336699" class="bodystyle"  onMouseOver="textoin('f7'); ilum(this,'#ACC8E3')" onMouseOut="textout('f7'); ilum(this,'#336699')">
                    <font color="#FFFFFF" id="f6"><b>
                    <font color="#FFFFFF" id="f7">4.Si usted lo prefiere CARGUE AQUI SU DOCUMENTACION</b></font> <a href="javascript:ventanaSecundaria('ValidaEstud')" onMouseOut="window.status=' '"onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><B>HAGA  CLICK  AQUI</B></a>.</font>
            </td></tr>

            <BR><TR>
                <TD>
                    <BR>
                    <p><b><a href="http://www.escuelaing.edu.co/admisiones/2010/primer_procedimiento.htm"><font color="#336699">[+
                    información]</font> </a></b>Requisitos, Procedimientos, Documentos.</p>
                    <p>&nbsp;</p>
                </td>
            </tr>
            <!-- <tr>
          <td bgcolor="#336699"><font color="#FFFFFF"><b><a href="http://tycho.escuelaing.edu.co/PagosenLinea">4.Impresi&oacute;n
            de &oacute;rdenes de Matr&iacute;cula y pagos en l&iacute;nea</a></b></font></td>
            </tr>-->
            </table>
            <form method="POST" action="ConsultaDocPre">
                <input type="hidden" name="per" value="<%=confEci.getPeriodo()%>">
                <table width="94%" border="1" align="center" class="textocom">
                    <tr bgcolor="#F3F3F3">
                        <td width="74%">
                            <div align="center">
                                <p><font color="#990000">Si desea confirmar que su documentaci&oacute;n
                                        fu&eacute; recibida a satisfacción, Consulte Aqu&iacute; en las siguientes 24 horas después
                                de haber realizado el envío.</font></p>
                                <p><strong>Documento Identidad&nbsp; <br>
                                (Sin puntos, ni comas ni guiones) </strong> </p>
                            </div>
                        </td>
                        <td width="26%"><strong>
                                <input name="doc" type="text" class="campotext" size="16" maxlength="16" >
                        </strong></td>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <input type="submit" value="Enviar" name="B1" class="boton">
                </div>
            </FORM>
            <%  }
        if (tipoest.equals("M")) {%>
            <p class="resaltados"><strong>Seguimiento Académico: </strong>Recuerde que esta opción únicamente está habilitada para
                aquellas personas que previamente fueron admitidas por el comité de admisiones.  Si usted aún no ha entregado su
            solicitud comuníquese con la oficina de admisiones donde le orientarán al respecto.</p>
            <p>Para realizar su solicitud de admisión, siga el siguiente orden:</p>
            <table width="95%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                <tr>
                    <td colspan="2" bgcolor="#336699"  onMouseOver="textoin('f8'); ilum(this,'#ACC8E3')" onMouseOut="textout('f8'); ilum(this,'#336699')"><a href="http://www.escuelaing.edu.co/admisiones/instrucrein.htm"><font id="f8" color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="2"><b>1.
                    Lea las instrucciones y documentaci&oacute;n requerida</b></font></a></td>
                </tr>
                <tr>
                    <td height="17">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" bgcolor="#336699"  onMouseOver="textoin('f9'); ilum(this,'#ACC8E3')" onMouseOut="textout('f9'); ilum(this,'#336699')"><a href="javascript:ventanaSecundaria('ReferenciaPago?tipoest=M')" onMouseOut="window.status='  '"
                                                                                                                                                                 onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="2" id="f9"><b>2.
                                    Una vez haya leído las instrucciones, regístrese aquí y solicite su
                    número de referencia de pago </b></font></a></td>
                </tr>
                <tr>
                    <td>Recuerde que el pago de los derechos de admisi&oacute;n debe hacerse
                        con la suficiente anticipaci&oacute;n, según la modalidad de pago,
                        para acceder al formulario de admisi&oacute;n a través de la p&aacute;gina
                        web. Tenga en cuenta la fecha l&iacute;mite del proceso de inscripciones.
                        Si usted realiza el pago el &uacute;ltimo d&iacute;a por favor env&iacute;elo
                        a la Oficina de Admisiones v&iacute;a fax antes de las 5:00 p.m con
                        sus datos (nombre, documento de identidad, n&uacute;mero de referencia)
                        al 6762340 para darle acceso al diligenciamiento de su solicitud de
                        admisi&oacute;n. Verifique antes de las 5:00 p.m que el fax haya sido
                        recibido correctamente. No aplica para pagos realizados en jornada
                    adicional. </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><strong>&#8226;Si ya solicit&oacute; su n&uacute;mero de referencia</strong>
                        y desea realizar el pago de los derechos de inscripci&oacute;n <strong>a
                        trav&eacute;s de internet</strong> puede hacerlo aqui: <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginAdmitido?id=1"><strong><font color="#336699">&lt;&lt;PAGOS
                        EN LINEA&gt;&gt;</font></strong></a>, debe contar con una cuenta corriente
                    o de ahorros para realizar este proceso.</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" bgcolor="#336699"  onMouseOver="textoin('f10'); ilum(this,'#ACC8E3')" onMouseOut="textout('f10'); ilum(this,'#336699')"><a href="javascript:ventanaSecundaria('SolicitudSeguimiento')" onMouseOut="window.status='  '"
                                                                                                                                                                   onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="2" id="f10">
                                <b>3. Una vez haya sido reportado su pago, diligencie aqu&iacute;
                    su solicitud de admisi&oacute;n </b></font></a></td>
                </tr>
                <tr>
                    <td>
                        <p>Tenga en cuenta que no podr&aacute; diligenciar el formulario después
                            de la fecha l&iacute;mite aunque haya realizado el pago. Si desea
                            verificar el envio de su solicitud de admisi&oacute;n en línea <a href="javascript:ventanaSecundaria('SolicitudSeguimiento')" onMouseOut="window.status='  '"
                                                                                              onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#336699"><strong>haga
                            click aqu&iacute;</strong></font></a><strong><font color="#336699">.
                                </font>Si ya diligencio su solicitud de admisi&oacute;n <a href="javascript:ventanaSecundaria('ExisteReing?impre=i')" onMouseOut="window.status='  '"
                                                                                           onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#336699"><strong>IMPRIMALA
                        AQUI</strong></font><strong>.</strong></a></strong></p>
                        <p><b class="resaltados"><a href="http://www.escuelaing.edu.co/admisiones/2010/seguimi_requisitos.htm"><font color="#336699">Más
                        información.</font> </a></b>Requisitos, Procedimientos, Documentos.</p>
                    </td>
                </tr>
            </table>
            <p></p>
            <form method="POST" action="ConsultaDocPre">
                <input type="hidden" name="per" value="<%=confEci.getPeriodo()%>">
                <table width="94%" border="1" class="textocom">
                    <tr bgcolor="#F3F3F3">
                        <td width="74%">
                            <div align="center">
                                <p><font color="#990000">Si desea confirmar que su documentaci&oacute;n
                                fu&eacute; recibida Consulte Aqu&iacute;</font></p>
                                <p><strong>Documento Identidad&nbsp; <br>
                                (Sin puntos, ni comas ni guiones) </strong> </p>
                            </div>
                        </td>
                        <td width="26%"><strong>
                                <input name="doc" type="text" class="campotext" size="16" maxlength="16" >
                        </strong></td>
                    </tr>
                </table>
                <p align="center" >
                    <input name="B1" type="submit" class="boton" value="Enviar">
                </p>
            </FORM>
            <%}
        if (tipoest.equals("T")) {%>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                <tr>
                    <td width="79%">
                        <p class="resaltados"><strong>Transferencias: </strong></p>
                        <p>Para realizar su solicitud de admisión, siga el siguiente orden:</p>
                    </td>
                    <td width="21%"><img src="img/selloacreditacion.gif" width="100" height="100"></td>
                </tr>
            </table>
            <table width="95%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                <tr>
                    <td colspan="2" bgcolor="#336699"  onMouseOver="textoin('f11'); ilum(this,'#ACC8E3')" onMouseOut="textout('f11'); ilum(this,'#336699')"><a href="http://www.escuelaing.edu.co/admisiones/instructs.htm"><b>1.
                    Lea las instrucciones y documentaci&oacute;n requerida</b></a></td>
                </tr>
                <tr>
                    <td height="17">&nbsp;</td>
                </tr>
                <tr bgcolor="#666666">
                    <td colspan="2" bgcolor="#336699" onMouseOver="textoin('f12'); ilum(this,'#ACC8E3')" onMouseOut="textout('f12'); ilum(this,'#336699')">
                        <a href="javascript:ventanaSecundaria('ReferenciaPago?tipoest=T')" onMouseOut="window.status='  '"
                           onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><b><font color="#FFFFFF" id="f12">2.
                                    Una vez haya leído las instrucciones, regístrese aquí y solicite su
                    número de referencia de pago</font> </b></a></td>
                </tr>
                <tr>
                    <td>Recuerde que el pago de los derechos de admisi&oacute;n debe hacerse
                        con la suficiente anticipaci&oacute;n, según la modalidad de pago,
                        para acceder al formulario de admisi&oacute;n a través de la p&aacute;gina
                        web. Tenga en cuenta la fecha l&iacute;mite del proceso de inscripciones.
                        Si usted realiza el pago el &uacute;ltimo d&iacute;a por favor env&iacute;elo
                        a la Oficina de Admisiones v&iacute;a fax antes de las 5:00 p.m con
                        sus datos (nombre, documento de identidad, n&uacute;mero de referencia)
                        al 6762340 para darle acceso al diligenciamiento de su solicitud de
                        admisi&oacute;n. Verifique antes de las 5:00 p.m que el fax haya sido
                        recibido correctamente. No aplica para pagos realizados en jornada
                    adicional.</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><strong>&#8226;Si ya solicit&oacute; su n&uacute;mero de referencia</strong>
                        y desea realizar el pago de los derechos de inscripci&oacute;n <strong>a
                        trav&eacute;s de internet</strong> puede hacerlo aqui: <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginAdmitido?id=1""><strong><font color="#336699">&lt;&lt;PAGOS
                        EN LINEA&gt;&gt;</font></strong></a>, debe contar con una cuenta corriente
                    o de ahorros para realizar este proceso.</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" bgcolor="#336699"  onMouseOver="textoin('f13'); ilum(this,'#ACC8E3')" onMouseOut="textout('f13'); ilum(this,'#336699')"><a href="javascript:ventanaSecundaria('SolicitudAdm?tipoest=T')" onMouseOut="window.status='  '"
                                                                                                                                                                   onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><b>3.
                                Una vez haya sido reportado su pago, diligencie aqu&iacute; su solicitud
                    de admisi&oacute;n</b></a></td>
                </tr>
                <tr>
                    <td>
                        <p>Tenga en cuenta que no podr&aacute; diligenciar el formulario despues
                            de la fecha l&iacute;mite aunque haya realizado el pago. Si desea
                            verificar el envio de su solicitud de admisi&oacute;n en línea <a href="javascript:ventanaSecundaria('SolicitudAdm?tipoest=T')" onMouseOut="window.status='  '"
                                                                                              onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#336699">haga
                            click aqu&iacute;</font></a>. Si ya diligencio su solicitud de admisi&oacute;n
                            <a href="javascript:ventanaSecundaria('SolicitudAdm?tipoest=T')" onMouseOut="window.status='  '"
                               onMouseOver="window.status='http://www.escuelaing.edu.co';return true"><font color="#336699"><strong>IMPRIMALA
                        AQUI</strong></font><strong>.</strong></a></p>
                        <p><b class="resaltados"><a href="http://www.escuelaing.edu.co/admisiones/2010/trans_requisitos.htm"><font color="#336699">Más
                        información. </font></a></b>Requisitos, Procedimientos, Documentos.</p>
                    </td>
                </tr>
            </table>
            <form method="POST" action="ConsultaDocPre">
                <input type="hidden" name="per" value="<%=confEci.getPeriodo()%>">
                <table width="94%" border="1" class="textocom">
                    <tr bgcolor="#F3F3F3">
                        <td width="74%">
                            <div align="center">
                                <p><font color="#990000">Si desea confirmar que su documentaci&oacute;n
                                fu&eacute; recibida Consulte Aqu&iacute;</font></p>
                                <p><strong>Documento Identidad&nbsp; <br>
                                (Sin puntos, ni comas ni guiones) </strong> </p>
                            </div>
                        </td>
                        <td width="26%"><strong>
                                <input type="text" name="doc" size="16" maxlength="16" class="campotext">
                        </strong></td>
                    </tr>
                </table>
                <p align="center" >
                    <input type="submit" value="Enviar" name="B12" class="boton">
                </p>
            </form>
            <%}%>
            <%if (tipoest.equals("E")) {%>
            <p class="resaltados"><strong>Reintegro: </strong></p>
            <p>Para realizar su solicitud de admisión, siga el siguiente orden:</p>
            <table width="95%" border="0" cellspacing="0" cellpadding="0" height="105">
                <tr bgcolor="#666666">
                    <td colspan="2" bgcolor="#336699" onMouseOver="textoin('f14'); ilum(this,'#ACC8E3')" onMouseOut="textout('f14'); ilum(this,'#336699')"><a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/html/reintegro.htm"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="2" id="f14"><b>1.
                    Lea las instrucciones y documentaci&oacute;n requerida</b></font></a></td>
                </tr>
                <tr>
                    <td height="17">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" bgcolor="#336699"  onMouseOver="textoin('f15'); ilum(this,'#ACC8E3')" onMouseOut="textout('f15'); ilum(this,'#336699')">
                        <p><a href="javascript:ventanaSecundaria('SolicitudReintegro')"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="2" id="f15"><b>2.
                                        Una vez haya leído las instrucciones, diligencie <b>su solicitud
                            de reintegro aquí. </b></b></font></a><font face="Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
                        <strong>.</strong></font></p>
                    </td>
                </tr>
                <tr>
                    <td height="18">&nbsp;</td>
                </tr>
            </table>
            <p><b class="resaltados"><a href="http://www.escuelaing.edu.co/admisiones/2010/reint_requisitos.htm"><font color="#336699">Más
            información</font></a></b> Requisitos, Procedimientos, Documentos.</p>
            <p>
                <%}
        if (tipoest.equals("Z")) {%>
            </p>
        </td>
    </tr>
    <tr>
        <td><strong>Readmisi&oacute;n: </strong></td>
    </tr>
    <tr>
        <td>
            <p>&nbsp;</p>
            <p>Para realizar su solicitud de admisión, siga el siguiente orden:</p>
        </td>
    </tr>
    <tr bgcolor="#666666">
        <td colspan="2" bgcolor="#336699" onMouseOver="textoin('f14'); ilum(this,'#ACC8E3')" onMouseOut="textout('f14'); ilum(this,'#336699')"><a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/html/readmision.htm"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="2" id="f14"><b>1.
        Lea las instrucciones </b></font></a></td>
    </tr>
    <tr>
        <td height="17">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" bgcolor="#336699"  onMouseOver="textoin('f15'); ilum(this,'#ACC8E3')" onMouseOut="textout('f15'); ilum(this,'#336699')"><a href="javascript:ventanaSecundaria('SolicitudReadmision')"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="2" id="f15"><b>2.
                        Una vez haya leído las instrucciones, diligencie <b>su solicitud de readmisi&oacute;n
            aquí. </b></b></font></a><font face="Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
        <strong>.</strong></font></td>
    </tr>
    <tr>
        <td colspan="2" >
            <p>&nbsp;</p>
            <p><b class="resaltados"><a href="http://www.escuelaing.edu.co/admisiones/2010/read_proceso.htm"><font color="#336699">Más
            información</font></a></b> Requisitos, Procedimientos, Documentos.</p>
            <p>&nbsp;</p>
        </td>
    </tr>
    <%}

        if (tipoest.equals("S")) {%>
    </p>
</td>
</tr>
<tr>
    <td><strong>Becas Julio Garavito: </strong></td>
</tr>

<tr>
    <td height="17">&nbsp;</td>
</tr>
<tr>
    <td colspan="2" bgcolor="#336699"  onMouseOver="textoin('f15'); ilum(this,'#ACC8E3')" onMouseOut="textout('f15'); ilum(this,'#336699')"><a href="javascript:ventanaSecundaria('FormuBecas')"><font color="#FFFFFF" face="Arial, Helvetica, sans-serif" size="2" id="f15"><b>1.
                    Diligencie <b>su solicitud de Postulación a Beca Julio Garavito
        aquí. </b></b></font></a><font face="Arial, Helvetica, sans-serif" size="2" color="#FFFFFF">
    <strong>.</strong></font></td>
</tr>
<tr>
    <td colspan="2" >
        <p>&nbsp;</p>
        <p><b class="resaltados"><a href="http://www.escuelaing.edu.co/becas/procedimiento.htm"><font color="#336699">Más
        información</font></a></b> Requisitos, Procedimientos, Documentos.</p>
        <p>&nbsp;</p>
    </td>
</tr>
<%}%>
</table>
<jsp:include page="piepag">
    <jsp:param name="parametro" value="" />
</jsp:include>

</body>
</html>
