<%-- 
    Document   : validaextranj
    Created on : 25/08/2010, 08:41:15 AM
    Author     : lrodriguez
--%>

<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    try {
        String titulo = new String("");
        // titulo = "VALIDACION PARA SOLICITAR NUMERO DE REFERENCIA ESTUDIANTE NUEVO";
        configeci.configuracion confEci = new configeci.configuracion();
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        int ban = 0;
        String tipoest = request.getParameter("tipoest");
//Convertir el dato String a Date para compararlo mas adelante.
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String fechaActual = formatter.format(hoy);
        // titulo = "Inscripciones en línea: Registro de pago";
                /* Inscripciones Extemporáneas*/

        if (tipoest.equals("E") || tipoest.equals("T")) {
            titulo = "Inscripciones en línea";
        }

        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);
        Date fechafin = new Date();
        if (pregrados.size() <= 0) {
            out.println("Este proceso no se encuentra habilitado");
        } else {
            String dato = new String(pregrados.elementAt(1).toString());
            String prog = new String(pregrados.elementAt(3).toString());
            String datofin = new String(pregrados.elementAt(2).toString());

            Date inicio = formatter.parse(dato);
            Date finall = formatter.parse(datofin);
            String X = formatter.format(inicio);
            String Y = formatter.format(finall);
            if (prog.equals(tipoest)) {
                if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y)) && (pregrados.elementAt(5).equals("1"))) {
                    ban = 1;
                }
            }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Validación Bachiller extranjero</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

        <SCRIPT LANGUAGE="JavaScript">

            function comprueba() {

                var a;
                if (!document.forms.form1.bachiller[0].checked && !document.forms.form1.bachiller[1].checked) {
                    alert("Usted debe seleccionar SI es o NO bachiller extranjero");
                    return false;
                }

                if (!document.forms.form1.icfes[0].checked && !document.forms.form1.icfes[1].checked) {
                    alert("Usted debe seleccionar si ha presentado exámen de estado ICFES en Colombia");
                    return false;
                }

                if (document.forms.form1.bachiller[0].checked && document.forms.form1.pais.value == '') {
                    alert("Por favor ingrese el país de procedencia");
                    return false;

                }

                if (document.forms.form1.bachiller[0].checked && document.forms.form1.colegio.value == '') {
                    alert("Por favor ingrese el nombre del colegio");
                    return false;

                }
            }
            /*  if ( document.forms.form1.pais.value == '') {
             alert("Por favor seleccione el país de procedencia");
             return false;
             }*/

            /*   if ( document.forms.form1.colegio.value == '') {
             alert("Usted debe ingresar el nombre del colegio");
             return false;
             }*/

            function habilita(form)
            {
                form.pais.disabled = false;
                form.colegio.disabled = false;
                alert("Por favor ingrese el país de procedencia, y el nombre del colegio.");

            }

            function deshabilita(form)
            {
                form.pais.disabled = true;
                alert("Al seleccionar esta opción NO DEBE  ingresar país de procedencia, ni nombre del colegio.");
                form.colegio.disabled = true;

            }

        </SCRIPT>
    </head>

    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />

        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <%if (ban == 0) {%>
                    <p>
                    <center><b>Este proceso sólo se habilitará en las fechas programadas que aparecen en el calendario de admisiones,<br> para cualquier información adicional, comuníquese al 6683600 opción 2 en el menú.</b></center>

                    <%} else {%>

                    <form name="form1" method="post" action="ReferenciaPago">
                        <input name="tipoest" type="hidden" id="tipoest" value="<%=tipoest%>">
                        <h3>Inscripciones en línea: Solicitud número de referencia</h3>
                        <div class="row">		
                            <div class="col-xs-12 col-md-12">
                                <div class="form-group espaciado">
                                    <hr>
                                    <br><!--Bienvenido acabas de ingresar a la secci&oacute;n de admisiones de 
                                    la Escuela Colombiana de Ingenier&iacute;a Julio Garavito, recuerda 
                                    que debes cumplir como m&iacute;nimo con 40 puntos en el Examen Saber 
                                    11 en las &aacute;reas de inter&eacute;s de cada programa, quien no 
                                    cumpla con el <a href="http://www.escuelaing.edu.co/es/programas/admisiones/pregrado?grupo=1#info">requisito 
                                        m&iacute;nimo de puntajes la solicitud de admisi&oacute;n ser&aacute; 
                                        rechazada.</a>-->
                                    Para realizar el proceso de inscripción tendremos en cuenta 
                                    la política de admisión institucional basada en los resultados del Examen Saber 11, 
                                    esta política está definida por el Consejo Directivo y la puede ver <a href="https://www.escuelaing.edu.co/es/programas/admisiones/pregrado?id=1&itemId=2"><b>aquí</b></a> 
                                    <p><br>
                                        Para pagar los derechos de inscripci&oacute;n siga estos pasos:</p>
                                    <p><br>
                                        a. Diligenciar los campos solicitados en este formulario.<br>
                                        b. Hacer clic en el bot&oacute;n enviar.<br>
                                        c. Imprimir el n&uacute;mero de referencia de pago que suministra 
                                        el sistema, para diligenciar el formulario de inscripci&oacute;n y realizar 
                                        el pago de la misma.
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6 col-md-offset-1">		                			
                                <p><font color="#CC0033">* </font>  ¿Es usted bachiller extranjero?</p>									
                            </div>

                            <div class="col-xs-12 col-md-5">
                                <div class="form-group espaciado">
                                    <label class="radio-inline">
                                        <input type="radio" name="bachiller" id="inlineRadio1" value="S" onClick="habilita(this.form)"> SI
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="bachiller" id="inlineRadio2" value="N" onClick="deshabilita(this.form)"> NO
                                    </label>
                                </div>
                            </div>

                            <div class="col-xs-12 col-md-6 col-md-offset-1">		                			
                                <p> <font color="#CC0033">* </font>¿Ha presentado o está registrado para presentar el examen<br> de ESTADO en Colombia?  &nbsp;</p>									
                            </div>

                            <div class="col-xs-12 col-md-5">
                                <div class="form-group espaciado">
                                    <label class="radio-inline">
                                        <input type="radio" name="icfes" id="inlineRadio1" value="S" > SI
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="icfes" id="inlineRadio2" value="N" > NO
                                    </label>
                                </div>
                            </div>

                            <div class="col-xs-12 col-md-5 col-md-offset-1">		                			
                                <p>País de procedencia</p>									
                            </div>

                            <div class="col-xs-80 col-md-2">
                                <div class="form-group espaciado">

                                    <input type="text" class="form-control" name="pais" size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);" class="campotext" >

                                </div>
                            </div>

                            <div class="col-xs-12 col-md-5 col-md-offset-1">		                			
                                <p>Nombre del colegio</p>									
                            </div>
                            <div class="col-xs-80 col-md-4">
                                <div class="form-group espaciado">

                                    <input type="text" class="form-control" name="colegio" size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);"  class="campotext">

                                </div>
                            </div>
                            <div class="row">

                                <div class="col-xs-12 col-md-9">			                		
                                    <div class="form-group espaciado">
                                        <small>La Escuela se reserva el derecho de verificar la información y los documentos presentados por el aspirante para la liquidación del valor de la matrícula a través de visitas domiciliarias u otros mecanismos. Cualquier inexactitud en la información presentada, podrá dar lugar inicialmente a la revisión del valor de la matrícula o eventualmente a la anulación de la admisión.</small>
                                    </div>
                                </div>                                   							
                            </div>



                        </div>


                        <div class="row">
                           
                            <div class="col-xs-12 col-md-11 col-md-offset-2" >
                                <div class="submit">
                                    <input class="boton" type="submit" value="Enviar solicitud" onClick="javascript: return comprueba();" />
                                </div>
                            </div>
                           							
                        </div>
                    </form>
                    <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                    </div>
                    <%}
                        }%>

                </div>
            </div> 

            <h1>&nbsp;</h1>
    </body>
</html>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Valida Extranjeros", e.getMessage());
    }
%>
