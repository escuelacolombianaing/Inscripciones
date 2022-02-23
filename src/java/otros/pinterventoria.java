/*
 * especializaciones.java
 *
 * Created on 26 de enero de 2007, 11:32 AM
 */
package otros;

import java.io.*;
import java.io.IOException;
import java.util.Vector;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.*;
import java.util.*;
import javax.servlet.http.*;
import java.util.Properties;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.activation.*;


/**
 *
 * @author lrodriguez
 * @version
 */
public class pinterventoria extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String host = "smtp.office365.com";
        final String to = "premio.ani@escuelaing.edu.co";        
        String smtp;
        String mensaje = new String("Su solicitud ha sido enviada exitosamente, pronto le estaremos contactando.");
       // HttpSession session = request.getSession(true);
        String Datos = "";
       // String programa = request.getParameter("programa");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido"); 
        String concesion = request.getParameter("concesion");
        String proyecto = request.getParameter("proyecto");        
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");        
        final String clave = (String)"premioani.2016"; 
        //    String comentar = request.getParameter("comentarios");
       /* Datos= Datos + "Programa:" + programa + "\n" + "nombre:" + nombre + "\n" + "Profesion:" + prof + "\n" + "Cargo:" + cargo + "\n" + "Empresa:" + empresa + "\n"+  "Direccion:" + direccion + "\n"
         + "Ciudad:" + ciudad + "\n" + "Telefono:" + telefono + "\n" + "Celular:" + celular + "\n" + "Comentarios:" +comentar + "\n" ;*/
        Datos = Datos + "Nombres: " + nombre + "\n" + "Apellidos: " + apellido + "\n" + "Nombre concesionario: " + concesion + "\n" + "Nombre proyecto: " + proyecto + "\n" + "Celular: " + celular + "\n" + "Correo electrónico: " + email + "\n" ;
        try {
            smtp = "smtp.office365.com";
            MimeMultipart multipart = new MimeMultipart();
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", smtp);
            properties.put("mail.smtp.port", "587");
            Session session;
            session = Session.getInstance(properties, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(to, clave);
                }
            });

            session.setDebug(true);
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(to));
            msg.setRecipients(Message.RecipientType.BCC, to);
            String asunto = "Asistencia 3er. Premio Nacional de Interventoría";
            msg.setSubject(asunto);
            msg.setSentDate(new Date());
            String texto = Datos + "\n\n";
            texto = Datos + "\n\n";
            msg.setText(texto);
            Transport.send(msg);
            // mensaje = "ok";
        } catch (Exception e) {
            mensaje = "<center>Por favor ingrese una dirección de correo válida en el campo email.</center>";
        }
        response.sendRedirect("Correcto");
       /* out.println("<html>");
        out.println("<head>");
        out.println("<title>Formulario Solicitud Información</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2> " + mensaje + "</h2>");
        out.println("</body>");
        out.println("</html>");
        out.close();*/  
              
        
    }
}