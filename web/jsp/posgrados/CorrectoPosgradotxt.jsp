<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%
String ref;
String nsol = request.getParameter("nsol");
String nombre = request.getParameter("nombre");
String plan = request.getParameter("plan");
String programa = "";
otros.rutas ruta = new otros.rutas();
%>

<html>
    <head>
        <title>Formulario Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
   </script>
    </head>
    <body>
        <%
        String arreglo[]=new String[5000];
        String texto[]=new String[5000];
        int i=0, n=1;
        int k=0;
        try {
            // FileReader ra = new FileReader("../confEci/especializacion.txt");
            FileReader ra = new FileReader(ruta.valruta() + "posgrados" + ruta.tokenruta() + "cronograma.txt");
            // FileReader ra = new FileReader("/usr/local/jakarta-tomcat-3.2.1/confEci/posgrados/cronograma.txt");
            BufferedReader entrada = new BufferedReader(ra);
            String s;
            while((s = entrada.readLine()) != null) {
                arreglo[i]= s;
                i=i+1;
            }
            entrada.close();
            ra.close();
        
        %>
        <% 
        }catch(java.io.FileNotFoundException fnfex) {
            System.out.println("Archivo no encontrado: " + fnfex); 
        %>
        <p>Archivo no encontrado
        <%     }catch(java.io.IOException ioex) { }
        
        
        
        String  fecfinal = "", citentrev = "", fecentrev = "", fecadmin = "", examen = "";
        for (int j=0; j<i; j++){
            StringTokenizer st = new StringTokenizer(arreglo[j], "*");
            k=0;%>
        
        <%while (st.hasMoreTokens()) { 
        texto[k]=st.nextToken();
        k=k+1;                 
        }%>  
        
        <%if (texto[0].equals(plan)){ 
        j=i-1;              
        programa = texto[1]; examen = texto[7];				
        fecfinal = texto[4];
        citentrev = texto[5];								
        fecentrev = texto[6];
        fecadmin = texto[9];  																					
        %> 
        
        <%}%>
        
        <%}%>
        <table width="90%" border="0" class="textoimpre">
            <tr> 
                <td width="19%" height="69"><img src="img/logo.gif" width="83" height="90"></td>
                <td width="2%" height="69">&nbsp;</td>
                <td width="79%" height="69"> 
                    <div align="center"> 
                        <p><b><font color="#CC0000">ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
                        JULIO GARAVITO</font></b></p>
                        <p><b>SOLICITUD DE ADMISI&Oacute;N A LOS PROGRAMAS ACAD&Eacute;MICOS DE 
                            POSGRADO</b><br>
                        </p>
                    </div>
                </td>
            </tr>
        </table>
        <br>
        <table width="90%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top"> 
                    <p align="left"><big><strong>Estimado Aspirante: Muchas Gracias. Su información 
                    ya ha ingresado a nuestro sistema.</strong> </big></p>
                    <p align="left"><b>Usted esta preinscrito al programa: </b><%=programa%>. 
                    </p>
                    <p align="left"> <b>Preinscripci&oacute;n No: <%=nsol%></b><br>
                    <b>Nombre del aspirante: <%=nombre.toUpperCase()%> </b></p>
                    <ol>
                        <li> <b>Para formalizar la inscripci&oacute;n, debe presentar un conjunto 
                                de documentos detallados m&aacute;s adelante, en la oficina de Admisiones 
                                Bloque A, primer piso de 8:00a.m a 1:00 p.m y de 2:00 p.m a 4:00 p.m, 
                        y a m&aacute;s tardar el <%=fecfinal%> as&iacute;:</b></li>
                    </ol>
                    <ul>
                        <li>Formulario impreso, diligenciado vía web.</li>
                        <li>Carta de presentaci&oacute;n del aspirante</li>
                        <li>Dos fotografias recientes de 3cm x 4cm, fondo azul (Pegar una foto 
                        en la carta de presentaci&oacute;n)</li>
                        <li>Fotocopia aut&eacute;ntica del diploma que acredite el grado profesional</li>
                        <li>Certificado oficial de las calificaciones obtenidas en pregrado, que incluya el promedio de la carrera.</li>
                        <li>Hoja de vida</li>
                        <!--<li>Ensayo <font size="3">sobre intereses acad&eacute;micos y profesionales 
    y planes futuros, &uacute;nicamente para la Especializaci&oacute;n en Estructuras</font></li>-->
                        <li>Dos recomendaciones, preferiblemente de profesores del &aacute;rea 
                            o jefes inmediatos. (Los formatos deben ir en un sobre sellado por quien 
                            recomienda con firma de seguridad en el cierre y marcado con el nombre 
                        del aspirante y el nombre del programa al cual aspira ). </li>
                        <a href="http://www.escuelaing.edu.co/documentos/cartareferencia2007.pdf" target="_blank">Utilice 
                        este formato</a> 
                        <li>Fotocopia del documento de identidad</li>
                        <li>Fotocopia de la Tarjeta Profesional (Unicamente para Ingenieros)</li>
                        <li>Fotocopia del carn&eacute; de la EPS</li>
                        <li>Fotocopia de la Libreta Militar</li>
                        <li>Comprobante de pago de la solicitud de admisi&oacute;n con el correspondiente 
                        timbre o sello del cajero. </li>
                        <li>Si es aspirante a la <b>Especializaci&oacute;n de Estructuras</b> 
                            debe adjuntar un <b>ensayo</b> entre 500 y 1000 palabras indicando intereses 
                            acad&eacute;micos y profesionales, razones para adelantar la especializaci&oacute;n 
                            y planes futuros. Adicionalmente debe diligenciar el formato de preinscripci&oacute;n 
                            de asignaturas. (<a href="http://www.escuelaing.edu.co/documentos/inscrip_asig_estructuras.pdf" target="_blank">Ver 
                        formato aqu&iacute;</a>).</li>
                    </ul>
                    <!--Especializacion en Gerencia -->
                    <%if (plan.equals("287")){%>
                    <ol start="2">
                        <li> Presentar examen de admisi&oacute;n y entrevista:</li>
                    </ol>
                    <ul>
                        <li><b>Fecha, hora y sitio del Examen de Admisi&oacute;n</b>: <%=examen%>. En el examen se evaluar&aacute;n conceptos b&aacute;sicos 
                            sobre proyectos, manejo b&aacute;sico de Excel e ingl&eacute;s (lectura, 
                        comprensi&oacute;n y escritura).</li>
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n 
                            entre el <%=fecentrev%>. A partir del d&iacute;a <%=citentrev%>; podr&aacute; consultar en la P&aacute;gina Web de la Escuela, 
                            en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot; de la <b>&quot;<%=programa%>&quot;</b>con 
                            el n&uacute;mero de su documento de identidad, la fecha, hora y el lugar 
                            de las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente 
                            con la se&ntilde;ora Sonia Hern&aacute;ndez o con el Ingeniero Daniel 
                        Salazar en las extensiones 103 o 337, respectivamente.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de 
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina 
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot; 
                            de la &quot;<b><%=programa%>&quot;, </b> a partir del d&iacute;a <%=fecadmin%><font color="#000000">, 
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento 
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la 
                        Especializaci&oacute;n, Sala de Profesores Bloque C, segundo piso o comunicarse 
                        telef&oacute;nicamente al 6683600, ext. 103 o 337 o al e-mail <a href="mailto:daniel.salazar@escuelaing.edu.co">daniel.salazar@escuelaing.edu.co</a><br>
                    </p>
                    <%}%>
                    <p> 
                        <!--Especializacion en Estructuras -->
                        <%if (plan.equals("312")){%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li>El Comit&eacute; del Programa estudiar&aacute; cada solicitud, y si 
                            lo encuentra necesario, citar&aacute; a los candidatos a entrevista 
                            el <%=citentrev%> para lo cual podr&aacute; consultar con el n&uacute;mero 
                            de su documento de identidad en la P&aacute;gina Web de la Escuela, 
                            en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot; de la <b> &quot;<%=programa%>&quot;</b>, la fecha, hora y el lugar de las mismas. Esta tambi&eacute;n podr&aacute; 
                            ser consultada telef&oacute;nicamente con la Ingeniera Sandra Aguilar 
                            o con el Ingeniero Pedro Nel Quiroga en el 6683600 extensiones 230 o 
                        267 respectivamente.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de 
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina 
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot; 
                            de la &quot;<b><%=programa%>&quot;, </b> a partir del d&iacute;a <%=fecadmin%><font color="#000000">, 
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento 
                        de identidad</font>.</li>
                    </ul>
                    <p>Nota: Informaci&oacute;n adicional en la Direcci&oacute;n de la Especializaci&oacute;n, 
                        Oficina Edificio L-1 o comunicarse telef&oacute;nicamente al 6683600 extensi&oacute;n 
                    230 o 267 o al e-mail: <a href="mailto:pquiroga@escuelaing.edu.co">pquiroga@escuelaing.edu.co</a></p>
                    <%}%>
                    <p> 
                        <!--Especializacion en Saneamiento -->
                        <%if (plan.equals("129")){%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li>El Comit&eacute; del Programa estudiar&aacute; cada solicitud, y si 
                            lo encuentra necesario, citar&aacute; a los candidatos a entrevista 
                            el <%=fecentrev%>. A partir del dia <%=citentrev%>, podr&aacute; consultar 
                            con el n&uacute;mero de su documento de identidad en la P&aacute;gina 
                            Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot; 
                            de la <b> &quot;<%=programa%>&quot;</b>, la fecha, hora y el lugar de 
                            las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente 
                            con la se&ntilde;ora Argenis Meneses en el 6683600 extensi&oacute;n 
                        283.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de 
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina 
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot; 
                            de la &quot;<b><%=programa%>&quot;, </b> a partir del d&iacute;a <%=fecadmin%><font color="#000000">, 
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento 
                        de identidad</font>.</li>
                    </ul>
                    <p>Nota: Informaci&oacute;n adicional en la Direcci&oacute;n de la Especializaci&oacute;n, 
                        Oficina Edificio L-1 o comunicarse telef&oacute;nicamente al 6683600 extensi&oacute;n 
                    268 o al e-mail: <a href="mailto:mvillega@escuelaing.edu.co">mvillega@escuelaing.edu.co</a><a href="mailto:pquiroga@escuelaing.edu.co"></a></p>
                    <%}%>
                    <p> 
                        <!--Especializacion en Recursos Hidraulicos-->
                        <%if (plan.equals("310")){%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li>El Comit&eacute; del Programa estudiar&aacute; cada solicitud, y si 
                            lo encuentra necesario, citar&aacute; a los candidatos a entrevista 
                            el <b><%=fecentrev%></b>. A partir del dia <b><%=citentrev%></b>, podr&aacute; 
                            consultar con el n&uacute;mero de su documento de identidad en la P&aacute;gina 
                            Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot; 
                            de la <b>&quot;<%=programa%>&quot;,</b> la fecha, hora y el lugar de 
                            las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente 
                        con Jakeline Casta&ntilde;eda P&eacute;rez extensi&oacute;n 218.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de 
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina 
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot; 
                            de la &quot;<b><%=programa%>&quot;, </b> a partir del d&iacute;a <%=fecadmin%><font color="#000000">, 
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento 
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la 
                        Especializaci&oacute;n, <a href="mailto:german.acero@escuelaing.edu.co">german.acero@escuelaing.edu.co</a><br>
                    <a href="mailto:pedro.quiroga@escuelaing.edu.co"></a></p>
                    <%}%>
                    <p> 
                        <!--Especializacion en  Vias-->
                        <%if (plan.equals("267")){%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n 
                            entre el <%=fecentrev%>. A partir del d&iacute;a <%=citentrev%> podr&aacute; 
                            consultar con el n&uacute;mero de su documento de identidad en la P&aacute;gina 
                            Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot; 
                            de la <b>&quot;<%=programa%>&quot;, </b> la fecha, hora y el lugar de 
                            las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente 
                            en la direcci&oacute;n de la Especializaci&oacute;n, en las extensiones 
                        238 y 114.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de 
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina 
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot; 
                            de la &quot;<b><%=programa%>&quot;, </b> a partir del d&iacute;a <%=fecadmin%><font color="#000000">, 
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento 
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la 
                        Especializaci&oacute;n, <font size="2"><a href="mailto:afguzman@escuelaing.edu.co"><font size="3">afguzman@escuelaing.edu.co</font></a></font>.<br>
                    </p>
                    <%}%>
                    <p> 
                        <!--Especializacion en  Economía-->
                        <%if (plan.equals("313")){%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n 
                            entre el <%=fecentrev%>. A partir del d&iacute;a <%=citentrev%> podr&aacute; 
                            consultar con el n&uacute;mero de su documento de identidad en la P&aacute;gina 
                            Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot; 
                            de la <b>&quot;<%=programa%>&quot;, </b> la fecha, hora y el lugar de 
                            las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente 
                        con Oscar Benavides en la extensi&oacute;n 374.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de 
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina 
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot; 
                            de la &quot;<b><%=programa%>&quot;, </b> a partir del d&iacute;a <%=fecadmin%><font color="#000000">, 
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento 
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la 
                        Especializaci&oacute;n, Bloque C segundo piso o comunicarse telef&oacute;nicamente 
                        al 6683600 - 6763888, Ext. 218, 274 y 292 o al e-mail: <a href="mailto:esarmien@escuelaing.edu.co">esarmien@escuelaing.edu.co</a><br>
                    </p>
                    <%}%>
                    <p> 
                        <!--Especializacion en  Telematica-->
                        <%if (plan.equals("288")){%>
                    </p>
                    <ol start="2">
                        <li> Presentar examen de admisi&oacute;n y entrevista</li>
                    </ol>
                    <ul>
                        <li><b>Fecha, hora y sitio del Examen de Admisi&oacute;n</b>: Se realizara 
                            el <%=examen%>. En el examen se evaluar&aacute;n conceptos b&aacute;sicos 
                            sobre los contenidos program&aacute;ticos m&iacute;nimos de los cursos 
                        nivelatorios, puede ver los contenidos <a href="http://www.escuelaing.edu.co/programas/especializacion/telematica/contenido.htm" target="_blank">aqu&iacute;</a>.</li>
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n 
                             del <%=fecentrev%>. A partir del d&iacute;a <%=citentrev%> podr&aacute; 
                            consultar en la P&aacute;gina Web de la Escuela, en la secci&oacute;n: 
                            &quot;<b>Entrevistas</b>&quot; de la <b>&quot;<%=programa%>&quot; </b>con 
                            el n&uacute;mero de su documento de identidad, la fecha, hora y el lugar 
                            de las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente 
                            con la secretaria de la Especializaci&oacute;n, Angelica Botias en la 
                        extensi&oacute;n 362.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de 
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina 
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot; 
                            de la &quot;<b><%=programa%>&quot;, </b> a partir del d&iacute;a <%=fecadmin%><font color="#000000">, 
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento 
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la 
                        Especializaci&oacute;n, Sala de Profesores Bloque C, segundo piso o comunicarse 
                        telef&oacute;nicamente al 6683600, ext. 362 o 377 o al e-mail: <a href="mailto:gteuta@escuelaing.edu.co">gteuta@escuelaing.edu.co</a><br>
                    </p>
                    <%}%>
                    <p> 
                        <!--Especializacion en  QHSE-->
                        <%if (plan.equals("370")){%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n 
                            del <b><%=fecentrev%></b>. A partir del d&iacute;a <b><%=citentrev%></b> 
                            podr&aacute; consultar con el n&uacute;mero de su documento de identidad 
                            en la P&aacute;gina Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot; 
                            de la <b>&quot;<%=programa%>&quot;, </b>la fecha, hora y el lugar de 
                        las mismas. </li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de 
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina 
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot; 
                            de la &quot;<b><%=programa%>&quot;, </b> a partir del d&iacute;a <b><%=fecadmin%></b><font color="#000000">, 
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento 
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la 
                        Especializaci&oacute;n, <a href="mailto:espeqhse@escuelaing.edu.co">espeqhse@escuelaing.edu.co</a><br>
                    </p>
                    <%}%>
                    <p>
                        <!--Especializacion en  Fundaciones-->
                        <%if (plan.equals("281")){%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n 
                            del <b><%=fecentrev%></b>. A partir del d&iacute;a <b><%=citentrev%></b> 
                            podr&aacute; consultar con el n&uacute;mero de su documento de identidad 
                            en la P&aacute;gina Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot; 
                            de la <b>&quot;<%=programa%>&quot;, </b>la fecha, hora y el lugar de 
                        las mismas. </li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de 
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina 
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot; 
                            de la &quot;<b><%=programa%>&quot;, </b> a partir del d&iacute;a <b><%=fecadmin%></b><font color="#000000">, 
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento 
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la 
                        Especializaci&oacute;n, <a href="mailto:jedurang@escuelaing.edu.co">jedurang@escuelaing.edu.co</a><br>
                    </p>
                    <%}%>
                    <p>Con el fin de facilitar la entrega de documentos de nuestros aspirantes 
                        que se inscriben a traves de nuestra P&aacute;gina Web, la Escuela pone 
                        a su disposici&oacute;n el servicio de mensajer&iacute;a a trav&eacute;s 
                        de la empresa Enlace Service - Alfamensajes.
                </td>
            </tr>
        </table><br>
        <table width="90%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td><form>
                        <p align="center"> 
                            <center>
                                <INPUT type=button name=print value="Imprimir" onClick="javascript:window.print()">
                                &nbsp;&nbsp; 
                                <input type="button" value="Cerrar ventana" onclick="window.close()">
                            </center>
                        </p>
                </form></td>
            </tr>
        </table>
        
        
    </body>
</html>

