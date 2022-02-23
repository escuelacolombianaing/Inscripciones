<%-- 
    Document   : ConsultaExamen
    Created on : 22/10/2015, 09:44:49 AM
    Author     : Lucero
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% String docEst = request.getParameter("documento");
    configeci.configuracion confEci = new configeci.configuracion();
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    // out.println(docEst);
    Vector estudiante = bd.AdmitidosPregradoOtros(docEst, oout, confEci.getPeriodo());
    String confirmat = new String();
    String confirfis = new String();
    String confirqui = new String();
    String carnet = new String();
%>
<html>
    <head>  <div id="container">
        <header>
            <div class="logoescuela">
                <img src="img/logo-ESCUELA.svg"/>
            </div>
            <img src="img/banner.jpg" />
            <div class="osiris">Desarrollado por: Direcci&oacute;n de Tecnolog&iacute;a Osiris y Direcci&oacute;n de Comunicaciones y Mercadeo</div>
        </header>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Examen de Conocimiento</title>  
        <link href="css/estilo-resultadoconocimiento.css" rel="stylesheet" type="text/css" media="all">
        </head>
        <body>
            <%if (estudiante.size() <= 0) {%>
            <table>
                <tr>
                    <td>
                        <b><br>Su documento es incorrecto o usted no ha diligenciado la
                            solicitud de admisión. Verifique e intente nuevamente o comuníquese al 6683600 opción 2 en el menú.</b>
                    </td>
                    </tr>
                    <tr>
                    <td> <div align="center">
                            <input name="Salir" class="boton"  type="submit" id="" value="Atrás" onClick="location.href = 'Examen'"></div>
                    </td>
                </tr>
            </table>
            <% } else {
                if (estudiante.size() > 0) {
                    for (int k = 0; k < estudiante.size(); k++) {

                        Vector datos = (Vector) estudiante.elementAt(k);
                        carnet = datos.elementAt(11).toString();
                    }
                }
                Vector DatosExamen = bd.Exa_Cono(carnet, confEci.getPeriodo(), oout);
               /* if (DatosExamen.size() > 0) {
                    //  nivelexamen = DatosExamen.elementAt(2).toString();
                    confirmat = DatosExamen.elementAt(3).toString();
                    confirfis = DatosExamen.elementAt(4).toString();
                    confirqui = DatosExamen.elementAt(5).toString();*/
            %>


            <section>
                <div id="formulario">
                    <table  align="center" width="100%" border="0">
                        <tr>
                            <td><font face="Times New Roman, Times, serif"><a href="CitacionExamen?docEst=<%=docEst%>">1. Citaci&oacute;n a examen 
                                    de conocimiento</a></font></td>
                        </tr>
                        <%if (!confirmat.equals("No disponible") || !confirfis.equals("No disponible") || !confirfis.equals("No disponible")) {%>
                        <tr>
                            <td><font face="Times New Roman, Times, serif"><!--a href="Confirmacion?docEst=<!%=docEst%>"-->2. Respuesta examen 
                                    de conocimiento<!--/a--></font></td>
                        </tr>
                        <% } else {%>
                        <tr>
                            <td><font face="Times New Roman, Times, serif"><!--a href="RespuestaExaCono?docEst=<!%=docEst%>"-->2. Respuesta examen 
                                    de conocimiento<!--/a--></font></td>
                        </tr>
                        <%}%>
                    </table>
            </section>
          
            <%//}
                }%>
                
                 <footer>
                <span class="programa">
                    Escuela Colombiana de Ingeniería Julio Garavito
                </span>
                <span class="direccion">
                    AK.45 No.205-59 (Autopista Norte)<br/>
                    PBX: +57(1) 668 3600<br/>
                    Call Center: +57(1) 668 3600<br/>
                    Línea Nacional Gratuita: 018000112668<br/>
                    www.escuelaing.edu.co<br/>
                    Bogotá, D.C. - Colombia<br/>
                </span>
            </footer>
            <h1></h1>
        </body>
</html>
