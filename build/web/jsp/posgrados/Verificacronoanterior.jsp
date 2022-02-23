<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<html>
    
    <head>
        <title>Cronograma Especializaciones</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
               <link href="css/comun.css" rel="stylesheet" type="text/css">
        
    </head>
    
    <body bgcolor="#FFFFFF" text="#000000">
        <%String idplan = request.getParameter("idplan");%>
       
        <%otros.rutas ruta = new otros.rutas();%> 
        <%if (idplan.equals("290")){%>
        <table align="center" width="60%" border="0" height="74" class="textoimpremas">
            <tr>      
                <td width="11%" height="76"><img src="img/logo.gif" width="83" height="90"></td>      
                <td width="1%" height="76">&nbsp;</td>      
                <td width="88%" height="76"> 
                    <div align="center">          
                        <p><b>ESCUELA COLOMBIANA DE INGENIER&Iacute;A 
                        JULIO GARAVITO</b></p>
                        <p>MAESTRIA EN INGENIERIA CIVIL<br>
          CRONOGRAMA</p>
                    </div>
                </td>
            </tr>
        </table>
        
        <%} else{ %>
        
         <table align="center" width="60%" border="0" height="74" class="textoimpremas">
            <tr>      
                <td width="11%" height="76"><img src="img/logo.gif" width="83" height="90"></td>      
                <td width="1%" height="76">&nbsp;</td>      
                <td width="88%" height="76"> 
                    <div align="center">          
                        <p><b>ESCUELA COLOMBIANA DE INGENIER&Iacute;A 
                        JULIO GARAVITO</b></p>
                        <p><b>ASPIRANTES A UN PROGRAMA DE ESPECIALIZACION<br>
          CRONOGRAMA</b></p>
                    </div>
                      <p align="center"><b>FECHAS DE INSCRIPCIONES Y ENTREGA DE DOCUMENTOS </b></p>
                </td>
            </tr>
        </table>
        <%}%>
      
        <!--Se envia a la página de contacto segun la especializacion -->
        <%  String link = "";
        if (idplan.equals("312"))
            link="estructuras/contacto.htm";
        if (idplan.equals("287"))
            link="desarrollo_proyec/contacto.htm";
        if (idplan.equals("267"))
            link="construccion_vias/contacto.htm";
        if (idplan.equals("313"))
            link="economia/contacto.htm";
        if (idplan.equals("370"))
            link="qhse/contacto.htm";
        if (idplan.equals("310"))
            link="hidraulicos/contacto.htm";
        if (idplan.equals("129"))
            link="saneamiento/contacto.htm";
        if (idplan.equals("288"))
            link="telematica/contacto.htm";
        if (idplan.equals("285"))
            link="polimeros/contacto.htm";
        if (idplan.equals("281"))
            link="fundaciones/contacto.htm";
        if (idplan.equals("286"))
            link="gerenciaproduc/contacto.htm";
        if (idplan.equals("290"))
            link="../maestrias/ingenieria_civil/contacto.htm";  
            
        %>
       
        <!%if ((idplan.equals("129")) || (idplan.equals("281")) ) {%>
        
        <!--<font size="4"><b> <center>INSCRIPCIONES EXTEMPORANEAS </center></b> </font> -->
        <!% }%>
        <table width="49%" border="0" cellspacing="0" cellpadding="0" align="center" class="textoimpremas">
            <tr valign="top"> 
                <td width="90%" height="31">Si desea ser tenido en cuenta para la próxima 
                convocatoria contáctenos </td>
               <!-- <td width="10%" height="31"> <a href="http://www.escuelaing.edu.co/programas/especializacion/<%=link%>"><img src="img/aqui.jpg" width="37" height="22" border="0"></a> -->
              <td width="10%" height="31"> <a href="http://www.escuelaing.edu.co/programas/posgrados/esp/<%=link%>"><img src="img/aqui.jpg" width="37" height="22" border="0"></a>

                </td>
            </tr>
        </table>
        
        <!-- *********** -->
        <!--SE ABRE ARCHIVO PARA LECTURA-->
        <%     String arreglo[]=new String[5000];
        int ii=0, n=1;
        int k=0;
        try {
            //FileReader ra = new FileReader("C:\\jakarta-tomcat-3.2.1\\confEci\\posgrados\\cronograma.txt");
            FileReader ra = new FileReader(ruta.valruta() + "posgrados" + ruta.tokenruta() + "cronograma.txt");
            BufferedReader entrada = new BufferedReader(ra);
            String s;
            while((s = entrada.readLine()) != null) {
                arreglo[ii]= s;
                ii=ii+1;
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
        %>
        <!--FIN LECTURA-->  
        <% String texto[] = new String[200] ;
        int l, b = 0, a = 0, s = 0, ban=0 ;
        for (int j=0; j<ii; j++){
            StringTokenizer st = new StringTokenizer(arreglo[j], "*");
            k=0;
            while (st.hasMoreTokens()) {
                texto[k]=st.nextToken();
                k=k+1;
            }
            String plan = texto[0]; %>       
        <% //if((idplan.equals("312")) && (ban == 0)){%>
        
        <% if(plan.equals(idplan)){%>
        
        
<table width="70%" border="1" cellspacing="0" cellpadding="0" align="center" class="textoimpremas">
  <tr bgcolor="#BBBBBB"> 
    <td colspan="2" height="52"> 
      <div align="center"><b> 
        <%if (texto[1].equals(" ")){%>
        &nbsp; 
        <%}else{%>
        <% if(/*plan.equals("129")*/plan.equals("noaplicaaun")){%>
        <%=texto[1]%> - Inscripciones Extemporáneas<br>
        Tenga en cuenta que la Escuela cerrará por vacaciones colectivas entre 
        el 17 de diciembre de 2005 y el 10 de enero de 2006. 
        <%} else {%>
        <%=texto[1]%><%=texto[2]%> 
        <%}
                                }%>
        </b></div>
    </td>
  </tr>
  <%if(/*plan.equals("129")*/plan.equals("noaplicaaun")){ %>
  <tr> 
    <td width="30%" height="26"><b>Fecha 
      de inscripciones</b></td>
    <td width="35%" height="26">
      Entre el 5 y el 15 de diciembre de 2005 y entre el 11 y el 18 de enero de 
      2006</td>
  </tr>
  <%} else { %>
  <tr> 
    <td width="30%" height="26"><b>Fecha 
      inicio inscripciones</b></td>
    <td width="35%" height="26">
      <%if (texto[3].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[3]%> 
      <%}%>
      </td>
  </tr>
  <tr> 
    <td width="30%" height="26"><b>Fecha 
      final inscripciones</b></td>
    <td width="35%" height="26">
      <%if (texto[4].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[4]%> 
      <%}%>
      </td>
  </tr>
  <%} if (idplan.equals("287")){ %>
   <tr>
    <td width="30%" height="26"><b>
      Inscripciones a Cursos Preparatorios</b></td>
    <td width="35%" height="26">
           <%=texto[30]%>
     </td>
  </tr>
   <tr>
    <td width="30%" height="26"><b>
      Cursos Preparatorios</b></td>
    <td width="35%" height="26">
           <%=texto[29]%>
     </td>
  </tr>
  <% } %>

  <tr> 
    <td width="30%" height="26"><b>Citación 
      a Entrevista</b></td>
    <td width="35%" height="26">
      <%if (texto[5].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[5]%> 
      <%}%>
      </td>
  </tr>
  <%if (idplan.equals("312")){ %>
  <tr> 
    <td width="30%" height="26"><b>
      Entrevista y Exámen de clasificación</b></td>
    <td width="35%" height="26">
      <%if (texto[6].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[6]%> 
      <%}%>
     </td>
  </tr>
  <% } else {%>

<%if (idplan.equals("287")){ %>
  <tr> 
    <td width="30%" height="26"><b>Entrevistas 
     </b></td>
    <td width="35%" height="26">
      <%if (texto[6].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[6]%> 
      <%}
      } else {%>
       <tr>
    <td width="30%" height="26"><b>Entrevistas
      si el comit&eacute; lo considera necesario</b></td>
    <td width="35%" height="26">
      <%if (texto[6].equals(" ")){%>
      &nbsp;
      <%}else{%>
      <%=texto[6]%>
      <%}
      } %>
      </td>
  </tr>
  <tr> 
    <td width="30%" height="26"><b>Examen</b></td>
    <td width="35%" height="26"> 
      <%if (texto[7].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[7]%> 
      <%}%>
      </td>
  </tr>
  <%}%>
   <% if (!idplan.equals("287")){ %>
  <tr> 
    <td width="30%" height="26"><b>Respuesta 
      de admisi&oacute;n al nivelatorio</b></td>
    <td width="35%" height="26">
      <%if (texto[8].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[8]%> 
      <%}
      }%>
      </td>
  </tr>
  <tr> 
    <td width="30%" height="26"><b>Respuesta 
      de admisión </b></td>
    <td width="35%" height="26">
      <%if (texto[9].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[9]%> 
      <%}%>
      </td>
  </tr>
  <%if (idplan.equals("290")){%>
  <tr> 
    <td width="30%" height="26"><b>Entrevista 
      con los consejeros y preinscripción de asignaturas</b></td>
    <td width="35%" height="26">
      <%if (texto[23].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[23]%> 
      <%}%>
      </td>
  </tr>
  <%}%>
   <% if (!idplan.equals("287")){ %>
  <tr> 
    <td width="30%" height="26"><b>Publicación 
      de órdenes de pago nivelatorio</b></td>
    <td width="35%" height="26">
      <%if (texto[10].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[10]%> 
      <%}
      }%>
      </td>
  </tr>
  <tr> 
    <td width="30%" height="26"><b>Publicación 
      de órdenes de pago </b></td>
    <td width="35%" height="26">
      <%if (texto[11].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[11]%> 
      <%}%>
      </td>
  </tr>
   <% if (!idplan.equals("287")){ %>
  <tr> 
    <td width="30%" height="26"><b>Pagos 
      nivelatorio</b></td>
    <td width="35%" height="26"> 
      <%if (texto[12].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[12]%> 
      <%}
      }%>
      </td>
  </tr>
  <tr> 
    <td width="30%" height="26"><b>Pagos 
      </b></td>
    <td width="35%" height="26">
      <%if (texto[13].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[13]%> 
      <%}%>
      </td>
  </tr>
  <tr> 
    <td width="30%" height="26"><b>Inducción</b></td>
    <td width="35%" height="26"> 
      <%if (texto[14].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[14]%> 
      <%}%>
      </td>
  </tr>
   <% if (!idplan.equals("287")){ %>
  <tr> 
    <td width="30%" height="26"><b>Firma 
      de acta de matr&iacute;cula y carnetizaci&oacute;n Nivelatorio</b></td>
    <td width="35%" height="26">
      <%if (texto[15].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[15]%> 
      <%}
      }%>
      </td>
  </tr>

 <% if (!idplan.equals("287")){ %>
  <tr> 
    <td width="30%" height="26"><b>Nivelatorio 
      (inicio de clases)</b></td>
    <td width="35%" height="26">
      <%if (texto[16].equals(" ")){%>
      &nbsp; 
      <%} else { %>
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
      <%}
                        }%>
      </td>
  </tr>
  <tr> 
    <td width="30%" height="26"><b>Firma 
      de acta de matr&iacute;cula y carnetización</b></td>
    <td width="35%" height="26"> 
      <p>
        <%if (texto[17].equals(" ")){%>
        &nbsp; 
        <%}else{%>
        <%=texto[17]%> 
        <%}%>
       </p>
    </td>
  </tr>
  <tr> 
    <td width="30%" height="26"><b>Inicio 
      de clases</b></td>
    <td width="35%" height="26">
      <%if (texto[18].equals(" ")){%>
      &nbsp; 
      <%}else{%>
      <%=texto[18]%> 
      <%}%>
      </td>
  </tr>
 <% if (!idplan.equals("287")){ %>
  <tr> 
    <td width="30%" height="26"><b>Preinscripcion</b></td>
    <td width="35%" height="26"><%if (texto[28].equals(" ")){%>
      &nbsp;
      <%}else{%>
      <%=texto[28]%>
      <%}
        }%></td>
  </tr>
</table>
        
        
        <%ban = 1;      			   
        }  
        
        }%>
        
        <!%if ((idplan.equals("129")) || (idplan.equals("281")) ) {%>
        <!--
        <A HREF="Extemporaneas?idplan=<%=idplan%>"><center>
  <font size="4"><b> INSCRIPCIONES EXTEMPORANEAS </b> </font> 
</center>
        </a> -->
        <!% }%>
        <%if (ban == 0) { %> 
        <p> No existe información registrada para este programa
        <%} %>
        
        
    </body>
</html>
