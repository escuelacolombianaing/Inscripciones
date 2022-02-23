/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Lucero
 */
package otros;

import java.io.*;
import java.net.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.activation.*;

/**
 *
 * @author lrodriguez
 * @version
 */
public class gestion extends HttpServlet {

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String host = "smtp.escuelaing.edu.co";

        String mensaje = new String("<center>Su solicitud de inscripción a la III Jornada de Gestión de Información ha sido enviada exitosamente, pronto le estaremos contactando</center>");
        //HttpSession session = request.getSession(true);
        String Datos = "";
        String datos1 = "";
        String datos2 = "";
        String nombres = request.getParameter("nombres").toUpperCase();
        String ape1 = request.getParameter("ape1").toUpperCase();
        String ape2 = request.getParameter("ape2").toUpperCase();
        String telefono = request.getParameter("telefono");
        String doc = request.getParameter("doc");
        String empresa = request.getParameter("empresa").toUpperCase();
        String email = request.getParameter("correo");
        // String to = "lucero.rodriguez@escuelaing.edu.co";
        String to = email;

        //String file = "C:\\J2EE\\Inscripciones\\web\\img\\logo_gestion.jpg";

        String file = "/usr/local/SUN/2/glassfish/domains/domain1/applications/j2ee-modules/inscripciones/img/logo_gestion.jpg";

        /*  Datos= Datos + "Programa:" + programa + "\n" + "nombre:" + nombre + "\n" + "Profesion:" + prof + "\n" + "Cargo:" + cargo + "\n" + "Empresa:" + empresa + "\n"+  "Direccion:" + direccion + "\n"
        + "Ciudad:" + ciudad + "\n" + "Telefono:" + telefono + "\n" + "Celular:" + celular + "\n" + "Comentarios:" +comentar + "\n" ;
         */
        Datos = Datos + nombres + "\n" + ape1 + " " + ape2 + "\n";
        datos2 = "\n" + empresa + "\n";
        String titulo = "III JORNADA DE GESTIÓN DE INFORMACIÓN";
        String texto1 = "Muchas gracias por inscribirse a la III Jornada de Gestión de Información," + "\n" + "evento que realizaremos el próximo jueves 21 de noviembre a las 8:30 a.m." + "\n" + " Con el fin de agilizar la inscripción el día del evento, por favor imprima el siguiente mensaje y recorte la escarapela." + "\n";
        String texto2 = "Cordialmente,";
        String texto3 = "Escuela Colombiana de Ingeniería Julio Garavito";
        String texto4 = "Maestría en Gestión de Información";
        String texto5 = "educont@escuelaing.edu.co";
        String texto6 = "Autopista Norte  AK 45 # 205 - 59 Bogotá";
        String texto7 = "Call Center: (57-1) 6683622 -  Fax: (57-1) 6762474";
        String texto8 = "Bogotá,D.C.  - Colombia - Sur  América";
        String texto9 = "www.escuelaing.edu.co";
        try {

            Properties prop = new Properties();
            prop.put("mail.smtp.host", host);
            Session ses1 = Session.getDefaultInstance(prop, null);
            MimeMessage msg = new MimeMessage(ses1);
            msg.setFrom(new InternetAddress("educont@escuelaing.edu.co"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            String asunto = "Inscripción III Jornada Gestión de la Información ";
            BodyPart msgBodyPart = new MimeBodyPart();
            // String texto = Datos + "\n";
            String fec = "Noviembre  21 de 2013";
            String hora = "8:30 a.m.";
            String Lugar = "Aula Máxima";
            String htmlText = "<p>" + texto1 + "<table width=\"55%\" border=\"3\" height=\"250\"> <tr> <td><table width=\"100%\" border=\"0\" height=\"100%\"> <tr> <td colspan=3 align=center> <img src=\"cid:memememe\" width=\"230\" height=\"130\" align=left></td></tr><tr> <td colspan=3 align=center> " +  "</td></tr><tr><td colspan=2  align=center>" + "<h3>" + titulo + "<p>" + "\n" + "</td></tr><tr><td colspan=3 ALIGN=CENTER>" + "<br><h3>" + Datos + "</h3>" + "\n" + "<h3>" + empresa + "<p>" + "</h3>" + "</td></tr><tr><td colspan=2 align=center><h3>Fecha: " + fec + " </td></tr><tr><td colspan=2 align=center><h3>Hora: " + hora + "</td></tr><tr><td colspan=2 align=center><h3>Lugar: " + Lugar + " <p></td></tr><tr><td colspan=3> <table width=\"100%\" border=3><tr><td align=left><p><h3>Refrigerio </p></td><td align=left><p> <h3>Almuerzo</p></td></tr></table> </table></table>" + texto2 + "<p>" + texto3 + "<br>" + texto4 + "<br>" + texto5 + "<br>"+ texto6 +"<br>"+ texto7 +"<br>"+texto8+ "<br>"+ texto9 ;
            msgBodyPart.setContent(htmlText, "text/html");
            MimeMultipart multipart = new MimeMultipart("related");
            multipart.addBodyPart(msgBodyPart);
            msgBodyPart = new MimeBodyPart();
            DataSource fds = new FileDataSource(file);
            msgBodyPart.setDataHandler(new DataHandler(fds));
            msgBodyPart.setHeader("Content-ID", "memememe");
            multipart.addBodyPart(msgBodyPart);

            msg.setSubject(asunto);
            // msg.setText(texto);
            msg.setContent(multipart);
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
