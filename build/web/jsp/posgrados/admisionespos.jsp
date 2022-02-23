
<%@page import="utiles.Correo"%>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
            try {
                String idplan = request.getParameter("idplan");
                //  configeci.configuracion confEci = new configeci.configuracion();
                configeci.configPosgrados confEci = new configeci.configPosgrados();
                //  boolean admitidos = confEci.getAdmitidos(idplan);
                otros.rutas ruta = new otros.rutas();
                String titulo = "Consulta Admitidos Posgrados";
                BDadmisiones bd = new BDadmisiones();
                PrintWriter oout = response.getWriter();
                //confEci.getPeriodo()
                Vector posgrados = new Vector();
                if (idplan.equals("330")){
                    response.sendRedirect("AdmisionesMa?idplan=330");
                }
                
                else if (idplan.equals("335")){
                    response.sendRedirect("AdmisionesMa?idplan=335");
                }
                
                else if (idplan.equals("332")){
                    response.sendRedirect("AdmisionesMa?idplan=332");
                }
                
                else if (idplan.equals("353")){
                    response.sendRedirect("AdmisionesMa?idplan=353");
                }
                
                else if (idplan.equals("290")){
                    response.sendRedirect("AdmisionesMa?idplan=290");
                }
                
                else if (idplan.equals("351")){
                    response.sendRedirect("AdmisionesMa?idplan=351");
                }
                
                else if (idplan.equals("371")){
                    response.sendRedirect("AdmisionesMa?idplan=371");
                }
                else if (idplan.equals("372")){
                    response.sendRedirect("AdmisionesMa?idplan=372");
                }
                
                
                if (idplan.equals("370")) {
                    posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
                } else {
                    posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
                }

                if (posgrados.size() <= 0) {
                    out.println("Falta información");
                } else {
                    int ban = 0;
                    Date hoy = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                    Date fechafin = new Date();
                    String dato = new String(posgrados.elementAt(10).toString());
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
        <title>Admitidos </title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body bgcolor="#ffffff">
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
        <%if (ban == 1) {%>
        <div align="center">
        <table  border="0" width="600" class="textocom">
            <form name="form1" method="post" action="ConsultaAdmitidosPosgrado">
                <input name="idplan" type="hidden" id="idplan" value="<%=idplan%>">

                <tr>
                    <td align=left height="53" width="50%">
                        <div align="right"><strong><em><font face="Arial" size="2">Documento
                                        de Identidad </font></em></strong></div>
                    </td>
                    <td align=left height="53" width="50%">
                        <div align="center">
                            <input name=documento type=password maxlength=15 style="HEIGHT: 22px; WIDTH: 110px" size="15">
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
            </form>
                <tr>
                    <td colspan="3" height="10">
                        <div align="center"><img src="img/rojo.jpg" width="580" height="2"></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p align="center">Avenida
                            13 No 205-59 - Kilómetro 13 Autopista Norte <br>
                            Bogotá - Colombia - Sur América <br>
                            PBX: +57(1)6683600. Fax: 57(1)6762340  <br>
                            <a href="mailto:webmaster@escuelaing.edu.co">Webmaster</a>
                    </td>
                </tr>
        </table>
        </center>
        
        <%} else {%>
        <div align="center">
        <table align="center" width="600" border="0" height="74">

            <tr>
                <td>El proceso de consulta de admisiones para este programa de posgrado no se encuentra disponible.
                    <!--<a href="VerificaCronograma?idplan=<//%=idplan%>"><b>consulte aqu&iacute;</a>
                    la programaci&oacute;n-->
                </td>
            </tr>
            <tr>
                <td>
                    <p>&nbsp;</p>
                    <p>Para cualquier
                        informaci&oacute;n adicional comun&iacute;quese al tel&eacute;fono 6683600
                        opción 2 en el menú &oacute; al e-mail <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a></p>
                </td>
            </tr>
            
        </table>
            </div>
            <%}%>

            <%}
                            }
                        } catch (Exception e) {
                            Correo correo = new Correo();
                            correo.enviar("Admisiones Posgrados", e.getMessage());
                        }

            %>
             

      