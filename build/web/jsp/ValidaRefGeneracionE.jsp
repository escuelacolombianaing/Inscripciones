
<%-- 
    Document   : ValidaRefGeneracionE
    Created on : 31/08/2015, 03:02:09 PM
    Author     : Lucero
--%>
<%@page import="utiles.Correo"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>

<%
    try {
        String acepto = request.getParameter("acepto");
        configeci.configuracion confEci = new configeci.configuracion();
%>
<html>
    <head><title>Autenticación para Inscripción</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">

        <link rel="stylesheet" href="css/admisionFormulario.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {
            if(document.formvrp.ref.value == "" || document.formvrp.doc.value == ""){
            alert("Los campos no pueden estar vacios");
            return false;
            }
            }
            //-->
        </script>
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LOS PROGRAMAS ACADÉMICOS DE PREGRADO" />
        </jsp:include>
         <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">   
                        <%if (acepto.equals("S")) {%>

                        <font color="#990033"><blink><b>Atenci&oacute;n:</b></blink></font>
                        
                        Para diligenciar el formulario de solicitud de admisi&oacute;n
                        a alguno de los programas académicos de la Escuela Colombiana de Ingeniería,
                        por favor registre el número de referencia de
                        inscripción y el n&uacute;mero de documento de identidad registrado.
                        Tenga en cuenta que para diligenciar correctamente el
                        formulario de inscripci&oacute;n se requiere informaci&oacute;n acerca
                        de su grupo familiar, por lo anterior le recomendamos tener a mano la
                        documentaci&oacute;n que le permita saber lo siguiente:
                        <ul>
                            <li>Estrato del lugar de residencia, el cual debe obtenerse del recibo de energía.</li>
                            <li>Valor de pensi&oacute;n mensual pagada en su colegio, tomada de un
                                recibo de pago del mismo.</li>
                            <li>C&oacute;digo ICFES del colegio, tomado del documento de resultado
                                del examen de estado.</li>
                            <li>Ingresos familiares, tomados de los certificados de ingresos y retenciones
                                o declaraci&oacute;n de renta tanto del padre como de la madre.<br>
                            </li>
                        </ul>

                        <form action="VerificaAspPilo" method="POST" name="formvrp" id="formvrp">
                            <div class="col-xs-12 col-md-5 col-md-offset-1">	
                                <p><strong>No.&nbsp;<BR> Referencia&nbsp; </strong>  
                            </div>
                            <div class="col-xs-80 col-md-2">
                                <div class="form-group espaciado">
                                    <strong> 
                                        <input type="text" name="ref" size="10" class="form-control" ></strong>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-5 col-md-offset-1">	
                                <p><strong>Documento Identidad&nbsp; <br>(Sin puntos, ni comas ni guiones)&nbsp; </strong></div>
                            <div class="col-xs-80 col-md-2">
                                <div class="form-group espaciado">
                                    <strong> 
                                        <input type="text" name="doc" size="15" class="form-control" ></strong>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-md-2"></div>
                                <div class="col-xs-12 col-md-9">
                                    <div class="submit">
                                        <input class="boton" type="submit" value="Enviar Datos" onClick="javascript: return validar();"/>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-md-4"></div>								
                            </div>



                            <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <%} else {%>
            <p>&nbsp;</p>
            <p align="center" class="textocom"><b>Favor ac&eacute;rquese a la Oficina de Admisiones.  Bloque A primer piso.<br>
                    Donde se aclararán sus inquietudes, o al email: <a href='mailto:admisiones@escuelaing.edu.co'>admisiones@escuelaing.edu.co</a> o al teléfono 6683600 opción 2 en el menú.</b></p>
                    <%}%>
                    <!--jsp:include page="piepag">
                        <!--jsp:param name="parametro" value="" />
                    <!--/jsp:include-->
    </body>
</html>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Valida Referencia Pilo Paga", e.getMessage());
    }
%>