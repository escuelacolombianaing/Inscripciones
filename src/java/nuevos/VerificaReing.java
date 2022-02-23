/*
 * VerificaReing.java
 *
 * Created on 29 de marzo de 2007, 10:02 AM
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
/**
 *
 * @author Administrador
 */
public class VerificaReing extends  HttpServlet{
    
    /** Creates a new instance of VerificaReing */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        configeci.configuracion confadmis = new configeci.configuracion();
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        String documento;
        BDadmisiones bd = new BDadmisiones();
        String ref = request.getParameter("ref");
        String idEst = request.getParameter("idest");
        String clave = request.getParameter("clave");
        String impre = request.getParameter("impre");
        
        int valor;
        Vector  datosestado = bd.getInfoEst(idEst) ;
        if (datosestado.elementAt(15).equals("-12")){
            //EL ESTADO -1 PASA A SER REINTEGRO DEBIDO AL NVO REGLAMENTO DESAPARECERAN LOS REINGRESOS
            /*   if (datosestado.elementAt(15).equals("-1")|| datosestado.elementAt(15).equals("-12")){*/
           // String infpago = bd.VerificaPago(ref,out);
            //out.println(infpago);
            Vector infpago = bd.VerificaPago(ref,  out);
        Vector pago = new Vector (infpago);
        String valorpago = pago.elementAt(0).toString();
        String depto = pago.elementAt(1).toString();
        if (!valorpago.equals("0.00"))  {
        valor = (new Integer(valorpago)).intValue();
        }else {
            valor = 0;
        }
        //Se agrega a la validación el valor 0 por razones de admisiones 2020-2 Cambio por Coronavirus
            if (valor == 0 || valor >= 99000 ){
                
                if(impre == null){
                  //SE QUITA ESTA PARTE YA NO SE USA ESTA CLAVE  String  datos = bd.claveNum(idEst) ;
                    //if (datos.equals(clave) && !datos.equals("") && !clave.equals("")){
                        response.sendRedirect("FormularioSeguimiento?idEst=" + idEst + "&ref=" + ref) ;
                   // }else
                     //   out.println("Estimado Aspirante:<br> Sus datos de referencia, carnet o clave numérica no corresponden. ");
                }else{
                    response.sendRedirect("FormularioImpreso?documento="+datosestado.elementAt(3)+"&docest="+datosestado.elementAt(3)+"&ref="+ref) ;
                }
            }else
                response.sendRedirect("ErrorPago") ;
        }else{
            out.println("Usted no esta autorizado para realizar este proceso. " +
                    "<br>Puede comunicarse con la oficina de Admisiones donde se aclararán " +
                    "sus inquietudes, al email: <a href=\"mailto:admisiones@escuelaing.edu.co\">" +
                    "admisiones@escuelaing.edu.co</a> o al " +
                    "teléfono 6683600 ext. 274, 263, 101");
        }
    }
}
