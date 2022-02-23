/*
 * VerificaAspPosgrado.java
 *
 * Created on 7 de junio de 2007, 09:11 AM
 */
package nuevos;

import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import BDatos.BaseDatos;
import BDatos.BDadmisiones;
import configeci.configPosgrados;
import java.net.*;
import java.awt.*;
import java.util.Properties;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Administrador
 */
public class VerificaAspPosgrado extends HttpServlet {

    /**
     * Creates a new instance of VerificaAsp
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        configeci.configPosgrados confadmis = new configeci.configPosgrados();
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        String documento, verdoc;
        BDadmisiones bd = new BDadmisiones();
        String ref = request.getParameter("ref");
        int ban = 0;
        Vector posgrados = new Vector();
// int plan=    (new Integer(idplan)).intValue();
//(new Integer(infpago)).intValue();
        //El periodo ya es 2013-1 pero QHSE sigue en 2012-2



        //String idplan = request.getParameter("idplan");
        String periodo = new String();
        //|| idplan.equals("309")


        documento = request.getParameter("doc");
        int valor;
        Vector infpago;

        // if (idplan.equals("370") ) {

        periodo = confadmis.getPeriodo();

        //   } else {
        //     periodo = confadmis.getPeriodo();
        // }
        infpago = bd.VerificaPagoPos(ref, periodo, out);

        if (infpago.size() > 0) {
            Vector pago = new Vector(infpago);
            String valorpago = pago.elementAt(0).toString();
            String idplan = pago.elementAt(1).toString();

            posgrados = bd.Cronogramas(out, periodo, idplan);
            if (posgrados.size() > 0) {
                Date hoy = new Date();

                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                Date fechafin = new Date();
                Date inicio = new Date();
                Date finall = new Date();
                String dato = new String(posgrados.elementAt(3).toString());
                idplan = new String(posgrados.elementAt(1).toString());
                String datofin = new String(posgrados.elementAt(4).toString());
                String fechaActual = formatter.format(hoy);
                ParsePosition pos = new ParsePosition(0);
                inicio = formatter.parse(dato, pos);
                pos = new ParsePosition(0);
                finall = formatter.parse(datofin, pos);
                String X = formatter.format(inicio);
                String Y = formatter.format(finall);
                if ((idplan.equals("309")) ) {
                    ban = 1;
                }
                if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y)) && (posgrados.elementAt(0).equals("1"))) {
                    ban = 1;
                }

                //comentarizamos porque en este momento no tenemos el idplan 
     /*   if ((depto.equals(idplan)) && (!valorpago.equals("0.00"))  ){
                 valor = (new Integer(valorpago)).intValue();
                 }else {
                 valor = 0; 
                 }*/
                if (ban == 1) {
                    if (!valorpago.equals("0.00")) {
                        valor = (new Integer(valorpago)).intValue();
                    } else {
                        valor = 0;
                    }
                    Vector datos = bd.estadoInsc(ref, out);
                    if (datos.size() > 0) {
                        response.sendRedirect("ImpresionPosgrado?documento=" + documento + "&docest=" + datos.elementAt(6) + "&ref=" + ref + "&idplan=" + idplan);
                    } else {
                        //Se agrega a la validación el valor 0 por razones de admisiones 2020-2 Cambio por Coronavirus
                        if (valor == 0 || valor >= 99000) {
                            response.sendRedirect("FormularioPosgrado?doc=" + documento + "&ref=" + ref + "&idplan=" + idplan);
                        } else {
                            response.sendRedirect("ErrorPagoPos");
                        }
                    }
                }else {
                out.println("<center>Este proceso sólo se habilitará en las fechas programadas. </center>");
            }
            } else {
                out.println("<center>Por favor verifique la información del posgrado. </center>");
            }
        } else {
            out.println("<center>Por favor verifique sus datos </center>");
        }
    }
}
