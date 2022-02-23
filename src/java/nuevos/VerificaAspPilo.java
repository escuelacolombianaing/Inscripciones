/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nuevos;

import BDatos.BDadmisiones;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utiles.Correo;

/**
 *
 * @author Lucero
 */
public class VerificaAspPilo extends HttpServlet {

    /**
     * Creates a new instance of VerificaAsp
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            configeci.configuracion confadmis = new configeci.configuracion();
            PrintWriter out = response.getWriter();
            HttpSession sesion;
            String documento, verdoc;
            BDadmisiones bd = new BDadmisiones();
            String ref = request.getParameter("ref");
            documento = request.getParameter("doc");

            int valor;
            //String infpago = bd.VerificaPago(ref, out) ;
            Vector infpago;
            infpago = bd.VerificaPago(ref, out);
            if (infpago.size() > 0) {
                Vector pago = new Vector(infpago);
                String pilo="N";
                String valorpago = pago.elementAt(0).toString();
                String depto = pago.elementAt(1).toString();
                Vector genee=bd.esGeneracionE(documento, depto, ref);
                if(genee.size()>0){
                    pilo="N";
                }
                String snp = pago.elementAt(4).toString();
                String tip_doc=pago.elementAt(3).toString();
                if (!valorpago.equals("0.00")) {
                    valor = (new Integer(valorpago)).intValue();
                } else {
                    valor = 0;
                }

                Vector datos = bd.estadoInsc(ref, out);

                if (datos.size() > 0) {
                    response.sendRedirect("FormularioImpreso?documento=" + documento + "&docest=" + datos.elementAt(6) + "&ref=" + ref);
                } else {
                    if (pilo.equals("N")&&genee.size()>0) {
                        response.sendRedirect("FormularioPregrado?doc=" + documento + "&ref=" + ref + "&pilo=" + pilo + "&tip_doc="+tip_doc+"&snp="+snp);
                    } else {
                        response.sendRedirect("ErrorPago");
                    }
                    /* if ( valor >= 99000 || valor == 1){
                
                     response.sendRedirect("FormularioPregrado?doc="+documento+"&ref="+ref);
                     } else{
                     response.sendRedirect("ErrorPago") ;
                     }*/
                }
            } else {
                out.println("<center>Por favor verifique sus datos </center>");
            }
        } catch (Exception e) {
            Correo correo = new Correo();
            correo.enviar("Verifica Aspirante Generacion E", e.getMessage());
        }
    }
}
