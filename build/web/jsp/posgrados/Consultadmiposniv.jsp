<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<% response.setHeader("Cache-Control", "no-cache");
        HttpSession sesion;
        sesion = request.getSession(true);
        String idplan = request.getParameter("idplan");
        String titulo = "Consulta Nivelatorios Posgrados";
        configeci.configPosgrados confEci = new configeci.configPosgrados();
        //  boolean admitidos = confEci.getAdmitidos(idplan);
        otros.rutas ruta = new otros.rutas();
        BDadmisiones bd = new BDadmisiones();
        PrintWriter oout = response.getWriter();
        Vector posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
       //   Vector posgrados = bd.Cronogramas(oout, "2012-1", idplan);
        int ban = 0;
        Date hoy = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date fechafin = new Date();
        String dato = new String(posgrados.elementAt(11).toString());
        idplan = new String(posgrados.elementAt(1).toString());
        String docest= request.getParameter("documento");
        String datofin = new String(posgrados.elementAt(20).toString());
        String fechaActual = formatter.format(hoy);
        Date inicio = formatter.parse(dato);
        Date finall = formatter.parse(datofin);
        String X = formatter.format(inicio);
        String Y = formatter.format(finall);
         String prog = "";
//  if (prog.equals(tipoest)) {
        if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y))) {
            ban = 1;
        }%>
<%if (idplan != null && !idplan.equals("")) {

%>
<html>
<head>
    <title>Consulta Admisiones</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="css/comun.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#FFFFFF" text="#000000">
    <jsp:include page="encabezado">
    <jsp:param name="parametro" value="2011-1" />
    <jsp:param name="titulo" value="ASPIRANTES A UN PROGRAMA DE ESPECIALIZACION - ADMITIDOS A NIVELATORIO" />
</jsp:include>
   <!--<table width="686" border="0" cellspacing="0" cellpadding="0" height="20">
 <tr>         
        <td rowspan="4" width="133" valign="top"><img src="img/Escudo.gif" width="95" height="96"></td>        
        <td height="2" width="582"> 
            <div align="center"> </div>
        </td>
    </tr>
    <tr>         
        <td height="11" width="582"> 
            <div align="center"> <font color="#C10000" size="3"><b><font size="4">ESCUELA 
            COLOMBIANA DE INGENIERIA JULIO GARAVITO</font></b></font> </div>
        </td>
    </tr>
    <tr>         
        <td width="582"> 
            <div align="center"> <font color="#C10000" size="4"><b>ADMISIONES</b></font> 
            </div>
        </td>
    </tr>
    <tr> 
        
        <td height="27" width="582"> 
            <div align="center"> <font color="#C10000" size="4"><b><font size="3">ASPIRANTES 
                            A UN PROGRAMA DE ESPECIALIZACION<br>
            NIVELATORIOS</font></b></font></div>
        </td>
    </tr>
</table>-->
<p>
<!--confEci.getPeriodo()-->
    <%Vector estudiante = bd.AdmitidosPos(docest, idplan, "2012-1", oout) ; %>

    <%  String link = "";
    if (idplan.equals("312")) {
        prog = "ESPECIALIZACION EN ESTRUCTURAS";
    }

    if (idplan.equals("374")) {
        prog = "ESPECIALIZACION EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
    }

    if (idplan.equals("267")) {
        prog = "ESPECIALIZACION EN DISEÑO CONSTRUCCION Y CONSERVACION DE VIAS";
    }

    if (idplan.equals("313")) {
        prog = "ESPECIALIZACION EN ECONOMIA PARA INGENIEROS";
    }

    if (idplan.equals("370")) {
        prog = "ESPECIALIZACIÓN EN GESTIÓN INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE";
    }

    if (idplan.equals("310")) {
        prog = "ESPECIALIZACION EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
    }

    if (idplan.equals("309")) {
        prog = "ESPECIALIZACION EN SANEAMIENTO AMBIENTAL";
    }
    if (idplan.equals("324")) {
        prog = "ESPECIALIZACION EN TELEMATICA APLICADA A NEGOCIOS";
    }
    if (idplan.equals("285")) {
        prog = "ESPECIALIZACION EN PROCESAMIENTO DE POLIMEROS";
    }
    if (idplan.equals("320")) {
        prog = "ESPECIALIZACION EN INGENIERIA DE FUNDACIONES";
    }
    if (idplan.equals("373")) {
        prog = "ESPECIALIZACION EN GERENCIA DE OPERACIONES";
    }
    if (idplan.equals("290")) {
        prog = "MAESTRIA EN INGENIERIA CIVIL";
    }%>

    <%if((estudiante.size()) == 0){%>
</p>
<table width="686" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas" align="center">
  <tr> 
        <td valign="top">
            <div align="center">
                <p>&nbsp;</p>
                <p><b>Su documento 
                            es incorrecto o usted no ha diligenciado la solicitud de admisión. Verifique 
                            e intente nuevamente o comuníquese con la Oficina de Admisiones. <br>
                            Tel&eacute;fono: 6683600 opción 2 en el menú. 
                </b> </p>
            </div>
        </td>
    </tr>
</table>

<%}else{%>



                 
<%Vector estudios = bd.Titulo((String)estudiante.elementAt(0)) ;
if((estudios.size()) > 0 ) {
for ( int m = 0 ; m < estudios.size() ; m++ ){
Vector estudiosant = (Vector)estudios.elementAt(m) ;
titulo = (String)estudiosant.elementAt(1); 
if (titulo.equals("OTRA"))
titulo = "ASPIRANTE";}
}%> 

<%}%>
<%//if (ii == 1){%>
<%if (estudiante.elementAt(3).equals("-183")){%>
<BR>

<table width="682" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="center">
  <tr> 
        <td><b><%=titulo%></b></td>
    </tr>
    <tr> 
        <td><b><%=estudiante.elementAt(1)%></b></td>
    </tr>
    <tr> 
        <td>&nbsp;</td>
    </tr>
    <tr> 
        <td valign="top" height="946">
            <!-- Especialización Gerencia-->
   
            <p>En nombre de la Escuela Colombiana de 
                    Ingenier&iacute;a Julio Garavito, nos es grato comunicarle que usted fue 
                    admitido para hacer el m&oacute;dulo Nivelatorio como requisito adicional 
                    de ingreso al Programa de <b><%=prog%></b>, e iniciar actividades 
            acad&eacute;micas a partir <b>del <%=posgrados.elementAt(20)%></b>. </p>
            <p>Una vez estudiada su solicitud de admisi&oacute;n, su hoja de vida acad&eacute;mica, 
                profesional y laboral, el Comité de la Especializaci&oacute;n 
                considera necesario que usted apruebe los cursos nivelatorios informados por el
            consejero el día de la entrevista. <!--m&oacute;dulo nivelatorio.--></p>
            <p>Para legalizar la matrícula de dichos cursos, en la modalidad de Educación Continuada, se tiene
            el siguiente proceso:</p>
            <!--Especialización Gerencia-->
            <ul>
                <%if (estudiante.elementAt(2).equals("374")) {%>
                <li><b>Entrega de ordenes de pago para el m&oacute;dulo nivelatorio</b>: 
                    Esta se har&aacute; del <%=posgrados.elementAt(12)%> en la Oficina de Apoyo Financiero
                Bloque A, primer piso, de 8:00 a.m.a 12:45 y de 2:00 p.m a 4:45 p.m.</li>
                <%}%>
                <!--Especialización Economia-->
                <%if (estudiante.elementAt(2).equals("313")) {%>
                <li><b>Entrega de órdenes de pago para el m&oacute;dulo nivelatorio</b>: 
                    Esta se har&aacute; el <b><%=posgrados.elementAt(12)%></b> en la Oficina de Apoyo
                    Financiero Bloque A, primer piso, de 8:00a.m.a 12:45 y de 2:00 p.m a 
                4:45 p.m</li>
                <%}%>
                <!--Especialización Telematica-->
                <%if (estudiante.elementAt(2).equals("324")) {%>
                
                <li><b>Entrega de ordenes de pago para el m&oacute;dulo nivelatorio</b>: 
                    Esta se har&aacute; del <%=posgrados.elementAt(12)%> en la Oficina de Apoyo Financiero
                Bloque A, primer piso, de 8a.m.a 12:45 y de 2:00 p.m a 4:45 p.m</li>
                <%}%>
                <li><b>Pagos</b>: <!--El valor del módulo nivelatorio es el correspondiente
                    a 
                 <b>tres cr&eacute;ditos</b>,
                    <b><!%=posgrados.elementAt(23)%>,</b> y--> Deberá realizarse del <b><%=posgrados.elementAt(14)%></b>, ya sea
                    en el Banco de Occidente, BANCO ITAÚ. o en la Caja de la Escuela con la orden de
                pago que le será entregada.</li>
                <li>Si se realiza el pago en la Caja de La Escuela Colombiana de Ingeniería, lo podrá hacer únicamente 
                    con Tarjeta Débito o Tarjeta Crédito y pago Mixto: Tarjeta Débito y/o Crédito más efectivo, en el horario de 9:00 a.m. a 12:00M y 1 p.m. a 5 p.m. de lunes a viernes bloque A piso 1.
                </li>
                <li>Si realiza el pago en el Banco de Occidente o BANCO ITAÚ , lo puede hacer en efectivo o cheque girado a nombre de la ESCUELA COLOMBIANA DE INGENIERIA, en cualquier sucursal del país, únicamente presentando la orden e matrícula.
                </li>
            </ul>
            <p>Es importante recordar que para obtener el cupo en la Especializaci&oacute;n 
                y matricular el primer per&iacute;odo acad&eacute;mico es necesario cancelar, 
            asistir y aprobar el m&oacute;dulo nivelatorio.</p>
            <!--    <p><b>Financiaci&oacute;n:</b></p>
            <ul>
                <li>Si usted necesita solicitar financiaci&oacute;n, deber&aacute; tramitarla 
                    con una semana de anticipaci&oacute;n a la fecha l&iacute;mite de pago 
                    para lo cual deber&aacute; acercarse a la <a href="http://www.escuelaing.edu.co/admisiones/apoyo.htm">Oficina 
                    de apoyo financiero a estudiantes</a>. Para mayores informes comun&iacute;quese 
                    con el Ing. C&eacute;sar Ruiz al 6683600 ext. 119, Coordinador de apoyo 
                financiero a estudiantes</li>
            </ul>-->
            <p><b>Formalizaci&oacute;n de Matr&iacute;cula del M&oacute;dulo Nivelatorio</b></p>
            <blockquote> 
                <p>El estudiante que requiere cursar el m&oacute;dulo Nivelatorio como 
                    requisito adicional de ingreso a la Especializaci&oacute;n debe matricularse 
                como estudiante Especial.</p>
                <p>Para tal fin debe presentarse del <b><%=posgrados.elementAt(17)%>,</b> con el correspondiente
                    recibo sellado por la entidad donde hizo el pago. Alli firmar&aacute; 
                    el acta de matr&iacute;cula del curso nivelatorio, se le entregar&aacute; 
                    el Reglamento Estudiantil de posgrados y la escarapela que le permitir&aacute; 
                hacer uso de los servicios acad&eacute;micos de la Escuela.</p>
                <!--Solo para telemática -->
                <!-- <p>Adicionalmente deber&aacute; asistir a la jornada de inducci&oacute;n 
                la cual es de <b>car&aacute;cter obligatorio el <!%=induccion%>, fecha en la cual se iniciarán las clases para el semestre 2008-1</b>.-->
                <%if (estudiante.elementAt(2).equals("324")) {%>
                <p> <b>El m&oacute;dulo nivelatorio inicia el  <%=posgrados.elementAt(18)%><!--28 de Octubre de 2005 a
          las 2:00 p.m. Para consultar su contenido haga <a href="http://www.escuelaing.edu.co/programas/especializacion/telematica/contenido.htm" target="_blank"> 
          click aquí</a>. La programación de los cursos se publicará el 25 de 
          octubre de 2005 y se podrá <a href="http://www.telematica.is.escuelaing.edu.co/especial/index.htm" target="_blank">consultar 
                aquí</a>.--></b>
                <p>El <b><%=posgrados.elementAt(10)%></b> deber&aacute; consultar en el enlace "ADMITIDOS" de la Especialización el resultado acad&eacute;mico del m&oacute;dulo nivelatorio y las instrucciones
                para realizar el proceso de matr&iacute;cula de la Especializaci&oacute;n.
                
                <%} else {%>
                <p><b>El m&oacute;dulo nivelatorio inicia el <%=posgrados.elementAt(18)%></b></p>
                <p>Adicionalmente deber&aacute; asistir a la jornada de inducci&oacute;n 
                la cual es de car&aacute;cter obligatorio el <b><%=posgrados.elementAt(16)%> </b>.
                <p>El <b><%=posgrados.elementAt(10)%></b> deber&aacute; consultar en el enlace "ADMITIDOS" de la Especialización
                el resultado acad&eacute;mico del m&oacute;dulo nivelatorio y las instrucciones 
                para realizar el proceso de matr&iacute;cula de la Especializaci&oacute;n.
                
                <%}%>
            </blockquote>
            <blockquote>
                <p>Cordialmente,</p>
                <p>Direcci&oacute;n Especializaci&oacute;n</p>
            </blockquote>
           
            <blockquote> 
                <p>Para mayor informaci&oacute;n:</p>
                <!-- Gerencia -->
                <%if (estudiante.elementAt(2).equals("374")) {%>
                <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                    Tel. 6683600 Ext. 337 y 103.<br>
                <a href="mailto: espeproy@escuelaing.edu.co"> espeproy@escuelaing.edu.co</a></p>
                <%}%>
                <!-- Economía -->
                <%if (estudiante.elementAt(2).equals("313")) {%>
                <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                    Tel. 6683600 - 6763888, Ext. 218, 274 y 292<br>
                    <a href="mailto:esarmien@escuelaing.edu.co">esarmien@escuelaing.edu.co</a> 
                </p>
                <%}%>
                <!-- Telemática -->
                <%if (estudiante.elementAt(2).equals("324")) {%>
                <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                    Tel. 6683600 ext. 377 <br>
                    <a href="mailto:telematica@escuelaing.edu.co">telematica@escuelaing.edu.co</a> 
                </p>
                <%}%>					
            </blockquote>	  
            
            
            <%//}else {%>
            <!--<b>Programa académico: <%//=programa%></b> -->
            <!--<p><b>No existe información registrada para este evento. Esta especialización no tiene programado nivelatorio.</b>-->
            <%//}%>       
        </td>
    </tr>
</table>

<%//ban = 1;   %> 
<%} else  if (estudiante.elementAt(3).equals("-185")){%>
<br>    

<table width="70%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="right">
  <tr>       
        <td><b>Nombre: <%=estudiante.elementAt(1)%></b> <br>
            <b>Programa academico: <%=prog%></b>
            <p>Su solicitud de admisión esta en estudio.Para mayor información 
            por favor comuníquese con la Dirección de la Especialización.
            
            <!-- Gerencia -->
            <%if (estudiante.elementAt(2).equals("374")) {%>
            <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                Tel. 6683600 Ext. 337 y 103.<br>
            <a href="mailto: espeproy@escuelaing.edu.co"> espeproy@escuelaing.edu.co</a></p>
            <%}%>
            <!-- Economía -->
            <%if (estudiante.elementAt(2).equals("313")) {%>
            <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                Tel. 6683600 - 6763888, Ext. 218, 274 y 292<br>
                <a href="mailto:esarmien@escuelaing.edu.co">esarmien@escuelaing.edu.co</a> 
            </p>
            <%}%>
            <!-- Telemática -->
            <%if (estudiante.elementAt(2).equals("324")) {%>
            <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
                Tel. 6683600 ext. 377 <br>
                <a href="mailto:telematica@escuelaing.edu.co">telematica@escuelaing.edu.co</a> 
            </p>
            <%}%>
            
        </td>
    </tr>
</table>
<%} else  if (estudiante.elementAt(3).equals("-181")){%>
<br>    

<table width="70%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="center">
  <tr>       
<td><b>Nombre: <%=estudiante.elementAt(1)%></b> <br>
    <b>Programa academico: <%=prog%></b>
    <p>Una vez estudiada su hoja de vida acad&eacute;mica, profesional y laboral, 
    as&iacute; como otros aspectos del proceso de selecci&oacute;n, lamentamos 
    informarle que la Direcci&oacute;n de la Especializaci&oacute;n conceptu&oacute; 
    no aprobar su solicitud de admisi&oacute;n para iniciar actividades acad&eacute;micas 
    el próximo <%if (estudiante.elementAt(2).equals("374")) {%>24 de octubre. <%}else {%>28 de octubre. <%}%> No obstante lo anterior le agradecemos que haya escogido
    la Escuela como una opci&oacute;n 
        para adelantar sus estudios de posgrado y esperamos que haya una pr&oacute;xima 
        oportunidad para contar con usted como un miembro de nuestra comunidad 
    acad&eacute;mica.
    <p>Cordialmente,</p>
    <p>Direcci&oacute;n de la  <%=prog%></p>

    <p>Para mayor informaci&oacute;n:</p>
    
    <!-- Gerencia -->
    <%if (estudiante.elementAt(2).equals("374")) {%>
    <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
        Tel. 6683600 Ext. 337 y 103.<br>
    <a href="mailto: espeproy@escuelaing.edu.co"> espeproy@escuelaing.edu.co</a></p>
    <%}%>
    <!-- Economía -->
    <%if (estudiante.elementAt(2).equals("313")) {%>
    <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
        Tel. 6683600 - 6763888, Ext. 218, 274 y 292<br>
        <a href="mailto:esarmien@escuelaing.edu.co">esarmien@escuelaing.edu.co</a> 
    </p>
    <%}%>
    <!-- Telemática -->
    <%if (estudiante.elementAt(2).equals("324")) {%>
    <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
        Tel. 6683600 ext. 377 <br>
        <a href="mailto:telematica@escuelaing.edu.co">telematica@escuelaing.edu.co</a> 
    </p>
    <%}%>
    
</td>
</tr>	  
</table>
<%} else if (estudiante.elementAt(3).equals("-179")){%>			  
<br>

<table width="781" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="center">
  <tr> 				
        <td>
           		<b>Nombre: <%=estudiante.elementAt(1)%></b> <br>
            <b>Programa academico: <%=prog%></b>
            
            <p>El Comité 
                    de la Especialización conceptu&oacute; que no es necesario que usted haga 
                    curso nivelatorio y por lo tanto deberá consultar el 
                    <!--próximo-->
                    <b> <%=posgrados.elementAt(10)%></b>, en la sección de Admitidos, el procedimiento a seguir
            para el tr&aacute;mite de su matr&iacute;cula.</p>
            
            <p>Cordialmente,</p>
            <p>Direcci&oacute;n de la  <%=prog%></p>
        </td>
    </tr>
</table> 


<%} else {%>
<br>

<table width="781" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="center">
  <tr> 
        
        <td><b>Nombre: <%=estudiante.elementAt(1)%></b> <br>
            <b>Programa academico: <%=prog%></b>
            <p><b>No existe información registrada para este evento. Favor 
                    comuníquese con la Oficina de Admisiones. <br>Tel&eacute;fono: 6683600 opción 2 en el menú.</b>
        </td>
    </tr>
</table>
<%}%>
</body>
</html>
<%
} else {
%>
<jsp:forward page="NivelatoriosPosgrado"/>
<% 	
}

%>
