<%-- 
    Document   : ProgramasCalendarios
    Created on : 1/09/2016, 04:06:32 PM
    Author     : Lucero
--%>
<%@page import="utiles.Correo"%>
<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<html>
    <% try {
            configeci.configPosgrados confEci = new configeci.configPosgrados();

            PrintWriter oout = response.getWriter();
            int ban = 0;
            String prog = "";
            BDadmisiones bd = new BDadmisiones();
            Vector posgrados = new Vector();

            Date hoy = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            Date fechafin = new Date();


    %>


    <head>
        <title>Solicitud de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/FormularioPosgrado.css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

        <SCRIPT LANGUAGE="JavaScript">
            function comprueba( ) {
            var valor;
            var ind = document.form1.prog.selectedIndex;
            if (document.forms.form1.prog.options[ind].value == '0') {
            alert("Usted debe seleccionar algún programa académico");
            return false;
            }

            if (document.forms.form1.apellido1.value == '') {
            alert("Los apellidos del aspirante no puede estar en blanco");
            return false;
            }

            if (document.forms.form1.apellido2.value == '') {
            alert("Los apellidos del aspirante no puede estar en blanco");
            return false;
            }

            if (document.forms.form1.nom.value == '') {
            alert("El nombre del aspirante no puede estar en blanco");
            return false;
            }
            if (isNaN(document.forms.form1.tel.value) || (document.forms.form1.tel.value == '')) {
            alert("Falta la información telefónica o el dato no es numérico");
            return false;
            }

            if (document.forms.form1.tel.value.length < 7) {
            alert("El número telefónico no es correcto, por favor verifiquelo.");
            document.form1.tel.style.backgroundColor = '#ffcc00';
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

        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Admisiones Posgrado" />
        </jsp:include>


        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-12">

                    <table width="850" border="0" align="left" cellpadding="0" cellspacing="0">
                        <tr>
                            <td> <fieldset><legend class="textocom"><strong>Cronograma </strong>
                                    </legend><div align="center">

                                        <p align="left" class="textocom">Seleccione el programa que desea consultar:</p>

                                        </td>
                                        </tr>
                                        </table>
                                        <p>

                                        <form action="VerificaCronograma" method="post" onSubmit="return comprueba( );" name="form1" id="form1">

                                            <table width="850" class="textocom" border="0">
                                                <tr bgcolor="#F3F3F3"> 
                                                    <td height="25"> 
                                                        <div align="right"><strong><b><font color="#CC0033">* </font></b></strong><b>Programa</b></div>
                                                    </td>
                                                    <td height="25"> 
                                                        <select name="idplan" class="dato" size="1">
                                                            <option value="0" selected>Seleccione</option>
                                                            <option value="312">Especializacion en Estructuras</option>
                                                            <option value="374">Especializaci&oacute;n en Desarrollo y Gerencia Integral de Proyectos</option>
                                                            <option value="267">Especializaci&oacute;n en Diseño Construcción y Conservación de vías</option>
                                                            <option value="313">Especializaci&oacute;n en Economía para Ingenieros</option>
                                                            <option value="373">Especializaci&oacute;n en Gerencia de Operaciones</option>
                                                            <option value="370">Especializaci&oacute;n en Gestión Integrada en Seguridad, Salud en el Trabajo, Calidad y Medio Ambiente</option>
                                                            <option value="320">Especializaci&oacute;n en Ingeniería de Fundaciones</option>    
                                                            <option value="310">Especializaci&oacute;n en Recursos Hidráulicos y Medio Ambiente</option>
                                                            <option value="309">Especializaci&oacute;n en Saneamiento Ambiental</option>
                                                            <option value="351">Maestría en Desarrollo y Gerencia Integral de Proyectos</option>
                                                            <option value="353">Maestría en Gestión de Información</option>
                                                            <option value="290">Maestría en Ingeniería Civil</option>
                                                            <option value="335">Maestría en Ingeniería Eléctrica</option>
                                                            <option value="332">Maestría en Ingeniería Electrónica</option>
                                                            <option value="330">Maestría en Ingeniería Industrial</option>
                                                            <option value="358">Maestría en Ingeniería Biomédica</option>
                                                            <option value="371">Maestría en Informática</option>
                                                            <option value="372">Maestría en Ciencias Actuariales</option>
                                                            <option value="376">Maestría en Ciencia de Datos</option>
                                                            <option value="352">Doctorado en Ingeniería</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                           
                                            <input type="hidden" name="tipoest" value="P">
                                            <div class="row">
                                                <div class="col-xs-12 col-md-3"></div>
                                                <div class="col-xs-12 col-md-7">
                                                    <div class="submit">
                                                        <input class="boton" type="submit" value="Enviar Datos" />
                                                    </div>
                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                    </div>
                                    </div>
                                    


                                    </body>
                                    </html>
                                    <%
                                        } catch (Exception e) {
                                            Correo correo = new Correo();
                                            correo.enviar("Referencia Posgrado", e.getMessage());
                                        }
                                    %>