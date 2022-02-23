<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% response.setHeader("Cache-Control", "no-cache");
        HttpSession sesion;
        sesion = request.getSession(true);
        String idplan = request.getParameter("idplan");
        String titulo = "Consulta Nivelatorios Posgrados";
        configeci.configPosgrados confEci = new configeci.configPosgrados();
        //  boolean admitidos = confEci.getAdmitidos(idplan);
        otros.rutas ruta = new otros.rutas();
        BDadmisiones bd = new BDadmisiones();
        PrintWriter oout = response.getWriter();
       // Vector posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
         Vector posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
        int ban = 0;
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date fechafin = new Date();
        String dato = new String(posgrados.elementAt(11).toString());
        idplan = new String(posgrados.elementAt(1).toString());
        String datofin = new String(posgrados.elementAt(20).toString());
        String fechaActual = formatter.format(hoy);
        Date inicio = formatter.parse(dato);
        Date finall = formatter.parse(datofin);
        String X = formatter.format(inicio);
        String Y = formatter.format(finall);
//  if (prog.equals(tipoest)) {
        if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y))) {
            ban = 1;
        }%>
<%if (idplan != null && !idplan.equals("")) {

%>

<html>
<head>
    <title>Nivelatorios</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link href="css/comun.css" rel="stylesheet" type="text/css">
    <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
</head>
<body bgcolor="#ffffff">
    <jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="<%=titulo%>" />
    </jsp:include>

<%if (ban == 1) {%>
    <form name="form1" method="post" action="AdmitidosPosgradoNiv">
        <table align="center" border="0" width="550" class="textoimpremas">
            <tr>
            <td height="77" colspan="3">
            <!-- <p align="center"><img src="img/Escudo.gif" width="125" height="126"></p>-->
            <input name="idplan" type="hidden" id="idplan" value="<%=idplan%>">
        
            <tr>
                <td align=left height="53" width="50%">
                    <div align="right"><strong><em>Documento de Identidad </em></strong></div>
                </td>
                <td align=left height="53" width="50%">
                    <div align="center">
                        <input name=documento type=password maxlength=12 style="HEIGHT: 22px; WIDTH: 110px" size="12">
                    </div>
                </td>
            </tr>
            <tr>
                <td align=left height="39" width="50%">
                    <div align="center">
                        <input id=submit1 name=Aceptar style="HEIGHT: 27px; LEFT: 200px; TOP: 99px; WIDTH: 110px" type=submit value=Aceptar title=Aceptar tabindex="Yes" class="textoimpremas">
                    </div>
                </td>
                <td align=left height="39" width="50%">
                    <div align="center">
                        <input id=submit1 name=Limpiar style="HEIGHT: 27px; LEFT: 200px; TOP: 99px; WIDTH: 110px" type=reset value=Limpiar title=Limpiar class="textoimpremas">
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <tr>
        <td colspan="3" height="10">

            <div align="center"></div>
        </td>
    </tr>
    <tr>
        <td colspan="3">

            <p align="center">&nbsp;
        </td>
    </tr>
    </table>
</body>
</html>
<%} else {%>
<p>&nbsp;
    <table align="center" width="50%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas">
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <!%if (idplan.equals("374")){%>
    <!-- <tr>
        <td height="43">El proceso de consulta
        de <b>nivelatorios</b> para esta especializaci&oacute;n estará disponible el día 15 de octubre a partir de las 5:00 p.m.</td>
    </tr>-->
    <!% else {%>
    <tr>
        <td>El proceso de consulta
            de <b>nivelatorios</b> para esta especializaci&oacute;n no se encuentra
            disponible.
            <!--<a href="VerificaCronograma?idplan=<%=idplan%>"><b>consulte aqu&iacute;</a>
      la programaci&oacute;n-->

            <%}%>
        </td>
    </tr>
    <tr>
    <td>
        <p>&nbsp;</p>
        <p><center>Para cualquier informaci&oacute;n
            adicional comun&iacute;quese al tel&eacute;fono 6683600 opción 2 en el menú &oacute; al e-mail <b><a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a></center></b></p>
</td>
</tr>
<tr>
    <td>&nbsp;</td>
</tr>
<tr> 
    <td>&nbsp;</td>
</tr>
<!%}%>
</table>
<jsp:include page="piepag">
    <jsp:param name="parametro" value="" />
</jsp:include>
</body>
</html>

<%}%>