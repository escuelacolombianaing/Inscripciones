/*
 * VerificaAspMaestria.java
 *
 * Created on 20 de mayo de 2008, 12:09 PM
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
 */
public class VerificaAspMaestria extends HttpServlet {

    /**
     * Creates a new instance of VerificaAsp
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        configeci.configmaestria confadmis = new configeci.configmaestria();
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        String documento, verdoc;
        BDadmisiones bd = new BDadmisiones();
        String ref = request.getParameter("ref");
        documento = request.getParameter("doc");
        String idplan = request.getParameter("idplan");
        // out.println(idplan);
        int valor;
        Vector infpago = bd.VerificaPago(ref, out);
        if (infpago.size() > 0) {
            Vector pago = new Vector(infpago);
            String valorpago = pago.elementAt(0).toString();


            String depto = pago.elementAt(1).toString();

            if (idplan.equals("290")) {
                if (depto.equals("290") || depto.equals("291") || depto.equals("292") || depto.equals("293") || depto.equals("294") && (!valorpago.equals("0.00"))) {
                    valor = (new Integer(valorpago)).intValue();
                } else {
                    valor = 0;
                }

            } else if (idplan.equals("321")) {
                if (depto.equals("321") || depto.equals("322") && (!valorpago.equals("0.00"))) {
                    valor = (new Integer(valorpago)).intValue();
                } else {
                    valor = 0;
                }
            } else if (idplan.equals("330")) {
                if (depto.equals("330") || depto.equals("331") && (!valorpago.equals("0.00"))) {
                    valor = (new Integer(valorpago)).intValue();
                } else {
                    valor = 0;
                }
            } else if (idplan.equals(depto) && (!valorpago.equals("0.00"))) {

                valor = (new Integer(valorpago)).intValue();
            } else {
                valor = 0;
            }


            //(depto.equals("290") || depto.equals("291") || depto.equals("292") || depto.equals("293") || depto.equals("294") &&
          /*  if (!valorpago.equals("0.00")) {
                valor = (new Integer(valorpago)).intValue();
            } else {
                valor = 0;
            }*/
            /* if (!infpago.equals("0.00"))
             valor = (new Integer(infpago)).intValue();
             else  
             valor = 0 ;*/
            Vector datos;
            datos = bd.estadoInsc(ref, out);
            if (datos.size() > 0) {
                response.sendRedirect(""
                        + "ImpresionMaestria?documento=" + documento + "&docest=" + datos.elementAt(6) + "&ref=" + ref + "&idplan=" + idplan);
            } else {
                //Se agrega a la validación el valor 0 por razones de admisiones 2020-2 Cambio por Coronavirus
                if (valor == 0 || valor >= 99000) {
                    response.sendRedirect("FormularioMaestria?doc=" + documento + "&ref=" + ref + "&idplan=" + idplan);
                } else {
                    response.sendRedirect("ErrorpagoMa?idplan=" + idplan);
                }
            }
        } else {
            response.sendRedirect("ErrorpagoMa?idplan=" + idplan);
        }
    }
}