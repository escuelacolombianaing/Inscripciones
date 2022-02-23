<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="BDatos.BDadmisiones"%>

<%
    HttpSession sesion;
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    String idEst = request.getParameter("idEst");
    String nsol = request.getParameter("solicitud");
    String nombre = request.getParameter("nombre");
    String prog = request.getParameter("prog");
    String acud = request.getParameter("acud");
    String documento = request.getParameter("docestud");
    String tipoest = request.getParameter("tipoest");
    BDadmisiones admision = new BDadmisiones();
    configeci.configuracion confeci = new configeci.configuracion();
    Vector estud = admision.getInfoEst(idEst);

    Vector pregrados = bd.pregrado(oout, confeci.getPeriodo(), tipoest);
    //    Vector anotacionR = admision.AnotacionReint(estud.elementAt(0).toString(), confeci.getPeriodo());
%>


<html>
    <head>
        <title>Formulario Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <!--<link REL="stylesheet" TYPE="text/css" HREF="StyleSheet1.css"><script language="JavaScript" src="DatGenPost_Valid.js" type="text/javascript"></script>-->
    </head>

    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="Consulta número de referencia" />
        </jsp:include>
        <%
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            Date currentTime_1 = new Date();
            String dateString = formatter.format(currentTime_1);
        %>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-9">
                    <table width="45%" border="0" cellspacing="0" cellpadding="0" class="textoimpre" align="center">
                        <tr>
                            <td>
                                <p align="left"><b>Solicitud de reintegro No: <%=nsol%></b></p>
                                <p align="left"><b>Nombre del aspirante: <%=nombre%></b></p>
                                <p align="left"><b>Programa acad&eacute;mico: <%=prog%></b></p>
                                <p align="left"><b>Fecha: <%=dateString%></b>

                                <!--<p align="left">La respuesta a su solicitud será publicada en la página
                                    el <font color="#FF0000"><b><%=pregrados.elementAt(6)%></b></font>. --><br>
                                    La orden de pago será publicada en la página web de acuerdo a la fecha 
                                    de corte en la que usted haya realizado su solicitud.
                                    <br>
                                    <b>PAGO ORDINARIO:</b>
                                    <br>
                                    Fecha de Solicitud:
                                    <br>
                                    Del 24 de febrero al 14 de mayo de 2020, puede consultar su orden de pago el 18 de mayo de 2020, después de las 6:00 p.m.
                                    <br>
                                    Del 18 de mayo al 3 de junio de 2020, puede consultar su orden de pago el 5 de junio de 2020, después de las 6:00 p.m.
                                    <br>
                                    <b>PAGO EXTEMPORANEO:</b>
                                    <br>
                                    Fecha de Solicitud:
                                    <br>
                                    Del 8 al 24 de junio de 2020, puede consultar su orden de pago el 26 de junio de 2020 después de las 6:00 p.m.
                                    <br>
                                    Para cualquier aclaración comuníquese con la Oficina de Admisiones e-mail: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a> o al teléfono 6683600 ext. 146 o 518.
                                </p>
                                <!-- Si desea solicitar curso para el período intersemestral, deberá preinscribirlo
                                 únicamente en las fechas establecidas para este proceso a través de la página
                                 web de la Escuela en la opción de "Servicios Académicos".
                                 <p>Se permite el registro de hasta ocho  (8) créditos académicos y no más de dos (2) asignaturas en el período
                                 intersemestral, previa autorización del Decano correspondiente (Resolución No 01 de 2005, Consejo Académico),
                                 para ver el número de créditos de las asignaturas se pueden consultar a través de la página web de la Escuela,
                                 en el plan de estudios del programa académico al que pertenece el estudiante.
                                 <p>El listado de los cursos ofrecidos para el período intersemestral será
                                 publicado el 18 de Mayo y la autorización del(os) curso(s) solicitado(s)
                                 dependerá de los cupos disponibles en cada asignatura.-->

                            </td>
                        </tr>
                    </table>

                    <div align="center"></div>
                    <form>
                        <p align="left">&nbsp;</p>
                        <p align="center"><INPUT type=button name=print  class="boton" value="Imprimir" onClick="javascript:window.print()">&nbsp;&nbsp;<input type="button"  class="boton"  value="Cerrar ventana" onclick="window.close()">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
