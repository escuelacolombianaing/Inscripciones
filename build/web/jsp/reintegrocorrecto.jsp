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
        <title>Formulario Inscripci�n del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <!--<link REL="stylesheet" TYPE="text/css" HREF="StyleSheet1.css"><script language="JavaScript" src="DatGenPost_Valid.js" type="text/javascript"></script>-->
    </head>

    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="Consulta n�mero de referencia" />
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

                                <!--<p align="left">La respuesta a su solicitud ser� publicada en la p�gina
                                    el <font color="#FF0000"><b><%=pregrados.elementAt(6)%></b></font>. --><br>
                                    La orden de pago ser� publicada en la p�gina web de acuerdo a la fecha 
                                    de corte en la que usted haya realizado su solicitud.
                                    <br>
                                    <b>PAGO ORDINARIO:</b>
                                    <br>
                                    Fecha de Solicitud:
                                    <br>
                                    Del 24 de febrero al 14 de mayo de 2020, puede consultar su orden de pago el 18 de mayo de 2020, despu�s de las 6:00 p.m.
                                    <br>
                                    Del 18 de mayo al 3 de junio de 2020, puede consultar su orden de pago el 5 de junio de 2020, despu�s de las 6:00 p.m.
                                    <br>
                                    <b>PAGO EXTEMPORANEO:</b>
                                    <br>
                                    Fecha de Solicitud:
                                    <br>
                                    Del 8 al 24 de junio de 2020, puede consultar su orden de pago el 26 de junio de 2020 despu�s de las 6:00 p.m.
                                    <br>
                                    Para cualquier aclaraci�n comun�quese con la Oficina de Admisiones e-mail: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a> o al tel�fono 6683600 ext. 146 o 518.
                                </p>
                                <!-- Si desea solicitar curso para el per�odo intersemestral, deber� preinscribirlo
                                 �nicamente en las fechas establecidas para este proceso a trav�s de la p�gina
                                 web de la Escuela en la opci�n de "Servicios Acad�micos".
                                 <p>Se permite el registro de hasta ocho  (8) cr�ditos acad�micos y no m�s de dos (2) asignaturas en el per�odo
                                 intersemestral, previa autorizaci�n del Decano correspondiente (Resoluci�n No 01 de 2005, Consejo Acad�mico),
                                 para ver el n�mero de cr�ditos de las asignaturas se pueden consultar a trav�s de la p�gina web de la Escuela,
                                 en el plan de estudios del programa acad�mico al que pertenece el estudiante.
                                 <p>El listado de los cursos ofrecidos para el per�odo intersemestral ser�
                                 publicado el 18 de Mayo y la autorizaci�n del(os) curso(s) solicitado(s)
                                 depender� de los cupos disponibles en cada asignatura.-->

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
