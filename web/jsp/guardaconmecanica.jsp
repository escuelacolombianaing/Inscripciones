<%@ page import="java.util.*,java.net.*,javax.mail.*,javax.mail.internet.*,java.util.Properties,java.awt.*,java.io.*, java.text.*" %>



<%
String host = "smtp.escuelaing.edu.co";
String to = "concursomecanica@escuelaing.edu.co";
String mensaje = new String("Sus datos  han sido enviados exitosamente, pronto le estaremos contactando");
String Datos="";
String apellidos = request.getParameter("apellidos");
String nombres = request.getParameter("nombres");
String doc=request.getParameter("doc");
String doc2 = request.getParameter("doc2");
String tel = request.getParameter("tel");
String edad = request.getParameter("edad");
String colegio = request.getParameter("colegio");
String grado = request.getParameter("grado");
String email = request.getParameter("correo");
otros.rutas ruta = new otros.rutas();
%>

<html>
    <head>
        <title>Concurso Ingeniería Mecánica</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        
        
    </head>
    
    <body bgcolor="#FFFFFF" text="#000000">
        
        <table align="center" width="65%" border="0" height="74">
            <tr> 
                
                <td width="11%" height="88"><img src="img/logo.gif" width="83" height="90"></td>
                
                <td width="1%" height="88">&nbsp;</td>
                
                <td width="88%" height="88"> 
                    <div align="center">
                        
                        <p><b><font size="3" color="#CC0000">ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
                        JULIO GARAVITO</font></b></p>
                        <p><font size="3"><b>CONCURSO INGENIERIA MECANICA</b></font></p>
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
            FileReader ra = new FileReader(ruta.valruta() +  ruta.tokenruta() + "conmecanica.txt");
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
                    
                
                FileWriter arch = new FileWriter(ruta.valruta() +  ruta.tokenruta() + "conmecanica.txt", true);
                BufferedWriter arch1 = new BufferedWriter(arch);
                PrintWriter entrada = new PrintWriter(arch1);
                String datos = (String)contador+"$"+(String)doc+"$"+(String)doc2+"$"+(String) apellidos.toUpperCase()+"$"+(String)nombres.toUpperCase()+"$"+(String)edad+"$"+(String)tel;
                datos = (String)datos+"$"+(String)colegio.toUpperCase()+"$"+(String)grado+" $"+(String)email+"$";
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
        
       <% 
String Datos1="";
Datos1= Datos1 + "apellidos:" + apellidos + "\n" + "nombre:" + nombres + "\n" + "Documento:" + doc + "\n" + "Confirmación Documento:" + doc2 + "\n" + "Edad:" + edad + "\n" + "Teléfono:" + tel + "\n"+  "Colegio:" + colegio + "\n"
        + "Grado:" + grado + "\n" + "Email" + email + "\n"  ;

try{
    Properties prop = new Properties();
    prop.put("mail.smtp.host", host);
    Session ses1 = Session.getDefaultInstance(prop, null);
    MimeMessage msg = new MimeMessage(ses1);
    msg.setFrom(new InternetAddress(email));
    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
    String asunto="Concurso Ingeniería Mecánica";
    String texto1= Datos1 + "\n\n";
    msg.setSubject(asunto);
    msg.setText(texto1);
    Transport.send(msg);
} catch (Exception e) {
    mensaje = "<center>Por favor ingrese una dirección de correo válida en el campo email.</center>" ;
}%>
        
        <%if (i==1){%>
        <p><b><font size="4">N&uacute;mero de Radicaci&oacute;n : <%=contador%></font></b><br>
        Nombre del aspirante: <%=apellidos.toUpperCase()%> <%=nombres.toUpperCase()%><br>
        Documento de identidad: <%=doc%><br>
        Teléfono: <%=tel%><br>
        
        <input type=button name=print value="Imprimir" onClick="javascript:window.print()">
        <%}%>
        <%}
        else{%>
        <p><b><center>Usted ya ingresó sus datos anteriormente</center></b><br>
        <b><font size="3"><center>N&uacute;mero de Radicaci&oacute;n de Solicitud: <%=num%></center></font></b></p>
        <%}%>
        
    </body>
</html>
