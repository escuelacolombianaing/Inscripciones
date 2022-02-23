<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<% try {
        String tipoest = request.getParameter("tipoest");
        String idplan = request.getParameter("idplan");
        int ban = 0;
        configeci.configPosgrados confEci = new configeci.configPosgrados();
        BDadmisiones bd = new BDadmisiones();
        PrintWriter oout = response.getWriter();
        idplan = request.getParameter("idplan");
        Vector posgrados = new Vector();
// int plan=    (new Integer(idplan)).intValue();
//(new Integer(infpago)).intValue();
        //El periodo ya es 2013-1 pero QHSE sigue en 2012-2
        if (idplan.equals("370")) {
            posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
        } else {
            posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
        }
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date fechafin = new Date();
        if (posgrados.size() > 0) {
            String dato = new String(posgrados.elementAt(3).toString());
            idplan = new String(posgrados.elementAt(1).toString());
            String datofin = new String(posgrados.elementAt(4).toString());
            String fechaActual = formatter.format(hoy);
            Date inicio = formatter.parse(dato);
            Date finall = formatter.parse(datofin);
            String X = formatter.format(inicio);
            String Y = formatter.format(finall);
            if (idplan.equals("309")) {
                ban = 1;
            }
            if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y)) && (posgrados.elementAt(0).equals("1"))) {
                ban = 1;
            }
%>
<html>
    <head>
        <title>Admisión a Programas de Posgrado</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <SCRIPT LANGUAGE="JavaScript">

            function comprueba( ){

            if ( !document.forms.form1.acepto[0].checked && !document.forms.form1.acepto[1].checked ) {
            alert("Debe seleccionar alguna opción");
            return false;
            }

            return true;
            }
        </SCRIPT>
    </head>
    <script language="JavaScript" type="text/JavaScript">
        <!--
        function ventanaSecundaria (URL){
        <%if (ban == 1) {%>
        window.open(URL,"","width=850,height=600,scrollbars=yes,top=80,left=100");

        <%} else {%>

        alert("Solo se habilitarán en las fechas programadas");
        <%}%>
        }

        function textoin(id){
        //document.getElementById(id).style.fontSize='8px';
        document.getElementById(id).style.color='#336699';
        }

        function textout(id){
        //document.getElementById(id).style.fontSize='10px';
        document.getElementById(id).style.color='#FFFFFF';
        }

        function ilum(esto, uno){
        esto.style.backgroundColor=uno;
        }
        //-->
    </script>
    <body bgcolor="#FFFFFF" text="#000000">

        <%if (idplan.equals("370")) {%>
        <!%=confEci.getPeriodoant()%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LOS PROGRAMAS ACADÉMICOS DE POSGRADO" />
        </jsp:include>
        <%} else {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LOS PROGRAMAS ACADÉMICOS DE POSGRADO" />
        </jsp:include>
        <%}%>

        <div align="center">

            <form name="form1" method="post"  onSubmit="return comprueba( );" action="ValidaRefPagoPos">
                <input name="tipest" type="hidden" id="tipoest" value="<%=tipoest%>">
                <input name="idplan" type="hidden" id="idplan" value="<%=idplan%>">
                <div align="center">

                    <% if (ban == 1) {%>


                    <div class="container-fluid contenidos">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <p align="center"><b><font color="#CC0000" size="4">IMPORTANTE</font></b></p>
                                <p align="left">La informaci&oacute;n suministrada en esta solicitud
                                    de admisi&oacute;n ser&aacute; utilizada para el estudio de
                                    su admisi&oacute;n.</p>
                                <p>Declaro que la informaci&oacute;n aqu&iacute; consignada
                                    es cierta y autorizo su verificaci&oacute;n, en el caso de
                                    encontrar falsedad en los datos consignados, esta solicitud
                                    se anular&aacute;.</p>
                                <p>&nbsp;</p>
                                <p>
                                    Acepto que conozco las condiciones aqu&iacute;
                                    descritas&nbsp;&nbsp;&nbsp;&nbsp;</td>


                                    <b>Si
                                        <input type="radio" name="acepto" value="S">
                                        &nbsp;&nbsp;No</b>
                                    <input type="radio" name="acepto" value="N">
                                <center>
                                    <p>
                                        <input type="submit" value="Acepto" name="submit" class="boton">
                                    </p>
                                    <p>&nbsp;</p>
                                </center>

                                <% } else {%>
                                <center>Este proceso sólo se habilitará en las fechas programadas.</center>
                                    <%}%>

                            </div></div></div></div>
                <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                </div>
            </form>
        </div>

    </body>
</html>
<%}
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Solicitud Posgrado", e.getMessage());
    }
%>
