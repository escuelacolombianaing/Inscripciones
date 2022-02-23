<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
String docEst = request.getParameter("documento");
String idplan = request.getParameter("idplan");
PrintWriter oout = response.getWriter() ;

configeci.configmaestria confEci = new configeci.configmaestria();

String respadm = "", induccion = "", fecinicio = "", valorniv="", ordenesp="", firmaesp="";
String programa = "", titulo = "", fecordenes = "", fecpagos = "", fecniv = "", firmaniv = "", valortotal = "", creditos = "", valcredito = "";
otros.rutas ruta = new otros.rutas();
BDadmisiones bd= new BDadmisiones();
int val = 0;
int ban = 0;
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

<body bgcolor="#FFFFFF" text="#000000">
<table width="90%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas">
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
            <div align="center"> <font color="#C10000" size="4"><b>ASPIRANTES A LA MAESTRIA EN INGENIERIA CIVIL</b></font> </div>
        </td>
    </tr>
</table>

<%Vector estud = bd.AdmitidosPos(docEst, idplan, confEci.getPeriodo(), oout) ;%>
<%Vector tutor = bd.Tutores(docEst,oout) ;%>
<!%if ((tutor.size()) == 0){
       out.println("No tiene consejero asignado, comuníquese con la Dirección de la Maestría en Ingeniería Civil") ;
    }
%>
<% if((estud.size()) == 0){%>

<table width="95%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas">
    <tr> 
        <td valign="top"> 
            <div align="center">       
                <h3><center> 
                        <p>&nbsp;</p>
                        
                        <p><Su 
                                documento es incorrecto o usted no formaliz&oacute; la solicitud 
                                de admisión para este programa académico. <br>
                                Verifique e intente nuevamente o comuníquese con la Oficina de Admisiones. 
                                <br>
                        Tel&eacute;fono: 6683600 Ext: 274, 263 o 101 </p>
            </center></h3> </div>
        </td>
    </tr>
</table> 
<%}else{%>

<!--Para La respta de ADMITIDOS de QHSE cdo hay dos cohores a la vez se crea cronogramaqhse.txt 
y se valida aqui la cohorte por eje esta es la cohorte 12(2008-1) y el cronograma.txt va la cohorte 11-->
<% String rutas="";

rutas = "cronogramacivil.txt";
String arreglo[]=new String[50];
int i=0, n=1;
int k=0;
try {
    FileReader ra = new FileReader(ruta.valruta() + "posgrados" + ruta.tokenruta() + "cronogramacivil.txt");
//FileReader ra = new FileReader("/usr/local/jakarta-tomcat-3.2.1/confEci/posgrados/cronograma.txt");
    BufferedReader entrada = new BufferedReader(ra);
    String s;
    while((s = entrada.readLine()) != null) {
        arreglo[i]= s;
        i=i+1;
    }
    entrada.close();
    ra.close();%>
<% 
}catch(java.io.FileNotFoundException fnfex) {
    System.out.println("Archivo no encontrado: " + fnfex); 
%>
<p>Archivo no encontrado
<%     }catch(java.io.IOException ioex) { }           	
%>
<%String texto[]=new String[5000];
int ii = 0 ; 
for (int jj=0; jj<i; jj++){
StringTokenizer st = new StringTokenizer(arreglo[jj], "*");
k=0;%>

<%while (st.hasMoreTokens()) { 
texto[k]=st.nextToken();
k=k+1;                 
}%>  

<%if (texto[0].equals(estud.elementAt(2))){ 
// ii = 1 ;                    
Vector estudios = bd.Titulo((String)estud.elementAt(0)) ;
if((estudios.size()) > 0 ) {
for ( int m = 0 ; m < estudios.size() ; m++ ){
Vector estudiosant = (Vector)estudios.elementAt(m) ;
titulo = (String)estudiosant.elementAt(1); 
if (titulo.equals("OTRA"))
titulo = "ASPIRANTE";}
}
programa = texto[1] ;
respadm = texto[9] ;
fecordenes = texto[10] ;
fecpagos = texto[13] ; induccion = texto[14];
firmaniv = texto[15] ; valortotal = texto[22] ;
creditos = texto[19] ; valcredito = texto[20] ;
fecniv = texto[16] ;   fecinicio =  texto[18] ;
valorniv = texto[21] ; ordenesp = texto[11] ;
firmaesp = texto[17] ;
}
}%>

<%//  if (val==0){%>
<% // val = 1;
//}%>

<%if (estud.elementAt(3).equals("-179") && ban==0){%>
<BR>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="textoimpre">
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
<td valign="top" height="1000">
    <p align="justify">En nombre de la Escuela Colombiana de Ingenier&iacute;a 
        Julio Garavito, nos es grato comunicarle que ha sido aprobada su solicitud 
        de admisi&oacute;n a nuestro Programa de <b><%=programa%></b>, para iniciar 
        actividades acad&eacute;micas a partir <b>del <%=fecinicio%></b>. Usted 
        har&aacute; parte de la comunidad acad&eacute;mica de una de las Instituciones 
        de Educaci&oacute;n Superior con mayor prestigio Nacional e Internacional, 
    que le da a usted una cordial bienvenida. </p>
<p>Para dar inicio a su proceso de matr&iacute;cula deber&aacute; tener en 
cuenta lo siguiente:</p>
<p> 
    <%if (estud.elementAt(2).equals("285")) {%>
    La consulta de admitidos estará disponible el día 24 de Junio después de 
    las 10:00a.m 
    <%}%>
    <!--Maestría-->
    <%if (estud.elementAt(2).equals("290") || estud.elementAt(2).equals("291")|| estud.elementAt(2).equals("292") || estud.elementAt(2).equals("293") || estud.elementAt(2).equals("294")) {%>
</p>
    <p><b>1.</b> 
      <!--Cordialmente lo invitamos a una reuni&oacute;n informativa sobre 
      aspectos generales de la maestr&iacute;a en Ingenier&iacute;a Civil, resolver inquietudes sobre los procesos 
      administrativos y opciones de Financiaci&oacute;n Educativa el 25 de Julio en el sal&oacute;n D111 
      a las 8:00 a.m.-->
      Su consejero Académico será el <b>Ing.<!%=tutor.elementAt(1)%></b>, correo
      electrónico:<!%=tutor.elementAt(3)%>, con quien deberá acordar la propuesta
      de las asignaturas que conformarán su plan de estudios, durante los días 
      *********, para efectos de liquidación de la orden de matrícula
      correspondiente al segundo periodo de 2010.
      <!--El director del énfasis enviará por correo electrónico
    sugerencias para su registro académico basados en los intereses que usted manifestó en la entrevista y su
    disponibilidad horaria.-->
      <b><%=ordenesp%></b> podrá pagar los derechos de matrícula o imprimir su orden
      siguiendo los pasos mencionados en este enlace <a href="http://www.escuelaing.edu.co/documentos/manualnuevos.pdf">manual
      de pagos en línea.</a>
    <p> Para quienes hayan obtenido un título de postgrado de la Escuela Colombiana 
      de Ingeniería y deseen solicitar homologación de asignaturas, deberán entregar 
      por escrito dicha solicitud dirigida al Director de la Maestría, a más tardar 
      el ******* indicando la lista de asignaturas cuya homologación se solicita.
    <p> 
    <li><b>Pagos</b>: El valor de cada per&iacute;odo es directamente proporcional 
      al n&uacute;mero de cr&eacute;ditos y se debe pagar a su inicio, previa 
      entrega de la orden de pago.
      <!-- El valor total de la Maestría
es de <b><!%=valortotal%></b> correspondiente a <b><!%=creditos%></b> cr&eacute;ditos. -->
    </li>
<blockquote> 
    <p>El pago extraordinario tiene un recargo del 5%.</p>
    <p><b>Valor del cr&eacute;dito: <%=valcredito%>.oo</b></p>
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
    <p align="justify">La matr&iacute;cula es el acto voluntario de una 
        persona natural mediante el cual se adquiere la calidad de estudiante 
        de la Escuela Colombiana de Ingenier&iacute;a, previo el cumplimiento 
        de todos los requisitos se&ntilde;alados para la misma. Mediante este 
        acto, el estudiante se compromete a cumplir el reglamento y las dem&aacute;s 
        normas establecidas por la Instituci&oacute;n y por el Estado y adquiere 
    el derecho a cursar el programa de formaci&oacute;n previsto.</P>
</li>
<li> 
    <p align="justify">La matr&iacute;cula formaliza el acceso a los derechos 
        del estudiante y a los deberes que de ellos se desprenden. Especialmente 
        significa que el estudiante comparte los postulados contenidos en 
    la Declaraci&oacute;n de Principios de la Escuela.</P>
</li> 
<li> 
    <p align="justify">La matr&iacute;cula la legaliza el estudiante con 
    su firma, para lo cual deber&aacute; presentarse entre el <b><%=firmaesp%></b> 
    en la Oficina de Secretar&iacute;a General, Primer piso, Bloque A 
    con el comprobante de pago de los derechos de matr&iacute;cula. Una 
    vez haya firmado, ser&aacute; carnetizado como estudiante de la Maestría. 
</li>
        <li>Inicio de clases de la Maestría: <b><%=fecinicio%></b>.</li>        <li>Inducción: <b><%=induccion%> </b>.</li>
</ul>
<p></p>
</blockquote>
<p align="justify">Sea usted bienvenido a la Escuela Colombiana de Ingenier&iacute;a 
y a la <b><%=programa%></b></p>
<p>Cordialmente,</p>
<p>Direcci&oacute;n Maestría </p>

<p>Para mayor informaci&oacute;n:</p>
<p>Dr. Germán Santos Granados <br>
    Director <a href="mailto: maestriacivil@escuelaing.edu.co">maestriacivil@escuelaing.edu.co</a> 
    <br>
    <a href="mailto: german.santos@escuelaing.edu.co">german.santos@escuelaing.edu.co</a> 
    Teléfono. 668 3600, exts. 164 y 147<br>
    </p>
<%}

} 
if (estud.elementAt(3).equals("-181")){%>

<br>

<table width="90%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas">
    <tr> 
        
        <td><b>Nombre: <%=estud.elementAt(1)%></b> 
            <br>
            <b>Programa Acad&eacute;mico: <%=programa%></b> 
            <p>Una vez estudiada su hoja de vida acad&eacute;mica, profesional y laboral, resultados de la entrevista, 
                as&iacute; como otros aspectos del proceso de selecci&oacute;n, lamentamos 
                informarle que la Direcci&oacute;n de la Maestría conceptu&oacute; 
                no aprobar su solicitud de admisi&oacute;n.  No obstante lo anterior le agradecemos que haya escogido 
                la Escuela como una opci&oacute;n 
                    para adelantar sus estudios de posgrado y esperamos que haya una pr&oacute;xima 
                    oportunidad para contar con usted como miembro de nuestra comunidad 
                acad&eacute;mica.
                <p> Si desea mayor informaci&oacute;n al respecto por favor 
                comuníquese con la Dirección de la Maestría.<b>
                <p>Dr. Germán Santos Granados <br>
                Director <a href="mailto: maestriacivil@escuelaing.edu.co">maestriacivil@escuelaing.edu.co</a> 
                <br>
                <a href="mailto: german.santos@escuelaing.edu.co">german.santos@escuelaing.edu.co</a> 
                Teléfono. 668 3600, exts. 164 y 147<br></a>
            </p>
            <b> </b> 
        </td>
    </tr>
</table>
<%}
if (estud.elementAt(3).equals("-185")){%>
<br>    

<table width="90%" border="0" cellspacing="0" cellpadding="0" class="textoimpremas">
<tr>       
<td><b>Nombre: <%=estud.elementAt(1)%></b> <br>
    <b>Programa academico: <%=programa%></b>
    <p>Su solicitud de admisión esta en estudio. Para mayor información 
    por favor comuníquese con la Dirección de la Maestría.<b> 
    <p>Dr. Germán Santos Granados <br>
    Director <a href="mailto: maestriacivil@escuelaing.edu.co">maestriacivil@escuelaing.edu.co</a> 
    <br>
    <a href="mailto: german.santos@escuelaing.edu.co">german.santos@escuelaing.edu.co</a> 
    Teléfono. 668 3600, exts. 164 y 147<br></a>
</td>
</tr>
</table>
<%}
}
}
%>
