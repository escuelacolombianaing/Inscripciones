/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package configeci;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import otros.rutas;

/**
 *
 * @author andres.rojas
 */
public class configDoctorado {
    private String periodoActual;
    private String periodoAnterior;
    private String idPlan;
    private String idPrograma;
    private String msjerror;
    private String periodoSiguiente;

    
    public configDoctorado() {
        rutas ruta= new rutas();
        String FICHERO_CONFIGURACION = ruta.valruta()+"configDoct.properties";
        Properties propiedades;
        try{
            FileInputStream f= new FileInputStream(FICHERO_CONFIGURACION);
            propiedades = new Properties();
            propiedades.load(f);
            f.close();
            this.periodoActual=propiedades.getProperty("periodoActual");
            this.periodoAnterior=propiedades.getProperty("periodoAnterior");
            this.idPlan=propiedades.getProperty("idPlan");
            this.idPrograma=propiedades.getProperty("idPrograma");
            this.periodoSiguiente=propiedades.getProperty("periodoSiguiente");
        }catch(IOException e){
            this.msjerror = "ERROR: "+e.getMessage();
        }
    }

    public String getPeriodoActual() {
        return periodoActual;
    }

    public String getPeriodoAnterior() {
        return periodoAnterior;
    }

    public String getIdPlan() {
        return idPlan;
    }

    public String getIdPrograma() {
        return idPrograma;
    }
    
    public String getPeriodoSiguiente() {
        return periodoSiguiente;
    }
}
