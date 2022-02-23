<%//@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.util.Date" %>
<%@ page import="com.itextpdf.text.Document,com.itextpdf.text.Paragraph,com.itextpdf.text.pdf.PdfWriter,com.itextpdf.text.PageSize,com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.Element,com.itextpdf.text.Chunk,com.itextpdf.text.Font,com.itextpdf.text.FontFactory,com.itextpdf.text.BaseColor"%>
<!--%@ page import="com.lowagie.text.rtf.*"%-->
<!--%@ page import="certificaciones.Certificado.Certificado" %-->
<!--%@ page import="certificaciones.baseDatos.BdCertificados" %-->
<!--%@ page import="certificaciones.configuracion.configECI" %-->
<%@ page import="BDatos.BDadmisiones" %>


<%response.setHeader("Cache-Control","no-cache");
//String carnet = session.getAttribute("idest").toString();
BDadmisiones est = new BDadmisiones();
//Certificado est = new Certificado();
Vector inf = new Vector() ;
Vector cant = new Vector() ;
Vector cantref = new Vector() ;
Vector infref = new Vector() ;
String programa = "", idest, nombre = "", nref ="", titulo = "", cargo = "", empresa, email, dir, tel, cel, anos, lista, otro, hint, hesc, hhabla, pacad, motiv;
String respo, htrab, consi, text, coment, elab = "", mad = "", ref1 = "", ref2 = "", nomdoc = "", dia = "", mes = "", annio = "" ;
int c = 0, val = 0, insdato = 0, guardar = 0, cref= 0 ;

programa = request.getParameter("programa");
idest = request.getParameter("nombre");
nref = request.getParameter("nombre1");
titulo = request.getParameter("titulo");
cargo = request.getParameter("cargo");
empresa = request.getParameter("empresa");
email = request.getParameter("email");
dir = request.getParameter("direccion");
tel = request.getParameter("telefono");
cel = request.getParameter("celular");
anos = request.getParameter("anos");
lista = request.getParameter("lista");
otro = request.getParameter("otro");
hint = request.getParameter("hint");
hesc = request.getParameter("hesc");
hhabla = request.getParameter("hhabla");
pacad = request.getParameter("pacad");
motiv = request.getParameter("motiv");
mad = request.getParameter("mad");
respo = request.getParameter("respo");
htrab = request.getParameter("htrab");
consi = request.getParameter("consi");
coment = request.getParameter("textarea");
if (lista == null)
    lista = "";
if (coment == null)
    coment = "";

Calendar calend = new GregorianCalendar();
	   dia = Integer.toString(calend.get(Calendar.DATE));
	   mes = Integer.toString(calend.get(Calendar.MONTH));
	   annio = Integer.toString(calend.get(Calendar.YEAR));
//configECI cfgEci = new configECI();
configeci.configuracion cfgEci = new configeci.configuracion();
configeci.configPosgrados confEci = new configeci.configPosgrados();

inf =  est.InfApsPos(idest, confEci.getPeriodo());
if(inf.size()> 0){
    nombre = inf.elementAt(0).toString();
    programa = inf.elementAt(1).toString();
    }

//= Realizar la actualización de las fechas fec_docmat(primera ref), fec_docliq (segunda ref) de la tabla registro.fecdoc_insc
//= Se valida si ya existe registro.
cant = est.CantDoc(idest, confEci.getPeriodo());
if (cant.size() > 0){
   // c = 1;
    ref1 = cant.elementAt(0).toString();
    ref2 = cant.elementAt(1).toString();
    if (ref1.equals("null") || ref1.equals("No disponible")){ 
        nomdoc = "c1_";
        c = 1;
    }else if ((ref2.equals("null") || ref2.equals("No disponible"))&&est.InfRef(idest, email, confEci.getPeriodo()).get(0).equals("0")){ 
        nomdoc = "c2_";
        c = 2;
    }else c = 3;
 }else {
     nomdoc = "c1_";
     c = 0;
 }

//==Verifico si ya tiene la certificación que se esta enviando nuevamente
 infref = est.InfRef(idest, email, confEci.getPeriodo());
 if (infref.size() > 0){
     cref = Integer.parseInt(infref.elementAt(0).toString());
 }

String Inicio = "Inicio";
String anterior = "GenCertEstud";
      %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <title>Certificaciones y Constancias</title>
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<link href="css/comun.css" rel="stylesheet" type="text/css">
<link href="css/menu1.css" rel="stylesheet" type="text/css">

<script language="JavaScript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
  //for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='No'");
}

function openurl(Url) {
    open(Url,"_blank","menubar=no,status=no,titlebar=no,toolbar=no")
    }
//-->
</script>

    </head>

<!--<body onLoad="MM_goToURL('parent','http://localhost:8080/inscripcioneslinea/Constancia.pdf'), target = '_blank';return document.MM_returnValue"-->     
<!--body onLoad="MM_goToURL('parent','http://tycho.escuelaing.edu.co/Certificaciones/Constancia.pdf'), target = '_blank try';return document.MM_returnValue"-->
         <fieldset style="margin:auto; width:300px" onClick="MM_callJS('prueba')">
             </fieldset>
   
    <p>
      <%

int cont = 0 ;
if(idest.equals("0")){
    response.sendRedirect("ErrorRefer?id=3") ;
}else if(cref > 0){
        response.sendRedirect("ErrorRefer?id=4") ;
}else if(c < 3 ){
    //==Se valida que si el aspirante no tiene documentos cargados permite cargarlos.
    File fichero = new File(cfgEci.getRutaCertificados() +nomdoc+ idest+".pdf");
     if (fichero.exists()) {
        // if (fichero.delete())
             cont = 1 ;
        }
     else {cont = 1 ;}
     if (cont == 1) {
        //OutputStream file = new FileOutputStream(new File("C:\\Constancia.pdf"));
         ///usr/local/tomcat5.5/webapps/ROOT/
        // OutputStream file = new FileOutputStream(new File("/usr/local/tomcat5.5/webapps/ROOT/Certificados/Constancia.pdf"));
        // OutputStream file = new FileOutputStream(new File("C:/Tomcat 5.5/webapps/ROOT/Certificados/Constancia.pdf"));
         //OutputStream file = new FileOutputStream(new File(cfgEci.getRutaCertificados() + "Nuevo.pdf"));
         OutputStream file = new FileOutputStream(new File(cfgEci.getRutaCertificados() +nomdoc+ idest+".pdf"));  //Ruta:/home/shares/doc_admin/posgrado

        //Document doc = new Document(PageSize.A4, izq, der, sup, inf);
        text = "Carta de Referencia" ;    
        Document document = new Document(PageSize.A4, 70, 35, 40, 40); //inf 60
        PdfWriter.getInstance(document, file);
        document.open();
  
        Font fuenteb = new Font(Font.getFamily("ARIAL"), 10, Font.BOLD, BaseColor.BLACK); //10 pruebas 8
        Paragraph p = new Paragraph(text, fuenteb);
        p.setAlignment(Element.ALIGN_LEFT);
        document.add(p);
        document.add(new Paragraph("\n")); //para dar espacio
        text =  "Datos del solicitante" ;
        p = new Paragraph(text, fuenteb);
        document.add(p);
        document.add(new Paragraph("\n"));
        //document.add(new Paragraph("\n"+"\n"+"\n"));
        text = "Nombre del aspirante: " + nombre ;
        Font fuente = new Font(Font.getFamily("ARIAL"), 8, Font.NORMAL); //10
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_LEFT);
        document.add(p);
       // document.add(new Paragraph("\n"));
        text = "Programa del aspirante: " + programa ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
     
        text = "Periodo de ingreso: " + confEci.getPeriodo() ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        document.add(new Paragraph("\n"));

        text =  "Datos de quien referencia" ;
        p = new Paragraph(text, fuenteb);
        document.add(p);
        document.add(new Paragraph("\n"));

        text = "Nombre Completo: " + nref;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Titulo: "  + titulo ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Cargo: " + cargo;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Empresa: " + empresa;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Email: " + email;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Dirección: " + dir;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Teléfono: " + tel + " - Celular: " + cel;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        document.add(new Paragraph("\n"));

        text =  "Referencia" ;
        p = new Paragraph(text, fuenteb);
        document.add(p);
        text = "Conoce al solicitante desde hace: " + anos + " años";
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
       if(!lista.equals(""))  {
            text = "El solicitante fue: " + lista ;
            p = new Paragraph(text, fuente);
            p.setAlignment(Element.ALIGN_JUSTIFIED);
            document.add(p);
        }else{
            text = "El solicitante fue: " + otro ;
            p = new Paragraph(text, fuente);
            p.setAlignment(Element.ALIGN_JUSTIFIED);
            document.add(p);
        }
        document.add(new Paragraph("\n"));

        text =  "Considera que el solicitante tienen una" ;
        p = new Paragraph(text, fuenteb);
        document.add(p);
        text = "Habilidad intelectual: " + hint ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Habilidad para escribir: " + hesc ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Habilidad para hablar: " + hhabla ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Preparación académica: " + pacad ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Motivación: " + motiv ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Madurez: " + mad ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Responsabilidad: " + respo ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        text = "Habilidad para trabajo en equipo: " + htrab ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        document.add(new Paragraph("\n"));

        text =  "En resumen considera que este candidato es: " ;
        p = new Paragraph(text, fuenteb);
        document.add(p);
        text = consi ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
        document.add(new Paragraph("\n"));

        if(!coment.equals(""))  {
            text =  "Comentario adicional sobre el solicitante: " ;
            p = new Paragraph(text, fuenteb);
            document.add(p);
            text = coment ;
            p = new Paragraph(text, fuente);
            p.setAlignment(Element.ALIGN_JUSTIFIED);
            document.add(p);
        }
        document.add(new Paragraph("\n"));
        text = "Fecha: " + dia + "-" + mes + "-" + annio ;
        p = new Paragraph(text, fuente);
        p.setAlignment(Element.ALIGN_JUSTIFIED);
        document.add(p);
     //   document.add(new Paragraph("\n")); //ojoooo para quitar espacio

        document.close();
        file.close();

     //Se genera el registro en si no existe en tabla registro.fecdoc_insc
    if (c == 0){
        insdato = est.DocumFecha(idest,  confEci.getPeriodo());
        if (insdato == 0){
            response.sendRedirect("ErrorRefer?id=0") ;
       }
    }else if (c == 1){
        insdato = est.ActRefer(idest,  confEci.getPeriodo(), c);
        if (insdato == 0){
            response.sendRedirect("ErrorRefer?id=0") ;
       }
    } else if (c == 2){
        insdato = est.ActRefer(idest,  confEci.getPeriodo(), c);
        if (insdato == 0){
            response.sendRedirect("ErrorRefer?id=0") ;
       }
    }

  //=Se guardan los datos de la certificacion en la base de datos
  if(insdato > 0){
    guardar = est.GuardaRef(idest, confEci.getPeriodo(), nref, titulo, cargo, empresa, email, dir, tel, cel, anos, lista, otro, hint, hesc, hhabla, pacad, motiv, mad, respo, htrab, consi, coment);
    if(guardar == 0)
       response.sendRedirect("ErrorRefer?id=2") ;
  }


    } else System.out.println("El fichero no puede ser borrado");
    response.sendRedirect("CorrectoRefer?nmb=" + nombre + "") ; //==Correcto
}//== Fin if c<3
else{
    response.sendRedirect("ErrorRefer?id=1") ;
}
   %>
    </p> 
    
  <!-- <p>&nbsp; </p>
  
        <div align="center">
            <ul>
                <li><a href="<//%=ruta%>" target="_blank"><img src="img/newspaper.png" width="16" height="16" border="0"> Ver Certificado </a></li>
            </ul>
        </div>                
<br> -->


<!--<table width="767" border="0" align="center">
 <tr >
                <td colspan="3" height="6">
                    <div align="right" class="mattblacktabs">
                                <ul>
                                    <li><a href="LogOut"><img src="img/door_out.png" width="16" height="16" border="0"> Cerrar</a></li>
                                    <li><a href="<//%=anterior%>"><img src="img/arrow_left.png" width="16" height="16" border="0"> Anterior</a></li>
                                    <li><a href="<//%=Inicio%>"><img src="img/house.png" width="16" height="16" border="0"> Inicio</a></li>
                                </ul>
                            </div>
                </td>
              </tr>
 </table>
          <p align="center">Escuela Colombiana de Ingeniería Julio Garavito<br>
            AK. 45 No. 205-59 (Autopista Norte) / PBX: +57(1) 6683600 / Call center: 
            +57(1) 6683622 / A.A. 14520<br>
            Bogotá, D.C. , Colombia<br>
            &nbsp; </p>

                    </div>-->
                    <!--container-->
    </body>

</html>
    
    
    
