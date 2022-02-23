/*
 * To change this template, choose Tools | Templates
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
import configeci.configuracion;
import java.net.*;

/**
 *
 * @author  lrodriguez
 * @version 1.0
 */
public class CapturaRefPiloPaga extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        configeci.configuracion confadmis = new configeci.configuracion();
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        Vector infref = new Vector();
        BDadmisiones bd = new BDadmisiones();
        String periodo, perant;
        periodo = confadmis.getPeriodo();
        perant = confadmis.getperant();

        String usuario, consulta = "", consulta1, resp, doc, refer, ing, apellidos, prog, tipoest;
        String idInsc, nom, ape, ema, tel, tip, ciud, snp1, per, ape1, ape2, bachillerext, icfes, procedencia, colegio, estado = "", pering = "";
        String tel_ofi = "";
        String ciudof = "";
        String snp2 = "";
        String prog1 = "";
        String programa = "";
        String puntaje = "";
        String nom_est = "";
        String nomat = "";
        String convenio="";
        String tip_doc="";
        nom = request.getParameter("nom").trim();
        ape1 = request.getParameter("apellido1").trim();
        ape2 = request.getParameter("apellido2").trim();
        ema = request.getParameter("ema");
        tel = request.getParameter("tel");
        doc = request.getParameter("doc");
        prog = request.getParameter("prog");
        snp1 = request.getParameter("numreg");
        snp2 = request.getParameter("numreg1");
        ciud = request.getParameter("ciudad");
        tip_doc=request.getParameter("tip_doc");
        bachillerext = request.getParameter("bachiller");
        icfes = request.getParameter("icfes");
        procedencia = request.getParameter("pais");
        colegio = request.getParameter("colegio");
        puntaje = request.getParameter("puntaje");
        ing = request.getParameter("ingreso");
        tipoest = request.getParameter("tipoest");
        convenio= request.getParameter("convenio");
        String mensaje = new String("Error, Faltan Datos");
        String nombre = (String) ape1 + " " + (String) ape2 + " " + (String) nom;
        String snp = "";
        tel = tel + "-" + ciud.toUpperCase();
        if (!ciudof.equals("")) {
            tel_ofi = tel_ofi + "-" + ciudof.toUpperCase();
        }
        
        if (!tipoest.equals("M")) {
            if (!snp1.equals("")) {
                snp = snp1;
                // snp="";
            } else if (!snp2.equals("")) {
                snp = snp2;
            }
        }
        
        if (snp2 == null){
            snp2="";
        }
        
        if (puntaje == null){
            puntaje ="NULL";
        }

                
        //  if (tipoest.equals("M")) {
        Vector verifica = new Vector();
        verifica = bd.VerificaSeg(doc, out);
        if (verifica.size() > 0) {
            estado = verifica.elementAt(1).toString();
            pering = verifica.elementAt(2).toString();
            nom_est= verifica.elementAt(4).toString();
            programa= verifica.elementAt(3).toString();
            nomat = verifica.elementAt(5).toString();
        }


        if (programa.equals("19")) {
            prog1 = "ADMINISTRACION DE EMPRESAS";
        } else if (programa.equals("18")) {
            prog1 = "ECONOMIA";
        } else if (programa.equals("13")) {
            prog1 = "INGENIERIA CIVIL";
        } else if (programa.equals("15")) {
            prog1 = "INGENIERIA  DE SISTEMAS";
        } else if (programa.equals("16")) {
            prog1 = "INGENIERIA INDUSTRIAL";
        } else if (programa.equals("14")) {
            prog1 = "INGENIERIA ELECTRICA";
        } else if (programa.equals("17")) {
            prog1 = "INGENIERIA ELECTRONICA";
        } else if (programa.equals("20")) {
            prog1 = " MATEMATICAS";
        } else if (programa.equals("260")) {
            prog1 = "INGENIERIA MECANICA";
        } else if (programa.equals("262")) {
            prog1 = "INGENIERIA BIOMEDICA";
        } else if (programa.equals("264")) {
            prog1 = "INGENIERIA AMBIENTAL";
        }
        //    }
        if (nom.equals("") || doc.equals("") || tel.equals("")) {
            out.println("Error Faltan Datos");
        }
        if (ing.equals("N")) {
            bd = new BDadmisiones();
            Vector dato = new Vector();
            //  out.println(verifica.size());
            //
            try {
                dato = bd.ExisteRefPreg(doc, periodo);

                if ((tipoest.equals("M") && !estado.equals("-12")) || estado.equals("-22")) {
                    out.println("Usted no esta autorizado para realizar este proceso. "
                            + "<br>Puede comunicarse con la oficina de Admisiones donde se aclararán "
                            + "sus inquietudes, al email: <a href=\"mailto:admisiones@escuelaing.edu.co\">"
                            + "admisiones@escuelaing.edu.co</a> o al "
                            + "teléfono 6683600 opción 2 en el menú.");

                }
                //VALIDACION PARA ASPIRANTES ADMITIDOS EN EL SEM ANTERIOR DEBEN REALIZAR ACTIVACION DE CUPO
                if (tipoest.equals("N") && estado.equals("-60") && pering.equals(perant) && programa.equals(prog) && (nomat==null || nomat.equals("No disponible") ) ) {
                    response.sendRedirect("MensajeActivacion?prog="+prog1+"&perant=" + perant + "&nom_est=" + nom_est );
              

                } else if (dato.size() == 0) {
                    String secu = bd.sigSecuencia("PAGINSC");
                    consulta = new String(" insert into registro.pginscrip values (" + secu + ", '" + periodo + "', '" + nombre.toUpperCase() + "', '" + ema + "', '" + doc
                            + "', '" + tel + "', getdate(), 0, getdate(), '" + tipoest + "', '" + prog + "', '" + snp.toUpperCase() + "', '" + snp2 + "', '" + tel_ofi + "', '" + ape1.toUpperCase() + "', '" + ape2.toUpperCase() + "', '" + nom.toUpperCase() + "', '" + bachillerext.toUpperCase() + "', '" + icfes.toUpperCase() + "', '" + procedencia.toUpperCase() + "', '" + colegio.toUpperCase() + "' , 'N' , '"+puntaje+"', '"+convenio+"','"+tip_doc+"') ");
                    // out.println(consulta);
                    int resultado = bd.actualiza(consulta);
                    if (resultado == 0) {
                        out.println("SUS DATOS NO ESTÁN COMPLETOS, O ALGÚN DATO NO SE INGRESO CORRECTAMENTE");
                    } else {
                        consulta="insert into registro.inscritos_generacion_e values ('"+doc+"', GETDATE(), NULL,'"+prog+"', '"+secu+"')";
                        resultado = bd.actualiza(consulta);
                        if(resultado==0){
                            out.println("SUS DATOS NO ESTÁN COMPLETOS, O ALGÚN DATO NO SE INGRESO CORRECTAMENTE");
                        }else{
                            response.sendRedirect("MensajeGeneracionE?apellido1=" + ape1 + "&apellido2=" + ape2 + "&nombre=" + nom + "&doc=" + doc + "&ref=" + secu + "&prog=" + prog + "&tipoest=" + tipoest );
                        }

                    }
                } else {
                    response.sendRedirect("MensajeGeneracionE?apellido1=" + ape1 + "&apellido2=" + ape2 + "&nombre=" + nom + "&doc=" + doc + "&prog=" + prog + "&ref=" + dato.elementAt(0) + "&tipoest=" + tipoest  );

                }
            } catch (Exception ex) {
                out.println("Mensaje:" + ex.getMessage() + bd.getMensajeBD() + consulta);
            }
        } else {
            response.sendRedirect("MensajeIngreso");
        }
    }
}
