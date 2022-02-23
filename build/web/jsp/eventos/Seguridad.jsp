<%-- 
    Document   : Seguridad
    Created on : 29/07/2014, 05:52:35 PM
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
            String nombres = request.getParameter("nombres");
            String ape1 = request.getParameter("ape1");
            String ape2 = request.getParameter("ape2");
            String correo = request.getParameter("correo");
            String idevento = request.getParameter("listado");
            String celular = request.getParameter("celular");
            String profesion = request.getParameter("ocupacion");
            String empresa = request.getParameter("empresa");
            String tel = request.getParameter("telefono");
            String doc = request.getParameter("doc_est");
            String[] checConf;
            String cadena = "";
            int longChec = 0;
          //  nombres = nombres + " " + ape1 + " " + ape2 ;
            checConf = request.getParameterValues("checConf");
            longChec = checConf.length;%>

<table width="39%" border="0" align="center">
    <tr>
        <td width="41%">
            <p><img src="img/seguridad.jpg"></p>
        </td>
    </tr>
    <tr>

        <td colspan="2">&nbsp;</td>
    </tr>
</table>

<%
            for (int i = 0; i < longChec; i++) {
                cadena = checConf[i];
                Vector cupos = admision.CuposExternos(cadena);
                String datoc = (((Vector) cupos.elementAt(0)).elementAt(0).toString());
                int total = Integer.parseInt(datoc);
                int total1 = 90;
                if (total < total1) {
                    Vector valida = admision.ValidaExternos(doc, cadena);
                    if (valida.size() <= 0) {
                        inscrito = admision.Evento(cadena, doc, nombres, ape1, ape2, celular, correo,  tel, profesion, empresa);

                    } else {%>

<center>
    <%if (i == 0) {%>

    <p><font size="4">Usted ya se encuentra inscrito. Por favor verifique y seleccione
            solo aquella(s) en las que no se encuentra inscrito</font></p>
</center>
<font size="4">
    <% }
                        }
                    } else {%>
</font>
<center>
    <font size="4">No hay cupo disponible.</font>
</center>
<% }

            }
            if (inscrito > 0) {%>

<center>
    <font size="4">Apreciado(a): <%=nombres%> </font>
    <p><font size="4"> Su solicitud de inscripción ha sido recibida.</font>
</center>
<font size="4">
    <%  }%>
</font>
</body>
</html>
