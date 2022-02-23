<%-- 
    Document   : ValidaGeneracionE
    Created on : 25/08/2015, 11:00:06 AM
    Author     : Lucero
--%>
<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    try {
        String titulo = new String("");
        titulo = "VALIDACION PARA SOLICITAR NUMERO DE REFERENCIA ESTUDIANTE NUEVO GENERACION E-COMPONENTE DE EXCELENCIA";
        configeci.configuracion confEci = new configeci.configuracion();
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        int ban = 0;
        String tipoest = request.getParameter("tipoest");
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
        if (false || pregrados.size() <= 0) {
            out.println("<center> Este proceso no se encuentra habilitado </center>");
        } else {
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Validación Generación E-Componente de Excelencia</title>
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <link href="css/comun.css" rel="stylesheet" type="text/css">   
        <script>
                    function verAceptacion(){
                        alert(No puede continuar si no acepta);
                    }
                </script>
    </head>
    

    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        <% 
            if (ban == 0) {%>
        <p>      
    <center><b><p class="textocom">Este proceso no se encuentra habilitado, sólo se habilitará en las fechas programadas que aparecen en el calendario de admisiones,<br> para cualquier información adicional, comuníquese al 6683600 opción 2 en el menú.</p></b></center>
    <br>
    <%} else {%>
    <form name="form1" method="post" action="ReferenciaGeneracionE?tipoest=N">
        <div align="center">

            <table border="0" cellpadding="1" cellspacing="1" width="950" height="150" align="center" class="textocom">

                <tr valign="top"> 
                    <td colspan="2"> 
                        <p align="center"><b><font color="#CC0000" size="4">Generación E-Componente de Excelencia</font></b></p>
                        <p align="left">Bienvenido usted acaba de ingresar a la secci&oacute;n 
                            de admisiones de la Escuela Colombiana de Ingenier&iacute;a Julio 
                            Garavito del programa Generación E-Componente de Excelencia; A continuaci&oacute;n 
                            lo guiaremos en todo el proceso de inscripci&oacute;n en l&iacute;nea.<br>
                        </p>
                        <p align="left">Este programa es una iniciativa del gobierno nacional a través del 
                            Ministerio de Educación Nacional (MEN) con el que busca garantizar el acceso 
                            a la educación superior de los mejores estudiantes del país que no puedan 
                            pagar sus estudios superiores. </p>
                        <%if(false){%>
                        <p align="left"><br>
                            La Escuela Colombiana de Ingenier&iacute;a Julio Garavito hace parte 
                            de las 47 Instituciones Acreditadas en Alta Calidad, y tendr&aacute; 
                            abiertas las inscripciones para el Programa de Ser Pilo.<!-- Paga a partir 
                            del 01 de septiembre hasta el 27 de octubre de 2016. 
                            Para el programa de Ingeniería Biomédica las inscripciones estarán abiertas del 01 de septiembre hasta el 24 de octubre.--><br>
                        </p>
                        <%}%>
                        <p align="left">Las condiciones del nuevo programa de Educación Superior del MEN.
                            <b>Generación E-Componente de Excelencia</b> son las siguientes:</p>
                        <ul>
                            <li>Tener un puntaje Sisben menor a 57 puntos.<br>
                            </li>
                            <li>Tener un puntaje global en las pruebas saber 11 presentada en el 2018 de 350 puntos como mínimo.<br>
                            </li>
                            <li>Escoger un programa de una Universidad Acreditada o que el programa sea acreditado.<br>
                            </li>
                            <li>El Ministerio cubre el 75% del valor de la matrícula, 
                                el restante 25% lo cubre la Universidad.
                                <ul>
                                    <li>
                                        De ese 75% que da el MEN, el 25% debe ser reintegrado al estado una vez graduado.
                                    </li>
                                </ul>
                            </li>
                            <li>Inscripción gratuita.</li>
                            <li>Tramite de la financiación a través del ICETEX.</li>
                        </ul>
                        <p> <!--Recuerde que para realizar el proceso de admisi&oacute;n en la Escuela 
                            Colombiana de Ingenier&iacute;a Julio Garavito se tienen en cuenta 
                            &uacute;nicamente aquellos aspirantes que hayan cumplido con los siguientes 
                            puntajes:</p>
                       
                        <p>ICFES A PARTIR DEL PERIODO 2014-2</p>
                        <ul>
                            <li>Programas de Ingenier&iacute;a y Matem&aacute;ticas<br>
                                M&iacute;nimo 40* puntos Ciencias Naturales, Matem&aacute;ticas 
                                y Lectura cr&iacute;tica<br>
                            </li>
                            <li>Programa de Econom&iacute;a<br>
                                M&iacute;nimo 40* puntos en Matem&aacute;ticas, Lectura cr&iacute;tica 
                                y Sociales y Ciudadanas<br>
                            </li>
                            <li>Programa de Administraci&oacute;n de Empresas<br>
                                M&iacute;nimo 40* puntos en Matem&aacute;ticas Lectura Cr&iacute;tica 
                                y Sociales y Ciudadanas<br>
                            </li>
                            <li>Programa de Ingenier&iacute;a Biom&eacute;dica<br>
                                M&iacute;nimo 40* puntos en Ciencias Naturales, Matem&aacute;ticas 
                                y Lectura Cr&iacute;tica y Entrevista</li>
                        </ul>
                        <p>Aprobado por el Consejo Directivo, 6 de Mayo de 2014.</p>-->
                        <p><br>
                            Los requisitos los establece el Ministerio de Educación Nacional (MEN) 
                            y están publicados en la página oficial del 
                            Icetex  www.icetex.gov.co ó del Ministerio de Educación.</p>
                        <p><br>
                            Para realizar el proceso de inscripción en la Escuela Colombiana 
                            de Ingeniería Julio Garavito, debes tener mínimo 45 puntos en las áreas 
                            de interés del Examen Saber11, de acuerdo al programa académico de tu 
                            preferencia. (Aprobado por el Consejo Directivo, 6 de septiembre de 2016) </p>
                        <p><br>
                            Para este proceso las áreas de interés para cada programa académico son las siguientes:
                            <br>
                            <b>INGENIERÍAS Y MATEMÁTICAS</b>
                            <br>
                            Ciencias Naturales Lectura Crítica Matemáticas
                            <br>
                            <br>
                            <b>ADMINISTRACIÓN DE EMPRESAS Y ECONOMÍA</b>
                            <br>
                            Sociales y Ciudadanas Lectura Crítica Matemáticas
                            <br>
                            <br>
                            <br>
                            * Aprobado por el Consejo Directivo, 6 de mayo de 2014
                            <br>
                            <br>
                            Para la admisión se considera la formación previa del aspirante en las áreas de interés, el resultado del Examen de Estado para cada programa como determinante para su buen desempeño en la Escuela. Se realiza el proceso de clasificación de cada área ubicando al aspirante en los niveles Alto, Medio o Básico.
                            El puntaje de corte, correspondiente a cada nivel, se determina según los resultados generales de todos los examinados en Bogotá que presentaron la prueba en la misma fecha que el aspirante.
                            Dependiendo del nivel de clasificación en las tres áreas de interés, el aspirante podrá ser admitido o no.
                            Todos los aspirantes serán admitidos, excepto quienes hayan obtenido Nivel Básico en dos de las tres áreas de interés, incluyendo matemáticas, o Nivel Básico en las tres áreas.
                            Las asignaturas a cursar en el primer semestre dependerán del nivel de clasificación del aspirante en las áreas de interés.
                            <br>
                            Sin embargo, usted debe presentar las pruebas de conocimientos que le correspondan 
                            de acuerdo al programa al que fue admitido. Estás son de carácter obligatorio y la 
                            respuesta le dará una sugerencia sobre las asignaturas que deberá cursar en su 
                            primer semestre, en caso de no aceptarla usted deberá cursar las asignaturas 
                            indicadas en la respuesta de admisión. Para mayor información sobre las pruebas 
                            siga este enlace.
                            La inscripción del aspirante solo le otorga el derecho a que su solicitud sea 
                            analizada en el marco de los criterios definidos para la admisión a los 
                            programas académicos de la Escuela. La inscripción por sí misma no garantiza 
                            la admisión.
                        </p>
                        
                        
                        <p><br>
                            <b>1. Pasos para la inscripción</b></p>
                        <p><br>
                            Usted debe:<br>
                            a) Registrarse<br>
                            b) Diligenciar los campos solicitados en este registro inicial<br>
                            c) Hacer clic en el bot&oacute;n enviar<br>
                            d) Diligenciar el formulario de inscripci&oacute;n donde usted debe 
                            tener en cuenta el n&uacute;mero de referencia que le suministra el 
                            sistema.<br>
                            <br>
                            <br>
                        </p>
                        <p align="left">&nbsp;</p>
                    </td>
                </tr>
                <tr>
                    <td width="47%">Acepto que conozco las condiciones aqu&iacute;
                        descritas</td>
                    <td width="53%">
                        <p> </p>
                        <p> <b>Si
                                <input type="radio" name="acepto" id="si" value="S">
                                &nbsp;&nbsp;No</b>
                            <input type="radio" name="acepto" id="no" value="N" onchange="verAceptacion()">
                        </p>
                    </td>
                    
                
                </tr>
                <tr>
                    <td width="47%">&nbsp;</td>
                    <td width="53%">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                <center>
                    <p>
                        <input type="submit" value="Acepto" name="submit" class="boton">
                    </p>
                    <p>&nbsp;</p>
                </center>
                </td>
                </tr>
            </table>



        </div>
    </form>
    <%}
            }
        } catch (Exception e) {
            Correo correo = new Correo();
            correo.enviar("Valida Generacion E", e.getMessage());
        }
    %>

  
</body>
</html>