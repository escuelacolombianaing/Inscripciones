<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>


<%

        String docEst = request.getParameter("doc");
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
//  Estudiantereint est = new Estudiantereint(docEst,oout) ;
        configeci.configPosgrados confEci = new configeci.configPosgrados();
        HttpSession sesion;
        sesion = request.getSession(true);
        if (docEst != null && !docEst.equals("")) {
%>

<html>
    <head>
        <title>Consulte Documentación Recibida</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    </head>

    <body bgcolor="#FFFFFF" text="#000000">

  <table width="715" border="0" cellspacing="0" cellpadding="0" height="20" align="center">
    <tr> 
      <td rowspan="4" width="150" valign="top"><img src="img/Escudo.gif" width="95" height="96"></td>
      <td height="2"> 
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
    </tr>
  </table>
<p align="left">&nbsp; 
<p align="left">&nbsp;
<p align="left"> 
  <%Vector estado = bd.Documentacion(docEst, confEci.getPeriodo(), oout);%>
  <%if ((estado.size()) == 0) {

        %>
<h3 align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Su
  documento es incorrecto o usted no formaliz&oacute; la solicitud de admisión 
  para este programa académico.</font></h3>
<div align="left"><br>
  <%  } else {
  //  Vector estado = (Vector) consulta.elementAt(0);
    if (estado.elementAt(1).equals("-190")) {
        out.println("<b><center>");
        out.println(estado.elementAt(0));
        out.println("</b></center>");
        out.println("<b><center><h3>Su documentación aún no ha sido recibida en la oficina de Admisiones. Por favor verifique con la empresa de mensajería.");
        out.println("<br>Tenga en cuenta que en caso que esta haya llegado incompleta no se considera recibida, por lo cual deberá verificar con la oficina de admisiones, Tel:6683600 opción 2 en el menú. </h3></center></b>");
    } else if ((estado.elementAt(1).equals("-185")) || (estado.elementAt(1).equals("-179")) || (estado.elementAt(1).equals("-183")) || (estado.elementAt(1).equals("-91"))) {
        out.println("<b><center>");
        out.println(estado.elementAt(0));
        out.println("</b></center>");
        out.println("<b><center><h3>Su documentación fué recibida en la oficina de Admisiones, por favor consulte el cronograma.  </h2> </center></b>");
    } else if (estado.elementAt(1).equals("-181")) {
        out.println("<b><center><h3>Por favor comuníquese con la Oficina de Admisiones. Tel:6683600 opción 2 en el menú.  </h2> </center></b>");
    } else {
        out.println("<b><center><h3>Por favor comuníquese con la Oficina de Admisiones. Tel:6683600 opción 2 en el menú.  </h2> </center></b>");
    }
            %>
  <%}
        }%>
</div>
</body>
</html>

