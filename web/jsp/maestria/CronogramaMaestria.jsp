<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<html>

    <head>
        <title>Cronograma Especializaciones</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
              <meta name="GENERATOR" content="Microsoft FrontPage 3.0">

    </head>

    <body bgcolor="#FFFFFF" text="#000000">
        <%String idplan = request.getParameter("idplan");%>
        <%otros.rutas ruta = new otros.rutas();%> 
        <%if (idplan.equals("290")) {%>
        <table align="center" width="60%" border="0" height="74">
            <tr>      
                <td width="11%" height="76"><img src="img/logo.gif" width="83" height="90"></td>      
                <td width="1%" height="76">&nbsp;</td>      
                <td width="88%" height="76">  
                    <div align="center">          
                        <p><b><font size="3" color="#CC0000">ESCUELA COLOMBIANA DE INGENIER&Iacute;A 
                                JULIO GARAVITO</font></b></p>
                        <p><font color="#C10000" size="4"><b><font size="3">MAESTRIA EN INGENIERIA CIVIL<br>
                                CRONOGRAMA</font></b></font> <font size="3"></font></p>
                    </div>
                </td>
            </tr>
        </table>

        <%} else {%>

        <table align="center" width="60%" border="0" height="74">
            <tr>      
                <td width="11%" height="76"><img src="img/logo.gif" width="83" height="90"></td>      
                <td width="1%" height="76">&nbsp;</td>      
                <td width="88%" height="76"> 
                    <div align="center">          
                        <p><b><font size="3" color="#CC0000">ESCUELA COLOMBIANA DE INGENIER&Iacute;A 
                                JULIO GARAVITO</font></b></p>
                        <p><font color="#C10000" size="4"><b><font size="3">ASPIRANTES A UN PROGRAMA 
                                DE ESPECIALIZACION<br>
                                CRONOGRAMA</font></b></font> <font size="3"></font></p>
                    </div>
                </td>
            </tr>
        </table>
        <%}%>
        <p align="center"><b>FECHAS DE INSCRIPCIONES Y ENTREGA DE DOCUMENTOS </b></p>
        <!--Se envia a la página de contacto segun la especializacion -->
        <%  String link = "";
            if (idplan.equals("312")) {
                link = "estructuras/contacto.htm";
            }
            if (idplan.equals("374")) {
                link = "gerencia/contacto.htm";
            }
            if (idplan.equals("267")) {
                link = "vias/contacto.htm";
            }
            if (idplan.equals("273")) {
                link = "economia/contacto.htm";
            }
            if (idplan.equals("370")) {
                link = "qhse/contacto.htm";
            }
            if (idplan.equals("310")) {
                link = "hidraulicos/contacto.htm";
            }
            if (idplan.equals("309")) {
                link = "saneamiento/contacto.htm";
            }
            if (idplan.equals("324")) {
                link = "telematica/contacto.htm";
            }
            if (idplan.equals("285")) {
                link = "polimeros/contacto.htm";
            }
            if (idplan.equals("320")) {
                link = "fundaciones/contacto.htm";
            }
            if (idplan.equals("373")) {
                link = "gerencia_produc/contacto.htm";
            }
            if (idplan.equals("290")) {
                link = "http://www.escuelaing.edu.co/maestria_civil/contacto.html";
            }

        %>

        <!%if ((idplan.equals("309")) || (idplan.equals("320")) ) {%>

        <!--<font size="4"><b> <center>INSCRIPCIONES EXTEMPORANEAS </center></b> </font> -->
        <!% }%>
        <table width="49%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr valign="top"> 
                <td width="90%" height="31">Si desea ser tenido en cuenta para la próxima 
                    convocatoria contáctenos </td>
                <td width="10%" height="31"> <a href="http://www.escuelaing.edu.co/programas/especializacion/<%=link%>"><img src="img/aqui.jpg" width="37" height="22" border="0"></a> 
                </td>
            </tr>
        </table>

        <!-- *********** -->
        <!--SE ABRE ARCHIVO PARA LECTURA-->
        <%     String arreglo[] = new String[5000];
            int ii = 0, n = 1;
            int k = 0;
            try {
                //FileReader ra = new FileReader("C:\\jakarta-tomcat-3.2.1\\confEci\\posgrados\\cronograma.txt");
                FileReader ra = new FileReader(ruta.valruta() + "maestria" + ruta.tokenruta() + "cronogramacivil.txt");
                BufferedReader entrada = new BufferedReader(ra);
                String s;
                while ((s = entrada.readLine()) != null) {
                    arreglo[ii] = s;
                    ii = ii + 1;
                }
                entrada.close();
                ra.close();
        %>
        <%
        } catch (java.io.FileNotFoundException fnfex) {
            System.out.println("Archivo no encontrado: " + fnfex);
        %>
        <p>Archivo no encontrado
            <%     } catch (java.io.IOException ioex) {
                }
            %>
            <!--FIN LECTURA-->  
            <% String texto[] = new String[200];
                int l, b = 0, a = 0, s = 0, ban = 0;
                for (int j = 0; j < ii; j++) {
                    StringTokenizer st = new StringTokenizer(arreglo[j], "*");
                    k = 0;
                    while (st.hasMoreTokens()) {
                        texto[k] = st.nextToken();
                    k = k + 1;
                }
                String plan = texto[0];%>       
            <% //if((idplan.equals("24")) && (ban == 0)){%>

            <% if (plan.equals(idplan)) {%>

        <table width="70%" border="1" cellspacing="0" cellpadding="0" align="center">
            <tr bgcolor="#BBBBBB"> 
                <td colspan="2" height="52"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b> 
                            <%if (texto[1].equals(" ")) {%>
                            &nbsp; 
                            <%} else {%>
                                <% if (plan.equals("noaplicaaun")) {%>
                                <%=texto[1]%>  - Inscripciones Extemporáneas<br>
                                Tenga en cuenta que la Escuela cerrará por vacaciones colectivas entre el 17 de diciembre de 2005 y el 10 de enero de 2006.
                                <%} else {%>
                                <%=texto[1]%></br><%=texto[2]%>
                                <%}
                                    }%>
                        </b></font></div>
                </td>
            </tr>
            <%if (plan.equals("noaplicaaun")) {%>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Fecha 
                        de inscripciones</font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    Entre el 5 y el 15 de diciembre de 2005 y entre el 11 y el 18 de enero de 2006</font></td>
            </tr>  

            <%} else {%>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Fecha 
                        inicio inscripciones</font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[3].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[3]%>
                    <%}%></font></td>
            </tr>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Fecha 
                        final inscripciones</font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[4].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[4]%>
                    <%}%></font></td>
            </tr>
            <%}%>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Citación 
                        a Entrevista</font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[5].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[5]%>
                    <%}%></font></td>
            </tr>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Entrevistas 
                        si el comit&eacute; lo considera necesario</font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[6].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[6]%>
                    <%}%></font></td>
            </tr>

            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Exámen</font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[7].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[7]%>
                    <%}%></font></td>
            </tr>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Respuesta 
                        de admisi&oacute;n al nivelatorio</font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[8].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[8]%> <%}%> </font></td>
            </tr>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Respuesta 
                        de admisión </font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[9].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[9]%> <%}%> </font></td>
            </tr>
            <tr> 
                <td width="30%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Entrega 
                        de órdenes de pago nivelatorio</b></font></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[10].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[10]%> <%}%> </font></td>
            </tr>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Entrega 
                        de órdenes de pago </font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[11].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[11]%> <%}%> </font></td>
            </tr>
            <tr> 
                <td width="30%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Pagos 
                        nivelatorio</b></font></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[12].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[12]%> <%}%> </font></td>
            </tr>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Pagos 
                        </font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[13].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[13]%> <%}%> </font></td>
            </tr>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Inducción</font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[14].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[14]%> <%}%> </font></td>
            </tr>
            <tr> 
                <td width="30%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Firma 
                        de acta de matr&iacute;cula y carnetizaci&oacute;n Nivelatorio</b></font></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[15].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[15]%><%}%> </font></td>
            </tr>
            <tr>
                <td width="30%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Nivelatorio 
                        (inicio de clases)</b></font></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[16].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%//if ( plan.equals("283")) {%>
                    <!--<font face="Verdana, Arial, Helvetica, sans-serif" size="1">20 de octubre de 2006 a las 2:00 p.m. (Fundamentos de Electrónica y Comunicaciones). 
  El segundo curso iniciará el 21 de octubre de 2006 a las 2:00 p.m. (Fundamentos de Computadores e informática) 
 y el tercer curso iniciará el 4 de Noviembre de 2006 a las 2:00 p.m. (Introducción a la Gerencia de Proyectos), todas en el aula XXX. 
 La programación de los cursos se publicará el 18 de octubre de 2006 en esta misma página.-->
                    <!--<a href="http://www.escuelaing.edu.co/programas/especializacion/telematica/contenido.htm" target="_blank">click 
  aquí</a>. La programación de los cursos se publicará el 25 de octubre de 
  2005 y se podr&aacute; consultar <a href="http://www.telematica.is.escuelaing.edu.co/especial/index.htm" target="_blank">aqu&iacute;</a--> 
                    <%//} else {%>
                    <%=texto[16]%> 
                    <%//}
                            }%>
                    </font></td>
            </tr>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Firma 
                        de acta de matr&iacute;cula y carnetización</font></b></td>
                <td width="35%" height="26">
                    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                        <%if (texto[17].equals(" ")) {%>
                        &nbsp; 
                        <%} else {%>
                        <%=texto[17]%> <%}%> </font><font face="Verdana, Arial, Helvetica, sans-serif" size="1"></font></p>
                </td>
            </tr>
            <tr> 
                <td width="30%" height="26"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Inicio 
                        de clases</font></b></td>
                <td width="35%" height="26"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                    <%if (texto[18].equals(" ")) {%>
                    &nbsp; 
                    <%} else {%>
                    <%=texto[18]%> <%}%> </font></td>
            </tr>
        </table>


        <%ban = 1;
                }

            }%>

        <!%if ((idplan.equals("309")) || (idplan.equals("320")) ) {%>
        <!--
        <A HREF="Extemporaneas?idplan=<%=idplan%>"><center>
  <font size="4"><b> INSCRIPCIONES EXTEMPORANEAS </b> </font> 
</center>
        </a> -->
        <!% }%>
        <%if (ban == 0) {%>
        <p> No existe información registrada para este programa
            <%}%>


    </body>
</html>
