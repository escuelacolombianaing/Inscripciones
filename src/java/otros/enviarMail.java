/*
 * enviarMail.java
 *
 * Created on 2 de febrero de 2007, 04:09 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package otros;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Vector;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 *
 * @author alexgz
 */
public class enviarMail {
    
    /** Creates a new instance of enviarMail */
    public enviarMail() {
    }
    
    /*
      String Datos="";
        String apellidos = request.getParameter("apellidos");       
        String nombre = request.getParameter("nombres"); 
        String doc=request.getParameter("doc");
        String doc2 = request.getParameter("doc2"); 
        String tel = request.getParameter("tel");
        String edad = request.getParameter("edad");      
        String colegio = request.getParameter("colegio"); 
        String grado = request.getParameter("grado"); 
        String email = request.getParameter("correo");   
        otros.rutas ruta = new otros.rutas();
     
     **/
    
    public String enviar(String to, String asunto, String correo, String apellidos,  String nombres,  String doc, String doc2,String tel,String edad, String colegio, String grado, String categoria) throws Exception{
        String host = "smtp.escuelaing.edu.co";
        String mensaje = "Mensaje Enviado";
        Vector despestud = new Vector();
     //   inicio.conectaEJB conEjb = new inicio.conectaEJB();
       // BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
   //     Vector listaestud = profesor.getListaNotas(to, peracad);
      //  String filename = new String("C:\\Sun\\correo");
      //  String filename = new String("C:/Sun/Backup");
        String filename = new String("/usr/local/SUN/mecanica");
        int i = 0, j=0;
        eci.adjuntar lista = new eci.adjuntar(correo, filename);
        String Datos="";
         Datos= Datos + "apellidos:" + apellidos + "\n" + "nombre:" + nombres + "\n" + "Documento:" + doc + "\n" + "Confirmación Documento:" + doc2 + "\n" + "Edad:" + edad + "\n" + "Teléfono:" + tel + "\n"+  "Colegio:" + colegio + "\n"
        + "Grado:" + grado + "\n" + "Email:" + correo + "\n" + "Categoria:" + categoria + "\n" ;
        try{
                Properties prop = new Properties();
                prop.put("mail.smtp.host", host);
                Session ses1 = Session.getDefaultInstance(prop, null);
                MimeMessage msg = new MimeMessage(ses1);
                msg.setFrom(new InternetAddress(correo.trim()));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress("concursomecanica@escuelaing.edu.co" ));
              //  msg.addRecipient(Message.RecipientType.BCC, new InternetAddress("concursomecanica@escuelaing.edu.co"));
                msg.setSubject(asunto);
                
                if(lista.nArchivos()>0){
                    BodyPart msgBP = new MimeBodyPart();
                      String texto= Datos + "\n\n"; 
                    msgBP.setText(texto);
                    Multipart mpart = new MimeMultipart();
                    mpart.addBodyPart(msgBP);
                    for (j=0 ; j < lista.nArchivos() ; j++ ){
                        msgBP = new MimeBodyPart();
                        //las lineas q tienes este 2 deben ir en este codigo se comentarizaron porq se hicieron cambios en adjuntar para
                        //el cargue de documentos admisiones
                      /*2*///  DataSource src = new FileDataSource(filename + "/" +  lista.nomArchivo(j));
                   /*2*///     msgBP.setDataHandler(new DataHandler(src));
                     /*2*///   msgBP.setFileName(lista.nomArchivo(j));
                        mpart.addBodyPart(msgBP);
                        msg.setContent(mpart);
                       
                    }  
                     Transport.send(msg);
                      mensaje = "ok";
                }
                
               
        } catch (Exception e) {
          mensaje = "error: " + filename + "/" + " ---- " + e.getMessage();
        }
        lista.totArchivo();
        return mensaje;
        //return enviarprueba();
    }
    
    public String enviarInst(String to, String asunto, String texto, String correo, String exto,  String pags_cops, String log) throws Exception{
        String host = "smtp.escuelaing.edu.co";
        String mensaje = "Mensaje Adjunto";
        String filename = new String("/usr/local/SUN/mecanica");
      //  String filename = new String("/usr/local/SUN/mecanica");
        eci.adjuntar lista = new eci.adjuntar(correo,filename);
        int i = 0, j=0;
        try{
                Properties prop = new Properties();
                prop.put("mail.smtp.host", host);
                Session ses1 = Session.getDefaultInstance(prop, null);
                MimeMessage msg = new MimeMessage(ses1);
                msg.setFrom(new InternetAddress(correo.trim() ));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to.trim() + exto));
                msg.setSubject(asunto);
              
                    BodyPart msgBP = new MimeBodyPart();
                    msgBP.setText(texto);
                    Multipart mpart = new MimeMultipart();
                    mpart.addBodyPart(msgBP);
                    for (j=0 ; j < lista.nArchivos() ; j++ ){
                        msgBP = new MimeBodyPart();
                     /*2*///   DataSource src = new FileDataSource(filename +  "/" + lista.nomArchivo(j));
                     /*2*///   msgBP.setDataHandler(new DataHandler(src));
                       /*2*/// msgBP.setFileName(lista.nomArchivo(j));
                        mpart.addBodyPart(msgBP);
                        msg.setContent(mpart);
                    }
                    
           /*     if(log.equals("log")){
                    SimpleDateFormat formatter = new SimpleDateFormat ("dd/MM/yyyy'-'hh:mm:ss");
                    Date currentTime_1 = new Date();
                    String dateString = formatter.format(currentTime_1);
                    ParsePosition pos = new ParsePosition(0);
                    Date currentTime_2 = formatter.parse(dateString, pos);
                    //FileWriter arch = new FileWriter("C:\\Sun\\AppServer\\config\\logimpre.log", true); 
                    FileWriter arch = new FileWriter("C:/Sun/config/logimpre.log", true);     
                    BufferedWriter arch1 = new BufferedWriter(arch); 
                    PrintWriter entrada = new PrintWriter(arch1); 
                    String fec = (String)correo + "," + (String)dateString + "," + pags_cops; 
                    entrada.println(fec);                 
                    //entrada.println(cadena);                 
                    entrada.close();
                    arch.close();
                }*/
                Transport.send(msg);
                mensaje = correo;
        } catch (Exception e) {
          mensaje = "error";// + lista.nArchivos() + ": " + e.getMessage();
        }
        return mensaje;
    }
    
    public String enviarprueba() throws Exception{
        String host = "smtp.escuelaing.edu.co";
        String to = "concursomecanica@escuelaing.edu.co";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", host);
        Session ses1 = Session.getDefaultInstance(prop, null);
        //Store store1 = ses1.getStore("pop3");
        MimeMessage msg = new MimeMessage(ses1);
        msg.setFrom(new InternetAddress("concursomecanica@escuelaing.edu.co"));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setSubject("Correo adjunto enviado");
        msg.setText("Correo adjunto enviado");
        Transport.send(msg);
        return "MENSAJE ENVIADO";
        
        
        /*String host = "smtp.escuelaing.edu.co";
        //String host = "190.24.150.69";
        String mensaje = "Mensaje Enviado";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", host);
        Session ses1 = Session.getDefaultInstance(prop, null);
        MimeMessage msg = new MimeMessage(ses1);
        msg.setFrom(new InternetAddress("aguiza@escuelaing.edu.co"));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress("aguiza@escuelaing.edu.co"));
        msg.setSubject("Hola Mundo");
        msg.setText("Mundo Hola");
        Transport.send(msg);
        return mensaje;*/
    }
}
