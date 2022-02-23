<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        BDadmisiones admision = new BDadmisiones();
        //Vector cupos = admision.CuposExternos();
        //String dato = cupos.elementAt(0).toString();
       // int total = Integer.parseInt(dato);
        configeci.configuracion confEci = new configeci.configuracion();%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Inscripción a Eventos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body id="public">
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
        <!--<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
            <tr>
                <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
            </tr>
            <tr>
                <td>
                    <!--jsp:include page="encabezado" flush="true">
                        <!--jsp:param name="anterior" value="InscripcionPI" />
                    <!--/jsp:include>
                </td>
            </tr>
        </table>-->
        <%Vector curso = admision.EventosExternos(confEci.getPeriodo());%>

         <%  if (curso.size()<= 0){%>
          <center> No hay programación de cursos disponibles en el momento.</center>
          
<p align="center"> 
  <%}else {%>
<center><b>  Inscripci&oacute;n a Eventos</b></center>
<table width="70%" border="3" id="tablaboton" align="center" class="textoimpremas">
  <form name="formulario" method="post" action="Inscripcion">
<% String cupo =(String) ((Vector) curso.elementAt(0)).elementAt(9);%>
    <input name="cupo" type="hidden"  value="<%=cupo%>">

    <tr> 
      <td height="22"> 
        <div align="center"><font face="Times New Roman, Times, serif"><b>Nombre 
          del Evento</b></font></div>
      </td>
      <td height="22"> 
        <div align="center"><font face="Times New Roman, Times, serif"><b>Fec.Evento.</b></font></div>
      </td>
      <td height="22"> 
        <div align="center"><font face="Times New Roman, Times, serif"><b>Horario</b></font></div>
      </td>
      <td height="22"> 
        <div align="center"><font face="Times New Roman, Times, serif"><b>Lugar</b></font></div>
      </td>
      <td height="22"> 
        <div align="center"><font face="Times New Roman, Times, serif"><b>Descripci&oacute;n</b></font></div>
      </td>
      <td height="22"> 
        <div align="center"><font face="Times New Roman, Times, serif"><b>Seleccione</b></font></div>
      </td>
      <p> 
        <%   Vector cursos = new Vector();
        for (int x = 0; x < curso.size(); x++) {
            cursos = (Vector) curso.elementAt(x);%>
      </p>
    </tr>
    <tr> 
      <td><font face="Times New Roman, Times, serif"><%=cursos.elementAt(0)%></font></td>
      <td><font face="Times New Roman, Times, serif" size="3"><%=cursos.elementAt(1)%>   <%=cursos.elementAt(2)%>   <%=cursos.elementAt(3)%></font></td>
      <td><font face="Times New Roman, Times, serif"><%=cursos.elementAt(6)%></font></td>
      <td><font face="Times New Roman, Times, serif"><%=cursos.elementAt(4)%></font></td>
      <td><font face="Times New Roman, Times, serif"><%=cursos.elementAt(7)%></font></td>
      <td> <font face="Times New Roman, Times, serif">
               <input type="hidden" name="nombres" value="<%=cursos.elementAt(0)%>" >
        <!--VERIFICAR PARA VALIDAR CUPOS AQUI VOY-->
        <input type="radio" name="idevento" value="<%=cursos.elementAt(8)%>">
        </font></td>
    </tr>
    <% }
        }%>
    <tr> 
      <td colspan="8"> 
        <div align="center"> <font face="Times New Roman, Times, serif"> 
          <input type="submit" name="Submit" value="Inscribirse">
          </font></div>
      </td>
    </tr>
    <tr> 
      <td colspan="8"> 
        <div align="right"> <font face="Times New Roman, Times, serif"> 
          <jsp:include page="piepag"> 
          <jsp:param name="anterior" value="InscripcionPI" />
          </jsp:include>
          </font></div>
      </td>
    </tr>
  </form>
</table>

    </body>
</html>
