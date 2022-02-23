/*
 * enviarCorreoEst.java
 *
 * Created on 12 de febrero de 2007, 09:08 AM
 */

package otros;

import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.* ;
import java.util.Properties ;
import java.awt.* ;
import java.text.*;


public class enviarCorreoEst extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet enviarCorreoEst</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet enviarCorreoEst at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");
         */
        out.close();
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion;
        sesion = request.getSession(true);
        PrintWriter out = response.getWriter();
        otros.enviarMail enviar = new otros.enviarMail();
        //  login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness)sesion.getAttribute("empleado");
        String codimpre;
        //  empleado.setPath("correo");
        //String destino = new String("e2037452");
        String Datos="";
        String apellidos = request.getParameter("apellidos");
        String nombre = request.getParameter("nombres");
        String doc=request.getParameter("doc");
        String doc2 = request.getParameter("doc2");
        String tel = request.getParameter("tel");
        String edad = request.getParameter("edad");
        String colegio = request.getParameter("colegio");
        String grado = request.getParameter("grado");
        String correo = request.getParameter("correo");
        String categoria = request.getParameter("categoria");
        otros.rutas ruta = new otros.rutas();
        String host = "smtp.escuelaing.edu.co";
        String to = "concursomecanica@escuelaing.edu.co";
        String asunto = "Concurso de Ingeniería Mecánica";
        String texto = request.getParameter("texto");
        
        String respuesta = new String();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Enviar Correo</title>");
        out.println("</head>");
        out.println("<body>");
        //SE ABRE ARCHIVO PARA LECTURA
        String arreglo[]=new String[5000];
        String texto1[]=new String[2000];
        String num = "";
        int ii=0, n=1;
        int k=0;
        
        try {
            FileReader ra = new FileReader(ruta.valruta() +  ruta.tokenruta() + "conmecanica.txt");
            BufferedReader entrada = new BufferedReader(ra);
            String s;
            while((s = entrada.readLine()) != null) {
                arreglo[ii]= s;
                ii=ii+1;
            }
            entrada.close();
            ra.close();
            
        }catch(java.io.FileNotFoundException fnfex) {
            System.out.println("Archivo no encontrado: " + fnfex);
            //  out.println(Archivo no encontrado);
        }catch(java.io.IOException ioex) { }
        
        //FIN LECTURA
        //COMPARAR CAMPOS Y GENERAR SECUENCIA
        
        String text2[] = new String[2000];
        int l, b = 0, a = 0, s = 0, con;
        String contador = "";
        for (int p=0; p<ii; p++){
            StringTokenizer st = new StringTokenizer(arreglo[p], "$");
            k=0;
            
            while (st.hasMoreTokens()) {
                texto1[k]=st.nextToken();
                
                
                if (k>0){
                    if (texto1[1].equals(doc)){
                        s = 1;
                        num = texto1[0];}
                }
                k=k+1;
            }
        }
        con = Integer.parseInt(texto1[0]);
        con = con + 1;
        contador=String.valueOf(con);
        
        
        //FIN COMPARACION-->
        //  if()
        if (s==0){
            try{
                    respuesta = enviar.enviar(to, asunto, correo, apellidos,  nombre,  doc, doc2, tel, edad, colegio, grado,categoria);
                    //out.println(respuesta);
                }catch(Exception e){
                    out.println("No se pudo enviar el correo: " + e.getMessage());
                }
                if(!respuesta.equals("ok")){
                   out.println("Ha ocurrido un error al enviar el correo.<br>Revise el si el archivo adjunto existe e intente nuevamente." );
                    //out.println("Dice"+ respuesta);
                }else{
                    eci.adjuntar lista = new eci.adjuntar("concursomecanica", "/usr/local/SUN/mecanica");
                    lista.totArchivo();
                   out.println("<b>Sus datos han sido enviados exitosamente. Cualquier información adicional comuníquese a la ext.323</b>" );
                    int t=0;
            try {
                FileWriter arch = new FileWriter(ruta.valruta() +  ruta.tokenruta() + "conmecanica.txt", true);
                BufferedWriter arch1 = new BufferedWriter(arch);
                PrintWriter entrada = new PrintWriter(arch1);
                String datos = (String)contador+"$"+(String)doc+"$"+(String)doc2+"$"+(String) apellidos.toUpperCase()+"$"+(String)nombre.toUpperCase()+"$"+(String)edad+"$"+(String)tel;
                datos = (String)datos+"$"+(String)colegio.toUpperCase()+"$"+(String)grado+" $"+(String)correo+"$"+(String)categoria+"$";
                entrada.println(datos);
                entrada.close();
                arch.close();
                arch1.close();
                t=1;
            }catch(java.io.FileNotFoundException fnfex) {
                System.out.println("Archivo no encontrado: " + fnfex);
                
                out.println("No pudo ser procesada su información");
            }
                  //  if (t==1){
               
                
           // } 
                  //  out.println("N&uacute;mero de Radicaci&oacute;n : " + contador);
                    
                }
            
            
            
       /*     if (t==1){
                 out.println("Usted ya ingresó sus datos anteriormente");
                
            } */
        }else{
              out.println("Usted ya ingresó sus datos anteriormente");
        
        }
            out.println("</body>");
            out.println("</html>");
        
    }
}