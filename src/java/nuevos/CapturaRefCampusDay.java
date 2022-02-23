/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nuevos;

import BDatos.BDadmisiones;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utiles.CorreoCampusDay;

/**
 *
 * @author andres.rojas
 */
public class CapturaRefCampusDay extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        configeci.configuracion confadmis = new configeci.configuracion();
        BDadmisiones bd = new BDadmisiones();
        String periodo = confadmis.getPeriodo();
        String extranjero, icfes, pais, colegio, antes, apellido1, apellido2, nombre
                , tel, mail, tip_doc, doc, celular, snp, programa, ciudad;
        //Recoleccion de parametros de la solicitud
        extranjero=(req.getParameter("extranjero")==null)?"":req.getParameter("extranjero").trim();
        icfes=(req.getParameter("icfes")==null)?"":req.getParameter("icfes").trim();
        pais=(req.getParameter("pais")==null)?"":req.getParameter("pais").trim();
        colegio=(req.getParameter("colegio")==null)?"":req.getParameter("colegio").trim();
        antes=(req.getParameter("antes")==null)?"":req.getParameter("antes").trim();
        apellido1=(req.getParameter("apellido1")==null)?"":req.getParameter("apellido1").trim();
        apellido2=(req.getParameter("apellido2")==null)?"":req.getParameter("apellido2").trim();
        nombre=(req.getParameter("nombre")==null)?"":req.getParameter("nombre").trim();
        tel=(req.getParameter("tel")==null)?"":req.getParameter("tel").trim();
        mail=(req.getParameter("mail")==null)?"":req.getParameter("mail").trim();
        tip_doc=(req.getParameter("tip_doc")==null)?"":req.getParameter("tip_doc").trim();
        doc=(req.getParameter("doc")==null)?"":req.getParameter("doc").trim();
        celular=(req.getParameter("celular")==null)?"":req.getParameter("celular").trim();
        snp=(req.getParameter("snp")==null)?"":req.getParameter("snp").trim();
        programa=(req.getParameter("programa")==null)?"":req.getParameter("programa").trim();
        ciudad=(req.getParameter("ciudad")==null)?"":req.getParameter("ciudad").trim();
        
        //Transformacion de parametros para adaptarlos a la integridad de la tabla registro.pginscrip
        
        
        
        String nombreCompleto = apellido1.toUpperCase()+" "+apellido2.toUpperCase()+" "+nombre.toUpperCase();
        String telefonoCompleto = tel+"-"+ciudad.toUpperCase();
        apellido1=apellido1.toUpperCase();
        apellido2=apellido2.toUpperCase();
        nombre=nombre.toUpperCase();
        snp=snp.toUpperCase();
        pais=pais.toUpperCase();
        colegio=colegio.toUpperCase();
        extranjero=(extranjero.equals("1"))?"S":"N";
        icfes=(icfes.equals("1"))?"S":"N";
        String sentencia="select referencia from registro.inscritos_campusday where doc='"+doc+"'";
        Vector existeRegistro=new Vector();
        String secuencia="";
        try {
            bd.conectarBD();
            existeRegistro=bd.consultar(sentencia, 1, 0);
            bd.desconectarBD();
            if(existeRegistro.isEmpty()){
                secuencia=bd.sigSecuencia("PAGINSC");
                sentencia="insert into registro.inscritos_campusday values ('"+doc+"', getdate(), '"+secuencia+"')";
                int respuesta=bd.actualiza(sentencia);
                if(respuesta==1){
                    sentencia= " insert into registro.pginscrip values (" + secuencia +
                    ", '" + periodo + "', '" + nombreCompleto + "', '" + mail + "', '" + doc
                    + "', '" + telefonoCompleto + "', getdate(), 0, getdate(), 'N', '" + programa +
                    "', '" + snp + "', '" + celular + "', '" + tel + "', '" 
                    + apellido1 + "', '" + apellido2 + "', '" + 
                    nombre + "', '" + extranjero + "', '" +
                    icfes + "', '" + pais + "', '" +
                    colegio + "' , 'N',null,null, '" + tip_doc + "') ";
                    bd.actualiza(sentencia);
                    CorreoCampusDay correo = new CorreoCampusDay();
                    correo.enviar("Bienvenido a la Escuela, Tu n˙mero de referencia es: "+secuencia, mail);
                    resp.sendRedirect("MensajeCorrectoCampusDay?apellido1=" + apellido1 + "&apellido2=" + apellido2 + "&nombre=" + nombre + "&doc=" + doc + "&prog=" + programa + "&ref=" + secuencia);
                }
            }else{
                secuencia=existeRegistro.get(0).toString();
                resp.sendRedirect("MensajeCorrectoCampusDay?apellido1=" + apellido1 + "&apellido2=" + apellido2 + "&nombre=" + nombre + "&doc=" + doc + "&prog=" + programa + "&ref=" + secuencia);
            }
            
        } catch (Exception ex) {
            Logger.getLogger(CapturaRefCampusDay.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
    }
    
    /**
    * FunciÛn que elimina acentos y caracteres especiales de
    * una cadena de texto.
    * @param input
    * @return cadena de texto limpia de acentos y caracteres especiales.
    */
   public static String remove1(String input) {
       // Cadena de caracteres original a sustituir.
       String original = "·‡‰ÈËÎÌÏÔÛÚˆ˙˘uÒ¡¿ƒ…»ÀÕÃœ”“÷⁄Ÿ‹—Á«";
       // Cadena de caracteres ASCII que reemplazar·n los originales.
       String ascii = "aaaeeeiiiooouuunAAAEEEIIIOOOUUUNcC";
       String output = input;
       for (int i=0; i<original.length(); i++) {
           // Reemplazamos los caracteres especiales.
           output = output.replace(original.charAt(i), ascii.charAt(i));
       }//for i
       return output;
   }
    
}
