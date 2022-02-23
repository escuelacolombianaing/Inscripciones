<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        BDadmisiones admision = new BDadmisiones();
        Vector ciud = admision.getCiudades();
        Vector profes = admision.getProfesiones();
        PrintWriter oout = response.getWriter();
        int i;
        String ref = request.getParameter("ref");
        String doc = request.getParameter("doc");
        String prog ="";
        Vector pginsc = admision.getInscrito(doc, ref);
        prog = (pginsc.elementAt(1).toString());
      //  out.println(prog);
        Vector plan = admision.VerificaPlan(prog);
        String uplan = plan.elementAt(0).toString();
       // out.println(uplan);
        /*if(pginsc.size()>0){*/
        String tipo = (String) pginsc.elementAt(6);
%>
<html>
    <head>
        <title>Formulario de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
      
    </head>

    <body>
        
<table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr> 
    <td><img src="img/logo.gif" width="80" height="90" border="0" alt=""></td>
  </tr>
</table>
        <br>
        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
                
    <td> <fieldset><legend class="textocom"></legend>
      <div align="center">
        <p>NOMBRES:</p>
        <p>&nbsp; </p>
        <form action="ConfirmarPregrado" method="post" name="forminsc" id="forminsc">
        </form>
                        </div>
                    </fieldset>
                </td>
            </tr>
        </table>
    </body>
</html>
<!%
}else
response.sendRedirect("ErrorPago");
%>
