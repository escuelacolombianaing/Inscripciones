<%@page import="utiles.Correo"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="BDatos.BDdocumentacion"%>

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
            Vector datos = documentos.ConsultaDatosArt(doc, confEci.getPeriodo(), oout);
            /* Vector datos = documentos.ConsultaDatos(doc, "2012-2", oout);*/
            if (datos.size() > 0) {
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
                if (lon <= 0) {
                    out.println("<center><b>Usted no est� autorizado para realizar este proceso o la informaci�n  no concuerda con la diligenciada, por favor verifique que haya realizado el proceso de inscripci�n.</b></center>");
                } else if (estado.equals("-78")) {
                    nombre = "ART" + id + ".pdf";
                }


                String programa = "";
                //ruta = "C:/Users/andres.rojas/directorioPruebas";
                ruta = "/home/shares/doc_admin/";
                //   ruta = "/home/doc_admin/";
                adjuntar = new eci.adjuntar("documentacionArt", ruta);

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
        <meta target="principal" http-equiv="Refresh" content="0; url=DocumentacionArt?on=n&spath=spath&doc=<%=datos.elementAt(1)%>&ref=<%=ref%>&carnet=<%=datos.elementAt(0)%>&estado=<%=datos.elementAt(5)%>&tipocargue=<%=tipocargue%>">
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

            function ValidarMod() {
                var max = document.fmArchivos.chElim.length
                var j = 0
                for (i = 0; i < max; i++) {
                    if (document.fmArchivos.chElim[i].checked == true)
                        j++;
                }
                if (j = 0) {
                    alert("Para modificar tiene que seleccionar un recurso")
                } else if (j > 1) {
                    alert("Solo puede seleccionar un campo")
                } else {
                    document.action = 'LA OTRA ACCION'
                    document.submit()
                }
            }


            function ValidarChk(temp) {
                var max = document.fmArchivos.chElim.length
                var vall = false
                for (i = 0; i < max; i++) {
                    if (document.fmArchivos.chElim[i].checked == true)
                        vall = true
                }
                if (temp == 1) {
                    vall = true
                }
                if (vall == true)
                    document.fmArchivos.submit()
                else
                    alert("Para eliminar tiene que seleccionar algun recurso")
            }

            function chkAll() {
                var max = document.fmArchivos.chElim.length
                var vall
                if (document.fmArchivos.chAll.checked == true)
                    vall = true
                else
                    vall = false
                for (i = 0; i < max; i++) {
                    document.fmArchivos.chElim[i].checked = vall
                }
            }


            function chkUn() {
                var max = document.fmArchivos.chElim.length
                var vall = true
                if (document.fmArchivos.chAll.checked == true)
                    document.fmArchivos.chAll.checked = false
                for (i = 0; i < max; i++) {
                    vall = vall && document.fmArchivos.chElim[i].checked
                }
                if (vall == true)
                    document.fmArchivos.chAll.checked = true
            }

            function adjuntar() {
                document.forminsc.action = "Backup";
                //window.open("", "ventanaImpreNotas", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
                ///document.formulario.submit();
            }

            function validar(formulario, archivo) {
                var b = archivo.split('.');
                if (b[b.length - 1] == 'pdf') {
                    var nomar = document.formulario.archivoupload.value;
                    var x = archivo.split('\\');
                    nomar = x[x.length - 1];
                    document.formulario.action = 'FileUpload?on=n&spath=correo&fpath=<%=ruta%>&nombre=<%=nombre%>&doc=<%=doc%>&ref=<%=ref%>&carnet=<%=datos.elementAt(0)%>&nomestud=<%=datos.elementAt(2)%>&tipocargue=<%=tipocargue%>&estado=<%=datos.elementAt(5)%>&na=' + nomar;
                    return true;
                }

                else {
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

        <table align="center" width="740" border="0" cellpadding="0" cellspacing="0" >
            <tr><td><b><center><%=datos.elementAt(2)%></center></b></td></tr>
            <tr>
                <td bgcolor="#FFFFFF">
                    <% if (operacion.equals("n")) {
            int i = 0;%>

                    <%
                        DateFormat dateFormatter = DateFormat.getDateInstance(DateFormat.MEDIUM);
                        long x = adjuntar.fecArchivo(nombre);
                        String f = "";
                        if (!(x == 0)) {
                            Date fec = new Date(adjuntar.fecArchivo(nombre));
                            f = dateFormatter.format(fec);
                        }

                    %>


                    <table width="550" border="0" align="center" cellspacing="0" class="textocom">
                        <tr>
                            <td width="120" valign="top" >
                                <div align="left" class="resaltados">Subir Archivos:</div></td>
                        <form enctype="multipart/form-data" method="post" name="formulario" action="FileUpload">
                            <input name="carnet" type="hidden" value="<%=datos.elementAt(0)%>">
                            <input name="tipocargue" type="hidden" value="<%=tipocargue%>">
                            <input name="spath" type="hidden"  value="correo">
                            <input name="on" type="hidden"  value="n">
                            <input name="fpath" type="hidden"  value="<%=ruta%>">
                            <input name="nombre" type="hidden"  value="<%=nombre%>">
                            <input name="doc" type="hidden"  value="<%=doc%>">
                            <input name="ref" type="hidden"  value="<%=ref%>">
                             <input name="estado" type="hidden"  value="<%=datos.elementAt(5)%>">
                 
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
        <%    } else {%>
        <div align="center" class="textocom"><strong class="titulos">Ha ocurrido un error al subir el archivo: </strong> <br>
            <span class="contenidos"> - Recuerde que el tama&ntilde;o del archivo no debe ser superior a 50 Mb<br>
                - Compruebe la ruta de la cual esta tomando el archivo<br>
                - Evite las rutas largas<br>
                - <em><font color="#990000" size="1"><%=operacion%></font></em><br>
                <a href="DocumentacionArt?on=n&spath=<%=spath%>">Volver</a></span></div>
    </table>
</table>

<%

                    }
                }
            }
        } else {
            out.println("<center><b>****Su solicitud de admisi�n a�n no ha sido recibida, por favor verifique su documento de identificaci�n o diligencie el formulario de admisi�n.</b></center> ");
        }
    }
%>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("DocumentacionArt", e.getMessage());
    }
%>