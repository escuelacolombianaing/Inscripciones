/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
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
public class Pregrados extends HttpServlet {

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String host = "smtp.office365.com";
        String smtp;
        // String host = "smtp.escuelaing.edu.co";
        final String to = "pregrado@escuelaing.edu.co";
        String mensaje = new String("Su solicitud ha sido enviada exitosamente, pronto le estaremos contactando");
       // HttpSession session = request.getSession(true);
        String Datos="";
        String programa = request.getParameter("programa");
        String nombre = request.getParameter("nombre"); 
        String grado=request.getParameter("grado");
        String fechagrad = request.getParameter("fechagrad");
        String colegio = request.getParameter("colegio");
        String ciudad = request.getParameter("ciudad");
        String telefono = request.getParameter("tel");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        String comentar = request.getParameter("comentarios");
         final String clave = (String)"52308616";
        Datos= Datos + "Programa:" + programa + "\n" + "Nombres:" + nombre + "\n" + "Grado:" + grado + "\n" + "Fecha de Grado(dd/mm/aaaa):" + fechagrad + "\n"  +  "Colegio:" + colegio +  "\n" +   "Ciudad:" + ciudad + "\n" + "Telefono:" + telefono + "\n" + "Celular:" + celular + "\n" + "Comentarios:" +comentar + "\n" ;

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
            String asunto = "Información Programas de Pregrado";
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