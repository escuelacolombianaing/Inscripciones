/*
 * configPosgrados.java
 *
 * Created on 4 de junio de 2007, 10:12 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package configeci;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;
import java.util.Vector;

public class configPosgrados {
    private String filePath;
    private String ruta;
    int tam;
    private String periodo;
    private String periodoant;
    private String arreglo[]=new String[50];
    private String esp316, esp267, esp313, esp24, esp282, esp263, esp309, esp324, esp320, esp285, esp329, esp290, esp291,esp292,esp293,esp294;
    
    /** Creates a new instance of configPosgrados */
    public configPosgrados() {
        ruta = new String("/usr/local/SUN/config/");
        File arc = new File(ruta);
        if (arc.exists())
            filePath = ruta + "configPosg.txt";
        else{
            ruta = new String("C:/Sun/AppServer/config/");
            filePath = ruta + "configPosg.txt";
        }
        try{
            String thisLine;
            FileInputStream input = null;
            input = new FileInputStream(filePath);
            BufferedReader myInput = new BufferedReader(new InputStreamReader(input));
            tam = 0;
            if ((thisLine = myInput.readLine()) != null) {
                periodo = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            
            if ((thisLine = myInput.readLine()) != null) {
                periodoant = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            
            if ((thisLine = myInput.readLine()) != null) {
                esp316 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                esp267 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                esp313 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                esp24 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                esp282 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                esp263 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                esp309 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                esp324 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                esp320 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                esp285 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                esp329 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            
            if ((thisLine = myInput.readLine()) != null) {
                esp290 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            
            if ((thisLine = myInput.readLine()) != null) {
                esp291= thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            
            if ((thisLine = myInput.readLine()) != null) {
                esp292 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            
            if ((thisLine = myInput.readLine()) != null) {
                esp293 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            
            
            if ((thisLine = myInput.readLine()) != null) {
                esp294 = thisLine;
                arreglo[tam]= thisLine;
                tam ++;
            }
            
        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public String getPeriodo(){
        return this.periodo;
    }
    
    
    public String[] getDesarrollo(){
        return divifechas(this.esp316, "$");
    }
    
    public String[] getDisennio(){
        return divifechas(this.esp267, "$");
    }
    
    public String[] getEconomia(){
        return divifechas(this.esp313, "$");
    }
    
    public String[] getEstructuras(){
        return divifechas(this.esp24, "$");
    }
    
    public String[] getQHSE(){
        return divifechas(this.esp282, "$");
    }
    
    public String[] getRecursos(){
        return divifechas(this.esp263, "$");
    }
    
    public String[] getSaneamiento(){
        return divifechas(this.esp309, "$");
    }
    
    public String[] getTelematica(){
        return divifechas(this.esp324, "$");
    }
    
    public String[] getFundaciones(){
        return divifechas(this.esp320, "$");
    }
    
    public String[] getPolimeros(){
        return divifechas(this.esp285, "$");
    }
    
    public String[] getProduccion(){
        return divifechas(this.esp329, "$");
    }
    
     public String[] getHidraulicos(){
        return divifechas(this.esp290, "$");
    }
     
      public String[] getEstructural(){
        return divifechas(this.esp291, "$");
    }
      
       public String[] getAmbiental(){
        return divifechas(this.esp292, "$");
    }
     
       
        public String[] getGeotecnia(){
        return divifechas(this.esp293, "$");
    }
     
     public String[] getTransito(){
        return divifechas(this.esp294, "$");
    }
     /*Periodoant se creo porque se cruzaba 2008-1 de QHSE con 2008-2 de Inscipciones de Polimeros
      *
      */
    public String getPeriodoant(){
        return this.periodoant;
    }
    
    public Vector getActivos(){
        Vector progs = new Vector();
        Vector  obj = new Vector() ;
        String tmp[] = new String[20];
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date currentTime_1 = new Date();
        String dateString = formatter.format(currentTime_1);
        ParsePosition pos = new ParsePosition(0);
        Date currentTime_2 = formatter.parse(dateString, pos);
        try {
            Date hoy = formatter.parse(dateString);
            for(int i=2; i<tam; i++){
                obj = new Vector() ;
                tmp = divifechas(this.arreglo[i], "$");
                Date fechapos = formatter.parse(tmp[0]);
                if(hoy.before(fechapos)){
                    obj.addElement(tmp[4]);
                    obj.addElement(tmp[5]);
                    progs.addElement(obj);
                }
            }
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return progs;
    }
    
    public boolean getEntrevistas(String id_prog){
        boolean resp;
        Vector  obj = new Vector() ;
        String tmp[] = new String[20];
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date currentTime_1 = new Date();
        String dateString = formatter.format(currentTime_1);
        ParsePosition pos = new ParsePosition(0);
        Date currentTime_2 = formatter.parse(dateString, pos);
        resp = false;
        try {
            Date hoy = formatter.parse(dateString);
            for(int i=2; i<tam; i++){
                tmp = divifechas(this.arreglo[i], "$");
                Date fechapos = formatter.parse(tmp[1]);
                if(hoy.before(fechapos) && tmp[4].equals(id_prog)){
                    resp = true;
                }
            }
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return resp;
    }
    
    public boolean getAdmitidos(String id_prog){
        boolean resp;
        Vector  obj = new Vector() ;
        String tmp[] = new String[20];
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date currentTime_1 = new Date();
        String dateString = formatter.format(currentTime_1);
        ParsePosition pos = new ParsePosition(0);
        Date currentTime_2 = formatter.parse(dateString, pos);
        resp = false;
        try {
            Date hoy = formatter.parse(dateString);
            for(int i=2; i<tam; i++){
                tmp = divifechas(this.arreglo[i], "$");
                Date fechapos = formatter.parse(tmp[2]);
                if(hoy.before(fechapos) && tmp[4].equals(id_prog)){
                    resp = true;
                }
            }
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return resp;
    }
    
    public boolean getNivelatorios(String id_prog){
        boolean resp;
        Vector  obj = new Vector() ;
        String tmp[] = new String[20];
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date currentTime_1 = new Date();
        String dateString = formatter.format(currentTime_1);
        ParsePosition pos = new ParsePosition(0);
        Date currentTime_2 = formatter.parse(dateString, pos);
        resp = false;
        try {
            Date hoy = formatter.parse(dateString);
            for(int i=2; i<tam; i++){
                tmp = divifechas(this.arreglo[i], "$");
                Date fechapos = formatter.parse(tmp[3]);
                if(hoy.before(fechapos) && tmp[4].equals(id_prog)){
                    resp = true;
                }
            }
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return resp;
    }
    
    
    public String[] divifechas(String cadena, String tok){
        String texto[] = new String[20];
        int k =0;
        StringTokenizer st = new StringTokenizer(cadena, tok);
        while (st.hasMoreTokens()) {
            texto[k]=st.nextToken();
            k=k+1;
        }
        return texto;
    }
}
