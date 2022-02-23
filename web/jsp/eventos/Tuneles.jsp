<%-- 
    Document   : Tuneles
    Created on : 28/10/2014, 08:44:52 AM
    Author     : Lucero
--%>
<%@ page contentType="text/html; charset=iso-8859-1" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    BDadmisiones admision = new BDadmisiones();
    PrintWriter oout = response.getWriter();
    int inscrito = 0;
    String nombres = request.getParameter("nombre");
    String empresa = request.getParameter("empresa");
    String medio = request.getParameter("listado");
    String email = request.getParameter("email");
    String celular = request.getParameter("celular");
    String doc = request.getParameter("documento");
    String idevento = "262";
    String profesion = request.getParameter("profesion");


    
%>

<table width="39%" border="0" align="center">
    <tr>
        <td width="41%">
            <p><img src="img/tuneles.jpg"></p>
        </td>
    </tr>
    <tr>

        <td colspan="2">&nbsp;</td>
    </tr>
</table>

<%Vector cupos = admision.CuposExternos(idevento);

    String datoc = (((Vector) cupos.elementAt(0)).elementAt(0).toString());
    int total = Integer.parseInt(datoc);
    int total1 = 350;
    if (total < total1) {
        Vector valida = admision.ValidaExternos(doc, idevento);
        if (valida.size() <= 0) {
            inscrito = admision.Evento( idevento,doc, nombres, email, celular, profesion, empresa,medio );

        } else { 
%>
<center>
    <p><font size="4">Usted ya se encuentra inscrito. Por favor verifique y seleccione
        solo aquella(s) en las que no se encuentra inscrito</font></p>
</center>
<font size="4">
<%        }
    } else {%>
</font>

<center>
    <font size="4">No hay cupo disponible.</font>
</center>
<% }

    //  }
    if (inscrito > 0) {
%>

<center>
    <font size="4">Apreciado(a): <%=nombres%> </font>
    <p><font size="4"> Su solicitud de inscripción ha sido recibida.</font>
</center>
<font size="4">
<%  }%>
</font>
</body>
</html>
