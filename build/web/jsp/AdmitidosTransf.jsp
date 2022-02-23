<%-- 
    Document   : AdmitidosTransf
    Created on : 2/07/2015, 02:44:39 PM
    Author     : Lucero
--%>

<%@page import="utiles.Correo"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    try {
        configeci.configuracion confEci = new configeci.configuracion();
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

        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipprog);
%>
<%  if (pregrados.size() > 0) {
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
        <title>Consulta Admitidos </title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    </head>
    <body bgcolor="#ffffff">
        <!%=confEci.getPeriodoant()%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS" />
        </jsp:include>
        <% if (ban == 1) {%>

        <form name="form1" method="post" action="RespAdmitidosTransf">
            <input name="tipprog" type="hidden" value="<%=tipprog%>">
            <input type="hidden" name="induccion" value="<%=pregrados.elementAt(7)%>">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-md-offset-5" >
                        Documento de Identidad :

                    <input name="documento" type="password" maxlength="12"  class="form-control">
                    </div>
                </div>
            
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <input id="submit1" name="Aceptar"  type="submit" value="Enviar" title="Enviar"  tabindex="Yes">
                </div>
                <div class="col-md-4">
                    <input id="submit1" name="Limpiar"  type="reset" value="Limpiar" title="Enviar" tabindex="Yes">
                </div>

</div>
            </div>
 
<%} else {%>
<p>
    <!--en las fechas programadas-->
<center>El proceso de consulta de Admisión en las fechas programadas.</center>
    <%}%>

<%} else {%>
<br>
<br>
<center>No existen información del proceso o aún no se encuentra habilitado.
    Por favor comuníquese al 6683600 opción 2 en el menú.</center>
    <%}%>
</form>


</body>
</html>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("admisiones", e.getMessage());
    }
%>