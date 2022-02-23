/*
 * grabaEstud.java
 *
 * Created on 27 de marzo de 2007, 11:45 AM
 */
package inscripcion;

import java.io.*;
import java.net.*;
import java.util.StringTokenizer;
import javax.servlet.*;
import javax.servlet.http.*;
import utiles.Correo;

/**
 *
 * @author administrador
 * @version
 */
public class grabaEstud extends HttpServlet {

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
        out.println("<title>Servlet grabaEstud</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet grabaEstud at " + request.getContextPath () + "</h1>");
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
        String detalle = "\n\r Detalle: ";
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String respuesta = new String(""), docestud, resp = new String(""), nsol = new String(""), nom = new String(""), plan = new String(""), acud = new String(""), prog, matdef = new String("");
            String arregloreing[] = new String[50];
            String nomcamp = "campo";
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Graba Estudiante</title>");
            String tipoest = request.getParameter("tipoest");
            String pilo = request.getParameter("pilo");
            String ref = request.getParameter("ref");
            String doc = request.getParameter("doc_est");
            
            
            detalle = detalle + "\n\r Tipo: " + tipoest;
            // out.println(tipoest);
            if (tipoest.equals("N") || tipoest.equals("T") || tipoest.equals("S")) {

                guardaDatos asp = new guardaDatos(request, response);
                respuesta = asp.guardaEstudiante(tipoest);
                StringTokenizer st = new StringTokenizer(respuesta, "-");
                resp = st.nextElement().toString();
                detalle = detalle + "\n\r Respuesta: " + resp;
                if (resp.equals("ok")) {
                    nsol = st.nextElement().toString();
                    nom = st.nextElement().toString();
                    plan = st.nextElement().toString();
                    acud = st.nextElement().toString();
                    matdef = st.nextElement().toString();
                    respuesta = asp.creaResp();

                }
                if (respuesta.equals("ok")) {
                    respuesta = asp.creaHerm();
                }

                if (respuesta.equals("ok")) {
                    respuesta = asp.creaDocumen();
                }

                if (respuesta.equals("ok") && tipoest.equals("N")) {
                    response.sendRedirect("FormularioCorrecto?nsol=" + nsol
                            + "&nombre=" + nom + "&plan=" + plan
                            + "&acud=" + acud + "&matdef=" + matdef + "&tipoest=" + tipoest + "&pilo=" + pilo + "&ref=" + ref + "&doc=" + doc);
                }
                if (respuesta.equals("ok") && tipoest.equals("S")) {
                    response.sendRedirect("FormularioCorrecto?nsol=" + nsol
                            + "&nombre=" + nom + "&plan=" + plan
                            + "&acud=" + acud + "&tipoest=" + tipoest + "&ref=" + ref + "&doc=" + doc);
                }
                /*response.sendRedirect("CorrectoBecas?nsol=" + nsol +
                "&nombre=" + nom + "&plan=" + plan +
                "&acud=" + acud + "&tipoest=" + tipoest);*/
                if (respuesta.equals("ok") && tipoest.equals("T")) {
                    response.sendRedirect("FormularioCorrectoTrans?nsol=" + nsol
                            + "&nombre=" + nom + "&plan=" + plan
                            + "&acud=" + acud + "&tipoest=" + tipoest + "&ref=" + ref + "&doc=" + doc);
                }
            } else if (tipoest.equals("M")) {
                for (int i = 1; i < 29; i++) {
                    String cadena1 = String.valueOf(i);
                    String variable = (String) nomcamp.concat(cadena1);
                    arregloreing[i] = request.getParameter(variable);
                }
                arregloreing[30] = request.getParameter("idp");
                arregloreing[31] = request.getParameter("idm");
                String idEst = request.getParameter("idEst");
                
                guardaDatos asp = new guardaDatos();
                respuesta = asp.guardaEstudianteReing(arregloreing, idEst, ref, request.getParameter("banp"), request.getParameter("banm"));
                StringTokenizer st = new StringTokenizer(respuesta, "-");
                resp = st.nextElement().toString();
                prog = request.getParameter("programa");
                acud = request.getParameter("acud");
                nom = request.getParameter("nomest");
                docestud = request.getParameter("docestud");
                nsol = st.nextElement().toString();
                if (resp.equals("ok")) {
                    response.sendRedirect("FormularioCorrectoReing?nsol=" + nsol
                            + "&nombre=" + nom + "&prog=" + prog
                            + "&acud=" + acud + "&docestud=" + docestud + "&tipoest=" + tipoest);
                }
            } else if (tipoest.equals("E")) {
                acud = request.getParameter("acud");
                String ultdir = request.getParameter("campo6");
                String ulttel = request.getParameter("campo8");
                String parentesco = request.getParameter("parent");
                guardaDatos asp = new guardaDatos();
                String carrera = "";
                String idEst = request.getParameter("idEst");
                String carnet = request.getParameter("carnet");
                respuesta = asp.guardaEstudianteReinte(carnet, ultdir, ulttel);
                StringTokenizer st = new StringTokenizer(respuesta, "-");
                resp = st.nextElement().toString();
                if (resp.equals("ok")) {
                    nsol = st.nextElement().toString();
                    prog = request.getParameter("programa");
                    nom = request.getParameter("nomest");
                    docestud = request.getParameter("docestud");

                    response.sendRedirect("FormularioCorrectoReinte?solicitud=" + nsol
                            + "&nombre=" + nom + "&prog=" + prog
                            + "&docestud=" + docestud + "&tipoest=" + tipoest + "&idEst=" + idEst);
                }
            } else if (tipoest.equals("Z")) {
                acud = request.getParameter("acud");
                String ultdir = request.getParameter("campo6");
                String ulttel = request.getParameter("campo8");
                String parentesco = request.getParameter("parent");
                String interes = request.getParameter("interes");
                guardaDatos asp = new guardaDatos();
                String carrera = "";
                String idEst = request.getParameter("idEst");
                String carnet = request.getParameter("carnet");
                respuesta = asp.guardaEstudianteReadmi(carnet, ultdir, ulttel, idEst, interes, out);
                StringTokenizer st = new StringTokenizer(respuesta, "-");
                resp = st.nextElement().toString();
                nsol = st.nextElement().toString();
                prog = request.getParameter("programa");
                nom = request.getParameter("nomest");
                docestud = request.getParameter("docestud");
                if (resp.equals("ok")) {
                    response.sendRedirect("CorrectoReadmision?solicitud=" + nsol
                            + "&nombre=" + nom + "&prog=" + prog
                            + "&docestud=" + idEst + "&tipoest=" + tipoest);
                }
            }

            out.println("</head>");
            out.println("<body>");
            out.println(resp);
            out.println("</body>");
            out.println("</html>");
            out.close();

        } catch (Exception e) {
            Correo correo = new Correo();
            correo.enviar("Graba Estudiante Local", e.getMessage() + detalle);
        }
    }

    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
