/*
 * To change this template, choose Tools | Templates
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
public class grabaEstudArtic extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet grabaEstudArtic</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet grabaEstudArtic at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String respuesta = new String(""), docestud, resp = new String(""), nsol = new String(""), nom = new String(""), plan = new String(""), acud = new String(""), prog, matdef = new String("");
        String arregloreing[] = new String[50];
        String nomcamp = "campo";
        String tipoest = request.getParameter("tipoest");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Graba Estudiante</title>");

        guardaDatosArtic asp = new guardaDatosArtic(request, response);
        respuesta = asp.guardaEstudiante(tipoest);
        StringTokenizer st = new StringTokenizer(respuesta, "-");
        resp = st.nextElement().toString();

        if (resp.equals("ok")) {
            nsol = st.nextElement().toString();
            nom = st.nextElement().toString();
            plan = st.nextElement().toString();
            acud = st.nextElement().toString();
            //matdef = st.nextElement().toString();
            respuesta = asp.creaResp();

        }
        
         if (respuesta.equals("ok")) {
                 respuesta = asp.GrabaDistinciones();
            }
       
        if (respuesta.equals("ok")) {
            response.sendRedirect("FormuCorrectoArtic?nsol=" + nsol +
                    "&nombre=" + nom + "&plan=" + plan +
                    "&acud=" + acud);
        }
        out.println("</head>");
        out.println("<body>");
        out.println(resp);
        out.println("</body>");
        out.println("</html>");
        out.close();


    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
