<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            BDadmisiones admision = new BDadmisiones();
            Vector ciud = admision.getCiudades();
            Vector pais = admision.getPaises();
            Vector profes = admision.getProfesiones();
            PrintWriter oout = response.getWriter();
            int i;
            String ref = request.getParameter("ref");
            String doc = request.getParameter("doc");
            String pilo= request.getParameter("pilo");
            String colegio = request.getParameter("col");
            String prog = "";
            String idcol=request.getParameter("idcol");
            Vector pginsc = admision.getInscrito(doc, ref);
            if (pginsc.size() > 0) {

                prog = (pginsc.elementAt(1).toString());
                //  out.println(prog);
                Vector plan = admision.VerificaPlan(prog);
                String uplan = plan.elementAt(0).toString();
                // out.println(uplan);
        /*if(pginsc.size()>0){*/
                String tipo = (String) pginsc.elementAt(6);
               // String pilo=  (String) pginsc.elementAt(11);%>
<html>
    <head>
        <title>Formulario de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
           
            function validar() {
                var i, band, valor, valcorreo;
                for(i=0; i<47; i++){
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
                    document.forminsc.doc_est2.style.backgroundColor= '#ffcc00';
                    document.forminsc.doc_est2.focus();
                    return false;
                }

                if(document.forminsc.tip_doc.value == "null"){
                    alert("Por favor seleccione el tipo de documento de identificación");
                    document.forminsc.tip_doc.style.backgroundColor= '#ffcc00';
                    document.forminsc.tip_doc.focus();
                    return false;
                }

                if (document.forminsc.docicfes.value == ""){
                    alert("Por favor ingrese el documento de identificación con el que presentó el icfes");
                    document.forminsc.docicfes.style.backgroundColor= '#ffcc00';
                    document.forminsc.docicfes.focus();
                    return false;
                }

                if(isNaN(document.forminsc.docicfes.value )){
                    alert("El Número de documento con el que presentó el icfes debe ser numérico");
                    document.forminsc.docicfes.style.backgroundColor= '#ffcc00';
                    //document.getElementById("docicfes").focus();
                    return false;
                }
                
                if ( isNaN(document.forminsc.docicfes.value ) || (document.forminsc.docicfes.value == '')) {
                    alert("El documento de identidad con el que presento el icfes no puede estar en blanco y debe ser dato numérico");
                    return false;
                }


                    if (document.forminsc.campo3.value > 2018){
                     alert("Por favor verifique el año de nacimiento");
                    return false;
                }

                for(i=0; i<47; i++){
                    if(document.forminsc.elements[i].value == "null" || document.forminsc.elements[i].value == ""){
                        if(document.forminsc.elements[i].name == "campo6" || document.forminsc.elements[i].name == "campo7" || document.forminsc.elements[i].name == "campo8" || document.forminsc.elements[i].name == "campo9"){
                            band = 1;
                        }else if(document.forminsc.elements[i].name == "campo15" && document.forminsc.campo14.value != "0"){
                            band = 1;
                        }else{
                            alert("Los campos con * son obligatorios ");
                            document.forminsc.elements[i].style.backgroundColor= '#ffcc00';
                            return false;
                        }
                    }
                }

                if((document.forminsc.campo51.value == "" || document.forminsc.campo54.value == "")&&(document.forminsc.campo68.value == "" || document.forminsc.campo71.value == "") ){
                    alert("Ingrese la información de por lo menos uno de los padres");
                    return false;
                }

                if ((document.forminsc.ingresosm.value == "" && document.forminsc.ingresosp.value == "" && document.forminsc.ingresos3.value == "" )|| (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "0" ) || (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "" && document.forminsc.ingresos3.value == "" )|| (document.forminsc.ingresosm.value == "" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "" ) || (document.forminsc.ingresosm.value == "" && document.forminsc.ingresosp.value == "" && document.forminsc.ingresos3.value == "0" )|| (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "" && document.forminsc.ingresos3.value == "0" )|| (document.forminsc.ingresosm.value == "" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "0" ) || (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "" )){
                    alert("Debe registrar los ingresos de por lo menos uno de los padres o del responsable de su matrícula. ");
                    return false;
                }

                if(isNaN(document.forminsc.ingresosp.value )){
                    alert("El campo ingresos Mensuales del padre debe ser numérico");
                    document.forminsc.ingresosp.style.backgroundColor= '#ffcc00';
                    return false;
                }else{
                    for (i=0;i<document.forminsc.ingresosp.value.length;i++) {
                        if(document.forminsc.ingresosp.value.charAt(i) == '.'){
                            alert("El campo ingresos Mensuales del padre no debe contener puntos ni comas");
                            document.forminsc.ingresosp.style.backgroundColor= '#ffcc00';
                            return false;
                        }
                    }
                }


                if(isNaN(document.forminsc.ingresosm.value )){
                    alert("El campo ingresos Mensuales de la madre debe ser numérico");
                    document.forminsc.ingresosm.style.backgroundColor= '#ffcc00';
                    return false;
                }else{
                    for (i=0;i<document.forminsc.ingresosm.value.length;i++) {
                        if(document.forminsc.ingresosm.value.charAt(i) == '.'){
                            alert("El campo ingresos Mensuales de la madre no debe contener puntos ni comas");
                            document.forminsc.ingresosm.style.backgroundColor= '#ffcc00';
                            return false;
                        }
                    }
                }

                
                if(document.forminsc.pension.value >1500000){
                    if (confirm("El valor de la pensión es "+document.forminsc.pension.value+", es correcto el valor?")){
                        return true;
                    }else{
                        return false;
                    }
                }

                if (document.forminsc.campo16.value.length <  7) {
                    alert("Por favor verifique el número de teléfono e ingrese un número válido.");
                    document.forminsc.campo16.style.backgroundColor= '#ffcc00';
                    return false;
                }


                if(isNaN(document.forminsc.campo16.value )){
                    alert("El número de teléfono del aspirante debe ser  númerico");
                    document.forminsc.campo16.style.backgroundColor= '#ffcc00';
                    return false;
                }

               
                if(isNaN(document.forminsc.campo18.value )){
                    alert("El código del colegio debe ser  númerico");
                    document.forminsc.campo18.style.backgroundColor= '#ffcc00';
                    return false;
                }

                if (document.forminsc.pension.value == ""){
                    alert("Por favor ingrese el campo último valor pagado en pensión mensual")
                    document.forminsc.pension.style.backgroundColor= '#ffcc00';
                    return false;
                }

                if(isNaN(document.forminsc.pension.value )){
                    alert("El campo de Valor Mensual Pagado debe ser un número");
                    document.forminsc.pension.style.backgroundColor= '#ffcc00';
                    //   document.getElementById("pension").focus();
                    return false;
                }else{
                    for (i=0;i<document.forminsc.pension.value.length;i++) {
                        if(document.forminsc.pension.value.charAt(i) == '.'){
                            alert("En el campo Valor Mensual Pagado no coloque puntos ni comas");
                            document.forminsc.pension.style.backgroundColor= '#ffcc00';
                            //document.getElementById("pension").focus();
                            return false;
                        }
                    }
                }

                if (document.forminsc.campo41.value.length <  7) {
                    alert("Por favor verifique el número de teléfono del Acudiente e ingrese un número válido.");
                    document.forminsc.campo41.style.backgroundColor= '#ffcc00';
                    return false;
                }

                valcorreo = document.forminsc.campo17.value;

                if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valcorreo)){
                    return (true);
                } else {
                    alert("Error: Por favor ingrese una dirección de correo válida");
                    document.forminsc.campo17.style.backgroundColor= '#ffcc00';
                    return (false);
                }

               
                if((document.forminsc.campo6.value == "si") && (document.forminsc.campo7.value == "" || document.forminsc.campo8.value == "" )){
                    alert("Por favor ingrese Número de libreta militar y distrito");
                    document.forminsc.campo7.style.backgroundColor= '#ffcc00';
                    return (false);

                }
                
            }

            
         

function buscar(){
document.forminsc.action= "Colegios";
document.forminsc.method= 'POST';
document.forminsc.submit();
}

            function convertTildes(str) {
                var out = "", flag = 0;
                for (i = 0; i < str.length; i++) {
                    if ((str.charAt(i)!="í") && (str.charAt(i)!="á") && (str.charAt(i)!="é") && (str.charAt(i)!="ó") && (str.charAt(i)!="ú")
                        && (str.charAt(i)!="Á") && (str.charAt(i)!="É") && (str.charAt(i)!="Í") && (str.charAt(i)!="Ó") && (str.charAt(i)!="Ú") && (str.charAt(i)!="à") && (str.charAt(i)!="è") && (str.charAt(i)!="ì") && (str.charAt(i)!="ò") && (str.charAt(i)!="ù") 
                         && (str.charAt(i)!="À") && (str.charAt(i)!="È") && (str.charAt(i)!="Ì") && (str.charAt(i)!="Ò") && (str.charAt(i)!="Ù") && (str.charAt(i)!="ä") && (str.charAt(i)!="ë") && (str.charAt(i)!="ï") && (str.charAt(i)!="ö") && (str.charAt(i)!="ü")
                        && (str.charAt(i)!="Ä") && (str.charAt(i)!="Ë") && (str.charAt(i)!="Ï")  && (str.charAt(i)!="Ö") && (str.charAt(i)!="Ü") )  {
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
                        
                         if((flag == 0) && (str.charAt(i)=="ì")){
                            out += "i";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="à")){
                            out += "a";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="è")){
                            out += "e";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="ò")){
                            out += "o";
                            flag = 1;                   
                        }
                        if((flag == 0) && (str.charAt(i)=="ù")){
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
                        
                        if((flag == 0) && (str.charAt(i)=="À")){
                            out += "A";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="È")){
                            out += "E";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Ì")){
                            out += "I";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Ò")){
                            out += "O";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Ù")){
                            out += "U";
                            flag = 1;
                        }
                        
                        if((flag == 0) && (str.charAt(i)=="ï")){
                            out += "i";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="ä")){
                            out += "a";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="ë")){
                            out += "e";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="ö")){
                            out += "o";
                            flag = 1;                   
                        }
                        if((flag == 0) && (str.charAt(i)=="ü")){
                            out += "u";
                            flag = 1;
                        }
                        
                        if((flag == 0) && (str.charAt(i)=="Ä")){
                            out += "A";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Ë")){
                            out += "E";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Ï")){
                            out += "I";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Ö")){
                            out += "O";
                            flag = 1;
                        }
                        if((flag == 0) && (str.charAt(i)=="Ü")){
                            out += "U";
                            flag = 1;
                        }
                        
                        
                        
                        
                    }
                }
                return out;
            }
           
        </script>
    </head>

    <body>

        <% if (pginsc.elementAt(1).equals("262") && !tipo.equals("T") && !pilo.equals("S")) {%>
        <center>Usted debe diligenciar su solicitud en el siguiente link que corresponde a Ingeniería Biomédica
            <a href="http://admisiones.escuelaing.edu.co/Biomedica/">Inscripción Ingeniería Biomédica </a></center>


        <% } else {%>
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
        <br>

        <table width="731" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <fieldset><legend class="textocom"><strong>Solicitud de Admisión</strong></legend>
                        <div align="center" class="textocom"><a href="Ayuda<%=tipo%>" target="_blank"><b>&gt;&gt;Instructivo
                                    para diligenciar el Formulario&lt;&lt;</b></a></div>
                        <p class="textocom">Verifique antes de llenar la solicitud de admisi&oacute;n, si ingres&oacute; por
                            la opci&oacute;n que corresponde al tr&aacute;mite que desea realizar:</p>
                        <ul class="textocom">
                            <li class="textocom">Primer Semestre.</li>
                            <li class="textocom"> Transferencia (en caso de haber cursado estudios en otra instituci&oacute;n
                                de educaci&oacute;n superior y desea solicitar estudio de homologaci&oacute;n
                                de asignaturas). Tenga en cuenta que este proceso se realiza en fechas
                                diferentes, tiene requisitos y procedimientos diferentes a los de ingreso
                                a primer semestre. Para mayor informaci&oacute;n, consulte la opci&oacute;n
                                de transferencias en el men&uacute; de admisiones.</li>
                            <li class="textocom"> Seguimiento Académico</li>
                        </ul>
                        <p class="textocom">En caso que no corresponda, regrese al men&uacute; principal e ingrese
                            correctamente.</p>
                        <div align="center">
                            <form action="ConfirmarPregrado" method="post" name="forminsc" id="forminsc">
          <table width="708" border="0" cellpadding="1" cellspacing="1" class="textocom">
            <tr> 
              <td colspan="2"><b> <font color="#990000">*</font> Se&ntilde;ale 
                el medio por el cual se enter&oacute; y tomo la decisi&oacute;n 
                de estudiar en la Escuela Colombiana de Ingenier&iacute;a Julio 
                Garavito: </b></td>
              <td colspan="3"><b> 
                <select name="medio" class="campotext">
                  <option value="0" Selected><font size="3">Seleccione</font></option>
                  <%   Vector medios = new Vector();
                                                         Vector medio = admision.Medios();
                                                         for (int x = 0; x < medio.size(); x++) {
                                                             medios = (Vector) medio.elementAt(x);%>
                  <option value="<%=medios.elementAt(0)%>"><font size="3"><%=medios.elementAt(1)%></font></option>
                  <%}%>
                </select>
                <!-- <select name="medio" class="campotext">
                                                          <option value="0" Selected><font size="3">Seleccione</font></option>
                                                          <option value="1"><font size="3">Alumnos de la Escuela</font></option>
                                                          <option value="2"><font size="3">Exalumnos de la Escuela</font></option>
                                                          <option value="3"><font size="3">Docentes o Empleados de la
                                                          Escuela</font></option>
                                                          <option value="4"><font size="3">Boletín del ICFES</font></option>
                                                          <option value="5"><font size="3">Directorio Telefónico</font></option>
                                                          <option value="6"><font size="3">Visitas a su colegio (charlas
                                                          de orientación profesional)</font></option>
                                                          <option value="7"><font size="3">Ferias Universitarias</font></option>
                                                          <option value="8"><font size="3">Página Web de la ECI</font></option>
                                                          <option value="9"><font size="3">Directivos o profesores de
                                                          su colegio</font></option>
                                                          <option value="10"><font size="3">Aviso de prensa</font></option>
                                                          <option value="11"><font size="3">Revista Especializada en Educación
                                                          Superior</font></option>
                                                        </select>-->
                </b></td>
            </tr>
            <tr> 
              <td colspan="5"> 
                <hr size="2">
              </td>
            </tr>
            <tr> 
              <td width="101"><strong>Primer Apellido del aspirante:</strong></td>
              <td width="175"> 
                <input type="text" class="campotext" name="ape1"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(7)%>">
              </td>
              <td width="95"><strong>Segundo Apellido del aspirante:</strong></td>
              <td colspan="2"> 
                <input type="text" class="campotext" name="ape2"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(8)%>">
              </td>
            </tr>
            <tr> 
              <td width="101"><strong>Nombre del aspirante:</strong></td>
              <td colspan="4"> 
                <input type="text" class="campotext" name="nombres"  size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(9)%>">
              </td>
            </tr>
            <tr> 
              <td width="101"><strong>Documento de identidad:</strong></td>
              <td width="175"><font size="2"> 
                <input name="doc_est" type="text" class="campotext" size="18" maxlength="20" value="<%=pginsc.elementAt(3)%>">
                </font></td>
              <td width="95"><strong><font color="#990000">*</font> Confirmar 
                documento:</strong></td>
              <td colspan="2"><b> <font size="2"> 
                <input name="doc_est2" type="text" class="campotext" id="doc_est2" size="18" maxlength="20">
                </font> </b></td>
            </tr>
            <tr> 
              <td width="101"><strong><font color="#990000">*</font> Tipo de documento</strong>:</td>
              <td colspan="4"><font size="2"><b> 
                <select name="tip_doc" class="campotext">
                  <option value="null" selected>Seleccione</option>
                  <option value="T">TI 
                  <option value="C">CC 
                  <option value="E">CE 
                  <option value="R">RC 
                  <option value="N">NIUT 
                  <option value="P">Pasaporte 
                </select>
                </b> </font><b> </b></td>
            </tr>
            <tr> 
              <td width="101"><strong>Programa acad&eacute;mico:</strong></td>
              <td width="175"> 
                <%if (pginsc.elementAt(1).equals("19")) {%>
                ADMINISTRACION DE EMPRESAS 
                <% } else if (pginsc.elementAt(1).equals("18")) {%>
                
                ECONOMIA 
                <% } else if (pginsc.elementAt(1).equals("13")) {%>
                INGENIERIA CIVIL 
                <% } else if (pginsc.elementAt(1).equals("15")) {%>
                INGENIERIA DE SISTEMAS 
                <%} else if (pginsc.elementAt(1).equals("16")) {%>
                INGENIERIA INDUSTRIAL 
                <%} else if (pginsc.elementAt(1).equals("14")) {%>
                INGENIERIA ELECTRICA 
                <%} else if (pginsc.elementAt(1).equals("17")) {%>
                INGENIERIA ELECTRONICA 
                <%} else if (pginsc.elementAt(1).equals("20")) {%>
                MATEMATICAS 
                <%} else if (pginsc.elementAt(1).equals("260")) {%>
                INGENIERIA MECANICA 
                <%}%>
                
               
                
              </td>
              <%if (!tipo.equals("S")) {%>
              <td width="95"><strong>No. Registro Exámen de Estado:</strong></td>
              <td colspan="2"><%=pginsc.elementAt(4)%></td>
            </tr>
            <tr> 
              <td colspan="3"><b><font color="#990000">*</font> N&uacute;mero 
                de documento de identidad con el que present&oacute; el Ex&aacute;men 
                de Estado Icfes</b></td>
              <td colspan="2"><font size="3"> 
                <input type="text" name="docicfes" maxlength="15" size="15" class="campotext">
                </font></td>
            </tr>
            <%}%>
            <%if (tipo.equals("T")) {%>
            <tr> 
              <td colspan="5"><b>Prueba de Estado (versi&oacute;n anterior a&ntilde;o 
                2000)</b>&nbsp; (Si es su caso) <strong><b>Puntaje Total&nbsp; 
                <input name="ptotal" type="text" value="0" size="5" maxlength="10" class="campotext">
                </b></strong> <strong></strong></td>
            </tr>
            <%}%>
            <tr> 
              <td colspan="5"> 
                <hr size="2">
              </td>
            </tr>
            <tr> 
              <td colspan="5"><strong>DATOS DEL ASPIRANTE</strong></td>
            </tr>
            <tr> 
              <td width="101"><strong><font color="#990000">*</font> Fecha de 
                Nacimiento:</strong></td>
              <td colspan="2"><strong>Dia</strong> 
                <select name="campo1" class="campotext" id="campo1">
                  <option value="null" selected>dia</option>
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
                <select name="campo2" class="campotext" id="campo2">
                  <option value="null" selected>mes</option>
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
                &nbsp;&nbsp; </td>
              <td colspan="2"><strong>A&ntilde;o</strong> 
                <input name="campo3" type="text" class="campotext" id="campo3" size="5" maxlength="4">
              </td>
            </tr>
            <tr> 
              <td width="101"><font color="#990000">*</font> <strong>Ciudad de 
                nacimiento:</strong></td>
              <td colspan="2"> 
                <select name="campo4" class="campotext" id="campo4">
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
              <td width="166"> 
                <p><font color="#990000">*</font> <strong>Pa&iacute;s de nacimiento: 
                  </strong></p>
              </td>
              <td width="155"><strong> 
                <select name="campo5" class="campotext" id="campo5">
                  <option value="" selected><strong>Seleccione</strong></option>
                  <%
                                                         Vector detpais = new Vector();
                                                         for (i = 0; i < pais.size(); i++) {
                                                             detpais = (Vector) pais.elementAt(i);
                                                    %>
                  <option value="<%=detpais.elementAt(0)%>"><strong><%=detpais.elementAt(1)%></strong></option>
                  <%
                                                         }
                                                    %>
                  <option value="0"><strong>Otra</strong></option>
                </select>
                </strong></td>
            </tr>
            
            <tr> 
              <td width="101">Prest&oacute; servicio militar?</td>
              <td colspan="4">Si 
                <input type="radio" name="campo6" value="si">
                No 
                <input type="radio" name="campo6" value="no" checked>
                Libreta militar No. 
                <input name="campo7" type="text" class="campotext" id="campo7" size="10" maxlength="15">
                Distrito No.<strong> </strong> 
                <input name="campo8" type="text" class="campotext" id="campo8" size="3" maxlength="3">
                En tr&aacute;mite<strong><font size="2"> 
                <select name="campo9" class="campotext" id="campo9">
                  <option value="Si" selected>Si</option>
                  <option value="No">No</option>
                </select>
                </font></strong></td>
            </tr>
                       
            <tr> 
              <td colspan="5"><strong><font color="#990000">*</font> Sexo: <font size="2"> 
                <select name="campo10" class="campotext" id="campo10">
                  <option value="M" selected>Masculino 
                  <option value="F">Femenino 
                </select>
                </font><font color="#990000">*</font> Estado Civil: <font size="2"> 
                <select name="campo11" class="campotext" id="campo11">
                  <option value="S" selected>Soltero(A) 
                  <option value="C">Casado(A) 
                  <option value="P">Separado(A) 
                  <option value="V">Viudo(A) 
                  <option value="U">Unión Libre 
                </select>
                </font></strong></td>
            </tr>
            <tr> 
              <td colspan="5"><strong><font color="#990000">*</font> Direcci&oacute;n 
                correspondencia: 
                <input name="campo13" type="text" class="campotext" id="campo13" size="50" maxlength="35">
                </strong></td>
            </tr>
            <tr> 
              <td width="101"><strong><font color="#990000">*</font> Ciudad:</strong></td>
              <td colspan="4"> 
                <select name="campo14" class="campotext" id="campo14">
                  <option value="null" selected>Seleccione</option>
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
                <input name="campo15" type="text" class="campotext" id="campo15" maxlength="12">
              </td>
            </tr>
            <tr> 
              <td width="101"><strong><font color="#990000">*</font> Tel&eacute;fono: 
                </strong></td>
              <td width="175"> 
                <input name="campo16" type="text" class="campotext" id="campo16" maxlength="15">
              </td>
              <td width="95"><strong><font color="#990000">*</font>Celular: </strong></td>
              <td colspan="2"> 
                <input name="celular" type="text" class="campotext" id="celular" value="<%=pginsc.elementAt(10)%>" maxlength="10">
              </td>
            </tr>
            <tr> 
              <td width="101"><strong><font color="#990000">*</font> Correo electr&oacute;nico</strong></td>
              <td width="175"> 
                <input name="campo17" type="text" class="campotext" id="campo17" value="<%=pginsc.elementAt(5)%>" maxlength="30">
              </td>
              <td width="95">&nbsp;</td> 
              
              <td colspan="2">&nbsp; </td>
            </tr>
            
            <tr> 
              <td colspan="5"> 
                <hr size="2">
              </td>
            </tr>
            <tr> 
              <td colspan="5"><strong>EDUCACI&Oacute;N SECUNDARIA</strong></td>
            </tr>
            <%if (!tipo.equals("S")) {%>
            <tr> 
                
              <td colspan="2"><font color="#990000">*</font> CODIGO ICFES COLEGIO:</td>
              <td colspan="2"> 
                <p> 
                  <input name="campo18" type="text" class="campotext"  maxlength="12" value="">
                   
                  <!--%if ( idcol != null ) {%>
                  <input name="campo18" type="text" class="campotext" value="<!%=idcol%>">
                  <input type="submit" name="colegio" value="Buscar"  onClick="javascript: return buscar()">
                  <input name="colegio2" type="text"  maxlength="50" value="<!%=colegio%>" size="50">
                                                     
                  <!%} else {%>
                   <input name="campo18" type="text" class="campotext" value="">
                  <input type="submit" name="colegio" value="Buscar"  onClick="javascript: return buscar()">
                  <input name="colegio2" type="text"  maxlength="50" value="" size="50">
                  <!}%-->
                </p>
                </td>
				
		<!--onClick="window.open('http://www.icfesinteractivo.gov.co/Clasificacion/','','width=630,height=350,-->		
              <td width="155"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/Basecolegios.xls"><strong>Ver 
                Ayuda</strong></a> </td>
            </tr>
            <%}%>
            <tr> 
              <td colspan="2" height="42"> 
                <p><font color="#990000">*</font> Fecha de grado:</p>
                <p align="center"> Mes 
                  <select name="campo19" class="campotext" id="campo19">
                    <option value="null" selected>mes</option>
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
                  A&ntilde;o 
                  <input name="campo20" type="text" class="campotext" id="campo20" size="4" maxlength="4">
                </p>
              </td>
              <td colspan="3" height="42">Obtuvo validaci&oacute;n del bachillerato 
                con el ICFES? 
                <select name="campo21" class="campotext" id="campo21">
                  <option value="N" selected>No 
                  <option value="S">Si 
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="5"><strong><font color="#990000">*</font> </strong><b>Ultimo 
                valor pagado en pensi&oacute;n mensual del colegio(en pesos, sin 
                puntos ni comas): </b><strong> 
                <input type="text" name="pension" size="8" maxlength="8">
                </strong></td>
            </tr>
            <%if (tipo.equals("T") ) {%>
            <tr> 
              <td colspan="5"><strong>TRANSFERENCIA</strong></td>
            </tr>
            <tr> 
              <td width="101">Universidad de procedencia:</td>
              <td colspan="4"> 
                <select name="uproc" id="uproc" class="campotext">
                  <option value="null" selected>SELECCIONE</option>
                  <option value="1">Escuela De Ingeniería de Antioquia Antioquia</option>
                  <option value="2">Instituto Tecnológico Metropolitano Antioquia</option>
                  <option value="3">Universidad CES Antioquia</option>
                  <option value="4">Universidad De Antioquia</option>
                  <option value="5">Universidad De Medellín</option>
                  <option value="6">Universidad Eafit Antioquia</option>
                  <option value="7">Universidad Pontificia Bolivariana Antioquia</option>
                  <option value="8">Escuela Naval de Suboficiales ARC Barranquilla</option>
                  <option value="9">Universidad del Norte Atlántico</option>
                  <option value="10">Colegio Mayor De Nuestra Señora del Rosario</option>
                  <option value="11">Dirección Nacional de Escuelas</option>
                  <option value="12">Universidad de La Salle</option>
                  <option value="13">Universidad de Los Andes</option>
                  <option value="14">Universidad EAN</option>
                  <option value="15">Universidad Externado de Colombia</option>
                  <option value="16">Universidad Javeriana</option>
                  <option value="17">Universidad Jorge Tadeo Lozano</option>
                  <option value="18">Universidad Nacional de Colombia</option>
                  <option value="19">Universidad Santo Tomás</option>
                  <option value="20">Universidad Sergio Arboleda</option>
                  <option value="21">Fundación Tecnológica Antonio De Arévalo</option>
                  <option value="22">Universidad de Cartagena</option>
                  <option value="23">Universidad Tecnológica de Bolívar</option>
                  <option value="24">Universidad Pedagógica y Tecnológica De Colombia</option>
                  <option value="25">Universidad de Caldas</option>
                  <option value="26">Universidad del Cauca</option>
                  <option value="27">Escuela De Suboficiales De La Fuerza Aérea Colombiana Andrés M. Díaz</option>
                  <option value="28">Universidad de La Sabana</option>
                  <option value="29">Universidad Tecnológica de Pereira</option>
                  <option value="30">Universidad Autónoma de Bucaramanga</option>
                  <option value="31">Universidad Industrial de Santander</option>
                  <option value="32">Universidad Autónoma de Occidente</option>
                  <option value="33">Universidad del Valle</option>
                  <option value="34">Universidad Icesi</option>
                  <option value="35">Universidad Javeriana Cali</option>
                  <option value="36">Otra</option>
                 
                </select>
              </td>
            </tr>
            <%  } %>
            <tr> 
              <td colspan="5">&nbsp; </td>
            </tr>
            <tr> 
              <td colspan="5"><strong>INFORMACI&Oacute;N FAMILIAR Y ECON&Oacute;MICA</strong></td>
            </tr>
            <tr> 
              <td colspan="2"><strong>Composici&oacute;n Familiar</strong></td>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="5"><strong><font color="#990000">*</font> </strong>Padre 
                y madre unidos<strong> 
                <input name="campo22" type="radio" value="2" checked>
                </strong>Padres separados<strong> 
                <input type="radio" name="campo22" value="3">
                </strong>Padres viudos <strong> 
                <input type="radio" name="campo22" value="5">
                </strong>Padres sin sociedad conyugal <strong> 
                <input type="radio" name="campo22" value="10">
                </strong></td>
            </tr>
            <!-- <tr>
                                      <td colspan="4"><strong><font color="#990000">*</font> Valor mensual
                                        pagado en el &uacute;ltimo a&ntilde;o de estudios en colegio:
                                        Si usted realiz&oacute; un solo pago en el a&ntilde;o div&iacute;dalo
                                        por 10 y el resultado reg&iacute;strelo en la casilla de valor</strong></td>
                                    </tr>
                                    <tr>
                                      <td colspan="4">Valor $<strong> </strong> <strong>(Sin puntos ni
                                        <input name="campo26" type="text" class="campotext" id="campo26" maxlength="7">
                                        comas) </strong>Fecha de pago Mes
                                        <select name="mes" class="campotext" id="select2">
                                          <option value="null" selected>mes</option>
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
                                        A&ntilde;o
                                        <input name="campo27" type="text" class="campotext" id="campo27" size="4" maxlength="4">
                                      </td>
                                    </tr>
                                    <tr>
                                      <td height="15" colspan="4"><b>Valor pagado por matr&iacute;cula
                                        en el &uacute;ltimo semestre</b> (Si es su caso)</td>
                                    </tr>
                                    <tr>
                                      <td colspan="4">Fecha del &uacute;ltimo pago (dd-mm-aaaa)
                                        <input name="campo28" type="text" class="campotext" size="25" maxlength="25">
                                        Valor $
                                        <input name="campo29" type="text" class="campotext" value="0" size="10" maxlength="8">
                                        <strong>(Sin puntos ni comas) </strong> </td>
                                                            </tr>-->
            <tr> 
              <td colspan="5"><strong><font color="#990000">*</font> La vivienda 
                de habitaci&oacute;n de su hogar es:</strong> 
                <select name="campo30" class="campotext" id="campo30">
                  <option value="1">Arriendo 
                  <option value="2" selected>Propia pagada 
                  <option value="3">Propia deuda 
                  <option value="5">Familiar 
                </select>
                <strong>Estrato de los servicios p&uacute;blicos: 
                <input name="campo35" type="text" class="campotext" id="campo35" size="3" maxlength="2">
                </strong></td>
            </tr>
            <tr> 
              <td colspan="5"> 
                <hr size="2">
              </td>
            </tr>
            <tr> 
              <td colspan="5"><strong>DATOS DEL ACUDIENTE</strong> (Preferiblemente 
                el padre o la madre)</td>
            </tr>
            <tr> 
              <td colspan="5"><font color="#990000">*</font> Parentesco 
                <select name="campo37" class="campotext" id="campo37">
                  <option value="null" selected>Seleccione</option>
                  <option value="M">Madre</option>
                  <option value="P">Padre</option>
                  <option value="A">Abuelo(a)</option>
                  <option value="T">Tio(a)</option>
                  <option value="H">Hermano(a)</option>
                  <option value="R">Primo</option>
                  <option value="O">Otro</option>
                  <option value="N">Ninguno</option>
                </select>
                Nombre Completo 
                <input name="campo38" type="text" class="campotext" id="campo38" onBlur="this.value = convertTildes(this.value);" size="25" maxlength="35">
                C.C. No. 
                <input name="campo39" type="text" class="campotext" size="10" maxlength="10">
              </td>
            </tr>
            <tr> 
              <td colspan="5"><font color="#990000">*</font> Direcci&oacute;n 
                <input name="campo40" type="text" class="campotext" id="campo40" size="25" maxlength="35">
                Tel&eacute;fono 
                <input name="campo41" type="text" class="campotext" id="campo41" size="10" maxlength="20">
                Ciudad 
                <input name="campo42" type="text" class="campotext" id="campo42" size="15" maxlength="15">
              </td>
            </tr>
            <tr> 
              <td colspan="5"> <font color="#990000">*</font> Correo Electr&oacute;nico: 
                <input name="emailacud" type="text" class="campotext" id="emailacud" maxlength="30">
              </td>
            </tr>
            <tr> 
              <td colspan="5"><b>Persona diferente del acudiente, residente en 
                Bogot&aacute;. D. C. (Con tel&eacute;fono diferente)</b></td>
            </tr>
            <tr> 
              <td colspan="5">Nombre completo 
                <input name="campo43" type="text" class="campotext" onBlur="this.value = convertTildes(this.value);" size="25" maxlength="35">
                Direcci&oacute;n 
                <input name="campo44" type="text" class="campotext" size="25" maxlength="35">
                Tel&eacute;fono 
                <input name="campo45" type="text" class="campotext" size="10" maxlength="20">
              </td>
            </tr>
            <tr> 
              <td colspan="5"> 
                <hr size="2">
              </td>
            </tr>
            <tr> 
              <td colspan="5"><b>INFORMACI&Oacute;N ACERCA DE LOS HERMANOS QUE 
                ACTUALMENTE ESTUDIAN EN LA ESCUELA COLOMBIANA DE INGENIERIA</b></td>
            </tr>
            <tr> 
                
              <td colspan="2">Apellidos y Nombres</td>
              <td colspan="3">N&uacute;mero de carnet estudiantil de la Escuela 
                Col de Ingenier&iacute;a</td>
            </tr>
            <tr> 
              <td colspan="2"> 
                <input name="campo46" type="text" class="campotext" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
              </td>
              <td colspan="3"> 
                <input name="campo47" type="text" class="campotext" id="campo47" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
              </td>
            </tr>
            <tr> 
              <td colspan="2"> 
                <input name="campo48" type="text" class="campotext" id="campo48" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
              </td>
              <td colspan="3"> 
                <input name="campo49" type="text" class="campotext" id="campo49" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
              </td>
            </tr>
            <tr> 
              <td colspan="5"><font color="#990000">*</font> Usted ingresar&aacute; 
                simult&aacute;neamente con un hermano? &nbsp;&nbsp;<b>Si 
                <input type="radio" name="simultaneo" value="S">
                &nbsp;&nbsp;No 
                <input type="radio" name="simultaneo" value="N" checked>
                </b></td>
            </tr>
            <tr> 
              <td colspan="2">Apellidos y Nombres</td>
              <td width="95">Documento</td>
              <td colspan="2"> 
                <input name="docher" type="text" class="campotext" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
              </td>
            </tr>
            <tr> 
              <td colspan="3"> 
                <input name="hermano" type="text" class="campotext"  onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
              </td>
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="5"> 
                <hr size="2">
              </td>
            </tr>
            <tr> 
              <td colspan="5"><b>INFORMACI&Oacute;N FAMILIAR</b></td>
            </tr>
            <tr> 
              <td colspan="2"><strong>Acerca del Padre</strong></td>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="5">Vive? S&iacute; 
                <input type="radio" name="campo50" value="S" checked>
                No 
                <input type="radio" name="campo50" value="N">
                &nbsp;&nbsp;Nombre Completo 
                <input name="campo51" type="text" class="campotext" value="" size="30" maxlength="40">
              </td>
            </tr>
            <tr> 
              <td colspan="5">Direcci&oacute;n Residencia 
                <input name="campo53" type="text" class="campotext" value="" size="20" maxlength="27">
                &nbsp;&nbsp;Tel&eacute;fono 
                <input name="campo54" type="text" class="campotext" value="" size="10" maxlength="20">
                &nbsp;&nbsp; Ciudad 
                <input name="campo55" type="text" class="campotext" value="" size="15" maxlength="9">
              </td>
            </tr>
            <tr> 
              <td colspan="5">Educaci&oacute;n 
                <select name="campo56" size="1" class="campotext">
                  <option value="X" selected>Seleccione 
                  <option value="P">Primaria 
                  <option value="S">Secundaria 
                  <option value="U">Universitaria 
                  <option value="E">Estudiante Universitario 
                  <option value="T">T&eacute;cnico 
                  <option value="L">Tecn&oacute;logo 
                </select>
                &nbsp;&nbsp;Profesi&oacute;n 
                <select name="campo57" size="1" class="campotext">
                  <option value="0" selected>Seleccione</option>
                  <%
                                                     Vector profesion = new Vector();
                                                     for (i = 0; i < profes.size(); i++) {
                                                         profesion = (Vector) profes.elementAt(i);
                                                %>
                  <option value="<%=profesion.elementAt(0)%>"><%=profesion.elementAt(1)%></option>
                  <%
                                                     }
                                                %>
                </select>
                &nbsp; Celular 
                <input name="celularp" type="text" class="campotext" value="" size="10" maxlength="10">
              </td>
            </tr>
            <tr> 
              <td colspan="5"><b>Ocupaci&oacute;n Actual</b></td>
            </tr>
            <tr> 
              <td colspan="5"> 
                <select name="campo58" size="1" class="campotext">
                  <option value="9">Empleado</option>
                  <option value="5">Empresario</option>
                  <option value="7">Trabajo Independiente</option>
                  <option value="6">Profesional Independiente</option>
                  <option value="15">Pensionado</option>
                  <option value="4">Hogar</option>
                  <option value="0" selected>Otro</option>
                </select>
                &nbsp;&nbsp;Entidad donde labora 
                <input name="campo59" type="text" class="campotext" size="20" maxlength="50">
                &nbsp;&nbsp;Cargo 
                <input name="campo60" type="text" class="campotext" size="20" maxlength="20">
              </td>
            </tr>
            <tr> 
              <td colspan="2">Antiguedad (n&uacute;mero de meses) 
                <input type="text" name="antiguedadp" size="5" maxlength="5">
              </td>
              <td colspan="3">&nbsp;</td>
            <tr> 
              <td colspan="3">Ingresos mensuales(en pesos sin puntos ni comas)</td>
              <td colspan="2"> 
                <input type="text" name="ingresosp" size="8" maxlength="8">
              </td>
            </tr>
        
            <tr> 
              <td colspan="5">Dirección 
                <input name="campo62" type="text" class="campotext" size="15" maxlength="27">
                &nbsp;&nbsp;Teléfono 
                <input name="campo63" type="text" class="campotext" size="10" maxlength="20">
                &nbsp;&nbsp;Ciudad &nbsp; 
                <input name="campo64" type="text" class="campotext" size="15" maxlength="9">
                &nbsp; </td>
            </tr>
            <tr> 
              <td colspan="2">Direcci&oacute;n de correo electr&oacute;nico</td>
              <td colspan="3"> 
                <input type="text" name="correop" size="50" maxlength="50">
              </td>
            </tr>
            <!-- <tr>
                                      <td colspan="4">Total ingresos año anterior $
                                        <input name="campo65" type="text" class="campotext" size="15" maxlength="9" id="campo65">
                                        <strong>(Sin puntos ni comas) </strong> </td>
                                                            </tr>-->
            <tr> 
              <td colspan="2"><strong>Acerca de la Madre</strong></td>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="5">&nbsp;Vive? S&iacute; 
                <input type="radio" name="campo67" value="S" checked>
                No 
                <input type="radio" name="campo67" value="N">
                &nbsp;&nbsp;Nombre Completo 
                <input name="campo68" type="text" class="campotext" value="" size="30" maxlength="40">
              </td>
            </tr>
            <tr> 
              <td colspan="5">Direcci&oacute;n Residencia 
                <input name="campo70" type="text" class="campotext" value="" size="25" maxlength="27">
                &nbsp;&nbsp;Tel&eacute;fono 
                <input name="campo71" type="text" class="campotext" value="" size="10" maxlength="20">
                &nbsp;&nbsp;&nbsp; <b><b> </b></b>&nbsp; Ciudad <b><b> 
                <input name="campo72" type="text" class="campotext" value="" size="15" maxlength="9">
                </b></b><b><b> </b></b></td>
            </tr>
            <tr> 
              <td colspan="5">Educaci&oacute;n 
                <select name="campo73" size="1" class="campotext" id="campo73">
                  <option value="X" selected>Seleccione 
                  <option value="P">Primaria 
                  <option value="S">Secundaria 
                  <option value="U">Universitaria 
                  <option value="E">Estudiante Universitario 
                  <option value="T">T&eacute;cnico 
                  <option value="L">Tecn&oacute;logo 
                </select>
                &nbsp;&nbsp; &nbsp;&nbsp;Profesi&oacute;n 
                <select name="campo74" size="1" class="campotext">
                  <option value="0" selected>Seleccione</option>
                  <%
                                                     profesion = new Vector();
                                                     for (i = 0; i < profes.size(); i++) {
                                                         profesion = (Vector) profes.elementAt(i);
                                                %>
                  <option value="<%=profesion.elementAt(0)%>"><%=profesion.elementAt(1)%></option>
                  <%
                                                     }
                                                %>
                </select>
                &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Celular <b><b> 
                <input name="celularm" type="text" class="campotext" value="" size="10" maxlength="10">
                </b></b></td>
            </tr>
            <tr> 
              <td colspan="5"><strong>Ocupaci&oacute;n Actual</strong></td>
            </tr>
            <tr> 
              <td colspan="5"> 
                <select name="campo75" size="1" class="campotext">
                  <option value="9">Empleado</option>
                  <option value="5">Empresario</option>
                  <option value="7">Trabajo Independiente</option>
                  <option value="6">Profesional Independiente</option>
                  <option value="15">Pensionado</option>
                  <option value="4">Hogar</option>
                  <option value="0" selected>Otro</option>
                </select>
                &nbsp;&nbsp;Entidad donde labora 
                <input name="campo76" type="text" class="campotext" size="20" maxlength="50">
                &nbsp;&nbsp;Cargo 
                <input name="campo77" type="text" class="campotext" size="20" maxlength="20">
              </td>
            </tr>
            <tr> 
              <td colspan="5">Antiguedad (n&uacute;mero de meses) 
                <input type="text" name="antiguedadm" size="5" maxlength="5">
              </td>
            </tr>
            <tr> 
              <td colspan="3">Ingresos mensuales(en pesos sin puntos ni comas)</td>
              <td colspan="2"> 
                <input type="text" name="ingresosm" size="8" maxlength="8">
              </td>
            </tr>
            <tr> 
              <td colspan="5">Dirección 
                <input name="campo79" type="text" class="campotext" size="15" maxlength="27">
                &nbsp;&nbsp;Teléfono 
                <input name="campo80" type="text" class="campotext" size="10" maxlength="20">
                &nbsp;&nbsp;Ciudad &nbsp; <b><b> 
                <input name="campo81" type="text" class="campotext" size="15" maxlength="9">
                </b></b>&nbsp; </td>
            </tr>
            <tr> 
              <td colspan="3">Direcci&oacute;n de correo electr&oacute;nico:</td>
              <td colspan="2"> 
                <input type="text" name="correom" size="50" maxlength="50">
              </td>
            </tr>
            <!--   <tr>
                                      <td colspan="4">Total ingresos año anterior $
                                        <input name="campo82" type="text" id="campo82" class="campotext" size="15" maxlength="9">
                                        <strong>(Sin puntos ni comas) </strong></td>
                                                            </tr>-->
            <tr> 
              <td colspan="5"><font color="#990000">*</font> Alguno de sus padres 
                es egresado de la Escuela Colombiana de Ingenier&iacute;a &nbsp;&nbsp;<b> 
                <select name="egresado">
                  <option value="P" >Padre 
                  <option value="M">Madre 
                  <option value="A">Ambos Padres 
                  <option value="N" selected>Ninguno 
                </select>
                </b></td>
            </tr>
            <tr> 
              <td colspan="5"> <b>Si hay un tercer responsable de su matr&iacute;cula 
                por favor registre los ingresos mensuales (en pesos sin puntos 
                ni comas): </b> 
                <input type="text" name="ingresos3" size="8" maxlength="8">
              </td>
            </tr>
            <tr> 
              <td colspan="5"> 
                <hr size="2">
              </td>
            </tr>
            <tr> 
              <td colspan="5"> 
                <div align="center"><b>Me someto a la MATR&Iacute;CULA M&Aacute;XIMA 
                  y, por lo tanto, declaro que no presento los documentos que 
                  acrediten el ingreso familiar. &nbsp;&nbsp;Si 
                  <input type="radio" name="campo101" value="S">
                  &nbsp;&nbsp;No 
                  <input type="radio" name="campo101" value="N" checked>
                  </b></div>
                <br>
              </td>
            </tr>
            <tr> 
              <td colspan="5"> 
                <div align="left"><b> 
                  <!--Declaramos expresamente que la informaci&oacute;n
                                                                                      aqu&iacute; consignada es cierta y autorizamos su verificaci&oacute;n.
                                                                                      <br>
                                                                                      En el caso de encontrar falsedad de los datos consignados, esta
                                                                                      solicitud se anular&aacute;.-->
                  La Escuela se reserva el derecho de verificar la información 
                  y los documentos presentados por el aspirante para la liquidación 
                  del valor de la matrícula a través de visitas domiciliarias 
                  u otros mecanismos. Cualquier inexactitud en la información 
                  presentada, podrá dar lugar inicialmente a la revisión del valor 
                  de la matrícula o eventualmente a la anulación de la admisión.</b></div>
              </td>
            </tr>
            <tr> 
              <td colspan="5"> 
                <div align="center"> 
                  <input name="tipoest" type="hidden" id="tipoest" value="<%=pginsc.elementAt(6)%>">
                  <input name="numreg" type="hidden" id="numreg" value="<%=pginsc.elementAt(4)%>">
                  <input name="nom_est" type="hidden" id="nom_est" value="<%=pginsc.elementAt(2)%>">
                  <input name="ref" type="hidden" id="ref" value="<%=pginsc.elementAt(0)%>">
                  <input name="celular" type="hidden" id="celular" value="<%=pginsc.elementAt(10)%>">
                  <input name="programa" type="hidden" id="programa" value="<%=pginsc.elementAt(1)%>">
                  <input name="interes" type="hidden" id="interes" value="">
                  <input name="uplan" type="hidden" id="uplan" value="<%=uplan%>">
                  <input name="pilo" type="hidden" id="uplan" value="<%=pilo%>">
                  <input name="bi" type="submit" class="boton" value="Enviar Solicitud de Admisión" onClick="javascript: return validar();">
                </div>
              </td>
            </tr>
            <tr> 
              <td colspan="5">&nbsp;</td>
            </tr>
          </table>
        </form>
                              
                        </div>
                    </fieldset>
                </td>
            </tr>
        </table>
        
<hr size="2">
<%}%>
    </body>
</html>
<%
            } else
                response.sendRedirect("ErrorPago");
%>
