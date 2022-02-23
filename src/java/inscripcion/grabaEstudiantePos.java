/*
 * grabaEstudiantePos.java
 *
 * Created on 22 de junio de 2007, 11:28 AM
 */

package inscripcion;

import java.io.*;
import java.net.*;
import java.util.StringTokenizer;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Administrador
 * @version
 */
public class grabaEstudiantePos extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
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
        String respuesta = new String(""), docestud, resp = new String(""), nsol = new String(""), nom = new String(""), plan = new String(""), acud = new String("");
        String arregloreing[] = new String[50];
        String nomcamp = "campo";
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Graba Estudiante Posgrado</title>");
        guardaDatosPos asp = new guardaDatosPos(request);
        respuesta = asp.guardaEstudiantePos();
        StringTokenizer st = new StringTokenizer(respuesta, "-");
        resp = st.nextElement().toString();
        if(resp.equals("ok")){
            
            nsol = st.nextElement().toString();
            nom = st.nextElement().toString();
            plan = st.nextElement().toString();
            respuesta=asp.GrabaEducacion();       
            out.println("</head>");
            out.println("<body>");       
        }
        
        
        if(respuesta.equals("ok"))
         respuesta = asp.creaDocumen();
        
        if(respuesta.equals("ok"))
            respuesta=asp.GrabaExperiencia();
        
        if(respuesta.equals("ok"))
            respuesta=asp.GrabaDistinciones();
        
        if(respuesta.equals("ok"))
            respuesta=asp.GrabaIdioma();
        
        if(respuesta.equals("ok"))
            respuesta=asp.GrabaReferencia();

        if(respuesta.equals("ok"))
            response.sendRedirect("FormularioCorrectoPos?nsol=" + nsol +
                    "&nombre=" + nom + "&plan=" + plan);
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