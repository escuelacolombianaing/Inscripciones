<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    configeci.configuracion confEci = new configeci.configuracion();
    String ref;
    String nsol = request.getParameter("nsol");
    String nombre = request.getParameter("nombre");
    String plan = request.getParameter("plan");
    String programa = "";
    otros.rutas ruta = new otros.rutas();
    Vector cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), plan);

    if (plan.equals("290")) {
        programa = "MAESTRIA EN ING CIVIL CON ENFASIS EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
    }
    if (plan.equals("291")) {
        programa = "MAESTRIA EN ING CIVIL CON ENFASIS EN INGENIERIA ESTRUCTURAL";
    }
    if (plan.equals("292")) {
        programa = "MAESTRIA EN ING CIVIL CON ENFASIS EN INGENIERIA AMBIENTAL";
    }
    if (plan.equals("293")) {
        programa = "MAESTRIA EN ING CIVIL CON ENFASIS EN GEOTECNIA- MODALIDAD DE PROFUNDIZACION";
    }
    if (plan.equals("294")) {
        programa = "MAESTRIA EN ING CIVIL CON ENFASIS EN TRANSITO Y TRANSPORTE - MODALIDAD DE PROFUNDIZACION";
    }
    if (plan.equals("353")) {
        programa = "MAESTRIA EN GESTION DE INFORMACIÓN";
    }
    if (plan.equals("332")) {
        programa = "MAESTRIA EN INGENIERIA ELECTRONICA - MODALIDAD DE PROFUNDIZACIÓN";
    }
    if (plan.equals("333")) {
        programa = "MAESTRIA EN INGENIERIA ELECTRONICA  - MODALIDAD DE INVESTIGACIÓN";
    }
    if (plan.equals("351")) {
        programa = "MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS  - MODALIDAD DE PROFUNDIZACIÓN";
    }
    if (plan.equals("330")) {
        programa = "MAESTRIA EN INGENIERIA INDUSTRIAL - MODALIDAD DE PROFUNDIZACIÓN";
    }
    if (plan.equals("331")) {
        programa = "MAESTRIA EN INGENIERIA INDUSTRIAL - MODALIDAD DE INVESTIGACIÓN";
    }
    if (plan.equals("371")) {
        programa = "MAESTRÍA EN INFORMÁTICA";
    }
    if (plan.equals("372")) {
        programa = "MAESTRÍA EN CIENCIAS ACTUARIALES";
    }
    if (plan.equals("376")) {
        programa = "MAESTRÍA EN CIENCIA DE DATOS - MODALIDAD DE PROFUNDIZACIÓN";
    }
    if (plan.equals("377")) {
        programa = "MAESTRÍA EN CIENCIA DE DATOS - MODALIDAD DE INVESTIGACIÓN";
    }
%>
<html>
    <head>
        <title>Formulario Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/FormularioPosgrado.css">
        <link rel="stylesheet" href="css/admisionFormulario.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    </head>
    <body>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA " />

        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-12">

                    <table width="70%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td valign="top">
                                <p align="left"><big><strong>Estimado Aspirante: Muchas Gracias. Su información
                                ya ha ingresado a nuestro sistema.</strong> </big></p>
                        <p align="left"><b>Usted esta preinscrito a la : </b><%=programa%>.
                        </p>
                        <p align="left"> <b>Preinscripci&oacute;n No: <%=nsol%></b><br>
                            <b>Nombre del aspirante: <%=nombre.toUpperCase()%> </b></p>
                        <ol>
                            <li> <b>Para formalizar la inscripci&oacute;n, debe cargar en un documento 
                                    .pdf el conjunto de documentos detallados m&aacute;s adelante, a trav&eacute;s 
                                    del siguiente <a href="ValidaPos">LINK</a>, 
                                    y a m&aacute;s tardar el <%=cronograma.elementAt(4)%>. as&iacute;:</b></li>
                        </ol>
                        <ul>
                            <li><font color="#000000" >Formulario impreso con fotografía a color 3x4cm.</font></li>
                            <li><font color="#000000" >Carta de presentaci&oacute;n del aspirante 
                                (1 p&aacute;gina m&aacute;ximo)</font></li>
                            <li><font color="#000000" >Hoja de vida resumida (2 p&aacute;ginas m&aacute;ximo 
                                y sin anexos)</font></li>
                            <li><font color="#000000" >Fotocopia del documento de identidad ampliada 
                                al 150%.</font></li>
                            <li><font color="#000000" >Fotocopia de la tarjeta profesional de ingeniero 
                                o certificado de que se encuentra en tr&aacute;mite</font></li>
                            <li><font color="#000000" >Fotocopia legible del diploma o del acta de 
                                grado que acredite el grado profesional del aspirante</font></li>
                            <li><font color="#000000" > Fotocopia del certificado de notas de las 
                                calificaciones de pregrado que incluya el promedio de la carrera.</font></li>
                            <li>Dos cartas de recomendaci&oacute;n <a href=ReferenciasPos">ver formato 
                                    aqu&iacute;</a>, preferiblemente de profesores del &aacute;rea o jefes 
                                inmediatos. </li>
                        </ul>
                        <p>
                            <!--Especializacion en GESTION DE INFORMACION -->
                        </p>
                        <ol start="2">
                            <li> Presentaci&oacute;n de entrevista</li>
                        </ol>
                        <ul>
                            <li>El Comit&eacute; del Programa estudiar&aacute; cada solicitud, y si
                                lo encuentra necesario, citar&aacute; a los candidatos a entrevista
                                <%=cronograma.elementAt(8)%> para lo cual podr&aacute; consultar con el n&uacute;mero
                                de su documento de identidad en la P&aacute;gina Web de la Escuela,
                                en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot; de la <b> &quot;<%=programa%>&quot;</b>, la fecha, hora y el lugar de las mismas.

                            <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de
                                    selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Página
                                Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot;
                                de la &quot;<b><%=programa%>&quot;, </b> a partir del d&iacute;a <%=cronograma.elementAt(10)%><font color="#000000">,
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento
                                de identidad</font>.</li>
                        </ul>
                        <p>Nota: Informaci&oacute;n adicional en la Direcci&oacute;n de la Maestría,
                            <% if (plan.equals("290") || plan.equals("291") || plan.equals("292") || plan.equals("293") || plan.equals("294")) {%>
                            Oficina Edificio L-1 o comunicarse telef&oacute;nicamente al 6683600 extensi&oacute;n
                            164 o al e-mail: <a href="mailto:maestriacivil@escuelaing.edu.co">maestriacivil@escuelaing.edu.co</a></p>

                        <%} else if (plan.equals("332")) {%>
                        e-mail: <a href="mailto:alexander.perez@escuelaing.edu.co">alexander.perez@escuelaing.edu.co</a><br>
                        ó <a href="mailto:maestria.electronica@escuelaing.edu.co">maestria.electronica@escuelaing.edu.co</a>
                        <%} else if (plan.equals("351")||plan.equals("371")||plan.equals("372")) {%>
                        e-mail: <a href="mailto:posgrados@escuelaing.edu.co">posgrados@escuelaing.edu.co</a><br>
                        <%} else if (plan.equals("353")) {%>
                        e-mail: <a href="mailto:victoria.ospina@escuelaing.edu.co">victoria.ospina@escuelaing.edu.co</a><br>
                        <a href="mailto:maestria.gestioninf@escuelaing.edu.co">maestria.gestioninf@escuelaing.edu.co</a>
                        <%}%>
                        </td>
                        </tr>
                    </table><br>
                </div>
            </div>
        </div>
        <table width="90%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td><form>
                        <p align="center">
                        <center>
                            <INPUT type=button name=print value="Imprimir" onClick="javascript:window.print()">
                            &nbsp;&nbsp;
                            <input type="button" value="Cerrar ventana" onclick="window.close()">
                        </center>
                        </p>
                    </form></td>
            </tr>
        </table>


    </body>
</html>

