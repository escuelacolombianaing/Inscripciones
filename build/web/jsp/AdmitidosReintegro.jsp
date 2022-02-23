<%-- 
    Document   : AdmitidosReintegro
    Created on : 23/06/2010, 11:33:22 AM
    Author     : lrodriguez
--%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%configeci.configuracion confEci = new configeci.configuracion();
        String arreglo[] = new String[50];
        String texto[] = new String[20];
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String tipprog = request.getParameter("prog");
        String prog;
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        Date hoy = new Date();
        String fechaActual = formatter.format(hoy);
        int l, b = 0, a = 0, s = 0, ban = 0, k;
        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipprog);%>

<%
        Date fechafin = new Date();
        String dato = new String(pregrados.elementAt(1).toString());
        prog = new String(pregrados.elementAt(3).toString());
        String datofin = new String(pregrados.elementAt(2).toString());
        Date inicio = formatter.parse(dato);
        Date finall = formatter.parse(datofin);
        String X = formatter.format(inicio);
        String Y = formatter.format(finall);
        if (prog.equals(tipprog)) {
            if ((hoy.after(inicio) && hoy.before(finall) || fechaActual.equals(Y)) && pregrados.elementAt(5).equals("1")) {
                ban = 1;
            }
        }
%>
<html>
    <head>
        <title>Consulta Admitidos  </title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body bgcolor="#ffffff">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS" />
        </jsp:include>

        <% if (ban == 1) {%>
        <table width="440" border="1" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <form name="form1" method="post" action="RespuestaReintegro">
                        <input type="hidden" name="fecha" value="<%=pregrados.elementAt(4)%>">
                        <input type="hidden" name="induccion" value="<%=pregrados.elementAt(7)%>">
                        <input type="hidden" name="resta" value="<%=pregrados.elementAt(6)%>">
                        <input type="hidden" name="iniproceso" value="<%=pregrados.elementAt(1)%>">
                        <table align="center" border="0" cellpadding="0" cellspacing="2" width="292" height="98" class="textocom">
                            <tr>
                                <td align=left height="53" width="45%">
                                    <div align="right"><strong>Documento
                                    de Identidad </strong></div>
                                </td>
                                <td align=left width="9%">&nbsp;</td>
                                <td align=left height="53" width="46%">
                                    <div align="left">
                                        <input name="documento" type="password" maxlength="12" size="12" class="campotext">
                                </div></td>
                            </tr>
                            <tr>
                                <td align=left height="39" width="45%">
                                    <div align="right">
                                        <input id="submit1" name="Aceptar"  type="submit" value="Aceptar" title="Aceptar" class="boton" tabindex="Yes">
                                </div></td>
                                <td width="9%" height="39" align=left>&nbsp;</td>
                                <td width="46%" height="39" align=left>
                                    <div align="left">
                                        <input id="submit1" name="Limpiar" type="reset" value="Limpiar" title="Limpiar" class="boton">
                                </div></td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>
        <%} else {%>
        <p>
        <center>Este proceso se habilitará en las fechas programadas.</center>
        <%}%>
        <p>
        <jsp:include page="piepag">
            <jsp:param name="parametro" value="" />
        </jsp:include>


    </body>
</html>