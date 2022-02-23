
<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%

try{
            String titulo = new String("");
            titulo = "VALIDACION PARA SOLICITAR NUMERO DE REFERENCIA ESTUDIANTE NUEVO";
            configeci.configuracion confEci = new configeci.configuracion();
            response.setHeader("Cache-Control", "no-cache");

            PrintWriter oout = response.getWriter();
            BDadmisiones bd = new BDadmisiones();
            int ban = 1;
            String tipoest = request.getParameter("tipoest");
//Convertir el dato String a Date para compararlo mas adelante.
            Date hoy = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String fechaActual = formatter.format(hoy);
            titulo = " Inscripciones en l�nea";
            /* Inscripciones Extempor�neas*/
            if (tipoest.equals("E") || tipoest.equals("T")) {
                titulo = "Inscripciones en l�nea";
            }

            Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);
                 if (pregrados.size()<=0){
                    out.println("Este proceso no se encuentra habilitado o falta informaci�n");
                    }else{
            Date fechafin = new Date();
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
        <title>Admisi�n a Programas de Pregrado</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <SCRIPT LANGUAGE="JavaScript">

            function comprueba( ){

                if ( !document.forms.form1.acepto[0].checked && !document.forms.form1.acepto[1].checked ) {
                    alert("Debe seleccionar alguna opci�n");
                    return false;
                }

                return true;
            }
        </SCRIPT>
    </head>

    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LOS PROGRAMAS ACAD�MICOS DE PREGRADO" />
        </jsp:include>
        <div align="center">
            <%if (ban == 0) {%>
            <p>
            <center><b>Este proceso s�lo se habilitar� en las fechas programadas que aparecen en el calendario de admisiones,<br> para cualquier informaci�n adicional,comun�quese con la Oficina de Admisiones, opci�n 2 en el men�.</b></center>

            <%} else {%>
            <form name="form1" method="post"  onSubmit="return comprueba( );" action="ValidaRefPago">
                <input name="tipest" type="hidden" id="tipoest" value="<%=tipoest%>">
                
                    <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                   
                                            <p align="center"><b><font color="#CC0000" size="4">IMPORTANTE</font></b></p>
                                            <p align="left">La informaci&oacute;n suministrada en esta solicitud
                                                de admisi&oacute;n ser&aacute; utilizada tanto para el proceso
                                                de admisi&oacute;n como para la liquidaci&oacute;n de matr&iacute;cula.
                                                En caso de que esta informaci&oacute;n no corresponda con
                                                los datos registrados en los documentos de soporte que usted
                                                deber&aacute; entregar para este fin, primar&aacute; &eacute;sta
                                                &uacute;ltima, por lo cual usted autoriza a la Escuela a hacer
                                                las correcciones seg&uacute;n corresponda.</p>
                                            <p align="left">En caso de que usted haya ingresado (matriculado)
                                                a un programa de pregrado en la Escuela en una oportunidad
                                                anterior, esta solicitud de admisi&oacute;n ser&aacute; ANULADA
                                                as&iacute; como cualquier otro tr&aacute;mite que usted haga
                                                con base en esta solicitud.</p>
                                            <p align="left">&nbsp;</p>
                                            <p>
                                        Acepto que conozco las condiciones aqu&iacute;
                                            descritas &nbsp;&nbsp;&nbsp;&nbsp;</td>
                                       
                                            <b>Si
                                                    <input type="radio" name="acepto" value="S">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No</b>
                                                <input type="radio" name="acepto" value="N">
                                          
                                        
                                        
                                            <center>
                                                <p>
                                                    <input type="submit" value="Acepto" name="submit" class="boton">
                                                </p>
                                                <p>&nbsp;</p>
                                            </center>
                                       

                </div></div></div>
                <div class="proteccionDatos"><small>Protecci�n de datos: La Escuela Colombiana de Ingenier�a Julio Garavito le garantizar� a los titulares de la informaci�n, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteraci�n, p�rdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizar�n para informarlos sobre nuestra oferta acad�mica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                                                               </div>
            </form>
            <%}
            }
}catch(Exception e){
    Correo correo=new Correo();
    correo.enviar("Solicitud primiparos", e.getMessage());
}
%>
       
        
    </body>
</html>
