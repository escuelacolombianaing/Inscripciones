/*
 * BDadmisiones.java
 *
 * Created on 15 de marzo de 2007, 10:02 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package BDatos;

import java.io.*;
import java.text.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import BDatos.BaseDatos;
import java.util.logging.Level;
import java.util.logging.Logger;
import utiles.ConsultaException;

/**
 * /**
 *
 * @author Administrador
 */
public class BDadmisiones extends BaseDatos {

    private String mensaje;
    protected Persistencia bd=new Persistencia();

    /**
     * Creates a new instance of BDadmisiones
     */
    public BDadmisiones() {
    }

    public Vector ExisteRef(String doc, String per, String prog) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList 
        params.add(doc);
        params.add(per);
        params.add(prog);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select idinsc, nom, dpto from registro.pginscrip "
                + "where doc = ? and per = ? and dpto= ? ");

        try {
            conectarBD();
            retorno = consultar(consulta, 3, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector ExisteRefPreg(String doc, String per) {
        ArrayList<String> params = new ArrayList<String>(2);

        params.add(doc);
        params.add(per);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select idinsc, nom, dpto from registro.pginscrip "
                + "where doc = ? and per = ? ");

        try {
            conectarBD();
            retorno = consultar(consulta, 3, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector ExisteSNP(String per, String snp) {
        ArrayList<String> params = new ArrayList<String>(2);

        params.add(per);
        params.add(snp);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select snp, idinsc from registro.pginscrip "
                + "where per = ?  and snp= ?");

        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consulta para verificar si el estudiante al solicitar nro de refer esta en estado -12 autorizado a seguimiento
    //Esto debido a que muchos que no estan autorizados pagan la prenscripción.
    public Vector VerificaSeg(String doc, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);

        params.add(doc);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select doc_est, estado, per_ing , id_dpto, nom_est,adm_nomat from registro.estudiante "
                + "where doc_est =?  ");

        try {
            conectarBD();
            retorno = consultar(consulta, 6, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector ExamenConoc(String doc, String per, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(doc);
        params.add(per);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select  id_est,  nom_est , emails, tipo_exa from registro.estudiante "
                + "where doc_est = ?  and per_ing = ? ");

        try {
            conectarBD();
            retorno = consultar(consulta, 4, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Datos para el examen de conocimiento
    /*public Vector Exa_Cono(String carnet, String per, PrintWriter out) {
     ArrayList<String> params = new ArrayList<String>(2);
     params.add(carnet);
     params.add(per);

     Vector retorno = new Vector();
     String consulta = new String();
     consulta = "select  registro.exa_conocimiento.id_est,  nivel_ini, nivel_exa, confir_mat, confir_fis, confir_qui, nom_est, registro.estudiante.id_dpto, nom_dpto from registro.exa_conocimiento, registro.estudiante, registro.departamento"
     + " where registro.exa_conocimiento.id_est = ?  and registro.exa_conocimiento.per_ing = ? and  registro.exa_conocimiento.id_est = registro.estudiante.id_est and registro.departamento.id_dpto= registro.estudiante.id_dpto ";

     try {
     conectarBD();
     retorno = consultar(consulta, 9, 0, params);
     } catch (Exception ex) {
     mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
     }
     desconectarBD();
     return retorno;
     }*/
    public Vector Exa_Cono(String carnet, String per, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(carnet);
        params.add(per);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select  id_est,  nivel_ini, nivel_exa, confir_mat, confir_fis, confir_qui from registro.exa_conocimiento"
                + " where id_est = ?  and per_ing = ? ";

        try {
            conectarBD();
            retorno = consultar(consulta, 6, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //confirma examen de matematicas
    public int ConfirExaM(String idEst, String valorM, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        int retorno = 0;
        params.add(valorM);
        params.add(idEst);
        String consulta = "update registro.exa_conocimiento"
                + " set confir_mat =? , fecha_confir = getdate() "
                + " where id_est = ? ";
        // return this.actualiza(consulta, params);
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    //confirma examen de física

    public int ConfirExaF(String idEst, String valorF, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        int retorno = 0;
        params.add(valorF);
        params.add(idEst);
        String consulta = new String("update registro.exa_conocimiento"
                + " set confir_fis =?, fecha_confir = getdate()  "
                + " where id_est = ?");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    //confirma examen de Química

    public int ConfirExaQ(String idEst, String valorQ, PrintWriter out) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(valorQ);
        params.add(idEst);
        String consulta = new String("update registro.exa_conocimiento"
                + " set confir_qui =?, fecha_confir = getdate()  "
                + " where id_est = ? ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Actauliza nivelicfes en estudiante segun exa_cono
    public int NuevoNivelIcfes(String idEst, String valor, PrintWriter out) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(valor);
        params.add(idEst);
        String consulta = new String("update registro.estudiante"
                + " set nivelicfes =? "
                + " where id_est = ? ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consultar nivelicfes luego de ser actualizado segun examen de conoc
    public Vector NvoNivelIcfes(String carnet, String per, PrintWriter out) {

        ArrayList<String> params = new ArrayList<String>(2);
        params.add(carnet);
        params.add(per);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select nivelicfes from registro.estudiante"
                + " where id_est = ?  and per_ing = ? ";

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //inserta observavion para examen de conocimiento
    public int InsertaAnotacion(String sec, String idEst, String anotacion, PrintWriter out) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(4);
        configeci.configuracion confeci = new configeci.configuracion();
        params.add(sec);
        params.add(idEst);
        params.add(anotacion);
        params.add(confeci.getPeriodo());

        String consulta = new String("insert into registro.anotacion_aux "
                + " (id_anot,tabla, id_tabla,fecha,titulo, tip_anot, anotacion, fec_suc, per) "
                + " values ( ?, 'ESTUDIANTE', ?, getdate(), 'Nivel clasificación', '1566', ?, getdate(), ? ) ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consultar examen virtual
    public Vector ExaVirtual(String doc) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(doc);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select registro.salon_exavirtual.id_est, convert(varchar,fecha, 103), registro.salon_exavirtual.id_dpto, nom_dpto, nom_est  from registro.salon_exavirtual, registro.estudiante, registro.departamento "
                + "where doc_est=? and registro.salon_exavirtual.id_est = registro.estudiante.id_est and registro.departamento.id_dpto= registro.salon_exavirtual.id_dpto ");
        try {
            conectarBD();
            retorno = consultar(consulta, 5, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //consultar el ultimo plan de estudios de un programa
    public Vector VerificaPlan(String dpto) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(dpto);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select registro.plan_estud.id_plan from registro.programas, registro.plan_estud "
                + " where (registro.programas.id_prog = registro.plan_estud.id_prog) and id_dpto = ? and pmmat is not null and act = 'S'  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector VerificaPago(String numRef, PrintWriter out) {
        configeci.configuracion confeci = new configeci.configuracion();
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(numRef);
        params.add(confeci.getPeriodo());

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select convert(varchar(10),convert(int, vrpag)), dpto, pilopaga, tip_doc, snp from registro.pginscrip "
                + "where idinsc = ? and per = ? ";
        //  out.println(consulta);
        try {
            conectarBD();

            retorno = consultar(consulta, 5, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
        /*if (retorno.size() > 0) {
         return retorno.elementAt(0).toString();
         //return VerificaPago;
         * 
         } else {
         return "0.00";
         }*/
    }
    
    public Vector esGeneracionE(String doc, String prog, String idinsc) {
        configeci.configuracion confeci = new configeci.configuracion();
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(doc);
        params.add(prog);
        params.add(idinsc);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select idinsc from registro.inscritos_generacion_e where documento=? and dpto=? and idinsc=?";
        //  out.println(consulta);
        try {
            conectarBD();

            retorno = consultar(consulta, 1, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
        /*if (retorno.size() > 0) {
         return retorno.elementAt(0).toString();
         //return VerificaPago;
         * 
         } else {
         return "0.00";
         }*/
    }

    public Vector VerificaPagoPos(String numRef, String periodo, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(numRef);
        params.add(periodo);
        configeci.configPosgrados confeci = new configeci.configPosgrados();

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select convert(varchar(10),convert(int, vrpag)), dpto from registro.pginscrip "
                + "where idinsc = ? and per =? ");
        //  out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
        /* if (retorno.size() > 0) {
         return retorno.elementAt(0).toString();
         } else {
         return "0.00";
         }*/
    }

    public String sigSecuencia(String entidad) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(entidad);
        Vector retorno = new Vector();
        int retsec = 0;
        String consulta = new String();
        consulta = new String("select convert(varchar(10), sig_sec) from registro.secuencias where nombre = ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
            params = new ArrayList<String>(1);
            params.add(entidad);
            consulta = new String("update registro.secuencias set sig_sec = sig_sec + incr where nombre = ? ");
            retsec = actualiza(consulta, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        /*consulta = new String("update registro.secuencias set sig_sec = sig_sec + incr where nombre = '" + entidad + "' ") ;
         try {
         conectarBD();
         retsec = actualizar(consulta);
         } catch (Exception ex) {
         retsec = 0;
         mensaje= new String("Unable to fetch status due to SQLException: " + ex.getMessage());
         }*/
        desconectarBD();
        //if(retorno.size()>0)
        return retorno.elementAt(0).toString();
        /*else
         return mensaje;*/
    }

    public Vector estadoInsc(String numRef, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(numRef);
        Vector retorno = new Vector();
        int retsec = 0;
        String consulta = new String();
        consulta = new String("select id_est, num_sol, estado, nom_est, id_dpto, nro_snp, doc_est, tip_est, id_plan, nom_acud from registro.estudiante "
                + "where refins =  ?  ");

        try {
            conectarBD();
            retorno = consultar(consulta, 10, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consulta para la generación del formulario impreso inscritos a becas
    public Vector ConsultaInscritoBecas(String docEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);
        configeci.configuracion confeci = new configeci.configuracion();
        Vector retorno = new Vector();
        int retsec = 0;
        String consulta = new String();
        consulta = new String(" select  registro.estudiante.id_est, doc_est, nom_est,id_dpto, nro_snp, lug_nac,registro.ciudades.nom_ciu, convert(varchar(10), fec_nac, 103), nro_libr, "
                + " nro_distr, dir_corr, tel_corr, emails, id_col, convert(varchar(10), fec_grado, 103),  avaluo_com, patrimonio, nom_acud, "
                + " docacu, dir_acud, tel_acud, nom_otr, dir_otr, tel_otr, nom_res, dir_res,tel_res, for_fin, vive_act, "
                + " pago_col,tip_viv,avaluo_com,patrimonio,par_acud,nom_acud, dir_acud,tel_acud, nom_otr,dir_otr, tel_otr, estrato,  ingreso, "
                + " ren_liq, vive_res, tip_est,nom_uni, num_sol, edu_res, id_pro, tip_res, pago_univ, ulttel, ultdir,registro.estudiante.celular, registro.responsable.celular, padre_egre,ciud.nom_ciu, id_ocu, anti_acti,email, interes_acad  "
                + " from registro.registro.estudiante, registro.ciudades, registro.responsable,registro.ciudades ciud    "
                + " where doc_est = ? and  per_ing ='" + confeci.getPeriodo() + "' and "
                + "registro.ciudades.id_ciu= registro.estudiante.ciu_corr and registro.estudiante.id_est=registro.responsable.id_est and "
                + "ciud.id_ciu= registro.estudiante.lug_nac and tip_est='S' ");
        //   out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 61, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //PARA LA VALIDACION DE LAS ENTREVISTAS POSTULADOS A BECA JULIO GARAVITO - TRANSFERENCIAS
    public Vector ConsultaEntrev(String docEst, String per, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(docEst);
        params.add(per);
        Vector retorno = new Vector();
        int retsec = 0;
        String consulta = new String();
        consulta = new String(" select registro.estudiante.nom_est, doc_est, tip_est,per_ing, fac_cor, estado,registro.estudiante.id_dpto "
                + " from registro.registro.estudiante "
                + " where doc_est = ? and registro.estudiante.per_ing= ? order by fac_cor ");
        //  out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Diagnostico(String docEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);
        Vector retorno = new Vector();
        int retsec = 0;
        String consulta = new String();
        consulta = new String(" select min (id_examen), registro.diagnostico.id_estud, lugar, fecha,  nom_est, id_dpto, hora,matematicas "
                + " from registro.registro.diagnostico, registro.estudiante "
                + " where registro.diagnostico.id_estud=registro.estudiante.id_est and registro.estudiante.doc_est=?  "
                + " group by registro.diagnostico.id_estud, lugar, fecha,  nom_est, id_dpto, hora,matematicas ");

        //  out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consultar número de referencia
    public Vector Referencia(String docEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(docEst);
        params.add(docEst);
        Vector retorno = new Vector();
        int retsec = 0;
        String consulta = new String();

        /*consulta = new String(" select max (per), idinsc, nom, dpto, registro.plan_estud.id_prog, nom_prog from registro.pginscrip, registro.plan_estud, registro.programas  "
         + " where registro.pginscrip.doc=?  and tip in ('N', 'S', 'P', 'T') and registro.pginscrip.per= ? and dpto=registro.plan_estud.id_plan and registro.plan_estud.id_prog= registro.programas.id_prog group by idinsc, nom, dpto, registro.plan_estud.id_prog, nom_prog");*/
        consulta = "select  max (per), idinsc,nom, nom_dpto from registro.pginscrip, registro.departamento "
                + " where (registro.pginscrip.dpto =  registro.departamento.id_dpto) and tip in ('N', 'S', 'T') and doc = ? group by idinsc,nom, nom_dpto "
                + " union "
                + "select max (per), idinsc, nom, nom_prog from registro.pginscrip, registro.programas, registro.plan_estud "
                + "where (registro.pginscrip.dpto = registro.plan_estud.id_plan) and (registro.plan_estud.id_prog =  registro.programas.id_prog)  and doc =? and tip='P' group by idinsc,nom, nom_prog";

        try {
            conectarBD();
            retorno = consultar(consulta, 4, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consulta para la generación del formulario impreso
    public Vector ConsultaInscrito(String docEst, String numRef, PrintWriter out, String per) {
        ArrayList<String> params = new ArrayList<String>(3);
        params.add(docEst);
        params.add(numRef);
        params.add(per);

        Vector retorno = new Vector();
        int retsec = 0;
        String consulta = new String();
        consulta = new String(" select  registro.estudiante.id_est, doc_est, nom_est,id_dpto, nro_snp, lug_nac,registro.ciudades.nom_ciu, convert(varchar(10), fec_nac, 103), nro_libr, "
                + " nro_distr, dir_corr, tel_corr, emails, id_col, convert(varchar(10), fec_grado, 103),  avaluo_com, patrimonio, nom_acud, "
                + " docacu, dir_acud, tel_acud, nom_otr, dir_otr, tel_otr, nom_res, dir_res,tel_res, for_fin, vive_act, "
                + " pago_col,tip_viv,avaluo_com,patrimonio,par_acud,nom_acud, dir_acud,tel_acud, nom_otr,dir_otr, tel_otr, estrato,  ingreso, "
                + " ren_liq, vive_res, tip_est,nom_uni, num_sol, edu_res, id_pro, tip_res, pago_univ, ulttel, ultdir,registro.estudiante.celular, registro.responsable.celular, padre_egre,ciud.nom_ciu, id_ocu, anti_acti,email "
                + " from registro.registro.estudiante, registro.ciudades, registro.responsable,registro.ciudades ciud    "
                + " where doc_est = ? and registro.estudiante.refins= ? and "
                + "registro.ciudades.id_ciu= registro.estudiante.ciu_corr and registro.estudiante.id_est=registro.responsable.id_est and "
                + "ciud.id_ciu= registro.estudiante.lug_nac and registro.estudiante.per_ing= ? ");
//out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 60, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector infoCorreoNuevos(String idest, String per) {
        Vector retorno = new Vector();
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idest);
        params.add(per);

        String consulta = new String();
        consulta = " select id_est, doc_est, nom_est, emails, tip_est "
                + " from registro.estudiante "
                + " where doc_est = ?  and ((per_ing= ? and estado in (-60,-59,-61,3,10,-91,-94,-92,13,7,20,6, -179)) or estado=-600)";
        try {
            conectarBD();
            retorno = consultar(consulta, 5, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector ConsultaHermanos(String docEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);

        Vector retorno = new Vector();
        int retsec = 0;
        String consulta = new String();
        consulta = new String(" select nom_her, simultaneo,docher "
                + " from registro.hermanos, registro.estudiante "
                + " where doc_est= ? and registro.estudiante.id_est=registro.hermanos.id_est  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getCiudades() {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select idc, nomc from registro.lisciudad order by nomc");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getPaises() {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select cod_pai, nom_pai from registro.paises order by nom_pai");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    //Rangos para valor de matrículas

    public Vector getRangomatric(String valor) {

        ArrayList<String> params = new ArrayList<String>(1);
        params.add(valor);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select vlr, vini,vfin from registro.rangomatric where vlr = ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    //Consultar valores matrícula pilo paga
     public Vector ValoresPiloPaga(String idprog) {

        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idprog);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select  valor from registro.valorespilopaga where idprog = ? ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getCiudadcor() {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select id_ciu, nom_ciu from registro.ciudades"
                + "where registro.ciudades.id_ciu= registro.estudiante.ciu_corr ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getProfesiones() {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select id_pro, nom_pro from registro.profesiones where cd_pro <> 'X' order by nom_pro");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getInscrito(String doc, String ref) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(doc);
        params.add(ref);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select idinsc, dpto, nom, doc, snp, ema, tip, ape1, ape2, nomest, tel_cel from registro.pginscrip "
                + "where doc = ? and idinsc = ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 11, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getInfoEst(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select id_est, nom_est, tip_doc, doc_est, dir_corr, ciu_corr, tel_corr, "
                + " id_dpto, lug_exp, nom_acud, dir_acud, tel_acud, nom_otr, dir_otr, tel_otr, estado, dtur, clanum, "
                + " tip_est, valren, sem_est, par_acud, bas_pru, emails, sem_est, tip_viv, avaluo_com, estrato, "
                + "patrimonio, num_sol,convert(varchar, getdate(), 103),passwd, per_ing "
                + " from registro.registro.estudiante "
                + " where doc_est= ? and estado not in (-10, 10,-600) ";
        if (idEst.length() <= 7) {
            params.add(idEst);
            consulta = consulta + "or id_est = ? ";
        }
        try {
            conectarBD();
            retorno = consultar(consulta, 33, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    
    //CONSULTA DE INFO ESTUDIANTE PARA REINTEGRO
    public Vector getInfoEstReint(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select id_est, nom_est, tip_doc, doc_est, dir_corr, ciu_corr, tel_corr, "
                + " id_dpto, lug_exp, nom_acud, dir_acud, tel_acud, nom_otr, dir_otr, tel_otr, estado, dtur, clanum, "
                + " tip_est, valren, sem_est, par_acud, bas_pru, emails, sem_est, tip_viv, avaluo_com, estrato, "
                + "patrimonio, num_sol,convert(varchar, getdate(), 103),passwd, per_ing "
                + " from registro.registro.estudiante "
                + " where doc_est= ? and estado not in (0, -10, 10,-600) ";
        if (idEst.length() <= 7) {
            params.add(idEst);
            consulta = consulta + "or id_est = ? ";
        }
        try {
            conectarBD();
            retorno = consultar(consulta, 33, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //PARA CONSULTAR EL PROMEDIO ACUMULADO DEL ESTUDIANTE
    public Vector despNotas(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);
        Vector retorno = new Vector();
        String consulta = new String();
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        consulta = new String("select  round(sum( ( b.prom * b.nota )*0.1 ) /  ( sum( b.prom)), 3) as prom_acum "
                + "from registro.estudiante e, registro.biblia_def  b "
                + "where (e.id_est = b.id_est) and e.id_est = ? HAVING ( sum(b.prom) > 0 )");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consulta para diferenciar los estudiantes que únicamente hicieron un periodo académico y ahora van a solicitar REINTEGRO
    //ya que la resta para ellos sera diferente a los q han hecho varios periodos académicos
    //contar en biblia_def cuantos periodos distintos tiene el estudiante.
    public String ReintegroPrimerS(String idEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);
        Vector retorno = new Vector();
        String consulta = new String();
        /* consulta = new String(" select  count (distinct per_acad) from  registro.biblia_def " +
         " where clave='R' and id_est='" + idEst + "' ");
         */
        consulta = new String(" select  count (distinct per_acad) from  registro.biblia_def "
                + " where clave in ('R','Z') and id_est=? ");

        //  out.println(consulta);

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno.elementAt(0).toString();
    }

    public int getExiste(String idEst, String per, String prog) {
        ArrayList<String> params = new ArrayList<String>(3);
        params.add(idEst);
        params.add(per);
        params.add(prog);
        int existe = -1;
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select id_est "
                + " from registro.registro.estudiante "
                + " where doc_est= ? and per_ing = ?  and id_plan = ? and tip_est <> 'S' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
            existe = Integer.parseInt(retorno.toString());
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno.size();
    }

    public String claveNum(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select passwd from registro.estudiante "
                + " where id_est =  ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno.elementAt(0).toString();
    }

    public String getNomCiudad(String ciudad) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(ciudad);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select nom_ciu "
                + " from registro.registro.ciudades "
                + " where id_ciu = ?  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        if (retorno.size() > 0) {
            return retorno.elementAt(0).toString();
        } else {
            return "";
        }
    }

    public Vector getPadres(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(carnet);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select tip_res, nom_res, dir_res, tel_res, dir_acti, lug_res, tel_acti, "
                + "ciu_tra, carg_res, edu_res, vive_res, id_res, ren_liq, ingreso "
                + " from registro.registro.responsable "
                + " where id_est = ?   order by id_res ");
        try {
            conectarBD();
            retorno = consultar(consulta, 14, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getSecuencia() {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select sig_sec  "
                + " from registro.secuencias"
                + " where registro.secuencias.nombre='NUM_SOLREINT' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Documentacion(String docEst, String periodo, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(docEst);
        params.add(periodo);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = ("select nom_est,estado, blq_doc "
                + "from registro.estudiante where doc_est= ? and per_ing= ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    public Vector Admitidos(String docEst, String periodo, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);
        String consulta = new String();
        Vector retorno = new Vector();
        /* consulta = new String(" select  nom_est, id_dpto, estado, doc_est, nom_acudiente, nro_snp,ar_mat, ar_soc,ar_cie,ar_len,id_est,ar_ele,num_sol, tip_est, nivelicfes  " +
         " from registro.registro.estudiante " +
         " where doc_est = '" + docEst + "' and per_ing= '" + periodo + "' and tip_est = 'N'  ");
         //out.println(consulta);*/
        consulta = new String(" select  nom_est, id_dpto, estado, doc_est, nom_acudiente, nro_snp,ar_mat, ar_soc,ar_cie,ar_len,id_est,ar_ele,num_sol, tip_est, nivelicfes, blq_doc, num_sol, convert(varchar(10),fec_insc, 103)  "
                + " from registro.registro.estudiante "
                + " where doc_est = ? and tip_est in ('N','E','Z')  ");

        try {
            conectarBD();
            retorno = consultar(consulta, 18, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    /*  public Vector AdmitidosN(String docEst, String periodo, PrintWriter out) {
     String consulta = new String();
     Vector retorno = new Vector();*/
    /*consulta = new String(" select  nom_est, id_dpto, estado, doc_est, nom_acudiente, nro_snp,ar_mat, ar_soc,ar_cie,ar_len,id_est,ar_ele,num_sol, tip_est, nivelicfes  " +
     " from registro.registro.estudiante " +
     " where doc_est = '" + docEst + "' and per_ing= '" + periodo + "' and tip_est = 'N'  ");
     //out.println(consulta);*/
    /* consulta = new String(" select  nom_est, id_dpto, estado, doc_est, nom_acudiente, nro_snp,ar_mat, ar_soc,ar_cie,ar_len,id_est,ar_ele,num_sol, tip_est, nivelicfes, blq_doc, num_sol  " +
     " from registro.registro.estudiante " +
     " where doc_est = '" + docEst + "' and tip_est in ('N','E','Z')  ");

     try {
     conectarBD();
     retorno = consultar(consulta, 17, 0);
     } catch (Exception ex) {
     mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
     }
     desconectarBD();
     return retorno;
     }*/
    public Vector Niveles(String idprog, String periodo, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idprog);
        params.add(periodo);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = " select  ma,fi,le,qui, as1,as2, as3,as4,as5,as6,as7,as8,as9,as10, as11,as12, otras, otras1, otras2   "
                + " from registro.baspreinsnuevos "
                + " where prg= ? and ping= ? order by ma,fi,le  ";
        //out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 19, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector NivelesBio(String idprog, String periodo, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idprog);
        params.add(periodo);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select  ma,fi,le,qui, bio, as1,as2, as3,as4,as5,as6,as7,as8,as9,as10, as11,as12,otras, otras1,otras2   "
                + " from registro.baspreinsnuevos "
                + " where prg= ? and ping= ? order by ma,fi,le  ");
        //out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 20, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //CONSULTAR ASIGNATURAS SEGUN CLASIFICACION DEL EXAMEN DE CONOCIMIENTO Y SABER 11 EN R.ASIG_EXA
    public Vector Asignaturas_exaMat(String idprog, String nivel) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idprog);
        params.add(nivel);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select  area, nivel, asig1, asig2, borrar1,borrar2,borrar3,borrar4,borrar5,borrar6   "
                + " from registro.asig_exa "
                + " where id_dpto= ? and nivel =? and area= 'MATEMATICAS'  ");
        //out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Asignaturas_exaFis(String idprog, String nivel) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idprog);
        params.add(nivel);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select  area, nivel, asig1, asig2, borrar1,borrar2,borrar3,borrar4,borrar5,borrar6    "
                + " from registro.asig_exa "
                + " where id_dpto= ? and nivel =? and area= 'FISICA'  ");
        //out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    //Insertar en tabla temporal

    public int RegistroTemp(String idEst, String per, PrintWriter out) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(per);
        params.add(idEst);
        String consulta = "insert into registro.registrotemp select id_est, per_acad, as_vis from registro.registro where per_acad = ? and id_est = ?  ";
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Asignaturas_exaQuim(String idprog, String nivel) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idprog);
        params.add(nivel);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select  area, nivel, asig1, asig2, borrar1,borrar2,borrar3,borrar4,borrar5,borrar6    "
                + " from registro.asig_exa "
                + " where id_dpto= ? and nivel =? and area= 'QUIMICA'  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //CREDITOS INICIALES PLAN PERSONALIZADO
    public Vector CreditosIni(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" SELECT sum(peso) as ncred    "
                + " FROM registro.estudiante, registro.asig_plan "
                + " WHERE (registro.estudiante.id_plan = registro.asig_plan.id_plan) AND id_est = ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //valor a sumar a los creditos iniciales por programa
    public Vector SumarCreditosIni(String iddpto) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(iddpto);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("  select distinct creditost"
                + "  from registro.creditos_examen "
                + " WHERE id_dpto= ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consultar valor a restar en registro.creditos_examen por programa ,MATEMATICAS y nivel
    public Vector RestaCreditosM(String iddpto, String nivel) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(nivel);
        params.add(iddpto);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("  select resta from registro.creditos_examen "
                + " where area='MATEMATICAS' and nivel =? and id_dpto=? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consultar valor a restar en registro.creditos_examen por programa ,FISICA y nivel
    public Vector RestaCreditosF(String iddpto, String nivel) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(nivel);
        params.add(iddpto);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("  select resta from registro.creditos_examen "
                + " where area='FISICA' and nivel =? and id_dpto=?  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consultar valor a restar en registro.creditos_examen por programa ,QUIMICA y nivel
    public Vector RestaCreditosQ(String iddpto, String nivel) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(nivel);
        params.add(iddpto);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("  select resta from registro.creditos_examen "
                + " where area='QUIMICA' and nivel =? and id_dpto=?  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consultar valor a restar en registro.creditos_examen por programa ,LENGUAJE y nivel
    public Vector RestaCreditosL(String iddpto, String nivel) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(nivel);
        params.add(iddpto);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("  select resta from registro.creditos_examen "
                + " where area='LENGUAJE' and nivel =? and id_dpto=?  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector CreditosFin(String idEst, String dpto, String nivelM, String nivelF, String nivelQ) {
        ArrayList<String> params = new ArrayList<String>(12);
        params.add(idEst);
        params.add(dpto);
        params.add(nivelM);
        params.add(nivelF);
        params.add(nivelQ);
        params.add(idEst);
        params.add(idEst);
        params.add(dpto);
        params.add(nivelM);
        params.add(nivelF);
        params.add(nivelQ);
        params.add(idEst);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" SELECT sum(peso) as ncred   "
                + " FROM registro.estudiante, registro.asig_plan "
                + " WHERE (registro.estudiante.id_plan = registro.asig_plan.id_plan) AND id_est = ?  "
                + " UNION "
                + " select sum(num_ulas_a)  from registro.asig_fund, registro.asignatura "
                + " where (registro.asig_fund.idasig = registro.asignatura.id_asig) and id_dpto = ? and ((area = 'Matematicas' and nivel = ?)  or (area = 'Fisica' and nivel = ?) or (area = 'quimica' and nivel = ?)) and idasig not in  "
                + " (SELECT id_asig "
                + " FROM registro.estudiante, registro.asig_plan "
                + " WHERE        (registro.estudiante.id_plan = registro.asig_plan.id_plan) AND id_est = ?  ) "
                + " union "
                + " select  sum(num_ulas_a)"
                + " from registro.registrotemp, registro.asignatura"
                + " where (registro.registrotemp.as_vis = registro.asignatura.id_asig) and id_est = ?  and as_vis not in "
                + " (select idasig from registro.asig_fund where id_dpto = ? and ((area = 'Matematicas' and nivel = ?)  or (area = 'Fisica' and nivel = ?) or (area = 'quimica' and nivel = ?))) and as_vis not in "
                + " (SELECT id_asig"
                + " FROM  registro.estudiante, registro.asig_plan"
                + " WHERE (registro.estudiante.id_plan = registro.asig_plan.id_plan) AND id_est = ?  )");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Insertar asignaturas de asig_exa en registrotemp que no existen para matematicas 
    public int InsertaRegistroTempM(String idprog, String per, String asig, String nivel, String idEst) {
        ArrayList<String> params = new ArrayList<String>(4);

        params.add(idprog);
        params.add(nivel);
        params.add(idEst);
        params.add(per);

        String consulta = new String();
        int retorno = 0;
        consulta = " insert into registro.registrotemp "
                + " select  '" + idEst + "', '" + per + "', '" + asig + "' from registro.asig_exa  "
                + " where id_dpto= ? and nivel =? and area= 'MATEMATICAS' and '" + asig + "' not in (select as_vis from registro.registrotemp where id_est = ? and per_acad = ?) ";
        //out.println(consulta);
        //return this.actualiza(consulta, params);
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Insertar asignaturas de asig_exa en registrotemp que no existen para matematicas 
    public int InsertaRegistroTempF(String idprog, String per, String asig, String nivel, String idEst) {
        ArrayList<String> params = new ArrayList<String>(4);

        params.add(idprog);
        params.add(nivel);
        params.add(idEst);
        params.add(per);

        String consulta = new String();
        int retorno = 0;
        consulta = " insert into registro.registrotemp "
                + " select  '" + idEst + "', '" + per + "', '" + asig + "'  from registro.asig_exa  "
                + " where id_dpto= ? and nivel =? and area= 'FISICA' and '" + asig + "' not in (select as_vis from registro.registrotemp where id_est = ? and per_acad = ?) ";

        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Insertar asignaturas de asig_exa en registrotemp que no existen para QUÍMICA
    public int InsertaRegistroTempQ(String idprog, String per, String asig, String nivel, String idEst) {
        ArrayList<String> params = new ArrayList<String>(4);

        params.add(idprog);
        params.add(nivel);
        params.add(idEst);
        params.add(per);
        String consulta = new String();
        int retorno = 0;
        consulta = new String(" insert into registro.registrotemp "
                + " select  '" + idEst + "', '" + per + "', '" + asig + "'  from registro.asig_exa  "
                + " where id_dpto= ? and nivel =? and area= 'QUIMICA' and '" + asig + "' not in (select as_vis from registro.registrotemp where id_est = ?  and per_acad = ?) ");

        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int BorrarAsignaTemp(String idasig1, String idasig2, String idasig3, String idasig4, String idasig5, String idasig6, String idEst, String per) {
        ArrayList<String> params = new ArrayList<String>(8);
        params.add(idasig1);
        params.add(idasig2);
        params.add(idasig3);
        params.add(idasig4);
        params.add(idasig5);
        params.add(idasig6);
        params.add(idEst);
        params.add(per);

        String consulta = new String();
        int retorno = 0;
        consulta = new String("delete from registro.registrotemp where as_vis in (?, ?, ?, ?, ?, ?) and id_est= ? and per_acad=? ");

        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int BorrarAsignaPreins(String idasig1, String idasig2, String idasig3, String idasig4, String idasig5, String idasig6, String idEst, String per) {
        ArrayList<String> params = new ArrayList<String>(8);
        params.add(idasig1);
        params.add(idasig2);
        params.add(idasig3);
        params.add(idasig4);
        params.add(idasig5);
        params.add(idasig6);
        params.add(idEst);
        params.add(per);
        String consulta = new String();
        int retorno = 0;

        consulta = new String("delete from registro.inscripcionprim where as_vis in (?, ?, ?, ?, ?, ?) and id_est= ? and per_acad=?");

        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

//BUSCAR 9709 fimf en registrotemp
    public Vector ValidaFisica(String idEst, String per) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idEst);
        params.add(per);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select  as_vis from registro.registrotemp   "
                + " where as_vis=9709 and id_est=? and per_acad= ?");
        //out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //BUSCAR 9694 cald
    public Vector ValidaCal(String idEst, String per) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idEst);
        params.add(per);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select  as_vis from registro.registrotemp   "
                + " where as_vis=9694 and  id_est=? and per_acad= ?");
        //out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //BORRAR fISICA de registrotemp
    public int BorrarFisicaTemp(String idEst, String per) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idEst);
        params.add(per);
        String consulta = new String();
        int retorno = 0;
        consulta = "delete from registro.registrotemp where as_vis =9709 and id_est= ? and per_acad=?";

        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //BORRAR fISICA de inscripcionprim
    public int BorrarFisicaPreins(String idEst, String per) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idEst);
        params.add(per);
        String consulta = new String();
        int retorno = 0;
        consulta = new String("delete from registro.inscripcionprim where as_vis in (9709,9710) and id_est= ? and per_acad=?");

        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int BorrarRegistro(String idEst, String per) {
        ArrayList<String> params = new ArrayList<String>(3);
        params.add(idEst);
        params.add(idEst);
        params.add(per);
        String consulta = new String();
        int retorno = 0;
        consulta = new String("delete from registro.registro where id_reg in (select id_reg from registro.registro where id_est = ? and as_vis not in (select as_vis from registro.registrotemp where id_est = ? and per_acad=?))");

        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int BorrarTemporal(String idEst, String per) {
        ArrayList<String> params = new ArrayList<String>(3);
        params.add(idEst);
        params.add(per);
        String consulta = new String();
        int retorno = 0;
        consulta = new String("delete from registro.registrotemp where  id_est = ? and per_acad= ? ");

        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consultar asignaturas de registrotemp
    public Vector AsignaturasRegistroT(String idEst, String per) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idEst);
        params.add(per);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select as_vis, nom_asig from registro.registrotemp, registro.asignatura "
                + "where id_est=? and per_acad=? and as_vis= id_asig  and tipo_asig='N' ");
        //out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector nomasignaturas(String cod1, String cod2, String cod3, String cod4, String cod5, String cod6, String cod7, String cod8, String cod9, String cod10, String cod11, String cod12, String otras, String otras1, String otras2, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(15);
        params.add(cod1);
        params.add(cod2);
        params.add(cod3);
        params.add(cod4);
        params.add(cod5);
        params.add(cod6);
        params.add(cod7);
        params.add(cod8);
        params.add(cod9);
        params.add(cod10);
        params.add(cod11);
        params.add(cod12);
        params.add(otras);
        params.add(otras1);
        params.add(otras2);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = " select nom_asig   "
                + " from registro.asignatura "
                + " where cod_asig= ? or cod_asig= ? or cod_asig= ? or  cod_asig= ? or  cod_asig= ? "
                + " or cod_asig= ? or cod_asig= ? or cod_asig= ?  or cod_asig= ? or cod_asig= ? or cod_asig= ? or cod_asig= ? or cod_asig= ? or cod_asig= ?  or cod_asig= ?   ";
        //  out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector nomasignaturasExamen(String cod1, String cod2, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(cod1);
        params.add(cod2);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = " select nom_asig   "
                + " from registro.asignatura "
                + " where id_asig= ? or id_asig= ?   ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector nomasignaturasBio(String cod1, String cod2, String cod3, String cod4, String cod5, String cod6, String cod7, String cod8, String cod9, String cod10, String cod11, String cod12, String cod13, String cod14, String cod15, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(15);
        params.add(cod1);
        params.add(cod2);
        params.add(cod3);
        params.add(cod4);
        params.add(cod5);
        params.add(cod6);
        params.add(cod7);
        params.add(cod8);
        params.add(cod9);
        params.add(cod10);
        params.add(cod11);
        params.add(cod12);
        params.add(cod13);
        params.add(cod14);
        params.add(cod15);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select nom_asig   "
                + " from registro.asignatura "
                + " where cod_asig= ? or cod_asig= ? or cod_asig= ? or  cod_asig= ? or  cod_asig= ? "
                + " or cod_asig= ? or cod_asig= ? or cod_asig= ?  or cod_asig= ? or cod_asig= ? or cod_asig= ? or cod_asig= ? or cod_asig= ? or cod_asig= ? or cod_asig= ? order by cod_asig");
        //  out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Medios() {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select id_medio, nom_medio from registro.medio_ent ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    // Consulta para generar los admitidos proceso de readmisión-becas y reintegros
    // esperar si Nancy decide colocar fac_cor de admitidos en 1 para la consulta
   /* public Vector AdmitidosPregrado1(String doc, PrintWriter out) {
     String consulta = new String();
     Vector retorno = new Vector();
     consulta = new String("select nom_est, registro.estudiante.id_dpto,  estado, fac_cor, tip_est, doc_est,id_est, num_sol, nom_acudiente , ar_mat, ar_soc,ar_cie,ar_len,ar_ele, convert(varchar(10),fsolread, 103) " +
     " from registro.estudiante " +
     " where doc_est = '" + doc + "'  ");
     // out.println(consulta);
     //and estado in (-13, -19)
     try {
     conectarBD();
     retorno = consultar(consulta, 15, 1);
     } catch (Exception ex) {
     mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
     }
     desconectarBD();
     return retorno;
     }
     */
    public Vector AdmitidosPregrado(String doc, PrintWriter out, String periodo) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(doc);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est,id_dpto, estado,doc_est,nom_acudiente,nro_snp, ar_mat, ar_soc,ar_cie,ar_len,ar_ele,  "
                + "id_est,num_sol,tip_est,nivelicfes,blq_doc,fac_cor, convert(varchar(10),fec_insc, 103),  convert(varchar(10),fsolread, 103), doc_liq, c_beca, per_ing, per_ingreal, ar_social,ar_biol, tipo_exa, pilopaga "
                + " from registro.estudiante "
                + " where doc_est = ?  and registro.estudiante.per_ing= '" + periodo + "'  ");

        //and registro.estudiante.per_ing= '" + periodo + "' 
        //out.println(consulta);
        //and estado in (-13, -19)
        try {

            conectarBD();
            retorno = consultar(consulta, 27, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector AdmitidosOtros(String doc, PrintWriter out, String periodo) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(doc);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est,id_dpto, estado,doc_est,nom_acudiente,nro_snp, ar_mat, ar_soc,ar_cie,ar_len,ar_ele,  "
                + "id_est,num_sol,tip_est,nivelicfes,blq_doc,fac_cor, convert(varchar(10),fec_insc, 103),  convert(varchar(10),fsolread, 103), doc_liq, c_beca, per_ing, per_ingreal, ar_social,ar_biol, tipo_exa, pilopaga "
                + " from registro.estudiante "
                + " where doc_est = ?   ");

        //and registro.estudiante.per_ing= '" + periodo + "' 
        //out.println(consulta);
        //and estado in (-13, -19)
        try {

            conectarBD();
            retorno = consultar(consulta, 27, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector infoCorreo(String idest) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idest);
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = " select id_est, doc_est, nom_est, emails "
                + " from registro.estudiante "
                + " where  doc_est = ? ";
        try {

            conectarBD();
            retorno = consultar(consulta, 4, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Se incluye el periodo actual especificamente
    public Vector AdmitidosPregradoOtros(String doc, PrintWriter out, String periodo) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(doc);
        params.add(periodo);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est,id_dpto, estado,doc_est,nom_acudiente,nro_snp, ar_mat, ar_soc,ar_cie,ar_len,ar_ele,  "
                + "id_est,num_sol,tip_est,nivelicfes,blq_doc,fac_cor, convert(varchar(10),fec_insc, 103),  convert(varchar(10),fsolread, 103), doc_liq, c_beca, per_ing, per_ingreal, ar_social,ar_biol "
                + " from registro.estudiante "
                + " where doc_est = ? and registro.estudiante.per_ing= ?   ");

        //and registro.estudiante.per_ing= '" + periodo + "' 
        //out.println(consulta);
        //and estado in (-13, -19)
        try {
            conectarBD();
            retorno = consultar(consulta, 25, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Se incluye el periodo actual especificamente
    //CONTROL CIERRE EXAMEN CONOCIMIENTO
    public Vector ControlaCierreRtaExamen(String doc, PrintWriter out, String periodo) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(doc);
        params.add(periodo);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est,id_dpto, estado,doc_est,nom_acudiente,nro_snp, ar_mat, ar_soc,ar_cie,ar_len,ar_ele,  "
                + "id_est,num_sol,tip_est,nivelicfes,blq_doc,fac_cor, convert(varchar(10),fec_insc, 103),  convert(varchar(10),fsolread, 103), doc_liq, c_beca, per_ing, per_ingreal, ar_social,ar_biol "
                + " from registro.estudiante "
                + " where doc_est = ? and registro.estudiante.per_ing= ?  and getdate() < '29/7/2020' ");

        //and registro.estudiante.per_ing= '" + periodo + "' 
        //out.println(consulta);
        //and estado in (-13, -19)
        try {
            conectarBD();
            retorno = consultar(consulta, 25, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consulta para verificar si el estudiante becado tiene la anotacion correspondiente en la tabla anot_cad
    public Vector AnotacionBeca(String idest, String periodo, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idest);
        params.add(periodo);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select id_est, tip_anot,  per_acad, id_tex,tex_ano "
                + " from registro.anot_acad, registro.text_ano "
                + " where id_est = ? and tip_anot = id_tex  and registro.anot_acad.per_acad = ?  ");

        try {
            conectarBD();
            retorno = consultar(consulta, 5, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector AnotacionReint(String idest, String periodo) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idest);
        params.add(periodo);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select id_tabla, tip_anot,  per "
                + " from registro.anotacion_aux "
                + " where id_tabla = ? and tip_anot = 1480  and registro.anotacion_aux.per = ?  ");

        try {
            conectarBD();
            retorno = consultar(consulta, 3, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int logconsultaadmitidos(String doc, String estado, PrintWriter out) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(doc);
        params.add(estado);

        String consulta = new String("insert into registro.logconsultaadmitidos "
                + " (id_est,  estado, fecha) "
                + " values ( ?, ?, getdate() ) ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Guardar datos del contactenos de pregrado
    public int contactenos(String programa, String nombres, String grado, String fechagrad, String colegio, String ciudad, String tel, String celular, String email, String comentarios, PrintWriter out) {
        int retorno = 0;
        programa = programa.toUpperCase();
        nombres = nombres.toUpperCase();
        colegio = colegio.toUpperCase();
        ciudad = ciudad.toUpperCase();
        email = email.toUpperCase();
        comentarios = comentarios.toUpperCase();
        ArrayList<String> params = new ArrayList<String>(10);
        params.add(programa);
        params.add(nombres);
        params.add(grado);
        params.add(fechagrad);
        params.add(colegio);
        params.add(ciudad);
        params.add(tel);
        params.add(celular);
        params.add(email);
        params.add(comentarios);


        String consulta = new String("insert into registro.contactepregrado "
                + " values ( ?, ?, ?, ?,?,?,?,?, ?, ?, getdate() ) ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Guarda inf basica del estudiante que solicito reclasificación por la web
    public int logreclasifica(String doc, String niveles, PrintWriter out) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(doc);
        params.add(niveles);
        String consulta = new String("insert into registro.logreclasifica "
                + " (id_est, fecha, nvaclasifica) "
                + " values ( ?, getdate(),  ? ) ");
        //   out.println(consulta);
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //insertar evento Gestion de Inf
    public int Gestion(String doc, String nombres, String celular, String mail, String cargo, String area, String empresa) {
        ArrayList<String> params = new ArrayList<String>(7);

        nombres = nombres.toUpperCase();
        params.add(doc);
        params.add(nombres);
        params.add(celular);
        params.add(mail);
        params.add(cargo);
        params.add(area);
        params.add(empresa);
        int retorno = 0;
        String consulta = "insert into registro.inscrito_eventos " + " (id_evento, documento, nombres, celular, mail, cargo,area,empresa, fechains) " + " values ( '263', ?,  ?, ?, ?, ?, ?, ?, getdate() ) ";
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //insertar evento Conferencia transporte
    //AQUI VOY T
    public int Transporte(String doc, String nombres, String celular, String mail, String area, String ciudadtel) {
        ArrayList<String> params = new ArrayList<String>(6);

        nombres = nombres.toUpperCase();
        params.add(doc);
        params.add(nombres);
        params.add(celular);
        params.add(mail);
        params.add(area);
        params.add(ciudadtel);
        int retorno = 0;
        String consulta = "insert into registro.inscrito_eventos " + " (id_evento, documento, nombres, celular, mail, area,ciudadtel, fechains) " + " values ( '275', ?,  ?, ?, ?,  ?, ?, getdate() ) ";
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Evento eciciencia2014
    public int Eciciencia(String doc, String nombres, String celular, String mail, String area, String empresa, String servicios) {
        ArrayList<String> params = new ArrayList<String>(7);

        nombres = nombres.toUpperCase();
        params.add(doc);
        params.add(nombres);
        params.add(celular);
        params.add(mail);
        params.add(area);
        params.add(empresa);
        params.add(servicios);
        int retorno = 0;
        String consulta = "insert into registro.inscrito_eventos " + " (id_evento, documento, nombres, celular, mail, area,empresa, fechains, servicios) " + " values ( '264', ?,  ?, ?, ?,  ?, ?, getdate(), ? ) ";
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Evento MaestriaIndustrial2014
    public int Industrial(String doc, String nombres, String celular, String mail, String telefono, String area) {
        ArrayList<String> params = new ArrayList<String>(6);
        nombres = nombres.toUpperCase();
        params.add(doc);
        params.add(nombres);
        params.add(celular);
        params.add(mail);
        params.add(telefono);
        params.add(area);
        int retorno = 0;
        String consulta = "insert into registro.inscrito_eventos " + " (id_evento, documento, nombres, celular, mail, telefono,area, fechains) " + " values ( '273', ?, ?, ?, ?, ?, ?, getdate() ) ";
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //insertar evento externo se adapta de acuerdo a los campos solicitados
    public int Evento(String idevento, String doc, String nombres, String mail, String celular, String telefono, String programa) {
        ArrayList<String> params = new ArrayList<String>(7);

        nombres = nombres.toUpperCase();
        params.add(idevento);
        params.add(doc);
        params.add(nombres);
        params.add(mail);
        params.add(celular);
        params.add(telefono);
        params.add(programa);
        int retorno = 0;
        String consulta = "insert into registro.inscrito_eventos " + " (id_evento, documento, nombres, mail, celular,  telefono, area, fechains) " + " values ( ?, ?, ?, ?, ?, ?, ?, getdate()) ";
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Evento Norma 
    public int EventoUGE(String idevento, String doc, String nombres, String mail, String telefono, String correoempre, String area, String ciudadempre, String empresa, String otrovin, String secuencia) {
        ArrayList<String> params = new ArrayList<String>(11);

        nombres = nombres.toUpperCase();
        params.add(idevento);
        params.add(doc);
        params.add(nombres);
        params.add(mail);
        params.add(telefono);
        params.add(correoempre);
        params.add(area);
        params.add(ciudadempre);
        params.add(empresa);
        params.add(otrovin);
        params.add(secuencia);
        int retorno = 0;
        String consulta = "insert into registro.inscrito_eventos " + " (id_evento, documento, nombres, mail, telefono,correoempre,area, ciudadempre,empresa,otrovin,secuencia, fechains) " + " values ( ?, ?, ?,  ?, ?, ?, ?,  ?,  ?, ? ,?, getdate() ) ";
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    //Verifica si el estudiante se inscribio en campus day
    public Vector esCampusDay(String per, String idinsc) {
        ArrayList<String> params = new ArrayList<String>(1);

        params.add(per);
        params.add(idinsc);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select * from registro.pginscrip where per=? and doc in (select CD.doc from registro.inscritos_campusday CD) and idinsc=?");
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    
    //listado de eventos externos campo publico=3
    public Vector EventosExternos(String per) {
        ArrayList<String> params = new ArrayList<String>(1);

        params.add(per);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select  descripcion,  convert(varchar(10),fecha_ini, 103), convert(varchar(10),fecha_fin, 103),convert(varchar(10),fec_evento, 103), lugar,cupo_max, horario, detalle, id_evento, cupo_max  "
                + " from registro.eventos"
                + " where estado = 2 and publico= 3 and  per_acad=? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    //validar si ya esta inscrito a el evento

    public Vector ValidaGestion(String doc) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(doc);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select  documento "
                + " from registro.inscrito_eventos"
                + " where id_evento = '21' and documento= ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);

        } catch (Exception ex) {

            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector ValidaExternos(String doc, String idevento) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idevento);
        params.add(doc);

        String consulta = new String();
        Vector retorno = new Vector();

        consulta = new String("select  documento, mail, secuencia "
                + " from registro.inscrito_eventos"
                + " where id_evento = ? and documento= ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector ConsultaClave(String doc, String idevento) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idevento);
        params.add(doc);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select  documento, nombres, apellido1, apellido2, secuencia "
                + " from registro.inscrito_eventos"
                + " where id_evento = ? and documento= ? ");
        try {

            conectarBD();
            retorno = consultar(consulta, 5, 0, params);


        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector InscritosGestion(String doc) {

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select  documento, nombres, apellido1, apellido2 "
                + " from registro.inscrito_eventos"
                + " where id_evento = '21' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 4, 0);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector ValidaCurso(String idevento) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idevento);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select  descripcion, cupo_max "
                + " from registro.eventos"
                + " where id_evento = ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //validar si hay cupos para el evento
    public Vector CuposGestion() {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select  count(*) "
                + " from registro.inscrito_eventos"
                + " where id_evento = '21' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //validar si hay cupos para el evento EXTERNO
    public Vector CuposExternos(String ideven) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(ideven);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select  count(*) "
                + " from registro.inscrito_eventos"
                + " where id_evento = ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int clasificacion(String idEst, String niveles, PrintWriter out) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(niveles);
        params.add(idEst);
        String consulta = new String("update registro.estudiante"
                + " set nivelicfes =?  "
                + " where id_est = ? ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //actualizar el fac_cor a 0 cuando el estudiante se postula a beca Julio G. A.
    public int becas(String idEst, PrintWriter out) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);
        String consulta = new String("update registro.estudiante"
                + " set fac_cor ='0'  "
                + " where id_est = ? ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consulta para mostrar el cod_plan en la rta de admitido
    public Vector Planestud(String docEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);

        String consulta = new String();
        Vector retorno = new Vector();

        consulta = new String(" select  REGISTRO.ESTUDIANTE.ID_PLAN, COD_PLAN  "
                + " from REGISTRO.ESTUDIANTE, REGISTRO.PLAN_ESTUD "
                + " where doc_est = ? and  REGISTRO.ESTUDIANTE.ID_PLAN=REGISTRO.PLAN_ESTUD.ID_PLAN");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0, params);
        } catch (Exception ex) {

            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consulta para mostrar los puntajes de corte para el periodo en que presento el icfes
    public Vector baseicfes(String pericfes, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);

        params.add(pericfes);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select  per, matpb,matpa, lenpb,lenpa,filpb,filpa,fispb,fispa, quipb,quipa, socpb,socpa "
                + " from registro.registro.baseicfes "
                + " where per= ?  ");
        //   out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 13, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //admitidos posgrado
    public Vector AdmitidosPos(String docEst, String plan, String periodo, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(3);
        params.add(docEst);
        params.add(plan);
        params.add(periodo);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select  id_est, nom_est, id_plan, estado, doc, semnv "
                + " from registro.registro.estudiante "
                + " where doc_est = ? and id_plan = ? and tip_est = 'P' and per_ing = ? ");
        //out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 6, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public String getProfesion(String idprof) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idprof);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select nom_pro from registro.profesiones where id_pro = ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        if (retorno.size() > 0) {
            return retorno.elementAt(0).toString();
        } else {
            return "";
        }
    }

    //Consultas para la generación del formulario impreso POSGRADO: datos personales,educación, referencias y distinciones
    public Vector ConsultaInscritoPos(String docEst, String numRef, String periodo, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(3);
        params.add(docEst);
        params.add(numRef);
        params.add(periodo);
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = new String("  select nom_est,doc_est,id_plan,lug_nac, convert(varchar(10), fec_nac, 103),dir_corr,ciu_corr,tel_corr,dir_otr,"
                + "tel_otr,emails,ulttel,univ,prog,titu,pais,desde,hasta, for_fin, num_sol, "
                + "nom_acud,tel_acud, tpgrp, obsv_act, nom_ciu, tpgrp "
                + "from registro.estudiante,registro.estudios_ant,  registro.ciudades "
                + "where registro.estudiante.id_est= registro.estudios_ant.id_est and  "
                + "registro.estudiante.doc_est= ? and registro.estudiante.refins= ? and registro.ciudades.id_ciu= registro.estudiante.lug_nac and per_ing = ?  ");

        try {
            conectarBD();
            retorno = consultar(consulta, 26, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector ExperienciaPos(String docEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select entidad,cargo,exper,jefinm, teljef "
                + " from registro.experiencia, registro.estudiante "
                + " where doc_est= ? and registro.estudiante.id_est=registro.experiencia.id_est and per_ing='" + MaximoperPos(docEst, out) + "' ");

        try {
            conectarBD();
            retorno = consultar(consulta, 5, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public String MaximoperPos(String docEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);
        String consulta = new String();
        Vector retorno = new Vector();
        
        

        consulta = new String(" select max(per_ing)  "
                + " from  registro.estudiante "
                + " where doc_est= ?  ");
        //  out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno.elementAt(0).toString();
    }
    
    //VALIDAR ULTIMO PERIODO DE ESTUDIOS PARA REINTEGRO
    public Vector MaximoperPre(String docEst) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);
        String consulta = new String();
        Vector retorno = new Vector();
             
        consulta = new String(" select substring (max(per_acad),1,4)as anno,substring (max(per_acad),6,1)as periodo   "
                + " from  registro.biblia_def "
                + " where id_est= ? and per_acad not like '%-I'  ");
        //  out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector ReferenciasPos(String docEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select nomr,entid,carr,telef  "
                + " from registro.referpos, registro.estudiante "
                + " where doc_est= ? and registro.estudiante.id_est=registro.referpos.id_est and per_ing='" + MaximoperPos(docEst, out) + "'");
        // out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 4, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector DistincionPos(String docEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = new String(" select distin, entidad, anio   "
                + " from registro.distinciones, registro.estudiante "
                + " where doc_est= ? and registro.estudiante.id_est=registro.distinciones.id_est and per_ing='"
                + MaximoperPos(docEst, out) + "' ");
        //  out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //entrevistas para posgrados y maestria
    public Vector Entrevistas(String doc, String plan, PrintWriter out, String per) {
        ArrayList<String> params = new ArrayList<String>(3);
        params.add(doc);
        params.add(plan);
        params.add(per);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est, registro.estudiante.id_plan, iddpto, convert(varchar, fec, 103), convert(varchar, fec, 108), idest, idprof, sitio, nom_prof, titu,estado "
                + " from registro.estudiante, registro.dispentrev, registro.profesor, registro.estudios_ant "
                + " where doc_est = ? and registro.estudiante.id_plan = ? and per_ing = ? and registro.estudios_ant.tit='1' and registro.estudiante.id_est = registro.dispentrev.idest "
                + " and registro.profesor.id_prof = registro.dispentrev.idprof and registro.estudiante.id_est = registro.estudios_ant.id_est ");
        try {
            conectarBD();
            retorno = consultar(consulta, 11, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Entrevistas para pregrado readmisión
  /*  public Vector EntrevistasRead(String doc, String iddpto, PrintWriter out, String per){
     String consulta = new String();
     Vector retorno = new Vector();


     consulta=new String("select nom_est, registro.estudiante.id_dpto, convert(varchar, fec, 103), convert(varchar, fec, 108), idest, idprof, sitio, nom_prof, estado, fac_cor " +
     " from registro.estudiante, registro.dispentrev, registro.profesor "  +
     " where doc_est = '"+ doc +"' and registro.estudiante.id_dpto = '"+ iddpto +"' and per_ing = '"+ per +"' and registro.estudiante.id_est = registro.dispentrev.idest " +
     " and registro.profesor.id_prof = registro.dispentrev.idprof " );

     try {
     conectarBD();
     retorno = consultar(consulta, 10, 1);
     } catch (Exception ex) {
     mensaje= new String("Unable to fetch status due to SQLException: " + ex.getMessage());
     }
     desconectarBD();
     return retorno;
     }*/
    //Entrevistas para pregrado readmision, transferencias,Becas
    public Vector Entrevistas(String doc, PrintWriter out, String per) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(doc);
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = new String("select nom_est, registro.estudiante.id_dpto, convert(varchar, fec, 106), substring(convert(varchar, fec, 108), 1,5), "
                + " idest, idprof, sitio, nom_prof, estado, fac_cor, convert(varchar, fec1, 106), substring(convert(varchar, fec1, 108),1,5),  tip_est, "
                + "(select nom_prof from registro.profesor where id_prof = idprof1) as nmprof1, sitio1 "
                + " from registro.estudiante, registro.dispentrev, registro.profesor "
                + " where doc_est = ?  "
                + " and registro.estudiante.id_est = registro.dispentrev.idest "
                + " and registro.profesor.id_prof = registro.dispentrev.idprof and registro.dispentrev.per = '2020-2' ");
        //  out.println(consulta);
        try {
            conectarBD();

            retorno = consultar(consulta, 15, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consulta para verificar fac_cor del estudiante q solicito la readmision, ya q en la tabla
    //dispentrev solo estaran los registros de quienes tengan entrevistas
    //fac_cor 1=Admitido no requiere entrevista, 0 Citado a entrevista.
    //esto se paso al contexto de estudiantes porque es pregrado
    public Vector EstadoReadmision(String docEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est, registro.estudiante.id_dpto,  estado, fac_cor, doc_est, tip_est, per_ing  "
                + " from registro.estudiante "
                + " where doc_est = ?  and estado in (-13, -22,3,6,-23, -25, -19, -20) and registro.estudiante.tip_est= 'Z ' order by fac_cor ");
        //out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Entrevistas readmisiones
    public Vector EntrevistasRead(String docEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(docEst);
        Vector retorno = new Vector();
        int retsec = 0;
        String consulta = new String();
        consulta = new String(" select registro.estudiante.nom_est, doc_est, tip_est,per_ing, fac_cor, estado,registro.estudiante.id_dpto "
                + " from registro.registro.estudiante "
                + " where doc_est = ? and registro.estudiante.tip_est= 'Z ' order by fac_cor ");
        //  out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Titulo(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = new String(" select top 1 id_est, titu "
                + " from registro.registro.estudios_ant "
                + " where id_est = ? and tit='1' ");

        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Becas(String doc, PrintWriter out, String per) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(doc);
        params.add(per);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est, doc_est,id_dpto  "
                + " from registro.estudiante "
                + " where doc_est = ?  and per_ing = ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //Consulta para generar los tutores de los estudiantes de maestria
    //AQUI VOY
    public Vector Tutores(String doc, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(doc);

        String consulta = new String();
        Vector retorno = new Vector();

        consulta = new String("select id_prof, nom_prof,doc_est, email  "
                + " from registro.profesor,registro.tutoreado,registro.estudiante "
                + " where id_prof=idprof and doc_est= ? and idest=id_est and estado <=-91 ");
        //out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 4, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector EntrevistasBecas(String doc) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(doc);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est, registro.estudiante.id_dpto, convert(varchar, fec, 106), convert(varchar, fec, 108), "
                + " idest, idprof, sitio, nom_prof, estado, fac_cor, convert(varchar, fec1, 106), convert(varchar, fec1, 108), "
                + "(select nom_prof from registro.profesor where id_prof = idprof1) as nmprof1, sitio1 "
                + " from registro.estudiante, registro.dispentrev, registro.profesor "
                + " where doc_est = ? and registro.estudiante.tip_est = 'S' "
                + " and registro.estudiante.id_est = registro.dispentrev.idest "
                + " and registro.profesor.id_prof = registro.dispentrev.idprof ");
        //out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 14, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //****************************************************
    //************* Solicitud de Readmisión *************
    public Vector getSolRead(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select fsolread, tip_est from registro.estudiante "
                + " where id_est = ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getValidaSolRead(String idEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select id_est from registro.estudiante "
                + " where estado in (-22,3,6,-23) and doc_est = ? and per_ing > '2015-2'");
        /*id_est in " +
         " (select id_est from registro.biblia_def " +
         " where per_acad > '2007' and per_acad not like '%-0' " +
         " group by id_est " +
         " having min(per_acad) = max(per_acad) and " +
         " min(per_acad) = '" + perant + "') " +
         " and estado = -22 and doc_est = '" + idEst + "' ");*/
        //  out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int setSolRead(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);
        String consulta = new String();
        int retorno = 0;
        consulta = new String("update registro.estudiante "
                + " set fsolread = getdate (), tip_est = 'Z' "
                + " where id_est = ? ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }


    /* public Vector pregrado( PrintWriter out, String per){
     String consulta = new String();
     Vector retorno = new Vector();
     consulta=new String("select per_actual, convert(varchar(10), fec_nuevos, 103), convert(varchar(10), fec_trans, 103), convert(varchar(10), fec_seg, 103),convert(varchar(10), fec_reint, 103) , convert(varchar(10), fec_becas, 103), convert(varchar(10), fec_readmi, 103),  " +
     "convert(varchar(10), entrev_readmi, 103),convert(varchar(10), entrev_trans, 103), convert(varchar(10), entrev_becas, 103), convert(varchar(10), admi_readmi, 103), convert(varchar(10),admi_becas, 103),convert(varchar(10),admi_reint, 103),papeles_nvos, " +
     "papeles_trans, papeles_seg, papeles_becas, per_ant" +
     " from registro.inspregrado "  +
     " where per_actual = '"+ per +"' " );
     //  out.println(consulta);
     try {
     conectarBD();
     retorno = consultar(consulta, 18, 0);
     } catch (Exception ex) {
     mensaje= new String("Unable to fetch status due to SQLException: " + ex.getMessage());
     }
     desconectarBD();
     return retorno;
     }*/
    public Vector pregrado(PrintWriter out, String per, String tipprog) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(per);
        params.add(tipprog);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select per_actual, convert(varchar(10), fecha_inicio, 103),   convert(varchar(10), fecha_fin, 103), tipo_est, ent_papeles , estado , resta_sol, fechahoraind  from registro.inscrito_pregrado where per_actual = ? and tipo_est= ? ";

        try {
            conectarBD();
            retorno = consultar(consulta, 8, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Cronogramas(PrintWriter out, String per, String prog) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(prog);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select estado, id_evento, per_acad, convert(varchar(10), fecinicio,103),  convert(varchar(10),fecfin,103),inscripprepa,cursosprepa, convert(varchar(10), citaentrev,103), entrev,  "
                + "examen,  convert(varchar(10), rtaadmi,103), rtaadminiv, ordenesniv, ordenesesp, pagosniv, pagosesp, induccion, firmaactaniv, "
                + "contniv, firmaactaesp, convert(varchar(10), clases,103), creditos, vlrcredito, vlrniv,vlrtotal, cohorte, preinscripcion, fecasigplan, horasalonclases, convert(varchar(10), ini_cronograma,103), convert(varchar(10), fin_cronograma,103)  "
                + "from registro.cronogramaspos "
                + "where  id_evento=? ");
        // out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 31, 0, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //usada para imprimir  los cronogramas
    public Vector CronogramasPos(PrintWriter out, String per, String prog) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(prog);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select estado, id_evento, per_acad, convert(varchar(10), fecinicio,103),  convert(varchar(10),fecfin,103),inscripprepa,cursosprepa, convert(varchar(10), citaentrev,103), entrev,  "
                + "examen,  convert(varchar(10), rtaadmi,103), rtaadminiv, ordenesniv, ordenesesp, pagosniv, pagosesp, induccion, firmaactaniv, "
                + "contniv, firmaactaesp, convert(varchar(10), clases,103), creditos, vlrcredito, vlrniv,vlrtotal, cohorte, preinscripcion, fecasigplan, horasalonclases, convert(varchar(10), ini_cronograma,103), convert(varchar(10), fin_cronograma,103),otracitaentrev,otrartaadmi  "
                + "from registro.cronogramaspos "
                + "where  id_evento=? ");
        // out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 33, 1, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector encuentropadres(PrintWriter out, String idprog) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idprog);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select id_programa,  fechasitio, grupo1,grupo2,grupo3, reclamar "
                + "from registro.reunepadres "
                + "where  id_programa= ? ");

        try {
            conectarBD();
            retorno = consultar(consulta, 6, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

//GENERAR NRO DE DOCUMENTOS PARA HACER INSERT EN REGISTRO.VERIFICA_DOC PARA EL CARGUE DE DOCUMENTOS
    public Vector Validadocum() {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select id_doc,  descripcion "
                + "from registro.docum_adm ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //GENERAR NRO DE DOCUMENTOS PARA HACER INSERT EN REGISTRO.VERIFICA_DOCPOS PARA EL CARGUE DE DOCUMENTOS
    public Vector ValidadocumPos() {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select id_doc,  descripcion "
                + "from registro.docum_admpos ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    //GENERAR NRO DE DOCUMENTOS PARA HACER INSERT EN REGISTRO.VERIFICA_DOC_DOC PARA EL CARGUE DE DOCUMENTOS
    public Vector ValidadocumDoc() {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select id_doc,  descripcion "
                + "from registro.docum_admdoc ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

//consultar datos del colegio segun el id del estudiante
    public Vector Colegio(String idEst, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = new String("select registro.estudiante.id_col, nom_col, dpto, munip "
                + " from registro.colegios, registro.estudiante "
                + " where registro.colegios.id_col=registro.estudiante.id_col and id_est= ? ");
        //   out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 4, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Homologa(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idEst);
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = new String("select idas,nta , nom_asig from registro.valtransfer, registro.asignatura "
                + " where idest= ? and idas=id_asig  ");
        //   out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //===Consultas proceso Admitidos no Matriculados==================
    public Vector InfAspirante(String doc, String per, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(doc);
        params.add(per);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_est, nom_prog, id_est, idinsc, adm_nomat  "
                + " from registro.estudiante, registro.plan_estud, registro.programas, registro.pginscrip "
                + " where doc_est = ? and per_ing = ? and estado = -60 and "
                + " ( registro.estudiante.id_plan = registro.plan_estud.id_plan ) and  "
                + " ( registro.programas.id_prog = registro.plan_estud.id_prog ) and "
                + " ( registro.estudiante.doc_est = registro.pginscrip.doc) and per = per_ing ");
        //   out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 5, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector RefPago(String doc, String per, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(doc);
        params.add(per);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select idinsc,  convert(int, vrpag) from registro.pginscrip where doc = ? and per = ? ");
        //   out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector PlanPosgrado(String idplan) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idplan);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = " select distinct idprg from registro.defcoho where idplan= ? ";
        //   out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector ProgramaPosgrado(String idprg) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idprg);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select id_dpto from registro.programas where id_prog= ? ");
        //   out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Colegios(String idcol) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idcol);
        params.add(idcol);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select nom_col, id_col from registro.colegios where ( id_col=?  or cod_dane=? ) ");
        //   out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector ListaColegios() {

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" select nom_col, id_col, munip, jornada from registro.colegios order by nom_col ");
        //   out.println(consulta);
        try {
            conectarBD();
            retorno = consultar(consulta, 4, 1);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int ActualizarEst(String idest, String peract, String perant, String ref) {
        ArrayList<String> params = new ArrayList<String>(6);
        params.add(peract);
        params.add(peract);
        params.add(peract);
        params.add(ref);
        params.add(idest);
        params.add(perant);
        int retorno = 0;
        String consulta = new String();
        consulta = new String("update registro.estudiante set per_ing = ?, per_ingreal = ?, ult_ing = ?, doc_liq = 2, adm_nomat = 'S', refins = ?  "
                + "where id_est = ? and per_ing = ? ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int ActDocum(String idest) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idest);
        int retorno = 0;
        String consulta = new String();
        consulta = new String("update registro.verifica_doc set estado = 'N', menvio = '' "
                + "  where id_est = ? and id_doc in(5, 6, 7, 8, 9) ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    public int ActFecDocum(String idest, String per) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(per);
        params.add(idest);
        int retorno = 0;
        String consulta = new String();
        consulta = new String("update registro.fecdoc_insc set fec_docliq = null, per_acad = ? "
                + "  where id_est = ? ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

        /*try {
         conectarBD();
         retorno = actualizar(consulta);
         } catch (Exception ex) {
         mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
         }
         desconectarBD();
         return retorno;*/
    }

    public int ActRefer(String idinsc, String peract) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(peract);
        params.add(idinsc);
        int retorno = 0;
        String consulta = new String();
        consulta = new String("update registro.pginscrip set per = ?, vrpag = '1' "
                + "  where idinsc = ? ");
        //return this.actualiza(consulta, params);

        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int ActReferAnt(String idinsc, String peract) {
        ArrayList<String> params = new ArrayList<String>(2);

        params.add(idinsc);
        params.add(peract);

        int retorno = 0;
        String consulta = new String();
        consulta = new String("update registro.pginscrip setvrpag = '1' "
                + "  where idinsc = ? and per = ? ");
        //return this.actualiza(consulta, params);


        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int ActEst(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);

        params.add(idEst);
        int retorno = 0;
        String consulta = new String();
        consulta = new String("update registro.estudiante set adm_nomat = 'N' "
                + "  where id_est = ? ");

        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
//===============fin proceso admitidos no matriculados

    //Examen de conocimiento consulta citación
    public Vector Examen(String doc) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(doc);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select registro.dispentrev.idest, sitio, sitio1,hor_ini,hor_fin, examen, nom_est, convert(varchar(10),fec, 103), nom_dpto, tipo_exa from registro.dispentrev, registro.estudiante, registro.departamento "
                + " where tip='C' and doc_est= ? and registro.dispentrev.idest= registro.estudiante.id_est  and registro.departamento.id_dpto= registro.dispentrev.iddpto order by hor_ini ");
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector TipoExamen(String doc) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(doc);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select registro.estudiante.idest, tipo_exa from registro.estudiante where doc_est= ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    // Consultar Estudiantes por programa para un periodo - Cartas Referencia
    public Vector InscritoProg(String prog, String per) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(prog);
        params.add(per);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " SELECT registro.estudiante.id_est, registro.estudiante.nom_est"
                + " FROM registro.estudiante, registro.plan_estud, registro.programas"
                + " WHERE ( registro.estudiante.id_plan = registro.plan_estud.id_plan ) and  "
                + " ( registro.programas.id_prog = registro.plan_estud.id_prog ) and   (  registro.programas.id_prog = ?) and per_ing = ? and (estado = -190 or estado = -185) "
                + " ORDER BY registro.estudiante.nom_est ASC ";
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1, params);
        } catch (Exception ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector InfApsPos(String idest, String per) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idest);
        params.add(per);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " SELECT  registro.estudiante.nom_est, registro.programas.nom_prog "
                + " FROM registro.estudiante, registro.plan_estud, registro.programas  "
                + " WHERE ( registro.estudiante.id_plan = registro.plan_estud.id_plan ) and  "
                + " ( registro.programas.id_prog = registro.plan_estud.id_prog ) and  "
                + " registro.estudiante.id_est = ? and per_ing = ?"
                + " ORDER BY registro.estudiante.nom_est ASC ";
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0, params);
        } catch (Exception ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector CantDoc(String idest, String per) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idest);
        params.add(per);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select  fec_docmat, fec_docliq from registro.fecdoc_insc where id_est = ? and per_acad = ? ";
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0, params);
        } catch (Exception ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public int DocumFecha(String idest, String per) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idest);
        params.add(per);

        String consulta = "insert into registro.fecdoc_insc " + " (id_est, fec_docins, fec_docmat, per_acad, fec_docliq, fec_doctransfe) "
                + " values ( ?, null, getdate(), ?, null, null ) ";
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector consultaEntrevista(String DocEst) {
        Vector retorno = new Vector();
        int retsec = 0;
        String consulta = new String();
        /*consulta = new String("select id_est, doc_est,  convert(varchar(10), fec, 103), sitio,hor_ini, estado, nom_est, num_sol, nom_acud, id_dpto " +
         " from registro.estudiante, registro.dispentrev " +
         " where doc_est='" + DocEst + "'  and registro.estudiante.id_est *= registro.dispentrev.idest ");*/
        consulta = new String("select id_est, doc_est,  convert(varchar(10), fec, 103), sitio,hor_ini, estado, nom_est, num_sol, nom_acud, id_dpto "
                + " from registro.estudiante LEFT OUTER JOIN registro.dispentrev ON registro.estudiante.id_est = registro.dispentrev.idest "
                + " where doc_est= '" + DocEst + "'  and estado='-62' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 0);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    public int ActRefer(String idest, String per, int c) {
        ArrayList<String> params = new ArrayList<String>(5);
        params.add(idest);
        params.add(per);

        int retorno = 0;
        String consulta = new String();
        if (c == 1) {
            consulta = "update registro.fecdoc_insc set fec_docmat = getdate() where id_est = ? and per_acad = ? ";
        } else if (c == 2) {
            consulta = "update registro.fecdoc_insc set fec_docliq = getdate() where id_est = ? and per_acad = ? ";
        }
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public int GuardaRef(String idest, String per, String nom, String tit, String cargo, String emp, String email, String dir, String tel, String cel, String cono, String solf,
            String otro, String hint, String hesc, String hhabla, String pracad, String motiv, String mad, String respo, String htrab, String consi, String coment) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(22);
        params.add(idest);
        params.add(per);
        params.add(nom);
        params.add(tit);
        params.add(cargo);
        params.add(emp);
        params.add(email);
        params.add(dir);
        params.add(tel);
        params.add(cel);
        params.add(cono);
        params.add(solf);
        params.add(otro);
        params.add(hint);
        params.add(hesc);
        params.add(hhabla);
        params.add(pracad);
        params.add(motiv);
        params.add(mad);
        params.add(respo);
        params.add(htrab);
        params.add(consi);
        params.add(coment);

        String consulta = "insert into registro.cartrefpos " + " (id_est, per_acad, nom_ref, fech_ref, titulo, cargo, empresa, email, dir, tel, cel, con_sol, sol_fue, otro, hint, hesc, hhabla, pracad, motiv, mad, respo, htrab, considera, comentario) "
                + " values ( ?, ?, ?, getdate(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ";
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector InfRef(String idest, String email, String per) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idest);
        params.add(email);
        params.add(per);

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select count(*) as refs from registro.cartrefpos where id_est = ? and email = ? and per_acad=? ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params);
        } catch (Exception ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
//== FIN REFERNCIAS POSGRADOS =============================================================
    
    
    // Consulta de usuario, contraseña y token icfes
     public Vector consulta_datosicfes() {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String(" Select top 1 usuario, password, token from [registro].[registro].[Icfes] ");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 0);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
     
     
  //actualiza token servicio rest en base de datos
    public int actualiza_token(String token) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(1);
        configeci.configuracion confeci = new configeci.configuracion();
        params.add(token);
        
        String consulta = new String("UPDATE registro.Icfes SET token = ? ");
        try {
            conectarBD();
            retorno = actualiza(consulta, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    /**
     * Verifica la autenticación en el Servicio Web de Consulta de valor aproximado de matricula
     * @param usuario Nombre de usuario
     * @param contrasena Contrasena
     * @return Cantidad de registros de ese usuario con la contraseña del parametro
     */
    public int loginWSValorMatri(String usuario, String contrasena){
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(usuario);
        params.add(contrasena);
        String consulta = new String("select usuario from registro.usu_SimMatri where usuario= ? and contrasena= ? ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0, params).size();
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    /**
     * Retorna el URL del homepage de admisiones del programa con el identificador de plan del parametro en la tabla registro.homepage_prog
     * @param idPlan identificador del plan del programa a consultar
     * @return 
     */
    public String getHomepagePrograma(String idPlan){
        String retorno="";
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idPlan);
        String consulta = new String("select URL_HOMEPAGE from registro.homepage_prog HOME JOIN registro.plan_estud PLA on PLA.id_prog=HOME.id_prog and PLA.id_plan= ? ");
        try {
            conectarBD();
            Vector url = consultar(consulta, 1, 0, params);
            if(!url.isEmpty()){
                retorno=url.get(0).toString();
            }
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public HashMap[] getPreUniversitarios() {
        String consulta = new String();
        consulta = new String("select A.id_plan, A.id_prog, (select nom_prog from registro.programas B where B.id_prog=A.id_prog) nom_prog from registro.plan_estud A where A.id_prog in (select id_prog from registro.programas where nom_prog like '%PREUNIVERSITARIO%') and A.act='S'");
        HashMap[] retorno = new HashMap[0];
        try {
            retorno = bd.getRegistros(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        return retorno;
    }
    
    public HashMap[] getRetoALaU() {
        String consulta = new String();
        consulta = new String("select A.id_plan, A.id_prog, (select nom_prog from registro.programas B where B.id_prog=A.id_prog) nom_prog from registro.plan_estud A where A.id_prog in (select id_prog from registro.programas where id_prog='257') and A.act='S'");
        HashMap[] retorno = new HashMap[0];
        try {
            retorno = bd.getRegistros(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        return retorno;
    }
    
    public HashMap getidProgDep(String id_plan) {
        String consulta = new String();
        consulta = new String("select PROG.id_prog id_prog, PROG.id_dpto id_dep from registro.plan_estud PLAN_ES, registro.programas PROG where PLAN_ES.id_prog=PROG.id_prog and PLAN_ES.id_plan='"+id_plan+"'");
        HashMap retorno = new HashMap();
        try {
            retorno = bd.getRegistro(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        return retorno;
    }
    
    
    
    public HashMap[] getColegios() {
        String consulta = new String();
        consulta = new String("select id_col, nom_col from registro.colegios order by nom_col");
        HashMap[] retorno = new HashMap[0];
        try {
            retorno = bd.getRegistros(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        return retorno;
    }
    
    public Integer creaRefPreuni(String secu, String periodo, String nombre_completo, String correo, String doc_est, String telefono, String tipoest, String id_plan, String celular, String ape1, String ape2, String nombre, String id_col, String tip_id_insc){
        String consulta="";
        Integer ans=0;
        consulta = new String(" insert into registro.pginscrip values (" + secu + ", '" + periodo + "', '" + nombre_completo.toUpperCase() + "', '" + correo + "', '" + doc_est + "', '" + telefono + "', getdate(), 0, NULL, '" + tipoest + "', '" + id_plan + "', NULL, '" + celular + "', '" + telefono + "', '" + ape1.toUpperCase() + "', '" + ape2.toUpperCase() + "', '" + nombre.toUpperCase() + "', NULL, NULL, NULL, '" + id_col.toUpperCase() + "' , 'N',null,null, '" + tip_id_insc + "') ");
        try {
            ans=bd.actualizar(consulta);
        } catch (ConsultaException ex) {
            Logger.getLogger(BDadmisiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ans;
    }
    
    public HashMap[] getReferenciaExistente(String periodo, String id_dpto, String doc_est) {
        String consulta = new String();
        consulta = new String("select idinsc from registro.pginscrip where per='"+periodo+"' and dpto='"+id_dpto+"' and doc='"+doc_est+"'");
        HashMap[] retorno = new HashMap[0];
        try {
            retorno = bd.getRegistros(consulta);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        return retorno;
    }
    
    public Integer creaEstudiantePreuni(String secu_est, String doc_est, String nombre_completo, String id_dep, String id_plan, String tip_doc, String numsol, String obsv_act, String periodo, String id_col, String fecha_nac, String ciudad_nac, String direccion,
            String telefono, String ciudad, String nombre_acu, String parentesco, String dir_acu, String tel_acu, String correo, String doc_acu, String celular, String barrio, String nombres, String ape1, String ape2, String cor_acu, String secu, String lug_exp, String genero, String est_civ, String cel_acu, String base_liq){
        String consulta="";
        Integer ans=0;
        consulta = "insert into registro.estudiante (id_est, doc_est, nom_est, id_dpto, id_plan, tip_doc,  completo, estado, sem_est, can_mat,sum_est,tip_bach, "
                    + "num_sol,fec_insc, obsv_act, per_ing,  id_col,fec_nac, lug_nac, dir_corr, tel_corr, ciu_corr, "
                    + "fech_ing, nom_acud, par_acud, dir_acud, tel_acud, nom_otr, fec_ins, email_otro, docacu, ingsdo, celular,barrio,nombres, ape1, ape2,  per_ingreal, pgcole, email_acud, tip_est, docorg, refins, lug_exp, sexo, est_civ, tel_otr, base_liq, liq_est, bas_pru)";
        String valores = " values(" + secu_est + ",'" + doc_est + "','" + nombre_completo.toUpperCase() + "'," + id_dep + "," + id_plan + ", '" + tip_doc + "', 0,-79,1,0, 0,NULL, '" + numsol + "', getdate(), '" + obsv_act + "' ,'" + periodo + "','" + id_col + "',  '"
                    + fecha_nac + "'," + ciudad_nac + ", '" + direccion + "', " + telefono + ",'" + ciudad + "', getdate(),'" + nombre_acu + "','" + parentesco + "','"
                    + dir_acu + "','" + tel_acu + "','', getdate(),'" + correo.toUpperCase() + "','" + doc_acu + "',NULL,'" + celular + "', '" + barrio + "', '"
                    + nombres.toUpperCase() + "', '" + ape1.toUpperCase() + "', '" + ape2.toUpperCase() + "', '" + periodo + "', NULL, '" + cor_acu + "', 'S', '" + doc_est + "','"+secu+"','"+lug_exp+"','"+genero+"','"+est_civ+"','"+cel_acu+"','"+base_liq+"','"+base_liq+"','"+base_liq+"')";
        consulta=consulta+valores;
        
        String mensaje = "";
        try {
            ans=bd.actualizar(consulta);
            mensaje="ok-" + numsol + "-" + nombre_completo.toUpperCase() + "-" + id_plan + "-" + correo.toUpperCase()+"-"+celular;
        } catch (ConsultaException ex) {
            Logger.getLogger(BDadmisiones.class.getName()).log(Level.SEVERE, null, ex);
            mensaje="ERROR-"+ ex.getMessage().replace("'", "*") + "-" +doc_est+ "-" + numsol + "-" + nombre_completo.toUpperCase() + "-" + id_plan + "-" + correo.toUpperCase()+"-"+celular;
        }
        try {
            bd.actualizar("insert into registro.logadmitidos (idlog, texto,fecha) values ('2', '" + mensaje.replace("'", "*") + " * " + consulta.replace("'", "*") + "',getdate()) ");
        } catch (ConsultaException ex) {
            Logger.getLogger(BDadmisiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ans;
    }
}
