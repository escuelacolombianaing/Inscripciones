
<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="BDatos.BDdocumentacion"%>

<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
        HttpSession sesion;
        configeci.configuracion confEci = new configeci.configuracion();
        PrintWriter oout = response.getWriter();
        response.setHeader("Cache-Control", "no-cache");
        BDadmisiones admision = new BDadmisiones();
        BDdocumentacion documentos = new BDdocumentacion();
      //  String ref = request.getParameter("ref");
        String doc = request.getParameter("doc");
        eci.adjuntar adjuntar;
        String spath = "correo";
        String ruta = new String();
        String nombre = "";
        String operacion = request.getParameter("on");
//1018416654
        if (spath.equals("p"))
            out.println("Error");
        else {
            Vector datos = documentos.ConsultaDatos(doc,  confEci.getPeriodo(), oout);
            String nro = new String();

            int lon = datos.size();
            if (lon <= 0) {
                out.println("<center><b>Usted no está autorizado para realizar este proceso o la información  no concuerda con la diligenciada, por favor verifique que haya realizado el proceso de inscripción.</b></center>");
            } else {

               // Vector estudiante = (Vector) datos.elementAt(0);
                nro = datos.elementAt(4).toString();
                String carnet = datos.elementAt(0).toString();
                // out.println(carnet);
                String estado = datos.elementAt(5).toString();
                String acta = datos.elementAt(6).toString();
                String tipoest = datos.elementAt(7).toString();
               // String nomestud = estudiante.elementAt(2).toString();

                if (estado.equals("-83") && tipoest.equals("T")) {
                    //   out.println("Usted debe cargar únicamente los documentos del proceso de matrícula, para lo cual debe esperar su respuesta de admisión");
                    operacion = "y";
                } else if (estado.equals("-83") && !tipoest.equals("T")) {
                    nombre = "d" + carnet + ".pdf";
                } else if (acta.equals("No disponible") && estado.equals("-60")) {
                    nombre = "ma" + carnet + ".pdf";
                } else if (estado.equals("-70")) {

                    operacion = "t";

                } else if (!acta.equals("No disponible")) {
                    // out.println("Usted no debe realizar este Proceso");
                    operacion = "x";
                } else {
                    operacion = "x";
                }

                String programa = "";
                ruta = "C:/Sun/doc_pregrado/20102/";
                //ruta = "/home/doc_admin/";
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

                        }%>

<html>
    <head>
        <meta target="principal" http-equiv="Refresh" content="0; url=Documentacion?on=n&spath=spath&doc=<%=doc%>&carnet=<%=carnet%>&estado=<%=estado%>">
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
                document.formulario.action='FileUpload?on=n&spath=correo&fpath=<%=ruta%>&nombre=<%=nombre%>&doc=<%=doc%>&carnet=<%=carnet%>&estado=<%=estado%>&na='+nomar;
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



<table align="center" width="740" border="0" cellpadding="0" cellspacing="0" >

    <tr>
    <td bgcolor="#FFFFFF">


    <%
                if (operacion.equals("n")) {
                    int i = 0;
    %>
    <table width="85%" border="0" cellpadding="7" cellspacing="0" >
        <tr>
            <td>
                <div align="center">
                    <b> <!%=nomestud%></b>
                    <p>
                    <% if (estado.equals("-83") && !tipoest.equals("T")) {
            out.println("<CENTER><b>Usted debe subir el archivo pdf correspondiente a los documentos completos del proceso de INSCRIPCIÓN.  </b></center>");

        } else if (acta.equals("No disponible") && estado.equals("-60")) {
            out.println("<CENTER><b>Usted debe subir el archivo pdf correspondiente a los documentos completos del proceso de MATRÍCULA. </b></center>");
        } else if (acta.equals("No disponible") && estado.equals("-70")) {
            out.println("<CENTER><b>Usted no está autorizado para realizar este proceso.</b></center>");

        }%>
                </div>

            </td>
        </tr>
    </table>

    <table width="550" border="0" align="center" cellspacing="0" class="textocom">
        <!--<tr>
        <td width="120" valign="top">
        <div align="right" class="resaltados"><strong>Archivo Subido:</strong></div></td>
        <td>
    <form name="fmArchivos" method="post" action="Documentacion?on=ar&spath=correo&nombre=<1%=nombre%>&doc=<1%=doc%>">

           <table width="100%" border=1 cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"  class="textocom">
                <tr>

                    <td width="11%" >
                        <div align=center>
                            <!--input type="checkbox" name="chAll" onClick="chkAll()"
                    </div></td>
                    <td width="50%"  class="titulos">
                    <div align=center><b>Nombre</b></div></td>

                    <td width="21%"  class="titulos">
                    <div align="center"><strong>Tama&ntilde;o</strong></div></td>

                    <td width="18%"  class="titulos">
                    <div align="center"><strong>Fecha</strong></div></td>
                </tr>-->
                <%
        DateFormat dateFormatter = DateFormat.getDateInstance(DateFormat.MEDIUM);
        long x = adjuntar.fecArchivo(nombre);
        String f = "";
        if (!(x == 0)) {
            Date fec = new Date(adjuntar.fecArchivo(nombre));
            f = dateFormatter.format(fec);
        }
        /*   for (i = 0; i < adjuntar.nArchivos(); i++) {
        DateFormat dateFormatter = DateFormat.getDateInstance(DateFormat.MEDIUM);
        Date fec = new Date(adjuntar.fecArchivo(i));*/
        %>
        <tr>

            <td width="11%" >
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

        <table width="550" border="0" align="center" cellspacing="0" class="textocom">
            <tr>
                <td width="120" valign="top" >
                <div align="left" class="resaltados">Subir Archivos:</div></td>
                <form enctype="multipart/form-data" method="post" name="formulario" action="FileUpload?on=n&spath=correo&fpath=<%=ruta%>&nombre=<%=nombre%>&doc=<%=doc%>">
                    <input name="carnet" type="hidden" value="carnet">
                    <input name="spath" type="hidden" id="spath3" value="correo">
                                              
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
        <%
    } else if (operacion.equals("x")) {
        %>
        <br>
        <CENTER><b> Su documentación se encuentra completa, para cualquier información
        adicional comuníquese con la Oficina de Admisiones Teléfono: 6683600 ext. 263-274. </b></center>


        <%} else if (operacion.equals("y")) {

        out.println("<br><center><b>Usted debe cargar únicamente los documentos del proceso de matrícula, para lo cual debe esperar su respuesta de admisión</center></b>");


    } else if (operacion.equals("t")) {

        out.println("<CENTER><b><br>Usted no está autorizado para realizar este proceso. Para mayor información comuníquese con la Oficina de Admisiones Teléfono: 6683600 ext. 263-274.</b></center>");


    } else {%>
        <div align="center" class="textocom"><strong class="titulos">Ha ocurrido un error al subir el archivo: </strong> <br>
            <span class="contenidos"> - Recuerde que el tama&ntilde;o del archivo no debe ser superior a 50 Mb<br>
                - Compruebe la ruta de la cual esta tomando el archivo<br>
                - Evite las rutas largas<br>
                - <em><font color="#990000" size="1"><%=operacion%></font></em><br>
        <a href="Documentacion?on=n&spath=<%=spath%>">Volver</a></span></div>
    </table>
</table>

<%
                        }

                    }
                }
            }
        }
%>
