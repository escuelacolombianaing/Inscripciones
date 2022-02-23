<%-- 
    Document   : DocumentosPregrado
    Created on : 13/09/2011, 02:40:18 PM
    Author     : 
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
        String docEst = request.getParameter("docEst");
        String inten = request.getParameter("inten");
        String idinsc = request.getParameter("idinsc");
        long valp = Long.parseLong((String)request.getParameter("valp"));
        long ind = Long.parseLong((String)request.getParameter("ind"));
        int ban = 0, act = 0;
        String pant = "", pact = "", idEst = "", nombre = "", prog = "", idinscant = "", ref = "";
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        configeci.configuracion confEci = new configeci.configuracion();
        //==Busco periodo anterior
        String per = confEci.getFechaN();
        //==Busco periodo actual
        String peract = confEci.getPeriodo();
        pact = peract.substring(0, 4);
        String pp = peract.substring(5, 6);
        if (pp.equals("1"))
            pp = "primer";
        else
             pp = "segundo";
        Vector consulta = bd.InfAspirante(docEst, confEci.getFechaN(), oout);
        if ((consulta.size()) > 0) {
            nombre = consulta.elementAt(0).toString();
            prog = consulta.elementAt(1).toString();
            idEst = consulta.elementAt(2).toString();
            idinscant =  consulta.elementAt(3).toString();
            }

        if (inten.equals("S")) {
             //=== Actualizar pginscrip
             if (ind == 0){ //per_ant
                 ref = idinscant ;
                 //act = bd.ActReferAnt(ref, per) ; // Se actualiza el $1 para la referencia anterior
                 act = bd.ActReferAnt(ref, peract) ; // Se actualiza el $1 para la referencia anterior
             } else {
                 ref = idinsc ;
                 act = bd.ActRefer(ref, peract) ; //Se actualiza para la nueva refencia que pidio y no tiene pago
                 //==Falta asociar el nuevo nro de referencia al estudiante
              }
            //act = bd.ActualizarEst(idEst, peract, per);
            if (act > 0){
                //=== Actualizar tabla registro.verifica_doc con id_doc (5, 6, 7, 8, 9)
                act = bd.ActDocum(idEst) ;     // Actualiza Documentos Liquidación
                act = bd.ActFecDocum(idEst, peract);  // Actualiza Fecha Doc_liquidación
                //if (act > 0){ //== quito el if porque en muchos casos el estudiante no tiene informacion en registro.fecdoc_insc que se act en la anterior
                   //== actualizo estudiante
                    act = bd.ActualizarEst(idEst, peract, per, ref);
                    if (act > 0)  ban = 1;
                   // }
            }else { response.sendRedirect("erroract");}
        }
        else { ban = 0 ;
            act = bd.ActEst(idEst);
            if (act <= 0) 
                response.sendRedirect("erroract");
        }

    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Activación Admisión Primer Semestre</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/tablas.css"/>
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Activación Admisión Primer Semestre" />
        </jsp:include>

        <%if (ban == 0) {%>
    <center>
        <table width="45%" border="0">
            <tr>
                <td>
                    <div align="left"><p>&nbsp;</p>Estimado Aspirante: <%=nombre%> </div>
                    <p> Le agradecemos por tenernos en cuenta entre sus opciones para adelantar su programa de pregrado y le deseamos éxitos en el desarrollo de su carrera profesional en la Institución que haya elegido.</p>
                    <p align="justify">Cordialmente,</p>
                     <br>
                    <p align="justify">OFICINA
                          DE ADMISIONES </p>
                          <p>&nbsp;</p>
                </td>
            </tr>
        </table>
    </center>
        <%  } else { %>
    <center>
        <table width="45%" border="0">
           <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><b>Estimado Aspirante:</b>&nbsp; <%=nombre%>
                <p align="justify">¡Bienvenido a la Escuela Colombiana de Ingeniería Julio Garavito! </p>
      <p align="justify">Teniendo en cuenta su interés de continuar con el proceso 
        de admisión al programa <%=prog%>, hemos habilitado el pago de su inscripción
        y su registro de admisión para el <%=pp%> periodo académico del <%=pact%>.</p>
                <p align="justify">Si usted es del programa de Ingeniería Biomédica consulte <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst"> DESCARGAR RECIBOS Y PAGOS </a> A partir de la siguiente semana de esta solicitud.
                    Si usted hace parte de otro programa de pregrado y no entregó los documentos completos en el periodo anterior, por favor enviarlos al correo electrónico <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co.</a>
                     
                    
                <br>Los documentos a entregar los puede consultar en el siguiente link:  <a href="https://admisiones.escuelaing.edu.co/inscripcioneslinea/ConsultaDoc" target = "_blank">ESTADO DE SUS DOCUMENTOS</a></p>
                <br>
                
                <p>Si usted entregó los documentos completos en el periodo anterior su orden de matrícula sera generada la siguiente semana a esta solicitud</p>
                <br>
  <p align="justify">Recuerde que las consultas asociadas a su proceso, puede realizarlas ingresando
      con su número de documento de identidad y el número de referencia <b><%=ref%></b> </p>
      <p align="justify">Nos alegra que haya tomado esta decisión, y esperamos poder
      contribuir en su formación personal y profesional.</p>
 <br>
<p align="justify">Cordialmente,</p>
 <br>
<p align="justify">OFICINA DE ADMISIONES</p>
</td>
            </tr>
           <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><p align="justify">&nbsp;</p></td>
            </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>

        </table>
    </center>
<%}%>
 
<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>
    </body>
</html>
