/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inscripcion;

import BDatos.BDadmisiones;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andres.rojas
 */
public class grabaEstudPreuni extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet grabaEstudPreuni</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet grabaEstudPreuni at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Datos del Aspirante
        String id_plan=request.getParameter("id_plan");
        String id_col=request.getParameter("id_col");
        String ape1=request.getParameter("ape1");
        String ape2=request.getParameter("ape2");
        String nombres=request.getParameter("nombres");
        String fec_nac_dia=request.getParameter("fec_nac_dia");
        String fec_nac_mes=request.getParameter("fec_nac_mes");
        String fec_nac_ano=request.getParameter("fec_nac_ano");
        String ciudad_nac=request.getParameter("ciudad_nac");
        String doc_est=request.getParameter("doc_est");
        String lug_exp=request.getParameter("lug_exp");
        String tip_doc=request.getParameter("tip_doc");
        String genero=request.getParameter("genero");
        String est_civ=request.getParameter("est_civ");
        String direccion=request.getParameter("direccion");
        String barrio=request.getParameter("barrio");
        String obsv_act=request.getParameter("obsv_act");
        String ciudad=request.getParameter("ciudad");
        String otr_cui=request.getParameter("otr_cui");
        if(otr_cui==null){
            otr_cui="";
        }
        String telefono=request.getParameter("telefono");
        String celular=request.getParameter("celular");
        String correo=request.getParameter("correo");
        //Datos del Acudiente
        String parentesco=request.getParameter("parentesco");
        String nombre_acu=request.getParameter("nombre_acu");
        String doc_acu=request.getParameter("doc_acu");
        String dir_acu=request.getParameter("dir_acu");
        String tel_acu=request.getParameter("tel_acu");
        String cel_acu=request.getParameter("cel_acu");
        String cor_acu=request.getParameter("cor_acu");
        //Se define tipo de documento para pginscrip
        String tip_id_insc="";
        if(tip_doc.equals("T")){
            tip_id_insc="TI";
        }else if(tip_doc.equals("C")){
            tip_id_insc="CC";
        }else if(tip_doc.equals("E")){
            tip_id_insc="CE";
        }else if(tip_doc.equals("R")){
            tip_id_insc="CR";
        }else{
            tip_id_insc="CC";
        }
        //Se crea objeto de base de datos
        BDadmisiones bd = new BDadmisiones();
        //Se obtiene id de programa y departamento
        HashMap id_prog_dep=bd.getidProgDep(id_plan);
        String id_prog=(String) id_prog_dep.get("id_prog");
        String id_dep=(String) id_prog_dep.get("id_dep");
        //Se define el objeto de mensaje de respuesta
        String respuesta=null;
        //Nombre Completo
        String nombre_completo=ape1+" "+ape2+" "+nombres;
        //Tipo de estudiante
        String tipoest="S";
        //Se crea objeto de configuracion
        configeci.configuracion confEci = new configeci.configuracion();
        //Variable con el periodo
        String periodo=confEci.getPeriodo();
        //Variable para respuesta del proceso
        Boolean ans=true;
        //Se consulta si ya existe en PG_INSCRIP
        HashMap[] referencias_anteriores=bd.getReferenciaExistente(periodo, id_plan, doc_est);
        String secu="";
        if(referencias_anteriores.length==0){
            //Secuencia pginscrip
            secu = bd.sigSecuencia("PAGINSC");
            //Insercion Pginscrip
            ans=ans&&(bd.creaRefPreuni(secu, periodo, nombre_completo, correo, doc_est, telefono, tipoest, id_plan, celular, ape1, ape2, nombres, id_col, tip_id_insc)>0);
        }else{
            secu=referencias_anteriores[0].get("idinsc").toString();
        }
        
        //Insercion Estudiante
        if(ans&&(bd.getExiste(doc_est, periodo, id_plan)==0)){
            //Secuencia estudiante
            String secu_est=bd.sigSecuencia("ESTUDIANTES");
            //Fecha nacimiento
            String fecha_nac=fec_nac_dia+"-"+fec_nac_mes+"-"+fec_nac_ano;
            //Secuencia Solicitud
            String numsol = bd.sigSecuencia("NUM_SOLICITUD");
            Integer nro;
            String carrera="P";
            if (tipoest.equals("S")) {
                nro = Integer.parseInt(numsol);
                nro = nro + 4000;
                numsol = tipoest + nro + carrera;
            } else {
                //  numsol = tipoest + numsol + carrera;
                numsol = "S" + numsol + carrera;
            }
            //Valor de Matricula
            String base_liq= "0";
            ans=ans&&(bd.creaEstudiantePreuni(secu_est, doc_est, nombre_completo, id_dep, id_plan, tip_doc, numsol, obsv_act, periodo, id_col, fecha_nac, ciudad_nac, direccion, telefono, ciudad, nombre_acu, parentesco, dir_acu, tel_acu, correo, doc_acu, celular, barrio, nombres, ape1, ape2, cor_acu, secu, lug_exp, genero, est_civ, cel_acu, base_liq)>0);
            if(!ans){
                respuesta="No se pudieron guardar sus datos, por favor diligencie todos los campos y no use caracteres especiales ni tíldes";
            }else{
                respuesta="El registro de sus datos fue satisfactorio, su numero de referencia es "+secu+".";
            }
        }else{
            respuesta="No se pudieron guardar sus datos, por favor diligencie todos los campos y no use caracteres especiales";
            if(bd.getExiste(doc_est, periodo, id_plan)!=0){
                respuesta="Ya realizo el registro al mismo periodo y programa anteriormente";
            }
        }
        response.sendRedirect("PreUniversitarios?respuesta="+respuesta);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
