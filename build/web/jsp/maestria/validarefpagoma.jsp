

<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>

<%
    String acepto = request.getParameter("acepto");
    String idplan = request.getParameter("idplan");
    configeci.configmaestria confEci = new configeci.configmaestria();
%>
<html>
    <head><title>Autenticaci�n para Inscripci�n</title>
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
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
        <%if (idplan.equals("353")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN GESTI�N DE INFORMACI�N" />
        </jsp:include>
        <%} else if (idplan.equals("332")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN INGENIER�A ELECTR�NICA" />
        </jsp:include>
        <%}else if (idplan.equals("371")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN INFORM�TICA" />
        </jsp:include>
        <%}else if (idplan.equals("372")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN CIENCIAS ACTUARIALES" />
        </jsp:include>
        <%}else if (idplan.equals("376")){%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN CIENCIA DE DATOS" />
        </jsp:include>
<%}
        else if (idplan.equals("351")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS" />
        </jsp:include>
        <%} else if (idplan.equals("330")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN INGENIERIA INDUSTRIAL" />
        </jsp:include>
        <%} else {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISI�N A LA MAESTR�A EN INGENIER�A CIVIL" />
        </jsp:include>
        <%}%>
        
            <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">   
        <%if (acepto.equals("S")) {%>  
    <p class="textocom">Para diligenciar el formulario de solicitud de admisi&oacute;n 
                        a la Maestr�a, por favor registre 
                        el N�mero de referencia de pago de sus derechos de inscripci�n y el n&uacute;mero
                        de Documento de Identidad registrado para realizar dicho pago.</p></td>
           
        <form action="VerificaAspMaestria" method="POST" name="formvrp" id="formvrp">
            <input name="idplan" type="hidden" id="idplan" value="<%=idplan%>">
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
                </div>
            </div>   
             <div class="row">
                 <div class="col-xs-12 col-md-11 col-md-offset-5" >
                    <div class="submit">
                        <input class="btn btn-primary btn-lg" type="submit" value="Enviar Datos" onClick="javascript: return validar();"/>
                    </div>
                </div>

                <div class="col-xs-12 col-md-4"></div>								
            </div>


            <div class="proteccionDatos"><small>Protecci�n de datos: La Escuela Colombiana de Ingenier�a Julio Garavito le garantizar� a los titulares de la informaci�n, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteraci�n, p�rdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizar�n para informarlos sobre nuestra oferta acad�mica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                </form>

            </div>
        <%} else {%>
        <p>&nbsp;</p>
        <p align="center" class="textocom"><b>Favor ac&eacute;rquese a la Oficina de Admisiones.  Bloque A primer piso.<br>
                Donde se aclarar�n sus inquietudes, o al email: <a href='mailto:admisiones@escuelaing.edu.co'>admisiones@escuelaing.edu.co</a> o al tel�fono 6683600 opci�n 2 en el men�.</b></p>
                <%}%>
                  </div>
                <!--jsp:include page="piepag">
                    <!--jsp:param name="parametro" value="" />
                <!--/jsp:include-->
    </body>
</html>
