
<%@page import="utiles.Correo"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="BDatos.BDdocumentacion"%>
<%@ page import="java.net.Authenticator"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<% try {
        HttpSession sesion;
        configeci.configuracion confEci = new configeci.configuracion();
        PrintWriter oout = response.getWriter();
        response.setHeader("Cache-Control", "no-cache");
        BDadmisiones admision = new BDadmisiones();
        BDdocumentacion documentos = new BDdocumentacion();
        
        Vector nombres = new Vector();
        String ref = request.getParameter("ref");
        String doc = request.getParameter("doc");
       // oout.println(doc);
        eci.adjuntar adjuntar;
        String spath = "correo";
        String ruta = new String();
        String nombre = "";
        String id = new String();
        String estado = new String();
        String acta = new String();
        String tipo = new String();
        String blq = new String();
        String liq = new String();
        String baseliq = new String();
        String baspru = new String();
        String transfe = new String();
        String operacion = request.getParameter("on");
        String tipocargue = request.getParameter("tipo");
//out.println(tipocargue);
        int p = 0;
//1018416654
        if (spath.equals("p"))
            out.println("Error");
        else {
            Vector datos = documentos.ConsultaDatos(doc, confEci.getPeriodo(), oout);%>


<%if (datos.size() > 0) {
        String nro = new String();
        estado = datos.elementAt(5).toString();
        acta = datos.elementAt(6).toString();
        tipo = datos.elementAt(7).toString();
        blq = datos.elementAt(8).toString();
        liq = datos.elementAt(9).toString();
        id = datos.elementAt(0).toString();
        transfe = datos.elementAt(10).toString();
        baseliq = datos.elementAt(11).toString();
        baspru = datos.elementAt(12).toString();
        p = 1;

        //|| (liq.equals("0") && (blq.equals("1") || blq.equals("2"))))
        //VALIDAR QUE NO CARGUE MATRICULA ANTES DE CARGAR INSCRIP LIQ Y TRANSF
        int lon = datos.size();
        if (!tipo.equals("T") && (blq.equals("1") || blq.equals("2")) && (liq.equals("1") || liq.equals("2")) && tipocargue.equals("m")) {
            out.println("<CENTER><b>Usted debe cargar primero los documentos completos del proceso de inscripción y de liquidación  para poder cargar luego los documentos correspondientes al proceso de matrícula.</b></center>");
        } else if (!tipo.equals("T") && (blq.equals("0") && (liq.equals("1") || liq.equals("2")) && tipocargue.equals("m"))) {
            out.println("<CENTER><b>Usted debe cargar primero los documentos completos del proceso de inscripción y de liquidación para poder cargar luego los documentos correspondientes al proceso de matrícula.</b></center>");
        } else if (!tipo.equals("T") && (liq.equals("0") && (blq.equals("1") || blq.equals("2")) && tipocargue.equals("m"))) {
            out.println("<CENTER><b>Usted debe cargar primero los documentos completos del proceso de inscripción y de liquidación para poder cargar luego los documentos correspondientes al proceso de matrícula.</b></center>");
        } else if (lon <= 0) {
            out.println("<center><b>Usted no está autorizado para realizar este proceso o la información  no concuerda con la diligenciada, por favor verifique que haya realizado el proceso de inscripción.</b></center>");
        } else if (tipo.equals("T") && ((blq.equals("1") || blq.equals("2")) && (liq.equals("1") || liq.equals("2")) && (transfe.equals("1") || transfe.equals("2") || transfe.equals("-2")) && tipocargue.equals("m"))) {
            out.println("<CENTER><b>Usted debe cargar primero los documentos completos del proceso de inscripción, de liquidación y transferencia para poder cargar luego los documentos correspondientes al proceso de matrícula.</b></center>");
        } else if (tipo.equals("T") && (blq.equals("0") && (liq.equals("1") || liq.equals("2")) && (transfe.equals("1") || transfe.equals("2") || transfe.equals("-2")) && tipocargue.equals("m"))) {
            out.println("<CENTER><b>Usted debe cargar primero los documentos completos del proceso de inscripción , de liquidación y transferencia para poder cargar luego los documentos correspondientes al proceso de matrícula.</b></center>");
        } else if (tipo.equals("T") && (liq.equals("0") && (blq.equals("1") || blq.equals("2")) && (transfe.equals("1") || transfe.equals("2") || transfe.equals("-2")) && tipocargue.equals("m"))) {
            out.println("<CENTER><b>Usted debe cargar primero los documentos completos del proceso de inscripción, liquidación y transferencia para poder cargar luego los documentos correspondientes al proceso de matrícula.</b></center>");
        } else if (transfe.equals("0") && (blq.equals("1") || blq.equals("2")) && (liq.equals("1") || liq.equals("2")) && tipocargue.equals("m")) {
            out.println("<CENTER><b>Usted debe cargar primero los documentos completos del proceso de inscripción, de liquidación y transferencia para poder cargar luego los documentos correspondientes al proceso de matrícula.</b></center>");
        } else if (lon <= 0) {
            out.println("<center><b>Usted no está autorizado para realizar este proceso o la información  no concuerda con la diligenciada, por favor verifique que haya realizado el proceso de inscripción.</b></center>");
        } else {
            Vector cargue = documentos.impidecargue(id, oout);
            int loncargue = cargue.size();
            if (loncargue > 0) {
                for (int i = 0; i < loncargue; i++) {
                    Vector verifica = (Vector) cargue.elementAt(i);
                    if ((verifica.elementAt(2).equals("1") || verifica.elementAt(2).equals("2") || verifica.elementAt(2).equals("3") || verifica.elementAt(2).equals("4")) && (tipocargue.equals("i"))) {
                        operacion = "t";
                    } else if ((verifica.elementAt(2).equals("5") || verifica.elementAt(2).equals("6") || verifica.elementAt(2).equals("7") || verifica.elementAt(2).equals("8") || verifica.elementAt(2).equals("9")) && (tipocargue.equals("f"))) {
                        operacion = "t";
                    } else if ((verifica.elementAt(2).equals("11") || verifica.elementAt(2).equals("12")) && (tipocargue.equals("t"))) {
                        operacion = "t";
                    }
                }
            }

            if ((estado.equals("-83")|| estado.equals("-80") || estado.equals("-60") || estado.equals("-79") || estado.equals("-59") || estado.equals("-80") || estado.equals("-81")) && (tipocargue.equals("i") && (blq.equals("1") || blq.equals("2")))) {
                nombre = "d" + id + ".pdf";
            } else if ((estado.equals("-83") || estado.equals("-80")|| estado.equals("-60") || estado.equals("-79") || estado.equals("-80") || estado.equals("-81")) && (tipocargue.equals("f") && (liq.equals("1") || liq.equals("2")) && !baseliq.equals("NULL") && !baspru.equals("NULL"))) {
                nombre = "f" + id + ".pdf";
            } else if (acta.equals("No disponible") && ((estado.equals("-60") || estado.equals("-61")) && (blq.equals("0") && liq.equals("0")))) {
                nombre = "ma" + id + ".pdf";
                //se quito -79 de aqui y se dejo habilitado para q subandocumentos

            } else if ((estado.equals("-81") || estado.equals("-61")) && (tipocargue.equals("t") && (transfe.equals("1") || transfe.equals("2") || transfe.equals("-2")))) {
                nombre = "t" + id + ".pdf";
                //se quito -79 deaqui y se dejo habilitado para q subandocumentos
            } else if (estado.equals("-70")) {
                operacion = "t";
            } else if (!acta.equals("No disponible") && liq.equals("0") && blq.equals("0")) {
                // out.println("Usted no debe realizar este Proceso");
                operacion = "xxx";
            } else if (blq.equals("0") && tipocargue.equals("i")) {
                operacion = "x";
            } else if (liq.equals("0") && tipocargue.equals("f")) {
                operacion = "xx";
            } else if (transfe.equals("0") && tipocargue.equals("t")) {
                operacion = "xxxx";
            }

            String programa = "";
            //ruta = "C:/Users/andres.rojas/directorioPruebas";

           ruta = "/home/shares/doc_admin/";
            
          
            adjuntar = new eci.adjuntar("documentacion", ruta);

            if (operacion == null)
                operacion = "n";
            else {
                if (operacion.compareTo("ar") == 0) {
                    out.println("entra");
                    String[] chElim;
                    int lngCh;
                    Integer idRec;
                    chElim = request.getParameterValues("chElim");
                    lngCh = chElim.length;
                    for (int i = 0; i < lngCh; i++) {
                        if (chElim[i].compareTo("null") != 0) {
                            adjuntar.rmArchivo((String) chElim[i]);
                        }
                    }
%>

<html>
    <head>
        <meta target="principal" http-equiv="Refresh" content="0; url=Documentacion?on=n&spath=spath&doc=<%=datos.elementAt(1)%>&ref=<%=ref%>&carnet=<%=datos.elementAt(0)%>&estado=<%=datos.elementAt(5)%>&tipocargue=<%=tipocargue%>">
        <style type="text/css">
        </style>
        <link href="../estilos.css" rel="stylesheet" type="text/css">
    </head>
</html>

<%
} else {
%>
<html>
    <head>
        <title>Documentacion</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="JavaScript">

            function ValidarMod(){
            var max = document.fmArchivos.chElim.length
            var j = 0
            for ( i=0 ; i<max ; i++ ){
            if  (document.fmArchivos.chElim[i].checked == true)
            j++ ;
            }
            if ( j = 0 ){
            alert("Para modificar tiene que seleccionar un recurso")
            }else if ( j > 1 ){
            alert("Solo puede seleccionar un campo")
            }else{
            document.action = 'LA OTRA ACCION'
            document.submit()
            }
            }


            function ValidarChk(temp){
            var max = document.fmArchivos.chElim.length
            var vall = false
            for ( i=0 ; i<max ; i++ ){
            if  (document.fmArchivos.chElim[i].checked == true)
            vall =true
            }
            if(temp == 1){
            vall = true
            }
            if (vall == true)
            document.fmArchivos.submit()
            else
            alert ("Para eliminar tiene que seleccionar algun recurso")
            }

            function chkAll(){
            var max = document.fmArchivos.chElim.length
            var vall
            if (document.fmArchivos.chAll.checked == true)
            vall = true
            else
            vall = false
            for ( i=0 ; i<max ; i++ ){
            document.fmArchivos.chElim[i].checked = vall
            }
            }


            function chkUn(){
            var max = document.fmArchivos.chElim.length
            var vall = true
            if (document.fmArchivos.chAll.checked == true)
            document.fmArchivos.chAll.checked = false
            for ( i=0 ; i<max ; i++ ){
            vall = vall && document.fmArchivos.chElim[i].checked
            }
            if (vall == true)
            document.fmArchivos.chAll.checked = true
            }

            function adjuntar(){
            document.forminsc.action = "Backup";
            //window.open("", "ventanaImpreNotas", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            ///document.formulario.submit();
            }

            function validar(formulario, archivo){
            var b = archivo.split('.');
            if(b[b.length-1] == 'pdf'){
            var nomar=document.formulario.archivoupload.value;
            var x = archivo.split('\\');
            nomar=x[x.length-1];
            document.formulario.action='FileUpload';
            return true;
            }

            else{
            alert('Error: El archivo debe ser .pdf');
            return false;
            }

            }

            //-->
        </script>
    </head>
    <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
    <link href="css/comun.css" rel="stylesheet" type="text/css">

    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Cargue Documentos" />
        </jsp:include>
        <br><br>
        <div align="center">
        <table align="center" width="850" border="0" cellpadding="0" cellspacing="0" >
            <tr><td><b><center><%=datos.elementAt(2)%></center></b></td></tr>
            
            <tr>
                <td bgcolor="#FFFFFF">
                    <% if (operacion.equals("n")) {
            int i = 0;%>
                    <table width="100%" border="0" cellpadding="7" cellspacing="0" >
                        <tr>
                            <td>
                                <div align="center">
                                    <% if ((estado.equals("-83") || estado.equals("-80") || estado.equals("-60") || estado.equals("-79") || estado.equals("-81")) && (blq.equals("1") || blq.equals("2")) && tipocargue.equals("i")) {
                                            out.println("<CENTER><b>Usted debe subir el archivo pdf correspondiente a los documentos completos del proceso de INSCRIPCIÓN.  </b></center>");
                                        } else if (acta.equals("No disponible") && ((estado.equals("-60") || estado.equals("-61")) && blq.equals("0") && liq.equals("0") && transfe.equals("0") && (tipocargue.equals("m") || tipocargue.equals("f") || tipocargue.equals("i")))) {
                                            out.println("<CENTER><b>Usted debe subir el archivo pdf correspondiente a los documentos completos del proceso de MATRÍCULA. </b></center>");
                                        } else if ((estado.equals("-83") || estado.equals("-80") || estado.equals("-60") || estado.equals("-79") || estado.equals("-80") || estado.equals("-81")) && (blq.equals("1") || blq.equals("2") || blq.equals("0")) && (!liq.equals("0")) && tipocargue.equals("f") && !baseliq.equals("NULL") && !baspru.equals("NULL")) {
                                            out.println("<CENTER><b>Usted debe subir el archivo pdf correspondiente a los documentos  del proceso de LIQUIDACION. </b></center>");
                                        } else if ((estado.equals("-81") || estado.equals("-61")) && (blq.equals("1") || blq.equals("2") || blq.equals("0")) && (liq.equals("1") || liq.equals("2") || liq.equals("0")) && (!transfe.equals("0")) && tipocargue.equals("t")) {
                                            out.println("<CENTER><b>Usted debe subir el archivo pdf correspondiente a los documentos  del proceso de TRANSFERENCIA. </b></center>");
                                        } else if (acta.equals("No disponible") && (estado.equals("-70") || estado.equals("-71"))) {
                                            out.println("<CENTER><b>Usted no está autorizado para realizar este proceso.</b></center>");
                                        }/* else if ((blq.equals("1") || blq.equals("2")) && (liq.equals("1") || liq.equals("2")) && tipocargue.equals("m") ){
                                         out.println("<CENTER><b>Usted debe cargar primero los documentos completos del proceso de inscripción y de liquidación para poder cargar luego los documentos correspondientes al proceso de matrícula.</b></center>");
                         } */%>
                                </div>
                            </td>
                        </tr>
                    </table>

                    <table width="850" border="0" align="center" cellspacing="0" class="textocom">

                        <%
                            DateFormat dateFormatter = DateFormat.getDateInstance(DateFormat.MEDIUM);
                            long x = adjuntar.fecArchivo(nombre);
                            String f = "";
                            if (!(x == 0)) {
                                Date fec = new Date(adjuntar.fecArchivo(nombre));
                                f = dateFormatter.format(fec);
                            }

                        %>
                        <tr>
                            <td width="11%">
                                <div align="center">
                                    <!--    <input type="checkbox" name="chElim" onClick="chkUn()" value = "<%=adjuntar.nomArchivo(nombre)%>">-->
                                </div></td>
                            <td width="50%">
                                <div align="center"> </div>
                                <div align="center"><!%=adjuntar.nomArchivo(nombre)%> </div></td>
                            <td width="21%">
                                <div align="center"><!%=adjuntar.tamarch(nombre)%> </div></td>
                            <td width="18%">
                                <div align="center"><!%=f%></div></td>
                        </tr>
                        <%        /*  }*/
                        %>
                        <!-- <tr>
                
                                    <td width="11%" >
                                    <div align="right" class="resaltados"><strong>Tama&ntilde;o total: </strong></div></td>
                
                                    <td width="50%">
                                    <div align="center"><strong><!%=adjuntar.tamtotH()%></strong></div></td>
                
                                    <td width="21%">&nbsp;  </td>
                                    <td width="18%">&nbsp; </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <div align="center">
                                            <input type="button" name="eliminar" value="Eliminar" onClick="ValidarChk(1)"  class="boton">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                    <div align="left"></div></td>
                                </tr>
                            </table>
                        </form>-->

                        <table width="850" border="0" align="center" cellspacing="0" class="textocom">
                            <tr>
                                <td width="120" valign="top" >
                                    <div align="center" class="resaltados">Subir Archivos:</div></td>
                            <form enctype="multipart/form-data" method="post" name="formulario" action="FileUpload">
                                <input name="carnet" type="hidden" value="<%=datos.elementAt(0)%>">
                                <input name="tipocargue" type="hidden" value="<%=tipocargue%>">
                                <input name="spath" type="hidden" id="spath3" value="correo">
                                <input name="on" type="hidden" value="n">
                                <input name="fpath" type="hidden" value="<%=ruta%>">
                                <input name="nombre" type="hidden" value="<%=nombre%>">
                                <input name="doc" type="hidden" value="<%=doc%>">
                                
                                <input name="ref" type="hidden" value="<%=ref%>">
                                <input name="estado" type="hidden" value="<%=datos.elementAt(5)%>">
                                <input name="nomestud" type="hidden" value="<%=datos.elementAt(2)%>">
                                
                                <td>
                                    <table width="100%" border="1" cellspacing="0" bordercolor="#FFD006" >
                                        <tr>
                                            <td>
                                                <p align="left">
                                                    <input type="file" size="30" maxlength="300" name="archivoupload" class="campotext">
                                                </p>
                                                <p>
                                        <center>
                                            <input type="submit" name="uploadservlet" value="Adjuntar Archivo"  class="boton" onclick="return validar(this.formulario, this.form.archivoupload.value)">
                                        </center>
                                    </p></td>
                                </tr>
                        </table></td>
                </form>
            </tr>
        </table>
        <%    } else if (operacion.equals("x")) {%>
        <br>
    <CENTER><b> Su documentación del proceso de inscripción se encuentra completa, para cualquier información
            adicional comuníquese con la Oficina de Admisiones Teléfono: 6683600 opción 2 en el menú. </b></CENTER>

    <%} else if (operacion.equals("xx")) {
            out.println("<br><center><b>Su documentación del proceso de Liquidación de Matrícula se encuentra completa, para cualquier información adicional comuníquese con la Oficina de Admisiones Teléfono: 6683600 opción 2 en el menú. </center></b>");
        } else if (operacion.equals("xxx")) {%>
    <br>
    <CENTER><b> Su documentación se encuentra completa, para cualquier información
            adicional comuníquese con la Oficina de Admisiones Teléfono: 6683600 opción 2 en el menú. </b></CENTER>

    <%  } else if (operacion.equals("xxxx")) {
        out.println("<br><center><b>Su documentación del proceso de Transferencia se encuentra completa, para cualquier información adicional comuníquese con la Oficina de Admisiones Teléfono: 6683600 opción 2 en el menú. </center></b>");
    } else if (operacion.equals("t")) {
        out.println("<CENTER><b><br>Usted no está autorizado para realizar este proceso. Para mayor información comuníquese con la Oficina de Admisiones Teléfono: 6683600 opción 2 en el menú.</b></center>");
        } else {%>
    <div align="center" class="textocom"><strong class="titulos">Ha ocurrido un error al subir el archivo: </strong> <br>
        <span class="contenidos"> - Recuerde que el tama&ntilde;o del archivo no debe ser superior a 50 Mb<br>
            - Compruebe la ruta de la cual esta tomando el archivo<br>
            - Evite las rutas largas<br>
            - <em><font color="#990000" size="1"><%=operacion%></font></em><br>
            <a href="Documentacion?on=n&spath=<%=spath%>">Volver</a></span></div>
</table>
</div>
</table>

<%

                        }
                    }
                }
            }
        } else {
            out.println("<center><b>Su solicitud de admisión aún no ha sido recibida, por favor verifique su documento de identificación o diligencie el formulario de admisión.</b></center> ");
        }
    }
%>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Documentacion", e.getMessage());
    }
%>