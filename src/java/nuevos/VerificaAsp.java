/*
 * VerificaAsp.java
 *
 * Created on 26 de marzo de 2007, 09:22 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package nuevos;
import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.* ;
import BDatos.BaseDatos ;
import BDatos.BDadmisiones;
import configeci.configuracion;
import java.net.*;
import utiles.Correo;

/**
 *
 * @author Administrador
 */
public class VerificaAsp extends  HttpServlet{
    
    /** Creates a new instance of VerificaAsp */
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
        Vector infpago = bd.VerificaPago(ref,  out);
        if (infpago.size()>0){
        Vector pago = new Vector (infpago);
        String valorpago = pago.elementAt(0).toString();
        String depto = pago.elementAt(1).toString();
        String tip_doc = pago.elementAt(3).toString();
        String snp = pago.elementAt(4).toString();
        if (!valorpago.equals("0.00"))  {
            valor = (new Integer(valorpago)).intValue();
        }else {
            valor = 0;
        }
         
        Vector  datos ;
            datos = bd.estadoInsc(ref, out);
      
       if (datos.size() > 0){
           
            response.sendRedirect("FormularioImpreso?documento="+documento+"&docest="+datos.elementAt(6)+"&ref="+ref) ;
       } else{
           //Se agrega a la validación el valor 0 por razones de admisiones 2020-2 Cambio por Coronavirus
            if (valor == 0 || valor >= 99000 || valor == 1 || bd.esCampusDay(confadmis.getPeriodo(), ref).size()>0){
                response.sendRedirect("FormularioPregrado?doc="+documento+"&ref="+ref+"&tip_doc="+tip_doc+"&snp="+snp);
            } else{
               response.sendRedirect("ErrorPago") ;
           }
       }
        } else {
            out.println("<center>Por favor verifique sus datos </center>");
        }
    }
        
           catch (Exception e) {
            Correo correo = new Correo();
            correo.enviar("Verifica Aspirante", e.getMessage());
        }
    }
}
