/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package eci.util.upload;

/**
 *
 * @author Lucero.rodriguez
 */
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import eci.adjuntar;
import BDatos.BDdocumentacion;
import com.oreilly.servlet.MultipartRequest;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import otros.rutas;

public class FileUploadIcfes extends javax.servlet.http.HttpServlet {

    protected boolean create() throws java.lang.Exception {

        return true;
    }

    public FileUploadIcfes() {   // Constructor.
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

             //String ubicacionArchivo = "/home/shares/icfes";
             String ubicacionArchivo = new rutas().valrutaicfes();

           // String ubicacionArchivo = "C:/Sun/icfes";
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

                    } else {

                        if (item.getFieldName().equals("archivoupload")) {

                            //Obtenemos el nombre del archivo
                            fName = item.getName();

                            //Revisamos que exista el archivo, que sea tipo PDF, y que no pese más de 10 MB
                            if (fName.equals("") || fName == null) {
                                throw new Exception("No ha seleccionado ningun archivo.");
                            }
                            if (!fName.substring(fName.lastIndexOf('.'), fName.length()).equals(".txt")) {
                                throw new Exception("El tipo de archivo seleccionado debe ser txt.");
                            }
                            //if (item.getSize()>(10*1024*1024)) throw new Exception ("El peso del archivo debe ser inferior a 10 MB.");

                            //Definimos el nombre del archivo
                            String fileName = item.getName();
                            
                            //Guardamos el archivo en el servidor ESTAS DOS LINEAS SE COMENTARIZAN PARA guardar archivo de manera remota autenticardose a la carpeta
                            File file = new File(ubicacionArchivo, "icfes.txt");
                            item.write(file);

                            //Buscamos los archivos temporales y los borramos
                            for (File fileDel : repDir.listFiles()) {
                                fileDel.delete();
                            }
                        }
                    }
                }
            response.sendRedirect("masivo");

        } catch (Exception ex) {
            response.sendRedirect("carguemasivo" + ex.getMessage());
        }
    }
}
