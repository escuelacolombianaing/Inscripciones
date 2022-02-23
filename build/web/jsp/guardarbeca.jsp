<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%
        String apellidos = request.getParameter("apellidos"); 
        String nombre = request.getParameter("nom"); 
        String dircor = request.getParameter("dircor"); 
        String tel = request.getParameter("tel"); 
        String ciudad = request.getParameter("ciudad"); 
        String email = request.getParameter("email"); 
        String doc = request.getParameter("doc"); 
        String numreg = request.getParameter("numreg"); 
        String programa = request.getParameter("prog"); 
        String codcol = request.getParameter("codcol"); 
        String justi = request.getParameter("justi"); 
        otros.rutas ruta = new otros.rutas();
%>

<html>
<head>
<title>Convocatoria Becas Julio Garavito Armero</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">


</head>

<body bgcolor="#FFFFFF" text="#000000">
  
<table width="98%" border="0" height="74">
  <tr> 
      
    <td width="11%" height="88"><img src="img/logo.gif" width="83" height="90"></td>
      
    <td width="1%" height="88">&nbsp;</td>
      
    <td width="88%" height="88"> 
      <div align="center">
          
        <p><b><font size="3" color="#CC0000">ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
          JULIO GARAVITO</font></b></p>
        <p><font size="3"><b>CONVOCATORIA BECAS JULIO GARAVITO ARMERO 2008-2</b></font></p>
        </div>
      </td>
    </tr>
  </table>

<!--SE ABRE ARCHIVO PARA LECTURA-->
<%     String arreglo[]=new String[5000];       
       String texto[]=new String[2000];
       String num = "";
       int ii=0, n=1;
       int k=0;
      
 try {
          FileReader ra = new FileReader(ruta.valruta() +  ruta.tokenruta() + "becas.txt");  
           // FileReader ra = new FileReader("/usr/local/jakarta-tomcat-3.2.1/confEci/becas/becas.txt");     
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
<!-- COMPARAR CAMPOS Y GENERAR SECUENCIA-->
<%
    String text[] = new String[2000];   
    int l, b = 0, a = 0, s = 0, con;
    String contador = "";
        for (int j=0; j<ii; j++){
                StringTokenizer st = new StringTokenizer(arreglo[j], "$");
                k=0;%>
             
              <%while (st.hasMoreTokens()) { 
                    texto[k]=st.nextToken();
                    %>
  		<%
                   if (k>0){
                    if (texto[1].equals(doc)){
                        s = 1;
                        num = texto[0];}
                    }                
                        k=k+1;                 
                 } %> 
            <%}
        con = Integer.parseInt(texto[0]);
        con = con + 1;
        contador=String.valueOf(con);
        %>

<!-- FIN COMPARACION-->

<% if (s==0){
        int i=0;       try {
                 //FileWriter arch = new FileWriter("../confECI/becas.txt", true); 
                 //FileWriter arch = new FileWriter("C:\\jakarta-tomcat-3.2.1\\confEci\\becas\\becas.txt",true);
                  FileWriter arch = new FileWriter(ruta.valruta() +  ruta.tokenruta() + "becas.txt", true);     
                  BufferedWriter arch1 = new BufferedWriter(arch); 
                  PrintWriter entrada = new PrintWriter(arch1); 
                  String datos = (String)contador+"$"+(String)doc+"$"+(String) apellidos.toUpperCase()+" "+(String)nombre.toUpperCase()+"$"+(String)dircor.toUpperCase()+"$"+(String)tel; 
                  datos = (String)datos+"$"+(String)ciudad.toUpperCase()+"$"+(String)email+" $"+(String)numreg.toUpperCase()+"$"+(String)programa+"$"+(String)codcol+"$"+(String)justi+"$"; 
                  entrada.println(datos);                                               
                  entrada.close();
		  arch.close();
		  arch1.close();
                  i=1;
        }catch(java.io.FileNotFoundException fnfex) { 
          System.out.println("Archivo no encontrado: " + fnfex); 
        %>
        <p>&nbsp;</p>	  
        <p>No pudo ser procesada su información</p>
        <%     }
        %>
        <%if (i==1){%>
        <p><b><font size="4">N&uacute;mero de Radicaci&oacute;n de Solicitud: <%=contador%></font></b><br>Nombre del aspirante: <%=apellidos.toUpperCase()%> <%=nombre.toUpperCase()%><br>
          Direcci&oacute;n de correspondencia: <%=dircor.toUpperCase()%><br>
          Teléfono: <%=tel%><br>
          Ciudad: <%=ciudad.toUpperCase()%><br>
          Documento de identidad: <%=doc%><br>
          Número de Registro Icfes: <%=numreg.toUpperCase()%><br>
          Programa: <%=programa%> <br>
          Justificación: <%=justi%> </p>
        
<!--<p>Recuerde que debe entregar en la oficina de Admisiones de la Escuela una carta 
          enunciando las razones por las cuales desea ingresar al programa elegido, indicando 
          el n&uacute;mero de radicaci&oacute;n de su solicitud que le asigno el sistema, 
          sus datos personales (nombres, apellidos, direcci&oacute;n, tel&eacute;fono 
          y ciudad ), el nombre y c&oacute;digo del colegio en que cursa o curso su &uacute;ltimo 
          a&ntilde;o de estudios y el n&uacute;mero de registro del ex&aacute;men de Estado 
          Icfes en su nueva versi&oacute;n (&uacute;nicamente a&ntilde;o 2000 en adelante).
        <p>Enviarse a: Avenida 13 No 205-59 Bogot&aacute; Escuela Colombiana de Ingenier&iacute;a, 
          Oficina de Admisiones o al fax 6762340 Bogot&aacute; o al correo electr&oacute;nico 
          <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a>-->
        
<p>Una vez verificado su resultado en el ex&aacute;men de Estado con el ICFES, 
  la Escuela hará una preselecci&oacute;n de candidatos, por lo cual deberá consultar 
  <b> el 28 de Mayo</b> a través de la página web de la Escuela, la citación a 
  las Entrevistas con el Decano y con el Psicólogo de la Institución. La selección 
  final de los beneficiarios de estas becas se publicará a través de esta misma 
  página el <b>04 de Junio de 2007</b>
<p>Para cualquier consulta puede comunicarse con la oficina de Admisiones donde 
          se aclararán sus inquietudes, al teléfono 6683600 opción 2 en el menú o al email: 
          <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co.</a> 
        <p align="center"> 
          <input type=button name=print value="Imprimir" onClick="javascript:window.print()">
        <%}%>
<%}
  else{%>
   <p><b>Usted ya ingreso sus datos anteriormente</b><br>
    <b><font size="3">N&uacute;mero de Radicaci&oacute;n de Solicitud: <%=num%></font></b></p>
 <%}%>

</body>
</html>
