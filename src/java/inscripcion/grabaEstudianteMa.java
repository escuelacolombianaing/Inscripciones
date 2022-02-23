/*
 * grabaEstudianteMa.java
 *
 * Created on 22 de mayo de 2008, 02:54 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package inscripcion;
import java.io.*;
import java.net.*;
import java.util.StringTokenizer;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 *
 * @author lrodriguez
 */
public class grabaEstudianteMa extends HttpServlet {
    
    /** Creates a new instance of grabaEstudianteMa */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet grabaEstudiantePos</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet grabaEstudiantePos at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");
         */
        out.close();
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String respuesta = new String(""), docestud, resp = new String(""), nsol = new String(""), nombre = new String(""), plan = new String(""), acud = new String("");
        String arregloreing[] = new String[50];
        String nomcamp = "campo";
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Graba Estudiante Maestr�a</title>");
        guardaDatosMa asp = new guardaDatosMa(request);
        respuesta = asp.guardaEstudianteMa();
        StringTokenizer st = new StringTokenizer(respuesta, "-");
        resp = st.nextElement().toString();
        if(resp.equals("ok")){
            
            nsol = st.nextElement().toString();
            nombre = st.nextElement().toString();
            plan = st.nextElement().toString();
            respuesta=asp.GrabaEducacion();
            
            out.println("</head>");
            out.println("<body>");
            
        }
        
        if (respuesta.equals("ok")) {
                    respuesta = asp.creaDocumen();
                }
        
        if(respuesta.equals("ok"))
            respuesta=asp.GrabaExperiencia();
        
        if(respuesta.equals("ok"))
            respuesta=asp.GrabaDistinciones();
        
        if(respuesta.equals("ok"))
            respuesta=asp.GrabaIdioma();
        
        if(respuesta.equals("ok"))
            respuesta=asp.GrabaReferencia();
        
        if(respuesta.equals("ok"))
            response.sendRedirect("FormularioCorrectoMa?nsol=" + nsol +
                    "&nombre=" + nombre + "&plan=" + plan);
        out.println(resp);
        out.println("</body>");
        out.println("</html>");
        out.close();
        
    }
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
    

