<%-- 
    Document   : FormularioCorrectoPiloPaga
    Created on : 10/11/2017, 03:29:08 PM
    Author     : lucero.rodriguez
--%>

<%@page import="utiles.Correo"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.text.NumberFormat" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% try {
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        String nsol = request.getParameter("nsol");
        String nombre = request.getParameter("nombre");
        String plan = request.getParameter("plan");
        String acud = request.getParameter("acud");
        NumberFormat formato = new DecimalFormat("#,###,###");
        String matdef = request.getParameter("matdef");
        String tipoest = request.getParameter("tipoest");
        String pilo = request.getParameter("pilo");
        String baseliq = request.getParameter("baseliq");
        String baspru = request.getParameter("baspru");

        configeci.configuracion confeci = new configeci.configuracion();
        StringTokenizer st = new StringTokenizer(confeci.getPeriodo(), "-");
        configeci.configuracion confEci = new configeci.configuracion();
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();

        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);
        Vector rangos = bd.getRangomatric(matdef);
        if (rangos.size() > 0) {
            String vini = (rangos.elementAt(1).toString());
            String vfin = (rangos.elementAt(2).toString());
            matdef = formato.format(Integer.parseInt(matdef)).replaceFirst("\\.", "'");
            vini = formato.format(Integer.parseInt(vini)).replaceFirst("\\.", "'");
            vfin = formato.format(Integer.parseInt(vfin)).replaceFirst("\\.", "'");
            //  int anniograv = Integer.parseInt(st.nextElement().toString().trim());
            String programa = "";

            if (plan.equals("13")) {
                programa = "INGENIERIA CIVIL";
            }
            if (plan.equals("14")) {
                programa = "INGENIERIA ELECTRICA";
            }
            if (plan.equals("15")) {
                programa = "INGENIERIA DE SISTEMAS";
            }
            if (plan.equals("16")) {
                programa = "INGENIERIA INDUSTRIAL";
            }
            if (plan.equals("17")) {
                programa = "INGENIERIA ELECTRONICA";
            }
            if (plan.equals("18")) {
                programa = "ECONOMIA";
            }
            if (plan.equals("19")) {
                programa = "ADMINISTRACION DE EMPRESAS";
            }
            if (plan.equals("20")) {
                programa = "MATEMATICAS";
            }
            if (plan.equals("260")) {
                programa = "INGENIERIA MECANICA";
            }
            if (plan.equals("262")) {
                programa = "INGENIERIA BIOMEDICA";
            }
            if (plan.equals("264")) {
                programa = "INGENIERIA AMBIENTAL";
            }
%>
<html>
    <head>
        <title>Formulario Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function imprimir(){
            document.getElementById("print").style.visibility='hidden';
            document.getElementById("cerrar").style.visibility='hidden';
            window.print();
            setTimeout ("document.imprime.print.style.visibility='visible';", 8000);
            setTimeout ("document.imprime.cerrar.style.visibility='visible';", 8000);

            }

            function MM_openBrWindow(theURL,winName,features) { //v2.0
            window.open(theURL,winName,features);
            }

            -->
        </script>
    </head>

    <body>
        <jsp:include page="encabezado">
            <jsp:param name="titulo" value="" />
        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">

                    <table width="700" border="0" cellspacing="0" cellpadding="0" class="textoimpre">
                        <tr>
                            <td>
                                <p>&nbsp;
                                <p><big><strong>Estimado Aspirante: Muchas Gracias. Su información ya 
                                ha ingresado a nuestro sistema. Usted esta preinscrito al programa: 
                                <%=programa%></strong></big><b><br>
                        </b> <br>
                        <b>N&uacute;mero de Preinscripci&oacute;n: <%=nsol%></b><br>
                        <br>
                        Nombre del aspirante: <%=nombre%><br>
                        <br>
                        Nombre del acudiente: <%=acud.toUpperCase()%><br>
                        <br>

                        <b><big><strong>El valor de los derechos de matrícula para el programa ser pilo paga, será informado posterior a su respuesta de admisión.</strong></big>
                            <p> Quien aparece aquí como acudiente es quien debe firmar la carta 
                                que usted debe anexar a los documentos requeridos y hacerlos llegar 
                                a la Oficina de Admisiones, los cuales puede consultar en la sección 
                                de preguntas frecuentes de Aspirantes nuevos.</b><br>
                        <br>
                        <b></b> 
                        <%}%>
                        <form name="imprime" id="imprime">
                            <p align="center">
                            <center>
                                <INPUT type=button name="print" id="print" value="Imprimir" onClick="javascript: imprimir()" class="boton">
                                &nbsp;&nbsp;
                                <input type="button" value="Cerrar ventana" onclick="window.close()" name="cerrar" id="cerrar" class="boton">
                            </center>

                        </form>
                        </td>
                        </tr>
                    </table>
                </div>

            </div>
        </div> 
    </body>
</html>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Formulario Correcto Pilo Paga", e.getMessage());
    }
%>
