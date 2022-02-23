
<!--Document   : reclasificacion
    Created on : 29/09/2009, 09:18:14 AM
    Author     : lrodriguez-->

<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
        String docEst = request.getParameter("docEst");
        String idEst = request.getParameter("idEst");
        String clave = request.getParameter("clave");
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        String prog = request.getParameter("idprog");
        String idprog = new String();
        String link = new String();
        String fecha = new String();
        String comparar = new String();
        String compararact = new String();
        String tipoest = new String();
        String clasifica1 = new String();
        String clasifica2 = new String();
        String clasifica3 = new String();
        String clasifica4 = new String();
        String clasifica5 = new String();
        String pericfes;
        int ban = 0;
        configeci.configuracion confEci = new configeci.configuracion();
 
%>

<%Vector estudiante = bd.Admitidos(docEst, confEci.getPeriodo(), oout);%>
  <%Vector asignaturas = bd.Niveles(estudiante.elementAt(1).toString(),confEci.getPeriodo(), oout);%>
<%  if (idEst != null && !idEst.equals("") && idEst.equals(estudiante.elementAt(10))) {%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Solicitar Reclasificación</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="ASPIRANTES A PRIMER SEMESTRE " />
        </jsp:include>
        <%
        if (estudiante.elementAt(1).equals("13")) {
            prog = "INGENIERIA CIVIL";
        } else if (estudiante.elementAt(1).equals("14")) {
            prog = "INGENIERIA ELECTRICA";

        } else if (estudiante.elementAt(1).equals("15")) {
            prog = "INGENIERIA DE SISTEMAS";

        } else if (estudiante.elementAt(1).equals("16")) {
            prog = "INGENIERIA INDUSTRIAL";


        } else if (estudiante.elementAt(1).equals("17")) {
            prog = "INGENIERIA ELECTRONICA";

        } else if (estudiante.elementAt(1).equals("18")) {
            prog = "ECONOMIA";

        } else if (estudiante.elementAt(1).equals("19")) {
            prog = "ADMINISTRACION DE EMPRESAS";

        } else if (estudiante.elementAt(1).equals("20")) {
            prog = "MATEMATICAS";

        } else if (estudiante.elementAt(1).equals("260")) {
            prog = "INGENIERIA MECANICA";

       } %>

        <%comparar = (String) estudiante.elementAt(4);%>

        <% char com1 = comparar.charAt(0);
            char com2 = comparar.charAt(1);
            char com3 = comparar.charAt(2);
            char com4 = comparar.charAt(3);
            char com5 = comparar.charAt(4);
        %>

        <% if (com1 == 'B') {
                clasifica1 = "Básico";
            }

            if (com1 == 'M') {
                clasifica1 = "Medio";
            }

            if (com1 == 'A') {
                clasifica1 = "Alto";
            }
        %>

        <% if (com2 == 'B') {
                clasifica2 = "Básico";
            }

            if (com2 == 'M') {
                clasifica2 = "Medio";
            }

            if (com2 == 'A') {
                clasifica2 = "Alto";
            }
        %>

        <% if (com3 == 'B') {
                clasifica3 = "Básico";
            }

            if (com3 == 'M') {
                clasifica3 = "Medio";
            }

            if (com3 == 'A') {
                clasifica3 = "Alto";
            }
        %>

        <% if (com4 == 'B') {
                clasifica4 = "Básico";
            }

            if (com4 == 'M') {
                clasifica4 = "Medio";
            }

            if (com4 == 'A') {
                clasifica4 = "Alto";
            }
        %>

        <% if (com5 == 'B') {
                clasifica5 = "Básico";
            }

            if (com5 == 'M') {
                clasifica5 = "Medio";
            }

            if (com5 == 'A') {
                clasifica5 = "Alto";
            }
        %>

        <% if ((estudiante.size()) == 0) {%>

        <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
            <tr>
                <td>
                    <b>Su documento es incorrecto o usted no ha diligenciado la
                        solicitud de admisión. Verifique e intente nuevamente o comuníquese con
                        la Oficina de Admisiones. <br>
                    Tel&eacute;fono: 6683600 opción 2 en el menú</b>

                </td>
            </tr>
        </table>

        <%} else if (!estudiante.elementAt(4).equals(estudiante.elementAt(14))) {%>
        <center> 
  <p><b>USTED YA SOLICITO RECLASIFICACION </b></p>
  <p>
    <%compararact = (String) estudiante.elementAt(14);%>
    <% char act1 = compararact.charAt(0);
     char act2 = compararact.charAt(1);
     char act3 = compararact.charAt(2);
     char act4 = compararact.charAt(3);
     char act5 = compararact.charAt(4);
        %>
    <% if (act1 == 'B') {
         clasifica1 = "Básico";
     }

     if (act1 == 'M') {
         clasifica1 = "Medio";
     }

     if (act1 == 'A') {
         clasifica1 = "Alto";
     }
        %>
    <% if (act2 == 'B') {
         clasifica2 = "Básico";
     }

     if (act2 == 'M') {
         clasifica2 = "Medio";
     }

     if (act2 == 'A') {
         clasifica2 = "Alto";
     }
        %>
    <% if (act3 == 'B') {
         clasifica3 = "Básico";
     }

     if (act3 == 'M') {
         clasifica3 = "Medio";
     }

     if (act3 == 'A') {
         clasifica3 = "Alto";
     }
        %>
    <% if (act4 == 'B') {
         clasifica4 = "Básico";
     }

     if (act4 == 'M') {
         clasifica4 = "Medio";
     }

     if (act4 == 'A') {
         clasifica4 = "Alto";
     }
        %>
    <% if (act5 == 'B') {
         clasifica5 = "Básico";
     }

     if (act5 == 'M') {
         clasifica5 = "Medio";
     }

     if (act5 == 'A') {
         clasifica5 = "Alto";
     }
        %>
  </p>
</center>
        
<table width="50%" border="0" align="center" class="textoimpremas">
  <tr> 
    <td colspan="5"> 
      <div align="left"><b>Nombre: <%=estudiante.elementAt(0)%></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="4"> 
      <p align="left"><b>Programa: <%=prog%></b></p>
    </td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="5"> 
      <p>&nbsp;</p>
      <p><b>Reclasificaci&oacute;n</b></p>
    </td>
  </tr>
  <form name="form1" method="post" action="NuevaClasificacion">
    <input type="hidden" name="idEst" value="<%=idEst%>">
    <tr> 
      <%if (estudiante.elementAt(1).equals("13") || estudiante.elementAt(1).equals("14") || estudiante.elementAt(1).equals("15") || estudiante.elementAt(1).equals("17")) {%>
      <td width="21%"> 
        <div align="left">Matemáticas:</div>
      </td>
      <td width="21%"><%= estudiante.elementAt(6)%></td>
      <td width="2%"><%=clasifica1%></td>
      <td width="42%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="21%"> 
        <div align="left">F&iacute;sica:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
      <td width="21%"><%= estudiante.elementAt(8)%></td>
      <td width="2%"><%=clasifica3%></td>
      <td width="42%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="21%" height="19"> 
        <div align="left">Lenguaje:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      </td>
      <td width="21%" height="19"><%=estudiante.elementAt(9)%></td>
      <td width="2%" height="19"><%=clasifica4%></td>
      <td width="42%" height="19">&nbsp;</td>
    </tr>
    <tr> 
      <td width="42%" colspan="2"> 
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </td>
      <td width="2%">&nbsp;</td>
      <td width="42%">&nbsp;</td>
      <td width="14%">&nbsp; </td>
    </tr>
    <tr> 
      <td width="42%" colspan="2">
              <p>&nbsp;</p>

        <p><b>Asignaturas que cursaría:</b></p>
        <p> 
          <%  for (int k = 0; k < asignaturas.size(); k++) {
         String niveles = String.valueOf(act1) + String.valueOf(act2) + String.valueOf(act3);
         Vector nivelasigna = (Vector) asignaturas.elementAt(k);
         String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2));
         if (niveles.equals(baseicfes)) {
             Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
        </p>
        <p> 
          <%  for (int p = 0; p < nomasigna.size(); p++) {
                        out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
          <br>
          <%}
         }
     }%>
        </p>
      </td>
    </tr>
    <input type="hidden" name="filosofia" value="<%=com2%>">
    <input type="hidden" name="quimica" value="<%=com5%>">
    <tr> 
      <% } else if (estudiante.elementAt(1).equals("18") || estudiante.elementAt(1).equals("19")) {%>
      <td width="21%"> 
        <div align="left">Matemáticas:</div>
      </td>
      <td width="21%"><%= estudiante.elementAt(6)%></td>
      <td width="2%"><%=clasifica1%></td>
      <td width="42%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="21%"> 
        <div align="left">Filosofía:</div>
      </td>
      <td width="21%"><%= estudiante.elementAt(7)%></td>
      <td width="2%"><%=clasifica2%></td>
      <td width="42%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="21%"> 
        <div align="left">Lenguaje:</div>
      </td>
      <td width="21%"><%=estudiante.elementAt(9)%></td>
      <td width="2%"><%=clasifica4%></td>
      <td width="42%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="42%" colspan="2">&nbsp;</td>
      <td width="2%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="42%" colspan="2"> 
        <p>&nbsp;</p>
        <p><b>Asignaturas que cursaría:</b> </p>
        <p> 
          <%  for (int k = 0; k < asignaturas.size(); k++) {
         String niveles = String.valueOf(com1) +  String.valueOf(com4);
         Vector nivelasigna = (Vector) asignaturas.elementAt(k);
         String baseicfes = String.valueOf(nivelasigna.elementAt(0)) +  String.valueOf(nivelasigna.elementAt(2));
         if (niveles.equals(baseicfes)) {
             Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
          <%  for (int p = 0; p < nomasigna.size(); p++) {
                    out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
          <br>
          <%}
         }
     }%>
      </td>
    </tr>
    <tr> 
      <% } else if (estudiante.elementAt(1).equals("16") || estudiante.elementAt(1).equals("20") || estudiante.elementAt(1).equals("260")) {%>
      <td width="21%"> 
        <div align="left">Matemáticas:</div>
      </td>
      <td width="21%"><%= estudiante.elementAt(6)%></td>
      <td width="2%"><%=clasifica1%></td>
      <td width="42%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="21%"> 
        <div align="left">Física:</div>
      </td>
      <td width="21%"><%= estudiante.elementAt(8)%></td>
      <td width="2%"><%=clasifica3%></td>
      <td width="42%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="21%"> 
        <div align="left">Lenguaje:</div>
      </td>
      <td width="21%"><%=estudiante.elementAt(9)%></td>
      <td width="2%"><%=clasifica4%></td>
      <td width="42%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="21%"> 
        <div align="left">Química</div>
      </td>
      <td width="21%"><%=estudiante.elementAt(11)%></td>
      <td width="2%"><%=clasifica5%></td>
      <td width="42%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="42%" colspan="2"> 
        <p>&nbsp;</p>
        <p><b>Asignaturas que cursaría:</b> </p>
        <p> 
          <%  for (int k = 0; k < asignaturas.size(); k++) {
         String niveles = String.valueOf(act1) + String.valueOf(act3) + String.valueOf(act4) + String.valueOf(act5);
        // out.println(niveles);
         Vector nivelasigna = (Vector) asignaturas.elementAt(k);
        // out.println(nivelasigna);
         String baseicfes = String.valueOf(nivelasigna.elementAt(0)) + String.valueOf(nivelasigna.elementAt(1)) + String.valueOf(nivelasigna.elementAt(2) + String.valueOf(nivelasigna.elementAt(3)));
         if (niveles.equals(baseicfes)) {
             Vector nomasigna = bd.nomasignaturas(nivelasigna.elementAt(4).toString(), nivelasigna.elementAt(5).toString(), nivelasigna.elementAt(6).toString(), nivelasigna.elementAt(7).toString(), nivelasigna.elementAt(8).toString(), nivelasigna.elementAt(9).toString(), nivelasigna.elementAt(10).toString(), nivelasigna.elementAt(11).toString(), nivelasigna.elementAt(12).toString(), nivelasigna.elementAt(13).toString(), nivelasigna.elementAt(14).toString(), nivelasigna.elementAt(15).toString(), oout);%>
          <%  for (int p = 0; p < nomasigna.size(); p++) {
                    out.println(((Vector) nomasigna.elementAt(p)).elementAt(0));%>
          <br>
          <%}
         }
     }%>
      </td>
      <td colspan="2">&nbsp; </td>
    </tr>
    <input type="hidden" name="filosofia" value="<%=com2%>">
    <%}%>
    <tr> 
      <td colspan="5"> 
        <p>&nbsp;</p>
        <p><b>Tenga en cuenta que la reclasificaci&oacute;n estar&aacute; sujeta 
          a la aprobaci&oacute;n por parte del Decano. Luego de enviar sus Datos 
          no podr&aacute; volver a realizar este proceso.</b></p>
      </td>
    </tr>
    <tr> 
      <td colspan="5"> 
        <div align="center"> </div>
      </td>
    </tr>
  </form>
</table>
<% } else {
     idprog = estudiante.elementAt(1).toString();
   //  int respuesta = bd.logconsultaadmitidos(estudiante.elementAt(10).toString(), estudiante.elementAt(2).toString(), oout);%>

        <!--fecha="XXX de 2006 de xxx en el salón xx";-->


        <p>&nbsp;</p>
        
<table width="50%" border="0" align="center" class="textoimpremas">
  <tr> 
    <td colspan="4"> 
      <div align="left"><b>Nombre: &nbsp;&nbsp;<%=estudiante.elementAt(0)%> </b></div>
      </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <p align="left"><b>Programa: &nbsp;<%=prog%></b></p>
    </td>
    <td width="54%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <div align="center"><b>Clasificaci&oacute;n Actual</b></div>
    </td>
    <td width="54%"> 
      <div align="center"><b>Reclasificaci&oacute;n</b></div>
    </td>
  </tr>
  <form name="form1" method="post" action="NuevaClasificacion">
    <input type="hidden" name="idEst" value="<%=idEst%>">
    <input type="hidden" name="docEst" value="<%=docEst%>">
    <tr> 
      <% if (estudiante.elementAt(1).equals("13") || estudiante.elementAt(1).equals("14") || estudiante.elementAt(1).equals("15") || estudiante.elementAt(1).equals("17")) {%>
      <td width="22%">Matemáticas:</td>
      <td width="11%"><%= estudiante.elementAt(6)%></td>
      <td width="13%"><%=clasifica1%></td>
      <td width="54%"> 
        <div align="center"> 
          <select name="matematicas">
            <%if (com1 == 'A') {%>
            <option value="A" selected>Alto</option>
            <option value="M">Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com1 == 'M') {%>
            <option value="A">Alto</option>
            <option value="M" selected>Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com1 == 'B') {%>
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B" selected>B&aacute;sico</option>
            <%}%>
          </select>
        </div>
      </td>
    </tr>
    <tr> 
      <td width="22%">F&iacute;sica:</td>
      <td width="11%"><%= estudiante.elementAt(8)%></td>
      <td width="13%"><%=clasifica3%></td>
      <td width="54%"> 
        <div align="center"> 
          <select name="fisica">
            <%if (com3 == 'A') {%>
            <option value="A" selected>Alto</option>
            <option value="M">Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com3 == 'M') {%>
            <option value="A">Alto</option>
            <option value="M" selected>Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com3 == 'B') {%>
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B" selected>B&aacute;sico</option>
            <%}%>
          </select>
        </div>
      </td>
    </tr>
    <tr> 
      <td width="22%">Lenguaje:</td>
      <td width="11%"><%=estudiante.elementAt(9)%></td>
      <td width="13%"><%=clasifica4%></td>
      <td width="54%"> 
        <div align="center"> 
          <select name="lenguaje">
            <%if (com4 == 'A') {%>
            <option value="A" selected>Alto</option>
            <option value="M">Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com4 == 'M') {%>
            <option value="A">Alto</option>
            <option value="M" selected>Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com4 == 'B') {%>
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B" selected>B&aacute;sico</option>
            <%}%>
          </select>
        </div>
      </td>
    </tr>
    <tr> 
      <td width="22%">&nbsp;</td>
      <td width="11%">&nbsp;</td>
      <td width="13%">&nbsp;</td>
      <td width="54%">&nbsp; </td>
    </tr>
    <input type="hidden" name="filosofia" value="<%=com2%>">
    <input type="hidden" name="quimica" value="<%=com5%>">

    <tr> 
      <% } else if (estudiante.elementAt(1).equals("18") || estudiante.elementAt(1).equals("19")) {%>
      <td width="22%">Matemáticas:</td>
      <td width="11%"><%= estudiante.elementAt(6)%></td>
      <td width="13%"><%=clasifica1%></td>
      <td width="54%"> 
        <div align="center"> 
          <select name="matematicas">
            <%if (com1 == 'A') {%>
            <option value="A" selected>Alto</option>
            <option value="M">Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com1 == 'M') {%>
            <option value="M">Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com1 == 'B') {%>
            <option value="B">B&aacute;sico</option>
            <%}%>
          </select>
        </div>
      </td>
    </tr>
    <tr> 
      <td width="22%">Filosofía:</td>
      <td width="11%"><%= estudiante.elementAt(7)%></td>
      <td width="13%"><%=clasifica2%></td>
      <td width="54%"> 
        <div align="center"> 
          <select name="filosofia">
            <%if (com2 == 'A') {%>
            <option value="A" selected>Alto</option>
            <option value="M">Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com2 == 'M') {%>
            <option value="A">Alto</option>
            <option value="M" selected>Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com2 == 'B') {%>
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B" selected>B&aacute;sico</option>
            <%}%>
          </select>
        </div>
      </td>
    </tr>
    <tr> 
      <td width="22%">Lenguaje:</td>
      <td width="11%"><%=estudiante.elementAt(9)%></td>
      <td width="13%"><%=clasifica4%></td>
      <td width="54%"> 
        <div align="center"> 
          <select name="lenguaje">
            <%if (com4 == 'A') {%>
            <option value="A" selected>Alto</option>
            <option value="M">Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com4 == 'M') {%>
            <option value="A" >Alto</option>
            <option value="M" selected>Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com4 == 'B') {%>
            <option value="A" >Alto</option>
            <option value="M">Medio</option>
            <option value="B" selected>B&aacute;sico</option>
            <%}%>
          </select>
        </div>
      </td>
    </tr>
    <tr> 
      <td width="22%">&nbsp;</td>
      <td width="11%">&nbsp;</td>
      <td width="13%">&nbsp;</td>
      <td width="54%">&nbsp;</td>
    </tr>
     <input type="hidden" name="fisica" value="<%=com3%>">
    <input type="hidden" name="quimica" value="<%=com5%>">
    <tr> 
      <% } else if (estudiante.elementAt(1).equals("16") || estudiante.elementAt(1).equals("20") || estudiante.elementAt(1).equals("260")) {%>
      <td width="22%">Matemáticas:</td>
      <td width="11%"><%= estudiante.elementAt(6)%></td>
      <td width="13%"><%=clasifica1%></td>
      <td width="54%"> 
        <div align="center"> 
          <select name="matematicas">
            <%if (com1 == 'A') {%>
            <option value="A" selected>Alto</option>
            <option value="M">Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com1 == 'M') {%>
            <option value="A">Alto</option>
            <option value="M" selected>Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com1 == 'B') {%>
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B" selected>B&aacute;sico</option>
            <%}%>
          </select>
        </div>
      </td>
    </tr>
    <tr> 
      <td width="22%">Física:</td>
      <td width="11%"><%= estudiante.elementAt(8)%></td>
      <td width="13%"><%=clasifica3%></td>
      <td width="54%"> 
        <div align="center"> 
          <select name="fisica">
            <%if (com3 == 'A') {%>
            <option value="A" selected>Alto</option>
            <option value="M">Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com3 == 'M') {%>
            <option value="A">Alto</option>
            <option value="M" selected>Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com3 == 'B') {%>
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B" selected>B&aacute;sico</option>
            <%}%>
          </select>
        </div>
      </td>
    </tr>
    <tr> 
      <td width="22%">Lenguaje:</td>
      <td width="11%"><%=estudiante.elementAt(9)%></td>
      <td width="13%"><%=clasifica4%></td>
      <td width="54%"> 
        <div align="center"> 
          <select name="lenguaje">
            <%if (com4 == 'A') {%>
            <option value="A" selected>Alto</option>
            <option value="M">Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com4 == 'M') {%>
            <option value="A">Alto</option>
            <option value="M" selected>Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com4 == 'B') {%>
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B" selected>B&aacute;sico</option>
            <%}%>
          </select>
        </div>
      </td>
    </tr>
    <tr> 
      <td width="22%">Química</td>
      <td width="11%"><%=estudiante.elementAt(11)%></td>
      <td width="13%"><%=clasifica5%></td>
      <td width="54%"> 
        <div align="center"> 
          <select name="quimica">
            <%if (com5 == 'A') {%>
            <option value="A" selected>Alto</option>
            <option value="M">Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com5 == 'M') {%>
            <option value="A">Alto</option>
            <option value="M" selected>Medio</option>
            <option value="B">B&aacute;sico</option>
            <%} else if (com5 == 'B') {%>
            <option value="A">Alto</option>
            <option value="M">Medio</option>
            <option value="B" selected>B&aacute;sico</option>
            <%}%>
          </select>
        </div>
      </td>
    </tr>
    <input type="hidden" name="filosofia" value="<%=com2%>">
    <%}%>
    <tr> 
      <td colspan="4"><b>Tenga en cuenta que la reclasificaci&oacute;n estar&aacute; 
        sujeta a la aprobaci&oacute;n por parte del Decano. Luego de enviar sus 
        Datos no podr&aacute; volver a realizar este proceso.</b></td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <div align="center"> 
          <input type="submit" name="Submit" value="Enviar Datos"  class="textoimpremas">
        </div>
      </td>
    </tr>
  </form>
</table>



<%}%>
        <h1>&nbsp;</h1>
    </body>
</html>
<% }
        
        else{
        out.println ("Su documento y clave no concuerdan o usted no ingresó el número de carnet. Verifique que sus datos estén correctos");
        }
%>