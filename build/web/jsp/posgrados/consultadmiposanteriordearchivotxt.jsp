 <%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
        String docEst = request.getParameter("documento");
        String idplan = request.getParameter("idplan");
        PrintWriter oout = response.getWriter();
        configeci.configPosgrados confEci = new configeci.configPosgrados();
        String respadm = "", induccion = "", fecinicio = "", valorniv = "", ordenesp = "", firmaesp = "";
        String programa = "", fecordenes = "", fecpagos = "", fecniv = "", firmaniv = "", valortotal = "", creditos = "", valcredito = "";
        otros.rutas ruta = new otros.rutas();
        BDadmisiones bd = new BDadmisiones();
        int val = 0;
        int ban = 0;
        String titulo = "Aspirantes a un programa de Especialización";
        if (docEst != null && !docEst.equals("")) {
%>
<html>
<head>
    <title>Consulta Admisiones</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link href="css/comun.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" type="text/JavaScript">
        <!--
        function ventanaSecundaria (URL){
            window.open(URL,"","width=800,height=430,scrollbars=no,top=100,left=100")
        }
        //-->
    </script>
</head>

<!%=confEci.getPeriodoant()%>
<body bgcolor="#FFFFFF" text="#000000">
<jsp:include page="encabezado">        
    <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
    <jsp:param name="titulo" value="<%=titulo%>" />
</jsp:include>
<!--getperiodoant solo para cuando se crucen los periodos 2008-1-2008-2
por ejemplo se requiere publicar admitidos QHSE 2008-1 y las inscripciones de las otras especializa
ciones son para 2008-2-->
<%Vector estud = bd.AdmitidosPos(docEst, idplan, confEci.getPeriodo(), oout);
  Vector cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
  Vector tutor = bd.Tutores(docEst, oout);%>

<%if ((estud.size()) == 0) {%>

<table align="center" width="80%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas">
    <tr>
        <td valign="top">
            <div align="center">
                <h3>
                        <p>&nbsp;</p>

                        <p>Su documento es incorrecto o usted no formaliz&oacute; la solicitud
                            de admisión para este programa académico. <br>
                            Verifique e intente nuevamente o comuníquese con la Oficina de Admisiones.
                            <br>
                        Tel&eacute;fono: 6683600 Ext: 274, 263 o 101 </p>
            </center></h3> </div>
        </td>
    </tr>
</table> 
<%} else {%>

<!--Para La respta de ADMITIDOS de QHSE cdo hay dos cohores a la vez se crea cronogramaqhse.txt 
y se valida aqui la cohorte por eje esta es la cohorte 12(2008-1) y el cronograma.txt va la cohorte 11-->
<% String rutas = "";
    if (estud.elementAt(2).equals("370") && estud.elementAt(5).equals("12")) {
        rutas = "cronogramaqhse.txt";
    } else {
        rutas = "cronograma.txt";
    }
    String arreglo[] = new String[50];
    int i = 0, n = 1;
    int k = 0;
    try {
        FileReader ra = new FileReader(ruta.valruta() + "posgrados" + ruta.tokenruta() + "cronograma.txt");
//FileReader ra = new FileReader("/usr/local/jakarta-tomcat-3.2.1/confEci/posgrados/cronograma.txt");
        BufferedReader entrada = new BufferedReader(ra);
        String s;
        while ((s = entrada.readLine()) != null) {
            arreglo[i] = s;
            i = i + 1;
        }
        entrada.close();
        ra.close();%>
<%
} catch (java.io.FileNotFoundException fnfex) {
    System.out.println("Archivo no encontrado: " + fnfex);
%>
<p>Archivo no encontrado
    <%     } catch (java.io.IOException ioex) {
    }

    %>
    <%String texto[] = new String[5000];
    int ii = 0;
    for (int jj = 0; jj < i; jj++) {
        StringTokenizer st = new StringTokenizer(arreglo[jj], "*");
        k = 0;%>

    <%while (st.hasMoreTokens()) {
            texto[k] = st.nextToken();
            k = k + 1;
        }%>

    <%if (texto[0].equals(estud.elementAt(2))) {
            // ii = 1 ;
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
            programa = texto[1];
            respadm = texto[9];
            fecordenes = texto[10];
            fecpagos = texto[13];
            induccion = texto[14];
            firmaniv = texto[15];
            valortotal = texto[22];
            creditos = texto[19];
            valcredito = texto[20];
            fecniv = texto[16];
            fecinicio = texto[18];
            valorniv = texto[21];
            ordenesp = texto[11];
            firmaesp = texto[17];
        }
    }%>

    <%//  if (val==0){%>
    <% // val = 1;
    //}%>
    <%if (estud.elementAt(3).equals("-179") && ban == 0) {%>
    <BR>

    <table align="center" width="80%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas">
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
    <td valign="top" height="1000"><p align="justify">En nombre de
        la Escuela Colombiana de Ingenier&iacute;a Julio Garavito, nos es grato
        comunicarle que ha sido aprobada su solicitud de admisi&oacute;n a nuestro
        Programa de <b><%=programa%></b>, para iniciar actividades acad&eacute;micas
        a partir <b>del <%=fecinicio%></b>. Usted har&aacute; parte de la comunidad
        acad&eacute;mica de una de las Instituciones de Educaci&oacute;n Superior
        con mayor prestigio Nacional e Internacional, que le da a usted una cordial
    bienvenida. </p>
    <p>Para dar inicio a su proceso de matr&iacute;cula deber&aacute; tener
    en cuenta lo siguiente:</p>
    <!--Especializacion en Polímeros -->
    <%if (estud.elementAt(2).equals("285")) {%>
    <ul>
    <li><b><p align="justify"> El <b><%=ordenesp%> se publicará en la página Web la &oacute;rden de pago de los derechos de
    matr&iacute;cula </b> <br></b></li>
    <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional
    al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa
    entrega de la orden de pago. El valor total de la Especializaci&oacute;n
    es de <b><%=valortotal%></b> correspondiente a <b><%=creditos%></b>
cr&eacute;ditos. </P></li>
</ul>
<blockquote> 
    <p>El pago extraordinario tiene un recargo del 5%.</p>
    <p><b>Valor del cr&eacute;dito: <%=valcredito%>.oo</b></p>
    <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
        (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
        el correspondiente desprendible en la Oficina de Apoyo Financiero
        de la Escuela, Bloque A, primer piso, para registrar dicho
        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
    carnetizarse y asignarle su horario.</p>-->
</blockquote>
<ul>
    <li><b>Financiaci&oacute;n:</b>
        <p align="justify">Si usted requiere solicitar financiaci&oacute;n, deber&aacute; tramitarla
            con una semana de anticipaci&oacute;n a la fecha l&iacute;mite de
            pago para lo cual deber&aacute; acercarse a la <a href="http://www.escuelaing.edu.co/apoyo_financiero/apoyo_posgrado.htm" target="_blank">Oficina
            de apoyo financiero a estudiantes</a>. Para mayores informes comun&iacute;quese
            con la Ing. Liliana Ramos al 6683600 ext. 356, Coordinadora de
        Apoyo Financiero a estudiantes.</p>
    </li>
</ul>
<p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
<p align="justify">Una vez haya realizado el pago, deberá formalizar su matr&iacute;cula, as&iacute;:</p>
<blockquote> 
<p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
</b> </p>
<ul>
<li><p align="justify">La matr&iacute;cula es el acto voluntario de una persona natural 
        mediante el cual se adquiere la calidad de estudiante de la Escuela
        Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos los
        requisitos se&ntilde;alados para la misma. Mediante este acto, el
        estudiante se compromete a cumplir el reglamento y las dem&aacute;s
        normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
el derecho a cursar el programa de formaci&oacute;n previsto.</P></li>
<li><p align="justify">La matr&iacute;cula formaliza el acceso a los derechos del estudiante 
        y a los deberes que de ellos se desprenden. Especialmente significa
        que el estudiante comparte los postulados contenidos en la Declaraci&oacute;n
de Principios de la Escuela.</P></li>
<li><p align="justify">La matr&iacute;cula la legaliza el estudiante con su firma, para 
    lo cual deber&aacute; presentarse el <b><%=firmaesp%></b> en la Oficina
    de Secretar&iacute;a General, Primer Piso, Bloque A con el comprobante
    de pago de los derechos de matr&iacute;cula. Una vez haya firmado,
ser&aacute; carnetizado como estudiante de la Especializaci&oacute;n.</li>
<li>Inicio de clases de la Especializaci&oacute;n: <b><%=fecinicio%></b>.</P></li>
</ul>
<p></p>
</blockquote>
<p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a y a 
la Especializaci&oacute;n en <b><%=programa%></b></p>
<p>Cordialmente,</p>
<p>Direcci&oacute;n Especializaci&oacute;n </p>

<p>Para mayor informaci&oacute;n:</p>
William Moreno
<a href="mailto: william.moreno@escuelaing.edu.co"> william.moreno@escuelaing.edu.co

</a></p>
<%}%>
<!--Especializacion en Gerencia de proyectos-->
<%if (estud.elementAt(2).equals("287")) {%>
<ul>
<li><b><p align="justify"> <b><%=ordenesp%> podrá pagar los derechos de matrícula o imprimir su orden
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/documentos/manualnuevos.pdf">manual
      de pagos en línea</a> <br></li>
<li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
    al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa
    entrega de la orden de pago. El valor total de la Especializaci&oacute;n
    es de <b><%=valortotal%></b> correspondiente a <b><%=creditos%></b>
cr&eacute;ditos. </P></li>
</ul>
<blockquote> 
    <p>El pago extraordinario tiene un recargo del 5%.</p>
    <p><b>Valor del cr&eacute;dito: <%=valcredito%>.oo</b></p>
    <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
        (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
        el correspondiente desprendible en la Oficina de Apoyo Financiero
        de la Escuela, Bloque A, primer piso, para registrar dicho
        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
    carnetizarse y asignarle su horario.</p>-->
</blockquote>
<ul>
    <li><b>Financiaci&oacute;n:</b>
        <p align="justify">Si usted requiere solicitar financiaci&oacute;n, deber&aacute; tramitarla
            con una semana de anticipaci&oacute;n a la fecha l&iacute;mite de
            pago para lo cual deber&aacute; acercarse a la <a href="http://www.escuelaing.edu.co/apoyo_financiero/apoyo_posgrado.htm" target="_blank">Oficina
            de apoyo financiero a estudiantes</a>. Para mayores informes comun&iacute;quese
            con la Ing. Liliana Ramos al 6683600 ext. 356, Coordinadora de
        Apoyo Financiero a estudiantes.</p>
    </li>
</ul>
<p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
<p align="justify">Una vez haya realizado el pago, deberá formalizar su matr&iacute;cula, as&iacute;:</p>
<blockquote> 
<p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
</b> </p>
<ul>
<li><p align="justify">La matr&iacute;cula es el acto voluntario de una persona natural 
        mediante el cual se adquiere la calidad de estudiante de la Escuela
        Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos los
        requisitos se&ntilde;alados para la misma. Mediante este acto, el
        estudiante se compromete a cumplir el reglamento y las dem&aacute;s
        normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
el derecho a cursar el programa de formaci&oacute;n previsto.
<li><p align="justify">La matr&iacute;cula formaliza el acceso a los derechos del estudiante 
        y a los deberes que de ellos se desprenden. Especialmente significa
        que el estudiante comparte los postulados contenidos en la Declaraci&oacute;n
de Principios de la Escuela.
<li><p align="justify">La matr&iacute;cula la legaliza el estudiante con su firma, para 
    lo cual deber&aacute; presentarse el <b><%=firmaesp%></b> en la Oficina
    de Secretar&iacute;a General, Primer Piso, Bloque A con el comprobante
    de pago de los derechos de matr&iacute;cula. Una vez haya firmado,
ser&aacute; carnetizado como estudiante de la Especializaci&oacute;n.</li>
<li>Inicio de clases de la Especializaci&oacute;n: <b><%=fecinicio%></b>.
</ul>
<p></p>
</blockquote>
<p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a y a 
la Especializaci&oacute;n en <b><%=programa%></b></p>
<p>Cordialmente,</p>
<p>Direcci&oacute;n Especializaci&oacute;n </p>

<p>Para mayor informaci&oacute;n:</p>
<p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
    Tel. 6683600 Ext. 337 y 103.<br>
    <a href="mailto: espeproy@escuelaing.edu.co"> espeproy@escuelaing.edu.co
</a></p>
<%}%>
<!--Especialización en Economía -->
<%if (estud.elementAt(2).equals("313")) {%>
<ul>
<li><b><p align="justify">  El <b><%=ordenesp%>podrá pagar los derechos de matrícula o imprimir su orden
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/documentos/manualnuevos.pdf">manual
      de pagos en línea</a> <br></li>
<li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
    al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa
    entrega de la orden de pago. El valor total de la Especializaci&oacute;n
    es de <b><%=valortotal%></b> correspondiente a <b><%=creditos%></b>
cr&eacute;ditos. 
</ul>
<blockquote> 
    <p>El pago extraordinario tiene un recargo del 5%.</p>
    <p><b>Valor del cr&eacute;dito: <%=valcredito%>.oo</b></p>
    <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
        (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
        el correspondiente desprendible en la Oficina de Apoyo Financiero
        de la Escuela, Bloque A, primer piso, para registrar dicho
        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
    carnetizarse y asignarle su horario.</p>-->
</blockquote>
<ul>
    <li><b>Financiaci&oacute;n:</b>
        <p align="justify">Si usted requiere solicitar financiaci&oacute;n, deber&aacute; tramitarla
            con una semana de anticipaci&oacute;n a la fecha l&iacute;mite de
            pago para lo cual deber&aacute; acercarse a la <a href="http://www.escuelaing.edu.co/apoyo_financiero/apoyo_posgrado.htm" target="_blank">Oficina
            de apoyo financiero a estudiantes</a>. Para mayores informes comun&iacute;quese
            con la Ing. Liliana Ramos al 6683600 ext. 356, Coordinadora de
        Apoyo Financiero a estudiantes.</p>
    </li>
</ul>
<p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
<p align="justify">Una vez haya realizado el pago, deberá formalizar su matr&iacute;cula, as&iacute;:</p>
<blockquote> 
<p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
</b> </p>
<ul>
<li><p align="justify">La matr&iacute;cula es el acto voluntario de una persona natural 
        mediante el cual se adquiere la calidad de estudiante de la Escuela
        Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos los
        requisitos se&ntilde;alados para la misma. Mediante este acto, el
        estudiante se compromete a cumplir el reglamento y las dem&aacute;s
        normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
el derecho a cursar el programa de formaci&oacute;n previsto.</P></li>
<li><p align="justify">La matr&iacute;cula formaliza el acceso a los derechos del estudiante 
        y a los deberes que de ellos se desprenden. Especialmente significa
        que el estudiante comparte los postulados contenidos en la Declaraci&oacute;n
de Principios de la Escuela.</P></li>
<li><p align="justify">La matr&iacute;cula la legaliza el estudiante con su firma, para 
    lo cual deber&aacute; presentarse el <b><%=firmaesp%></b> en la Oficina
    de Secretar&iacute;a General, Primer Piso, Bloque A con el comprobante
    de pago de los derechos de matr&iacute;cula. Una vez haya firmado,
ser&aacute; carnetizado como estudiante de la Especializaci&oacute;n.</li>
<li>Inicio de clases de la Especializaci&oacute;n: <b><%=fecinicio%></b>.</P></li>
</ul>
<p></p>
</blockquote>
<p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a y a 
la Especializaci&oacute;n en <b><%=programa%></b></p>
<p>Cordialmente,</p>
<p>Direcci&oacute;n Especializaci&oacute;n </p>
<p>Para mayor informaci&oacute;n:</p>
<p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
    Tel. 6683600 - 6763888, Ext. 218, 274 y 292<br>
    <a href="mailto:esarmien@escuelaing.edu.co">esarmien@escuelaing.edu.co</a>
</p>
<%}%>
<%if (estud.elementAt(2).equals("312")) {%>
<p><b>1.</b> 
    <!--Cordialmente lo invitamos a una reuni&oacute;n informativa sobre
      aspectos generales de la maestr&iacute;a en Ingenier&iacute;a Civil, resolver inquietudes sobre los procesos
      administrativos y opciones de Financiaci&oacute;n Educativa el 25 de Julio en el sal&oacute;n D111
    a las 8:00 a.m.-->
    Su consejero Académico será el Ing.<!%=tutor.elementAt(1)%>, correo electrónico:<!%=tutor.elementAt(3)%>,
    con quien deberá acordar la propuesta de las asignaturas que conformarán
    su plan de estudios, a más tardar el 10 de Diciembre, para efectos
    de liquidación de la orden de matrícula correspondiente al primer periodo
    de 2010.
    <!--El director del énfasis enviará por correo electrónico
    sugerencias para su registro académico basados en los intereses que usted manifestó en la entrevista y su
    disponibilidad horaria.-->
     El <b><%=ordenesp%>podrá pagar los derechos de matrícula o imprimir su orden
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/documentos/manualnuevos.pdf">manual
      de pagos en línea</a> <br>
</p>
<p>Si tiene alguna duda sobre el proceso de inscripción, puede comunicarse 
al 668 36 00 exts 230 y 324. </p>
<p>
    <li><b>Pagos</b>: El valor de cada período es directamente proporcional al número de créditos y se debe pagar a su inicio, previa entrega de la orden de pago.
        El valor total de la Especialización para el año 2010 es de  <b><%=valortotal%></b> correspondiente a  <b><%=creditos%></b>  créditos.
        <p>
        El pago extraordinario tiene un recargo del 5%.
        <br>
        <p><b>Valor del cr&eacute;dito académico: <%=valcredito%>.oo</b></p>
        <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
        (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
        el correspondiente desprendible en la Oficina de Apoyo Financiero
        de la Escuela, Bloque A, primer piso, para registrar dicho
        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
        carnetizarse y asignarle su horario.</p>-->
        <p>
        2.  <b>Financiaci&oacute;n:</b>
        <p align="justify">Ofrecemos diversas alternativas de financiación en corto y largo plazo,
            para cubrir hasta el 100% del valor de la matrícula, para mayor información comuníquese con la
        Oficina de Apoyo Financiero al 6683600 ext. 107 ó 356.</p>
    </li>
    <p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
    <p align="justify">Una vez haya realizado el pago, deberá formalizar su matr&iacute;cula, as&iacute;:</p>
    <blockquote>
        <p align="justify"><b> Firma del acta de matrícula y carnetizaci&oacute;n:
        </b> </p>
        <ul>
            <li><p align="justify">La matrícula es el acto voluntario de una persona natural mediante el cual se adquiere la calidad de estudiante
                    de la Escuela Colombiana de Ingeniería, previo el cumplimiento de todos los requisitos señalados por la misma.
            Mediante este acto, el estudiante se compromete a cumplir el reglamento y las demás normas establecidas por la Institución y por el Estado y adquiere el derecho a cursar el programa de formación previsto.</P></li>
            <li><p align="justify">La matr&iacute;cula formaliza el acceso a los derechos del estudiante
                    y a los deberes que de ellos se desprenden. Especialmente significa
                    que el estudiante comparte los postulados contenidos en la Declaraci&oacute;n
            de Principios de la Escuela.</P></li>

            <li><p align="justify">La matr&iacute;cula la legaliza el estudiante con su firma, para
                lo cual deber&aacute; presentarse  el  <b><%=firmaesp%></b> en la Oficina
                de Secretar&iacute;a General, Primer Piso, Bloque A, con el comprobante
                de pago de los derechos de matr&iacute;cula. Una vez haya firmado,
            ser&aacute; carnetizado como estudiante de la Especializaci&oacute;n.</li>
            <li>Inicio de clases de la Especializaci&oacute;n: <b><%=fecinicio%></b>.</li>
            <li>Inducción: <b><%=induccion%></b>.</li>
        </ul>
        <p></p>
    </blockquote>
    <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a y a
    la Especializaci&oacute;n en <b><%=programa%></b></p>
    <p>Cordialmente,</p>
    <p>Direcci&oacute;n Especializaci&oacute;n </p>

    <p>Para mayor informaci&oacute;n:</p>
    Dr. Pedro Nel Quiroga Saavedra<br>
    Director<br>
    <a href="mailto:pedro.quiroga@escuelaing.edu.co">pedro.quiroga@escuelaing.edu.co</a>
    <br>
    Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
    Tel. 6683600 Ext. 267.<br>
    <p>
        Ing. Sandra P. Aguilar C.<br>
        Coordinadora<br>
        <a href="mailto:sandra.aguilar@escuelaing.edu.co">sandra.aguilar@escuelaing.edu.co</a>
        <br> Tel. 6683600 Ext. 230.<br>
    </p>
    <p>
        <%}%>
        <!--Especializacion Gerencia de Producción Industrial-->
        <%if (estud.elementAt(2).equals("286")) {%>

    </p>
    </blockquote>
    <ul>
    <li><b><p align="justify">  El <b><%=ordenesp%>podrá pagar los derechos de matrícula o imprimir su orden
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/documentos/manualnuevos.pdf">manual
      de pagos en línea</a> <br></li>
    <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional
    al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa
    entrega de la orden de pago. El valor total de la Especializaci&oacute;n
    es de <b><%=valortotal%></b> correspondiente a <b><%=creditos%></b>
cr&eacute;ditos. </P></li>
</ul>
<blockquote> 
    <p>El pago extraordinario tiene un recargo del 5%.</p>
    <p><b>Valor del cr&eacute;dito: <%=valcredito%>.oo</b></p>
    <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
        (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
        el correspondiente desprendible en la Oficina de Apoyo Financiero
        de la Escuela, Bloque A, primer piso, para registrar dicho
        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
    carnetizarse y asignarle su horario.</p>-->
</blockquote>
<ul>
    <li><b>Financiaci&oacute;n:</b>
        <p align="justify">Si usted requiere solicitar financiaci&oacute;n, deber&aacute; tramitarla
            con una semana de anticipaci&oacute;n a la fecha l&iacute;mite de
            pago para lo cual deber&aacute; acercarse a la <a href="http://www.escuelaing.edu.co/apoyo_financiero/apoyo_posgrado.htm" target="_blank">Oficina
            de apoyo financiero a estudiantes</a>. Para mayores informes comun&iacute;quese
            con la Ing. Liliana Ramos al 6683600 ext. 356, Coordinadora de
        Apoyo Financiero a estudiantes.</p>
    </li>
</ul>
<p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
<p align="justify">Una vez haya realizado el pago, deberá formalizar su matr&iacute;cula, as&iacute;:</p>
<blockquote> 
<p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
</b> </p>
<ul>
<li><p align="justify">La matr&iacute;cula es el acto voluntario de una persona natural 
        mediante el cual se adquiere la calidad de estudiante de la Escuela
        Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos los
        requisitos se&ntilde;alados para la misma. Mediante este acto, el
        estudiante se compromete a cumplir el reglamento y las dem&aacute;s
        normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
el derecho a cursar el programa de formaci&oacute;n previsto.</P></li>
<li><p align="justify">La matr&iacute;cula formaliza el acceso a los derechos del estudiante 
        y a los deberes que de ellos se desprenden. Especialmente significa
        que el estudiante comparte los postulados contenidos en la Declaraci&oacute;n
de Principios de la Escuela.</P></li>
<li><p align="justify">La matr&iacute;cula la legaliza el estudiante con su firma, para 
    lo cual deber&aacute; presentarse el <b><%=firmaesp%></b> en la Oficina
    de Secretar&iacute;a General, Primer Piso, Bloque A con el comprobante
    de pago de los derechos de matr&iacute;cula. Una vez haya firmado,
ser&aacute; carnetizado como estudiante de la Especializaci&oacute;n.</li>
<li>Inicio de clases de la Especializaci&oacute;n: <b><%=fecinicio%></b>.</P></li>
</ul>
<p></p>
</blockquote>
<p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a y a 
la <b><%=programa%></b></p>
<p>Cordialmente,</p>
<p>Direcci&oacute;n Especializaci&oacute;n </p>

<p>Para mayor informaci&oacute;n:</p>
Coordinaci&oacute;n Especialización<br>
<a href="mailto:carlosr.ruiz@escuelaing.edu.co">carlosr.ruiz@escuelaing.edu.co </a></p>
<%}%>

</blockquote>

<%if (estud.elementAt(2).equals("288")) {%>
<!--Especializacion Telematica-->
</p>
</blockquote>
<ul>
<li><b><p align="justify">  El <b><%=ordenesp%>podrá pagar los derechos de matrícula o imprimir su orden
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/documentos/manualnuevos.pdf">manual
      de pagos en línea</a> <br>
<li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
    al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa
    entrega de la orden de pago. El valor total de la Especializaci&oacute;n
    es de <b><%=valortotal%></b> correspondiente a <b><%=creditos%></b>
cr&eacute;ditos. </P></li>
</ul>
<blockquote> 
    <p>El pago extraordinario tiene un recargo del 5%.</p>
    <p><b>Valor del cr&eacute;dito: <%=valcredito%>.oo</b></p>
    <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
        (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
        el correspondiente desprendible en la Oficina de Apoyo Financiero
        de la Escuela, Bloque A, primer piso, para registrar dicho
        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
    carnetizarse y asignarle su horario.</p>-->
</blockquote>
<ul>
    <li><b>Financiaci&oacute;n:</b>
        <p align="justify">Si usted requiere solicitar financiaci&oacute;n, deber&aacute; tramitarla
            con una semana de anticipaci&oacute;n a la fecha l&iacute;mite de
            pago para lo cual deber&aacute; acercarse a la <a href="http://www.escuelaing.edu.co/apoyo_financiero/apoyo_posgrado.htm" target="_blank">Oficina
            de apoyo financiero a estudiantes</a>. Para mayores informes comun&iacute;quese
            con la Ing. Liliana Ramos al 6683600 ext. 356, Coordinadora de
        Apoyo Financiero a estudiantes.</p>
    </li>
</ul>
<p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
<p align="justify">Una vez haya realizado el pago, deberá formalizar su matr&iacute;cula, as&iacute;:</p>
<blockquote> 
<p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
</b> </p>
<ul>
<li><p align="justify">La matr&iacute;cula es el acto voluntario de una persona natural 
        mediante el cual se adquiere la calidad de estudiante de la Escuela
        Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos los
        requisitos se&ntilde;alados para la misma. Mediante este acto, el
        estudiante se compromete a cumplir el reglamento y las dem&aacute;s
        normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
el derecho a cursar el programa de formaci&oacute;n previsto.</P></li>
<li><p align="justify">La matr&iacute;cula formaliza el acceso a los derechos del estudiante 
        y a los deberes que de ellos se desprenden. Especialmente significa
        que el estudiante comparte los postulados contenidos en la Declaraci&oacute;n
de Principios de la Escuela.</P></li>
<li><p align="justify">La matr&iacute;cula la legaliza el estudiante con su firma, para 
    lo cual deber&aacute; presentarse el <b><%=firmaesp%></b> en la Oficina
    de Secretar&iacute;a General, Primer piso, Bloque A con el comprobante
    de pago de los derechos de matr&iacute;cula. Una vez haya firmado,
ser&aacute; carnetizado como estudiante de la Especializaci&oacute;n.</li>
<li>Inicio de clases de la Especializaci&oacute;n: <b><%=fecinicio%></b>.</P></li>
</ul>
<p></p>
</blockquote>
<p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a y a 
la Especializaci&oacute;n en <b><%=programa%></b></p>
<p>Cordialmente,</p>
<p>Direcci&oacute;n Especializaci&oacute;n </p>

<p>Para mayor informaci&oacute;n:</p>
<p>Tel&eacute;fono y direcciones de correo electr&oacute;nico: <br>
    <br>
    <a href="mailto:telemati@escuelaing.edu.co">telem&aacute;tica@escuelaing.edu.co
    </a><br>
    Coordinaci&oacute;n Acad&eacute;mica: Tel. 668 3600 Ext. 224 ó 377<br>
<a href="mailto:guillermo.teuta@escuelaing.edu.co">guillermo.teuta@escuelaing.edu.co </a></p>
<%}%>
</blockquote>
<%if (estud.elementAt(2).equals("370")) {%>
<!--Especializacion QHSE-->
<ul> 
<li><b><p align="justify">  El <b><%=ordenesp%>podrá pagar los derechos de matrícula o imprimir su orden
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/documentos/manualnuevos.pdf">manual
      de pagos en línea.</a> <br>  El plazo
para pago de los derechos de matrícula ser&aacute; del <b><%=fecpagos%></b>.</li>
<li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
    al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa
    entrega de la orden de pago. El valor total de la Especializaci&oacute;n
    es de <b><%=valortotal%></b> correspondiente a <b><%=creditos%></b>
cr&eacute;ditos. </P></li>
</ul>
<blockquote> 
    <p>El pago extraordinario tiene un recargo del 5%.</p>
    <p><b>Valor del cr&eacute;dito: <%=valcredito%>.oo</b></p>
    <!-- <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
        (en la Caja de la Escuela, en cualquier sucursal del Banco de Occidente o Banco Santander) , debe entregar
        el correspondiente desprendible en la Direcci&oacute;n Administrativa
        y Financiera de la Escuela, Bloque A, segundo piso, para registrar dicho
        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
        carnetizarse, asignarle su horario y autorizársele por parte de la Dirección del
    Programa su asistencia a clases.</p>-->
</blockquote>
<ul>
    <li><b>Financiaci&oacute;n:</b>
        <p align="justify">Si usted requiere solicitar financiaci&oacute;n, deber&aacute; tramitarla
            con una semana de anticipaci&oacute;n a la fecha l&iacute;mite de
            pago para lo cual deber&aacute; acercarse a la <a href="http://www.escuelaing.edu.co/apoyo_financiero/apoyo_posgrado.htm" target="_blank">Oficina
            de Apoyo Financiero a estudiantes</a>. Para mayores informes comun&iacute;quese
            con la Ing. Olga Liliana Ramos al 6683600 ext. 356, Coordinadora de
        Apoyo Financiero a estudiantes</p>
    </li>
</ul>
<p><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
<p align="justify">Una vez haya realizado el pago, deberá formalizar su matr&iacute;cula as&iacute;:</p>
<blockquote> 
    <p><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n:
    </b> </p>
    <ul>
        <li><p align="justify">La matr&iacute;cula es el acto voluntario de una persona natural
                mediante el cual se adquiere la calidad de estudiante de la Escuela
                Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos los
                requisitos se&ntilde;alados para la misma. Mediante este acto, el
                estudiante se compromete a cumplir el reglamento y las dem&aacute;s
                normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
        el derecho a cursar el programa de formaci&oacute;n previsto.</P></li>
        <li><p align="justify">La matr&iacute;cula formaliza el acceso a los derechos del estudiante
                y a los deberes que de ellos se desprenden. Especialmente significa
                que el estudiante comparte los postulados contenidos en la Declaraci&oacute;n
                de Principios de la Escuela, acata el Reglamento de Posgrados y el Reglamento
        Interno de la Especialización.</P></li>
        <li><p align="justify">La matr&iacute;cula la legaliza el estudiante con su firma, para
                lo cual deber&aacute; presentarse del <b><%=firmaesp%></b> <!--en la Oficina
                de Secretar&iacute;a General, Primer Piso, Bloque A--> con el comprobante
                de pago de los derechos de matr&iacute;cula. Una vez haya firmado,
        ser&aacute; carnetizado como estudiante de la Especializaci&oacute;n. De lo contrario no podrá ingresar a las clases que se inician el <%=fecinicio%>. </P></li>
        <li><p align="justify">La inducción, se
        realizar&aacute; el <b><%=induccion%> .</b> </P></li>
        <li>Inicio de clases de la Especializaci&oacute;n: <b><%=fecinicio%></b>.</li>
    </ul>
</blockquote>
<blockquote> 
    <p align="justify">Al manifestarle nuestra complacencia por contarlo entre los alumnos
        de la ESCUELA, le deseo que su permanencia en ella sea fructifera y
        agradable y que los nuevos estudios contribuyan a su realizaci&oacute;n
    profesional y personal.</p>
    <p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a y
    a la Especializaci&oacute;n en <b><%=programa%></b></p>
    <p>Cordialmente,</p>
    <p>Direcci&oacute;n Especializaci&oacute;n QHSE</p>
</blockquote>

<blockquote> 
    <p>Para mayor informaci&oacute;n:</p>
    <p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
        Tel. 6683600 ext. 133.<br>
        <a href="mailto:ricardo.vasquez@escuelaing.edu.co">ricardo.vasquez@escuelaing.edu.co</a>
    </p>
    <p>
        <%}%>
    </p>
</blockquote>
<%if (estud.elementAt(2).equals("129")) {%>
<!--Especializacion Saneamiento-->
<ul>
<li><p align="justify">  El <b><%=ordenesp%></b>podrá pagar los derechos de matrícula o imprimir su orden
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/documentos/manualnuevos.pdf">manual
      de pagos en línea.</a> <br></li>
<li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
    al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa
    entrega de la orden de pago. El valor del crédito académico para el primer semestre de 2010
    <%=valcredito%>. El valor por período dependerá del número de créditos que tome el estudiante.<!--El valor total de la Especializaci&oacute;n
    es de <b><!%=valortotal%></b> correspondiente a <b><!%=creditos%></b>
cr&eacute;ditos. --></P></li>
</ul>
<blockquote> 
    <p>El pago extraordinario tiene un recargo del 5%.</p>
    <p><b><!--Valor del cr&eacute;dito: <!%=valcredito%>.oo--></b></p>
    <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
        (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
        el correspondiente desprendible en la Oficina de Apoyo Financiero
        de la Escuela, Bloque A, primer piso, para registrar dicho
        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
    carnetizarse y asignarle su horario.</p>-->
</blockquote>
<ul>
    <li><b>Financiaci&oacute;n:</b>
        <p align="justify">Si usted requiere solicitar financiaci&oacute;n, deber&aacute; tramitarla
            con una semana de anticipaci&oacute;n a la fecha l&iacute;mite de
            pago para lo cual deber&aacute; acercarse a la <a href="http://www.escuelaing.edu.co/apoyo_financiero/apoyo_posgrado.htm" target="_blank">Oficina
            de apoyo financiero a estudiantes</a>. Para mayores informes comun&iacute;quese
            con la Ing. Liliana Ramos al 6683600 ext. 356, Coordinadora de
        Apoyo Financiero a estudiantes.</p>
    </li>
</ul>
<p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
<p align="justify">Una vez haya realizado el pago, deberá formalizar su matr&iacute;cula, as&iacute;:</p>
<blockquote> 
<p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n: 
</b> </p>
<ul>
<li><p align="justify">La matr&iacute;cula es el acto voluntario de una persona natural 
        mediante el cual se adquiere la calidad de estudiante de la Escuela
        Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos los
        requisitos se&ntilde;alados para la misma. Mediante este acto, el
        estudiante se compromete a cumplir el reglamento y las dem&aacute;s
        normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
el derecho a cursar el programa de formaci&oacute;n previsto.</P></li>
<li><p align="justify">La matr&iacute;cula formaliza el acceso a los derechos del estudiante 
        y a los deberes que de ellos se desprenden. Especialmente significa
        que el estudiante comparte los postulados contenidos en la Declaraci&oacute;n
de Principios de la Escuela.</P></li>
<li><p align="justify">La matr&iacute;cula la legaliza el estudiante con su firma, para 
    lo cual deber&aacute; presentarse del <b><%=firmaesp%></b> en la Oficina
    de Secretar&iacute;a General, Primer piso, Bloque A con el comprobante
    de pago de los derechos de matr&iacute;cula. Una vez haya firmado,
ser&aacute; carnetizado como estudiante de la Especializaci&oacute;n.</li>
<li>Inicio de clases de la Especializaci&oacute;n: <b><%=fecinicio%></b>.</P></li>
<li>Inducción: <b><%=induccion%></b>.</P></li>
</ul>
<p></p>
</blockquote>
<p>Al manifestarle nuestra complacencia por contarlo entre los alumnos 
    de la ESCUELA, le deseo que su permanencia en ella sea fructifera y
    agradable y que los nuevos estudios contribuyan a su realizaci&oacute;n
profesional y personal.</p>
<p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a y a 
la Especializaci&oacute;n en <b><%=programa%></b></p>
<p>Cordialmente,</p>
<p>Direcci&oacute;n Especializaci&oacute;n </p>

<p>Para mayor informaci&oacute;n:</p>
<p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
    <a href="mailto:maria.villegas@escuelaing.edu.co">maria.villegas@escuelaing.edu.co</a>
    Tel: 6683600 exts. 268 ó 283 <br>
</p>
<%}%>
<%if (estud.elementAt(2).equals("310")) {%>
<!--Especialización Recursos Hidráulicos-->
<p><b>1.</b> 
    <!--Cordialmente lo invitamos a una reuni&oacute;n informativa sobre
      aspectos generales de la maestr&iacute;a en Ingenier&iacute;a Civil, resolver inquietudes sobre los procesos
      administrativos y opciones de Financiaci&oacute;n Educativa el 25 de Julio en el sal&oacute;n D111
    a las 8:00 a.m.-->
    Su consejero Académico será el <b>Ing.<!%=tutor.elementAt(1)%></b>, correo electrónico:<!%=tutor.elementAt(3)%>,
    con quien deberá acordar la propuesta de las asignaturas que conformarán
    su plan de estudios, durante los días 13 al 17 de Julio, para efectos
    de liquidación de la orden de matrícula correspondiente al segundo periodo
    de 2009.
    <!--El director del énfasis enviará por correo electrónico
    sugerencias para su registro académico basados en los intereses que usted manifestó en la entrevista y su
    disponibilidad horaria.-->
    El <b><%=ordenesp%>podrá pagar los derechos de matrícula o imprimir su orden
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/documentos/manualnuevos.pdf">manual
      de pagos en línea.</a> <br></p>
<p><b>2. Pagos</b>: El valor que hay que pagar en cada período es directamente 
    proporcional al número de créditos que se va a cursar, y se debe pagar
a su inicio, previa entrega de la orden de pago. </p>
<blockquote> 
    <p>El pago extraordinario tiene un recargo del 5%.</p>
    <p><b>Valor del cr&eacute;dito para el 2010-1 es : <%=valcredito%>.oo</b></p>
    <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
        (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
        el correspondiente desprendible en la Oficina de Apoyo Financiero
        de la Escuela, Bloque A, primer piso, para registrar dicho
        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
    carnetizarse y asignarle su horario.</p>-->
</blockquote>
<ul>
    <li><b>Financiaci&oacute;n:</b>
        <p align="justify">Si usted requiere solicitar financiaci&oacute;n, deber&aacute; tramitarla
            con una semana de anticipaci&oacute;n a la fecha l&iacute;mite de
            pago para lo cual deber&aacute; acercarse a la <a href="http://www.escuelaing.edu.co/apoyo_financiero/apoyo_posgrado.htm" target="_blank">Oficina
            de apoyo financiero a estudiantes</a>. Para mayores informes comun&iacute;quese
            con la Ing. Olga Liliana Ramos al 6683600 ext. 356, Coordinadora de
        Apoyo Financiero a estudiantes.</p>
    </li>
</ul>
<p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
<p align="justify">Una vez haya realizado el pago, deberá formalizar su matr&iacute;cula, as&iacute;:</p>
<blockquote> 
    <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n:
    </b> </p>
    <ul>
        <li><p align="justify">La matr&iacute;cula es el acto voluntario de una persona natural
                mediante el cual se adquiere la calidad de estudiante de la Escuela
                Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos los
                requisitos se&ntilde;alados para la misma. Mediante este acto, el
                estudiante se compromete a cumplir el reglamento y las dem&aacute;s
                normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
        el derecho a cursar el programa de formaci&oacute;n previsto.</P></li>
        <li><p align="justify">La matr&iacute;cula formaliza el acceso a los derechos del estudiante
                y a los deberes que de ellos se desprenden. Especialmente significa
                que el estudiante comparte los postulados contenidos en la Declaraci&oacute;n
        de Principios de la Escuela.</P></li>
        <li><p align="justify">La matr&iacute;cula la legaliza el estudiante con su firma, para
            lo cual deber&aacute; presentarse del <b><%=firmaesp%></b> en la Oficina
            de Secretar&iacute;a General, Primer piso, Bloque A con el comprobante
            de pago de los derechos de matr&iacute;cula. Una vez haya firmado,
        ser&aacute; carnetizado como estudiante de la Especializaci&oacute;n.</li>
        <li>Inicio de clases de la Especializaci&oacute;n: <b><%=fecinicio%></b>.</li>
        <li>Induccion: <b><%=induccion%></b>.</li>
    </ul>
    <p></p>
</blockquote>
<p>Al manifestarle nuestra complacencia por contarlo entre los alumnos 
    de la ESCUELA, le deseo que su permanencia en ella sea fructifera y
    agradable y que los nuevos estudios contribuyan a su realizaci&oacute;n
profesional y personal.</p>
<p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a y a 
la Especializaci&oacute;n en <b><%=programa%></b></p>
<p>Cordialmente,</p>
<p>Direcci&oacute;n Especializaci&oacute;n </p>

<p>Para mayor informaci&oacute;n:</p>
<p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
    Tel. 6683600 Ext. 218.<br>
    <a href="mailto:german.acero@escuelaing.edu.co">german.acero@escuelaing.edu.co</a>
</p>
<%}%>
<p> 
    <%if (estud.elementAt(2).equals("267")) {%>
    <!--Especializacion en Vias-->
</p>
<ul>
    <li>
        <p align="justify"><b> El <b><%=ordenesp%>  podrá pagar los derechos de matrícula o imprimir su orden
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/documentos/manualnuevos.pdf">manual
      de pagos en línea</a></b> <br></li>
    <li><b>Pagos</b>: El valor del crédito académico para el primer semestre de 2010 es de <%=valcredito%>. El valor por
    período dependerá del número de créditos que tome el estudiante. </li>
</ul>
<blockquote> 
    <p>El pago extraordinario tiene un recargo del 5%.</p>
    <!-- <p><b>Valor del cr&eacute;dito: <!%=valcredito%>.oo</b></p>-->
    <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
        (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
        el correspondiente desprendible en la Oficina de Apoyo Financiero
        de la Escuela, Bloque A, primer piso, para registrar dicho
        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
    carnetizarse y asignarle su horario.</p>-->
</blockquote>
<ul>
    <li><b>Financiaci&oacute;n:</b>
        <p align="justify">Si usted requiere solicitar financiaci&oacute;n, deber&aacute; tramitarla
            con una semana de anticipaci&oacute;n a la fecha l&iacute;mite de
            pago para lo cual deber&aacute; acercarse a la <a href="http://www.escuelaing.edu.co/apoyo_financiero/apoyo_posgrado.htm" target="_blank">Oficina
            de apoyo financiero a estudiantes</a>. Para mayores informes comun&iacute;quese
            con la Ing. Liliana Ramos al 6683600 ext. 356, Coordinadora de
        Apoyo Financiero a estudiantes.</p>
    </li>
</ul>
<p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
<p align="justify">Una vez haya realizado el pago, deberá formalizar su matr&iacute;cula, as&iacute;:</p>
<blockquote> 
    <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n:
    </b> </p>
    <ul>
        <li><p align="justify">La matr&iacute;cula es el acto voluntario de una persona natural
                mediante el cual se adquiere la calidad de estudiante de la Escuela
                Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos los
                requisitos se&ntilde;alados para la misma. Mediante este acto, el
                estudiante se compromete a cumplir el reglamento y las dem&aacute;s
                normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
        el derecho a cursar el programa de formaci&oacute;n previsto.</P></li>
        <li><p align="justify">La matr&iacute;cula formaliza el acceso a los derechos del estudiante
                y a los deberes que de ellos se desprenden. Especialmente significa
                que el estudiante comparte los postulados contenidos en la Declaraci&oacute;n
        de Principios de la Escuela.</P></li>
        <li><p align="justify">La matr&iacute;cula la legaliza el estudiante con su firma, para
            lo cual deber&aacute; presentarse del <b><%=firmaesp%></b> con el comprobante
            de pago de los derechos de matr&iacute;cula. Una vez haya firmado,
        ser&aacute; carnetizado como estudiante de la Especializaci&oacute;n.</li>
        <li>Inicio de clases de la Especializaci&oacute;n: <b><%=fecinicio%></b>.</li>
        <li>Induccion: <b><%=induccion%></b>.</li>
    </ul>
    <p></p>
</blockquote>
<p>Al manifestarle nuestra complacencia por contarlo entre los alumnos 
    de la ESCUELA, le deseo que su permanencia en ella sea fructifera y
    agradable y que los nuevos estudios contribuyan a su realizaci&oacute;n
profesional y personal.</p>
<p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a y a 
la Especializaci&oacute;n en <b><%=programa%></b></p>
<p>Cordialmente,</p>
<p>Direcci&oacute;n Especializaci&oacute;n </p>
<p>Para mayor informaci&oacute;n:</p>
<p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
    Tel. 6683600 Ext. 238 y 114.<br>
    <a href="mailto:santiago.henao@escuelaing.edu.co">santiago.henao@escuelaing.edu.co</a>
</p>
<blockquote>
    <%}%>
</blockquote>
<!--Especializacion en Fundaciones -->
<%if (estud.elementAt(2).equals("281")) {%>
<ul>
    <li>Usted deberá acordar la propuesta de las asignaturas que conformarán su plan de estudios con el Director de la Especialización.
    <li> Para efectos de liquidación de la orden de matrícula correspondiente
        al primer periodo de 2010, deberá descargar <a href="http://www.escuelaing.edu.co/documentos/fundaciones.xls">ESTE
        FORMATO,</a> diligenciarlo teniendo en cuenta lo acordado con el Director y enviarlo vía mail a <a href="mailto:sandra.campagnoli@escuelaing.edu.co">sandra.campagnoli@escuelaing.edu.co</a>
        a más tardar el 17 de Diciembre de 2008. <!--El director del énfasis enviará por correo electrónico
    sugerencias para su registro académico basados en los intereses que usted manifestó en la entrevista y su
    disponibilidad horaria. Posteriormente la entrega de &oacute;rdenes
        de pago de los derechos de matr&iacute;cula</b> se har&aacute; del <b><!%=ordenesp%></b>,
    en la Oficina de Apoyo Financiero de 8:00 a.m 1:00 pm. y de 2:00 p.m a
    4:30 p.m.--></li>

    <li><p align="justify"><b>  El <b><%=ordenesp%>podrá pagar los derechos de matrícula o imprimir su orden
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/documentos/manualnuevos.pdf">manual
      de pagos en línea.</a> <br> </li>
    <li><b>Pagos</b>: El valor del crédito académico para el primer semestre de
        2009 es de $450.000 y para el segundo semestre de $490.000. El valor
    por período dependerá del número de créditos que tome el estudiante.</li>
</ul>
<blockquote> 
    <p>El pago extraordinario tiene un recargo del 5%.</p>
    <!--  <p><b>Valor del cr&eacute;dito: <!%=valcredito%>.oo</b></p>-->
        <!--  <p align="justify">Una vez haya realizado el pago de cada m&oacute;dulo de la Especializaci&oacute;n
        (en la Caja de la Escuela, en el Banco de Occidente o Banco Santander) , debe entregar
        el correspondiente desprendible en la Oficina de Apoyo Financiero
        de la Escuela, Bloque A, primer piso, para registrar dicho
        pago. El registro del pago es indispensable para formalizar su matr&iacute;cula,
        carnetizarse y asignarle su horario.</p>-->
</blockquote>
<ul>
    <li><b>Financiaci&oacute;n:</b>
        <p align="justify">Si usted requiere solicitar financiaci&oacute;n, deber&aacute; tramitarla
            con una semana de anticipaci&oacute;n a la fecha l&iacute;mite de
            pago para lo cual deber&aacute; acercarse a la <a href="http://www.escuelaing.edu.co/apoyo_financiero/apoyo_posgrado.htm" target="_blank">Oficina
            de apoyo financiero a estudiantes</a>. Para mayores informes comun&iacute;quese
            con la Ing. Liliana Ramos al 6683600 ext. 356, Coordinadora de
        Apoyo Financiero a estudiantes.</p>
    </li>
</ul>
<p align="justify"><b>Formalizaci&oacute;n de matr&iacute;cula</b></p>
<p align="justify">Una vez haya realizado el pago, deberá formalizar su matr&iacute;cula, as&iacute;:</p>
<blockquote> 
    <p align="justify"><b> Formalizaci&oacute;n de matr&iacute;cula y carnetizaci&oacute;n:
    </b> </p>
    <ul>
        <li><p align="justify">La matr&iacute;cula es el acto voluntario de una persona natural
                mediante el cual se adquiere la calidad de estudiante de la Escuela
                Colombiana de Ingenier&iacute;a, previo el cumplimiento de todos los
                requisitos se&ntilde;alados para la misma. Mediante este acto, el
                estudiante se compromete a cumplir el reglamento y las dem&aacute;s
                normas establecidas por la Instituci&oacute;n y por el Estado y adquiere
        el derecho a cursar el programa de formaci&oacute;n previsto.</P></li>
        <li><p align="justify">La matr&iacute;cula formaliza el acceso a los derechos del estudiante
                y a los deberes que de ellos se desprenden. Especialmente significa
                que el estudiante comparte los postulados contenidos en la Declaraci&oacute;n
        de Principios de la Escuela.</P></li>
        <li><p align="justify">La matr&iacute;cula la legaliza el estudiante con su firma, para
            lo cual deber&aacute; presentarse del <b><%=firmaesp%></b> en la Oficina
            de Secretar&iacute;a General, Primer Piso, Bloque A con el comprobante
            de pago de los derechos de matr&iacute;cula. Una vez haya firmado,
        ser&aacute; carnetizado como estudiante de la Especializaci&oacute;n.</li>
        <li>Inicio de clases de la Especializaci&oacute;n: <b><%=fecinicio%></b>.</li>
        <li>Inducción: <b><%=induccion%></b>.</li>
    </ul>
    <p></p>
</blockquote>
<p>Al manifestarle nuestra complacencia por contarlo entre los alumnos 
    de la ESCUELA, le deseo que su permanencia en ella sea fructifera y
    agradable y que los nuevos estudios contribuyan a su realizaci&oacute;n
profesional y personal.</p>
<p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a y a 
la Especializaci&oacute;n en <b><%=programa%></b></p>
<p>Cordialmente,</p>
<p>Direcci&oacute;n Especializaci&oacute;n </p>
<p>Para mayor informaci&oacute;n:</p>
<p>Tel&eacute;fono y direcciones de correo electr&oacute;nico:<br>
    Tel. 6683600 Ext. 340 y 238.<br>
    <a href="mailto: sandra.campagnoli@escuelaing.edu.co"> sandra.campagnoli@escuelaing.edu.co
</a></p>
<%}%>      
<p> 
    <%}%>
</p>
</td>
</tr>
</table>


<%  if (estud.elementAt(3).equals("-190")) {%>
<br>

<table width="90%" border="0" cellspacing="0" cellpadding="0">
    <tr>

        <td><b>Nombre: <%=estud.elementAt(1)%></b> <br>
            <b>Programa academico: <%=programa%></b>
            <p>Usted no ha formalizado su inscripción, debe entregar la documentación
            correspondiente en las fechas señaladas. Favor comuníquese
            con la Oficina de Admisiones. <br>
            Tel&eacute;fono: 6683600 Ext: 274, 263 o 101
        </td>
    </tr>
</table>
<%}
    if (estud.elementAt(3).equals("-181") && estud.elementAt(2).equals("287")) {%>
<table width="90%" border="0" cellspacing="0" cellpadding="0">
    <tr>

        <td><b>Nombre: <%=estud.elementAt(1)%></b>
            <br>
            <b>Programa academico: <%=programa%></b>
            <p>Lamentamos informarle que no ha sido aprobada su admisión a la Especialización.
            <p> Si desea mayor informaci&oacute;n al respecto por favor
            comuníquese con la Dirección de la Especialización a partir del 15 de Enero de 2009.<b>
            <a href="http://www.escuelaing.edu.co/admisiones/contactos.htm" target="_blank">Contacto</a></b>
            <b> </b>
        </td>
    </tr>
</table>

<%} else if (estud.elementAt(3).equals("-181")) {%>
<br>

<table width="90%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas">
    <tr>

        <td><b>Nombre: <%=estud.elementAt(1)%></b>
            <br>
            <b>Programa academico: <%=programa%></b>
            <p>Una vez estudiada su hoja de vida acad&eacute;mica, profesional y laboral, resultados de la entrevista,
            as&iacute; como otros aspectos del proceso de selecci&oacute;n, lamentamos
            informarle que la Direcci&oacute;n de la Especializaci&oacute;n conceptu&oacute;
            no aprobar su solicitud de admisi&oacute;n.  No obstante lo anterior le agradecemos que haya escogido
            la Escuela como una opci&oacute;n
            para adelantar sus estudios de posgrado y esperamos que haya una pr&oacute;xima
            oportunidad para contar con usted como miembro de nuestra comunidad
            acad&eacute;mica.
            <p> Si desea mayor informaci&oacute;n al respecto por favor
            comuníquese con la Dirección de la Especialización.<b>
            <a href="http://www.escuelaing.edu.co/admisiones/contactos.htm" target="_blank">Contacto</a></b>
            <b> </b>
        </td>
    </tr>
</table>
<%}
    if (estud.elementAt(3).equals("-185")) {%>
<br>    

<table width="90%" border="0" cellspacing="0" cellpadding="0">
<tr>       
<td><b>Nombre: <%=estud.elementAt(1)%></b> <br>
    <b>Programa academico: <%=programa%></b>
    <p>Su solicitud de admisión esta en estudio. Para mayor información
    por favor comuníquese con la Dirección de la Especialización.
    <a href="http://www.escuelaing.edu.co/admisiones/contactos.htm" target="_blank">Contacto</a></b>
</td>
</tr>
</table>
<%}
    if (estud.elementAt(3).equals("-183")) {%>
<br>    

<table width="90%" border="0" cellspacing="0" cellpadding="0">
<tr>           
<td><b>Nombre: <%=estud.elementAt(1)%></b> <br>
    <b>Programa academico: <%=programa%></b>
    <%//if (estud.elementAt(2).equals("288")) {%>
    <!--<p>Su solicitud de ingreso a la Especialización actulamente se encuentra en estudio. Para mayor información
        por favor comuníquese con la Dirección de la Especialización.-->
    <%//} else {%>
    <p>No existe información registrada para este proceso. Para mayor información
    por favor comuníquese con la Dirección de la Especialización.
    <a href="http://www.escuelaing.edu.co/admisiones/contactos.htm" target="_blank">Contacto</a></b>
    <%//}%>
</td>
</tr>
</table>
<%}%>

<%}%>
<%
//sesion = request.getSession(false) ;
//sesion.removeAttribute("idplan");
//sesion.invalidate() ;
%>
</body>
</html>
<%
} else {
%>
<html>
    <body>
        <p>&nbsp;</p>
        <p align="center"><h3><center>Usted no se autentico correctamente o no es un usario autorizado.</center></h3>
    </body>
</html>
<%        }
%>

