<%-- 
    Document   : referenciamestrias
    Created on : 3/06/2011, 12:10:15 PM
    Author     : lrodriguez
--%>
<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<html>

    <%
                configeci.configmaestria confEci = new configeci.configmaestria();
                int ban = 0;
                String idplan = request.getParameter("idplan");
                PrintWriter oout = response.getWriter();
                String prog = "";
                BDadmisiones bd = new BDadmisiones();
                Vector posgrados = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
                Date hoy = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                Date fechafin = new Date();
                String dato = new String(posgrados.elementAt(3).toString());
                idplan = new String(posgrados.elementAt(1).toString());
                String datofin = new String(posgrados.elementAt(4).toString());
                String fechaActual = formatter.format(hoy);
                Date inicio = formatter.parse(dato);
                Date finall = formatter.parse(datofin);
                String X = formatter.format(inicio);
                String Y = formatter.format(finall);
                //  if (prog.equals(tipoest)) {
                if (((hoy.after(inicio) && hoy.before(finall)) || fechaActual.equals(Y)) && (posgrados.elementAt(0).equals("1"))) {
                    ban = 1;
                }

                if (idplan.equals("353")) {
                    prog = "MAESTRIA EN GESTION DE INFORMACION";
                }
                if (idplan.equals("371")) {
                    prog = "MAESTRÍA EN INFORMÁTICA";
                }
                if (idplan.equals("372")) {
                    prog = "MAESTRÍA EN CIENCIAS ACTUARIALES";
                }
                if (idplan.equals("376")) {
                    prog = "MAESTRÍA EN CIENCIA DE DATOS";
                }
                
    %>
    <head>
        <title>Solicitud de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <SCRIPT LANGUAGE="JavaScript">
            function comprueba( ){

                var ind = document.form1.prog.selectedIndex;
                var valor;
                if ( document.forms.form1.prog.options[ind].value == '0') {
                    alert("Usted debe seleccionar el énfasis al cual desea inscribirse");
                    return false;
                }

                if ( document.forms.form1.apellido1.value == '') {
                    alert("Los apellidos del aspirante no puede estar en blanco");
                    return false;
                }

                if ( document.forms.form1.nom.value == '') {
                    alert("El nombre del aspirante no puede estar en blanco");
                    return false;
                }
                if ( isNaN(document.forms.form1.tel.value ) || (document.forms.form1.tel.value == '')) {
                    alert("Falta la informacion telefónica o el dato no es numérico");
                    return false;
                }

                if ( document.forms.form1.ciudad.value == '') {
                    alert("Usted debe proporcionar la ciudad de donde es el número telefónico.");
                    return false;
                }

                if ( isNaN(document.forms.form1.doc.value ) || (document.forms.form1.doc.value == '')) {
                    alert("El documento de identidad no puede estar en blanco y debe ser dato numérico");
                    return false;
                }

                valor = document.forms.form1.ema.value;

                if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)){
                    return (true);
                } else {
                    alert("Error: Por favor ingrese una dirección de correo válida");
                    return (false);
                }

                if ( document.forms.form1.numreg.value == '') {
                    alert("El Título Profesional no puede estar en blanco");
                    return false;
                }

                return true;
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
        </SCRIPT>

        <script language="JavaScript" type="text/JavaScript">
            <!--
            function ventanaSecundaria (URL){
                window.open(URL,"","width=850,height=750,scrollbars=no,top=100,left=100")
            }
            //-->
        </script>
    </head>

    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Admisiones Maestría en Gestión de Información" />
        </jsp:include>
        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>

                <td> <fieldset><legend class="textocom"><strong>Solicitud de n&uacute;mero
                                de referencia de pago para hacer la inscripci&oacute;n a la Maestr&iacute;a
                            </strong></legend>
                        <div align="center">
                            <p align="left" class="textocom">Para inscribirse
                                a la Maestr&iacute;a en Gestión de Información de
                                la Escuela Colombiana de Ingenier&iacute;a Julio Garavito,
                                por favor diligencie estos datos b&aacute;sicos, y tome nota del n&uacute;mero
                                de referencia de pago de los derechos de inscripci&oacute;n que el sistema
                                le indicar&aacute; una vez los haya enviado.<!--<a href="javascript:ventanaSecundaria('http://www.escuelaing.edu.co/programas/maestrias/ingenieria_civil/contacto.htm')">
                                Contacto</a>--></p>
                            <p align="left" class="textocom">&nbsp;</p>
                            <p align="center" class="textocom">
                                Los campos marcados con un asterisco (<b><font color=#ff0000>*</font></b>)
                                son campos obligatorios
                                <%if (ban == 0) {
                                             out.println("<b><center>Las inscripciones para este programa sólo se habilitarán en las fechas programadas.<center></b>");

                                         } else {%>
                            <form action="CapturaRefMaestria" method="post" onSubmit="return comprueba( );" name="form1" id="form1">

                                <table width="675" class="textocom" border="0">
                                    <tr>
                                        <td height="25">
                                            <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Programa</b></div>
                                        </td>
                                        <td height="25">
                                            <select name="prog" class="campotext" size="1">
                                                <option value="0">seleccione</option>
                                                <option value="<%=idplan%>"><%=prog%></option>

                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right"><strong><b><font color="#CC0033">*</font></b>Primer
                                                    Apellido del Aspirante</strong></div>
                                        </td>
                                        <td><strong>
                                                <input type="text" onBlur="this.value = convertTildes(this.value);" class="campotext" name="apellido1" size="14" maxlength="14">
                                            </strong></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right"><strong><b><font color="#CC0033"> </font></b>Segundo
                                                    Apellido del Aspirante</strong></div>
                                        </td>
                                        <td><strong>
                                                <input type="text" onBlur="this.value = convertTildes(this.value);" class="campotext" name="apellido2" size="14" maxlength="14">
                                            </strong></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right"><b><font color="#CC0033">*</font> Nombre completo
                                                    del aspirante &nbsp;</b></div>
                                        </td>
                                        <td><strong>
                                                <input type="text" onBlur="this.value = convertTildes(this.value);" class="campotext" name="nom" size="28" maxlength="28">
                                            </strong></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right"><strong><font color="#CC0033">*</font> Tel&eacute;fono</strong></div>
                                        </td>
                                        <td><strong>
                                                <input type="text" class="campotext" name="tel" size="15" maxlength="15">
                                            </strong> <b>de<strong>
                                                    <input type="text" class="campotext" name="ciudad" size="15" maxlength="15">
                                                </strong>(ciudad)</b></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right"><strong>Tel&eacute;fono Oficina&nbsp;</strong></div>
                                        </td>
                                        <td><strong>
                                                <input type="text" class="campotext" name="tel_ofi" size="15" maxlength="15">
                                            </strong><b>de</b> <strong>
                                                <input type="text" class="campotext" name="ciudadofi" size="15" maxlength="15">
                                            </strong><b>(ciudad)</b></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right"><strong>Celular </strong></div>
                                        </td>
                                        <td><strong>
                                                <input type="text" class="campotext" name="numreg1" size="15" maxlength="15">
                                            </strong></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right"><strong>Direcci&oacute;n&nbsp; Electr&oacute;nica</strong></div>
                                        </td>
                                        <td><strong>
                                                <input name="ema" type="text" class="campotext" size="50" maxlength="50">
                                            </strong></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="right"><strong><font color="#CC0033">*</font> Documento
                                                    Identidad&nbsp; <br>
                                                    (Sin puntos, ni comas ni guiones)&nbsp;</strong></div>
                                        </td>
                                        <td><strong>
                                                <input type="text" class="campotext" name="doc" size="12" maxlength="12">
                                            </strong></td>
                                    </tr>
                                    <tr> 
                                    <td bgcolor="#F3F3F3" width="50%" height="24"> 
                                        <div align="right"><b><font color="#CC0033">*</font></b><strong>Tipo de Documento: 
                                      &nbsp; </strong></div>
                                    </td>
                                    <td bgcolor="#F3F3F3" width="50%" height="24">
                                      <select name="tip_doc" id='tip_doc' size='1' class="dato1">
                                          <option value="null" selected>Seleccione</option>
                                          <option value="TI">TI 
                                          <option value="CC">CC 
                                          <option value="CE">CE 
                                          <option value="PC">Pasaporte Colombiano 
                                          <option value="PE">Pasaporte Extranjero 
                                          <option value="CR">Contraseña Registraduría
                                      </select>
                                      </td>
                                  </tr>
                                    <tr>
                                        <td>
                                            <div align="right"><b><font color="#CC0033">*</font> T&iacute;tulo
                                                    Profesional y n&uacute;mero de acta de grado&nbsp;</b></div>
                                        </td>
                                        <td><font size="3">
                                                <input type="text" class="campotext" name="numreg" maxlength="50" size="50">
                                            </font></td>
                                    </tr>
                                </table>
                                <p align="left" class="textocom">Si al momento de hacer su solicitud de admisi&oacute;n
                                    a&uacute;n no ha obtenido su t&iacute;tulo profesional, comun&iacute;quese
                                    al tel&eacute;fono 6683600 opción 2 en el menú o al e-mail <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a>,
                                    donde lo orientar&aacute;n al respecto</p>
                                <input type="hidden" name="tipoest" value="P">

                                <p align="center">
                                    <input type="submit" value="Enviar Datos" name="B1"  class="boton">
                                </p>
                            </form>
                        </div>
                    </fieldset> </td>
            </tr>
        </table>
        <%}%>
    </body>
</html>
