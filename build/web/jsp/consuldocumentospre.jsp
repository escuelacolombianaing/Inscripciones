<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>


<%

            String docEst = request.getParameter("doc");
            PrintWriter oout = response.getWriter();
            BDadmisiones bd = new BDadmisiones();
            String periodo = request.getParameter("per");
            HttpSession sesion;
            sesion = request.getSession(true);
            if (docEst != null && !docEst.equals("")) {
%>

<html>
    <head>
        <title>Consulte Documentación Recibida</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>

    <body bgcolor="#FFFFFF" text="#000000">

        
<table width="715" border="0" cellspacing="0" cellpadding="0" height="20" align="center">
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

            </tr>
        </table>


        <p>
            <%Vector consulta = bd.Documentacion(docEst, periodo, oout);%>
            <!%=consulta%>
            <%if ((consulta.size()) == 0) {%>
        
<table width="75%" border="0" class="textoimpre" align="center">
  <tr>
                <td>
                    <div align="center">Su documento es incorrecto o usted no formaliz&oacute;
                        la solicitud de admisión para este programa académico.</div>
                </td>
            </tr>
        </table>
        
<p>
  <center>
  </center>
<p align="left"><br>
  <%  } else {
          //Vector estado = (Vector)consulta.elementAt(0);
      //|| (!estado.elementAt(1).equals("-81"))&& (!estado.elementAt(1).equals("-80"))
          if ((consulta.elementAt(1).equals("-83"))) {
              out.println("<b><center>");
              out.println(consulta.elementAt(0));
        out.println("</b></center>");%>
<table width="75%" border="0" class="textoimpre" align="center">
  <tr>
                <td>Su documentación aún no ha sido recibida en la oficina de Admisiones. Por favor verifique con la empresa de mensajería.
                    Tenga en cuenta que en caso que esta haya llegado incompleta no se considera recibida, por lo cual deberá verificar con la oficina de admisiones, Tel:6683600 opción 2 en el menú. </td>
            </tr>
        </table>

        <%   } else if (((consulta.elementAt(1).equals("-79")) || (consulta.elementAt(1).equals("-80")) || (consulta.elementAt(1).equals("-81")) || (consulta.elementAt(1).equals("-60")) || (consulta.elementAt(1).equals("3")) || (consulta.elementAt(1).equals("-61")) || (consulta.elementAt(1).equals("6")))&& (consulta.elementAt(2).equals("0"))) {
               out.println("<b><center>");
               out.println(consulta.elementAt(0));
                  out.println("</b></center>");%>
        
<table width="51%" border="0"  class="textoimpre" align="center" >
  <tr> 
    <td> 
      <p align="left">Su documentación fué recibida en la oficina de Admisiones. 
        <br>
        Consulte el procedimiento a seguir según sea el caso : </p>
      <p align="left">Primer Semestre: <a href="http://www.escuelaing.edu.co/admisiones/aspirantes_01.htm"> 
        Consulte aquí </a></p>
      <p align="left"> 
        <!--<p><b><font color="#C10000" size="3">Transferencia :  </font>Presente entrevista en la fecha asignada por la Oficina de Admisiones y reclame la respuesta correspondiente el 26 de Mayo en esta misma Oficina.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
      </p>
    </td>
  </tr>
</table>


        <%  } else if ((consulta.elementAt(1).equals("-70")) || (consulta.elementAt(1).equals("-71"))) {
                out.println("<b><center><h3>Por favor comuníquese al 6683600 opción 2 en el menú.  </h3> </center></b>");
            } else if ((consulta.elementAt(1).equals("-60")) && (consulta.elementAt(2).equals("1"))) {
            out.println("Su documentación aún no ha sido recibida en la oficina de Admisiones. Por favor verifique con la empresa de mensajería. Tenga en cuenta que en caso que esta haya llegado incompleta no se considera recibida, por lo cual deberá verificar con la oficina de admisiones, Tel:6683600 opción 2 en el menú. ");
            }else {
                out.println("<b><center><h3>Por favor comuníquese al 6683600 opción 2 en el menú.  </h3> </center></b>");
            }
        %>
        <%}
            }%>
    </body>
</html>








