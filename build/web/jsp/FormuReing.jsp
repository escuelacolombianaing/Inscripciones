<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@page import="utiles.Correo"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%try {
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        configeci.configuracion confeci = new configeci.configuracion();
        BDadmisiones admision = new BDadmisiones();
        Vector ciud = admision.getCiudades();
        String prog = new String(""), dirres, ciures, dirofi, ciuofi, banp = "0", banm = "0", idp = "", idm = "", vives = "", viven = "";
        StringTokenizer st;
        int i;
        String ref = request.getParameter("ref");
//String doc = request.getParameter("doc");
        String idEst = request.getParameter("idEst");
        Vector estudiante = admision.getInfoEst(idEst);
        Vector padres = admision.getPadres(idEst);
        if (estudiante.elementAt(7).equals("13")) {
            prog = "INGENIERIA CIVIL";
        }
        if (estudiante.elementAt(7).equals("14")) {
            prog = "INGENIERIA ELECTRICA";
        }
        if (estudiante.elementAt(7).equals("15")) {
            prog = "INGENIERIA DE SISTEMAS";
        }
        if (estudiante.elementAt(7).equals("16")) {
            prog = "INGENIERIA INDUSTRIAL";
        }
        if (estudiante.elementAt(7).equals("17")) {
            prog = "INGENIERIA ELECTRONICA";
        }
        if (estudiante.elementAt(7).equals("18")) {
            prog = "ECONOMIA";
        }
        if (estudiante.elementAt(7).equals("19")) {
            prog = "ADMINISTRACION";
        }
        if (estudiante.elementAt(7).equals("20")) {
            prog = "MATEMATICAS";
        }
        if (estudiante.elementAt(7).equals("260")) {
            prog = "INGENIERIA MECANICA";
        }

        if (estudiante.elementAt(7).equals("264")) {
            prog = "INGENIERIA AMBIENTAL";
        }

        if (estudiante.elementAt(7).equals("262")) {
            prog = "INGENIERIA BIOMEDICA";
        }

        String par = "";
        if (estudiante.elementAt(21).equals("M")) {
            par = "Madre";
        }
        if (estudiante.elementAt(21).equals("P")) {
            par = "Padre";
        }
        if (estudiante.elementAt(21).equals("A")) {
            par = "Abuelo(a)";
        }
        if (estudiante.elementAt(21).equals("T")) {
            par = "Tio(a)";
        }
        if (estudiante.elementAt(21).equals("H")) {
            par = "Hermano(a)";
        }
        if (estudiante.elementAt(21).equals("R")) {
            par = "Primo(a)";
        }
        if (estudiante.elementAt(21).equals("O")) {
            par = "Otro";
        }%>
<html>
    <head>
        <title>Solicitud de Seguimiento Académico</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="css/admisionFormulario.css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar( ){
            for(i=0; i<20; i++){
            document.forminsc.elements[i].style.backgroundColor= '#D8E6F1';
            }

            if ( document.forms.forminsc.campo23.value == '' ){
            alert("La información de estrato de los servicios públicos no debe estar en blanco");
            document.forminsc.campo23.style.backgroundColor= '#ffcc00';
            return false;
            }
            //document.forminsc.bi.disabled = true;
            }

            function comprueba() {
            var i, band;
            for(i=0; i<40; i++){
            document.forminsc.elements[i].style.backgroundColor= '#D8E6F1';
            }
            if(document.forminsc.medio.value == "0"){
            alert("Por favor señale el medio por el cual se entero de la ECI");
            document.forminsc.medio.style.backgroundColor= '#ffcc00';
            document.forminsc.medio.focus();
            return false;
            }
            if(document.forminsc.doc_est.value != document.forminsc.doc_est2.value){
            alert("Los números de documento no concuerdan");
            document.forminsc.doc_est.style.backgroundColor= '#ffcc00';
            document.forminsc.doc_est2.style.backgroundColor= '#ffcc00';
            document.forminsc.medio.focus();
            return false;
            }

            band = 0;
            for(i=0; i<40; i++){
            if(document.forminsc.elements[i].value == "null" || document.forminsc.elements[i].value == ""){
            if(document.forminsc.elements[i].name == "campo5" && document.forminsc.campo4.value != "0"){
            band = 1;
            }else if(document.forminsc.elements[i].name == "campo6" || document.forminsc.elements[i].name == "campo7" || document.forminsc.elements[i].name == "campo8" || document.forminsc.elements[i].name == "campo9"){
            band = 1;
            }else if(document.forminsc.elements[i].name == "campo12" && document.forminsc.campo11.value != "O"){
            band = 1;
            }else if(document.forminsc.elements[i].name == "campo15" && document.forminsc.campo14.value != "0"){
            band = 1;
            }else{
            alert("Los campos con * son obligatorios " + i);
            document.forminsc.elements[i].style.backgroundColor= '#ffcc00';
            if(i<27)
            document.getElementById("arriba").focus();
            else
            document.getElementById("campo18").focus();
            return false;
            }
            }
            }
            //document.forminsc.bi.disabled = true;
            //return false;
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
        <jsp:include page="encabezado">
            <jsp:param name="titulo" value="" />
        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-8">
                    <br>
                    
      <table width="897" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr>
                            <td>
                                <p align="center">Solicitud de Seguimiento Académico periodo <%=confeci.getPeriodo()%></p>
                                <p align="center"> <strong class="textocom">Programa: <%=prog%><br>
                                    </strong> </p>
                                <form action="GrabaEstudiante" method="post" name="forminsc" id="forminsc">
                                    
              <table width="894" border="0" cellpadding="1" cellspacing="1">
                <tr> 
                  <td colspan="4"><strong>DATOS DEL ASPIRANTE<br>
                    </strong></td>
                </tr>
                <tr> 
                  <td width="222"><strong>Nombre del aspirante:</strong></td>
                  <td colspan="3"><b><%=estudiante.elementAt(1)%></b></td>
                </tr>
                <tr> 
                  <td width="222"><strong>Documento de identidad:</strong></td>
                  <td colspan="3"> 
                    <% if ("T".equals(estudiante.elementAt(2))) {%>
                    &nbsp;&nbsp; T.I. 
                    <%}%>
                    <% if ("C".equals(estudiante.elementAt(2))) {%>
                    C.C. 
                    <%}%>
                    <% if ("CE".equals(estudiante.elementAt(2))) {%>
                    C.E. 
                    <%}%>
                    <% if ("RC".equals(estudiante.elementAt(2))) {%>
                    R.C. 
                    <%}%>
                    No. <%=estudiante.elementAt(3)%> de <%=admision.getNomCiudad(estudiante.elementAt(8).toString())%>(Si 
                    tiene que actualizar el documento de identidad, debe presentarse 
                    en la oficina de Secretar&iacute;a General con una copia de 
                    dicho documento) </td>
                </tr>
                <tr> 
                  <td width="222"><strong>Direcci&oacute;n correspondencia: </strong></td>
                  <td colspan="3"><strong> 
                    <input type="text" name="campo1" class="dato" maxlength="35" size="35" value="<%=estudiante.elementAt(4)%>">
                    </strong></td>
                </tr>
                <tr> 
                  <td width="222"><strong>Ciudad:</strong></td>
                  <td colspan="3"> <strong> 
                    <input type="text" name="campo2" class="dato1" size="21" maxlength="12" value="<%=admision.getNomCiudad(estudiante.elementAt(5).toString())%>">
                    </strong></td>
                </tr>
                <tr> 
                  <td width="222"><strong><font color="#990000">*</font> Tel&eacute;fono: 
                    </strong></td>
                  <td colspan="2"> 
                    <input type="text"  class="dato1" name="campo3" maxlength="15" size="15" value="<%=estudiante.elementAt(6)%>">
                  </td>
                  <td width="256">&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="4"> 
                    <hr size="2">
                  </td>
                </tr>
                <tr> 
                  <td colspan="4"><strong>INFORMACI&Oacute;N ECON&Oacute;MICA<br>
                    </strong></td>
                </tr>
                <tr> 
                  <td colspan="4"><strong><font color="#990000">*</font> La vivienda 
                    de habitaci&oacute;n de su hogar es:</strong> 
                    <select name="campo18" class="dato1" id="campo18">
                      <option value="1">Arriendo 
                      <option value="2" selected>Propia pagada 
                      <option value="3">Propia deuda 
                      <option value="5">Familiar 
                    </select>
                  </td>
                </tr>
                <tr>
                  <td colspan="2"> <strong>Estrato de los servicios p&uacute;blicos: 
                    <input type="text" name="campo23" size="2" maxlength="3" class="dato1" value="<%=estudiante.elementAt(27)%>">
                    </strong></td>
                </tr>
                <tr> 
                  <td colspan="4"> 
                    <hr size="2">
                  </td>
                </tr>
                <tr> 
                  <td colspan="4"><strong>DATOS DEL ACUDIENTE</strong><br>
                  </td>
                </tr>
                <tr> 
                  <td colspan="4">Parentesco <%=par%> Nombre <%=estudiante.elementAt(9)%> 
                  </td>
                </tr>
                <tr> 
                  <td colspan="4"> Direcci&oacute;n <%=estudiante.elementAt(10)%> 
                    Tel&eacute;fono <%=estudiante.elementAt(11)%> </td>
                </tr>
                <tr> 
                  <td colspan="4"><b>Persona diferente del acudiente, residente 
                    en Bogot&aacute;. </b></td>
                </tr>
                <tr> 
                  <td colspan="4">Nombre <%=estudiante.elementAt(12)%> Direcci&oacute;n 
                    <%=estudiante.elementAt(13)%><br>
                    Tel&eacute;fono <%=estudiante.elementAt(14)%> </td>
                </tr>
                <tr> 
                  <td colspan="4"> 
                    <hr size="2">
                  </td>
                </tr>
                <tr> 
                  <td colspan="4"><b>INFORMACI&Oacute;N FAMILIAR</b></td>
                </tr>
                <%
                                            for (int h = 0; h < padres.size(); h++) {
                                                Vector padre = (Vector) padres.elementAt(h);
                                                if (padre.elementAt(0).equals("P")) {
                                                    banp = "1";
                                                    idp = (String) padre.elementAt(11);
                                        %>
                <tr> 
                  <td colspan="2"><strong>Datos del Padre</strong></td>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <%
                                                vives = "";
                                                viven = "";
                                                if (padre.elementAt(10).equals("S")) {
                                                    vives = "checked";
                                                } else {
                                                    viven = "checked";
                                                }
                                            %>
                  <td colspan="4">Vive? S&iacute; 
                    <input type="radio" name="campo4" value="S" <%=vives%>>
                    No 
                    <input type="radio" name="campo4" value="N" <%=viven%>>
                    &nbsp;<br>
                    Nombre Completo: <%=padre.elementAt(1)%></td>
                </tr>
                <tr> 
                  <td width="222">Direcci&oacute;n Residencia : &nbsp;&nbsp;</td>
                  <%

                                                    st = new StringTokenizer(padre.elementAt(2).toString(), "$");
                                                    if (st.hasMoreElements()) {
                                                        dirres = st.nextToken();
                                                    } else {
                                                        dirres = "";
                                                    }
                                                    if (st.hasMoreElements()) {
                                                        ciures = st.nextToken();
                                                    } else {
                                                        ciures = "";
                                                    }
                                                    st = new StringTokenizer(padre.elementAt(4).toString(), "$");
                                                    if (st.hasMoreElements()) {
                                                        dirofi = st.nextToken();
                                                    } else {
                                                        dirofi = "";
                                                    }
                                                    if (st.hasMoreElements()) {
                                                        ciuofi = st.nextToken();
                                                    } else {
                                                        ciuofi = "";
                                                    }
                                                %>
                  <td width="305"> 
                    <input name="campo5" type="text" id="campo52" value="<%=dirres%>" size="20" maxlength="26" class="dato">
                  </td>
                  <td colspan="2">Tel&eacute;fono 
                    <input name="campo6" type="text" id="campo62" value="<%=padre.elementAt(3)%>" size="10" maxlength="15"  class="dato1">
                    &nbsp; &nbsp;&nbsp;&nbsp;Ciudad 
                    <input type="text" name="campo7" maxlength="12" size="15" class="dato1"  value="<%=ciures%>">
                  </td>
                </tr>
                <tr> 
                  <td width="222">Dirección Oficina:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;&nbsp;</td>
                  <td width="305"> 
                    <input name="campo8" type="text" id="campo82" value="<%=dirofi%>" size="20" maxlength="26"  class="dato">
                  </td>
                  <td colspan="2">Teléfono 
                    <input name="campo9" type="text" class="dato1" id="campo92" value="<%=padre.elementAt(6)%>" size="10" maxlength="15">
                    &nbsp;&nbsp;&nbsp;&nbsp; Ciudad 
                    <input type="text" name="campo10" maxlength="12" size="15" class="dato1" value="<%=ciuofi%>">
                    &nbsp; </td>
                </tr>
                <!-- <tr>
          <td colspan="4">Total ingresos año anterior $
              <input name="campo25" type="text" class="campotext" id="campo25" size="15" maxlength="15" value="<%=padre.elementAt(13)%>">
              <strong>(sin puntos ni comas)</strong></td>
          </tr>-->
                <%
                                            }
                                            if (padre.elementAt(0).equals("M")) {
                                                idm = (String) padre.elementAt(11);
                                                banm = "1";
                                                st = new StringTokenizer(padre.elementAt(2).toString(), "$");
                                                if (st.hasMoreElements()) {
                                                    dirres = st.nextToken();
                                                } else {
                                                    dirres = "";
                                                }
                                                if (st.hasMoreElements()) {
                                                    ciures = st.nextToken();
                                                } else {
                                                    ciures = "";
                                                }
                                                st = new StringTokenizer(padre.elementAt(4).toString(), "$");
                                                if (st.hasMoreElements()) {
                                                    dirofi = st.nextToken();
                                                } else {
                                                    dirofi = "";
                                                }
                                                if (st.hasMoreElements()) {
                                                    ciuofi = st.nextToken();
                                                } else {
                                                    ciuofi = "";
                                                }
                                        %>
                <tr> 
                  <td colspan="2"><strong>Datos de la Madre</strong></td>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="4">&nbsp;Vive? 
                    <%
                                                    vives = "";
                                                    viven = "";
                                                    if (padre.elementAt(10).equals("S")) {
                                                        vives = "checked";
                                                    } else {
                                                        viven = "checked";
                                                    }
                                                %>
                    Si: 
                    <input type="radio" name="campo11" value="S" <%=vives%>>
                    No: 
                    <input type="radio" name="campo11" value="N" <%=viven%>>
                    <br>
                    Nombre Completo <%=padre.elementAt(1)%></td>
                </tr>
                <tr> 
                  <td width="222">Direcci&oacute;n Residencia: &nbsp;&nbsp;</td>
                  <td width="305"> 
                    <input type="text" name="campo12" size="20" class="dato" maxlength="26" value="<%=dirres%>">
                  </td>
                  <td colspan="2">Tel&eacute;fono 
                    <input type="text" name="campo13" class="dato1" size="10" maxlength="15" value="<%=padre.elementAt(3)%>">
                    &nbsp;&nbsp;&nbsp;&nbsp; Ciudad &nbsp; <b><b> 
                    <input type="text" name="campo14" maxlength="12" size="15" class="dato1" value="<%=ciures%>">
                    </b></b>&nbsp; </td>
                </tr>
                <tr> 
                  <td width="222">Dirección Oficina:&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</td>
                  <td width="305"> 
                    <input type="text" name="campo15" class="dato" size="20" maxlength="26" value="<%=dirofi%>">
                  </td>
                  <td colspan="2">Teléfono 
                    <input type="text" name="campo16" class="dato1" size="10" maxlength="15" value="<%=padre.elementAt(6)%>">
                    &nbsp;&nbsp;&nbsp; &nbsp;Ciudad &nbsp; <b><b> 
                    <input type="text" name="campo17" maxlength="12" size="15" class="dato1" value="<%=ciuofi%>">
                    </b></b>&nbsp; </td>
                </tr>
                <!--   <tr>
          <td colspan="4">Total ingresos año anterior $
              <input name="campo27" type="text" class="campotext" id="campo27" size="15" maxlength="15" value="<%=padre.elementAt(13)%>">
              <strong>(sin puntos ni comas)</strong></td>
        </tr>-->
                <%
                                                }
                                            }
                                        %>
                <tr> 
                  <td colspan="4"> 
                    <hr size="2">
                  </td>
                </tr>
                <tr> 
                  <td colspan="4">
<input name="tipoest" type="hidden" id="tipoest" value="M">
                    <input name="docestud" type="hidden" id="docestud" value="<%=estudiante.elementAt(3)%>">
                    <input name="idp" type="hidden" id="idp" value="<%=idp%>">
                    <input name="idm" type="hidden" id="idm" value="<%=idm%>">
                    <input name="banp" type="hidden" id="banp" value="<%=banp%>">
                    <input name="banm" type="hidden" id="banm" value="<%=banm%>">
                    <input name="ref" type="hidden" id="ref" value="<%=ref%>">
                    <input name="nomest" type="hidden" id="nomest" value="<%=estudiante.elementAt(1)%>">
                    <input name="acud" type="hidden" id="acud" value="<%=estudiante.elementAt(9)%>">
                    <input name="programa" type="hidden" id="programa" value="<%=prog%>">
                    <input name="idEst" type="hidden" id="idEst" value="<%=idEst%>">
                    <div style="width: 100%;"> 
                      <center>
                        <input name="bi" type="submit" class="boton" value="Enviar" onClick="javascript: return validar();">
                      </center>
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
                </div>
            </div>
        </div>
        <div align="center">
            <div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
            </div>
        </div>
    </body>
</html>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Formulario Reingreso", e.getMessage());
    }
%>