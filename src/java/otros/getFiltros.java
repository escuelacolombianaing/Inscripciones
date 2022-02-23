/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package otros;

import BDatos.EmpleadoRemote;
import BDatos.UtilesRemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import BDatos.BDadmisiones;

/**
 *
 * @author Juan Pablo Garcia
 */
public class getFiltros extends HttpServlet {

    public static final String OTRO = "0";
    public static final String EMPLEADOS = "1";
    public static final String CENTRO_COSTOS = "1";
    public static final String ASIGNATURAS = "2";
    public static final String CARGOS = "3";
    public static final String CIUDADES = "101";
    public static final String UNIVERSIDADES = "102";
    public static final String TPCOMPROMISO = "103";
    public static final String PROYECTOS = "104";

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
            out.println("<title>Servlet getEmpleados</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getEmpleados at " + request.getContextPath () + "</h1>");
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
        String filtro = request.getParameter("filtro");
        BDadmisiones bd = new BDadmisiones();
      //  inicio.conectaEJB conEjb = new inicio.conectaEJB();
     //   UtilesRemote utiles = bd.lookupUtilesRemote();
        String tipo = request.getParameter("tipo");
        StringBuilder respuesta = new StringBuilder();
        
          if (tipo.equals(OTRO)) {
            String caso = request.getParameter("caso");
           
               if ( caso.equals(UNIVERSIDADES) ) {
                HttpSession sesion = request.getSession(false);
                EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
                HashMap[] lista = null;
                HashMap item;
                try {
                    if (caso.equals(UNIVERSIDADES)) {
                        lista = emp.lisUniversidades(filtro);
                    } 
                } catch (Exception ex) {
                    Logger.getLogger(getFiltros.class.getName()).log(Level.SEVERE, null, ex);
                }

                respuesta = new StringBuilder("<lista>");
                for (int i = 0; i < lista.length; i++) {
                    item = lista[i];
                    respuesta.append("<item>");
                    respuesta.append("<nombre>").append(item.get("nom")).append("</nombre>");
                    respuesta.append("<id>").append(item.get("cod")).append("</id>");
                    respuesta.append("</item>");
                }
                respuesta.append("</lista>");
            }
        }
        //Enviar Respuesta
        response.setContentType("text/xml");
        PrintWriter pw = response.getWriter();
        pw.write(respuesta.toString());
        pw.close();
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */

    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
