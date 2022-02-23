<%-- 
    Document   : solicitudreadmision
    Created on : 31/08/2009, 03:56:33 PM
    Author     : lrodriguez
--%>
<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% try {
        response.setHeader("Cache-Control", "no-cache");
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
        titulo = "Inscripciones en línea";
        /* Inscripciones Extemporáneas*/

        if (tipoest.equals("E") || tipoest.equals("T")) {
            titulo = "Inscripciones en línea";
        }

        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);
        if (pregrados.size() > 0) {
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
    <head><title>Autenticación para Inscripción</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE READMISION A LOS PROGRAMAS ACADÉMICOS DE PREGRADO" />
        </jsp:include>

        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">   
                    <%if (ban == 0) {%>
                    <p>
                    <center><b>Este proceso sólo se habilitará en las fechas programadas que aparecen en el calendario de admisiones,<br> para cualquier información adicional,comuníquese con la Oficina de Admisiones, opción 2 en el menú.</b></center>

                    <%} else {%>
                    <p>Para realizar la solicitud de Readmisión a alguno de los programas académicos
                                    de la Escuela Colombiana de Ingeniería, por favor registre el n&uacute;mero
                                    de Documento; y el password.</p>
                      
                    <form method="POST" action="Readmision">
                        <input type="hidden" name="impre" value="<!%=impre%>">
                        <div class="col-xs-8 col-md-5 col-md-offset-1">	
                            <p><strong>Documento de Identidad&nbsp; </strong>  
                        </div>
                        <div class="col-xs-10 col-md-2 ">
                            <div class="form-group">
                                <strong> 
                                    <input type="text" name="idEst" size="10"  size="15" maxlength="15" class="form-control" ></strong>
                            </div>
                        </div>
                        <!--div class="col-xs-12 col-md-5 col-md-offset-1">	
                            <p><strong>Password&nbsp; </strong></div>
                        <div class="col-xs-80 col-md-2">
                            <div class="form-group">
                                <strong> 
                                    <input name="clave" type="password" size="15" class="form-control" ></strong>
                            </div>
                        </div-->
                         </div>
            </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-11 col-md-offset-2" >
                                <div class="submit">
                                    <input class="btn btn-primary btn-lg" type="submit" value="Enviar Datos"/>
                                </div>
                            </div>

                            <div class="col-xs-12 col-md-4"></div>								
                        </div>

                        <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                        </div>
    </form>
                     </div>
    <%}%>
    <!jsp:include page="piepag">
<!jsp:param name="parametro" value="" />
<!--/jsp:include-->
</body>
</html>
<%}
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Solicitud readmision", e.getMessage());
    }
%>