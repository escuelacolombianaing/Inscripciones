/*
 * conmecanica.java
 *
 * Created on 12 de marzo de 2009, 04:23 PM
 */

package otros;

import java.io.*;
import java.net.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.*;
import javax.servlet.http.*;


/**
 *
 * @author lrodriguez
 * @version
 */
public class conmecanica extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String host = "smtp.escuelaing.edu.co";
        String to = "lucero.rodriguez@escuelaing.edu.co";
        String mensaje = new String("Sus datos  han sido enviados exitosamente, pronto le estaremos contactando");
        HttpSession session = request.getSession(true);    
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
      
        Datos= Datos + "apellidos:" + apellidos + "\n" + "nombre:" + nombre + "\n" + "Documento:" + doc + "\n" + "Confirmación Documento:" + doc2 + "\n" + "Edad:" + edad + "\n" + "Teléfono:" + tel + "\n"+  "Colegio:" + colegio + "\n"
        + "Grado:" + grado + "\n" + "Email" + email + "\n"  ;
       
         try{
            Properties prop = new Properties();
            prop.put("mail.smtp.host", host);
            Session ses1 = Session.getDefaultInstance(prop, null);
            MimeMessage msg = new MimeMessage(ses1);
            msg.setFrom(new InternetAddress(email));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            String asunto="Concurso Ingeniería Mecánica";
            String texto= Datos + "\n\n"; 
            msg.setSubject(asunto);
            msg.setText(texto);
            Transport.send(msg);
            } catch (Exception e) {
            mensaje = "<center>Por favor ingrese una dirección de correo válida en el campo email.</center>" ;
        }
             
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Concurso de Ingeniería Mecánica</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2> " + mensaje + "</h2>");
        out.println("</body>");
        out.println("</html>");
        out.close();
            }
    }