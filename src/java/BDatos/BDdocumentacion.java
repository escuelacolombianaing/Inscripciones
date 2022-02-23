/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BDatos;

import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import BDatos.BaseDatos;

/**
 *
 * @author lrodriguez
 */
public class BDdocumentacion extends BaseDatos {

    private String mensaje;

    /** Creates a new instance of BDadmisiones */
    public BDdocumentacion() {
    }

    public Vector ConsultaDatos(String docEst,  String per, PrintWriter out) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select  registro.estudiante.id_est, doc_est, nom_est,id_dpto, num_sol, estado, nr_sec, tip_est, "
                + " blq_doc,doc_liq, doc_transfe, base_liq, bas_pru " +
                " from registro.registro.estudiante    " +
                " where doc_est = '" + docEst + "'  and (tip_est = 'N'  or  tip_est = 'S' or  tip_est = 'T') and per_ing = '" + per + "'  ");

        //asi estaba para 2010-2 tip_est in ('N', 'S')
       // out.println(consulta);
//and registro.estudiante.refins= '" + numRef + "'
        try {
            conectarBD();
            //2010-2 retorno = consultar(consulta, 9, 1);
            retorno = consultar(consulta, 13, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    
    
    public Vector ConsultaDatosPos(String docEst,  String per, PrintWriter out) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select  registro.estudiante.id_est, doc_est, nom_est,id_dpto, num_sol, estado, nr_sec, tip_est, "
                + " blq_doc,doc_liq, doc_transfe, base_liq, bas_pru " +
                " from registro.registro.estudiante    " +
                " where doc_est = '" + docEst + "'  and (tip_est = 'P' ) and per_ing = '" + per + "'  ");

        //asi estaba para 2010-2 tip_est in ('N', 'S')
       // out.println(consulta);
//and registro.estudiante.refins= '" + numRef + "'
        try {
            conectarBD();
            //2010-2 retorno = consultar(consulta, 9, 1);
            retorno = consultar(consulta, 13, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    
    
    


    //Datos articulación
    public Vector ConsultaDatosArt(String docEst,  String per, PrintWriter out) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select  registro.estudiante.id_est, doc_est, nom_est,id_dpto, num_sol, estado, nr_sec, tip_est, blq_doc, doc_liq, doc_transfe, base_liq, bas_pru " +
     " from registro.registro.estudiante    " +
     " where doc_est = '" + docEst + "'  and   tip_est = 'S'  and per_ing = '" + per + "'  ";

        //asi estaba para 2010-2 tip_est in ('N', 'S')
       // out.println(consulta);
//and registro.estudiante.refins= '" + numRef + "'
        try {
            conectarBD();
            //2010-2 retorno = consultar(consulta, 9, 1);
            retorno = consultar(consulta, 13, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


//consultar si el estudiante ya cargó documentos

    public Vector Ducumensubidos(String idest, String periodo, PrintWriter out) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select id_est,  per_acad, fec_docins, fec_docmat, fec_docliq, fec_doctransfe " +
                " from registro.fecdoc_insc " +
                " where id_est = '" + idest + "' and per_acad = '" + periodo + "'  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 6, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //inserta datos cdo el estudiante carga documentos de inscripcion
    public int subedocuminsc(String doc, String per, PrintWriter out) {
        String consulta = new String("insert into registro.fecdoc_insc " +
                " (id_est,  fec_docins, fec_docmat, per_acad, fec_docliq) " +
                " values ( '" + doc + "',  getdate(), null, '" + per + "' , null) ");
         // out.println(consulta);
        return this.actualiza(consulta);
    }

    
    //inserta datos cdo el estudiante carga documentos de matricula
    public int subedocummat(String doc, String per, PrintWriter out) {
        String consulta = new String("insert into registro.fecdoc_insc " +
                " (id_est,  fec_docins, fec_docmat, per_acad, fec_docliq) " +
                " values ('" + doc + "',  null, getdate(),'" + per + "', null ) ");
        //out.println(consulta);
        return this.actualiza(consulta);
    }

      //inserta datos cdo el estudiante carga documentos de liquidación
    public int subedocumliq(String doc, String per, PrintWriter out) {
        String consulta = new String("insert into registro.fecdoc_insc " +
                " (id_est,  fec_docins, fec_docmat, per_acad, fec_docliq) " +
                " values ('" + doc + "',  null, null,'" + per + "', getdate() ) ");
        //out.println(consulta);
        return this.actualiza(consulta);
    }

     //inserta datos cdo el estudiante carga documentos de transferencia
    public int subedocumtransfe(String doc, String per, PrintWriter out) {
        String consulta = new String("insert into registro.fecdoc_insc " +
                " (id_est,  fec_docins, fec_docmat, per_acad, fec_docliq, fec_doctransfe) " +
                " values ('" + doc + "',  null, null,'" + per + "', null, getdate() ) ");
        //out.println(consulta);
        return this.actualiza(consulta);
    }

//actualizar fecha cdo el estudiante carga por 2 vez documentos de inscripción EN UN PERIODO
    public int documinsc(String idEst, String per, PrintWriter out) {
        String consulta = new String("update registro.fecdoc_insc" +
                " set fec_docins = getdate()  " +
                " where id_est = '" + idEst + "' and per_acad='" + per + "' ");
        return this.actualiza(consulta);
    }
//actualizar fecha cdo el estudiante carga por 2 vez documentos de matrícula

    public int docummat(String idEst,  String per,PrintWriter out) {
        String consulta = new String("update registro.fecdoc_insc" +
                " set fec_docmat = getdate()  " +
                " where id_est = '" + idEst + "'  and per_acad='" + per + "' ");
        return this.actualiza(consulta);
    }

//actualizar fecha cdo el estudiante carga por 2 vez documentos de liquidación matrícula

    public int documliq(String idEst,  String per,PrintWriter out) {
        String consulta = new String("update registro.fecdoc_insc" +
                " set fec_docliq = getdate()  " +
                " where id_est = '" + idEst + "' and per_acad='" + per + "' ");
        return this.actualiza(consulta);
    }

    //Actualizar fecha cargue doc transferencia carga por 2 vez documentos
     public int documtransfe(String idEst, String per, PrintWriter out) {
        String consulta = new String("update registro.fecdoc_insc" +
                " set fec_doctransfe = getdate()  " +
                " where id_est = '" + idEst + "'  and per_acad='" + per + "'");
        return this.actualiza(consulta);
    }

    //validar si el estudiante ya cargo un archivo y tiene observaciones no puede volver a cargar

    public Vector impidecargue(String idest, PrintWriter out) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select id_est,  observaciones, id_doc from registro.verifica_doc" +
                " where id_est= '" + idest + "' and observaciones <>'' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    
    //validar si el estudiante ya cargo un archivo y tiene observaciones no puede volver a cargar

    public Vector impidecarguePos(String idest, PrintWriter out) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select id_est,  observaciones, id_doc from registro.verifica_docpos" +
                " where id_est= '" + idest + "' and observaciones <>'' and id_doc <> 4");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    //validar si el estudiante ya cargo un archivo y tiene observaciones no puede volver a cargar

    public Vector impidecargueDoctorado(String idest, PrintWriter out) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select id_est,  observaciones, id_doc from registro.verifica_doc_doc" +
                " where id_est= '" + idest + "' and observaciones <>'' and id_doc <> 4");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    

     public Vector ConsultaDoc(String docEst, String per, PrintWriter out) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est, registro.docum_adm.id_doc, descripcion, registro.verifica_doc.estado, observaciones, tip_est, id_dpto " +
            " from registro.estudiante, registro.docum_adm, registro.verifica_doc " +
            " where  registro.estudiante.doc_est='" + docEst + "' and " +
            " registro.verifica_doc.id_est= registro.estudiante.id_est and  registro.docum_adm.id_doc= registro.verifica_doc.id_doc and per_ing= '"+per+"' " +
            " order by  registro.docum_adm.id_doc ");
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
     
     
     public Vector ConsultaDocPosgrado(String docEst, String per, PrintWriter out) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est, registro.docum_admpos.id_doc, descripcion, registro.verifica_docpos.estado, observaciones, tip_est, id_plan " +
            " from registro.estudiante, registro.docum_admpos, registro.verifica_docpos " +
            " where  registro.estudiante.doc_est='" + docEst + "' and " +
            " registro.verifica_docpos.id_est= registro.estudiante.id_est and  registro.docum_admpos.id_doc= registro.verifica_docpos.id_doc and per_ing= '"+per+"' " +
            " order by  registro.docum_admpos.id_doc ");
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

     public Vector ConsultaDocDoctorado(String docEst, String per, PrintWriter out) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est, registro.docum_admdoc.id_doc, descripcion, registro.verifica_doc_doc.estado, " +
        "observaciones, tip_est, id_plan from registro.estudiante, registro.docum_admdoc, registro.verifica_doc_doc " +
        "where  registro.estudiante.doc_est='"+docEst+"' and " +
        "registro.verifica_doc_doc.id_est= registro.estudiante.id_est and  registro.docum_admdoc.id_doc= registro.verifica_doc_doc.id_doc and per_ing= '"+per+"' " +
        "order by  registro.docum_admdoc.id_doc ");
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
     
}
