<%-- 
    Document   : InscribeEvento
    Created on : 15/01/2013, 10:06:58 AM
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

            String nombres = request.getParameter("nombres");
            String ape1 = request.getParameter("ape1");
            String ape2 = request.getParameter("ape2");
            String telefono = request.getParameter("telefono");
            String doc = request.getParameter("doc_est");
            String empresa = request.getParameter("empresa");
            String correo = request.getParameter("correo");
            String idevento = request.getParameter("idevento");
            String celular = request.getParameter("celular");
            //String ocupacion = request.getParameter("ocupacion");
            Vector valida = admision.ValidaExternos(doc, idevento);
            nombres = nombres + " " + ape1 + " " + ape2;

            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            Date hoy = new Date();
            Random r = new Random();
            int valorDado = r.nextInt(65250)+1;
            String valor = Integer.toString(valorDado);
            if (valida.size() <= 0) {
                int inscrito = admision.EventoUGE(idevento, doc, nombres, correo, telefono, "", "", "", empresa, "",valor);%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Inscripción a evento</title>
    </head>
    <body>

    <table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
            <!-- fwtable fwsrc="encabezado.png" fwbase="encabezado.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
            <tr>
                <td><img src="img/spacer.gif" width="97" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="123" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="155" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="265" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="1" height="1" border="0" alt=""></td>
            </tr>
            <tr>
                <td rowspan="2"><img name="encabezado_r1_c1" src="img/encabezado_r1_c1.gif" width="97" height="70" border="0" alt=""></td>
                <td rowspan="2"><img name="encabezado_r1_c2" src="img/encabezado_r1_c2.gif" width="123" height="70" border="0" alt=""></td>
                <td><img name="encabezado_r1_c3" src="img/encabezado_r1_c3.gif" width="155" height="37" border="0" alt=""></td>
                <td rowspan="2"><img name="encabezado_r1_c4" src="img/encabezado_r1_c4.gif" width="265" height="70" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="1" height="37" border="0" alt=""></td>
            </tr>
            <tr>
                <td><img name="encabezado_r2_c3" src="img/encabezado_r2_c3.gif" width="155" height="33" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="1" height="33" border="0" alt=""></td>
            </tr>
        </table>
        <center>
            <p>&nbsp;</p>
            
  <p align="center">Su solicitud de inscripción ha sido recibida. Si desea consultar 
    las memorias del evento, ingrese los datos solicitados para tener acceso a 
    la información.</p>
  <p align="center">La Escuela Colombiana de Ingenier&iacute;a Julio Garavito, 
    no se hace responsable de ninguna de las informaciones, opiniones y conceptos 
    t&eacute;cnicos que se emitan, publiquen o distribuyan a trav&eacute;s de 
    esta p&aacute;gina web o de las memorias de eventos anteriores</p>

            <% response.sendRedirect("Eventos?nombres=" + nombres + "&ape1=" + ape1 + "&ape2=" + ape2 + "&telefono=" + telefono + "&doc=" + doc + "&empresa=" + empresa + "&correo=" + correo + "&valorDado=" + valorDado + "&idevento=" + idevento);%>
        </center>

        <!--% response.sendRedirect("Eventos?nombres=" + nombres + "&ape1=" + ape1 + "&ape2=" + ape2 + "&telefono=" + telefono + "&doc=" + doc + "&empresa=" + empresa + "&correo=" + correo);%-->

        <%} else {%>
        <center>
  <p>Usted ya se encuentra inscrito al evento.</p>
  <p>La Escuela Colombiana de Ingenier&iacute;a Julio Garavito, no se hace responsable 
    de ninguna de las informaciones, opiniones y conceptos t&eacute;cnicos que 
    se emitan, publiquen o distribuyan a trav&eacute;s de esta p&aacute;gina web 
    o de las memorias de eventos anteriores</p>
</center>
        <%}%>

    </body>
</html>
