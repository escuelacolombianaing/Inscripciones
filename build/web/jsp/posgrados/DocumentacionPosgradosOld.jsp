<%-- 
    Document   : DocumentacionPosgrados
    Created on : 10/03/2016, 09:25:42 AM
    Author     : Lucero
--%>

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
        // String ref = request.getParameter("ref");
        String doc = request.getParameter("doc");
        String plan = request.getParameter("plan");
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
        // String tipocargue = request.getParameter("tipo");
//out.println(tipocargue);
        int p = 0;
//1018416654
        if (spath.equals("p"))
            out.println("Error");
        else {
            Vector datos = documentos.ConsultaDatosPos(doc, confEci.getPeriodo(), oout);%>

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

        int lon = datos.size();
        Vector cargue;
        if(plan!= null && plan.equals("352")){
            cargue = documentos.impidecargueDoctorado(id, oout);
        }else{
            cargue = documentos.impidecarguePos(id, oout);
        }
        int loncargue = cargue.size();
        String documentosCargados="";
        if (loncargue > 0) {
            documentosCargados="Sus documentos  ya se encuentran cargados, verifique el estado de los mismos.";
        } else if (((estado.equals("-190") || estado.equals("-185")) && ((blq.equals("1") || blq.equals("2"))))) {
            nombre = "d" + id + ".pdf";
        }

        String programa = "";
        //ruta = "C:\\Users\\andres.rojas\\Desktop";

        ruta = "/home/shares/doc_admin/Posgrados";

        //  ruta = "/home/doc_admin/";
        adjuntar = new eci.adjuntar("DocumentacionPosgrados", ruta);

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
            <%if(plan!= null && plan.equals("352")){%>
            <meta charset="UTF-8">
            <title>DOCTORADO EN INGENIERÍA</title>
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
            <meta http-equiv="Content-Language" content="ES" />
            <meta name="language" content="spanish" />
            <meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
            <meta name="copyright" content="Copyright (c) 2017" />
            <meta name="description" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
            <meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <link rel="stylesheet" href="css/estilo-doctorado.css">
            <link rel="stylesheet" href="css/FormularioDoctorado.css">   
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
            <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300i,700" rel="stylesheet">

            <!-- Global site tag (gtag.js) - Google Analytics -->
            <script async src="https://www.googletagmanager.com/gtag/js?id=UA-116073513-1"></script>
            <script>
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());

              gtag('config', 'UA-116073513-1');
            </script>
            <%}else{%>
            <meta target="principal" http-equiv="Refresh" content="0; url=DocumentacionPosgrados?on=n&spath=spath&doc=<%=datos.elementAt(1)%>&carnet=<%=datos.elementAt(0)%>&estado=<%=datos.elementAt(5)%>">
            <style type="text/css">
            </style>
            <link href="../estilos.css" rel="stylesheet" type="text/css">
            <%}%>
    </head>
</html>

<%
} else {
%>
<html>
    <head>
        <%if(plan!=null&&plan.equals("352")){%>
        <meta charset="UTF-8">
            <title>DOCTORADO EN INGENIERÍA</title>
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
            <meta http-equiv="Content-Language" content="ES" />
            <meta name="language" content="spanish" />
            <meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
            <meta name="copyright" content="Copyright (c) 2017" />
            <meta name="description" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
            <meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <link rel="stylesheet" href="css/estilo-doctorado.css">
            <link rel="stylesheet" href="css/FormularioDoctorado.css">   
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
            <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300i,700" rel="stylesheet">

            <!-- Global site tag (gtag.js) - Google Analytics -->
            <script async src="https://www.googletagmanager.com/gtag/js?id=UA-116073513-1"></script>
            <script>
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());

              gtag('config', 'UA-116073513-1');
            </script>
        <%}else{%>
        <title>Documentacion</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <%}%>
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
                    document.formulario.action = 'FileUploadPosgrados';
                    console.info("Envió a Upload");
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
        <%if(plan!=null&&plan.equals("352")){%>
        <div class="container-fluid franjaColor navbar-fixed-top">
		<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="nav navbar-default" role="navegation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".menu">
							<span class="sr-only">Desplegar navegación</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="index.html"><img alt="Brand" src="img/logoEscuela.svg" class="img-responsive"></a>
					</div>
					<div class="collapse navbar-collapse menu">
						<ul class="nav navbar-nav">
							<li><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/index.html">Inicio</a></li>
							<li><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/caracteristicas.html">Características</a></li>
							<li><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/internacionalizacion.html">Internacionalización</a></li>
							<li><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/investigacion.html">Investigación</a></li>
							<li><a href="http://www.escuelaing.edu.co/escuela/doctoradoIngenieria/doc/Brochure-Doctorado-Ingenieria.pdf" target="_blank">Guía Doctorado</a></li>
							<li class="active"><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/admisiones.html">Admisiones</a></li>
							<li><a href="https://www.escuelaing.edu.co/escuela/doctoradoIngenieria/contacto.html">Contáctenos</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		</div>
            </div>
        
        <div class="row">
				<div class="col-lg-12"><h2 class="page-header"><span><img src="img/icono-areas.png" alt="icono plan"></span> DOCTORES</h2></div>
				<div class="row">
					<div class="col-md-12"><img src="img/imgGeneralidades-1.jpg" class="img-responsive" alt="Bloque F"><br></div>
				</div>
	</div>	
        <%}else{%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Cargue Documentos posgrado" />
        </jsp:include>
        <%}%>
        <div align="center">
            <h2><b><%=documentosCargados%></b></h2>
            <table align="center" width="740" border="0" cellpadding="0" cellspacing="0" >
                <tr><td><b><center><%=datos.elementAt(2)%></center></b></td></tr>
                <tr>
                    <td bgcolor="#FFFFFF">
                        <% if (operacion.equals("n")) {
                                int i = 0;%>
                        <table width="100%" border="0" cellpadding="7" cellspacing="0" >
                            <tr>
                                <td>
                                    <div align="center">

                                    </div>
                                </td>
                            </tr>
                        </table>

                        <table width="750" border="0" align="center" cellspacing="0" class="textocom">

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

                            <table width="750" border="0" align="center" cellspacing="0" class="textocom">
                                <tr>
                                    <td width="120" valign="top" >
                                        <div align="left" class="resaltados">Subir Archivos:</div></td>
                                <form enctype="multipart/form-data" method="post" name="formulario" action="FileUploadPosgrados">
                                    <input name="carnet" type="hidden" value="<%=datos.elementAt(0)%>">
                                    <input name="plan" type="hidden" value="<%=plan%>">
                                    <input name="spath" type="hidden" id="spath3" value="correo">
                                    <input name="on" type="hidden" value="n">
                                    <input name="fpath" type="hidden" value="<%=ruta%>">
                                    <input name="nombre" type="hidden" value="<%=nombre%>">
                                    <input name="doc" type="hidden" value="<%=doc%>">
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
                                                            <input type="submit" name="uploadservlet" value="Adjuntar"  class="boton" onclick="return validar(this.formulario, this.form.archivoupload.value);">
                                                        </center>
                                                    </p>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </form>
                </tr>
            </table>
            <%    } else {%>
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
} else {%>
<jsp:include page="encabezado">
    <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
    <jsp:param name="titulo" value="Cargue Documentos posgrado" />
</jsp:include>

<%    out.println("<CENTER><b><br>Usted no está autorizado para realizar este proceso. Para mayor información comuníquese con la Oficina de Admisiones Teléfono: 6683600 opción 2 en el menú.</b></center>");
    }%>
<br>
<div align="center"><a href="http://www.escuelaing.edu.co"><b>SALIR</b></a> </div>     


<%}
%>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Documentacion", e.getMessage());
        out.println("<CENTER><b><br>NO FUNCIONO"+e.getClass().getName()+"</b></center>");
    }
%>
