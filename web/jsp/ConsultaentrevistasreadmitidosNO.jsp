<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%response.setHeader("Cache-Control", "no-cache");
        HttpSession sesion;
        sesion = request.getSession(true);
        String plan = request.getParameter("iddpto");
        PrintWriter oout = response.getWriter();
        String prog = "";
        String docEst = request.getParameter("documento");
        configeci.configuracion confEci = new configeci.configuracion();
        BDadmisiones bd = new BDadmisiones();
        /*boolean entrevistas = confEci.getEntrevistas(plan);*/
        if (plan != null && !plan.equals("")) {
%>	

<html>
<head>
    <title>Consulta Entrevistas Readmitidos</title>
    <link href="css/comun.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<jsp:include page="encabezado">
    <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
    <jsp:param name="titulo" value="CONSULTA ENTREVISTAS READMITIDOS " />
</jsp:include>
<body bgcolor="#FFFFFF" text="#000000">

<p>

    <%Vector estud = bd.Entrevistas(docEst, oout);%>

    <%Vector estadoread = bd.EstadoReadmision(docEst,  oout);%>
    <p>


    <%if ((estadoread.size()) == 0) {%>


    <table width="70%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas" align="center">
        <tr>
            <td>
                <div align="center"><br>
                    No est� autorizado para realizar este proceso, por favor comun�quese con
                    la Oficina de Admisiones. <br>
                Tel&eacute;fono: 6683600 Ext: 274, 263 o 101. </div>
            </td>
        </tr>
    </table>

    <%} else
    for (int k = 0; k < estadoread.size(); k++) {
        Vector readmi = (Vector) estadoread.elementAt(k);%>

    <table width="50%" border="0" cellspacing="0" cellpadding="0"   class="textoimpremas" align="center">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <%if (readmi.elementAt(1).equals("13")) {
                prog = "INGENIERIA CIVIL";

            } else if (readmi.elementAt(1).equals("14")) {
                prog = "INGENIERIA ELECTRICA";

            } else if (readmi.elementAt(1).equals("15")) {
                prog = "INGENIERIA DE SISTEMAS";

            } else if (readmi.elementAt(1).equals("16")) {
                prog = "INGENIERIA INDUSTRIAL";

            } else if (readmi.elementAt(1).equals("17")) {
                prog = "INGENIERIA ELECTRONICA";

            } else if (readmi.elementAt(1).equals("18")) {
                prog = "ECONOMIA";

            } else if (readmi.elementAt(1).equals("19")) {
                prog = "ADMINISTRACION DE EMPRESAS";

            } else if (readmi.elementAt(1).equals("20")) {
                prog = "MATEMATICAS";

            } else if (readmi.elementAt(1).equals("260")) {
                prog = "INGENIERIA MECANICA";

            }%>
    <tr>
        <td>Estudio de admisi&oacute;n para el programa de <b><%=prog%></b></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td height="19">
            <p><%=readmi.elementAt(0)%></p>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Apreciado Aspirante:</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>

    <%if (readmi.elementAt(3).equals("0")) {
                // out.println(readmi.elementAt(3));
                for (int j = 0; j < estud.size(); j++) {
                    Vector estudiante = (Vector) estud.elementAt(j);%>
    <tr>
        <td>
            <p>Como parte del estudio de su solicitud de readmisi&oacute;n  le informamos que deber&aacute; presentar  entrevistas as�:
                <b> <%=estudiante.elementAt(2)%>, a las <%=estudiante.elementAt(3)%>
                en la <%=estudiante.elementAt(6)%></b>, con PSC: <%=estudiante.elementAt(7)%>,        el pr&oacute;ximo<b> <%=estudiante.elementAt(2)%>, a las <%=estudiante.elementAt(3)%>
            en la <%=estudiante.elementAt(6)%></b>, con PSC: <%=estudiante.elementAt(7)%>  en <B>COMPA�IA DE SU ACUDIENTE</B> </p>
           
            <br>El 14 de Julio deber� consultar la respuesta a su solicitud en <a href="http://www.escuelaing.edu.co/admisiones/aspirantes_01.htm"> Readmisi�n - Admitidos</a></br>
            <p>Cordialmente</p>
            <p>Oficina de Admisiones</p>
            <p>Ext.274,263 &oacute; 101</p>
        </td>
    </tr>
    <%}
} else if (readmi.elementAt(3).equals("1")) {%>
    <tr>
    <td>
   
Le informamos que su solicitud de Readmisi&oacute;n para el periodo 2009-2, ha sido aprobada. 
        <br>Deber� cursar todas las asignaturas correspondientes al Primer Nivel del plan de estudios vigente para el 2009-2. Se le retirar�n del Registro todas las notas obtenidas en todos los cursos aprobados o no aprobados hasta el momento para efectos de las condiciones de permanencia expresadas en le Reglamento Estudiantil y la expedici�n de certificados (Art�culo 92, Reglamento Estudiantil).
        <br>Debera cumplir con las condiciones de permanencia expresadas en el Art. 90 del Reglamento Estudiantil, en las cuales se exige obtener un promedio acumulado de calificaciones igual o superior a tres coma cero (3,0), incluido el �ltimo per�odo acad�mico cursado y no reprobar por tercera vez una asignatura.
        <br> Deber� imprimir nuevamente su orden de pago para cancelar los derechos de matr�cula correspondientes. Si usted
        ya cancel� deber� firmar acta de matr�cula y realizar su horario en las fechas programadas para tal fin.
        <br>
        Le deseamos �xitos en el desarrollo de sus estudios.
        
        Atentamente,

        Psi. Nancy Barrero Ram�rez
        Jefe de Admisiones

</td>
</tr>
<%}
                }
        }

%>
</table>
</body>
</html>