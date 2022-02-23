<%@page import="utiles.Correo"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.text.NumberFormat" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% try {
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        String nsol = request.getParameter("nsol");
        String nombre = request.getParameter("nombre");
        String plan = request.getParameter("plan");
        String acud = request.getParameter("acud");
        NumberFormat formato = new DecimalFormat("#,###,###");
        String matdef = request.getParameter("matdef");
        String tipoest = request.getParameter("tipoest");
        String pilo = request.getParameter("pilo");
        String ref = request.getParameter("ref");
        String doc = request.getParameter("doc");
     

        configeci.configuracion confeci = new configeci.configuracion();
        StringTokenizer st = new StringTokenizer(confeci.getPeriodo(), "-");
        configeci.configuracion confEci = new configeci.configuracion();
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();

        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);
        Vector rangos = bd.getRangomatric(matdef);
        if (rangos.size() > 0 || matdef.equals("33333333")) {
            String vini = (rangos.elementAt(1).toString());
            String vfin = (rangos.elementAt(2).toString());
            matdef = formato.format(Integer.parseInt(matdef)).replaceFirst("\\.", "'");
            vini = formato.format(Integer.parseInt(vini)).replaceFirst("\\.", "'");
            vfin = formato.format(Integer.parseInt(vfin)).replaceFirst("\\.", "'");
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
            if (plan.equals("262")) {
                programa = "INGENIERIA BIOMEDICA";
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

            -->
        </script>
    </head>

    <body>
         <jsp:include page="encabezado">
            <jsp:param name="titulo" value="" />
        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">

            <table width="700" border="0" cellspacing="0" cellpadding="0" class="textoimpre">
                <tr>
                    <td>
                        <p>&nbsp;
                        <p><big><strong>Estimado Aspirante: Muchas Gracias. Su información ya 
                        ha ingresado a nuestro sistema. Usted esta preinscrito al programa: 
                        <%=programa%></strong></big><b><br>
                </b> <br>
                <b>N&uacute;mero de Preinscripci&oacute;n: <%=nsol%></b><br>
                <br>
                Nombre del aspirante: <%=nombre%><br>
                <br>
                Nombre del acudiente: <%=acud.toUpperCase()%><br>
                <br>
                <% if (tipoest.equals("N")) {%>
                <!--DESCOMENTAR CUANDO HAYA VALORES DE 2109-1-->
                <%//SOLO ENTRA A ESTE MODULO SI EL ASPIRANTE PUEDE VER PRELIQUIDACION NO GENERACION E
                    matdef=matdef;
                    BDadmisiones bdpilo=new BDadmisiones();
                if(!(bdpilo.esGeneracionE(doc, plan, ref).size()>0)){%>
                <% 
                if ((plan.equals("18") || plan.equals("19")) && (matdef.equals("6'900.000"))) {%>
                De acuerdo con los datos registrados por usted en el proceso de inscripción 
                el valor de su matrícula se encuentra dentro del los siguientes rangos: 
                <b><%=vini%> y <%=vini%>. </b> <br>
                <%} else if ((plan.equals("20")) && (matdef.equals("5'300.000"))) {%>
                De acuerdo con los datos registrados por usted en el proceso de inscripción 
                el valor de su matrícula se encuentra dentro de los siguientes rangos: 
                <b><%=vini%> y <%=vini%>. </b> 
                <%} else {%>
                De acuerdo con los datos registrados por usted en el proceso de inscripción 
                el valor de su matrícula se encuentra dentro de los siguientes rangos: 
                <b><%=vini%> y <%=vfin%>. </b> 
                <%}%>
                <p> <font color="#800000"><b>Este es un valor aproximado a cancelar de 
                        acuerdo a los ingresos registrados por usted y podría variar en la liquidación 
                        definitiva. El valor real depende de los documentos presentados, por 
                        esta razón es muy importante que los datos registrados estén ajustados 
                        a la realidad.</b></font><br>
                
                <p>&nbsp;
                <%}%>
                <p>Quien aparece aquí como acudiente es quien debe firmar la carta que 
                    usted debe anexar a los documentos requeridos y hacerlos llegar a la 
                    Oficina de Admisiones.
                    <%if(false){%>
                    a más tardar el 
                    <% if (pilo.equals("SI")) {%>
                    <b></b>
                    <br>
                    <br>
                    <%} else {%>
                    <%=pregrados.elementAt(4)%>
                    <b></b> 
                    <%
                        }
                    }
                    } else if (tipoest.equals("S")) {%>
                    <b> Quien aparece aquí como acudiente es quien debe firmar la carta 
                        que usted debe anexar a los documentos requeridos y hacerlos llegar 
                        a la Oficina de Admisiones, los cuales puede consultar en la sección 
                        de preguntas frecuentes de Aspirantes nuevos.</b>.<br>
                    <br>
                    <b></b> 
                    <%}%>
                <form name="imprime" id="imprime">
                    <p align="center">
                    <center>
                        <INPUT type=button name="print" id="print" value="Imprimir" onClick="javascript: imprimir()" class="boton">
                        &nbsp;&nbsp;
                        <input type="button" value="Cerrar ventana" onclick="window.close()" name="cerrar" id="cerrar" class="boton">
                    </center>

                </form>
                </td>
                </tr>
            </table>
        </div>
                 
</div>
</div> 
    </body>
</html>
<%} else {
            out.println("No existen datos en la consulta");
        }
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Formulario Correcto", e.getMessage());
    }
%>
