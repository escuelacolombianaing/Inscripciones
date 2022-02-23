<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<% try {
                String tipoest = request.getParameter("tipoest");
                String idplan = request.getParameter("idplan");
                int ban = 0;
                configeci.configmaestria confEci = new configeci.configmaestria();
                BDadmisiones bd = new BDadmisiones();
                PrintWriter oout = response.getWriter();
                idplan = request.getParameter("idplan");
                Vector posgrados = new Vector();
                posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
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
                 if (idplan.equals("330")){
                ban = 1;
                }
               
                if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y)) && (posgrados.elementAt(0).equals("1"))) {
                    ban = 1;
                }
%>

<html>
    <head>
        <title>Admisión a la Maestría </title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <SCRIPT LANGUAGE="JavaScript">

            function comprueba( ){

                if ( !document.forms.form1.acepto[0].checked && !document.forms.form1.acepto[1].checked ) {
                    alert("Debe seleccionar alguna opción");
                    return false;
                }

                return true;
            }
        </SCRIPT>
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

    <body bgcolor="#FFFFFF" text="#000000">
        <%if (idplan.equals("353")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN GESTIÓN DE INFORMACIÓN" />
        </jsp:include>
        <%} else if (idplan.equals("371")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INFORMÁTICA" />
        </jsp:include>
        <%} else if (idplan.equals("372")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN CIENCIAS ACTUARIALES" />
        </jsp:include>
        <%} else if (idplan.equals("332")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERÍA ELECTRÓNICA" />
        </jsp:include>
        <%} else if (idplan.equals("351")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS" />
        </jsp:include>
        <%} else if (idplan.equals("330")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERIA INDUSTRIAL" />
        </jsp:include>
        <%}else if (idplan.equals("376")){%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN CIENCIA DE DATOS" />
        </jsp:include>
        <%} 
        else {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRIA EN INGENIERÍA CIVIL" />
        </jsp:include>
        <%}%>

        <div align="center">

            <form name="form1" method="post"  onSubmit="return comprueba( );" action="ValidaPagoMa">
                <input name="tipest" type="hidden" id="tipoest" value="<%=tipoest%>">
                <input name="idplan" type="hidden" id="idplan" value="<%=idplan%>">
                <div align="center">

                    <% if (ban == 1) {%>
                    <table width="640" border="1" cellspacing="0" cellpadding="0" bordercolor="#CCCCCC" class="textocom">
                        <tr>
                            <td colspan="2" height="216" valign="top">
                                <table width="97%" border="0" cellspacing="0" cellpadding="0" align="center" class="textocom">
                                    <tr valign="top">
                                        <td colspan="2">
                                            <p align="center"><b><font color="#CC0000" size="4">IMPORTANTE</font></b></p>
                                            <p align="left">La informaci&oacute;n suministrada en esta solicitud
                                                de admisi&oacute;n ser&aacute; utilizada para el estudio de
                                                su admisi&oacute;n.</p>
                                            <p>Declaro que la informaci&oacute;n aqu&iacute; consignada
                                                es cierta y autorizo su verificaci&oacute;n, en el caso de
                                                encontrar falsedad en los datos consignados, esta solicitud
                                                se anular&aacute;.</p>
                                            <p>&nbsp;</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="47%">Acepto que conozco las condiciones aqu&iacute;
                                            descritas</td>
                                        <td width="53%">
                                            <p> </p>
                                            <p> <b>Si
                                                    <input type="radio" name="acepto" value="S">
                                                    &nbsp;&nbsp;No</b>
                                                <input type="radio" name="acepto" value="N">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="47%">&nbsp;</td>
                                        <td width="53%">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <center>
                                                <p>
                                                    <input type="submit" value="Acepto" name="submit" class="boton">
                                                </p>
                                                <p>&nbsp;</p>
                                            </center>
                                        </td>
                                    </tr>
                                </table>
                                <% } else {%>
                                <center>Este proceso sólo se habilitará en las fechas programadas.</center>
                                <%}%>

                            </td>
                        </tr>
                    </table>

                </div>
            </form>
        </div>
    
    </body>
</html>
<%
            } catch (Exception e) {
                Correo correo = new Correo();
                correo.enviar("Solicitud Posgrado", e.getMessage());
            }
%>
