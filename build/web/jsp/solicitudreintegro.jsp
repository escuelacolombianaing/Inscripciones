<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% response.setHeader("Cache-Control", "no-cache");
//configeci.configuracion confEci = new configeci.configuracion();
    HttpSession sesion;
//sesion = request.getSession(true);
    String tipoest = request.getParameter("tipoest");
    String icfes = "", pais = "", colegio = "", bachiller = "";
    String titulo = new String("");
    configeci.configuracion confEci = new configeci.configuracion();
    response.setHeader("Cache-Control", "no-cache");
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    int ban = 0;
    //Convertir el dato String a Date para compararlo mas adelante.
    Date hoy = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    String fechaActual = formatter.format(hoy);
    titulo = " Inscripciones en línea";
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

    if (tipoest.equals("N")) {
        bachiller = request.getParameter("bachiller");
        icfes = request.getParameter("icfes");
        pais = request.getParameter("pais");
        colegio = request.getParameter("colegio");
    }
%>
<html>
    <head><title>Autenticación para Inscripción</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE REINTEGRO A LOS PROGRAMAS ACADÉMICOS DE PREGRADO" />
        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">   
                    <%if (ban == 0) {%>
                    <p>
                    <center><b>Este proceso sólo se habilitará en las fechas programadas que aparecen en el calendario de admisiones,<br> para cualquier información adicional,comuníquese con la Oficina de Admisiones, opción 2 en el menú.</b></center>

                    <%} else {%>
                    <p>Para realizar la solicitud de reintegro a alguno de los programas académicos
                        de la Escuela Colombiana de Ingeniería, por favor registre el n&uacute;mero
                        de Documento.</p>

                    <form method="POST" action="FormuReintegro">
                        <input type="hidden" name="impre" value="<!%=impre%>">
                        <div class="col-xs-12 col-md-5 col-md-offset-1">	
                            <p><strong>Documento de identidad </strong>  
                        </div>
                        <div class="col-xs-80 col-md-2">
                            <div class="form-group espaciado">
                                <strong> 
                                    <input type="text" name="idEst" size="10" class="form-control" ></strong>
                            </div>
                        </div>
                        <!--div class="col-xs-12 col-md-5 col-md-offset-1">	
                            <p><strong>Password</strong></div-->
                        <!--div class="col-xs-80 col-md-2">
                            <div class="form-group espaciado">
                                <strong> 
                                    <input type="text" name="clave" size="15" class="form-control" ></strong>
                            </div>
                        </div-->

                        <div class="col-xs-12 col-md-12 col-md-offset-6">
                            <div class="col-xs-80 col-md-8">
                                <div class="form-group espaciado">
                                    <input class="boton" type="submit" value="Enviar" />
                                </div>

                                <div class="col-xs-12 col-md-4"></div>								
                            </div>
                        </div>

                    </form>
                    <%}%>
                </div>
            </div>
                    </body>
                    </html>