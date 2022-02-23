<%-- 
    Document   : DocumentosPregrado
    Created on : 13/09/2011, 02:40:18 PM
    Author     : lrodriguez
--%>

<%@page import="utiles.Correo"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDdocumentacion" %>
<%@ page import="BDatos.BaseDatos" %>

<%
            try {
                String docEst = request.getParameter("doc");
                PrintWriter oout = response.getWriter();
                BDdocumentacion bd = new BDdocumentacion();
                configeci.configuracion confEci = new configeci.configuracion();
                HttpSession sesion;
                sesion = request.getSession(true);
                if (docEst != null && !docEst.equals("")) {
                    Vector consulta = bd.ConsultaDoc(docEst, confEci.getPeriodo(), oout);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Documentos Pregrado</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/tablas.css"/>
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Documentación Pregrado" />
        </jsp:include>

        <%if ((consulta.size()) == 0) {%>
        <div align="center">Su documento es incorrecto o usted no formaliz&oacute;
            la solicitud de admisión para este programa académico.</div>

        <%  } else {%>
        <table width="60%" border="3" align="center"  class="sortable" >
            <tr>
                <td colspan="3"><b>Aspirante:<%=((Vector) consulta.elementAt(0)).elementAt(0)%></b></td>
            </tr>
            <% String prog = "";
                String programa = ((Vector) consulta.elementAt(0)).elementAt(6).toString();
                if (programa.equals("13")) {
                    prog = "INGENIERÍA CIVIL";
                } else if (programa.equals("14")) {
                    prog = "INGENIERÍA ELÉCTRICA";
                } else if (programa.equals("15")) {
                    prog = "INGENIERÍA DE SISTEMAS";
                } else if (programa.equals("16")) {
                    prog = "INGENIERÍA INDUSTRIAL";
                } else if (programa.equals("17")) {
                    prog = "INGENIERÍA ELECTRÓNICA";
                } else if (programa.equals("18")) {
                    prog = "ECONOMÍA";
                } else if (programa.equals("19")) {
                    prog = "ADMINISTRACIÓN DE EMPRESAS";
                } else if (programa.equals("20")) {
                    prog = "MATEMÁTICAS";
                } else if (programa.equals("260")) {
                    prog = "INGENIERÍA MECÁNICA";
                } else if (programa.equals("262")) {
                    prog = "INGENIERÍA BIOMEDICA";
                } else if (programa.equals("264")) {
                    prog = "INGENIERÍA AMBIENTAL";
                }%>
            <tr>
                <td colspan="3"><b>Programa:<%=prog%></b></td>
            </tr>
            <tr>
                <td width="25%"><b>Documentos para la Admisi&oacute;n</b></td>
                <td width="10%"><b>Estado</b></td>
                <td width="25%"><b>Observaciones</b></td>
            </tr>
            <%  String tipo = "";
                String estado = "";
                //iniciamos el for en 1 para quitar el recibo de pago de inscripcion solicitado por marcela quevedo
                for (int i = 1; i < 4; i++) {
                    Vector dato = (Vector) consulta.elementAt(i);
                    tipo = (dato.elementAt(5).toString());
                    estado = (dato.elementAt(3).toString());
                    if(!dato.elementAt(2).toString().trim().equals("Recibo de luz")&&!dato.elementAt(2).toString().trim().equals("Ingresos Tercero")){
            %>
            <tr>
                <td width="25%"><%=dato.elementAt(2)%></td>

                <%if (estado.equals("N")) {%>
                <td width="10%">Sin recibir</td>
                <%} else {%>
                <td width="10%">Recibido </td>

                <%}%>
                <td width="25%"><%=dato.elementAt(4)%> </td>
            </tr>

            <%          }  
                }
                
                for (int x = 12; x < 13; x++) {
                        Vector datos = (Vector) consulta.elementAt(x);
                        estado = (datos.elementAt(3).toString());
                        if(!datos.elementAt(2).toString().trim().equals("Recibo de luz")&&!datos.elementAt(2).toString().trim().equals("Ingresos Tercero")){
                        %>
                <tr>
                <td width="25%"><%=datos.elementAt(2)%></td>

                <%if (estado.equals("N")) {%>
                <td width="10%">Sin recibir</td>
                <%} else {%>
                <td width="10%">Recibido </td>

                <%}%>
                <td width="25%"><%=datos.elementAt(4)%> </td>
            </tr>

            <%          }
                }   
                    if (tipo.equals("T")) {
                    for (int x = 10; x < 12; x++) {
                        Vector datos = (Vector) consulta.elementAt(x);
                        estado = (datos.elementAt(3).toString());
                        if(!datos.elementAt(2).toString().trim().equals("Recibo de luz")&&!datos.elementAt(2).toString().trim().equals("Ingresos Tercero")){
            %>
            <tr>
                <td width="25%"><%=datos.elementAt(2)%></td>

                <%if (estado.equals("N")) {%>
                <td width="10%">Sin recibir</td>
                <%} else if (estado.equals("S")) {%>
                <td width="10%">Recibido</td>
                <%} else {%>
                <td width="10%">No aplica</td>

                <%}%>
                <td width="25%"><%=datos.elementAt(4)%> </td>
            </tr>
            <%          }
                    }

                }%>
        </table>
        <table width="60%" border=3" align="center"  class="sortable">
            <tr>
                <td colspan="3"><b>Documentos para la Liquidación de Matrícula</b></td>
            </tr>
            <%
                for (int i = 4; i < 9; i++) {
                    Vector dato = (Vector) consulta.elementAt(i);
                    tipo = (dato.elementAt(5).toString());
                    estado = (dato.elementAt(3).toString());
                    if(!dato.elementAt(2).toString().trim().equals("Recibo de luz")&&!dato.elementAt(2).toString().trim().equals("Ingresos Tercero")){
            %>
            <tr>

                <td width="25%"><%=dato.elementAt(2)%></td>
                <%if (estado.equals("N")) {%>

                <td width="10%">Sin recibir</td>
                <%} else if (estado.equals("S")) {%>

                <td width="10%">Recibido</td>
                <%} else {%>

                <td width="10%">No aplica</td>

                <%}%>

                <td width="25%"><%=dato.elementAt(4)%> </td>
                <%  }
                } %>
            </tr>
        </table>

        <!-- <table width="50%" border=3" align="center"  class="sortable">
             <tr>
                 <td colspan="3"><b>Documentos para Formalizar Matrícula</b></td>
             </tr>
             <!%
     for (int i = 9; i < 10; i++) {
         Vector dato = (Vector) consulta.elementAt(i);
         tipo = (dato.elementAt(5).toString());
         estado = (dato.elementAt(3).toString());
             %>
             <tr>
                 <td width="50%"><1%=dato.elementAt(2)%></td>

                 <1%if (estado.equals("N")) {%>
                 <td width="25%">Pendiente</td>
                 <1%} else if (estado.equals("S")){%>
                 <td width="25%">Finalizado</td>
                  <1%} else {%>
                  <td width="25%">No aplica</td>
             </tr>
             <1%}%>
             <td width="25%"><1%=dato.elementAt(4)%> </td>
             <1%  }
             %>
         </table>-->
        <p>&nbsp;</p>
        <p>
        <center>
        </center>
        <p align="left"><br>
            <%}
            }%>
    </body>
</html>
<%
            } catch (Exception e) {
                Correo correo = new Correo();
                correo.enviar("Documentos Pregrado", e.getMessage());
            }
%>