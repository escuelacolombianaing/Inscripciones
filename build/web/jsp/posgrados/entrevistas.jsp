
<%@page import="utiles.Correo"%>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>

<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<% try {
        response.setHeader("Cache-Control", "no-cache");
        HttpSession sesion;
        sesion = request.getSession(true);
        String idplan = request.getParameter("idplan");
        BDadmisiones bd = new BDadmisiones();
        PrintWriter oout = response.getWriter();
        configeci.configPosgrados confEci = new configeci.configPosgrados();
        boolean entrevistas = confEci.getEntrevistas(idplan);
        Vector posgrados = new Vector();
        String titulo = "Consulta Entrevistas Posgrados";
        //Cuando se cruzan los periodos confEci.getPeriodoant()
        if (idplan.equals("370")) {
            posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
        } else {
            posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
        }

        // Vector posgrados = bd.Cronogramas(oout, "2012-1", idplan);
        int ban = 0;
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date fechafin = new Date();
        if (posgrados.size() <= 0) {
            out.println("<center>No existen datos.</center>");
        } else {
            String dato = new String(posgrados.elementAt(7).toString());
            idplan = new String(posgrados.elementAt(1).toString());
            // String datofin = new String(posgrados.elementAt(10).toString());
            String datofin = new String(posgrados.elementAt(20).toString());
            String fechaActual = formatter.format(hoy);
            Date inicio = formatter.parse(dato);
            Date finall = formatter.parse(datofin);
            String X = formatter.format(inicio);
            String Y = formatter.format(finall);
            //  if (prog.equals(tipoest)) {
            if (((hoy.after(inicio) && hoy.before(finall)))) {
                ban = 1;
            }

            /*   if (idplan.equals("374")) {
             ban = 1;
             }*/
            if (idplan != null && !idplan.equals("")) {
%>	
<html>
    <head>
        <title>Consulta de Entrevistas </title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--<!%=confEci.getPeriodo()%>-->
        <%if (idplan.equals("370")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        <%} else {%>

        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        <%}%>
        <!--  <table align=center
           border=0 bordercolor=white cellpadding=0 cellspacing=2
           width=306 height=109 >
        <tr>
            <td height="77" colspan="3">
        <p align="center"><img src="img/Escudo.gif" width="125" height="126"></p></td></tr>

        <tr bgcolor="#C5201A">
            <td align=left colspan="2" height="18">
                <div align="center"><strong><em><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF">CONSULTA
                - ENTREVISTAS POSGRADOS</font></em></strong></div>
            </td>
        </tr>
    </table>-->

        <% if (idplan.equals("309")) {%>
        <p></p>
    <center>
        <font size="3"><b> Hecha la Inscripción el Director de la Especialización en 
            Saneamiento Ambiental, si lo considera necesario, lo citará a una entrevista.</b></font> 
    </center>

    <%} else if (ban == 1) {%>
    <div align="center"> 
        <table border="0" width="750" align="center">
            <tr>
                <td height="77" colspan="3">

                    <form name="form1" method="post" action="ConsultaEntrevistasPosgrado">
                        <input name="idplan" type="hidden" id="idplan" value="<%=idplan%>">
                        <table align=center
                               border=0 bordercolor=white cellpadding=0 cellspacing=2
                               width=600 height=109 >
                            <tr>
                                <td align=left height="53" width="50%">
                                    <div align="right"><strong><em><font face="Arial" size="2">Documento
                                                de Identidad </font></em></strong></div>
                                </td>
                                <td align=left height="53" width="50%">
                                    <div align="center">
                                        <input name=documento type=password maxlength=12 style="HEIGHT: 22px; WIDTH: 110px" size="12">
                                    </div>
                                </td>
                            </tr>
                            <tr> 
                                <td colspan="2"> 
                                    <div align="center">
                                        <p>&nbsp;</p>
                                        <p>
                                            <input  name=Aceptar type=submit value=Aceptar title=Aceptar>
                                            <input iname=Limpiar  type=reset value=Limpiar title=Limpiar>
                                        </p>
                                    </div>
                                </td>
                                
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>

        <%} else {%>
        <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif"><center><br><br>El proceso de consulta de entrevista para este programa de posgrado no se encuentra disponible en el momento.</center>
                                <!--<a href="VerificaCronograma?idplan=<%=idplan%>"><b>consulte aqu&iacute;</a>
                            la programaci&oacute;n--></font>.

    </td>
    <%}%>
</div>
<p>&nbsp;
</body>
</html>
<%}
    }%>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Entrevistas Corregido", e.getMessage());
    }
%>