/*
 * maestria.java
 *
 * Created on 9 de mayo de 2008, 12:07 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
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
public class maestria extends HttpServlet {

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String host = "smtp.escuelaing.edu.co";
        String idplan = request.getParameter("idplan");
        //  String to= "";
      /*  if (idplan.equals("290"))
        to = "juanpablo.garcia@escuelaing.edu.co";*/
        String to = "maestriacivil@escuelaing.edu.co";
        
        /*else
        to = "lucero.rodriguez@escuelaing.edu.co";
         */
        String mensaje = new String("Su solicitud ha sido enviada exitosamente, pronto le estaremos contactando");
        HttpSession session = request.getSession(true);
        String Datos = "";
        String programa = request.getParameter("programa");
        String nombre = request.getParameter("nombre");
        String prof = request.getParameter("profesion");
        String cargo = request.getParameter("cargo");
        String empresa = request.getParameter("empresa");
        String direccion = request.getParameter("direccion");
        String ciudad = request.getParameter("ciudad");
        
        String telefono = request.getParameter("telefono");
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
        //    String comentar = request.getParameter("comentarios");
        // Datos = Datos + "Programa:" + programa + "\n" + "nombre:" + nombre + "\n" + "Profesion:" + prof + "\n" + "Cargo:" + cargo + "\n" + "Empresa:" + empresa + "\n" + "Direccion:" + direccion + "\n" + "Ciudad:" + ciudad + "\n" + "Telefono:" + telefono + "\n" + "Celular:" + celular + "\n" + "Comentarios:" + comentar + "\n";
        Datos = Datos + "Programa:" + programa + "\n" + "nombre:" + nombre + "\n" + "Profesion:" + prof + "\n" + "Direccion:" + direccion + "\n" + "Ciudad:" + ciudad + "\n" + "Telefono:" + telefono + "\n" + "Celular:" + celular + "\n" + "Email:" + email + "\n" + "medio1:" + medio1 + "\n" + "medio2:" + medio2 + "\n" + "medio3:" + medio3 + "\n" + "medio4:" + medio4 + "\n" + "medio5:" + medio5 + "\n" + "medio6:" + medio6 + "\n" + "medio7:" + medio7 + "\n" + "medio8:" + medio8 + "\n" + "medio9:" + medio9 + "\n" + "medio10:" + medio10 + "\n";
        try {
            Properties prop = new Properties();
            prop.put("mail.smtp.host", host);
            Session ses1 = Session.getDefaultInstance(prop, null);
            MimeMessage msg = new MimeMessage(ses1);
            msg.setFrom(new InternetAddress(email));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            String asunto = "Información Maestría";
            String texto = Datos + "\n\n";
            msg.setSubject(asunto);
            msg.setText(texto);
            Transport.send(msg);
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