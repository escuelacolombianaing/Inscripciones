<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<html>
<%
        String id_prog = request.getParameter("idplan");
	configeci.configPosgrados confEci = new configeci.configPosgrados();
        boolean entrevistas = confEci.getEntrevistas(id_prog);
       
%>

<head>
<title>Consulta Entrevistas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">

</head>

<body bgcolor="#FFFFFF" text="#000000">

<table width="98%" border="0" height="74">
  <tr>      
    <td width="11%" height="76"><img src="img/logo.gif" width="83" height="90"></td>      
    <td width="1%" height="76">&nbsp;</td>      
    <td width="88%" height="76"> 
      <div align="center">          
        <p><b><font size="4" color="#CC0000">ESCUELA COLOMBIANA DE INGENIER&Iacute;A 
          JULIO GARAVITO</font></b></p>
        <p><font color="#C10000" size="4"><b><font size="3">ASPIRANTES A UN PROGRAMA 
          DE ESPECIALIZACION<br>
          ENTREVISTAS</font></b></font> <font size="3"></font></p>
        </div>
      </td>
    </tr>
  </table>
  
  
  
 
  <%if (entrevistas == true) {
    response.sendRedirect("EntrevistasPosgrado") ;
} else { %>
<p>&nbsp;
<table width="95%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td bgcolor="#E4E4E4">&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  
  
    <% if (id_prog.equals("263")){%>
 <tr> 
    <td height="43"><font face="Verdana, Arial, Helvetica, sans-serif">Por favor colsulte el link de Admitidos</font></td>
  </tr>
  <% //}else if(idplan.equals("274")){ %>
   <!-- <tr> 
    <td><font face="Verdana, Arial, Helvetica, sans-serif">El proceso de consulta 
      de <b>entrevistas</b> para esta especializaci&oacute;n estar� disponible el 18 de mayo despu�s de las 2:00 p.m. 
      <!--<a href="VerificaCronograma?idplan=<%=id_prog%>"><b>consulte aqu&iacute;</a> 
      la programaci&oacute;n></font>. 
 
    </td>
  </tr-->
  
  

  <%} else {%>
  <tr> 
    <td><font face="Verdana, Arial, Helvetica, sans-serif">El proceso de consulta 
      de <b>entrevistas</b> para esta especializaci&oacute;n no se encuentra disponible. 
      <!--<a href="VerificaCronograma?idplan=<%=id_prog%>"><b>consulte aqu&iacute;</a> 
      la programaci&oacute;n--></font>. 
 
    </td>
  </tr>
  
  <%}
  }%>
  <%     session.setAttribute("idplan", id_prog); %>
<!--  <tr> 
    <td> 
      <p>&nbsp;</p>
      <p><font face="Verdana, Arial, Helvetica, sans-serif">Para cualquier informaci&oacute;n 
        adicional comun&iacute;quese al tel&eacute;fono 6683600 exts. 274 &oacute; 
        263 &oacute; 101 &oacute; al e-mail </font><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a></font></b></p>
    </td>
  </tr>-->
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td bgcolor="#E4E4E4">&nbsp;</td>
  </tr>
</table>
<p>&nbsp;
</body>
</html>
