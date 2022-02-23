/*
 * CapturaRefMaestria.java
 *
 * Created on 19 de mayo de 2008, 10:54 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package nuevos;

import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import BDatos.BaseDatos;
import BDatos.BDadmisiones;
import configeci.configmaestria;
import java.net.*;

/**
 *
 * @author lrodriguez
 * @version
 */
public class CapturaRefMaestria extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.close();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        BDadmisiones bd = new BDadmisiones();
        String usuario, consulta, resp, infref, doc, refer, ing, ape1, ape2, ema, tel, nom, per, prog, numreg, numreg1, tipoest, tel_ofi, tip_doc;
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        int n;

        response.setContentType("text/html");
        sesion = request.getSession(false);
        configeci.configmaestria confadmis = new configeci.configmaestria();
        ape1 = request.getParameter("apellido1").trim();
        ape2 = request.getParameter("apellido2").trim();
        nom = request.getParameter("nom").trim();
        doc = request.getParameter("doc");
        prog = request.getParameter("prog");
        ema = request.getParameter("ema");
        tel = request.getParameter("tel");
        numreg = request.getParameter("numreg");
        numreg1 = request.getParameter("numreg1");
        tipoest = request.getParameter("tipoest");
        tel_ofi = request.getParameter("tel_ofi");
        tip_doc = request.getParameter("tip_doc");

        String periodo;
        String mensaje = new String("Error, Faltan Datos");
        String nombre = (String) ape1 + " " + (String) ape2 + " " + (String) nom;
        periodo = confadmis.getPeriodo();
        Vector dato = bd.ExisteRef(doc, periodo, prog);
        if (dato.size() > 0) {
            response.sendRedirect("MensajeFinalMa?apellido1=" + ape1 + "&apellido2=" + ape2 + "&nombre=" + nom + "&doc=" + doc + "&ref=" + dato.elementAt(0) + "&prog=" + dato.elementAt(2) + " ");
        } else {
            String secu = bd.sigSecuencia("PAGINSCP");
            consulta = new String("insert into registro.pginscrip values (" + secu + ", '" + periodo + "', '" + nombre.toUpperCase() + "', '" + ema + "', '" + doc +
                    "', '" + tel + "', getdate(), 0, null, '" + tipoest + "', '" + prog + "', '" + numreg.toUpperCase() + "', '" + numreg1 + "', '" + tel_ofi + "', '" + ape1.toUpperCase() + "', '" + ape2.toUpperCase() + "', '" + nom.toUpperCase() + "' , null, null, null, null, 'N', null,null, '"+tip_doc+"')");

            int resultado = bd.actualiza(consulta);
            if (resultado == 0) {
                out.println("SUS DATOS NO EST�N COMPLETOS, O ALG�N DATO NO SE INGRESO CORRECTAMENTE");
                out.println(consulta);
            } else {
                response.sendRedirect("MensajeFinalMa?apellido1=" + ape1 + "&apellido2=" + ape2 + "&nombre=" + nom + "&doc=" + doc + "&ref=" + secu + "&prog=" + prog + "  ");
            }
        }


    }
}