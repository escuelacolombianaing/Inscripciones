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
        titulo = " Inscripciones en l�nea";
        /* Inscripciones Extempor�neas*/

        if (tipoest.equals("E") || tipoest.equals("T")) {
            titulo = "Inscripciones en l�nea";
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
        <title>Validaci�n Generaci�n E-Componente de Excelencia</title>
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
    <center><b><p class="textocom">Este proceso no se encuentra habilitado, s�lo se habilitar� en las fechas programadas que aparecen en el calendario de admisiones,<br> para cualquier informaci�n adicional, comun�quese al 6683600 opci�n 2 en el men�.</p></b></center>
    <br>
    <%} else {%>
    <form name="form1" method="post" action="ReferenciaGeneracionE?tipoest=N">
        <div align="center">

            <table border="0" cellpadding="1" cellspacing="1" width="950" height="150" align="center" class="textocom">

                <tr valign="top"> 
                    <td colspan="2"> 
                        <p align="center"><b><font color="#CC0000" size="4">Generaci�n E-Componente de Excelencia</font></b></p>
                        <p align="left">Bienvenido usted acaba de ingresar a la secci&oacute;n 
                            de admisiones de la Escuela Colombiana de Ingenier&iacute;a Julio 
                            Garavito del programa Generaci�n E-Componente de Excelencia; A continuaci&oacute;n 
                            lo guiaremos en todo el proceso de inscripci&oacute;n en l&iacute;nea.<br>
                        </p>
                        <p align="left">Este programa es una iniciativa del gobierno nacional a trav�s del 
                            Ministerio de Educaci�n Nacional (MEN) con el que busca garantizar el acceso 
                            a la educaci�n superior de los mejores estudiantes del pa�s que no puedan 
                            pagar sus estudios superiores. </p>
                        <%if(false){%>
                        <p align="left"><br>
                            La Escuela Colombiana de Ingenier&iacute;a Julio Garavito hace parte 
                            de las 47 Instituciones Acreditadas en Alta Calidad, y tendr&aacute; 
                            abiertas las inscripciones para el Programa de Ser Pilo.<!-- Paga a partir 
                            del 01 de septiembre hasta el 27 de octubre de 2016. 
                            Para el programa de Ingenier�a Biom�dica las inscripciones estar�n abiertas del 01 de septiembre hasta el 24 de octubre.--><br>
                        </p>
                        <%}%>
                        <p align="left">Las condiciones del nuevo programa de Educaci�n Superior del MEN.
                            <b>Generaci�n E-Componente de Excelencia</b> son las siguientes:</p>
                        <ul>
                            <li>Tener un puntaje Sisben menor a 57 puntos.<br>
                            </li>
                            <li>Tener un puntaje global en las pruebas saber 11 presentada en el 2018 de 350 puntos como m�nimo.<br>
                            </li>
                            <li>Escoger un programa de una Universidad Acreditada o que el programa sea acreditado.<br>
                            </li>
                            <li>El Ministerio cubre el 75% del valor de la matr�cula, 
                                el restante 25% lo cubre la Universidad.
                                <ul>
                                    <li>
                                        De ese 75% que da el MEN, el 25% debe ser reintegrado al estado una vez graduado.
                                    </li>
                                </ul>
                            </li>
                            <li>Inscripci�n gratuita.</li>
                            <li>Tramite de la financiaci�n a trav�s del ICETEX.</li>
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
                            Los requisitos los establece el Ministerio de Educaci�n Nacional (MEN) 
                            y est�n publicados en la p�gina oficial del 
                            Icetex  www.icetex.gov.co � del Ministerio de Educaci�n.</p>
                        <p><br>
                            Para realizar el proceso de inscripci�n en la Escuela Colombiana 
                            de Ingenier�a Julio Garavito, debes tener m�nimo 45 puntos en las �reas 
                            de inter�s del Examen Saber11, de acuerdo al programa acad�mico de tu 
                            preferencia. (Aprobado por el Consejo Directivo, 6 de septiembre de 2016) </p>
                        <p><br>
                            Para este proceso las �reas de inter�s para cada programa acad�mico son las siguientes:
                            <br>
                            <b>INGENIER�AS Y MATEM�TICAS</b>
                            <br>
                            Ciencias Naturales Lectura Cr�tica Matem�ticas
                            <br>
                            <br>
                            <b>ADMINISTRACI�N DE EMPRESAS Y ECONOM�A</b>
                            <br>
                            Sociales y Ciudadanas Lectura Cr�tica Matem�ticas
                            <br>
                            <br>
                            <br>
                            * Aprobado por el Consejo Directivo, 6 de mayo de 2014
                            <br>
                            <br>
                            Para la admisi�n se considera la formaci�n previa del aspirante en las �reas de inter�s, el resultado del Examen de Estado para cada programa como determinante para su buen desempe�o en la Escuela. Se realiza el proceso de clasificaci�n de cada �rea ubicando al aspirante en los niveles Alto, Medio o B�sico.
                            El puntaje de corte, correspondiente a cada nivel, se determina seg�n los resultados generales de todos los examinados en Bogot� que presentaron la prueba en la misma fecha que el aspirante.
                            Dependiendo del nivel de clasificaci�n en las tres �reas de inter�s, el aspirante podr� ser admitido o no.
                            Todos los aspirantes ser�n admitidos, excepto quienes hayan obtenido Nivel B�sico en dos de las tres �reas de inter�s, incluyendo matem�ticas, o Nivel B�sico en las tres �reas.
                            Las asignaturas a cursar en el primer semestre depender�n del nivel de clasificaci�n del aspirante en las �reas de inter�s.
                            <br>
                            Sin embargo, usted debe presentar las pruebas de conocimientos que le correspondan 
                            de acuerdo al programa al que fue admitido. Est�s son de car�cter obligatorio y la 
                            respuesta le dar� una sugerencia sobre las asignaturas que deber� cursar en su 
                            primer semestre, en caso de no aceptarla usted deber� cursar las asignaturas 
                            indicadas en la respuesta de admisi�n. Para mayor informaci�n sobre las pruebas 
                            siga este enlace.
                            La inscripci�n del aspirante solo le otorga el derecho a que su solicitud sea 
                            analizada en el marco de los criterios definidos para la admisi�n a los 
                            programas acad�micos de la Escuela. La inscripci�n por s� misma no garantiza 
                            la admisi�n.
                        </p>
                        
                        
                        <p><br>
                            <b>1. Pasos para la inscripci�n</b></p>
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