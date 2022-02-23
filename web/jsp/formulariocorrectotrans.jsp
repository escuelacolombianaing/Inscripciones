<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    String ref, nsol, pering;
    HttpSession sesion;
    sesion = request.getSession(false);
    configeci.configuracion confEci = new configeci.configuracion();
    String tipoest = request.getParameter("tipoest");
    nsol = request.getParameter("nsol");
    Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);
%>

<html>
    <head>
        <title>Información de Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="css/admisionFormulario.css">

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
        <jsp:include page="encabezado">
            <jsp:param name="titulo" value="" />
        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">

                    <table width="73%" border="0" class="textoimpre">
                        <TR> 
                            <TD> 
                                <p align="left">&nbsp;
                                <p align="left">Estimado Aspirante: Muchas Gracias. La información de 
                                    Inscripción ya se encuentra registrada en nuestro sistema. 
                            </TD>
                        </TR>
                        <TR> 
                            <TD> 
                                <p><br>El número de su solicitud de admisión es: <big> <%=nsol%></big>. 
                        </TD>
                        </TR>
                        <TR> 
                            <TD> 
                                <p><br>Recuerde que debe entregar a más tardar el <b><%=pregrados.elementAt(4)%></b>, 
                                    en la oficina de Admisiones Bloque A, primer piso, los documentos requeridos, 
                                    sin ganchos dentro de un sobre de manila tamaño oficio y marcado así:<BR>
                                    Escuela Colombiana de Ingeniería<BR>
                                    Oficina de Admisiones<BR>
                                    Nombre del aspirante <BR>
                                    Programa académico al que aspira ingresar <BR>
                                    <br>
                                </p>
                            </TD>
                        </TR>
                        <TR> 
                            <TD> 
                                <p>&nbsp;</p>
                            </TD>
                        </TR>
                    </table>

                    <form name="imprime" id="imprime">
                        <p align="center">
                        <center>
                            <INPUT type=button name="print" id="print" value="Imprimir" onClick="javascript: imprimir()" class="boton">
                            &nbsp;&nbsp;
                            <input type="button" value="Cerrar ventana" onclick="window.close()" name="cerrar" id="cerrar" class="boton">
                        </center>
                        </p>
                    </form>

                </div>
            </div>

    </body>
</html>
<%
    sesion = request.getSession(false);
    sesion.invalidate();
%>
