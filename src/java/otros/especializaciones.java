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
public class especializaciones extends HttpServlet {

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
        final String to = "posgrados@escuelaing.edu.co";
        String smtp;
        String mensaje = new String("Su solicitud ha sido enviada exitosamente, pronto le estaremos contactando");
       // HttpSession session = request.getSession(true);
        String Datos = "";
        String programa = request.getParameter("programa");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido"); 
        String prof = request.getParameter("profesion");
        String cargo = request.getParameter("cargo");
        String empresa = request.getParameter("empresa");
        String direccion = request.getParameter("direccion");
        String ciudad = request.getParameter("ciudad");
        String telefono = request.getParameter("tel");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        String medio1 = request.getParameter("medio1");
        String medio2 = request.getParameter("medio2");
        String medio3 = request.getParameter("medio3");
        String medio4 = request.getParameter("medio4");
        String medio5 = request.getParameter("medio5");
        String medio6 = request.getParameter("medio6");
        String medio7 = request.getParameter("medio7");
        String medio8 = request.getParameter("medio8");
        String medio9 = request.getParameter("medio9");
        String medio10 = request.getParameter("medio10");
         final String clave = (String)"52308616";
        //    String comentar = request.getParameter("comentarios");
       /* Datos= Datos + "Programa:" + programa + "\n" + "nombre:" + nombre + "\n" + "Profesion:" + prof + "\n" + "Cargo:" + cargo + "\n" + "Empresa:" + empresa + "\n"+  "Direccion:" + direccion + "\n"
         + "Ciudad:" + ciudad + "\n" + "Telefono:" + telefono + "\n" + "Celular:" + celular + "\n" + "Comentarios:" +comentar + "\n" ;*/
        Datos = Datos + "Programa:" + programa + "\n" + "nombre:" + nombre + "\n" + "apellido:" + apellido + "\n" + "Profesion:" + prof + "\n" + "Direccion:" + direccion + "\n" + "Ciudad:" + ciudad + "\n" + "Telefono:" + telefono + "\n" + "Celular:" + celular + "\n" + "Email:" + email + "\n" + "medio1:" + medio1 + "\n" + "medio2:" + medio2 + "\n" + "medio3:" + medio3 + "\n" + "medio4:" + medio4 + "\n" + "medio5:" + medio5 + "\n" + "medio6:" + medio6 + "\n" + "medio7:" + medio7 + "\n" + "medio8:" + medio8 + "\n" + "medio9:" + medio9 + "\n" + "medio10:" + medio10 + "\n";
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
            String asunto = "Información Especializaciones";
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
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Formulario Solicitud Información</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2> " + mensaje + "</h2>");
        out.println("</body>");
        out.println("</html>");
        out.close();
    }
}