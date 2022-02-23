<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        BDadmisiones admision = new BDadmisiones();
        Vector cupos = admision.CuposGestion();
        String dato = cupos.elementAt(0).toString();
        int total = Integer.parseInt(dato);
%>
<html>
    <head>
        <title>Formulario de Inscripci&oacute;n III Jornada en Gestión de Información</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {
                            
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
        <table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
            <!-- fwtable fwsrc="encabezado.png" fwbase="encabezado.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
            <tr>
                <td><img src="img/gestion.gif"></td>
            </tr>
          
        </table>
        <br>
        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div align="center">
                        <form action="InscribeGestion" method="post" name="forminsc" id="forminsc">
                            <% if (total < 120) {%>
                            <table width="666" border="0" cellpadding="1" cellspacing="1" class="textocom">
                                <tr>
                                    <td colspan="4" height="30">
                                        <div align="center">
                                            <p><B>III JORNADA EN GESTION DE INFORMACI&Oacute;N</B></p>
                                            <p>&nbsp;</p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="207"><strong><font color="#990000">*</font> Primer Apellido
                                    del aspirante:</strong></td>
                                    <td width="100">
                                        <input type="text" class="campotext" name="ape1"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);" >
                                    </td>
                                    <td width="226"><strong><font color="#990000">*</font> Segundo Apellido
                                    del aspirante:</strong></td>
                                    <td width="120">
                                        <input type="text" class="campotext" name="ape2"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);" >
                                    </td>
                                </tr>
                                <tr>
                                    <td width="207"><strong><font color="#990000">*</font> Nombres del
                                    aspirante:</strong></td>
                                    <td colspan="3">
                                        <input type="text" class="campotext" name="nombres"  size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);" >
                                    </td>
                                </tr>
                                <tr>
                                    <td width="207"><strong><font color="#990000">*</font> Documento
                                    de identidad:</strong></td>
                                    <td width="100"><font size="2">
                                            <input name="doc_est" type="text" class="campotext" size="18" maxlength="20" >
                                    </font></td>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3"><b><font color="#990000">*</font> Correo electr&oacute;nico:
                                            <font size="3">
                                                <input type="text" name="correo" maxlength="40" size="40" class="campotext">
                                    </font> </b></td>
                                    <td width="120"><b><font color="#990000">*</font> Tel&eacute;fono:
                                        </b><b><font size="2">
                                                <input name="telefono" type="text" class="campotext" id="telefono" size="14" maxlength="14">
                                    </font></b></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><b><font color="#990000">*</font> Instituci&oacute;n:
                                            <input type="text" name="empresa" size="60" maxlength="60">
                                    <font size="3"> </font></b></td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <div align="center"><b>CUPOS LIMITADOS</b></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <hr size="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <div align="center">
                                            <input name="bi" type="submit" class="boton" value="Enviar Inscripción" onClick="javascript: return validar();">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                </tr>
                            </table>
                            <%} else {%>

                            <center>
            No existen cupos para la inscripción a la III Jornada en gestión de 
            información.
</center>

                            <%}%>
                        </form>
                    </div>

                </td>
            </tr>
        </table>
    </body>
</html>

