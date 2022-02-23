/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package inscripcion;

import java.io.*;
import java.util.Enumeration;
import java.util.Vector;
import java.lang.Math;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.*;
import javax.servlet.*;
import BDatos.BDadmisiones;

public class guardaDatosArtic {

    private String programa;
    private String cadena1 = new String("");
    private String cadena = "campo";
    private String dia, mes;
    private String arreglo[] = new String[180];
    private String tipdoc;
    private String doc;
    private String profesion;
    private String celular;
    private String inmersion;
    private String celularp;
    private String celularm;
    private String ape1;
    private String ape2;
    private String nom_est;
    private String totaling, emailacud, uplan;
    private String faccor = "null";
    private String idEst;

    /** Creates a new instance of guardaDatos */
    public guardaDatosArtic() {
    }

    public guardaDatosArtic(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession sesion;

        int i = 1;
        while (i <= 43) {
            cadena1 = String.valueOf(i);
            String variable = (String) cadena.concat(cadena1);
            if (request.getParameter(variable) != null) {
                arreglo[i] = request.getParameter(variable);
            } else {
                arreglo[i] = "";
            }
            i++;
        }
        programa = request.getParameter("programa");
        inmersion = request.getParameter("inmersion");
        tipdoc = request.getParameter("tip_doc");
        doc = request.getParameter("doc_est");
        celular = request.getParameter("celular");
        celularp = request.getParameter("celularp");
        celularm = request.getParameter("celularm");
        nom_est = request.getParameter("nombres").toString();
        ape1 = request.getParameter("ape1");
        ape2 = request.getParameter("ape2");
        profesion = request.getParameter("profesion");
        uplan = request.getParameter("uplan");


        //request.getParameter("dia");
        //  mes = request.getParameter("mes");
    }

    public String guardaEstudiante(String tipoest) {
        String actualiza, consulta, valores, sec, numsol, carrera = "", mensaje = new String("Error, Faltan Datos");
        configeci.configuracion confeci = new configeci.configuracion();
        BDadmisiones bd = new BDadmisiones();
        int verif = bd.getExiste(doc, confeci.getPeriodo(), programa), nro;
        if (verif < 0) {
            return "Ha ocurrido un problema de conexión con la base de datos";
        } else if (verif > 0) {
            return "Usted ya diligenció el formulario.";
        } else {
            sec = bd.sigSecuencia("ESTUDIANTES");
            if (programa.equals("13")) {
                carrera = "C";
            }
            if (programa.equals("14")) {
                carrera = "E";
            }
            if (programa.equals("15")) {
                carrera = "S";
            }
            if (programa.equals("16")) {
                carrera = "I";
            }
            if (programa.equals("17")) {
                carrera = "L";
            }
            if (programa.equals("18")) {
                carrera = "O";
            }
            if (programa.equals("19")) {
                carrera = "A";
            }
            if (programa.equals("20")) {
                carrera = "M";
            }

            if (programa.equals("260")) {
                carrera = "K";
            }

            if (programa.equals("264")) {
                carrera = "T";
            }

            numsol = bd.sigSecuencia("NUM_SOLICITUD");
            if (tipoest.equals("S")) {
                nro = Integer.parseInt(numsol);
                nro = nro + 4000;
                numsol = tipoest + nro + carrera;
                faccor = "2";

            } else {
                //  numsol = tipoest + numsol + carrera;
                numsol = "S" + numsol + carrera;
            }
            String pagocol = "", fecha_nac = "", libreta = "", distrito = "", pagouniv = "";
            String texto[] = new String[2000];
            int res_cons = 0;
            //PrintWriter out = response.getWriter();
           
           

            //   String fecuniv=  (String) dia +"-"+ (String) mes+"-"+(String) arreglo[27];
            fecha_nac = (String) arreglo[5] + "-" + (String) arreglo[6] + "-" + (String) arreglo[7];
            String fec_gra = (String) arreglo[20] + "-" + (String) arreglo[19] + "-" + "01";
            String nombre = (String) ape1 + " " + (String) ape2 + " " + (String) nom_est;
            if (nombre.length() > 40) {
                nombre = nombre.substring(0, 39);
            }
            //   nombre= nombre.substring(0,40);
            //Se actualiza el registro del estudiante
            Vector plan = bd.VerificaPlan(programa);
            String uplan = plan.elementAt(0).toString();
            consulta = "insert into registro.estudiante (id_est, doc_est, nom_est, id_dpto, id_plan, tip_doc,  completo, estado, sem_est, can_mat,sum_est,tip_bach, "
                    + "num_sol,fec_insc, obsv_act, per_ing,  id_col,fec_nac, lug_nac, dir_corr, tel_corr, ciu_corr, "
                    + "fech_ing, nom_acud, par_acud, dir_acud, tel_acud, nom_otr, fec_ins, email_otro, docacu, ingsdo, celular,barrio,nombres, ape1, ape2,  per_ingreal, pgcole, email_acud, tip_est, docorg)";
            valores = " values(" + sec + ",'" + doc + "','" + nombre.toUpperCase() + "'," + programa + "," + uplan + ", '" + tipdoc + "', 0,-78,1,0, 0," + arreglo[2] + ", '" + numsol + "', getdate(), '" + arreglo[14] + "' ,'" + confeci.getPeriodo() + "','" + arreglo[1] + "',  '"
                    + fecha_nac + "'," + arreglo[8] + ", '" + arreglo[12] + "', " + arreglo[17] + ",'" + arreglo[15] + "', getdate(),'" + arreglo[35] + "','" + arreglo[34] + "','"
                    + arreglo[37] + "','" + arreglo[38] + "','" + arreglo[3] + "', getdate(),'" + arreglo[23].toUpperCase() + "','" + arreglo[36] + "','" + inmersion + "','" + celular + "', '" + arreglo[13] + "', '"
                    + nom_est.toUpperCase() + "', '" + ape1.toUpperCase() + "', '" + ape2.toUpperCase() + "', '" + confeci.getPeriodo() + "', '" + arreglo[4] + "', '" + arreglo[40] + "', 'S', '" + doc + "')";
            consulta = consulta + valores;
            this.idEst = sec;
            //if(!numsol.equals("") && !nombre_est.equals("") && !programa.equals("") && !arreglo[38].equals("")){
            res_cons = bd.actualiza(consulta);

            if (res_cons > 0) {
                mensaje = "ok-" + numsol + "-" + nombre.toUpperCase() + "-" + programa + "-" + arreglo[35].toUpperCase();
            } else {
                mensaje = new String("Error en Inserción-- " + bd.getMensajeBD());
            }
            consulta = "insert into registro.logadmitidos (idlog, texto,fecha) values ('2', '" + bd.getMensajeBD().replace("'", "*") + " * " + consulta.replace("'", "*") + "',getdate()) ";
            int rescons2 = bd.actualiza(consulta);
            return mensaje;
        }
    }

    public String GrabaDistinciones() {
        String mensaje = new String("");
        BDadmisiones bd = new BDadmisiones();
        int res_cons = 0;
        String insertar;
        for (int j = 41; j < 44; j++) {
            if ((!arreglo[j].equals(""))) {
                insertar = "insert into registro.distinciones values (" + idEst + ",'" + arreglo[j].toUpperCase() + "','','')";
                res_cons = bd.actualiza(insertar);
            }
        }
        if (res_cons >= 0) {
            mensaje = ("ok");
        } else {
            mensaje = new String("Error en Inserción " + bd.getMensajeBD());
        }
        return mensaje;
    }

    public String creaResp() {
        String consulta = new String(), actualiza, sec, numres, carrera = "", mensaje = new String("");
        String tipo, ingreso, renta, entidad = "", nombre, edad, vive, dirres, diracti;
        int rescons = 0, k, m, l, ban = 0, est = 0, ingre;
        int rescons2;
        BDadmisiones bd = new BDadmisiones();
        nombre = (String) arreglo[19];
        if (!nombre.equals("")) {
            ban = 1;
        } else {
            ban = 0;
        }
        tipo = "P";
        /*    if (ingresosm.equals(" ") || ingresosm == null )
        ingresosm = new String("0");*/



        numres = bd.sigSecuencia("REPONSABLES");
        /*  if (arreglo[65].equals(""))
        ingreso = "0";
        else{
        int tmpunto = arreglo[18].indexOf(".");
        if(tmpunto>0){
        ingreso = "0";
        }else{
        ingre = Integer.parseInt(arreglo[65].trim());
        ingre = ingre/1000;
        ingreso = String.valueOf(ingre);
        }
        }
         */
        edad = (String) arreglo[52];
        vive = (String) arreglo[50];

        if (ban == 1) {
            dirres = (String) arreglo[21];
            dirres = dirres.replace("'", "");
            consulta = "insert into registro.responsable (id_res, id_est, tip_res, nom_res, edad_res, vive_res,  dir_res, tel_res, "
                    + "entidad,carg_res,id_pro, otra, celular, email, id_ocu,ciu_tra, lug_res, edu_res) "
                    + "values (" + numres + ",'" + idEst + "','" + tipo + "','" + nombre.toUpperCase() + "', '0', 'S','" + dirres + "','" + arreglo[22] + "','" + arreglo[24] + "','"
                    + arreglo[25].toUpperCase() + "','" + profesion + "','" + arreglo[20] + "', '" + celularp + "' , '" + arreglo[23] + "', '0','0','0', 'X')";
            rescons = bd.actualiza(consulta);
            if (rescons == 0) {
                rescons = bd.actualiza(consulta);
            }
            consulta = "insert into registro.logadmitidos (idlog, texto,fecha) values ('1', '" + bd.getMensajeBD().replace("'", "*") + " * " + consulta.replace("'", "*") + "', getdate()) ";
            rescons2 = bd.actualiza(consulta);

        } else {
            rescons = 1;
        }
        if (rescons > 0) {
            nombre = (String) arreglo[26];
            if (!nombre.equals("")) {
                ban = 1;
            } else {
                ban = 0;
            }
            tipo = "M";

            numres = bd.sigSecuencia("REPONSABLES");
            /*  if (arreglo[82].equals(""))
            ingreso = "0";
            else{
            int tmpunt = arreglo[82].indexOf(".");
            if(tmpunt>0){
            ingreso = "0";
            }else{
            //ingreso = (String)arreglo[82];
            ingre = Integer.parseInt(arreglo[82].trim());
            ingre = ingre/1000;
            ingreso = String.valueOf(ingre);
            }
            }*/
            edad = (String) arreglo[69];
            vive = (String) arreglo[67];
            rescons = 1;
            if (ban == 1) {
                dirres = (String) arreglo[28];
                dirres = dirres.replace("'", "");
                consulta = "insert into registro.responsable (id_res, id_est, tip_res, nom_res, edad_res, vive_res,dir_res, tel_res, "
                    + "entidad,carg_res,id_pro, otra, celular, email, id_ocu,ciu_tra, lug_res, edu_res) "
                    + "values (" + numres + ",'" + idEst + "','" + tipo + "','" + nombre.toUpperCase() + "', '0', 'S', '" + dirres + "','" + arreglo[29] + "','" + arreglo[32] + "','"
                    + arreglo[33].toUpperCase() + "','" +  arreglo[31] + "','" + arreglo[27] + "', '" + celularm + "' , '" + arreglo[30] + "', '0','0','0', 'X')";
                rescons = bd.actualiza(consulta);
                if (rescons == 0) {
                    rescons = bd.actualiza(consulta);
                }
                consulta = "insert into registro.logadmitidos (idlog, texto) values ('1', '" + bd.getMensajeBD().replace("'", "*") + " * " + consulta.replace("'", "*") + "') ";
                rescons2 = bd.actualiza(consulta);
            }
            if (rescons > 0) {
                mensaje = "ok";
            } else {
                mensaje = new String("Error en Inserción 1" + bd.getMensajeBD());
            }
        } else {
            mensaje = new String("Error en Inserción 2" + bd.getMensajeBD());
        }
        return mensaje;
    }
}
