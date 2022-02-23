
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% response.setHeader("Cache-Control", "no-cache");
//configeci.configuracion confEci = new configeci.configuracion();
        HttpSession sesion;
//sesion = request.getSession(true);
        String tipoest = request.getParameter("tipoest");
        String icfes = "", pais = "", colegio = "", bachiller = "";
        String titulo = new String("");
        configeci.configuracion confEci = new configeci.configuracion();
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        int ban = 0;
        //Convertir el dato String a Date para compararlo mas adelante.
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String fechaActual = formatter.format(hoy);
        titulo = " Inscripciones en línea";
        /* Inscripciones Extemporáneas*/

        if (tipoest.equals("E") || tipoest.equals("T")) {
            titulo = "Inscripciones en línea";
        }

        Vector pregrados = bd.pregrado(oout, confEci.getPeriodo(), tipoest);
        Date fechafin = new Date();
        String dato = new String(pregrados.elementAt(1).toString());
        String prog = new String(pregrados.elementAt(3).toString());
        String datofin = new String(pregrados.elementAt(2).toString());

        Date inicio = formatter.parse(dato);
        Date finall = formatter.parse(datofin);
        String X = formatter.format(inicio);
        String Y = formatter.format(finall);
        if (prog.equals(tipoest)) {
            if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y)) && (pregrados.elementAt(5).equals("1"))) {
                ban = 1;
            }
        }

     %>
<html>
<head><title>Autenticación para Inscripción</title>
<link href="css/comun.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/estilo-fomularios.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="SOLICITUD DE SEGUIMIENTO ACADEMICO A LOS PROGRAMAS  DE PREGRADO" />
</jsp:include>
 <%if (ban == 0) {%>
        <p>
        <center><b>Este proceso sólo se habilitará en las fechas programadas que aparecen en el calendario de admisiones,<br> para cualquier información adicional,comuníquese con la Oficina de Admisiones, opción 2 en el menú.</b></center>

        <%} else {%>
        <div class="container-fluid contenidos">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-5">
<div align="center">
  <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
    <tr>
      <td><p>Para realizar la solicitud de seguimiento académico a alguno de los programas académicos 
  de la Escuela Colombiana de Ingeniería, por favor registre el n&uacute;mero 
  de referencia, n&uacute;mero de carn&eacute; y la clave numérica de
  registro.</p></td>
    </tr>
</table>
  <form method="POST" action="VerificaSeguimiento">
   <table border="0" cellpadding="2" cellspacing="2" width="60%" height="100" align="left" class="textocom">
    <tr bgcolor="#F3F3F3"> 
      <td  bgcolor="#F3F3F3" width="30%" height="25"> 
        <p align="center"><strong>No.&nbsp;<br>
          Referencia del pago&nbsp; </strong> 
      </td>
      <td  bgcolor="#F3F3F3" width="30%" height="25"><strong> 
              <p align="left"> <input type="text" name="ref" size="10" class="dato1"></p>
        </strong></td>
    </tr>
    <tr  bgcolor="#F3F3F3"> 
      <td  bgcolor="#F3F3F3" width="30%" height="25"> 
        <p align="center"><strong>Número&nbsp; <br>
          carné&nbsp; </strong> 
      </td>
      <td  bgcolor="#F3F3F3" width="30%" height="25"><strong> 
        <p align="left"><input type="text" name="idest" size="15" class="dato1"></p>
        </strong></td>
    </tr>
    <!--tr bgcolor="#F3F3F3"> 
      <td  bgcolor="#F3F3F3" width="50%"> 
        <p align="right"><strong>Clave de acceso a <br>
          servicios académicos&nbsp; </strong>
      </td>
      <td  bgcolor="#F3F3F3" width="50%"><strong> 
        <input type="password" name="clave" size="15" class="campotext">
        </strong></td>
    </tr-->
  </table>
</div>
  <div style="width: 80%;"><center><p><input type="submit" value="Enviar" name="B1" class="boton"></p>
  </center></div>
</form>
  <%}%>
   </div>
    </div>
    </div>
  <div align="center">
 <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                </div>
  </div>
</body>
</html>