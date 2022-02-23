/*
 * FileUpload.java
 *
 * Created on 5 de diciembre de 2006, 02:59 PM
 */
package eci.util.upload;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import eci.adjuntar;
import BDatos.BDdocumentacion;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import jcifs.smb.NtlmPasswordAuthentication;
import jcifs.smb.SmbFile;



public class FileUpload extends javax.servlet.http.HttpServlet {

    protected boolean create() throws java.lang.Exception {

        return true;
    }

    public FileUpload() {   // Constructor.
    }

    private void unhandledEvent(String methodName, java.lang.Object event) {
    }

    /**
     * destroy Method
     */
    public void destroy() {
        super.destroy();
        // TODO: implement
    }

    /**
     * doGet Method
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //doPost(request,response);
    }

    /**
     * doPost Method
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String n = "";
        String nombre = "";
        String fpath = "";
        String spath = "";
        String doc = "";
        String carnet = "";
        String estado = "";
        String nomestud = "";
        String tipocargue = "";
        String on = "";
        String ref = "";

        String msg = "Error al subir el archivo.";
        String fName = "";
//NtlmPasswordAuthentication auth = new NtlmPasswordAuthentication("",docum, pass);
      
        BDdocumentacion documentos = new BDdocumentacion();
        configeci.configuracion confEci = new configeci.configuracion();
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(1 * 1024 * 1024);

            String ubicacionArchivo = "/home/shares/doc_admin/";
             
           
           // String ubicacionArchivo = "C:/Users/andres.rojas/directorioPruebas";
            File repDir = new File(ubicacionArchivo + "/temp/");
            
            if (!repDir.exists()) repDir.mkdir();
            
            factory.setRepository(repDir);
            ServletFileUpload upload = new ServletFileUpload(factory);

            /*MultipartRequest multi = new MultipartRequest(request, finalpath, 25 * 1024 * 1024);*/

            List<FileItem> items = upload.parseRequest(request);
            //Creamos un ciclo para cada INPUT del formulario
            for (FileItem item : items) {

                //Identificamos si el INPUT es un archivo o un campo de formulario normal
                if (item.isFormField()) {

                    //Si es un campo de formulario lo obtenemos en su respectiva variable
                    if (item.getFieldName().equals("n")) {
                        n = item.getString();
                    }
                    if (item.getFieldName().equals("nombre")) {
                        nombre = item.getString();
                    }
                    if (item.getFieldName().equals("fpath")) {
                        fpath = item.getString();
                        File va = new File(fpath + "/" + n);
                        File na = new File(fpath + "/" + nombre);
                        adjuntar a = new adjuntar(fpath);
                        a.rmArchivo(nombre);
                    }
                    if (item.getFieldName().equals("spath")) {
                        spath = item.getString();
                    }
                    if (item.getFieldName().equals("doc")) {
                        doc = item.getString();
                    }
                    if (item.getFieldName().equals("carnet")) {
                        carnet = item.getString();
                    }
                    if (item.getFieldName().equals("estado")) {
                        estado = item.getString();
                    }
                    if (item.getFieldName().equals("nomestud")) {
                        nomestud = item.getString();
                    }
                    if (item.getFieldName().equals("tipocargue")) {
                        tipocargue = item.getString();
                    }
                } else {

                    //Si es un archivo nos aseguramos de que el nombre sea el que buscamos
                    if (item.getFieldName().equals("archivoupload")) {

                        //Obtenemos el nombre del archivo
                        fName = item.getName();

                        //Revisamos que exista el archivo, que sea tipo PDF, y que no pese más de 10 MB
                        if (fName.equals("") || fName == null) {
                            throw new Exception("No ha seleccionado ningun archivo.");
                        }
                        if (!fName.substring(fName.lastIndexOf('.'), fName.length()).equals(".pdf")) {
                            throw new Exception("El tipo de archivo seleccionado debe ser PDF.");
                        }
                        //if (item.getSize()>(10*1024*1024)) throw new Exception ("El peso del archivo debe ser inferior a 10 MB.");

                        //Definimos el nombre del archivo
                        String fileName = nombre;

                        //Guardamos el archivo en el servidor ESTAS DOS LINEAS SE COMENTARIZAN PARA guardar archivo de manera remota autenticardose a la carpeta
                        File file = new File(fpath, fileName);
                        item.write(file);
                        
                        
                        //GUARDAR ARCHIVO DE MANERA REMOTA
                       /* String url = "smb://10.1.0.50/tycho/" + fileName;
                        NtlmPasswordAuthentication auth = new NtlmPasswordAuthentication(null, "docum", "1docum321");
                        SmbFile dir = new SmbFile(url, auth);

                        InputStream in = item.getInputStream();
                        OutputStream outf = dir.getOutputStream();

                        int read = 0;
                        byte[] bytes = new byte[1024];

                        while ((read = in.read(bytes)) != -1) {
                                outf.write(bytes, 0, read);
                        }*/

                        //Buscamos los archivos temporales y los borramos
                        for (File fileDel : repDir.listFiles()) {
                            fileDel.delete();
                        }

                    }
                }
            }


           // boolean x = va.renameTo(na);
            Vector datos = documentos.Ducumensubidos(carnet, confEci.getPeriodo(), out);
           // out.println( nomestud );


            if ((datos.size() <= 0) && estado.equals("-78")) {
                int respuesta = documentos.subedocuminsc(carnet, confEci.getPeriodo(), out);
                response.sendRedirect("MensajeDocum?nomestud=" + nomestud);
            }
            if ((datos.size() <= 0) && (estado.equals("-83") || estado.equals("-80")|| estado.equals("-60")) && tipocargue.equals("i")) {
                int respuesta = documentos.subedocuminsc(carnet, confEci.getPeriodo(), out);
                response.sendRedirect("MensajeDocum?nomestud=" + nomestud);
            } else if ((datos.size() <= 0) && (estado.equals("-83") || estado.equals("-80")) && tipocargue.equals("f")) {
                int respuesta = documentos.subedocumliq(carnet, confEci.getPeriodo(), out);
                response.sendRedirect("MensajeDocum?nomestud=" + nomestud);
            } else if ((datos.size() <= 0) && (estado.equals("-81")) && tipocargue.equals("t")) {
                int respuesta = documentos.subedocumtransfe(carnet, confEci.getPeriodo(), out);
                response.sendRedirect("MensajeDocum?nomestud=" + nomestud);
            } else if ((datos.size() > 0) && (estado.equals("-83") || estado.equals("-80") || estado.equals("-60")) && tipocargue.equals("i")) {
                int respuesta = documentos.documinsc(carnet, confEci.getPeriodo(), out);
                response.sendRedirect("MensajeDocum?nomestud=" + nomestud);
            } else if ((datos.size() > 0) && estado.equals("-83") || estado.equals("-80") && tipocargue.equals("f")) {
                int respuesta = documentos.documliq(carnet, confEci.getPeriodo(), out);
                response.sendRedirect("MensajeDocum?nomestud=" + nomestud);
            } else if ((datos.size() > 0) && (estado.equals("-60")) && tipocargue.equals("m")) {
                int respuesta = documentos.docummat(carnet, confEci.getPeriodo(), out);
                response.sendRedirect("MensajeDocum?nomestud=" + nomestud);
            } else if ((datos.size() > 0) && (estado.equals("-60") || estado.equals("-80")) && tipocargue.equals("f")) {
                int respuesta = documentos.documliq(carnet, confEci.getPeriodo(), out);
                response.sendRedirect("MensajeDocum?nomestud=" + nomestud);
            } else if ((datos.size() > 0) && (estado.equals("-61") || estado.equals("-81")) && tipocargue.equals("t")) {
                int respuesta = documentos.documtransfe(carnet, confEci.getPeriodo(), out);
                response.sendRedirect("MensajeDocum?nomestud=" + nomestud);
            }


        } catch (Exception e) {
            response.sendRedirect("Documentacion?spath=" + spath + "&on=" + e.getMessage());
        }
    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // TODO: implement
    }
    
   

}
