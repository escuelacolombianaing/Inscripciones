<%-- 
    Document   : citacion
    Created on : 2/12/2009, 11:00:49 AM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>


<% configeci.configuracion confEci = new configeci.configuracion();
String arreglo[]=new String[50];
String texto[] = new String[20] ;
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
String prog;
String tipprog = request.getParameter("prog");
Date currentTime_1 = new Date();
String dateString = formatter.format(currentTime_1);
ParsePosition pos = new ParsePosition(0);
Date currentTime_2 = formatter.parse(dateString, pos);
Date hoy = formatter.parse(dateString);
int l, b = 0, a = 0, s = 0, ban=1, k ;
arreglo = confEci.getTodo();
/*for (int j=1; j<confEci.getTamanio(); j++){
    StringTokenizer st = new StringTokenizer(arreglo[j], "$");
    k=0;
    while (st.hasMoreTokens()) {
        texto[k]=st.nextToken();
        k=k+1;
    }
     prog = texto[1];
    String val  = texto[0];
    Date fechafin = formatter.parse(texto[2]);

    if(prog.equals(tipprog)){
        if ((val.equals("1")) && (hoy.before(fechafin)))
            ban = 1;
            }
      }*/
 

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Citación a Exámenes de Diagnóstico </title>
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
            <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CITACION EXAMENES DE DIAGNOSTICO" />
        </jsp:include>

 <% if (ban == 1){%>
        <table width="440" border="1" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <form name="form1" method="post" action="Diagnostico">
                        <table align="center" border="0" cellpadding="0" cellspacing="2" width="292" height="98" class="textocom">
                            <tr>
                                <td align=left height="53" width="45%">
                                    <div align="right"><strong>Documento
                                    de Identidad </strong></div>
                                </td>
                                <td align=left width="9%">&nbsp;</td>
                                <td align=left height="53" width="46%">
                                    <div align="left">
                                        <input name="documento" type="password" maxlength="12" size="12" class="campotext">
                                </div></td>
                            </tr>
                            <tr>
                                <td align=left height="39" width="45%">
                                    <div align="right">
                                        <input id="submit1" name="Aceptar"  type="submit" value="Aceptar" title="Aceptar" class="boton" tabindex="Yes">
                                </div></td>
                                <td width="9%" height="39" align=left>&nbsp;</td>
                                <td width="46%" height="39" align=left>
                                    <div align="left">
                                        <input id="submit1" name="Limpiar" type="reset" value="Limpiar" title="Limpiar" class="boton">
                                </div></td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>
        <%} else {%>
        <p>
      
        <center> El proceso de consulta de citación a Exámenes de Diagnóstico no se encuentra disponible en el momento</center>

    <%}%>
    <p>
        <jsp:include page="piepag">
            <jsp:param name="parametro" value="" />
        </jsp:include>


    </body>
</html>