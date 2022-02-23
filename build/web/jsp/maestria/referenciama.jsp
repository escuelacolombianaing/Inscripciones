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
        String titulo = "";
        String maestria = "";
        String contacto = "";
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
    %>
    <head>
        <title>Solicitud de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge"
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

        <SCRIPT LANGUAGE="JavaScript">
            function comprueba( ) {

            var ind = document.form1.prog.selectedIndex;
            var valor;

            if (document.forms.form1.prog.options[ind].value == '0') {
            alert("Usted debe seleccionar el énfasis al cual desea inscribirse");
            return false;
            }

            if (document.forms.form1.apellido1.value == '') {
            alert("Los apellidos del aspirante no puede estar en blanco");
            return false;
            }

            if (document.forms.form1.nom.value == '') {
            alert("El nombre del aspirante no puede estar en blanco");
            return false;
            }
            if (isNaN(document.forms.form1.tel.value) || (document.forms.form1.tel.value == '')) {
            alert("Falta la informacion telefónica o el dato no es numérico");
            return false;
            }

            if (document.forms.form1.ciudad.value == '') {
            alert("Usted debe proporcionar la ciudad de donde es el número telefónico.");
            return false;
            }

            if (isNaN(document.forms.form1.doc.value) || (document.forms.form1.doc.value == '')) {
            alert("El documento de identidad no puede estar en blanco y debe ser dato numérico");
            return false;
            }

            if (document.forms.form1.numreg.value == '') {
            alert("El Título Profesional no puede estar en blanco");
            return false;
            }

            valor = document.forms.form1.ema.value;

            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)) {
            return (true);
            } else {
            alert("Error: Por favor ingrese una dirección de correo válida");
            return (false);
            }





            return true;
            }

            function convertTildes(str) {
            var out = "", flag = 0;
            for (i = 0; i < str.length; i++) {
            if ((str.charAt(i) != "í") && (str.charAt(i) != "á") && (str.charAt(i) != "é") && (str.charAt(i) != "ó") && (str.charAt(i) != "ú")
            && (str.charAt(i) != "Á") && (str.charAt(i) != "É") && (str.charAt(i) != "Í") && (str.charAt(i) != "Ó") && (str.charAt(i) != "Ú")) {
            out += str.charAt(i);
            flag = 0;
            }
            else {
            if ((flag == 0) && (str.charAt(i) == "í")) {
            out += "i";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "á")) {
            out += "a";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "é")) {
            out += "e";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "ó")) {
            out += "o";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "ú")) {
            out += "u";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "Á")) {
            out += "A";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "É")) {
            out += "E";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "Í")) {
            out += "I";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "Ó")) {
            out += "O";
            flag = 1;
            }
            if ((flag == 0) && (str.charAt(i) == "Ú")) {
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
        <%
            if (idplan.equals("332")) {
                titulo = "Inscripciones en línea Maestría en Ingeniería Electrónica";
                maestria = "Ingeniería Electrónica";
                contacto = "";
            } else if (idplan.equals("351")) {
                titulo = "Inscripciones en línea Maestría en Desarrollo y Gerencia Integral de Proyectos";
                maestria="Desarrollo y Gerencia Integral de Proyectos";
            } else if (idplan.equals("330")) {
                titulo = "Inscripciones en línea Maestría en Ingeniería Industrial";
                maestria="Ingeniería Industrial";
            }else if (idplan.equals("335")) {
                 titulo = "Inscripciones en línea Maestría en Ingeniería Eléctrica";
                maestria = "Ingeniería Eléctrica";
            }else if (idplan.equals("353")) {
                 titulo = "Inscripciones en línea Maestría en Gestión de Información";
                maestria = "Gestión de información";
            }
            else if (idplan.equals("371")) {
                 titulo = "Inscripciones en línea Maestría en Informática";
                maestria = "Informática";
            }
            else if (idplan.equals("372")) {
                 titulo = "Inscripciones en línea Maestría en Ciencias Actuariales";
                maestria = "Ciencias Actuariales";
            }else if (idplan.equals("376")) {
                 titulo = "Inscripciones en línea Maestría en Ciencia de datos";
                maestria = "Ciencia de datos";
            }
            else {
                titulo = "Inscripciones en línea Maestría en Ingeniería Civil";
                maestria = "Ingeniería Civil";
                //contacto=""
            }%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>

        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-12">
                    <table width="850" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr> 

                            <td> <fieldset><legend class="textocom"><strong>Solicitud de n&uacute;mero 
                                            de referencia de pago para hacer la inscripci&oacute;n a la Maestr&iacute;a
                                        </strong></legend>


                                    <p align="left" class="textocom">Para inscribirse
                                        a la Maestr&iacute;a en <%=maestria%> de
                                        la Escuela Colombiana de Ingenier&iacute;a Julio Garavito, por favor seleccione alguno de los énfasis,
                                        diligencie estos datos b&aacute;sicos, y tome nota del n&uacute;mero
                                        de referencia de pago de los derechos de inscripci&oacute;n que el sistema
                                        le indicar&aacute; una vez los haya enviado.
                                        <%if (idplan.equals("332")) {%>
                                        <a href="javascript:ventanaSecundaria('../../maestria/ingenieria_electronica/contacto.html')"> Contacto </a>
                                        <%} else if (idplan.equals("290")) {%>
                                        <a href="javascript:ventanaSecundaria('http://www.escuelaing.edu.co/programas/maestrias/ingenieria_civil/contacto.htm')"> Contacto </a>
                                        <%}%>

                                    <p align="center" class="textocom">
                                        Los campos marcados con un asterisco (<b><font color=#ff0000>*</font></b>)
                                        son campos obligatorios
                                        <%if (ban == 0) {
                                                out.println(
                                                        "<b><center>Las inscripciones para este programa sólo se habilitarán en las fechas programadas.<center></b>");

                                            } else {%>
                                    <form action="CapturaRefMaestria" method="post" onSubmit="return comprueba( );" name="form1" id="form1">

                                        <table width="850" class="textocom" border="0">
                                            <tr bgcolor="#F3F3F3">

                                                <% if (idplan.equals("332")) {%>

                                                <td height="25" width="387"> 
                                                    <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Modalidad</b></div>
                                                </td>

                                                <td height="25" width="353"> 
                                                    <select name="prog" class="dato" size="1">
                                                        <option value="0">seleccione</option>
                                                        <option value="332">MODALIDAD DE PROFUNDIZACIÓN</option>
                                                        <option value="333">MODALIDAD DE INVESTIGACIÓN</option>
                                                    </select>
                                                </td>


                                                <%} else if (idplan.equals("351")) {%>

                                                <td height="25" width="387"> 
                                                    <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Enfasis</b></div>
                                                </td>

                                                <td height="25" width="353"> 
                                                    <select name="prog" class="dato" size="1">
                                                        <option value="0">seleccione</option>
                                                        <option value="351">MODALIDAD DE PROFUNDIZACIÓN</option>
                                                    </select>
                                                </td>

                                                <%} else if (idplan.equals("353")) {%>

                                                <td height="25" width="387"> 
                                                    <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Enfasis</b></div>
                                                </td>

                                                <td height="25" width="353"> 
                                                    <select name="prog" class="dato" size="1">
                                                        <option value="0">seleccione</option>
                                                        <option value="353">MAESTRIA EN GESTION DE INFORMACION</option>
                                                    </select>
                                                </td>

                                                <%} else if (idplan.equals("371")) {%>

                                                <td height="25" width="387"> 
                                                    <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Enfasis</b></div>
                                                </td>

                                                <td height="25" width="353"> 
                                                    <select name="prog" class="dato" size="1">
                                                        <option value="0">seleccione</option>
                                                        <option value="371">MAESTRÍA EN INFORMÁTICA</option>
                                                    </select>
                                                </td>

                                                <%}else if (idplan.equals("372")) {%>

                                                <td height="25" width="387"> 
                                                    <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Enfasis</b></div>
                                                </td>

                                                <td height="25" width="353"> 
                                                    <select name="prog" class="dato" size="1">
                                                        <option value="0">seleccione</option>
                                                        <option value="372">MAESTRÍA EN CIENCIAS ACTUARIALES</option>
                                                    </select>
                                                </td>

                                                <%}else if (idplan.equals("330")) {%>

                                                <td height="25" width="387"> 
                                                    <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Modalidad</b></div>
                                                </td>

                                                <td height="25" width="353"> 
                                                    <select name="prog" class="dato" size="1">
                                                        <option value="0">seleccione</option>
                                                        <option value="330">MODALIDAD DE PROFUNDIZACIÓN</option>
                                                        <option value="331">MODALIDAD DE INVESTIGACIÓN</option>
                                                    </select>
                                                </td>

                                                <%} else if (idplan.equals("335")) {%>

                                                <td height="25" width="387"> 
                                                    <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Modalidad</b></div>
                                                </td>

                                                <td height="25" width="353"> 
                                                    <select name="prog" class="dato" size="1">
                                                        <option value="0">seleccione</option>
                                                        <option value="335">MODALIDAD DE PROFUNDIZACIÓN</option>
                                                        <option value="336">MODALIDAD DE INVESTIGACIÓN</option>
                                                    </select>
                                                </td>

                                                <%} else if (idplan.equals("376")) {%>

                                                <td height="25" width="387"> 
                                                    <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Modalidad</b></div>
                                                </td>

                                                <td height="25" width="353"> 
                                                    <select name="prog" class="dato" size="1">
                                                        <option value="0">seleccione</option>
                                                        <option value="376">MODALIDAD DE PROFUNDIZACIÓN</option>
                                                        <option value="377">MODALIDAD DE INVESTIGACIÓN</option>
                                                    </select>
                                                </td>

                                                <%}else {%>

                                                <td height="25" width="387"> 
                                                    <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Enfasis</b></div>
                                                </td>

                                                <td height="25" width="353"> 
                                                    <select name="prog" class="dato" size="1">
                                                        <option value="0">seleccione</option>
                                                        <option value="290">ENFASIS EN RECURSOS HIDRAULICOS Y MEDIO
                                                            AMBIENTE</option>
                                                        <option value="291">ENFASIS EN INGENIERIA ESTRUCTURAL</option>
                                                        <option value="292">ENFASIS EN INGENIERIA AMBIENTAL</option>
                                                        <option value="293">ENFASIS EN GEOTECNICA-PROFUNDIZACION</option>
                                                        <option value="294">ENFASIS EN TRANSITO Y TRANSPORTE-PROFUNDIZACION</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <%}%>
                                            <tr bgcolor="#F3F3F3">

                                                <td width="387"> 
                                                    <div align="right"><strong><b><font color="#CC0033">*</font></b>Primer
                                                            Apellido del Aspirante</strong></div>
                                                </td>

                                                <td width="353"> 
                                                    <input type="text" onBlur="this.value = convertTildes(this.value);" class="dato" name="apellido1" size="14" maxlength="14">
                                                </td>
                                            </tr>
                                            <tr bgcolor="#F3F3F3">

                                                <td width="387"> 
                                                    <div align="right"><strong><b><font color="#CC0033"> </font></b>Segundo
                                                            Apellido del Aspirante</strong></div>
                                                </td>

                                                <td width="353"><strong> 
                                                        <input type="text" onBlur="this.value = convertTildes(this.value);" class="dato" name="apellido2" size="14" maxlength="14">
                                                    </strong></td>
                                            </tr>
                                            <tr bgcolor="#F3F3F3">

                                                <td width="387"> 
                                                    <div align="right"><b><font color="#CC0033">*</font> Nombre completo
                                                            del aspirante &nbsp;</b></div>
                                                </td>                                             
                                                <td width="353"><strong> 
                                                        <input type="text" onBlur="this.value = convertTildes(this.value);" class="dato" name="nom" size="28" maxlength="28">
                                                    </strong></td>
                                            </tr>
                                            <tr bgcolor="#F3F3F3"> 
                                                <td bgcolor="#F3F3F3" width="40%" height="50"> 
                                                    <div align="right">
                                                        <p><b><font color="#CC0033">* </font>Teléfono</b></p>

                                                    </div>
                                                </td>
                                                <td bgcolor="#F3F3F3" width="60%" height="50"> 
                                                    <input type="text" class="dato1" name="tel" size="12"  >
                                                    <b>de ciudad</b> 
                                                    <input type="text" class="dato1" name="ciudad" size="15" maxlength="15"  >
                                                </td>

                                            </tr>
                                            <tr bgcolor="#F3F3F3"> 
                                                <td bgcolor="#F3F3F3" width="40%" height="50"> 
                                                    <div align="right">
                                                        <p><b><font color="#CC0033">* </font>Teléfono de oficina</b></p>

                                                    </div>
                                                </td>
                                                <td bgcolor="#F3F3F3" width="60%" height="50"> 
                                                    <input type="text" class="dato1" name="tel_ofi" size="12"  >
                                                    <b>de ciudad</b> 
                                                    <input type="text" class="dato1" name="ciudadofi" size="15" maxlength="15"  >
                                                </td>

                                            </tr>
                                            <tr bgcolor="#F3F3F3">

                                                <td width="387"> 
                                                    <div align="right"><strong>Celular </strong></div>
                                                </td>

                                                <td width="353"><strong> 
                                                        <input type="text" class="dato" name="numreg1" size="15" maxlength="15">
                                                    </strong></td>
                                            </tr>
                                            <tr bgcolor="#F3F3F3">

                                                <td width="387"> 
                                                    <div align="right"><strong>Direcci&oacute;n&nbsp; Electr&oacute;nica</strong></div>
                                                </td>

                                                <td width="353"><strong> 
                                                        <input name="ema" type="text" class="dato" size="50" maxlength="50">
                                                    </strong></td>
                                            </tr>
                                            <tr bgcolor="#F3F3F3">

                                                <td width="387"> 
                                                    <div align="right"><strong><font color="#CC0033">*</font> Documento
                                                            Identidad&nbsp; <br>
                                                            (Sin puntos, ni comas ni guiones)&nbsp;</strong></div>
                                                </td>

                                                <td width="353"><strong> 
                                                        <input type="text" class="dato" name="doc" size="12" maxlength="12">
                                                    </strong></td>
                                            </tr>
                                            <tr bgcolor="#F3F3F3">

                                                <td width="387"> 
                                                    <div align="right"><b><font color="#CC0033">*</font> T&iacute;tulo
                                                            Profesional y n&uacute;mero de acta de grado&nbsp;</b></div>
                                                </td>

                                                <td width="353"><font size="3"> 
                                                    <input type="text" class="dato" name="numreg" maxlength="50" size="50">
                                                    </font></td>
                                            </tr>
                                        </table>
                                        <p align="left" class="textocom">Si al momento de hacer su solicitud de admisi&oacute;n 
                                            a&uacute;n no ha obtenido su t&iacute;tulo profesional, comun&iacute;quese 
                                            al tel&eacute;fono 6683600 opción 2 en el menú o al e-mail <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a>, 
                                            donde lo orientar&aacute;n al respecto</p>
                                        <input type="hidden" name="tipoest" value="P">
                                        </tr>
                                        </table>

                                        <div class="row">
                                            <div class="col-xs-12 col-md-3"></div>
                                            <div class="col-xs-12 col-md-7">
                                                <div class="submit">
                                                    <input class="boton" type="submit" value="Enviar Datos" />
                                                </div>
                                            </div>

                                        </div>
                                    </form>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       

                                    <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                                    </div>
                                    </div>


                                    </div>
                                    </div>

                                    <%}%>
                                    </body>
                                    </html>
