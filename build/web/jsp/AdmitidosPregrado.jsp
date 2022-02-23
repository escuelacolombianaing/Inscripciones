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
         <link rel="stylesheet" href="css/estilo-fomularios.css">
    </head>
    <body bgcolor="#ffffff">

        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS" />
        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <% if (ban == 1) {%>

                    <form name="form1" method="post" action="RespuestaPregrado">
                        <input type="hidden" name="fecha" value="<%=pregrados.elementAt(4)%>">
                        <input type="hidden" name="induccion" value="<%=pregrados.elementAt(7)%>">
                        <div class="col-xs-12 col-md-5 col-md-offset-1">
                            <strong>Documento de Identidad </strong></div>
                        <div class="col-xs-80 col-md-2">
                            <div class="form-group espaciado">

                                <input name="documento" type="password" maxlength="12" size="12" class="form-control">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12 col-md-2"></div>
                            <div class="col-xs-12 col-md-9">
                                <div class="submit">

                                    <input id="submit1" name="Aceptar"  type="submit" value="Aceptar" title="Aceptar" class="boton" tabindex="Yes">
                                    </td>


                                    <input id="submit1" name="Limpiar" type="reset" value="Limpiar" title="Limpiar" class="boton">
                                </div>

                            </div><div class="col-xs-12 col-md-4"></div>								
                        </div>



                        <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                        </div>


                </div>
            </div>
        </div>

    </form>

    <%} else {%>
    <p>
<center>Este proceso se habilitará en las fechas programadas.</center>
    <%}%>
<p>
</div>
</div>


</body>
</html>