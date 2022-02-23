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
public class educontprueba extends HttpServlet {

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
        final String to = "educont@escuelaing.edu.co";
        // final String to = "lucero.rodriguez@escuelaing.edu.co";
        String smtp;
        //String to = "lucero.rodriguez@escuelaing.edu.co";
        String mensaje = new String("Su solicitud ha sido enviada exitosamente, pronto le estaremos contactando");
        //  HttpSession session = request.getSession(true);    
        HttpSession sesion;
        String Datos = "";
        String programa = request.getParameter("programa");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String prof = request.getParameter("profesion");
        String o = request.getParameter("o");
        // String cargo = request.getParameter("cargo");
        //String empresa = request.getParameter("empresa");
        // String direccion = request.getParameter("direccion");
        String ciudad = request.getParameter("ciudad");
        // String telefono = request.getParameter("tel");
        String celular = request.getParameter("celular");

        String email = request.getParameter("email");
        // String comentar = request.getParameter("comentarios");
        String listado = request.getParameter("listado");
        final String clave = (String) "52308616";
        //final String clave = (String)"FelipeRR2105";
        out.println(" <script language=\"javascript\" type=\"text/javascript\">");
        out.println("var _imMktOptions = _imMktOptions || {_setType: 'Lead', _setDomain:www.escuelaing.edu.co'',_itemsQuantity: 6,_amount:100,_extraInfo: 'trx: 10'}");
        out.println("(function() { ");
        out.println("var icomMkt = document.createElement('script'); icomMkt.type = 'text/javascript'");
        out.println("icomMkt.async = true");
        out.println("icomMkt.src = ('https:' == document.location.protocol ? 'https://' : 'http://') +'api.icommarketing.com/js/icomMkt_tracking.js?time='+ Number(new Date())");
        out.println("var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(icomMkt, s)})()");
        out.println("</script>");
        out.println("<noscript>");
        out.println(" <div style=\"display:inline;\">");
        out.println("<img height=\"1\" width=\"1\" style=\"border-style:none;\"");
        out.println("alt=\"\"src=\"https://api.icommarketing.com/pixel.aspx?opt=Lead&domain=www.dominio.com&itemsQuantity=-1&amount=-1&extraInfo=Info Adicional\">");
        out.println("</div >");

        out.println("</noscript");
                 /*  String medio1 = request.getParameter("medio1");
                 String medio2 = request.getParameter("medio2");
                 String medio3 = request.getParameter("medio3");
                 String medio4 = request.getParameter("medio4");
                 String medio5 = request.getParameter("medio5");
                 String medio6 = request.getParameter("medio6");
                 String medio7 = request.getParameter("medio7");
                 String medio8 = request.getParameter("medio8");
                 String medio9 = request.getParameter("medio9");
                 String medio10 = request.getParameter("medio10");*/ /*  Datos= Datos + "Programa:" + programa + "\n" + "nombre:" + nombre + "\n" + "Profesion:" + prof + "\n" + "Cargo:" + cargo + "\n" + "Empresa:" + empresa + "\n"+  "Direccion:" + direccion + "\n"
                 + "Ciudad:" + ciudad + "\n" + "Telefono:" + telefono + "\n" + "Celular:" + celular + "\n" + "Comentarios:" +comentar + "\n" ;
                 */ /* Datos= Datos + "Programa:" + programa + "\n" + "nombre:" + nombre + "\n" + "Profesion:" + prof + "\n" +  "Direccion:" + direccion + "\n"
                 + "Ciudad:" + ciudad + "\n" + "Telefono:" + telefono + "\n" + "Celular:" + celular + "\n" + "Email:" +email + "\n" +  "medio1:" + medio1 + "\n" +  "medio2:" + medio2 + "\n" +  "medio3:" + medio3 + "\n" +  "medio4:" + medio4 + "\n" +  "medio5:" + medio5 + "\n" +  "medio6:" + medio6 + "\n" +  "medio7:" + medio7 + "\n"  +  "medio8:" + medio8 + "\n" +  "medio9:" + medio9 + "\n" +  "medio10:" + medio10 + "\n" +  "Medio:" + listado + "\n";*/ Datos = Datos + "Programa:" + programa + "\n" + "nombre:" + nombre + "\n" + "apellido:" + apellido + "\n" + "Profesion:" + prof + "\n" + "Ciudad:" + ciudad + "\n" + "Celular:" + celular + "\n" + "Email:" + email + "\n" + "Medio:" + listado + "\n";
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
            String asunto = "Información Programas de Educación Continuada";
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
        if (o.equals("12427")) {
            out.println("<iframe src=\"http://clickmagictrk.com/p.ashx?o=12427&t= " + email);
            out.println("height=\"1\" width=\"1\" frameborder=\"0\"></iframe> ");
        } else if (o.equals("12454")) {

            out.println("<iframe src=\"http://clickmagictrk.com/p.ashx?o=12454&t= " + email);
            out.println("height=\"1\" width=\"1\" frameborder=\"0\"></iframe> ");
        } else if (o.equals("12453")) {
            out.println("<iframe src=\"http://clickmagictrk.com/p.ashx?o=12453&t= " + email);
            out.println("height=\"1\" width=\"1\" frameborder=\"0\"></iframe> ");
        } else if (o.equals("12456")) {
            out.println("<iframe src=\"http://clickmagictrk.com/p.ashx?o=12456&t= " + email);
            out.println("height=\"1\" width=\"1\" frameborder=\"0\"></iframe> ");
        } else if (o.equals("12455")) {
            out.println("<iframe src=\"http://clickmagictrk.com/p.ashx?o=12455&t= " + email);
            out.println("height=\"1\" width=\"1\" frameborder=\"0\"></iframe> ");
        } else if (o.equals("12457")) {
            out.println("<iframe src=\"http://clickmagictrk.com/p.ashx?o=12457&t= " + email);
            out.println("height=\"1\" width=\"1\" frameborder=\"0\"></iframe> ");
        } else if (o.equals("12458")) {
            out.println("<iframe src=\"http://clickmagictrk.com/p.ashx?o=12458&t= " + email);
            out.println("height=\"1\" width=\"1\" frameborder=\"0\"></iframe> ");
        } else if (o.equals("12459")) {
            out.println("<iframe src=\"http://clickmagictrk.com/p.ashx?o=12459&t= " + email);
            out.println("height=\"1\" width=\"1\" frameborder=\"0\"></iframe> ");
        } else if (o.equals("12464")) {
            out.println("<iframe src=\"http://clickmagictrk.com/p.ashx?o=12464&t= " + email);
            out.println("height=\"1\" width=\"1\" frameborder=\"0\"></iframe> ");
        } else if (o.equals("12465")) {
            out.println("<iframe src=\"http://clickmagictrk.com/p.ashx?o=12465&t= " + email);
            out.println("height=\"1\" width=\"1\" frameborder=\"0\"></iframe> ");
        }

        out.println("</body>");
        out.println("</html>");
        out.close();
    }
}