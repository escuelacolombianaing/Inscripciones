<%-- 
    Document   : SeguyProt
    Created on : 31/07/2014, 09:16:31 AM
    Author     : Lucero
--%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            BDadmisiones admision = new BDadmisiones();
            String idevento = request.getParameter("idevento");
            //String nombre = request.getParameter("nombres");
            //String cupo = request.getParameter("cupo");
         //   Vector cupos = admision.CuposExternos(idevento);
            //String dato = cupos.elementAt(0).toString();
            configeci.configuracion confEci = new configeci.configuracion();
            //  Vector curso = admision.EventosExternos(confEci.getPeriodo());
          //  Vector curso = admision.EventosExternos("2014-2");
          //  String cupo = (String) ((Vector) curso.elementAt(0)).elementAt(9);
           // int total = Integer.parseInt(dato);
           // int cupomax = Integer.parseInt(cupo);
            Vector datocurso = admision.ValidaCurso(idevento);
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
                    alert("Por favor ingrese un n�mero de tel�fono");
                    document.forminsc.telefono.style.backgroundColor= '#ffcc00';
                    document.forminsc.telefono.focus();
                    return false;
                }

                if(document.forminsc.celular.value == ""){
                    alert("Por favor ingrese un n�mero de tel�fono celular");
                    document.forminsc.celular.style.backgroundColor= '#ffcc00';
                    document.forminsc.celular.focus();
                    return false;
                }

                if(document.forminsc.doc_est.value == ""){
                    alert("Por favor ingrese su documento de identificaci�n");
                    document.forminsc.doc_est.style.backgroundColor= '#ffcc00';
                    document.forminsc.doc_est.focus();
                    return false;
                }

                if(document.forminsc.correo.value == ""){
                    alert("Por favor ingrese su direcci�n de correo electr�nico");
                    document.forminsc.correo.style.backgroundColor= '#ffcc00';
                    document.forminsc.correo.focus();
                    return false;
                }

                valor = document.forminsc.correo.value;
                if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)){
                    return (true);
                } else {
                    alert("Error: Por favor ingrese una direccion de correo v�lida");
                    return (false);
                }

            }

            function convertTildes(str) {
                var out = "", flag = 0;
                for (i = 0; i < str.length; i++) {
                    if ((str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�")
                        && (str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�") && (str.charAt(i)!="�")){
                        out += str.charAt(i);
                        flag = 0;
                    }
                    else {
                        if((flag == 0) && (str.charAt(i)=="�")){
                            out += "i";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="�")){
                            out += "a";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="�")){
                            out += "e";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="�")){
                            out += "o";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="�")){
                            out += "u";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="�")){
                            out += "A";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="�")){
                            out += "E";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="�")){
                            out += "I";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="�")){
                            out += "O";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="�")){
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

                            <input name="idevento" type="hidden" id="doc" value="<%=idevento%>">
                            <!% if (50 < cupomax) {%>

                            
          <table width="666" border="0" cellpadding="1" cellspacing="1" class="textocom">
            <tr> 
              <td colspan="6" height="30"> 
                <div align="center"> 
                  <p align="left"><b> Para descargar las memorias por favor diligencie 
                    los datos que se solicitan a continuaci�n. Le llegara una 
                    clave a vuelta de correo, que le permitir� descargar las memorias. 
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
              <td colspan="6"><b><font color="#990000">*</font></b> <b>Ocupaci&oacute;n: 
                <input type="text" name="textfield" size="60" maxlength="60">
                </b></td>
            </tr>
            <tr>
              <td colspan="6">
                <p> <b>Seleccione la conferencia o conferencias a las cuales desea asistir.</b></p>
                <table width="69%" border="0" align="center">
                  <tr> 
                    <td width="14%"> 
                      <input type="checkbox" name="checkbox" value="251">
                    </td>
                    <td width="86%"><b> Estudio del perfil de una persona: Antecedentes.</b></td>
                  </tr>
                  <tr> 
                    <td width="14%">
                      <input type="checkbox" name="checkbox2" value="252">
                    </td>
                    <td width="86%"><b>Estudio del perfil de una persona: Psicol&oacute;gico.</b></td>
                  </tr>
                  <tr> 
                    <td width="14%">
                      <input type="checkbox" name="checkbox3" value="253">
                    </td>
                    <td width="86%"><b>Auditorias</b></td>
                  </tr>
                  <tr> 
                    <td width="14%">
                      <input type="checkbox" name="checkbox4" value="254">
                    </td>
                    <td width="86%"><b>An&aacute;lisis del riesgo financiero</b></td>
                  </tr>
                  <tr> 
                    <td width="14%"> 
                      <input type="checkbox" name="checkbox5" value="255">
                    </td>
                    <td width="86%"><b>P&oacute;lizas de seguros empresariales: 
                      Comerciales</b></td>
                  </tr>
                  <tr> 
                    <td width="14%">
                      <input type="checkbox" name="checkbox6" value="256">
                    </td>
                    <td width="86%"><b> P&oacute;lizas de seguros empresariales: 
                      Ingenieriles</b></td>
                  </tr>
                  <tr> 
                    <td width="14%">
                      <input type="checkbox" name="checkbox7" value="257">
                    </td>
                    <td width="86%"><b>Matem&aacute;tica del riesgo y la confiabilidad</b></td>
                  </tr>
                  <tr> 
                    <td width="14%">
                      <input type="checkbox" name="checkbox8" value="258">
                    </td>
                    <td width="86%"><b>Ajuste de siniestros.</b></td>
                  </tr>
                  <tr> 
                    <td width="14%">
                      <input type="checkbox" name="checkbox9" value="259">
                    </td>
                    <td width="86%"><b>Seguridad de la informaci&oacute;n digital.</b></td>
                  </tr>
                  <tr> 
                    <td width="14%">
                      <input type="checkbox" name="checkbox10" value="260">
                    </td>
                    <td width="86%"><b> Protecci&oacute;n y manejo de la propiedad 
                      intelectual.</b></td>
                  </tr>
                  <tr> 
                    <td width="14%">
                      <input type="checkbox" name="checkbox11" value="261">
                    </td>
                    <td width="86%"><b> Defensa de la imagen corporativa</b></td>
                  </tr>
                </table>
             
              </td>
            </tr>
            <tr> 
              <td colspan="6"> 
                <div align="center"> 
                  <p><b>CUPOS LIMITADOS</b></p>
                </div>
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
           
          </table>
                           
                        </form>
                    </div>

                </td>
            </tr>
        </table>
    </body>
</html>

