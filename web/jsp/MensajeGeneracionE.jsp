<%-- 
    Document   : MensajeGeneracionE
    Created on : 25/08/2015, 02:39:27 PM
    Author     : Lucero
--%>
<%
    String ref, apellido1, apellido2, nom, doc, prog;
    apellido1 = request.getParameter("apellido1");
    apellido2 = request.getParameter("apellido2");
    nom = request.getParameter("nombre");
    doc = request.getParameter("doc");
    ref = request.getParameter("ref");
    prog = request.getParameter("prog");
    String tipoest = request.getParameter("tipoest");
    configeci.configuracion confEci = new configeci.configuracion();
%>

<html>

    <head>
        <title>Referencia Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
         <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function impresion(){
            document.getElementById("tablaboton").style.visibility='hidden';
            window.print();

            }
            --> </script>
    </head>

    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="3.  NUMERO DE REFERENCIA  PARA HACER LA INSCRIPCION" />
        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-8">
        <%String nombres = "";%>
        <br>	
        
                            <p><b><font size="2" face="Arial, Helvetica, sans-serif">Nombres: <%=apellido1%> <%=apellido2%> <%=nom%> </font></b></p>
                            <p><b><font size="2" face="Arial, Helvetica, sans-serif">Referencia : <%=ref%></font></b></p>

                     
                            <p></p>
                            <p align="left"><b>Recuerde diligenciar su formulario para terminar 
                                    el proceso de inscripci&oacute;n, 
                                    
                                    <%if (tipoest.equals("N")) {%>
                                    <a href="SolicitudGeneracionE?tipoest=N">INGRESANDO AQUI</a></b></p>
                                    <%} else if (tipoest.equals("T")) {%>
                            <a href="SolicitudGeneracionE?tipoest=T">INGRESANDO AQUI</a></b></p>
                            <%}%>
                            <p align="left"><b>Si tiene inquietudes por favor comun&iacute;quese 
                                    al tel&eacute;fono 6683600 opción 2 en el menú.</i></b></p>
                       
               

                </div>
            </div>
        </div>
    </body>
</html>
<!--%
    sesion = request.getSession(false) ;
    sesion.invalidate() ;
%-->
