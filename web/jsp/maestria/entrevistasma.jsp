
<%@page import="utiles.Correo"%>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%
    try {
        response.setHeader("Cache-Control", "no-cache");
        HttpSession sesion;
        sesion = request.getSession(true);
        String plan = request.getParameter("idplan");
        configeci.configmaestria confEci = new configeci.configmaestria();
        BDadmisiones bd = new BDadmisiones();
        PrintWriter oout = response.getWriter();
        String titulo = "Consulta Entrevistas Maestría";
        Vector posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), plan);
        int ban = 0;
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date fechafin = new Date();
        if (posgrados.size() <= 0) {
            out.println("Falta información");
        } else {
            String dato = new String(posgrados.elementAt(7).toString());
            plan = new String(posgrados.elementAt(1).toString());
            //SE CAMBIA DESDE INCIO ENTREV HASTA INICIO DE CLASES YA Q LOS CORONOGRAMAS NO SON COHERENTES EN LAS FECHAS PONEN RTA DE ADMISION ANTES DE LA FECHA DE ENTREV.
            // String datofin = new String(posgrados.elementAt(10).toString());
            String datofin = new String(posgrados.elementAt(20).toString());
            String fechaActual = formatter.format(hoy);
            Date inicio = formatter.parse(dato);
            Date finall = formatter.parse(datofin);
            String X = formatter.format(inicio);
            String Y = formatter.format(finall);
//  if (prog.equals(tipoest)) {
            if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y))) {
                ban = 1;
            }

            boolean entrevistas = confEci.getEntrevistas(plan);
            if (plan != null && !plan.equals("")) {
%>	
<html>
    <head>
        <title>Consulta de Entrevistas </title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <%if (plan.equals("353")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN GESTIÓN DE INFORMACIÓN" />
        </jsp:include>
        <%} else if (plan.equals("332")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERÍA ELECTRÓNICA" />
        </jsp:include>
        <%} else if (plan.equals("351")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS" />
        </jsp:include>
        <%} else if (plan.equals("330")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERIA INDUSTRIAL" />
        </jsp:include>
        <%} else if (plan.equals("335")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERIA ELÉCTRICA" />
        </jsp:include>
        <%}else if (plan.equals("371")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INFORMÁTICA" />
        </jsp:include>
        <%}else if (plan.equals("372")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN CIENCIAS ACTUARIALES" />
        </jsp:include>
        <%}else if (plan.equals("376")) {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN CIENCIA DE DATOS" />
        </jsp:include>
        <%}else {%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE ADMISIÓN A LA MAESTRÍA EN INGENIERÍA CIVIL" />
        </jsp:include>
        <%}%>

        <%if (ban == 1) {%>
        <div align="center"> 
            <table border="0"  class="textocom">
                <form name="form1" method="post" action="ConsultaEntrevistasMa">
                    <tr> 
                        <td> 
                            <strong>Documento de Identidad </strong>
                        </td>
                        <td> 

          <p>&nbsp; </p>
          <p>
            <input name=documento type=password maxlength=12  size="12">
          </p>
                            <p>&nbsp; </p>
                        </td>
                    </tr>
                    <%if (plan.equals("290")) {%>
                    <tr> 
                        <td> 
                            <b>Seleccione el Enfasis al cual se inscribi&oacute;</b>
                        </td>
                        <td> 
                            <select name="idplan" class="campotext">
                                <option value="N" selected><b>Seleccione</b> </option>
                                <option value="290">Enfasis en Recursos Hidr&aacute;ulicos y Medio 
                                    Ambiente</option>
                                <option value="291">Enfasis en Ingenier&iacute;a Estructural</option>
                                <option value="292">Enfasis en Ingenier&iacute;a Ambiental</option>
                                <option value="293">Enfasis en Geotecnia Mod. de Profundizaci&oacute;n</option>
                                <option value="294">Enfasis en Tr&aacute;nsito y Transporte Mod. 
                                    de Profundizaci&oacute;n</option>
                            </select>
                        </td>
                    </tr>
                    <%}
                                    if (plan.equals("321")) {%>
                    <tr> 
                        <td> 
                            Seleccione la modalidad a la cual se inscribi&oacute;
                        </td>
                        <td> 
                           
                                <select name="idplan" class="campotext">
                                    <option value="N" selected><b>Seleccione</b></option>
                                    <option value="321">Modalidad de Profundización</option>
                                    <option value="322">Modalidad de Investigación</option>
                                </select>
                           
                        </td>
                    </tr>
                    <%}
                                    if (plan.equals("330")) {%>
                    <tr> 
                        <td> 
                            Seleccione la modalidad a la cual se inscribi&oacute;
                        </td>
                        <td> 
                            
                                <select name="idplan" class="campotext">
                                    <option value="N" selected><b>Seleccione</b></option>
                                    <option value="330">Modalidad de Profundización</option>
                                    <option value="331">Modalidad de Investigación</option>
                                </select>
                           
                        </td>
                    </tr>
                    <%}if (plan.equals("335")) {%>
                    <tr> 
                        <td> 
                           <strong> Seleccione la modalidad a la cual se inscribi&oacute;</strong>
                        </td>
                        <td> 

                            <select name="idplan" class="campotext">
                                <option value="N" selected><b>Seleccione</b></option>
                                <option value="335">Modalidad de Profundización</option>
                                <option value="336">Modalidad de Investigación</option>
                            </select>

                        </td>
                    </tr>


                    <%}
                                    if (plan.equals("376")) {%>
                    <tr> 
                        <td> 
                           <strong> Seleccione la modalidad a la cual se inscribi&oacute;</strong>
                        </td>
                        <td> 

                            <select name="idplan" class="campotext">
                                <option value="N" selected><b>Seleccione</b></option>
                                <option value="376">Modalidad de Profundización</option>
                                <option value="377">Modalidad de Investigación</option>
                            </select>

                        </td>
                    </tr>


                    <%} else {%>
                    <input name="idplan" type="hidden" id="idplan" value="<%=plan%>">
                    <%}%>
                    <tr> 
                        
        <td colspan="2"> 
          <div align="center">
            <p>&nbsp;</p>
            <p>
              <input  name=Aceptar type=submit value=Aceptar title=Aceptar>
              <input iname=Limpiar  type=reset value=Limpiar title=Limpiar>
            </p>
          </div>
        </td>
                    </tr>

                </form>

                <tr>
                    <td colspan="3" height="10">
                        <div align="center"><img src="img/rojo.jpg" width="580" height="2"></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p align="center">Avenida
                            13 No 205-59 - Kilómetro 13 Autopista Norte <br>
                            Bogotá - Colombia - Sur América <br>
                            PBX: +57(1)6683600. Fax: 57(1)6762340  <br>
                            <a href="mailto:webmaster@escuelaing.edu.co">Webmaster</a>
                    </td>
                </tr>
            </table>
        </div>
        <%} else if (plan.equals("335")) {%>
        <br>
        <br>
    <td><font face="Verdana, Arial, Helvetica, sans-serif"><center>El proceso de consulta de entrevistas para la Maestría en Ingeniería Eléctrica, se encontrará disponible después del 27 de junio de 2017, según <a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/VerificaCronograma?idplan=335"><b>cronograma.</b></a></center>
    </font>
</td>
<%} else {%>
<p>&nbsp;
<table width="95%" border="0" cellspacing="0" cellpadding="0">

    <tr>
        <td>&nbsp;</td>
    </tr>
    <!% if (plan.equals("353")) {%>
    <!-- <tr>
        <td height="43"><font face="Verdana, Arial, Helvetica, sans-serif"><center>La citación a entrevista podrá consultarse el 23 de Junio de 2011.</center> </font></td>
    </tr>
    <% //}else if(idplan.equals("370")){%>
   <tr>
<td><font face="Verdana, Arial, Helvetica, sans-serif">El proceso de consulta
de <b>entrevistas</b> para esta especializaci&oacute;n estará disponible el 18 de mayo después de las 2:00 p.m.
    <!--<a href="VerificaCronograma?idplan=<!%=idplan%>"><b>consulte aqu&iacute;</a>
    la programaci&oacute;n></font>.

  </td>
</tr-->
    <!%} else {%>
    <tr>
        <td><font face="Verdana, Arial, Helvetica, sans-serif"><center>El proceso de consulta
        de <b>entrevistas</b> para La Maestría  no se encuentra disponible en el momento.</center>
    </font>.

</td>
</tr>
<%    }
    }%>
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

</table>
<p>&nbsp;
</body>
</html>
<%}
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Entrevista Maestria", e.getMessage());
    }
%>