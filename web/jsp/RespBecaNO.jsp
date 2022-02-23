<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
String docEst = request.getParameter("documento");
PrintWriter oout = response.getWriter() ;
BDadmisiones bd = new BDadmisiones();
String prog = new String();
String fecha = new String();

int ban = 0;
configeci.configuracion confEci = new configeci.configuracion();
if (docEst != null && !docEst.equals("")) {
%>

<html>
<head>
    <title>Becas Julio Garavito Armero</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table width="715" border="0" cellspacing="0" cellpadding="0" height="20" class="textocom">
    <tr> 
        <td rowspan="4" width="150" valign="top"><img src="img/logo.gif" width="95" height="96"></td>
        <td height="2"> 
            <div align="center"> </div>
        </td>
    </tr>
    <tr> 
        <td height="11"> 
            <div align="center"> <font color="#C10000" size="3"><b><font size="4">ESCUELA 
            COLOMBIANA DE INGENIERIA JULIO GARAVITO</font></b></font> </div>
        </td>
    </tr>
    <tr> 
        <td> 
            <div align="center"> <font color="#C10000" size="4"><b>ADMISIONES</b></font> 
            </div>
        </td>
    </tr>
    <tr> 
        <td height="27"> 
            <div align="center"> <font color="#C10000" size="4"><b>POSTULANTES BECAS 2008-2</b></font> </div>
        </td>
    </tr>
</table>
<p> 
    <%Vector estudiante = bd.Becas(docEst,oout, confEci.getPeriodo() ) ;%>
    <%if((estudiante.size()) == 0){%>
</p>

<table width="710" border="0" cellspacing="0" cellpadding="0" class="textocom">
    <tr> 
        <td>
            <p align="center">
            <center>
                <p>&nbsp;</p>
                <font size="3"><b>Su documento es incorrecto o usted no ha diligenciado la 
                        solicitud de Postulaci�n a las Becas Julio Garavito 2008-2. Verifique e intente nuevamente o comun�quese con 
                        la Oficina de Admisiones. <br>
                Tel&eacute;fono: 6683600 Ext: 274, 263 o 101</b></font> 
            </center>
        </td>
    </tr>
</table>

<%}  else{
if (estudiante.elementAt(2).equals("14")){
prog="INGENIERIA ELECTRICA";
fecha="Jueves 29 de Mayo a las 7:15 am en el Aula M�xima , Bloque C, primer piso";}%>

<%if (estudiante.elementAt(2).equals("18")){
prog="ECONOMIA";
fecha="Jueves 29 de Mayo a las 7:15 am en el Aula M�xima , Bloque C, primer piso";}%>

<%if (estudiante.elementAt(2).equals("20")){
prog="MATEMATICAS";
fecha="Jueves 29 de Mayo a las 7:15 am en el Aula M�xima , Bloque C, primer piso";}%>

<b>Apreciado Postulante: </b>
<br><%=estudiante.elementAt(0)%>
<p><b>Programa: </b><%=prog%>
<p>
Los Directivos de la Escuela Colombiana de Ingenier�a se permiten convocarle a una reuni�n en compa��a de su
acudiente el d�a Jueves 29 de Mayo a las 7:30 a.m. en el Aula M�xima Boque C, primer piso,
en donde se proporcionar� informaci�n general del programa y se explicar� el mecanismo
de selecci�n y adjudicaci�n de las Becas.
<p>
Esperamos su puntual asistencia, Secretar�a General -  Admisiones.


</body>
</html>
<% }
} else {

response.sendRedirect("IdentificaBeca") ;

} 
%>
