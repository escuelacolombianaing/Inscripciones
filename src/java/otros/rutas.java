/*
 * rutas.java
 *
 * Created on 11 de julio de 2007, 10:25 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package otros;

import java.io.File;

/**
 *
 * @author Administrador
 */
public class rutas {
    
    /** Creates a new instance of rutas */
    public rutas() {
    }
    
    public String valruta(){
        String ruta;
        // ruta = new String("C:/Sun/AppServer/config/");
         ruta = new String("/usr/local/SUN/config/");
         File arc = new File(ruta);
         if(!arc.exists()){
             ruta = new String("C:/Sun/AppServer/config/");
         }
        return ruta;
    }
    public String valrutaicfes(){
        String ruta;
        // ruta = new String("C:/Sun/AppServer/config/");
         ruta = new String("/home/shares/icfes/");
         File arc = new File(ruta);
         if(!arc.exists()){
             ruta = new String("C:/Sun/shares/icfes/");
         }
        return ruta;
    }
    
    
    public String tokenruta(){
        String truta;
     //   truta = new String("\\");
        truta = new String("/");
        return truta;
    }
}

