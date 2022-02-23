<%-- 
    Document   : CitacionExamen
    Created on : 22/10/2015, 10:34:13 AM
    Author     : Lucero
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% String docEst = request.getParameter("docEst");
    configeci.configuracion confEci = new configeci.configuracion();
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    Vector citacion = bd.Examen(docEst);
    String carnet = new String();
    Vector examenC = bd.ExamenConoc(docEst, confEci.getPeriodo(), oout);
    String tipoexa = "";
    if (examenC.size() > 0) {
        tipoexa = examenC.elementAt(3).toString();
        carnet = examenC.elementAt(0).toString();
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Citación Examen de Conocimiento</title>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

        <link href="css/estilo-resultadoconocimiento.css" rel="stylesheet" type="text/css" media="all">
    </head>

    <body>
    <head>  <div id="container">
        <header>
            <div class="logoescuela">
                <img src="img/logo-ESCUELA.svg"/>
            </div>
            <img src="img/banner.jpg" />
            <div class="osiris">Desarrollado por: Direcci&oacute;n de Tecnolog&iacute;a Osiris y Direcci&oacute;n de Comunicaciones y Mercadeo</div>
            <link href="css/comun.css" rel="stylesheet" type="text/css">
        </header>

        <p>&nbsp;</p>

        <table ALIGN="center" width="80%" border="0" class="textoimpremas">

            <!--%  if (tipoexa.equals("P")) {
                    if (citacion.size() > 0) {

                        for (int j = 0; j < citacion.size(); j++) {
                            Vector cita = (Vector) citacion.elementAt(j);
                            String sitio = cita.elementAt(1).toString();
                            String horaini = cita.elementAt(3).toString();
                            String horafin = cita.elementAt(4).toString();
                            String examen = cita.elementAt(5).toString();
                            String nombres = cita.elementAt(6).toString();
                            String fec = cita.elementAt(7).toString();
                            String programa = cita.elementAt(8).toString();
                            if (j == 0) {%> 

            <tr> 
                <td colspan="2"> <b><!%=nombres%>  - <!%=programa%></b></td>     </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>


            <!%}%>
            <tr> 
                <td width="7%"><b>Examen:</b></td>
                <td width="73%"><b><!%=examen%></b></td>

            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr> 
                <td width="7%">Fecha:</td>
                <td width="73%"> <!%=fec%></td>
            </tr>
            <tr> 
                <td width="7%">Sitio:</td>
                <td width="73%"> <!%=sitio%></td>
            </tr>
            <tr> 
                <td width="7%">Hora Inicial:</td>
                <td width="73%"><!%=horaini%></td>
            </tr>
            <tr> 
                <td width="7%">Hora Final:</td>
                <td width="73%"><!%=horafin%></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <p>&nbsp;</p>
            <h1></h1>

            <!%
                }
            } else {%>
            <tr>
                <td colspan="2">Su pago no se encuentra registrado.</td>
            </tr>

            <!%}

            } else -->

            <%  //if (tipoexa.equals("V")) {
                Vector virtual = bd.ExaVirtual(docEst);

                if (virtual.size() > 0) {
                    // String fecha = virtual.elementAt(1).toString();
                    String prog = virtual.elementAt(2).toString();
                    String progra = virtual.elementAt(3).toString();
                    String nombres = virtual.elementAt(4).toString();
            %>
            <div class="textoimpremas"><b>Nombres: <%=nombres%> <br>
                    Programa: <%=progra%></b>
            </div><br><br>
            <div class="textoimpremas">
                Los exámenes de conocimientos deben presentarse desde cualquier lugar con conexión a internet del 08 luego de medio día al 09 de julio de 2020
                <br><br>
                El tiempo máximo para resolver cada uno de los exámenes es de 90 minutos y para cada uno de ellos podrá ingresar solamente una vez, por lo que es importante que organice el tiempo para poder responder todos los exámenes que debe presentar antes de la hora de cierre de éstos.
                <br><br>	Tenga en cuenta que los exámenes son independientes, por lo tanto usted puede definir cuándo los presenta, siempre que lo haga en el horario y fechas establecidas.
                <p>

                    <br>
                    <% if (prog.equals("13") || prog.equals("14") || prog.equals("15") || prog.equals("17") || prog.equals("262")) {%>
                    Recuerde que usted debe presentar examen  para las áreas de Matemáticas y Física.
                    <%} else if (prog.equals("16") || prog.equals("20") || prog.equals("260") || prog.equals("264")) {%>
                    Recuerde que usted debe presentar examen  para las áreas de Matemáticas, Física y Química.
                    <%} else if (prog.equals("18") || prog.equals("19")) {%>
                    Recuerde que usted debe presentar examen para el área de Matemáticas.
                    <%}%>
                    <br>
                    <br>
                    <br>
                    Para presentar su examen de conocimiento las credenciales son su número de documento en Usuario y ese mismo número de documento como contraseña. Acceda haciendo clic <a href="http://campusvirtual.escuelaing.edu.co/moodle/">AQUI</a>
                    <br>
                    
                    <%} else {%>
                <div class="textoimpremas">Su pago no se encuentra registrado.
                </div>
                <%}
                //}%>
            </div>
            <tr>
                <td>
                    <div align="right"></div>
                </td>
            </tr>
            <tr> 
                <td colspan=2>
                    <br>
                    <p><a href="https://tycho.escuelaing.edu.co/contenido/transmisiones/examenConocimientos/index.html">Ver aqu&iacute; instrucciones para la presentaci&oacute;n del examen.</a> 
                    </p>
                    <p>&nbsp;</p>
                </td>
            </tr>
        </table>
        <div align="center">
            <input name="atras" class="boton"  type="submit" id="" value="Atrás" onClick="location.href = 'ConsultaExamen?documento=<%=docEst%>'">
            <input name="Salir" class="boton"  type="submit" id="" value="Salir" onClick="location.href = 'http://www.escuelaing.edu.co'">
        </div>
    </section>

    <footer>
        <span class="programa">
            Escuela Colombiana de Ingeniería Julio Garavito
        </span>

        <span class="direccion">
            AK.45 No.205-59 (Autopista Norte) costado occidental<br/>
            Contact Center: +57(1) 668 3600<br/>
            Línea Nacional Gratuita: 018000112668<br/>
            www.escuelaing.edu.co<br/>
            Bogotá, D.C. - Colombia<br/>
        </span>
    </footer>
</body>
</html>