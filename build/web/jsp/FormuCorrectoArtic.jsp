<%-- 
    Document   : FormuCorrectoArtic
    Created on : 25/04/2012, 03:57:06 PM
    Author     : lrodriguez
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.text.NumberFormat" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        String nsol = request.getParameter("nsol");
        String nombre = request.getParameter("nombre");
        String plan = request.getParameter("plan");
        String acud = request.getParameter("acud");
        String tipoest = "S";
        configeci.configuracion confeci = new configeci.configuracion();
        StringTokenizer st = new StringTokenizer(confeci.getPeriodo(), "-");
        configeci.configuracion confEci = new configeci.configuracion();
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        //Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);

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
         if (plan.equals("264")) {
            programa = "INGENIERIA AMBIENTAL";
        }
%>
<html>
    <head>
        <title>Formulario Inscripci�n del Aspirante</title>
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
        <div align="center">
            <table width="700" border="0" class="textoimpre">
                <tr>
                    <td width="14%" height="69"><img src="img/logo.gif" width="83" height="90"></td>
                    <td width="2%" height="69">&nbsp;</td>
                    <td width="84%" height="69">
                        <div align="center">
                            <p><b><font color="#CC0000">ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
                            JULIO GARAVITO</font></b></p>
                            <p><b>SOLICITUD DE INSCRIPCI�N PROGRAMAS DE ARTICULACI�N </b><br>
                            </p>
                        </div>
                    </td>
                </tr>
            </table>
            <table width="700" border="0" cellspacing="0" cellpadding="0" class="textoimpre">
                <tr>
                    <td>
                        <p>&nbsp;
                        <p><big><strong>Estimado Estudiante: Muchas Gracias. Su inscripci�n ha sido realizada de
                        manera satisfactoria al programa de Articulaci�n para el periodo acad�mico <%=confeci.getPeriodo()%>.
<P>
                        Programa:<%=programa%></strong></big><b><br>
                        </b> <br>
                        <b>N&uacute;mero de Preinscripci&oacute;n: <%=nsol%></b><br>
                        <br>
                        Nombre del aspirante: <%=nombre%><br>
                        <br>
                        Nombre del acudiente: <%=acud.toUpperCase()%><br>
                        <br>

Recuerde que debe enviar al correo electr�nico articulacion@escuelaing.edu.co, antes del 7 de junio de 2018 los siguientes documentos:<br>

1. Fotocopia del carn� del colegio al 150%
<BR>
2. Fotocopia del documento de identidad al 150%
<BR>
3. Fotocopia del carn� de la EPS al 150%
<BR>
4. Certificado de notas obtenidas por el estudiante en los �ltimos cuatro grados del bachillerato (8, 9, 10 y 11)
<BR>
5. Recomendaci�n escrita del colegio a nombre del estudiante
<BR>
Es importante tener en cuenta que para evaluar la solicitud, debe haber enviado el total de los documentos requeridos para la inscripci�n, antes de la fecha se�alada.
<P>
Cordialmente,
<P>

PROGRAMA DE ARTICULACI�N

                        <form name="imprime" id="imprime">
                            <p align="center">
                                <center>
                                    <INPUT type=button name="print" id="print" value="Imprimir" onClick="javascript: imprimir()" class="boton">
                                    &nbsp;&nbsp;
                                    <input type="button" value="Cerrar ventana" onclick="window.close()" name="cerrar" id="cerrar" class="boton">
                                </center>
                            </p>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
