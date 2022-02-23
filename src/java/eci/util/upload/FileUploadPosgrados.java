/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package eci.util.upload;

/**
 *
 * @author Lucero
 */

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import eci.adjuntar;
import BDatos.BDdocumentacion;
import com.oreilly.servlet.MultipartRequest;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadPosgrados extends javax.servlet.http.HttpServlet {

    protected boolean create() throws java.lang.Exception {

        return true;
    }

    public FileUploadPosgrados() {   // Constructor.
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


        BDdocumentacion documentos = new BDdocumentacion();
        configeci.configuracion confEci = new configeci.configuracion();
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(1 * 1024 * 1024);

            String ubicacionArchivo = "/home/shares/doc_admin/Posgrados";
           
            //String ubicacionArchivo = "C:/Users/andres.rojas/directorioPruebas";
            File repDir = new File(ubicacionArchivo + "/temp/");
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

                        //Guardamos el archivo en el servidor
                        File file = new File(fpath, fileName);
                        item.write(file);

                        //Buscamos los archivos temporales y los borramos
                        for (File fileDel : repDir.listFiles()) {
                            fileDel.delete();
                        }

                    }
                }
            }


           // boolean x = va.renameTo(na);
                       out.println( nomestud );


            if ((estado.equals("-185") || estado.equals("-190")) ){
                Vector cargue = documentos.Ducumensubidos(carnet, confEci.getPeriodo(), out);
                if (cargue.size()>0){
                    int respuesta = documentos.documinsc(carnet, confEci.getPeriodo(), out);
                }else {
                     int respuesta = documentos.subedocuminsc(carnet, confEci.getPeriodo(), out);
                }
//                int respuesta = documentos.subedocuminsc(carnet, confEci.getPeriodo(), out);
                response.sendRedirect("MensajeDocumPos?nomestud=" + nomestud);
            }
            

        } catch (Exception e) {
            response.sendRedirect("DocumentacionPosgrados?spath=" + spath + "&on=" + e.getMessage());
        }
    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // TODO: implement
    }
}
