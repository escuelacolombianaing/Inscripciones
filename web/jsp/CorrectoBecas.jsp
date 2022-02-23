<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos"%>
<%
        HttpSession sesion;
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        response.setHeader("Cache-Control", "no-cache");
        String nsol = request.getParameter("nsol");
        String nombre = request.getParameter("nombre");
        String plan = request.getParameter("plan");
        String acud = request.getParameter("acud");
        String tipoest = request.getParameter("tipoest");
        configeci.configuracion confeci = new configeci.configuracion();
        Vector pregrados = bd.pregrado(oout, confeci.getPeriodo(), tipoest);
        StringTokenizer st = new StringTokenizer(confeci.getPeriodo(), "-");
        int anniograv = Integer.parseInt(st.nextElement().toString().trim());
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
            programa = "ADMINISTRACIÓN DE EMPRESAS";
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
            //-->
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

                        <p><b>Convocatoria Becas Julio Garavito Armero</b><br>
                        </p>
                    </div>
                </td>
            </tr>
        </table>

        <table width="700" border="0" cellspacing="0" cellpadding="0" class="textoimpre">
            <tr>
                <td>
                    <p><big><strong>Estimado Postulante: Muchas Gracias. Su información ya ha
                        ingresado a nuestro sistema. Usted esta postulado al programa: <%=programa%></strong></big><b><br>
                        N&uacute;mero de Preinscripci&oacute;n: <%=nsol%></b><br>
                        <b>Nombre del aspirante: <%=nombre%></b><br>
                        <b>Nombre del acudiente: <%=acud.toUpperCase()%></b><br>
                        <br>
                        Quien aparece aquí como acudiente es quien debe firmar la carta que se
                        debe anexar a los documentos requeridos. <br>
                        <br>
                        Debe entregar la documentaci&oacute;n de soporte que se relaciona a continuaci&oacute;n,
                        en el siguiente orden, sin ganchos dentro de un sobre de manila tamaño oficio y marcado así:<BR>

                        Escuela Colombiana de Ingeniería<BR>
                        Oficina de Admisiones<BR>
                        Nombre del aspirante <BR>
                        Programa académico al que aspira ingresar <BR>
                        , en la oficina de Admisiones Bloque A, primer piso de<b> 8:00a.m a 12:30
                            p.m. y de 2:00 a 4:30 p.m, a m&aacute;s tardar
                    el <font color="#FF0000"><b><%=pregrados.elementAt(4)%></b></font>, o enviarlos por correo certificado .</b></p>
                    Consulte la citación a entrevistas el día <%=pregrados.elementAt(6)%>.
                    <p>Con el fin de facilitar la entrega de documentos de los postulantes,
                        la Escuela pone a su disposici&oacute;n el servicio de mensajer&iacute;a
                        a trav&eacute;s de la empresa Enlace Service - Alfamensajes.
                    </p>

                    <p><b>Documentos para la admisión</b><br>
                    </p>
                    <ol>
                        <li>
                            <p>Carta de presentación debidamente firmada por el aspirante y su acudiente
                                en la cual la persona que registró como tal acepta hacerse responsable
                                del estudiante ante la Escuela frente a procesos de índole académica,
                                personal, familiar, administrativa y financiera y por lo tanto será
                                la persona reconocida por la institución para dar y recibir información
                                respecto al proceso formativo del estudiante. <br>
                                <br>
                                <a
                                    href="http://www.escuelaing.edu.co/documentos/formatopreg.doc"
                                    target="_blank" class="titulosrayaabajo">&gt;&gt; Descarge aquí el formato</a><br>
                            </p>
                        </li>
                        <li>
                            <p>Formulario de admisión impreso, diligenciado vía web &nbsp;<a href="ValidaInsBecas"><b>IMPRIMALO
                            AQUI</b></a> </p>
                        </li>
                        <li>
                            <p>Una fotografía reciente 3 x 4 cm marcada al respaldo con el nombre
                                del aspirante y la carrera&nbsp;(pegarla en el formulario impreso
                            en la casilla destinada para tal fin) </p>
                        </li>
                        <li> Fotocopia legible del documento de identidad (cédula de ciudadanía,
                            tarjeta de identidad, registro civil o pasaporte según sea su caso).
                        </li>
                    </ol>
                    <p>La Escuela se reserva el derecho de verificar la información suministrada
                        por usted respecto al Examen de Estado, por lo tanto, no es necesario
                        adjuntar el resultado impreso para efectos de su inscripción pero asegúrese
                        de registrar correctamente el número de registro SNP en el formulario
                    de admisión. </p>
                    <p><strong>Documentos para la liquidación de matrícula</strong></p>
                    <p>Para definir el valor de la matrícula, adicionalmente, el mismo día que
                        entregue la documentación de soporte a su solicitud de admisión, debe
                    entregar según sea su caso: </p>
                    <table width="100%" border="0"
                           cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td width="52%"><img src="img/documentos2010.jpg" onClick="MM_openBrWindow('http://www.escuelaing.edu.co/admisiones/2010/ingreso_grupo_familiar.html','grupofamiliar','scrollbars=yes,width=745,height=580')"
                                                     width="250" border="0" height="173"></td>
                                <td valign="bottom"
                                    width="48%">
                                    <table width="100%" border="0" cellpadding="7"
                                           cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td class="contenidos"
                                                    bgcolor="#fdc257"><strong>&lt;&lt; Haga clic sobre la imagen para ampliarla.</strong></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <p><b>Una vez los entregue completos y correctamente en la oficina de Admisiones
                        dentro de los plazos establecidos, quedará formalmente inscrito</b><BR>
                    </p>
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
    </body>
</html>
