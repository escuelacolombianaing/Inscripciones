/*
 * configuracion.java
 *
 * Created on 5 de marzo de 2007, 11:14 AM
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


public class configuracion {

    private String filePath;
    private String ruta;
    private String periodo;
    private String msjfecn;
    private String msjfect;
    private String msjfecr;
    private String fecn;
    private String fect;
    private String fecr;
    private String fece;
    private String msjfecb;
    private String fecER;
    private String fecET;
    private String fecEB;
    private String valor;
    private String perant;
    private String fecz;
    private String msjfecz;
    private String fecread;
    private String fecAZ;
    private String fecAB;
    private String fecAE;
    private String fecrtabeca;
    private String fecrtat;
    private String fecrtaE;
    int tam;
    private String arreglo[] = new String[50];
    private String RutaArch;

    /** Creates a new instance of configuracion */
    public configuracion() {
        //filePath = this.getClass().getResource("\\").getPath();
        //filePath = filePath + "configEci.txt"; 
        ruta = new String("/usr/local/SUN/config/");
        File arc = new File(ruta);
        if (arc.exists()) {
            filePath = ruta + "configInsc.txt";
        } else {
            ruta = new String("C:/Sun/AppServer/config/");
            filePath = ruta + "configInsc.txt";
        }
        try {
            String thisLine;
            FileInputStream input = null;
            input = new FileInputStream(filePath);
            BufferedReader myInput = new BufferedReader(new InputStreamReader(input));
            tam = 0;
            if ((thisLine = myInput.readLine()) != null) {
                periodo = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            if ((thisLine = myInput.readLine()) != null) {
                perant = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            if ((thisLine = myInput.readLine()) != null) {
                fecn = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }
            
            if ((thisLine = myInput.readLine()) != null) {
                RutaArch = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }
            
            if ((thisLine = myInput.readLine()) != null) {
                fect = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                fecr = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }
            if ((thisLine = myInput.readLine()) != null) {
                fece = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }
            /*Inscripciones Readmitidos*/
            if ((thisLine = myInput.readLine()) != null) {
                fecz = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            /*entrevistas Readmitidos*/
            if ((thisLine = myInput.readLine()) != null) {
                fecER = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }
            /*entrevistas Transferencias*/
            if ((thisLine = myInput.readLine()) != null) {
                fecET = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            /*entrevistas Becas*/
            if ((thisLine = myInput.readLine()) != null) {
                fecEB = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }


            /*Admitidos readmision*/
            if ((thisLine = myInput.readLine()) != null) {
                fecAZ = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            /*Admitidos Becas*/
            if ((thisLine = myInput.readLine()) != null) {
                fecAB = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            /*Admitidos REINTEGRO*/
            if ((thisLine = myInput.readLine()) != null) {
                fecAE = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            if ((thisLine = myInput.readLine()) != null) {
                msjfecn = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            if ((thisLine = myInput.readLine()) != null) {
                msjfect = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            if ((thisLine = myInput.readLine()) != null) {
                msjfecr = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }
            //Fecha de entrega papeles admitidos a Becas
            if ((thisLine = myInput.readLine()) != null) {
                msjfecb = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            if ((thisLine = myInput.readLine()) != null) {
                perant = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            /*Fecha de resta de admision de quienes solicitaron readmision*/
            if ((thisLine = myInput.readLine()) != null) {
                fecread = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            /*Fecha de resta de admision de quienes solicitaron Becas*/
            if ((thisLine = myInput.readLine()) != null) {
                fecrtabeca = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

//Rta de admisión transferencias
            if ((thisLine = myInput.readLine()) != null) {
                fecrtat = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

            //Respuesta de Admisión Reintegros
            if ((thisLine = myInput.readLine()) != null) {
                fecrtaE = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }


            if ((thisLine = myInput.readLine()) != null) {
                valor = thisLine;
                arreglo[tam] = thisLine;
                tam++;
            }

        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }
            
    public String getPeriodo() {
        return this.periodo;
    }

    public String getFechaN() {
        return this.fecn;
    }

    public String getFechaT() {
        return this.fect;
    }
    
    public String getRutaCertificados(){
        return this.RutaArch;
    }

    public String getFechaR() {
        return this.fecr;
    }
    /*Entrevistas Readmitidos*/

    public String getFechaER() {
        return this.fecER;
    }

    /*Fecha de consulta de admitidos readmisión*/
    public String getFechaAZ() {
        return this.fecAZ;
    }

    /*Fecha de consulta de entrevistas postulados a Becas*/
    public String getFechaEB() {
        return this.fecEB;
    }

    /*Fecha de consulta de admitidos Becas*/
    public String getFechaAB() {
        return this.fecAB;
    }

    public String getMsjFechaN() {
        return this.msjfecn;
    }

    /*Entrevistas Transferencias*/
    public String getFechaET() {
        return this.fecET;
    }

    public String getMsjFechaT() {
        return this.msjfect;
    }

//Fecha entrega de papeles para admitidos a Becas JGA
    public String getMsjFechaB() {
        return this.msjfecb;
    }

    public String getMsjFechaR() {
        return this.msjfecr;
    }

    public String getFechaE() {
        return this.fece;
    }

    public String getValor() {
        return this.valor;
    }

    public String getperant() {
        return this.perant;
    }

    public String getFecZ() {
        return this.fecz;
    }

    public String getFecRead() {
        return this.fecread;
    }

    public String getFecRtaBeca() {
        return this.fecrtabeca;
    }

    public String getFecRtaT() {
        return this.fecrtat;
    }

    public String getFecrtaE() {
        return this.fecrtaE;
    }

    public int getTamanio() {
        return this.tam;
    }

    public String[] getTodo() {
        return this.arreglo;
    }
}
