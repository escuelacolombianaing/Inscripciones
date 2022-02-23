<%-- 
    Document   : Inscripcion
    Created on : 14/01/2013, 11:19:56 AM
    Author     : Lucero
--%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            BDadmisiones admision = new BDadmisiones();
            //String idevento = request.getParameter("idevento");
            //String nombre = request.getParameter("nombres");
            //String cupo = request.getParameter("cupo");
            
           // Vector cupos = admision.CuposExternos(idevento);
           // String dato = cupos.elementAt(0).toString();
            configeci.configuracion confEci = new configeci.configuracion();
            //  Vector curso = admision.EventosExternos(confEci.getPeriodo());
            Vector curso = admision.EventosExternos("2014-2");
          //  String cupo = (String) ((Vector) curso.elementAt(0)).elementAt(9);
          //  int total = Integer.parseInt(dato);
           // int cupomax = Integer.parseInt(cupo);
           // Vector datocurso = admision.ValidaCurso(idevento);
%>
<html>
    <head>
        <title>Formulario de Inscripci&oacute;n </title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {
                var valor;
                if(document.forminsc.ape1.value == ""){
                    alert("Por favor ingrese su primer apellido");
                    document.forminsc.ape1.style.backgroundColor= '#ffcc00';
                    document.forminsc.ape1.focus();
                    return false;
                }

                if(document.forminsc.ape2.value == ""){
                    alert("Por favor ingrese su segundo apellido");
                    document.forminsc.ape2.style.backgroundColor= '#ffcc00';
                    document.forminsc.ape2.focus();
                    return false;
                }

                if(document.forminsc.nombres.value == ""){
                    alert("Por favor ingrese sus nombres");
                    document.forminsc.nombres.style.backgroundColor= '#ffcc00';
                    document.forminsc.nombres.focus();
                    return false;
                }


                if(document.forminsc.telefono.value == ""){
                    alert("Por favor ingrese un número de teléfono");
                    document.forminsc.telefono.style.backgroundColor= '#ffcc00';
                    document.forminsc.telefono.focus();
                    return false;
                }

                if(document.forminsc.celular.value == ""){
                    alert("Por favor ingrese un número de teléfono celular");
                    document.forminsc.celular.style.backgroundColor= '#ffcc00';
                    document.forminsc.celular.focus();
                    return false;
                }

                if(document.forminsc.doc_est.value == ""){
                    alert("Por favor ingrese su documento de identificación");
                    document.forminsc.doc_est.style.backgroundColor= '#ffcc00';
                    document.forminsc.doc_est.focus();
                    return false;
                }

                if(document.forminsc.correo.value == ""){
                    alert("Por favor ingrese su dirección de correo electrónico");
                    document.forminsc.correo.style.backgroundColor= '#ffcc00';
                    document.forminsc.correo.focus();
                    return false;
                }

                valor = document.forminsc.correo.value;
                if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)){
                    return (true);
                } else {
                    alert("Error: Por favor ingrese una direccion de correo válida");
                    return (false);
                }

            }
          
            function convertTildes(str) {
                var out = "", flag = 0;
                for (i = 0; i < str.length; i++) {
                    if ((str.charAt(i)!="í") && (str.charAt(i)!="á") && (str.charAt(i)!="é") && (str.charAt(i)!="ó") && (str.charAt(i)!="ú")
                        && (str.charAt(i)!="Á") && (str.charAt(i)!="É") && (str.charAt(i)!="Í") && (str.charAt(i)!="Ó") && (str.charAt(i)!="Ú")){
                        out += str.charAt(i);
                        flag = 0;
                    }
                    else {
                        if((flag == 0) && (str.charAt(i)=="í")){
                            out += "i";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="á")){
                            out += "a";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="é")){
                            out += "e";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="ó")){
                            out += "o";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="ú")){
                            out += "u";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Á")){
                            out += "A";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="É")){
                            out += "E";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Í")){
                            out += "I";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Ó")){
                            out += "O";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Ú")){
                            out += "U";
                            flag = 1;
                        }
                    }
                }
                return out;
            }
            //-->
        </script>
    </head>
    <body>      
        <div align="center"><img src="img/suelos.jpg" width="706" height="182" usemap="#m_CABEZOTE"></div>
        <br>
        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
            <tr>
                <td>
                    <div align="center">
                        <form action="InscribeEvento" method="post" name="forminsc" id="forminsc">

                            <input name="idevento" type="hidden" id="doc" value="1500">
                            <!% if (total < cupomax) {%>

                            <table width="666" border="0" cellpadding="1" cellspacing="1" class="textocom">
                                <tr>
                                    <td colspan="6" height="30">
                                        <div align="center">
                                            <p align="left"><b> Para descargar las memorias por favor diligencie
                                                    los datos que se solicitan a continuación. Le llegara una
                                                    clave a vuelta de correo, que le permitirá descargar las memorias.
                                                    <!%=datocurso.elementAt(0)%>
                                                </b></p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="223"><strong><font color="#990000">*</font> Primer Apellido:</strong></td>
                                    <td colspan="3">
                                        <input type="text" class="campotext" name="ape1"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);" >
                                    </td>
                                    <td width="167"><strong><font color="#990000">*</font> Segundo Apellido:</strong></td>
                                    <td width="118">
                                        <input type="text" class="campotext" name="ape2"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);" >
                                    </td>
                                </tr>
                                <tr>
                                    <td width="223"><strong><font color="#990000">*</font> Nombres:</strong></td>
                                    <td colspan="5">
                                        <input type="text" class="campotext" name="nombres"  size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);" >
                                    </td>
                                </tr>
                                <tr>
                                    <td width="223"><strong><font color="#990000">*</font> Documento
                                            de identidad:</strong></td>
                                    <td colspan="3"><font size="2">
                                            <input name="doc_est" type="text" class="campotext" size="18" maxlength="20" >
                                        </font></td>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="5"><b><font color="#990000">*</font> Correo electr&oacute;nico:
                                            <font size="3">
                                                <input type="text" name="correo" maxlength="40" size="40" class="campotext">
                                            </font> </b></td>
                                </tr>
                                <tr>
                                    <td width="223"><b><font color="#990000">*</font> Tel&eacute;fono
                                            Fijo: </b><b><font size="2">
                                                <input name="telefono" type="text" class="campotext" id="telefono" size="14" maxlength="14">
                                            </font></b></td>
                                    <td colspan="4" height="38">
                                        <div align="left"><b><font color="#990000">*</font> Tel&eacute;fono
                                                Celular:</b><strong>
                                                <input type="text" name="celular" size="10" maxlength="10" class="campotext">
                                            </strong> </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6"><b><font color="#990000">*</font> Empresa:
                                            <input type="text" name="empresa" size="60" maxlength="60">
                                            <font size="3"> </font></b></td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <div align="center">
                                            <p><b>CUPOS LIMITADOS</b></p>
                                            <p>&nbsp;</p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <div align="left"><b>La Escuela Colombiana de Ingenier&iacute;a
                                                Julio Garavito, no se hace responsable de ninguna de las informaciones,
                                                opiniones y conceptos t&eacute;cnicos que se emitan, publiquen
                                                o distribuyan a trav&eacute;s de esta p&aacute;gina web o de
                                                las memorias de eventos anteriores</b></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <hr size="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <div align="center">
                                            <input name="bi" type="submit" class="boton" value="Enviar" onClick="javascript: return validar();">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <div align="right">
                                            <p>&nbsp;</p>
                                            <p align="left"><b>Si ya cuenta con su clave, por favor haga
                                                    <a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/Validacion?idevento=225">clic
                                                        aquí</a></b></p>
                                            <p align="left"><b>Si olvid&oacute; su clave por favor haga
                                                    <a href="http://admisiones.escuelaing.edu.co/inscripcioneslinea/ConsultarClave">
                                                        clic aqu&iacute;.</a> </b></p>
                                            <p><a href="http://tycho.escuelaing.edu.co/contenido/encuentros-suelosyestructuras/index.html"><font size="2"><b>VOLVER</b></font></a></p>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <!%} else {%>
                          <!--  <center>
                                <p>Se agotaron los cupos para descargar memorias de nuestros Encuentros de Ingenieros de Suelos y Estructuras.</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                            </center>-->

                            <!%}%>
                        </form>
                    </div>

                </td>
            </tr>
        </table>
    </body>
</html>

