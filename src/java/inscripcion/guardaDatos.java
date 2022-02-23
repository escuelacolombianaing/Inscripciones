/*
 * guardaDatos.java
 *
 * Created on 27 de marzo de 2007, 11:46 AM
 *
 * To change this template, choose Tools | Template Manager
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
import utiles.Correo;

public class guardaDatos {

    private String programa;
    private String cadena1 = new String("");
    private String cadena = "campo";
    private String dia, mes;
    private String arreglo[] = new String[180];
    private String tipdoc;
    private String doc;
    private String ref;
    private String numreg;
    private String docicfes;
    private String medio;
    private String idEst;
    private String ptotal;
    private String nomuni;
    private String ciuproc;
    private String estado;
    private String apellidos;
    private String nom;
    private String celular;
    private String egresado;
    private String simultaneo;
    private String celularp;
    private String celularm;
    private String ape1;
    private String ape2;
    private String nom_est;
    private String hermano;
    private String docher;
    private String interes;
    private String ingresosm;
    private String ingresosp;
    private String ingresos3;
    private String antiguedadm;
    private String antiguedadp;
    private String correom;
    private String correop;
    private String valicfes;
    private String pilo;
    private String tipo_exa;
    private String pension;
    private String baseliq;
    private String baspru;
    private String totaling, emailacud, uplan;
    private String faccor = "null";
    private int ingresosma, ingresospa, total, ingresostercero, matult, smin = 877;
    private float pA, pB, pC, pD, mat1, mat2, matdef, tmp, rango, sdomin, liminter, max1, max2, max3, max4;
    private float minima = (float) 4500;
    private float auto = (float) 1;
    private float min = (float) 4.7;
    private Integer matdefint;
    
    String mat, fis, len, ciencsoc, filos, quim, biol;

    /**
     * Creates a new instance of guardaDatos
     */
    public guardaDatos() {
    }

    public guardaDatos(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            response.setContentType("text/html;charset=UTF-8");

            PrintWriter out = response.getWriter();
            HttpSession sesion;
            rango = 200;
            sdomin = 4500;
            liminter = 30;
            max1 = 5500;
            max2 = 7100;
            //max3 = 7700;
            max3 = 10900;
            max4 = 8950;

            int i = 1;
            while (i <= 102) {
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
            pension = request.getParameter("pension2");
            tipdoc = request.getParameter("tipdoc");
            doc = request.getParameter("doc_est");
            ref = request.getParameter("ref");
            numreg = request.getParameter("numreg");
            docicfes = request.getParameter("docicfes");
            estado = request.getParameter("estado");
            celular = request.getParameter("celular");
            egresado = request.getParameter("egresado");
            simultaneo = request.getParameter("simultaneo");
            celularp = request.getParameter("celularp");
            celularm = request.getParameter("celularm");
            nom_est = request.getParameter("nombres").trim();
            //.toString().trim()
            ape1 = request.getParameter("ape1").trim();
            //.trim()
            ape2 = request.getParameter("ape2").trim();
            //.trim()
            docher = request.getParameter("docher");
            valicfes = request.getParameter("valicfes");
            hermano = request.getParameter("hermano");
            interes = request.getParameter("interes");
            ingresosm = request.getParameter("ingresosm2");
            ingresosp = request.getParameter("ingresosp2");
            ingresos3 = request.getParameter("ingresosotro");
            correom = request.getParameter("correom");
            correop = request.getParameter("correop");
            antiguedadp = request.getParameter("antiguedadp");
            antiguedadm = request.getParameter("antiguedadm");
            emailacud = request.getParameter("emailacud");
            uplan = request.getParameter("uplan");
            pilo = request.getParameter("pilo");
            tipo_exa = request.getParameter("conoci");
            
            BDadmisiones bdpilo=new BDadmisiones();
            if(bdpilo.esGeneracionE(doc, programa, ref).size()>0){
                pilo="N";
            }
            
            pension = (pension==null)?"":pension.trim();
            doc = (doc==null)?"":doc.trim();
            numreg = (numreg==null)?"":numreg.trim();
            ingresosm = (ingresosm==null)?"":ingresosm.trim();
                    
            String [] cadenas = valicfes.split(";");
            
            for(int kl = 0; kl < cadenas.length; kl++){
            
               String [] temp = cadenas[kl].split("-");
               if(temp[0].equals("74") ) {mat       = temp[1];}
               if(temp[0].equals("44") ) {fis       = temp[1];}
               if(temp[0].equals("71") ) {len       = temp[1];}
               if(temp[0].equals("9")  ) {ciencsoc  = temp[1];}
               if(temp[0].equals("43") ) {filos     = temp[1];}
               if(temp[0].equals("100")) {quim      = temp[1];}
               if(temp[0].equals("7")  ) {biol      = temp[1];}
               if(temp[0].equals("8")  ) {fis       = temp[1]; biol = temp[1]; quim = temp[1];}
               if(temp[0].equals("69") ) {len       = temp[1]; filos = temp[1];}
               if(temp[0].equals("103")) {ciencsoc  = temp[1];}
            }
            
            
            if (pilo.equals("null")) {
                pilo = "N";
            }


            if (ingresosm.equals("null") || ingresosm.equals("")) {
                ingresosm = "0";
            }
            if (ingresosp.equals("null") || ingresosp.equals("")) {
                ingresosp = "0";
            }

            if (ingresos3.equals("null") || ingresos3.equals("")) {
                ingresos3 = "0";
            }

            ingresospa = Integer.parseInt(ingresosp) * 12; 
            ingresosma = Integer.parseInt(ingresosm) * 12;
            ingresostercero = Integer.parseInt(ingresos3) * 12;
            total = (ingresospa + ingresosma + ingresostercero) / 1000;
            if (total <= 0) {
                response.sendRedirect("Erroringresos");

            } else {
                if (programa.equals("18") || programa.equals("19")) {
                    pA = (float) 5.8;
                    pB = (float) 1.015;
                    pC = (float) 5.2;
                    pD = (float) 0.01;
                } else if (programa.equals("20")) {
                    pA = (float) 4.0;
                    pB = (float) 1.015;
                    pC = (float) 4.5;
                    pD = (float) 0.008;
                } else {
                    //Ojo, este cambio se implemento en 2019-1
                    min= (float) 4.73;
                    pA = (float) 8.2;
                    pB = (float) 1.15;
                    pC = (float) 7.2;
                    pD = (float) 0.01225;
                }
                // double pgeduc= Double.valueOf(pension)
                //pasamos el valor de la pension a tipo double para realizar la operacion
                // float pension = float.parse(pgeduc);
                float pgeduc = Float.parseFloat(pension);
                //   valueOf(pension).floatValue();
                pgeduc = (pgeduc * auto / (smin * 1000));
                float ting = total;
                ting = (ting * auto / smin);

                mat1 = (float) (min + (pA * Math.atan(pB * pgeduc))) * smin;
                mat2 = (float) (min + (pC * Math.atan(pD * ting))) * smin;

                matdef = Math.max(mat1, mat2);
                int matd = (int) matdef;
                float nvomatd = matd;
                float matde = (nvomatd / 1000);
                //
                int ent = (int) matde;
                float nvoent = ent;
                float res = (matde - nvoent);
                float mul = (res * 10);
                int ult = (int) mul;

                if (ult == 0) {
                    ult = 1;
                } else if (ult == 1) {
                    ult = 1;
                } else if (ult == 2) {
                    ult = 3;
                } else if (ult == 3) {
                    ult = 3;

                } else if (ult == 4) {
                    ult = 5;

                } else if (ult == 5) {
                    ult = 5;
                } else if (ult == 6) {
                    ult = 7;

                } else if (ult == 7) {
                    ult = 7;

                } else if (ult == 8) {
                    ult = 9;

                } else if (ult == 9) {
                    ult = 9;

                }
                int definit = ((ent * 1000) + (ult * 100));
//            matult = Math.round(matdef / rango) * (int) rango;
                //matdef = matult;
                matdef = Math.max(minima, definit);

                /*          tmp = (matdef * 100 / rango) % 100;
                 if (tmp >= liminter) {
                 matdef = (matdef / rango) + 1;
                 matdef = (int) Math.floor(matdef);
                 } else {
                 matdef = (matdef / rango);
                 matdef = (int) Math.floor(matdef);
                 }

                 matdef = (matdef * rango);*/

                //Evaluamos programas para máximas
                //matdef = matdef * auto;
                if (programa.equals("20") && matdef > max1) {
                    matdef = max1;
                } else if ((programa.equals("18") || programa.equals("19")) && (matdef > max2)) {
                    matdef = max2;
                } else if (matdef > max3) {
                    matdef = max3;
                }
                matdef = matdef * 1000;

                matdefint=Math.round(matdef);
                /**
                if(bdpilo.esGeneracionE(doc, programa, ref).size()>0){
                    matdefint=-33333333;
                }
                * */
                
                //Este if es para asignar valores de matrícula para los aspirantes de generacion E
                if(bdpilo.esGeneracionE(doc, programa, ref).size()>0){
                    //matdefint
                    //Caso matematicas
                    if (programa.equals("20")) {
                        matdefint = ((int) max1)*1000;
                    }//Caso Administracion y Economia
                    else if ((programa.equals("18") || programa.equals("19"))) {
                        matdefint = ((int) max2)*1000;
                    }//Caso Biomedica
                    else if (programa.equals("262")) {
                        matdefint = ((int) max3)*1000;
                    }//Caso otras ingenierias
                    else{
                        matdefint = ((int) max4)*1000;
                    }

                }
                System.out.println(matdefint);
//out.println(matdef);
                if (estado.equals("null")) {
                    
                    //estado = new String("-83");
                    estado = new String("-80");
                } else {
                    estado = estado;
                }
                //TRANSFERENCIAS
                if (request.getParameter("ptotal") == null) {
                    ptotal = new String("0");
                } else {
                    ptotal = new String(request.getParameter("ptotal"));
                }
                if (request.getParameter("uproc") == null) {
                    nomuni = new String("0");
                } else {
                    nomuni = new String(request.getParameter("uproc"));
                }
                medio = new String(request.getParameter("medio"));
                dia = "01";
                //request.getParameter("dia");
                //  mes = request.getParameter("mes");
            }

        } catch (Exception e) {
            Correo correo = new Correo();
            correo.enviar("GuardaDatos corregido", e.getMessage());
        }
    }

    public String guardaEstudiante(String tipoest) {
        String actualiza, consulta, valores, sec, numsol, carrera = "", mensaje = new String("Error, Faltan Datos");
        configeci.configuracion confeci = new configeci.configuracion();
        BDadmisiones bd = new BDadmisiones();
        int verif = bd.getExiste(doc, confeci.getPeriodo(), programa), nro;
        if (verif < 0) {
            return "Ha ocurrido un problema de conexión con la base de datos";
        } else if (verif > 0 && (!tipoest.equals("S"))) {
            return "Usted ya diligenció el formulario, si desea imprimirlo hágalo a través de la opción Imprimir<br>"
                    + "del menu de inscripciones";
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

            if (programa.equals("262")) {
                carrera = "B";
            }

            if (programa.equals("264")) {
                carrera = "T";
            }

            /*  if (tipoest.equals("S")){
             numsol = bd.sigSecuencia("NUM_SOLICITUD") ;
             numsol=(numsol+3000);
             numsol = tipoest+numsol+carrera;
             }else*/
            numsol = bd.sigSecuencia("NUM_SOLICITUD");
            Vector valorpago = bd.ValoresPiloPaga(programa);
            String valorPP = valorpago.elementAt(0).toString();

            if (programa.equals("262") && !pilo.equals("S")) {
                baseliq = "10900000";
                baspru = "10900000";
                matdefint= 10900000;
                estado = "-80";

            } else if (pilo.equals("S") && !tipoest.equals("T")) {
                baseliq = valorPP;
                baspru = valorPP;
                
               //matdefint= null;
            } else {
                baseliq = null;
                baspru= null;
            }
            
            
            BDadmisiones bdpilo=new BDadmisiones();
            
            //Este if es para asignar valores de matrícula para los aspirantes de generacion E
            if(bdpilo.esGeneracionE(doc, programa, ref).size()>0){
                //matdefint
                //Caso matematicas
                if (programa.equals("20")) {
                    matdefint = ((int) max1)*1000;
                }//Caso Administracion y Economia
                else if ((programa.equals("18") || programa.equals("19"))) {
                    matdefint = ((int) max2)*1000;
                }//Caso Biomedica
                else if (programa.equals("262")) {
                    matdefint = ((int) max3)*1000;
                }//Caso otras ingenierias
                else{
                    matdefint = ((int) max4)*1000;
                }
                baseliq = matdefint.toString();
                baspru= matdefint.toString();
            }

            if (tipoest.equals("T")) {
                tipo_exa = "N";
                estado = "-81";
            }
            if (tipoest.equals("S")) {
                nro = Integer.parseInt(numsol);
                nro = nro + 4000;
                numsol = tipoest + nro + carrera;
                faccor = "2";

            } else {

                numsol = tipoest + numsol + carrera;
            }
            String pagocol = "", fecha_nac = "", libreta = "", distrito = "", pagouniv = "";
            String texto[] = new String[2000];
            int res_cons = 0;
            //PrintWriter out = response.getWriter();
            String direccion = (String) arreglo[13] + " " + "$" + (String) arreglo[15];
            String diracud = (String) arreglo[40] + " " + "$" + (String) arreglo[42];
            /*   if (arreglo[26].equals("")){
             pagocol="0";
             }else{
             pagocol = (String)arreglo[26];
             }
             if (arreglo[29].equals("")){
             pagouniv="0";
             }else{
             pagouniv = (String)arreglo[29];
             }*/
            if (arreglo[6].equals("No")) {
                libreta = "0";
                distrito = "0";
            } else {
                libreta = (String) arreglo[7];
                distrito = (String) arreglo[8];
            }

            //   String fecuniv=  (String) dia +"-"+ (String) mes+"-"+(String) arreglo[27];
            fecha_nac = (String) arreglo[1] + "-" + (String) arreglo[2] + "-" + (String) arreglo[3];
            String fec_gra = (String) arreglo[20] + "-" + (String) arreglo[19] + "-" + "01";
            String nombre = (String) ape1 + " " + (String) ape2 + " " + (String) nom_est;
            if (nombre.length() > 40) {
                nombre = nombre.substring(0, 39); //mat, fis, len, ciencsoc, filos, quim, biol;
            }
            //   nombre= nombre.substring(0,40);
            //Se actualiza el registro del estudiante
            consulta = "insert into registro.estudiante (id_est, doc_est, nom_est, id_dpto, id_plan, tip_doc, completo, estado, sem_est, "
                    + "can_mat, sum_est, nro_snp, tip_est, num_sol, ing_ant, fec_insc, obsv_act, refins, ar_mat, ar_cie, ar_len, ar_soc, ar_biol, ar_social, ar_ele, maxmatnv, "
                    + "sexo, per_ing, ult_ing, id_col, est_civ, fec_nac, lug_nac, nro_libr, nro_distr, dir_corr, tel_corr, ciu_corr, "
                    + "fech_ing, fec_grado, val_icfes, vive_act, tip_viv, "
                    + "maxima, estrato, nom_acud, par_acud, dir_acud, tel_acud, nom_otr, dir_otr, tel_otr, fec_ins, email_otro, docacu, pun_icfes, nom_uni, celular, padre_egre, nombres, ape1, ape2, interes_acad, fac_cor, per_ingreal, pago_col, ing_padre, ing_madre, ing_tercero, ting, liq_est, pgcole, email_acud, pais_nacimiento, docorg, pilopaga, tipo_exa, base_liq,  id_col_otro)";
            valores = " values(" + sec + ",'" + doc + "','" + nombre.toUpperCase() + "'," + programa + "," + uplan + ", '" + tipdoc + "',0,'" + estado + "', 1,0,0,'"
                    + numreg.toUpperCase() + "','" + tipoest + "','" + numsol + "','N',getdate(), '" + docicfes + "' ," + ref + ",'"+mat+"', '"+fis+"', '"+len+"', '"+filos+"','"+biol+"','"+ciencsoc+"', '"+quim+"','" + medio + "', '"
                    + arreglo[10] + "','" + confeci.getPeriodo() + "', '" + confeci.getPeriodo() + "', " + arreglo[18] + ",'" + arreglo[11] + "','" + fecha_nac + "','" + arreglo[4] + "','" + libreta + "', '"
                    + distrito + "','" + direccion.toUpperCase() + "','" + arreglo[16] + "','" + arreglo[14] + "',getdate(),'" + fec_gra + "','" + arreglo[21] + "','"
                    + arreglo[22] + "','" + arreglo[30] + "', '"
                    + arreglo[101] + "','" + arreglo[35] + "','" + arreglo[38].toUpperCase() + "','" + arreglo[37] + "','" + diracud.toUpperCase() + "', '"
                    + arreglo[41] + "','" + arreglo[43].toUpperCase() + "','" + arreglo[44].toUpperCase() + "','" + arreglo[45] + "',getdate(),'" + arreglo[17] + "','" + arreglo[39] + "', '" + ptotal + "', "
                    + "" + nomuni + ", '" + celular + "' , '" + egresado + "', '" + nom_est.toUpperCase() + "', '" + ape1.toUpperCase() + "', '" + ape2.toUpperCase() + "', '" + interes + "', " + faccor + ","
                    + " '" + confeci.getPeriodo() + "', '" + pension + "', '" + ingresosp + "', '" + ingresosm + "', '" + ingresos3 + "', '" + total + "', '" + matdefint + "', '" + pension + "', '" + emailacud + "', '" + arreglo[5] + "', '" + doc + "', '" + pilo + "', '" + tipo_exa + "',  " + baseliq + ",  " + arreglo[102] + ")";
            consulta = consulta + valores;
            this.idEst = sec;
            //if(!numsol.equals("") && !nombre_est.equals("") && !programa.equals("") && !arreglo[38].equals("")){
            res_cons = bd.actualiza(consulta);
            /*}else{
             res_cons = 0;
             }*/
            if (res_cons > 0) {
                if(bd.esGeneracionE(doc, programa, ref).size()>0){
                    String nuevoGenE="update registro.inscritos_generacion_e set id_est='"+sec+"' where idinsc='"+ref+"' and documento='"+doc+"'";
                    bd.actualiza(nuevoGenE);
                }
                mensaje = "ok-" + numsol + "-" + nombre.toUpperCase() + "-" + programa + "-" + arreglo[38].toUpperCase() + "-" + (int) matdefint;
            } else {
                mensaje = new String("Error en Inserción-- " + bd.getMensajeBD());
            }
            consulta = "insert into registro.logadmitidos (idlog, texto,fecha) values ('2', '" + bd.getMensajeBD().replace("'", "*") + " * " + consulta.replace("'", "*") + "',getdate()) ";
            int rescons2 = bd.actualiza(consulta);
            return mensaje;
        }
    }

    public String creaHerm() {
        String secher, mensaje = new String(""), herma;
        int res_cons = 0, j, ban = 0, rescons = 0;
        BDadmisiones bd = new BDadmisiones();
        herma = (String) arreglo[46];
        if (!herma.equals("")) {
            ban = 1;
        } else {
            ban = 0;
        }
        j = 46;
        if (ban == 1) {
            while (j < 50) {
                secher = bd.sigSecuencia("HERMANOS");
                if (!(arreglo[j].equals(""))) {
                    //se crea hermano
                    String consultar = "insert into registro.hermanos values (" + secher + "," + idEst + ",'" + arreglo[j].toUpperCase() + "','','','', '', '" + arreglo[j + 1].toUpperCase() + "')";
                    rescons = bd.actualiza(consultar);
                    // mensaje=mensaje + consultar + "--" ;
                }
                j = j + 2;
            }
        } else {
            rescons = 1;
        }

        if (rescons > 0) {

            herma = hermano;
            if (!herma.equals("")) {
                ban = 1;
            } else {
                ban = 0;
            }
            secher = bd.sigSecuencia("HERMANOS");
            rescons = 1;
            if (ban == 1) {
                if (simultaneo.equals("S")) {
                    secher = bd.sigSecuencia("HERMANOS");
                    String consultar = "insert into registro.hermanos values (" + secher + "," + idEst + ",'" + herma.toUpperCase() + "','','','','" + simultaneo + "', '" + docher + "')";
                    rescons = bd.actualiza(consultar);
                }
            }

            if (rescons >= 0) {
                mensaje = "ok";
            } else {
                mensaje = new String("Error en Inserción " + bd.getMensajeBD());
            }
        } else {
            mensaje = new String("Error en Inserción " + bd.getMensajeBD());
        }
        return mensaje;
    }

    public String creaDocumen() {
        String secher, mensaje = new String(""), herma;
        int res_cons = 0, j, ban = 0, rescons = 0;
        BDadmisiones bd = new BDadmisiones();
        Vector datos = bd.Validadocum();
        int tam = datos.size();
        for (int i = 1; i <= tam; i++) {
            String consultar = "insert into registro.verifica_doc values (" + idEst + ",'" + i + "','N','', '')";
            rescons = bd.actualiza(consultar);
        }

        if (rescons >= 0) {
            mensaje = "ok";
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
        nombre = (String) arreglo[51];
        if (!nombre.equals("")) {
            ban = 1;
        } else {
            ban = 0;
        }
        tipo = "P";
        /*    if (ingresosm.equals(" ") || ingresosm == null )
         ingresosm = new String("0");*/

        if (ingresosp.equals("")) {
            ingresosp = new String("0");
        }

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
            dirres = (String) arreglo[53] + " " + "$" + (String) arreglo[55];
            diracti = (String) arreglo[62] + " " + "$" + (String) arreglo[64];
            dirres = dirres.replace("'", "");
            diracti = diracti.replace("'", "");
            consulta = "insert into registro.responsable (id_res, id_est, tip_res, nom_res, vive_res, dir_res, tel_res, edu_res, "
                    + "entidad,carg_res,tipo_empr,anti_acti, dir_acti,tel_acti,id_pro,ciu_tra,lug_res,pariente,cual_par,ren_liq,ingreso,  id_ocu, edad_res, celular, email) "
                    + "values (" + numres + ",'" + idEst + "','" + tipo + "','" + nombre.toUpperCase() + "','" + vive + "','" + dirres + "','" + arreglo[54] + "','" + arreglo[56] + "','"
                    + arreglo[59].toUpperCase() + "','" + arreglo[60].toUpperCase() + "','','" + antiguedadp + "', '" + diracti + "','" + arreglo[63] + "','" + arreglo[57] + "',1,1,'S','', 0, '" + ingresosp + "' ,'" + arreglo[58] + "' , '0', '" + celularp + "' , '" + correop + "')";
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
            nombre = (String) arreglo[68];
            if (!nombre.equals("")) {
                ban = 1;
            } else {
                ban = 0;
            }
            tipo = "M";
            if (ingresosm.equals("")) {
                ingresosm = new String("0");
            }
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
                dirres = (String) arreglo[70] + " " + "$" + (String) arreglo[72];
                diracti = (String) arreglo[79] + " " + "$" + (String) arreglo[81];
                dirres = dirres.replace("'", "");
                diracti = diracti.replace("'", "");
                consulta = "insert into registro.responsable (id_res, id_est, tip_res, nom_res, vive_res, dir_res, tel_res, edu_res, "
                        + "entidad,carg_res,tipo_empr,anti_acti,dir_acti,tel_acti,id_pro,ciu_tra,lug_res,pariente,cual_par,ren_liq,ingreso, id_ocu, edad_res, celular, email) "
                        + "values (" + numres + ",'" + idEst + "','" + tipo + "','" + nombre.toUpperCase() + "','" + vive + "','" + dirres + "','" + arreglo[71] + "','" + arreglo[73] + "','"
                        + arreglo[76].toUpperCase() + "','" + arreglo[77].toUpperCase() + "','','" + antiguedadm + "','" + diracti + "','" + arreglo[80] + "','" + arreglo[74] + "',1,1,'S','', 0, '" + ingresosm + "', '" + arreglo[75] + "', '0', '" + celularm + "', '" + correom + "' )";
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

    public String guardaEstudianteReing(String arregloreing[], String idEst, String ref, String ban, String ban1) {
        String consulta, carrera = "", ultdir, cadena2 = "M", actualizp, actualizm;
        String dirofp, dirpadre, dirofm, dirmadre, mensaje = new String("");
        BDadmisiones bd = new BDadmisiones();
        Vector estudiante = bd.getInfoEst(idEst);
        int rescon;
        configeci.configuracion confeci = new configeci.configuracion();

        String secuencia = (String) cadena2.concat(bd.sigSecuencia("NUM_SOLREINT"));
        if (estudiante.elementAt(7).equals("13")) {
            carrera = "C";
        }
        if (estudiante.elementAt(7).equals("14")) {
            carrera = "E";
        }
        if (estudiante.elementAt(7).equals("15")) {
            carrera = "S";
        }
        if (estudiante.elementAt(7).equals("16")) {
            carrera = "I";
        }
        if (estudiante.elementAt(7).equals("17")) {
            carrera = "L";
        }
        if (estudiante.elementAt(7).equals("18")) {
            carrera = "O";
        }
        if (estudiante.elementAt(7).equals("19")) {
            carrera = "A";
        }
        if (estudiante.elementAt(7).equals("20")) {
            carrera = "M";
        }

        if (estudiante.elementAt(7).equals("260")) {
            carrera = "K";
        }

        if (estudiante.elementAt(7).equals("264")) {
            carrera = "T";
        }
        
        if (estudiante.elementAt(7).equals("262")) {
            carrera = "B";
        }
        

        secuencia = (String) secuencia.concat(carrera);
        if (arregloreing[2].equals("")) {
            ultdir = (String) arregloreing[1];
        } else {
            ultdir = (String) arregloreing[1] + " " + "$" + arregloreing[2];
        }
        consulta = "update registro.registro.estudiante set tip_est = 'M', ult_ing = " + "'" + confeci.getPeriodo() + "', num_sol = '" + secuencia + "', ultdir = '" + ultdir.toUpperCase() + "', ulttel = " + "'" + arregloreing[3] + "', fec_ins= getdate(), tip_viv='" + arregloreing[18] + "', " + "estrato='" + arregloreing[23] + "', refins='" + ref + "' " + "where id_est= '" + idEst + "' ";
        rescon = bd.actualiza(consulta);
        if (rescon > 0) {
            if (ban.equals("1")) {
                if (arregloreing[7].equals("")) {
                    dirpadre = (String) arregloreing[5];
                } else {
                    dirpadre = (String) arregloreing[5] + " " + "$" + arregloreing[7];
                }
                if (arregloreing[10].equals("")) {
                    dirofp = (String) arregloreing[8];
                } else {
                    dirofp = (String) arregloreing[8] + " " + "$" + arregloreing[10];
                }
                actualizp = new String("update registro.responsable set dir_res='" + dirpadre.toUpperCase() + "', tel_res='" + arregloreing[6] + "', "
                        + "dir_acti ='" + dirofp.toUpperCase() + "', tel_acti= '" + arregloreing[9] + "', vive_res='" + arregloreing[4] + "' "
                        + "where id_res='" + arregloreing[30] + "' ");
                rescon = bd.actualiza(actualizp);
                if (rescon > 0) {
                    mensaje = "ok-" + secuencia;
                } else {
                    mensaje = new String("Error en Inserción**" + bd.getMensajeBD());
                }
            }
            //if (rescon>0){
            if (ban1.equals("1")) {
                if (arregloreing[14].equals("")) {
                    dirmadre = (String) arregloreing[12];
                } else {
                    dirmadre = (String) arregloreing[12] + " " + "$" + arregloreing[14];
                }
                if (arregloreing[17].equals("")) {
                    dirofm = (String) arregloreing[15];
                } else {
                    dirofm = (String) arregloreing[15] + " " + "$" + arregloreing[17];
                }
                actualizm = new String("update registro.responsable set dir_res='" + dirmadre.toUpperCase() + "', tel_res='" + arregloreing[13] + "', "
                        + "dir_acti ='" + dirofm.toUpperCase() + "', tel_acti= '" + arregloreing[16] + "', vive_res='" + arregloreing[11] + "'  "
                        + "where id_res='" + arregloreing[31] + "' ");
                rescon = bd.actualiza(actualizm);
                if (rescon > 0) {
                    mensaje = "ok-" + secuencia;
                } else {
                    mensaje = new String("Error en Inserción***" + bd.getMensajeBD());
                }
            } //}
            //else {
            //    mensaje = new String("Error en Inserción//" + bd.getMensajeBD());
            // }

        } else {
            mensaje = new String("Error en Inserción" + bd.getMensajeBD());
        }
        return mensaje;
    }

    public String guardaEstudianteReinte(String carnet, String ultdir, String ulttel) {
        String actualiz, actualizasec, anotacion, texto, mensaje = new String("");
        String cadena = "E", semi = "", carrera = "";
        BDadmisiones bd = new BDadmisiones();
        Vector estudiante = bd.getInfoEst(carnet);
        int resact, respuesta;
        configeci.configuracion confeci = new configeci.configuracion();
        String secuencia = (String) cadena.concat(bd.sigSecuencia("NUM_SOLREINT"));
        String secuenciaanot = (bd.sigSecuencia("ANOTACION_AUX"));
        if (estudiante.elementAt(7).equals("13")) {
            carrera = "C";
        }
        if (estudiante.elementAt(7).equals("14")) {
            carrera = "E";
        }
        if (estudiante.elementAt(7).equals("15")) {
            carrera = "S";
        }
        if (estudiante.elementAt(7).equals("16")) {
            carrera = "I";
        }
        if (estudiante.elementAt(7).equals("17")) {
            carrera = "L";
        }
        if (estudiante.elementAt(7).equals("18")) {
            carrera = "O";
        }
        if (estudiante.elementAt(7).equals("19")) {
            carrera = "A";
        }
        if (estudiante.elementAt(7).equals("20")) {
            carrera = "M";
        }
        if (estudiante.elementAt(7).equals("260")) {
            carrera = "K";
        }
        if (estudiante.elementAt(7).equals("264")) {
            carrera = "T";
        }

        secuencia = (String) secuencia.concat(carrera);
        ultdir = ultdir.replace("'", "");
        ulttel = ulttel.replace("'", "");
        actualiz = new String("update registro.registro.estudiante set tip_est = 'E', num_sol = '" + secuencia + "', ultdir = '" + ultdir + "', ulttel = '" + ulttel + "', fec_insc = getdate() where id_est= '" + carnet + "' ");
        resact = bd.actualiza(actualiz);

        if (resact == 0) {
            mensaje = new String("Error-" + bd.getMensajeBD());
        } else {
            mensaje = "ok-" + secuencia;
            Vector anotacionR = bd.AnotacionReint(carnet, confeci.getPeriodo());
            if (anotacionR.size() > 0) {
                mensaje = new String("Usted ya realizó el proceso de Reintegro");

            } else {
                actualiz = new String("insert into registro.anotacion_aux  values ('" + secuenciaanot + "', 'ESTUDIANTE' , '" + carnet + "', getdate(), 'REINTEGRO', 1480, 'SOL_REINTEGRO',getdate(), '" + confeci.getPeriodo() + "' ) ");
                int resanot = bd.actualiza(actualiz);
            }
        }
        
        return mensaje;
    }

    public String guardaEstudianteReadmi(String carnet, String ultdir, String ulttel, String idEst, String interes, PrintWriter out) {
        String actualiz, actualiz1, actualizasec, texto, mensaje = new String("");
        String cadena = "Z", semi = "", carrera = "";
        BDadmisiones bd = new BDadmisiones();
        Vector estudiante = bd.getInfoEst(idEst);
        int resact, respuesta;
        configeci.configuracion confeci = new configeci.configuracion();
        String secuencia = (String) cadena.concat(bd.sigSecuencia("NUM_SOLREADMI"));
        String secuenciaanot = (bd.sigSecuencia("ANOTACION_AUX"));
        if (estudiante.elementAt(7).equals("13")) {
            carrera = "C";
        }
        if (estudiante.elementAt(7).equals("14")) {
            carrera = "E";
        }
        if (estudiante.elementAt(7).equals("15")) {
            carrera = "S";
        }
        if (estudiante.elementAt(7).equals("16")) {
            carrera = "I";
        }
        if (estudiante.elementAt(7).equals("17")) {
            carrera = "L";
        }
        if (estudiante.elementAt(7).equals("18")) {
            carrera = "O";
        }
        if (estudiante.elementAt(7).equals("19")) {
            carrera = "A";
        }
        if (estudiante.elementAt(7).equals("20")) {
            carrera = "M";
        }
        if (estudiante.elementAt(7).equals("260")) {
            carrera = "K";
        }
        if (estudiante.elementAt(7).equals("264")) {
            carrera = "T";
        }
        secuencia = (String) secuencia.concat(carrera);
        ultdir = ultdir.replace("'", "");
        ulttel = ulttel.replace("'", "");
        String faccor = " ";
//estados 3 y 6 fac_cor=null  y estados -22 y -23 fac_cor=0
      /*  if (estudiante.elementAt(15).equals("3") || estudiante.elementAt(15).equals("6")) {
         faccor = "null";
         } else {
         faccor = "0";
         }*/

        actualiz = new String("update registro.registro.estudiante set tip_est = 'Z', fsolread=getdate(), num_sol = '" + secuencia + "', ultdir = '" + ultdir + "', ulttel = '" + ulttel + "', interes_acad= '" + interes + "', fec_ins=getdate(), fac_cor = '-300'  where id_est= '" + carnet + "' ");
        // out.println(actualiz);
        resact = bd.actualiza(actualiz);
        // out.println(resact);
        if (resact == 0) {
            mensaje = new String("Error-" + bd.getMensajeBD());
            //  out.println(mensaje);
        } else {
            mensaje = "ok-" + secuencia;
        }
        //FAC_COR -300 ERA EL SEM PASADO PORQ CORRIA ADMISION DIARIA??
        actualiz = new String("insert into registro.anotacion_aux  values ('" + secuenciaanot + "', 'ESTUDIANTE' , '" + carnet + "'  , getdate(), 'READMISION', 1482, 'SOL_READMISION',getdate(), '" + confeci.getPeriodo() + "' ) ");
        int resanot = bd.actualiza(actualiz);
        actualiz1 = new String("insert into registro.acompanamiento values ('" + carnet + "', '','', '" + confeci.getPeriodo() + "','')");
        int resanot1 = bd.actualiza(actualiz1);
        return mensaje;
    }
}
