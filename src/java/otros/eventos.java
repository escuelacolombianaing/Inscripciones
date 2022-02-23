/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package otros;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Vector;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Lucero
 */
/**
 *
 * @author lrodriguez
 * @version
 */
public class eventos extends HttpServlet {

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String host = "smtp.office365.com";
         //String to = "lucero.rodriguez@escuelaing.edu.co";

        String mensaje = new String("<center>Su solicitud de inscripción al evento ha sido enviada exitosamente.</center>");
        //HttpSession session = request.getSession(true);
        String smtp;
        String Datos = "";
        String datos1 = "";
        String datos2 = "";
        String nombres = request.getParameter("nombres");
        String ape1 = request.getParameter("ape1");
        String ape2 = request.getParameter("ape2");
        String telefono = request.getParameter("telefono");
        String doc = request.getParameter("doc");
        String empresa = request.getParameter("empresa");
        String email = request.getParameter("correo");
        String clave =  request.getParameter("valorDado");
        String idevento= request.getParameter("idevento");
        final String origen = "educont@escuelaing.edu.co";
        // String to = "lucero.rodriguez@escuelaing.edu.co";
        String to = email;
        final String clave1 = (String)"51703506";
        /*  Datos= Datos + "Programa:" + programa + "\n" + "nombre:" + nombre + "\n" + "Profesion:" + prof + "\n" + "Cargo:" + cargo + "\n" + "Empresa:" + empresa + "\n"+  "Direccion:" + direccion + "\n"
        + "Ciudad:" + ciudad + "\n" + "Telefono:" + telefono + "\n" + "Celular:" + celular + "\n" + "Comentarios:" +comentar + "\n" ;
         */
        Datos = Datos +"Nombres:"  + nombres + " "+   ape1 + " " + ape2 + "\n" ;
        datos2 = "\n" + empresa + "\n";
       
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
             return new PasswordAuthentication(origen, clave1);
         }
     });
                  
                    session.setDebug(true);
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(origen));
                    msg.setRecipients(Message.RecipientType.BCC, email);
                   String asunto="Clave para acceder a memorias de los Encuentros de Ingenieros de Suelos y Estructuras";
            String texto2 = "Su clave para descargar las memorias del evento es: " + clave + "\n" ;
            String texto= Datos + "\n\n" + texto2 + "\n"  ;
            msg.setSubject(asunto);
            msg.setText(texto);
            Transport.send(msg);
                   // mensaje = "ok";
               }  catch (Exception e) {
            mensaje = "<center>Por favor ingrese una dirección de correo válida en el campo email.</center>" ;
        }  
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Formulario Solicitud Información</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2> " + mensaje + "</h2>");
        response.sendRedirect("Validacion?idevento=" + idevento);
        out.println("</body>");
        out.println("</html>");
        out.close();
    }
}
