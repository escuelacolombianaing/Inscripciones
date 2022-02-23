<%-- 
    Document   : consultaadmima1
    Created on : 8/07/2010, 02:00:27 PM
    Author     : lrodriguez
--%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%

    String docEst = request.getParameter("documento");
    String idplan = request.getParameter("idplan");
    Vector cronograma = new Vector();
    PrintWriter oout = response.getWriter();
    configeci.configmaestria confEci = new configeci.configmaestria();
    String respadm = "", induccion = "", fecinicio = "", valorniv = "", ordenesp = "", firmaesp = "";
    String programa = "", titulo = "", fecordenes = "", fecpagos = "", fecniv = "", firmaniv = "", valortotal = "", creditos = "", valcredito = "";
    otros.rutas ruta = new otros.rutas();
    BDadmisiones bd = new BDadmisiones();
    String titulos = "Aspirantes a la Maestría";
    int val = 0;
    int ban = 0;

    if (docEst != null && !docEst.equals("")) {
%>

<html>
    <head>
        <title>Consulta Admisiones</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function ventanaSecundaria (URL){
            window.open(URL,"","width=800,height=430,scrollbars=no,top=100,left=100")
            }

            function enviarword(){
            document.formulario.target = "";
            document.formulario.action = "ImpresionCarta?formato=word";
            return true;

            }

            //-->


        </script>
    </head>

    <body bgcolor="#FFFFFF" text="#000000">
        <%if (idplan.equals("353")) {
                programa = "MAESTRIA EN GESTIÓN DE INFORMACIÓN";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA EN GESTIÓN DE INFORMACIÓN" />
        </jsp:include>
        <%} else if (idplan.equals("321")) {
            programa = "MAESTRÍA EN INGENIERÍA ELECTRÓNICA";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA EN INGENIERÍA ELECTRÓNICA-MODALIDAD DE PROFUNDIZACIÓN" />
        </jsp:include>
        <%} else if (idplan.equals("332")|| idplan.equals("333")) {
            programa = "MAESTRÍA EN INGENIERÍA ELECTRÓNICA";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA EN INGENIERÍA ELECTRÓNICA-MODALIDAD DE INVESTIGACIÓN" />
        </jsp:include>
        <%} else if (idplan.equals("351")) {
            programa = "MAESTRÍA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA  EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS" />
        </jsp:include>
        <%} else if (idplan.equals("330") || idplan.equals("331")) {
            programa = "MAESTRÍA EN INGENIERÍA INDUSTRIAL";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA  EN INGENIERIA INDUSTRIAL" />
        </jsp:include>
        <% } else if (idplan.equals("335") || idplan.equals("336")) {
            programa = "MAESTRÍA EN INGENIERÍA ELÉCTRICA";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA  EN INGENIERIA ELÉCTRICA" />
        </jsp:include>
        <% } else if (idplan.equals("371")) {
            programa = "MAESTRÍA EN INFORMÁTICA";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA  EN INGENIERIA ELÉCTRICA" />
        </jsp:include>
        <% } else if (idplan.equals("372")) {
            programa = "MAESTRÍA EN CIENCIAS ACTUARIALES";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA  EN INGENIERIA ELÉCTRICA" />
        </jsp:include>
        <% }else if (idplan.equals("376") || idplan.equals("377")) {
            programa = "MAESTRÍA EN CIENCIA DE DATOS";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA  EN CIENCIA DE DATOS" />
        </jsp:include>
        <% }else {
            programa = "MAESTRÍA EN INGENIERÍA CIVIL";%>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTRÍA EN INGENIERÍA CIVIL" />
        </jsp:include>
        <%}%>

        <%Vector estud = bd.AdmitidosPos(docEst, idplan, confEci.getPeriodo(), oout);%>

        <%if (idplan.equals("331")) {
                cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), "330");
            } else if (idplan.equals("332") || idplan.equals("333") ) {
                cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), "332");
            } else {
                cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
            }%>

        <%if ((estud.size()) == 0) {%>
        <div align="center">
        <table align="center" width="60%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas">
            <tr>
                <td valign="top">
                    <div align="center">

                        <p>&nbsp;</p>

                        <p>Su documento es incorrecto o usted no formaliz&oacute; la solicitud
                            de admisión para este programa académico. <br>
                            Verifique e intente nuevamente o comuníquese con la Oficina de Admisiones.
                            <br>
                            Tel&eacute;fono: opción 2 en el menú. </p>
                        </h3> </div>
                </td>
            </tr>
        </table>
        </div>
        <%} else {

            Vector tutor = bd.Tutores(docEst, oout);
            Vector estudios = bd.Titulo((String) estud.elementAt(0));
            if ((estudios.size()) > 0) {
                for (int m = 0; m < estudios.size(); m++) {
                    Vector estudiosant = (Vector) estudios.elementAt(m);
                    titulo = (String) estudiosant.elementAt(1);
                    if (titulo.equals("OTRA")) {
                        titulo = "ASPIRANTE";
                    }
                }
            }
        %>

        <% if (estud.elementAt(3).equals("-179") && (tutor.size() == 0)) {

                out.println("<p><center>No tiene consejero asignado, comuníquese con la Dirección de la Maestría.</center></p>");
            } else if (estud.size() == 0) {%>
            <div align="center">
        <table width="60%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas">
            <tr>
                <td valign="top">
                   
                        <h3>
                                <p>&nbsp;</p>
                                <p>Su documento es incorrecto o usted no formaliz&oacute; la solicitud
                                    de admisión para este programa académico. <br>
                                    Verifique e intente nuevamente o comuníquese con la Oficina de Admisiones.
                                    <br>
                                    Tel&eacute;fono: 6683600 opción 2 en el menú. </p>
                            </h3> 
                </td>
            </tr>
        </table>
            </div>
        <%} else {%>

        <!--Para La respta de ADMITIDOS de QHSE cdo hay dos cohores a la vez se crea cronogramaqhse.txt
        y se valida aqui la cohorte por eje esta es la cohorte 12(2008-1) y el cronograma.txt va la cohorte 11-->


        <%if (estud.elementAt(3).equals("-179") || estud.elementAt(3).equals("-91") || estud.elementAt(3).equals("-102") && ban == 0) {%>
        <BR>
<form name="formulario" method="post" action="">
  <input type="hidden" name="idplan" value="<%=idplan%>">
  <input type="hidden" name="docEst" value="<%=docEst%>">
   <div align="center">
  <table width="60%" border="0" cellspacing="0" cellpadding="0" class="textoimpre" >
    <tr> 
      <td><b><%=titulo%></b></td>
    </tr>
    <tr> 
      <td><b><%=estud.elementAt(1)%></b></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td> 
        <p align="justify">En nombre de la Escuela Colombiana de Ingenier&iacute;a 
          Julio Garavito, nos es grato comunicarle que ha sido aprobada su solicitud 
          de admisi&oacute;n para el programa de <b><%=programa%></b>, el cual 
          iniciará actividades acad&eacute;micas el próximo<b> <%=cronograma.elementAt(20)%></b>. 
          <!--Usted
                            har&aacute; parte de la comunidad acad&eacute;mica de una de las Instituciones
                            de Educaci&oacute;n Superior con mayor prestigio Nacional e Internacional,
                            que le da a usted una cordial bienvenida. -->
        </p>
        <p>Para dar inicio a su proceso de matr&iacute;cula deber&aacute; tener 
          en cuenta lo siguiente:</p>
        <br> 
          <!--Maestría-->
          <%if (estud.elementAt(2).equals("290") || estud.elementAt(2).equals("291") || estud.elementAt(2).equals("292") || estud.elementAt(2).equals("293") || estud.elementAt(2).equals("294")) {%>
        </p>
        <p><b>1.</b> 
          <!--Cordialmente lo invitamos a una reuni&oacute;n informativa sobre
                              aspectos generales de la maestr&iacute;a en Ingenier&iacute;a Civil, resolver inquietudes sobre los procesos
                              administrativos y opciones de Financiaci&oacute;n Educativa el 25 de Julio en el sal&oacute;n D111
                            a las 8:00 a.m.-->
          Su consejero Académico será el (la) <b>Ing.<%=tutor.elementAt(1)%></b>, 
          correo electrónico:<%=tutor.elementAt(3)%>. Usted deberá contactarlo 
          (la) para concertar una reunión, la cual tendrá por objeto la definición 
          de la propuesta de asignaturas con la que iniciará el desarrollo de 
          su plan de estudios durante el periodo <%=cronograma.elementAt(2)%>. 
          <b>Dicha reunión se deberá programar durante los días <%=cronograma.elementAt(27)%></b>, 
          para efectos de liquidación de la orden de matrícula correspondiente 
          al periodo <%=cronograma.elementAt(2)%>. 
          <!--El director del énfasis enviará por correo electrónico
                            sugerencias para su registro académico basados en los intereses que usted manifestó en la entrevista y su
                            disponibilidad horaria.-->
          <b><%=cronograma.elementAt(13)%></b> podrá imprimir su orden de matrícula 
          siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/uploads/descargables/6704_manual_matriculas_posgrados_2017_1.pdf"> 
          manual de pagos en línea</a> y pagar los derechos correspondientes. 
        <p> Para quienes hayan obtenido un título de posgrado de la Escuela Colombiana 
          de Ingeniería y deseen solicitar homologación de asignaturas, deberán 
          entregar por escrito dicha solicitud dirigida al Director de la Maestría, 
          a más tardar el <b><%=cronograma.elementAt(26)%></b> indicando la lista 
          de asignaturas cuya homologación se solicita. 
        <p> 
        <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
          al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa 
          entrega de la orden de pago. Del <b><%=cronograma.elementAt(15)%></b> 
          <!-- El valor total de la Maestría
                    es de <b><!%=valortotal%></b> correspondiente a <b><!%=creditos%></b> cr&eacute;ditos. -->
        </li>
        <blockquote> 
          <p>El pago extraordinario tiene un recargo del 5%.</p>
          <p><b>Valor del cr&eacute;dito: $<%=cronograma.elementAt(22)%>.oo</b></p>
        </blockquote>
        <p><b>2. Financiaci&oacute;n: </b>Ofrecemos diversas alternativas de financiaci&oacute;n 
          en corto y largo plazo, para cubrir hasta el 100% del valor de la matr&iacute;cula, 
          para mayor informaci&oacute;n cumun&iacute;quese con la Oficina de Apoyo 
          Financiero al 6683600 ext.107 &oacute; 356.</p>
        <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
        <p align="justify">Una vez haya realizado el pago, deber&aacute; Formalizar 
          su matr&iacute;cula, as&iacute;:</p>
        <blockquote> 
          <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
            </b> </p>
          <ul>
            <li> 
              <p align="justify">La matr&iacute;cula es el acto voluntario de 
                una persona natural mediante el cual se adquiere la calidad de 
                estudiante de la Escuela Colombiana de Ingenier&iacute;a, previo 
                el cumplimiento de todos los requisitos se&ntilde;alados para 
                la misma. Mediante este acto, el estudiante se compromete a cumplir 
                el reglamento y las dem&aacute;s normas establecidas por la Instituci&oacute;n 
                y por el Estado y adquiere el derecho a cursar el programa de 
                formaci&oacute;n previsto.</P>
            </li>
            <li> 
              <p align="justify">La matr&iacute;cula formaliza el acceso a los 
                derechos del estudiante y a los deberes que de ellos se desprenden. 
                Especialmente significa que el estudiante comparte los postulados 
                contenidos en la Declaraci&oacute;n de Principios de la Escuela.</P>
            </li>
            <li> 
              <p align="justify">La matr&iacute;cula la legaliza el estudiante 
                con su firma, para lo cual deber&aacute; presentarse del <b><%=cronograma.elementAt(19)%></b> 
                con el comprobante de pago de los derechos de matr&iacute;cula. 
                Una vez haya firmado, ser&aacute; carnetizado como estudiante 
                de la Maestría. 
            </li>
            <li>Inicio de clases de la Maestría: <b><%=cronograma.elementAt(20)%></b>.</li>
            <li>Inducción: <b><%=cronograma.elementAt(16)%></b>.</li>
          </ul>
          <p></p>
        </blockquote>
        <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
          y a la <b>MAESTRIA EN INGENIERIA CIVIL.</b></p>
        <p>Cordialmente,</p>
        <p>Direcci&oacute;n Maestría </p>
        <p>Para mayor informaci&oacute;n:</p>
        <p>Dr. Germán Santos Granados <br>
          Director <a href="mailto: maestriacivil@escuelaing.edu.co">maestriacivil@escuelaing.edu.co</a> 
          <br>
          <a href="mailto: german.santos@escuelaing.edu.co">german.santos@escuelaing.edu.co</a> 
          Teléfono. 668 3600, exts. 164 y 147</p>
        <p align="right"> <br>
        </p>
  </table>

  <%} else if (estud.elementAt(2).equals("353") || estud.elementAt(2).equals("321") || estud.elementAt(2).equals("322") || estud.elementAt(2).equals("330") || estud.elementAt(2).equals("331")|| estud.elementAt(2).equals("332") || estud.elementAt(2).equals("333")|| estud.elementAt(2).equals("335")|| estud.elementAt(2).equals("336")|| estud.elementAt(2).equals("371")|| estud.elementAt(2).equals("372")|| estud.elementAt(2).equals("376")|| estud.elementAt(2).equals("377")) {%>
  <ol>
    <li> <b>Orden de matrícula:</b> </li>
    <p><br>
      Su consejero académico será el (la) <b>Ing.<%=tutor.elementAt(1)%></b>, 
      correo electrónico:<%=tutor.elementAt(3)%>. Usted deberá contactarlo (la) 
      para concertar una reunión, la cual tendrá por objeto la definición de la 
      propuesta de asignaturas con la que iniciará el desarrollo de su plan de 
      estudios durante el periodo <%=cronograma.elementAt(2)%>. Dicha reunión 
      se deberá programar durante los días <%=cronograma.elementAt(27)%>, para 
      efectos de liquidación de la orden de matrícula correspondiente al periodo 
      <%=cronograma.elementAt(2)%>. 
      <!--El director del énfasis enviará por correo electrónico
                            sugerencias para su registro académico basados en los intereses que usted manifestó en la entrevista y su
                            disponibilidad horaria.-->
    </p>
    <p>El <b><%=cronograma.elementAt(13)%></b> podrá imprimir su orden de matrícula 
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/uploads/descargables/6704_manual_matriculas_posgrados_2017_1.pdf"> 
      manual de pagos en línea</a> y pagar los derechos correspondientes. </p>
    <p> Para quienes hayan obtenido un título de posgrado de la Escuela Colombiana 
      de Ingeniería y deseen solicitar homologación de asignaturas, deberán entregar 
      por escrito dicha solicitud dirigida al Coordinador de la Maestría, 
      <!--a más tardar
                el  <b><!%=cronograma.elementAt(26)%></b>-->
      indicando la lista de asignaturas cuya homologación se solicita. </p>
    <p>Pagos: El valor de cada per&iacute;odo es directamente proporcional al 
      n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, en las fechas 
      establecidas y con la orden de pago emitida por la Escuela. El pago extraordinario 
      tiene un recargo del 5%. </p>
    <p>Valor del cr&eacute;dito: $<%=cronograma.elementAt(22)%>.oo </p>
    <p>&nbsp;</p>
    <li><b> Financiaci&oacute;n:</b> </li>
    <p>&nbsp;</p>
    <p>La Escuela le ofrece diversas alternativas de financiaci&oacute;n a corto 
      y largo plazo, para cubrir hasta el 100% del valor de la matr&iacute;cula. 
      Para mayor informaci&oacute;n, favor comunicarse con la Oficina de Apoyo 
      Financiero al tel&eacute;fono 6683600 extensiones 107 ó 356.</p>
    <p>&nbsp;</p>
    <li><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n:</b><b><br><br>
      </b> </li>
    <p>La matr&iacute;cula es el acto voluntario de una persona natural mediante 
      el cual se adquiere la calidad de estudiante de la Escuela Colombiana de 
      Ingenier&iacute;a, previo el cumplimiento de todos los requisitos se&ntilde;alados 
      para la misma. Mediante este acto, el estudiante se compromete a cumplir 
      el reglamento y las dem&aacute;s normas establecidas por la Instituci&oacute;n 
      y por el Estado y adquiere el derecho a cursar el programa de formaci&oacute;n 
      previsto.</p>
    <p>La matr&iacute;cula formaliza el acceso a los derechos del estudiante y 
      a los deberes que de ellos se desprenden. Especialmente significa que el 
      estudiante comparte los postulados contenidos en la Declaraci&oacute;n de 
      Principios de la Escuela.</p>
    <p>La matr&iacute;cula la legaliza el estudiante con su firma, para lo cual 
      deber&aacute; presentarse <%=cronograma.elementAt(19)%> con el comprobante 
      de pago de los derechos de matr&iacute;cula. Una vez haya firmado, ser&aacute; 
      carnetizado como estudiante de la Maestría. </p>
    <p>&nbsp;</p>
    <li> <b>Fechas importantes a tener en cuenta:</b></li> <br><br>
      <p>Curso de inducción al programa (asistencia obligatoria): <b><%=cronograma.elementAt(16)%></b>.</p>
      <p>Inicio de clases de la Maestría: <b><%=cronograma.elementAt(20)%></b>.</p>
      </ol>
      <br><br>
  <p>&nbsp;</p>
  <p></p>
  <%} else if (estud.elementAt(2).equals("351")) {%>
  <p><b>1.</b> 
    <!--Cordialmente lo invitamos a una reuni&oacute;n informativa sobre
                                  aspectos generales de la maestr&iacute;a en Ingenier&iacute;a Civil, resolver inquietudes sobre los procesos
                                  administrativos y opciones de Financiaci&oacute;n Educativa el 25 de Julio en el sal&oacute;n D111
                            a las 8:00 a.m.-->
    Su consejero Académico será el (la) <b>Ing.<%=tutor.elementAt(1)%></b>, correo 
    electrónico:<%=tutor.elementAt(3)%>. 
  <p> <b>2. </b> Las asignaturas que usted cursará en el periodo <%=cronograma.elementAt(2)%> son: 
  <ul>
    <li>Fundamentos (1 créditos) 
    <li>Gerencia de Proyectos básica (2 créditos) 
    <li>Estrategia, portafolios, programas y proyectos (2 créditos) 
    <li>Formulación de proyectos (2 créditos)
      <p> Cualquier inquietud con respecto a la inscripción de asignaturas, debe 
        ser tratada con su consejero.</p>
  </ul>
  <b> 
  <!%=cronograma.elementAt(27)%>
  </b> 
  <p> <b>3. </b>Podrá pagar los derechos de matrícula o imprimir su orden de pago 
      siguiendo los pasos mencionados en este enlace <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst">pagos en línea</a>, y según el 
    cronograma vigente presentado al final de esta comunicación. 
  <p> <b>4.</b>Quienes deseen solicitar homologación de asignaturas cursadas en 
    un programa de posgrado de la Escuela o de otra institución, deberán solicitarlo 
    por escrito mediante comunicación dirigido al Director de la Maestría, a más 
    tardar el 10 de agosto de 2018, indicando la lista de asignaturas cuya homologación 
    se solicita, según formato suministrado por la dirección del programa. 
  <p><b>5.</b><b>Pagos:</b> el valor de la matricula cada período es directamente 
    proporcional al número de créditos a cursar y se debe pagar a su inicio, en 
    las fechas presentadas al final de esta comunicación y en la página de internet 
    y con la orden de pago emitida por la Escuela. El pago extraordinario tiene 
    un recargo del 5%. Tenga en cuenta que el valor del crédito académico para 
    el año <%=cronograma.elementAt(2)%> es de $<%=cronograma.elementAt(22)%>.oo</b> 
  <p><b>6.Financiación: </b>Diferentes entidades ofrecen alternativas de financiación 
    a corto y largo plazo, para cubrir hasta el 100 % del valor de la matrícula. 
    Para mayor información comuníquese con la Oficina de Apoyo Financiero al 6683600 
    ext.107 ó 356. 
  <p><b>7.</b><b>Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n:</b> 
  <ul>
    <li> 
      <p align="justify">La matrícula es el acto voluntario de una persona natural 
        mediante el cual se adquiere la calidad de estudiante de la Escuela Colombiana 
        de Ingeniería, previo el cumplimiento de todos los requisitos señalados 
        para la misma. Mediante este acto, el estudiante se compromete a cumplir 
        el reglamento y las demás normas establecidas por la Institución y por 
        el Estado y adquiere el derecho a cursar el programa de formación previsto. 
    </li>
    <li> 
      <p align="justify">Según el Reglamento Estudiantil de Posgrados, la matrícula 
        formaliza el acceso a los derechos del estudiante y a los deberes que 
        de ellos se desprenden. Especialmente significa que el estudiante comparte 
        los postulados contenidos en la Declaración de Principios de la Escuela.<br>
      </P>
    </li>
    <li> 
      <p align="justify">La matrícula la legaliza el estudiante con su firma, 
        para lo cual deberá presentarse a más tardar el 8 de agosto de 2018 en la ventanilla 
        8, bloque A, primer piso; con el comprobante de pago de los derechos de 
        matrícula. Una vez haya firmado, será carnetizado como estudiante de la 
        Maestría.</P>
    </li>
  </ul>
  <p><b>8.</b><b> Fechas importantes a tener en cuenta:</b></p>
  <p><br>
    <b>Emisi&oacute;n de &oacute;rdenes de pago:</b> 16 de julio de 2018<br>
    <b> Matr&iacute;cula Ordinaria:</b> Del 16 de julio al 2 de agosto de 2018<br>
    <b> Matr&iacute;cula Extraordinaria: </b>del 3 al 7 de agosto de 2018<br>
    <b>Curso de Inducci&oacute;n al programa (asistencia obligatoria):</b> <%=cronograma.elementAt(16)%>.<br>
    <b>Inicio de clases de la Maestr&iacute;a:</b> <%=cronograma.elementAt(20)%><br>
  </p></blockquote>
  <%}%>
  <% if (estud.elementAt(2).equals("353")) {%>
  <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
    y a la <b>MAESTRIA EN GESTIÓN DE INFORMACIÓN.</b></p>
  <p>Cordialmente,</p>
  <p>Direcci&oacute;n Maestría </p>
  <p>Para mayor informaci&oacute;n:</p>
  <p>Ing. Victoria Eugenia Ospina Becerra <br>
    Directora <br>
    <a href="mailto: victoria.ospina@escuelaing.edu.co">victoria.ospina@escuelaing.edu.co</a> 
    <a href="mailto:maestria.gestioninf@escuelaing.edu.co">maestria.gestioninf@escuelaing.edu.co</a><br>
    <%}
  else if (estud.elementAt(2).equals("321") || estud.elementAt(2).equals("322")) {%>
  <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
    y a la <b>MAESTRIA EN INGENIERÍA ELECTRÓNICA.</b></p>
  <p>Cordialmente,</p>
  <p>Direcci&oacute;n Maestría </p>
  <br>
  <p> Ing. Alexander Pérez Ruiz<br>
    Director <a href="mailto: maestriaelectronica@escuelaing.edu.co">maestria.electronica@escuelaing.edu.co</a> 
    <br>
    <a href="mailto: alexander.perez@escuelaing.edu.co">alexander.perez@escuelaing.edu.co</a> 
    Teléfono. 668 3600, exts. 164 y 147<br>
  </p>
  <%}else if (estud.elementAt(2).equals("335") || estud.elementAt(2).equals("336")) {%>
  <p> 
  <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
    y a la <b>MAESTRÍA EN INGENIERÍA ELÉCTRICA.</b></p>
  <br>
  <p>Cordialmente,</p>
  <p>MAESTRÍA EN INGENIERÍA ELÉCTRICA</p>
  <br>
  <p> Ing. Paula Ximena Ríos Reyes<br>
    Coordinadora <br>
    <a href="mailto: maestria.electrica@escuelaing.edu.co">maestria.electrica@escuelaing.edu.co</a> 
    <br>
    <a href="mailto: paula.rios@escuelaing.edu.co">paula.rios@escuelaing.edu.co</a><br>
    Teléfono. 668 3600, extensiones 588 - 143 - 369<br>
  </p>
  <%}else if (estud.elementAt(2).equals("351")) {%>
  <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
    y a la <b>MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS.</b></p>
  <p>Cordialmente,</p>
  <p>Direcci&oacute;n Maestría </p>
  <br>
  <p> Ing. Ricardo Arturo Benavides Bolaños<br>
    Director <a href="mailto: ricardo.benavides@escuelaing.edu.co">ricardo.benavides@escuelaing.edu.co</a> 
    <br>
    Teléfono. 668 3600, ext. 337<br>
  </p>
  <%}else if (estud.elementAt(2).equals("330")||estud.elementAt(2).equals("331")) {%>
  <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
    y a la <b>MAESTRIA EN INGENIERIA INDUSTRIAL.</b></p>
  <p>Cordialmente,</p>
  <p>Direcci&oacute;n Maestría </p>
  <br>
  <br>
  Ing. Sonia Jaimes <br>
  <a href="mailto:sonia.jaimes@escuelaing.edu.co">sonia.jaimes@escuelaing.edu.co</a> 
  <br>
  <a href="mailto:maestria.industrial@escuelaing.edu.co">maestria.industrial@escuelaing.edu.co</a> 
  <br>
  Teléfono. 668 3600, exts. 278 - 279 <br></p>
  <%}%></table>
   </div>
  <%
                    }
                    if (estud.elementAt(3).equals("-181")) {%>
  <br>
  <div align="center">
  <table width="60%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="center">
    <tr> 
      <td><b>Nombre: <%=estud.elementAt(1)%></b> <br>
        <p>Una vez estudiada su hoja de vida acad&eacute;mica, profesional y laboral, 
          resultados de la entrevista, as&iacute; como otros aspectos del proceso 
          de selecci&oacute;n, lamentamos informarle que la Direcci&oacute;n de 
          la Maestría conceptu&oacute; no aprobar su solicitud de admisi&oacute;n. 
        <p> No obstante lo anterior le agradecemos que haya escogido la Escuela 
          como una opci&oacute;n para adelantar sus estudios de posgrado y esperamos 
          que haya una pr&oacute;xima oportunidad para contar con usted como miembro 
          de nuestra comunidad acad&eacute;mica. 
        <p> Si desea mayor informaci&oacute;n al respecto por favor comuníquese 
          con la Dirección de la Maestría.</p><b>
        <p> 
          <%if (idplan.equals("351")) {
                                    programa = "MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";%>
          Ing. Ricardo Arturo Benavides Bolaños<br>
          Director <%=programa%> <br>
          ricardo.benavides@escuelaing.edu.co <br>
          Teléfono. 668 3600, ext. 337 
          <%}else if (idplan.equals("353")) {
                                                            programa = "MAESTRIA EN GESTIÓN DE INFORMACIÓN";%>
          Ing. Victoria Eugenia Ospina Becerra <br>
          Directora<br>
          <a href="mailto:maestria.gestioninf@escuelaing.edu.co">maestria.gestioninf@escuelaing.edu.co</a><br>
          <a href="mailto:victoria.ospina@escuelaing.edu.co">victoria.ospina@escuelaing.edu.co</a><br>
          <%} else if (idplan.equals("290") || idplan.equals("291") || idplan.equals("292") || idplan.equals("293") || idplan.equals("294")) {%>
        <p>Dr. Germán Santos Granados <br>
          Director <a href="mailto: maestriacivil@escuelaing.edu.co">maestriacivil@escuelaing.edu.co</a> 
          <br>
          <a href="mailto: german.santos@escuelaing.edu.co">german.santos@escuelaing.edu.co</a> 
          Teléfono. 668 3600, exts. 164 y 147<br>
          <%} else if (idplan.equals("321") || idplan.equals("322")) {%>
        <p> Ing. Alexander Pérez Ruiz<br>
          Director <a href="mailto: maestriaelectronica@escuelaing.edu.co">maestria.electronica@escuelaing.edu.co</a> 
          <br>
          <a href="mailto: alexander.perez@escuelaing.edu.co">alexander.perez@escuelaing.edu.co</a> 
          Teléfono. 668 3600, exts. 164 y 147<br>
        </p>
        <b> </b> </td>
    </tr>
  </table>
   </div>
  <%}
                    }
                    if (estud.elementAt(3).equals("-185")) {%>
  <br>
  <div align="center">
  <table width="60%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas" align="center">
    <tr> 
      <td><b>Nombre: <%=estud.elementAt(1)%></b> <br>
        <p>Su solicitud de admisión esta en estudio. Para mayor información por 
          favor comuníquese con la Dirección de la Maestría.<b>
        <p> 
          <%if (idplan.equals("353")) {
                                                                programa = "MAESTRIA EN GESTIÓN DE INFORMACIÓN";%>
          Dr. Victoria Eugenia Ospina Becerra<br>
          Directora<br>
          <a href="mailto:maestria.gestioninf@escuelaing.edu.co">maestria.gestioninf@escuelaing.edu.co</a><br>
          <a href="mailto:victoria.ospina@escuelaing.edu.co">victoria.ospina@escuelaing.edu.co</a><br>
          <%} else if (idplan.equals("290")) {%>
        <p>Dr. Germán Santos Granados <br>
          Director <a href="mailto: maestriacivil@escuelaing.edu.co">maestriacivil@escuelaing.edu.co</a> 
          <br>
          <a href="mailto: german.santos@escuelaing.edu.co">german.santos@escuelaing.edu.co</a> 
          Teléfono. 668 3600, exts. 164 y 147<br>
          <%}else if (idplan.equals("351")) {%>
           <p>Ing. Ricardo Arturo Benavides Bolaños <br>
          Director <a href="mailto: ricardo.benavides@escuelaing.edu.co">ricardo.benavides@escuelaing.edu.co</a> 
          <br>
                   Teléfono. 668 3600, exts.337<br>
          <%}else if (idplan.equals("321") || idplan.equals("322")) {%>
        <p> Ing. Alexander Pérez Ruiz <br>
          Director <a href="mailto: maestriaelectronica@escuelaing.edu.co">maestria.electronica@escuelaing.edu.co</a> 
          <br>
          <a href="mailto: alexander.perez@escuelaing.edu.co">alexander.perez@escuelaing.edu.coo</a> 
          Teléfono. 668 3600, exts. 164 y 147<br>
      </td>
    </tr>
  </table>
  </div>
  <%}
                                                        } else if (estud.elementAt(3).equals("-111")) {%>
                                                        <div align="center">
  <table align="center" width="70%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas">
    <tr> 
      <td>&nbsp; </td>
    </tr>
    <tr> 
      <td><b><%=titulos%></b></td>
    </tr>
    <tr> 
      <td><b><%=estud.elementAt(1)%></b></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td valign="top" height="1000"> 
        <p align="justify"> </p>
        Después de realizado el proceso de selección, le informamos que inicialmente 
        por restricción de cupos no fue seleccionado para iniciar actividades 
        académicas el <%=cronograma.elementAt(20)%>. Sin embargo, teniendo en 
        cuenta su hoja de vida académica y profesional y su desempeño en el exámen 
        y la entrevista a la que fue citado, usted quedó en <b>lista de espera.</b> 
        En caso que por algún motivo, alguno de los seleccionados no utilice el 
        cupo asignado, usted será uno de los opcionados para su reasignación. 
        Inmediatamente queden cupos disponibles, nos comunicaremos con usted para 
        continuar con el proceso de matrícula. 
        <p> Cordialmente,<br>
          Dirección Maestría<br>
          <%if (idplan.equals("351")) {
                                    programa = "MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";%>
          Ing. Ricardo Arturo Benavides Bolaños<br>
          Director <br>
          ricardo.benavides@escuelaing.edu.co <br>
          Teléfono. 668 3600, ext. 337 
          <%}%>
          <br>
      </td>
    </tr>
    <tr> 
      <td valign="top" height="1000">&nbsp;</td>
    </tr>
    <tr> 
      <td valign="top" height="1000">&nbsp;</td>
    </tr>
  </table>
                                                        </div>
  <%}
                                                        }%>
  <!--  <table width="70%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas">
                                          <tr>
                                            <td>
                                              <div align="right">
                                                <input type="submit" name="Submit5" value="Imprimir en word" class="boton" onClick="javascript: return enviarword()">
                                              </div>
                                            </td>
                                          </tr>
                                        </table>-->
</form>
                                    <% }
                                        }
                                    %>
