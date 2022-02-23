<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%
String docEst = request.getParameter("documento");
PrintWriter oout = response.getWriter() ;
BDadmisiones bd = new BDadmisiones();
String prog = new String();
String idprog = request.getParameter("idprog");
configeci.configuracion confEci = new configeci.configuracion();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <title>Guías para la presentación de exámenes de Diagnóstico</title>
    </head>
    <body>
        
        <p>&nbsp;</p>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="ASPIRANTES A PRIMER SEMESTRE " />
        </jsp:include>
        <p align="center">&nbsp;</p>
        <table width="50%" border="0" align="center">
            <tr> 
                <td>
                    <ul>
                        <li><a href="http://www.escuelaing.edu.co/documentos/matematicas.pdf " target="_blank">Material 
                        de Apoyo exámen de Diagnóstico Matemáticas</a> </li>
                    </ul>
                </td>
            </tr> 
            <tr> 
                <td> 
                    <ul>
                        <li>
                            <a href="http://www.escuelaing.edu.co/documentos/lenguaje.pdf " target="_blank">
                                Material de Apoyo exámen de Diagnóstico Lenguaje.   <!--<font size="2">Esta 
          guía será publicada a más tardar el 15 de Junio de 2009</font>. -->
                            </a> 
                            <%if (idprog.equals("13") || idprog.equals("14")|| idprog.equals("15")|| idprog.equals("16") || idprog.equals("17")|| idprog.equals("260") || idprog.equals("20")) {%>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr> 
                <td>
                    <ul>
                        <li> 
                            <a href="http://www.escuelaing.edu.co/documentos/fisica.pdf " target="_blank">
                                Material de Apoyo exámen de Diagnóstico Física.         <!--<font size="2">Esta 
          guía será publicada a más tardar el 15 de Junio de 2009.</font> -->
                            </a>
                            <%
                            }if (idprog.equals("16") || idprog.equals("260")|| idprog.equals("20")) {
                            
                            %>
                        </li>
                    </ul>
                </td>
            </tr>
            <tr> 
                <td>
                    <ul>
                        <li> 
                            <a href="http://www.escuelaing.edu.co/documentos/quimica.pdf " target="_blank">
                                Material de Apoyo exámen de Diagnóstico Química.             <!--<font size="2">Esta 
          guía será publicada a más tardar el 15 de Junio de 2009. </font>-->
                            </a>
                            <% }
                            %>
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
        <div align="center">
            <p>&nbsp;</p>
            <p>&nbsp;</p>
        </div>
        <h1> </h1>
        
    </body>
</html>
