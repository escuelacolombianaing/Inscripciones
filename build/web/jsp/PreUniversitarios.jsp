
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    BDadmisiones admision = new BDadmisiones();
    Vector ciud = admision.getCiudades();
    Vector profes = admision.getProfesiones();
    //HashMap[] programas = admision.getPreUniversitarios();
    HashMap[] programas = admision.getRetoALaU();
    //HashMap[] colegios = admision.getColegios();
    
    PrintWriter oout = response.getWriter();
    int i;
    String respuesta = request.getParameter("respuesta");
    //Vector plan = admision.VerificaPlan(prog);
    //String uplan = plan.elementAt(0).toString();
    configeci.configuracion confEci = new configeci.configuracion();
//  prog = (pginsc.elementAt(1).toString());
//  out.println(prog);
//   Vector plan = admision.VerificaPlan(prog);
//String uplan = plan.elementAt(0).toString();
// out.println(uplan);
/*if(pginsc.size()>0){*/
//  String tipo = (String) pginsc.elementAt(6);
%>
<html>
    <head>
        <title>Formulario de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        <script lang="javascrip">
            <%
                if(respuesta!=null){
                    %>
                        alert("<%=respuesta%>");
                    <%
                }
            %>
        </script>
        <table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
            <!-- fwtable fwsrc="encabezado.png" fwbase="encabezado.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
            <tr>
                <td><img src="img/spacer.gif" width="97" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="123" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="155" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="265" height="1" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="1" height="1" border="0" alt=""></td>
            </tr>
            <tr>
                <td rowspan="2"><img name="encabezado_r1_c1" src="img/encabezado_r1_c1.gif" width="97" height="70" border="0" alt=""></td>
                <td rowspan="2"><img name="encabezado_r1_c2" src="img/encabezado_r1_c2.gif" width="123" height="70" border="0" alt=""></td>
                <td><img name="encabezado_r1_c3" src="img/encabezado_r1_c3.gif" width="155" height="37" border="0" alt=""></td>
                <td rowspan="2"><img name="encabezado_r1_c4" src="img/encabezado_r1_c4.gif" width="265" height="70" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="1" height="37" border="0" alt=""></td>
            </tr>
            <tr>
                <td><img name="encabezado_r2_c3" src="img/encabezado_r2_c3.gif" width="155" height="33" border="0" alt=""></td>
                <td><img src="img/spacer.gif" width="1" height="33" border="0" alt=""></td>
            </tr>
        </table>
        <p><br>
            <b> </b> </p>
        <table width="796" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
                <td>
                    <div align="center"><fieldset><legend class="textocom"><b>Formulario de
                                    inscripci&oacute;n Reto a la U</b></legend></fieldset></div>
                    <form action="grabaEstudPreuni" method="post" name="forminsc" id="forminsc">
                        <table width="870" border="0" cellpadding="1" cellspacing="1" class="textocom" >
                            <tr>
                                <td colspan="4" height="22"><b><strong><font color="#990000">*</font></strong>Programa
                                        Acad&eacute;mico:
                                        <select name="id_plan" id="id_plan" class="campotext" required="">
                                            
                                            <%
                                            for (HashMap prog : programas) {
                                                %>
                                                <option value="<%=prog.get("id_plan")%>" Selected><%=prog.get("nom_prog")%></option>
                                                <%
                                            }
                                            %>
                                            <option value="" selected>Seleccione</option>
                                        </select>
                                    </b></td>
                            </tr>
                            <input type="hidden" name="id_col" id="id_col" value="0"/>
                            <tr>
                                <td colspan="4"><b>Periodo Acad&eacute;mico:&nbsp;&nbsp;&nbsp;&nbsp;<%=confEci.getPeriodo()%></b></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <hr size="2">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><strong>DATOS DEL SOLICITANTE</strong></td>
                            </tr>
                            <tr>
                                <td width="198" height="39"><strong><b><strong><font color="#990000">*</font></strong></b>Primer
                                        Apellido:</strong></td>
                                <td width="226" height="39">
                                    <input type="text" class="campotext" required="" name="ape1" id="ape1"  maxlength="20" onBlur="this.value = convertTildes(this.value);"  value="">
                                </td>
                                <td width="197" height="39"><strong><b><strong><font color="#990000">*</font></strong></b>Segundo
                                        Apellido: </strong></td>
                                <td width="222" height="39"><strong>
                                        <input type="text" required="" class="campotext" name="ape2" id="ape2" maxlength="20" onBlur="this.value = convertTildes(this.value);"  value="">
                                    </strong> </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><b><strong><font color="#990000">*</font></strong></b>Nombres:</strong></td>
                                <td colspan="3">
                                    <input type="text" required="" class="campotext" name="nombres" id="nombres" maxlength="40" onBlur="this.value = convertTildes(this.value);"  value="">
                                </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><font color="#990000">*</font> Fecha de Nacimiento:</strong></td>
                                <td colspan="3"><strong>Dia</strong>
                                    <select name="fec_nac_dia" class="campotext" required="" id="fec_nac_dia">
                                        <option value="" selected>dia</option>
                                        <option value="01">01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                        <option value="05">05</option>
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                        <option value="28">28</option>
                                        <option value="29">29</option>
                                        <option value="30">30</option>
                                        <option value="31">31</option>
                                    </select>
                                    &nbsp;&nbsp;<strong>Mes</strong>
                                    <select name="fec_nac_mes" required="" class="campotext" id="fec_nac_mes">
                                        <option value="" selected>mes</option>
                                        <option value="01">Enero</option>
                                        <option value="02">Febrero</option>
                                        <option value="03">Marzo</option>
                                        <option value="04">Abril</option>
                                        <option value="05">Mayo</option>
                                        <option value="06">Junio</option>
                                        <option value="07">Julio</option>
                                        <option value="08">Agosto</option>
                                        <option value="09">Septiembre</option>
                                        <option value="10">Octubre</option>
                                        <option value="11">Noviembre</option>
                                        <option value="12">Diciembre</option>
                                    </select>
                                    &nbsp;&nbsp;<strong>A&ntilde;o</strong>
                                    <input name="fec_nac_ano" required="" type="number" class="campotext" id="fec_nac_ano" minlength="4" maxlength="4">
                                </td>
                            </tr>
                            <tr>
                                <td width="198"><font color="#990000">*</font> <strong>Lugar de nacimiento:</strong></td>
                                <td colspan="3">
                                    <select name="ciudad_nac" class="campotext" id="ciudad_nac" required="">
                                        <option value="" selected>Seleccione</option>
                                        <%
                                            Vector detciud = new Vector();
                                            for (i = 0; i < ciud.size(); i++) {
                                                detciud = (Vector) ciud.elementAt(i);
                                        %>
                                        <option value="<%=detciud.elementAt(0)%>"><%=detciud.elementAt(1)%></option>
                                        <%
                                            }
                                        %>
                                        <option value="0">Otra</option>
                                    </select>
                                    <font size="2">&nbsp; </font> </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><b><strong><font color="#990000">*</font></strong></b>Documento
                                        de identidad:</strong></td>
                                <td width="226"><font size="2">
                                    <input name="doc_est" id="doc_est" type="number" required="" class="campotext" maxlength="20" >
                                    </font></td>
                                <td width="197"><b><strong><font color="#990000">*</font></strong>Lugar de Expedición:
                                        <input type="text" required="" class="campotext" name="lug_exp" id="lug_exp" maxlength="30" onBlur="this.value = convertTildes(this.value);">
                                    </b></td>
                                <td width="222"><b> </b> </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><font color="#990000">*</font> Tipo de documento</strong>:</td>
                                <td colspan="3"><font size="2"><b>
                                        <select name="tip_doc" id="tip_doc" class="campotext" required="">
                                            <option value="" selected>Seleccione</option>
                                            <option value="T">TI</option>
                                            <option value="C">CC</option>
                                            <option value="E">CE</option>
                                            <option value="R">RC</option>
                                        </select>
                                    </b> </font><b> </b></td>
                            </tr>
                            <tr>
                                <td colspan="4"><strong><font color="#990000">*</font> Sexo: &nbsp;&nbsp;&nbsp;<font size="2">
                                        <select name="genero" class="campotext" id="genero" required="">
                                            <option value="" selected>Seleccione</option>
                                            <option value="M">Masculino</option>
                                            <option value="F">Femenino</option>
                                        </select>
                                        </font><font color="#990000">&nbsp;&nbsp;&nbsp;*</font> Estado Civil:
                                        &nbsp;&nbsp;<font size="2">
                                        <select name="est_civ" class="campotext" id="est_civ" required="">
                                            <option value="" selected>Seleccione</option>
                                            <option value="S">Soltero(A)</option>
                                            <option value="C">Casado(A)</option>
                                            <option value="P">Separado(A)</option>
                                            <option value="V">Viudo(A)</option>
                                            <option value="U">Unión Libre</option>
                                        </select>
                                        </font></strong></td>
                            </tr>
                            <tr>
                                <td colspan="4"><strong><font color="#990000">*</font> Direcci&oacute;n
                                        correspondencia:
                                        <input name="direccion" type="text" class="campotext" id="direccion" maxlength="35" required="">
                                    </strong></td>
                            </tr>
                            <tr>
                                <td width="198"><font color="#990000">*</font> <b>Barrio</b></td>
                                <td colspan="3">
                                    <input type="text" class="campotext" name="barrio" id="barrio" required="" maxlength="49" onBlur="this.value = convertTildes(this.value);">
                                </td>
                            </tr>
                            <tr>
                                <td width="198"><font color="#990000">* </font><b>Eps</b></td>
                                <td colspan="3">
                                    <input type="text" class="campotext" name="obsv_act" id="obsv_act" maxlength="50" required="" onBlur="this.value = convertTildes(this.value);">
                                </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><font color="#990000">*</font> Ciudad:</strong></td>
                                <td colspan="3">
                                    <select name="ciudad" class="campotext" id="ciudad" required="">
                                        <option value="" selected>Seleccione</option>
                                        <%
                                            for (i = 0; i < ciud.size(); i++) {
                                                detciud = (Vector) ciud.elementAt(i);
                                        %>
                                        <option value="<%=detciud.elementAt(0)%>"><%=detciud.elementAt(1)%></option>
                                        <%
                                            }
                                        %>
                                        <option value="0">Otra</option>
                                    </select>
                                    <strong>Si es otra cual?:</strong>
                                    <input name="otr_cui" type="text" class="campotext" id="otr_cui" maxlength="12" value="">
                                </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><font color="#990000">*</font> Tel&eacute;fono:
                                    </strong></td>
                                <td width="226">
                                    <input name="telefono" type="number" class="campotext" id="telefono" maxlength="15" required="">
                                </td>
                                <td width="197"><strong><font color="#990000">*</font>Celular:
                                        <input name="celular" type="number" class="campotext" id="celular" value="" maxlength="10" required="">
                                    </strong></td>
                                <td width="222">&nbsp; </td>
                            </tr>
                            <tr>
                                <td width="198"><strong><font color="#990000">*</font> Correo electr&oacute;nico</strong></td>
                                <td width="226">
                                    <input name="correo" type="email" class="campotext" id="correo" maxlength="50" required="">
                                </td>
                                <td width="197">&nbsp;</td>
                                <td width="222">&nbsp; </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <hr size="2">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b>DATOS DEL ACUDIENTE</b></td>
                            </tr>
                            <tr>
                                <td colspan="3"><b><strong><font color="#990000">*</font></strong></b>Parentesco:
                                    <select name="parentesco" class="campotext" id="parentesco" required="">
                                        <option value="" selected>Seleccione</option>
                                        <option value="M">Madre</option>
                                        <option value="P">Padre</option>
                                        <option value="A">Abuelo(a)</option>
                                        <option value="T">Tio(a)</option>
                                        <option value="H">Hermano(a)</option>
                                        <option value="R">Primo</option>
                                        <option value="O">Otro</option>
                                        <option value="N">Ninguno</option>
                                    </select>
                                </td>
                                <td width="222">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Nombre Completo:
                                    <input class="campotext" type="text" name="nombre_acu" id="nombre_acu" maxlength="39" required="" onBlur="this.value = convertTildes(this.value);">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Documento:
                                    <input class="campotext" type="number" name="doc_acu" id="doc_acu" maxlength="12" required="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Direcci&oacute;n:
                                    <input class="campotext" type="text" name="dir_acu" id="dir_acu" maxlength="27" required="">
                                </td>
                            </tr>
                            <!-- <tr>
                                <td colspan="4">Total ingresos año anterior $
                                  <input name="campo65" type="text" class="campotext" size="15" maxlength="9" id="campo65">
                                  <strong>(Sin puntos ni comas) </strong> </td>
                                              </tr>-->
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Tel&eacute;fono
                                    de Residencia:
                                    <input class="campotext" type="number" name="tel_acu" id="tel_acu" maxlength="10" required="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><b><strong><font color="#990000">*</font></strong></b>Celular:
                                    <input class="campotext" type="number" name="cel_acu" id="cel_acu" maxlength="10" required="">
                                    E -mail:
                                    <input class="campotext" type="email" name="cor_acu" id="cor_acu" maxlength="45" required="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <hr size="2">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                            <!--   <tr>
                                <td colspan="4">Total ingresos año anterior $
                                  <input name="campo82" type="text" id="campo82" class="campotext" size="15" maxlength="9">
                                  <strong>(Sin puntos ni comas) </strong></td>
                                              </tr>-->
                            <tr>
                                <td colspan="4"><b>DOCUMENTOS ANEXOS AL FORMULARIO DE SOLICITUD </b>
                            
                                <ul>
                                    Copia diploma o acta de bachiller
                                </ul>
                                <ul>
                                    Copia documento de identidad
                                </ul>
                                <ul>
                                    Certificados de discapacidad en los casos en que aplica
                                </ul>
                                <ul>
                                    Resultados prueba saber 11 o Certificado de promedio académico si no presentaste la prueba saber 11 y te registraste bajo excepción contemplada en Decreto 532 de 2020. (Personas que tenían citación a la prueba en marzo de 2020).
                                </ul>
                             
                                    <br>
                                        <b>Enviar los documentos al correo <a href="mailto:preuniversitario@escuelaing.edu.co">preuniversitario@escuelaing.edu.co</a> , con el asunto RETO A LA U</b>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div align="left"></div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div align="center">
                                        <input name="bi" type="submit" class="boton" value="Enviar Solicitud de Admisión">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">&nbsp;</td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </body>
    <script lang="javascript">
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
    </script>
</html>
<!%
}else
response.sendRedirect("ErrorPago");
%>
