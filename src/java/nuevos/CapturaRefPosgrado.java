/*
 * CapturaRefPosgrado.java
 *
 * Created on 4 de junio de 2007, 05:02 PM
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
 * @version
 */


public class CapturaRefPosgrado extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.close();
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
        
        BDadmisiones bd = new BDadmisiones();
        String usuario, consulta, resp, infref, ciud, doc, refer, ing, ape1,ape2,ema,tel, nom, per, prog, numreg,numreg1, tipoest, tel_ofi, tip_doc;
        PrintWriter out = response.getWriter();
        HttpSession  sesion ;
        int n;
        
        response.setContentType("text/html");
        sesion = request.getSession(false);
        configeci.configPosgrados confadmis = new configeci.configPosgrados();
        ape1 = request.getParameter("apellido1").trim() ;
        ape2 = request.getParameter("apellido2").trim() ;
        nom = request.getParameter("nom").trim() ;
        doc = request.getParameter("doc") ;
        prog =  request.getParameter("prog") ;
        ema     = request.getParameter("ema") ;
        tel     = request.getParameter("tel") ;
        numreg    = request.getParameter("numreg") ;
        numreg1    = request.getParameter("numreg1") ;
        tipoest = request.getParameter("tipoest") ;
        tel_ofi = request.getParameter("tel_ofi") ;
        ciud    = request.getParameter("ciudad") ;
        tip_doc = request.getParameter("tip_doc");
           
        String periodo;
        String  mensaje = new String("Error, Faltan Datos");
        String nombre = (String)ape1+" "+(String)ape2+" " +(String)nom;
        tel = tel + "-" + ciud.toUpperCase();
       if (prog.equals("370") ){
        periodo= confadmis.getPeriodo();
        } else {
              periodo= confadmis.getPeriodo();

        }
        Vector dato= bd.ExisteRef(doc, periodo, prog) ; 
       if(dato.size()>0){
            response.sendRedirect("MsjFinalPos?apellido1="+ape1+"&apellido2="+ape2+"&nombre="+nom+"&doc="+doc+"&ref="+dato.elementAt(0)+"&prog="+prog+" ");
        }else{
            String secu=bd.sigSecuencia("PAGINSCP");
            consulta = new String("insert into registro.pginscrip values (" + secu + ", '"+ periodo +"', '" + nombre.toUpperCase() + "', '" + ema + "', '" + doc +
                    "', '" + tel + "', getdate(), 0, null, '" + tipoest + "', '" + prog + "', '" + numreg.toUpperCase()  + "', '"+ numreg1+"', '"+ tel_ofi +"', '" + ape1.toUpperCase() + "', '" + ape2.toUpperCase() + "', '" + nom.toUpperCase() + "' , null, null, null, null, 'N', null,null,'"+tip_doc+"')" );
            int resultado= bd.actualiza(consulta);
            
            if (resultado ==  0 ) {
                out.println( "SUS DATOS NO EST�N COMPLETOS, O ALG�N DATO NO SE INGRESO CORRECTAMENTE");
            }else{
                response.sendRedirect("MsjFinalPos?apellido1="+ape1+"&apellido2="+ape2+"&nombre="+nom+"&doc="+doc+"&ref="+secu+"&prog="+prog+"  ") ;
            }
        }
        
    }
    
}