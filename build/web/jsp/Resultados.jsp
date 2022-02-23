<%-- 
    Document   : Resultados
    Created on : 8/01/2010, 02:52:53 PM
    Author     : lrodriguez
--%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%
        String docEst = request.getParameter("documento");
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        Vector resultados = bd.Diagnostico(docEst, oout);
        String prog = "";
        if (docEst != null && !docEst.equals("")) {
%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>EXAMEN DE DIAGNOSTICO</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <link href="css/comun.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="EXAMEN DE DIAGNOSTICO" />
        </jsp:include>
        <!% for (int j=0; j< resultados.size(); j++){
        Vector datos= (Vector) resultados.elementAt(j);%>

        <% if (resultados.elementAt(5).equals("13")) {
        prog = "INGENIERIA CIVIL";

    } else if (resultados.elementAt(5).equals("14")) {
        prog = "INGENIERIA ELECTRICA";

    } else if (resultados.elementAt(5).equals("15")) {
        prog = "INGENIERIA DE SISTEMAS";

    } else if (resultados.elementAt(5).equals("16")) {
        prog = "INGENIERIA INDUSTRIAL";

    } else if (resultados.elementAt(5).equals("17")) {
        prog = "INGENIERIA ELECTRONICA";

    } else if (resultados.elementAt(5).equals("18")) {
        prog = "ECONOMIA";

    } else if (resultados.elementAt(5).equals("19")) {
        prog = "ADMINISTRACION DE EMPRESAS";

    } else if (resultados.elementAt(5).equals("20")) {
        prog = "MATEMATICAS";

    } else if (resultados.elementAt(5).equals("260")) {
        prog = "INGENIERIA MECANICA";

    }
        %>
        <br>
        <table width="50%" border="0" align="center" class="textoimpremas">
            <!% if (j==0) {%>
            <tr>
                <td><b>Nombre :</b> <%=resultados.elementAt(4)%></td>
            </tr>
            <tr>
                <td height="39">
                    <p><b>Programa:</b><%=prog%></p>
                    <p>&nbsp;</p>
                </td>
            </tr>
            <tr><td>
           
          <%  if(resultados.elementAt(7).equals("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") && resultados.elementAt(8).equals("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") && resultados.elementAt(9).equals("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") && resultados.elementAt(10).equals("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")){
                out.println("<center>Usted No Presentó el exámen de Diagnóstico por esta razón no tiene Recomendaciones</center>");
                
                }else { %>

</td></tr>
            <tr>
            <td>Los departamentos de Matemáticas, Ciencias Naturales, Humanidades e Idiomas de acuerdo al resultado obtenido en el exámen de diagnóstico, recomiendan cursar las siguientes asignaturas:
            <p>
            <%if (resultados.elementAt(7).equals("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"))
        out.println(" ");
    else%>
            <%=resultados.elementAt(7)%>
            <%if (resultados.elementAt(8).equals("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"))
        out.println(" ");
    else%>
            <BR><%=resultados.elementAt(8)%>
<br>
            <%if (resultados.elementAt(9).equals("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")) {%>
            <BR>
            <%out.println(" ");%>
 
            <%} else {%>
            <%=resultados.elementAt(9)%>

            <%}%><BR>
            <%if (resultados.elementAt(10).equals("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")) {
        out.println("");
    } else {%>
            <%=resultados.elementAt(10)%>
            <% }
            }%>


            <tr><td></td></tr>
            <tr><td>
                    <p>&nbsp;</p>
                    <p>Cordialmente, </p>
                    <p>Oficina de Admisiones </p>
            </td></tr>
            <%}%>
        </table>
    </body>
</html>