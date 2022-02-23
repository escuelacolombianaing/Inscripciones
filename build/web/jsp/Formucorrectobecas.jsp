<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        String nsol = request.getParameter("nsol");
        String nombre = request.getParameter("nombre");
        String plan = request.getParameter("plan");
//  String acud = request.getParameter("acud");
//  configeci.configuracion confeci = new configeci.configuracion();
//StringTokenizer st = new StringTokenizer(confeci.getPeriodo(), "-");
//int anniograv = Integer.parseInt(st.nextElement().toString().trim());
        String programa = "";

        if (plan.equals("14")) {
            programa = "INGENIERIA ELECTRICA";
        }

        if (plan.equals("18")) {
            programa = "ECONOMIA";
        }

        if (plan.equals("20")) {
            programa = "MATEMATICAS";
        }
%>

<html>
    <head>
        <title>Formulario Inscripción Becas</title>
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
            -->
        </script>
    </head>

    <body>

        <table width="700" border="0" class="textoimpre">
            <tr>
                <td width="14%" height="69"><img src="img/logo.gif" width="83" height="90"></td>
                <td width="2%" height="69">&nbsp;</td>
                <td width="84%" height="69">
                    <div align="center">
                        <p><b><font color="#CC0000">ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
                        JULIO GARAVITO</font></b></p>

                        <p><b>POSTULACION CONVOCATORIA BECAS JULIO GARAVITO ARMERO 2010-2 </b><br>
                        </p>
                    </div>
                </td>
            </tr>
        </table>

        <table width="700" border="0" cellspacing="0" cellpadding="0" class="textoimpre">
            <tr>
                <td>
                    <big><strong>Estimado Aspirante: Muchas Gracias. Su información
                            ya ha ingresado a nuestro sistema. Usted esta registrado en la convocatoria de becas 2009-1 para el programa de:
                    <%=programa%>. </strong></big><br><br>
                    <b>N&uacute;mero de Preinscripci&oacute;n: <%=nsol%></b><br>
                    <b>Nombre del aspirante: <%=nombre%></b><br>

                    <form name="imprime" id="imprime">
                        <p align="center"><center><INPUT type=button name="print" id="print" value="Imprimir" onClick="javascript: imprimir()" class="boton"> &nbsp;&nbsp;
                        <input type="button" value="Cerrar ventana" onclick="window.close()" name="cerrar" id="cerrar" class="boton"></center></p>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>
