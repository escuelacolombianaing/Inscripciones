/*
 * guardaDatosPos.java
 *
 * Created on 19 de junio de 2007, 09:30 AM
 */

package inscripcion;

import java.util.Enumeration;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import BDatos.BDadmisiones;

/**
 *
 * @author Administrador
 * @version
 */
public class guardaDatosPos {
    
    private String promedio;
    private String cadena1 = new String("");
    private String cadena="campo";
    private String dia, mes;
    private String arreglo[] = new String[150];
    private String ape1;
    private String ape2;
    private String nom_est;
    private String numsol;
    private String doc;
    private String ref;
    private String pais;
    private String distrito;
    private String libreta;
    private String idEst;
    private String ptotal;
    private String nomuni;
    private String ciuproc;
    private String programa;
    private String nombre_est;
    private String apelli_est;
    /** Creates a new instance of guardaDatos */
    public guardaDatosPos() {
        
    }
    
    public guardaDatosPos(HttpServletRequest request) {
        
        int i=1;
        while(i <= 79 ){
            cadena1=String.valueOf(i);
            String variable=(String)cadena.concat(cadena1);
            if(request.getParameter(variable) == null)
                arreglo[i] = "";
            else
            arreglo[i] = request.getParameter(variable);
            arreglo[i] = fixString(arreglo[i].toString());
            i++;
        }
        ref = fixString(request.getParameter("ref").toString());
        pais =fixString(request.getParameter("pais").toString());
        promedio = fixString(request.getParameter("promedio").toString());
        libreta = fixString(request.getParameter("libreta").toString());
        distrito = fixString(request.getParameter("distrito").toString());
        doc = fixString(request.getParameter("campo11").toString()) ;
       // programa = new String(request.getParameter("campo1")) ;
        nom_est = fixString(request.getParameter("campo2").toString()).trim() ;
        ape1 = request.getParameter("ape1").trim() ;
        ape2 = request.getParameter("ape2").trim() ;
        // apelli_est = fixString(request.getParameter("campo3").toString()) ;
        
    }
    
    public String guardaEstudiantePos() {
        String actualiza, consulta, valores, sec, numsol, carrera = "", mensaje = new String("Error, Faltan Datos");
        configeci.configPosgrados confeci = new configeci.configPosgrados();
        BDadmisiones bd = new BDadmisiones();
        int verif = bd.getExiste(arreglo[11], confeci.getPeriodo(), arreglo[1]);
          String periodo= new String();
          if (arreglo[1].equals("370")){
               periodo =confeci.getPeriodo();
           } else{
               periodo =    confeci.getPeriodo();
           }     
            
        Vector cohorte = bd.PlanPosgrado(arreglo[1]);
        String idprog = cohorte.elementAt(0).toString();
        
        Vector prog= bd.ProgramaPosgrado(idprog);
        String depto = prog.elementAt(0).toString();
        if(verif<0)
            return "Ha ocurrido un problema de conexión con la base de datos";
        else if(verif>0){
            return "Usted ya diligencio el formulario, si desea imprimirlo hagalo a través de la opción Imprimir<br>" +
                    "del menu de inscripciones";
        }else{
            sec = bd.sigSecuencia("ESTUDIANTES") ;
            int res_cons = 0;
            numsol = bd.sigSecuencia("NUM_SOLICITUD") ;
            numsol = "P"+numsol+"P" ;
            String fecha_nac ="";
           String nombre = (String)ape1+" "+(String)ape2+" " +(String)nom_est;
            int promed = Integer.parseInt(promedio);
            //int promed = prom * 10 ;
            //  nom_est = arreglo[2] ;
            fecha_nac =(String) arreglo[5]+"-"+ (String) arreglo[6]+"-"+ (String) arreglo[7];
            // nombreestud =(String) nom_est+ "-" + (String) apelli_est;
            programa= arreglo[1];
            if ( arreglo[64].length() > 254 )
                arreglo[64] = arreglo[64].substring(0,250);
            consulta = "insert into registro.estudiante (id_est, doc_est, nom_est, id_dpto, id_plan, sexo, tip_doc, completo, estado, per_ing, ult_ing, " +
                    "sem_est, can_mat, sum_est, nro_snp, tip_est, est_civ, fec_nac, num_sol, lug_nac, nro_libr, nro_distr, dir_corr, tel_corr, ciu_corr, fech_ing, obsv_act, for_fin, fec_insc, nom_acud, " +
                    "dir_acud, tel_acud, dir_otr, tel_otr, diezpor, email_otro, ulttel, refins, ar_mat, ar_cie, ar_len, ar_soc, fec_ins, maxmatnv, tpgrp, nombres, ape1, ape2, celular, per_ingreal, docorg, pais_nacimiento)";
            valores = "values("+ sec +",'"+ arreglo[11] +"','"+ nombre.toUpperCase() +"','"+depto+"','" + arreglo[1] +"','" + arreglo[8] + "','" + arreglo[12] + "',0,'-190','" + periodo + "','" + periodo + "', 1,0,0,'','P', '"+
                    arreglo[9] +"','"+ fecha_nac +"','"+ numsol +"', '"+arreglo[4]+"', '"+libreta+"', '"+distrito+"','"+arreglo[14].toUpperCase()+"','"+arreglo[15]+"','"+arreglo[16]+"',getdate(),'"+arreglo[64] +"','"+arreglo[78]+"',getdate(),'"+arreglo[22].toUpperCase()+"', '"+
                    arreglo[23].toUpperCase()+"','"+arreglo[24]+"','"+arreglo[17].toUpperCase()+"','"+arreglo[18]+"',0,'"+arreglo[20]+"','"+arreglo[21]+"',"+ ref +",'0', '0', '0', '0', getdate(), '"+arreglo[77]+"', '"+promed+"', '" + nom_est.toUpperCase() +"', '" + ape1.toUpperCase() +"', '" + ape2.toUpperCase() +"', '"+arreglo[21]+"','" + periodo + "', '"+ arreglo[11] +"', '" + arreglo[10] + "')";
            consulta = consulta + valores;  
            res_cons = bd.actualiza(consulta);
            this.idEst = sec;
            if (res_cons > 0 )
                mensaje = "ok-" + numsol + "-" + nombre.toUpperCase() + "-" + programa ;
            
            else
                mensaje = new String("Error en Inserción - " + bd.getMensajeBD() ) ;
            return mensaje;
        }
    }
    
    public String creaDocumen() {
        String secher, mensaje = new String(""), herma;
        int res_cons = 0, j, ban = 0, rescons = 0;
        BDadmisiones bd = new BDadmisiones();
        Vector datos = bd.ValidadocumPos();
        int tam = datos.size();
        for (int i = 1; i <= tam; i++) {
            String consultar = "insert into registro.verifica_docpos values (" + idEst + ",'" + i + "','N','', '')";
            rescons = bd.actualiza(consultar);
        }

        
        if (rescons >= 0) {
            mensaje = "ok";
        } else {
            mensaje = new String("Error en Inserción " + bd.getMensajeBD());
        }

        return mensaje;
    }
    
    public String GrabaEducacion(){
        String  mensaje = new String("");
        String insertar, ident;
        BDadmisiones bd = new BDadmisiones();
        int res_cons = 0;
        String tit = "0";
        ident = idEst;
        
        for(int j=26; j<40; j=j+5){
            if (j == 26)
                tit = "1";
            else
                tit = "0";
            if((!arreglo[j].equals(""))&&(!arreglo[j+1].equals(""))&&(!arreglo[j+2].equals(""))&&(!arreglo[j+3].equals(""))&&(!arreglo[j+4].equals(""))){
                insertar = "insert into registro.estudios_ant values ("+idEst+",'"+arreglo[j+1].toUpperCase()+"','"
                        + arreglo[j+2]+"','"+arreglo[j+3]+"','"+arreglo[j].toUpperCase()+"','"+arreglo[j+4].toUpperCase()+"', '"+pais.toUpperCase()+"', '"+tit+"' )";
                res_cons = bd.actualiza(insertar);
                
                if (res_cons > 0 )
                    mensaje = "ok" ;
                else
                    mensaje = new String(" Error en Inserción " + bd.getMensajeBD() ) ;
                
            }
        }
        return mensaje;
    }
    
    public String GrabaExperiencia(){
        String  mensaje = new String("");
        BDadmisiones bd = new BDadmisiones();
        int res_cons = 0;
        String insertar;
        String desde, hasta, ident;
        desde = "01-" + arreglo[42] ;
        hasta = "01-" + arreglo[43] ;
        
        if((!arreglo[41].equals(""))&&(!arreglo[42].equals(""))&&(!arreglo[43].equals(""))&&(!arreglo[44].equals(""))&&(!arreglo[45].equals(""))&&(!arreglo[46].equals(""))&&(!arreglo[47].equals(""))){
            insertar = "insert into registro.experiencia values ("+idEst+",'"+arreglo[41].toUpperCase()+"','"
                    + arreglo[44].toUpperCase()+"','"+desde+"','"+hasta+"','"+arreglo[45]+"','"+arreglo[46].toUpperCase()+"','"+arreglo[47]+"', '','','','','')";
            res_cons =bd.actualiza(insertar);
        }
        
        if (res_cons >= 0 )
            mensaje = ("ok" );
        else
            mensaje = new String( "Error en Inserción " + bd.getMensajeBD()) ;
        
        return mensaje;
    }
    
    
    public String  GrabaDistinciones(){
        String  mensaje = new String("");
        BDadmisiones bd = new BDadmisiones();
        int res_cons = 0;
        String insertar;
        for(int j=48; j<54; j=j+3){
            if((!arreglo[j].equals(""))&&(!arreglo[j+1].equals(""))&&(!arreglo[j+2].equals(""))){
                insertar = "insert into registro.distinciones values ("+idEst+",'"+arreglo[j].toUpperCase()+"','"
                        + arreglo[j+2]+"','"+arreglo[j+1].toUpperCase()+"')";
                
                res_cons =bd.actualiza(insertar);
            }
        }
        if (res_cons >= 0 )
            mensaje = ("ok" );
        else
            mensaje = new String("Error en Inserción " + bd.getMensajeBD() ) ;
        return mensaje;
    }
    
    public String GrabaIdioma(){
        String  mensaje = new String("");
        BDadmisiones bd = new BDadmisiones();
        int res_cons = 0;
        String insertar;
        for(int j=54; j<64; j=j+5){
            if((!arreglo[j].equals(""))&&(!arreglo[j+1].equals(""))&&(!arreglo[j+2].equals(""))&&(!arreglo[j+3].equals(""))&&(!arreglo[j+4].equals(""))){
                insertar = "insert into registro.idiocand values ("+idEst+",'"+arreglo[j].toUpperCase()+"','"
                        + arreglo[j+1]+"','"+arreglo[j+2]+"','"+arreglo[j+3]+"','"+arreglo[j+4]+"')";
                res_cons =bd.actualiza(insertar);
            }
        }
        if (res_cons >= 0 )
            mensaje = ("ok" );
        else
            mensaje = new String("Error en Inserción " + bd.getMensajeBD() ) ;
        return mensaje;
    }
    
    public String GrabaReferencia(){
        String  mensaje = new String("");
        BDadmisiones bd = new BDadmisiones();
        int res_cons = 0, decsol;
        String insertar, sec, numsol;
        numsol = bd.sigSecuencia("REFERPOS") ;
        decsol=Integer.parseInt(numsol);
        
        for(int j=65; j<77; j=j+4){
            if((!arreglo[j].equals(""))&&(!arreglo[j+1].equals(""))&&(!arreglo[j+2].equals(""))&&(!arreglo[j+3].equals(""))){
                insertar = "insert into registro.referpos values ("+decsol+","+idEst+",'"+arreglo[j].toUpperCase()+"','"
                        + arreglo[j+1].toUpperCase()+"','"+arreglo[j+2].toUpperCase()+"','"+arreglo[j+3]+"')";
                res_cons =bd.actualiza(insertar);
                if (res_cons > 0 )
                    mensaje = ("ok" );
                else
                    mensaje = new String(insertar + "Error en Inserción" + bd.getMensajeBD() + idEst) ;
                
            }
            
        }
        return mensaje;
    }
    
    private String fixString(String cadenfix){
        cadenfix =  cadenfix.replace("'", "");
        return cadenfix;
    }
}
