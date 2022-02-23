<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%
        HttpSession sesion;
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        String nsol = request.getParameter("nsol");
        String nombre = request.getParameter("nombre");
        String prog = request.getParameter("prog");
        String acud = request.getParameter("acud");
        String documento = request.getParameter("docestud");
        String tipoest = request.getParameter("tipoest");
        configeci.configuracion confeci = new configeci.configuracion();
        Vector pregrados = bd.pregrado(oout, confeci.getPeriodo(), tipoest);
%>

<html>
    <head>
        <title>Formulario Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <!--<link REL="stylesheet" TYPE="text/css" HREF="StyleSheet1.css"><script language="JavaScript" src="DatGenPost_Valid.js" type="text/javascript"></script>-->
    </head>

    <body>

        <%
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date currentTime_1 = new Date();
        String dateString = formatter.format(currentTime_1);
        %>
        
<table width="79%" border="0" class="textoimpre" align="center">
  <tr>
                <td width="19%" height="69"><img src="img/logo.gif" width="83" height="90"></td>
                <td width="2%" height="69">&nbsp;</td>
                <td width="79%" height="69">
                    <div align="center">
                        <p><b>ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
                        &quot;JULIO GARAVITO&quot;</b></p>

                        <p><b>SOLICITUD DE SEGUIMIENTO ACADEMICO A LOS PROGRAMAS DE PREGRADO</b><br>
                        </p>
                    </div>
                </td>
            </tr>
        </table><br>
        
<table width="69%" border="0" cellspacing="0" cellpadding="0" class="textoimpre" align="center">
  <tr>
                <td>
                    <p align="left"><b>Solicitud de Seguimiento académico No: <%=nsol%></b></p>
                    <p align="left"><b>Nombre del aspirante: <%=nombre%></b></p>
                    <p align="left"><b>Programa acad&eacute;mico: <%=prog%></b></p>
                    <p align="left"><b>Nombre del acudiente: <%=acud.toUpperCase()%></b></p>
                    
      <p align="left"><b>Fecha: <%=dateString%></b> 
      <p align="left">Quien aparece aqu&iacute; como su acudiente es quien debe 
        firmar la carta que usted debe anexar a los documentos requeridos y hacerlos 
        llegar a la Oficina de Admisiones a m&aacute;s tardar <b><%=pregrados.elementAt(4)%>.</b>
      <p align="left">&nbsp;</p>
                    </td>
            </tr>
        </table>
        <form>
            <p align="left">&nbsp;</p>
            <p align="center"><INPUT type=button name=print value="Imprimir" onClick="javascript:window.print()">&nbsp;&nbsp;<input type="button" value="Cerrar ventana" onclick="window.close()">
        </form>
    </body>
</html>
