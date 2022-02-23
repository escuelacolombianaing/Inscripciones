<%-- 
    Document   : CorrectoPosgradotxt
    Created on : 16/07/2010, 09:01:32 AM
    Author     : lrodriguez
--%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%
        //configeci.configuracion confEci = new configeci.configuracion();
    configeci.configPosgrados confEci = new configeci.configPosgrados();
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        String ref;
        String nsol = request.getParameter("nsol");
        String nombre = request.getParameter("nombre");
        String idplan = request.getParameter("plan");
        String prog = "";
        Vector cronograma = new Vector();
        if (idplan.equals("370")){
             cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);

            }else{
              cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
            }
       // Vector cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);

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
        if (idplan.equals("291")) {
        prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN INGENIERIA ESTRUCTURAL";
    }
    if (idplan.equals("292")) {
        prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN INGENIERIA AMBIENTAL";
    }
    if (idplan.equals("293")) {
        prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN GEOTECNIA- MODALIDAD DE PROFUNDIZACIÓN";
    }
    if (idplan.equals("294")) {
        prog = "MAESTRIA EN ING CIVIL CON ENFASIS EN TRANSITO Y TRANSPORTE - MODALIDAD DE PROFUNDIZACIÓN";
    }
    if (idplan.equals("353")) {
        prog = "MAESTRIA EN GESTIÓN DE INFORMACIÓN";
    }
    if (idplan.equals("332")) {
        prog = "MAESTRÍA EN INGENIERÍA ELECTRÓNICA MODALIDAD DE PROFUNDIZACION";
    }
    
    if (idplan.equals("333")) {
        prog = "MAESTRÍA EN INGENIERÍA ELECTRÓNICA MODALIDAD DE INVESTIGACION";
    }
    if (idplan.equals("351")) {
        prog = "MAESTRÍA EN  DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
    }
    if (idplan.equals("330")) {
        prog = "MAESTRÍA EN  INGENIERIA INDUSTRIAL";
    }
     if (idplan.equals("335")) {
        prog = "MAESTRÍA EN INGENIERÍA ELECTRICA MODALIDAD DE PROFUNDIZACION";
    }
     
     if (idplan.equals("336")) {
        prog = "MAESTRÍA EN INGENIERÍA ELECTRICA MODALIDAD DE INVESTIGACION";
    }
     if (idplan.equals("371")) {
        prog = "MAESTRÍA EN INFORMÁTICA";
    }
     if (idplan.equals("372")) {
        prog = "MAESTRÍA EN CIENCIAS ACTUARIALES";
    }
     if (idplan.equals("376")) {
        prog = "MAESTRÍA EN CIENCIA DE DATOS MODALIDAD DE PROFUNDIZACIÓN";
    }
    if (idplan.equals("377")) {
        prog = "MAESTRÍA EN CIENCIA DE DATOS MODALIDAD DE INVESTIGACIÓN";
    }
    
%>
<html>
    <head>
        <title>Formulario Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
        </script>
    </head>
    <body>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Solicitud de Admisión a los programas académicos de Posgrado" />
        </jsp:include>
        <br>
        <table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" class="textoimpremas">
            <tr>
                <td valign="top">
                    <p align="left"><big><strong>Estimado Aspirante: Muchas Gracias. Su información
                    ya ha ingresado a nuestro sistema.</strong> </big></p>
                    <p align="left"><b>Usted esta preinscrito al programa: </b><%=prog%>.
                    </p>
                    <p align="left"> <b>Preinscripci&oacute;n No: <%=nsol%></b><br>
                    <b>Nombre del aspirante: <%=nombre.toUpperCase()%> </b></p>
                    <ol>
                        
        <li> <b>Para formalizar la inscripci&oacute;n, debe 
          <!--presentar -->
          cargar en un documento .pdf, el conjunto de documentos detallados m&aacute;s 
          adelante, a trav&eacute;s del siguiente <a href="ValidaPos">LINK</a> 
          <!--en 
          la oficina de Admisiones Bloque A, primer piso de 8:00a.m a 1:00 p.m 
          y de 2:00 p.m a 4:00 p.m, -->
          y a m&aacute;s tardar el <%=cronograma.elementAt(4)%>. <br>
                                <%  if (idplan.equals("374")) {%>
                        <a href="http://www.escuelaing.edu.co/programas/posgrados/esp/desarrollo_proyec/inscripcion_admision.htm">CONSULTE AQUI</a></b></li>
                    </ol>
                    <%} else {%>
      <ul>
        <li><font color="#000000" >Formulario impreso con fotografía a color 3x4cm.</font></li>
        <li><font color="#000000" >Carta de presentaci&oacute;n del aspirante 
          (1 p&aacute;gina m&aacute;ximo)</font></li>
        <li><font color="#000000" >Hoja de vida resumida (2 p&aacute;ginas m&aacute;ximo 
          y sin anexos)</font></li>
        <li><font color="#000000" >Fotocopia del documento de identidad ampliada 
          al 150%.</font></li>
        <li><font color="#000000" >Fotocopia de la tarjeta profesional de ingeniero 
          o certificado de que se encuentra en tr&aacute;mite</font></li>
        <li><font color="#000000" >Fotocopia legible del diploma o del acta de 
          grado que acredite el grado profesional del aspirante</font></li>
        <li><font color="#000000" > Fotocopia del certificado de notas de las 
          calificaciones de pregrado que incluya el promedio de la carrera.</font></li>
        <li>Dos cartas de recomendaci&oacute;n <a href="ReferenciasPos">ver formato 
          aqu&iacute;</a>, preferiblemente de profesores del &aacute;rea o jefes 
          inmediatos. </li>
        <li>Si es aspirante a la <b>Especializaci&oacute;n de Estructuras</b> 
          debe adjuntar un <b>ensayo</b> entre 500 y 1000 palabras indicando intereses 
          acad&eacute;micos y profesionales, razones para adelantar la especializaci&oacute;n 
          y planes futuros.
          <!--Adicionalmente debe diligenciar el formato de preinscripci&oacute;n
                            de asignaturas. (<a href="http://www.escuelaing.edu.co/documentos/inscrip_asig_estructuras.pdf" target="_blank">Ver
                        formato aqu&iacute;</a>)-->
          .</li>
      </ul>
      <%}%>
                    <!--Especializacion en Gerencia -->
                    <%if (idplan.equals("374")) {%>
                    <ol start="2">
                        <li> Presentar examen de admisi&oacute;n y entrevista:</li>
                    </ol>
                    <ul>
                        <li><b>Fecha, hora y sitio del Examen de Admisi&oacute;n</b>: <%=cronograma.elementAt(9)%>. En el examen se evaluar&aacute;n competencias personales.</li>
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n
                            del <%=cronograma.elementAt(8)%>. A partir del d&iacute;a <%=cronograma.elementAt(7)%>; podr&aacute; consultar en la P&aacute;gina Web de la Escuela,
                            en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot; de la <b>&quot;<%=prog%>&quot;</b>con
                            el n&uacute;mero de su documento de identidad, la fecha, hora y el lugar
                            de las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente
                            con la se&ntilde;ora Sonia Hern&aacute;ndez o con el Ingeniero Daniel
                        Salazar en las extensiones 103 o 337, respectivamente.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot;
                            de la &quot;<b><%=prog%>&quot;, </b> a partir del d&iacute;a <%=cronograma.elementAt(10)%><font color="#000000">,
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la
                        Especializaci&oacute;n, o comunicarse
                        telef&oacute;nicamente al 6683600, ext. 103 o 337 o al e-mail <a href="mailto:fredy.carreno@escuelaing.edu.co">fredy.carreno@escuelaing.edu.co</a><br>                    </p>
                    <%}%>
                    <p>
                        <!--Especializacion en Estructuras -->
                        <%if (idplan.equals("312")) {%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li>El Comit&eacute; del Programa estudiar&aacute; cada solicitud, y si
                            lo encuentra necesario, citar&aacute; a los candidatos a entrevista
                            del <%=cronograma.elementAt(7)%>para lo cual podr&aacute; consultar con el n&uacute;mero
                            de su documento de identidad en la P&aacute;gina Web de la Escuela,
                            en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot; de la <b> &quot;<%=prog%>&quot;</b>, la fecha, hora y el lugar de las mismas. Esta tambi&eacute;n podr&aacute;
                            ser consultada telef&oacute;nicamente con el Ingeniero Pedro Nel Quiroga
                            en el 6683600 extensiones 230 o 267 respectivamente.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot;
                            de la &quot;<b><%=prog%>&quot;, </b> a partir del d&iacute;a <%=cronograma.elementAt(10)%><font color="#000000">,
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento
                        de identidad</font>.</li>
                    </ul>
                    <p>Nota: Informaci&oacute;n adicional en la Direcci&oacute;n de la Especializaci&oacute;n,
                        Oficina Edificio L-1 o comunicarse telef&oacute;nicamente al 6683600 extensi&oacute;n
                    230 o 267 o al e-mail: <a href="mailto:pquiroga@escuelaing.edu.co">pquiroga@escuelaing.edu.co</a></p>
                    <%}%>
                    <p>
                        <!--Especializacion en Saneamiento -->
                        <%if (idplan.equals("309")) {%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li>El Comit&eacute; del Programa estudiar&aacute; cada solicitud, y si
                            lo encuentra necesario, citar&aacute; a los candidatos a entrevista
                            del <%=cronograma.elementAt(8)%>. A partir del dia <%=cronograma.elementAt(4)%>, podr&aacute; consultar
                            con el n&uacute;mero de su documento de identidad en la P&aacute;gina
                            Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot;
                            de la <b> &quot;<%=prog%>&quot;</b>, la fecha, hora y el lugar de
                            las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente
                            con la se&ntilde;ora Argenis Meneses en el 6683600 extensi&oacute;n
                        283.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot;
                            de la &quot;<b><%=prog%>&quot;, </b> a partir del d&iacute;a <%=cronograma.elementAt(10)%><font color="#000000">,
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento
                        de identidad</font>.</li>
                    </ul>
                    <p>Nota: Informaci&oacute;n adicional en la Direcci&oacute;n de la Especializaci&oacute;n,
                        Oficina Edificio L-1 o comunicarse telef&oacute;nicamente al 6683600 extensi&oacute;n
                    268 o al e-mail: <a href="mailto:mvillega@escuelaing.edu.co">mvillega@escuelaing.edu.co</a><a href="mailto:pquiroga@escuelaing.edu.co"></a></p>
                    <%}%>
                    <p>
                        <!--Especializacion en Recursos Hidraulicos-->
                        <%if (idplan.equals("310")) {%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li>El Comit&eacute; del Programa estudiar&aacute; cada solicitud, y si
                            lo encuentra necesario, citar&aacute; a los candidatos a entrevista
                            del  <b><%=cronograma.elementAt(8)%></b>. A partir del dia <b><%=cronograma.elementAt(7)%></b>, podr&aacute;
                            consultar con el n&uacute;mero de su documento de identidad en la P&aacute;gina
                            Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot;
                            de la <b>&quot;<%=prog%>&quot;,</b> la fecha, hora y el lugar de
                            las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente
                        con Angélica Botias en la extensi&oacute;n 218.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot;
                            de la &quot;<b><%=prog%>&quot;, </b> a partir del d&iacute;a <%=cronograma.elementAt(10)%><font color="#000000">,
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la
                        Especializaci&oacute;n, <a href="mailto:german.acero@escuelaing.edu.co">german.acero@escuelaing.edu.co</a><br>
                    <a href="mailto:pedro.quiroga@escuelaing.edu.co"></a></p>
                    <%}%>
                    <p>
                        <!--Especializacion en  Vias-->
                        <%if (idplan.equals("267")) {%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n
                            del <%=cronograma.elementAt(8)%>. A partir del d&iacute;a <%=cronograma.elementAt(7)%> podr&aacute;
                            consultar con el n&uacute;mero de su documento de identidad en la P&aacute;gina
                            Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot;
                            de la <b>&quot;<%=prog%>&quot;, </b> la fecha, hora y el lugar de
                            las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente
                            en la direcci&oacute;n de la Especializaci&oacute;n, en las extensiones
                        238 y 114.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot;
                            de la &quot;<b><%=prog%>&quot;, </b> a partir del d&iacute;a <%=cronograma.elementAt(10)%><font color="#000000">,
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la
                        Especializaci&oacute;n, <font size="2"><a href="mailto:afguzman@escuelaing.edu.co"><font size="3">afguzman@escuelaing.edu.co</font></a></font>.<br>
                    </p>
                    <%}%>
                    <p>
                        <!--Especializacion en  Economía-->
                        <%if (idplan.equals("313")) {%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul> 
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n
                            del <%=cronograma.elementAt(8)%>. A partir del d&iacute;a <%=cronograma.elementAt(7)%> podr&aacute;
                            consultar con el n&uacute;mero de su documento de identidad en la P&aacute;gina
                            Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot;
                            de la <b>&quot;<%=prog%>&quot;, </b> la fecha, hora y el lugar de
                            las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente
                        con Oscar Benavides en la extensi&oacute;n 374.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot;
                            de la &quot;<b><%=prog%>&quot;, </b> a partir del d&iacute;a <%=cronograma.elementAt(10)%><font color="#000000">,
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
                        <%if (idplan.equals("324")) {%>
                    </p>
                    <ol start="2">
                        <li> Presentar examen de admisi&oacute;n y entrevista</li>
                    </ol>
                    <ul>
                        <li><b>Fecha, hora y sitio del Examen de Admisi&oacute;n</b>: Se realizara
                            el <%=cronograma.elementAt(9)%>. En el examen se evaluar&aacute;n conceptos b&aacute;sicos
                            sobre los contenidos program&aacute;ticos m&iacute;nimos de los cursos
                        nivelatorios, puede ver los contenidos <a href="http://www.escuelaing.edu.co/programas/especializacion/telematica/contenido.htm" target="_blank">aqu&iacute;</a>.</li>
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n
                            del <%=cronograma.elementAt(8)%>. A partir del d&iacute;a <%=cronograma.elementAt(7)%> podr&aacute;
                            consultar en la P&aacute;gina Web de la Escuela, en la secci&oacute;n:
                            &quot;<b>Entrevistas</b>&quot; de la <b>&quot;<%=prog%>&quot; </b>con
                            el n&uacute;mero de su documento de identidad, la fecha, hora y el lugar
                            de las mismas. Esta tambi&eacute;n podr&aacute; ser consultada telef&oacute;nicamente
                            con la secretaria de la Especializaci&oacute;n, Angelica Botias en la
                        extensi&oacute;n 362.</li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot;
                            de la &quot;<b><%=prog%>&quot;, </b> a partir del d&iacute;a <%=cronograma.elementAt(10)%><font color="#000000">,
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la
                        Especializaci&oacute;n, Sala de Profesores Bloque C, segundo piso o comunicarse
                        telef&oacute;nicamente al 6683600, ext. 362 o 377 o al e-mail: <a href="mailto:claudia.santiago@escuelaing.edu.co">claudia.santiago@escuelaing.edu.co</a><br>
                    </p>
                    <%}%>
                    <p>
                        <!--Especializacion en  QHSE-->
                        <%if (idplan.equals("370")) {%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n
                            del <b><%=cronograma.elementAt(8)%></b>. A partir del d&iacute;a <b><%=cronograma.elementAt(7)%></b>
                            podr&aacute; consultar con el n&uacute;mero de su documento de identidad
                            en la P&aacute;gina Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot;
                            de la <b>&quot;<%=prog%>&quot;, </b>la fecha, hora y el lugar de
                        las mismas. </li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot;
                            de la &quot;<b><%=prog%>&quot;, </b> a partir del d&iacute;a <b><%=cronograma.elementAt(10)%></b><font color="#000000">,
                                para lo cual deber&aacute; ingresar el n&uacute;mero de su documento
                        de identidad</font>.</li>
                    </ul>
                    <p><b>Nota</b>: Informaci&oacute;n adicional en la Direcci&oacute;n de la
                        Especializaci&oacute;n, <a href="mailto:espeqhse@escuelaing.edu.co">espeqhse@escuelaing.edu.co</a><br>
                    </p>
                    <%}%>
                    <p>
                        <!--Especializacion en  Fundaciones-->
                        <%if (idplan.equals("320")) {%>
                    </p>
                    <ol start="2">
                        <li> Presentaci&oacute;n de entrevista</li>
                    </ol>
                    <ul>
                        <li><b>Fecha, hora y sitio de la Entrevista</b>: Las entrevistas se realizar&aacute;n
                            del <b><%=cronograma.elementAt(8)%></b>. A partir del d&iacute;a <b><%=cronograma.elementAt(7)%></b>
                            podr&aacute; consultar con el n&uacute;mero de su documento de identidad
                            en la P&aacute;gina Web de la Escuela, en la secci&oacute;n: &quot;<b>Entrevistas</b>&quot;
                            de la <b>&quot;<%=prog%>&quot;, </b>la fecha, hora y el lugar de
                        las mismas. </li>
                        <li><b>Fecha y sitio de publicaci&oacute;n de resultados del proceso de
                            selecci&oacute;n:</b> Los puede consultar a trav&eacute;s de la Pagina
                            Web de la Escuela en la secci&oacute;n &quot;<b>Admitidos</b>&quot;
                            de la &quot;<b><%=prog%>&quot;, </b> a partir del d&iacute;a <b><%=cronograma.elementAt(10)%></b><font color="#000000">,
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

