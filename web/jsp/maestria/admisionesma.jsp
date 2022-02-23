

<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%String plan = request.getParameter("idplan");
        configeci.configmaestria confEci = new configeci.configmaestria();
        boolean admitidos = confEci.getAdmitidos(plan);
        otros.rutas ruta = new otros.rutas();
        BDadmisiones bd = new BDadmisiones();
        PrintWriter oout = response.getWriter();
        Vector posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), plan);
        int ban = 0;
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date fechafin = new Date();
        String dato = new String(posgrados.elementAt(10).toString());
        plan = new String(posgrados.elementAt(1).toString());
        String datofin = new String(posgrados.elementAt(20).toString());
        String fechaActual = formatter.format(hoy);
        Date inicio = formatter.parse(dato);
        Date finall = formatter.parse(datofin);
        String X = formatter.format(inicio);
        String Y = formatter.format(finall);
        //  if (prog.equals(tipoest)) {
        if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y))) {
            ban = 1;
        }%>
<%if (plan != null && !plan.equals("")) {%>	

<html>
<head>
    <title>Admitidos - Maestría </title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="css/comun.css" rel="stylesheet" type="text/css" >
  
    <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
</head>
<body bgcolor="#ffffff">
    <%if (plan.equals("353")||plan.equals("354")) {%>
    <jsp:include page="encabezado">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA EN GESTIÓN DE INFORMACIÓN" />
    </jsp:include>
    <%} else if (plan.equals("321") || plan.equals("332")) {%> 
    <jsp:include page="encabezado">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA EN INGENIERÍA ELECTRONICA" />
    </jsp:include>
    <%}else if (plan.equals("351")){ %>
<jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS" />
        </jsp:include>
<%} else if (plan.equals("330")){ %>
<jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERIA INDUSTRIAL" />
        </jsp:include>
<%} else if (plan.equals("335") || plan.equals("336")){%>
               <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERIA ELÉCTRICA" />
        </jsp:include>
<%  } else if (plan.equals("371")){%>
     <jsp:include page="encabezado">
  <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
  <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INFORMÁTICA" />
</jsp:include>
<%  } else if (plan.equals("372")){%>
     <jsp:include page="encabezado">
  <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
  <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN CIENCIAS ACTUARIALES" />
</jsp:include>
<%  }else if (plan.equals("376") || plan.equals("377")){%>
               <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN CIENCIA DE DATOS" />
        </jsp:include>
<%  }else {%>
    <jsp:include page="encabezado">
        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA EN INGENIERÍA CIVIL" />
    </jsp:include>

    <%}%>
    <%if (ban == 1) {%>
    
    <form name="form1" method="post" action="ConsultaAdmitidosMa">
        <p>
        <div align="center">
  <table border="0">
    <tr> 
      <td>
        <p>&nbsp;</p>
        <p>Documento de Identidad</p>
      </td>
      <td> 
        <p>&nbsp;</p>
        
          <input name=documento type=password maxlength=12 size="12">
      
      </td>
    </tr>
    <%if (plan.equals("290") || plan.equals("291") || plan.equals("292")|| plan.equals("293")|| plan.equals("294")) {%>
    <tr> 
      <td> 
        Seleccione el &eacute;nfasis al cual se inscribi&oacute;
      </td>
      <td> 
        
          <select name="idplan" class="campotext">
            <option value="N" selected><b>Seleccione</b></option>
            <option value="291">Enfasis en Ingenier&iacute;a Estructural</option>
            <option value="290">Enfasis en Recursos Hidr&aacute;ulicos y Medio 
            Ambiente</option>
            <option value="292">Enfasis en Ingenier&iacute;a Ambiental</option>
            <option value="293">Enfasis en Geotecnia Mod. de Profundizaci&oacute;n</option>
            <option value="294">Enfasis en Tr&aacute;nsito y Transporte Mod. de 
            Profundizaci&oacute;n</option>
          </select>
      </td>
    </tr>
    <%} else  if (plan.equals("321") || plan.equals("332")|| plan.equals("333")) {%>
    <tr> 
        <td>  
        Seleccione la modalidad a la cual se inscribi&oacute;
      </td>
      <td> 
        
          <select name="idplan" class="campotext">
            <option value="N" selected><b>Seleccione</b></option>
            <option value="332">Modalidad de Profundización</option>
            <option value="333">Modalidad de Investigación</option>
          </select>
      
      </td>
    </tr>
    <%}else  if (plan.equals("376") || plan.equals("377")) {%>
    <tr> 
        <td>  
        Seleccione la modalidad a la cual se inscribi&oacute;
      </td>
      <td> 
        
          <select name="idplan" class="campotext">
            <option value="N" selected><b>Seleccione</b></option>
            <option value="376">Modalidad de Profundización</option>
            <option value="377">Modalidad de Investigación</option>
          </select>
      
      </td>
    </tr>
    <%}else  if (plan.equals("330")) {%>
    <tr> 
      <td> 
        <div align="left">Seleccione la modalidad a la cual se inscribi&oacute;</div>
      </td>
      <td> 
        
          <select name="idplan" class="campotext">
            <option value="N" selected><b>Seleccione</b></option>
            <option value="330">Modalidad de Profundización</option>
            <option value="331">Modalidad de Investigación</option>
          </select>
       
      </td>
    </tr>
    <%} else  if (plan.equals("335")|| plan.equals("336")) {%>
    <tr> 
      <td> 
        Seleccione la modalidad a la cual se inscribi&oacute;
      </td>
      <td>
<select name="idplan" class="campotext">
            <option value="N" selected><b>Seleccione</b></option>
            <option value="335">Modalidad de Profundización</option>
            <option value="336">Modalidad de Investigación</option>
          </select>
        
      </td>
    </tr>
    <%}else  if (plan.equals("353")|| plan.equals("354")) {%>
    <tr> 
      <td> 
        Seleccione la modalidad a la cual se inscribi&oacute;
      </td>
      <td>
<select name="idplan" class="campotext">
            <option value="N" selected><b>Seleccione</b></option>
            <option value="353">Modalidad de Profundización</option>
            <option value="354">Modalidad de Investigación</option>
          </select>
        
      </td>
    </tr>
    <%}else {%>
    <input name="idplan" type="hidden" id="idplan" value="<%=plan%>">
    <%}%>
    <tr> 
       <td colspan="2"> 
          <div align="center">
          
        <p>&nbsp;</p>
        <p>
          <input id=submit1 name=Aceptar  type=submit value=Aceptar title=Aceptar tabindex="Yes">
          <input id=submit1 name=Limpiar  type=reset value=Limpiar title=Limpiar>
        </p>
      </td>
    </tr>

   
    <tr>
        <td colspan="3" height="10">
            <div align="center"><img src="img/rojo.jpg" width="580" height="2"></div>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <p align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Avenida
                13 No 205-59 - Kilómetro 13 Autopista Norte <br>
                Bogotá - Colombia - Sur América <br>
                PBX: +57(1)6683600. Fax: 57(1)6762340  <br>
            <a href="mailto:webmaster@escuelaing.edu.co">Webmaster</a></font>
        </td>
    </tr>
    </table>
    </div>
 </form>
    <%}else if (plan.equals("335")){%>
        <br>
                <br>
                <font face="Verdana, Arial, Helvetica, sans-serif"><center>El proceso de consulta de admisiones para la Maestría en Ingeniería Eléctrica, se encontrará disponible después del 2 de diciembre de 2019, según cronograma.</center>
                    </font>
               
                
                <p>&nbsp;</p>
                <p><font face="Verdana, Arial, Helvetica, sans-serif"><center>Para cualquier informaci&oacute;n
                            adicional comun&iacute;quese al tel&eacute;fono 6683600 opción 2 en el menú &oacute; al e-mail </center></font><b><font face="Verdana, Arial, Helvetica, sans-serif"><center><a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a></center></font></b></p>
          
<%}else {%>
<table width="95%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas">
        <tr>

        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <!%if (idplan.equals("noaplica")/*idplan.equals("280")*/){%>

        <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif"><center>El proceso de consulta
                de <b>admisiones</b> para la Maestría no se encuentra disponible.  </center>
                    <!--<a href="VerificaCronograma?idplan=<//%=idplan%>"><b>consulte aqu&iacute;</a>
      la programaci&oacute;n-->
                </font>
            </td>
        </tr>
        <tr>
            <td>
                <p>&nbsp;</p>
                <p><font face="Verdana, Arial, Helvetica, sans-serif"><center>Para cualquier informaci&oacute;n
                            adicional comun&iacute;quese al tel&eacute;fono 6683600 opción 2 en el menú &oacute; al e-mail </center></font><b><font face="Verdana, Arial, Helvetica, sans-serif"><center><a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a></center></font></b></p>
            </td>
        </tr>
        <%}%>

        <!--<tr>
     <!--<td>
      <p>&nbsp;</p>-->
            <!--<p><font face="Verdana, Arial, Helvetica, sans-serif">Para cualquier informaci&oacute;n
        adicional comun&iacute;quese al tel&eacute;fono 6683600 exts. 274 &oacute;
        263 &oacute; 101 &oacute; al e-mail </font><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a></font></b></p>-->
            <!--</td>-->
            <!--</tr>-->

    </table>
       
</body>
</html>
<%}%>