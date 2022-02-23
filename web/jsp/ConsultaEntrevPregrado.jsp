<%-- 
    Document   : ConsultaEntrevBeca
    Created on : 31/07/2009, 04:36:51 PM
    Author     : lrodriguez
--%>

<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% try {

        configeci.configuracion confEci = new configeci.configuracion();
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        String arreglo[] = new String[50];
        String texto[] = new String[20];
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String tipprog = request.getParameter("prog");
        String prog = "";

        String fecread = confEci.getFecRead();
        Date currentTime_1 = new Date();
        String dateString = formatter.format(currentTime_1);
        ParsePosition pos = new ParsePosition(0);
        Date currentTime_2 = formatter.parse(dateString, pos);
        int l, b = 0, a = 0, s = 0, ban = 0, k;
        Date hoy = new Date();
        String fechaActual = formatter.format(hoy);
        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipprog);%>

<% if (pregrados.size() > 0) {
        Date fechafin = new Date();
        String dato = new String(pregrados.elementAt(1).toString());
        prog = new String(pregrados.elementAt(3).toString());
        String datofin = new String(pregrados.elementAt(2).toString());
        Date inicio = formatter.parse(dato);
        Date finall = formatter.parse(datofin);
        String X = formatter.format(inicio);
        String Y = formatter.format(finall);
        if (prog.equals(tipprog)) {
            if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y)) && (pregrados.elementAt(5).equals("1"))) {
                ban = 1;
            }
        }



%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
  <title>Consulta Entrevista </title>
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="ENTREVISTAS ASPIRANTES A UN PROGRAMA DE PREGRADO " />
        </jsp:include>
         <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
        
        <% if (ban == 1 && (tipprog.equals("ET") || tipprog.equals("EB"))) {%>

        
            <form name="form1" method="post" action="EntrevistaPregrado">
                <input name="tipprog" type="hidden" value="<%=tipprog%>">
                
                        <div class="col-xs-12 col-md-5 col-md-offset-1">	
                            <p><strong>Documento Identidad&nbsp; <br>(Sin puntos, ni comas ni guiones)&nbsp; </strong></div>
                        <div class="col-xs-80 col-md-2">
                            <div class="form-group espaciado">
                                <strong> 
                                    <input type="text" name="documento" type="password" size="12" class="form-control" ></strong>
                            </div>
                        </div>
                        <div class="row">
                        <div class="col-xs-12 col-md-2"></div>
                        <div class="col-xs-12 col-md-9">
                            <div class="submit">
                                <input class="boton" type="submit" value="Enviar Datos" >
                                 <!--input class="boton"  name=Limpiar  type=reset value=Limpiar title=Limpiar -->
                            </div>
                          
                        </div><div class="col-xs-12 col-md-4"></div>								
                    </div>
                </div>
            </div></div>
                  
            </form>
       
        <%} else if (ban == 1 && tipprog.equals("EZ")) {%>

        
            <form name="form1" method="post" action="EntrevistaReadmision">
                <input name="tipprog" type="hidden" value="<%=tipprog%>">
                 <div class="col-xs-12 col-md-5 col-md-offset-1">	
                            <p><strong>Documento Identidad&nbsp; <br>(Sin puntos, ni comas ni guiones)&nbsp; </strong></div>
                        <div class="col-xs-80 col-md-2">
                            <div class="form-group espaciado">
                                <strong> 
                                    <input type="text" name="documento" type="password" size="12" class="form-control" ></strong>
                            </div>
                        </div>
                        <div class="row">
                        <div class="col-xs-12 col-md-2"></div>
                        <div class="col-xs-12 col-md-9">
                            <div class="submit">
                                <input class="boton" type="submit" value="Enviar Datos" >
                                 <!--input class="boton"  name=Limpiar  type=reset value=Limpiar title=Limpiar -->
                            </div>
                          
                        </div><div class="col-xs-12 col-md-4"></div>								
                    </div>
                </div>
            </div></div>
            </form>
        </table>
        <%} else {%>
        <p>
    <center>El proceso de consulta de entrevistas no se encuentra disponible en el momento. </center>


    <%}%>

    <%} else {
    %>
    <p>
    <center>No se encuentra información disponible. </center>
        <%}%>

</body>
</html>

<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Consulta Entrev Pregrado", e.getMessage());
    }
%>
