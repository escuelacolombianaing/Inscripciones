<%@page import="utiles.Correo"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
try{
HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        BDadmisiones admision = new BDadmisiones();
        Vector ciud = admision.getCiudades();
        Vector profes = admision.getProfesiones();
        int i;
        String ref = request.getParameter("ref");
        String doc = request.getParameter("doc_est");
        String tipoest = request.getParameter("tipoest");
        String programa = request.getParameter("programa");
        String tipdoc = request.getParameter("tip_doc");
        String numreg = request.getParameter("numreg");
        String docicfes = request.getParameter("docicfes");
        String estado = request.getParameter("estado");
        String celular = request.getParameter("celular");
        String egresado = request.getParameter("egresado");
        String simultaneo = request.getParameter("simultaneo");
        String celularp = request.getParameter("celularp");
        String celularm = request.getParameter("celularm");
        String nom_est = request.getParameter("nombres").toString();
        String ape1 = request.getParameter("ape1");
        String ape2 = request.getParameter("ape2");
        String docher = request.getParameter("docher");
        String hermano = request.getParameter("hermano");
        String interes = request.getParameter("interes");
        String ingresosm = request.getParameter("ingresosm");
        String ingresosp = request.getParameter("ingresosp");
        String ingresos3 = request.getParameter("ingresos3");
        String correom = request.getParameter("correom");
        String correop = request.getParameter("correop");
        String antiguedadp = request.getParameter("antiguedadp");
        String antiguedadm = request.getParameter("antiguedadm");
        String pension = request.getParameter("pension");
        String medio = request.getParameter("medio");
        String campo1 = request.getParameter("campo1");
        String campo2 = request.getParameter("campo2");
        String campo3 = request.getParameter("campo3");
        String campo4 = request.getParameter("campo4");
        String campo5 = request.getParameter("campo5");
        String campo6 = request.getParameter("campo6");
        String campo7 = request.getParameter("campo7");
        String campo8 = request.getParameter("campo8");
        String campo9 = request.getParameter("campo9");
        String campo10 = request.getParameter("campo10");
        String campo11 = request.getParameter("campo11");
        String campo13 = request.getParameter("campo13");
        String campo14 = request.getParameter("campo14");
        String campo15 = request.getParameter("campo15");
        String campo16 = request.getParameter("campo16");
        String campo17 = request.getParameter("campo17");
        String campo18 = request.getParameter("campo18");
        String campo19 = request.getParameter("campo19");
        String campo20 = request.getParameter("campo20");
        String campo21 = request.getParameter("campo21");
        String familia = request.getParameter("campo22");
        String estrato = request.getParameter("campo35");
        String vivienda = request.getParameter("campo30");
        String campo35 = request.getParameter("campo35");
        String emailacud = request.getParameter("emailacud");
        String campo38 = request.getParameter("campo38");
        String parentesco = request.getParameter("campo37");
        String cedulaacud = request.getParameter("campo39");
        String diracud = request.getParameter("campo40");
        String telacud = request.getParameter("campo41");
        String ciudad = request.getParameter("campo42");
        String campo43 = request.getParameter("campo43");
        String telotro = request.getParameter("campo44");
        String campo45 = request.getParameter("campo45");
        String campo46 = request.getParameter("campo46");
        String campo47 = request.getParameter("campo47");
        String campo48 = request.getParameter("campo48");
        String campo49 = request.getParameter("campo49");
        String campo50 = request.getParameter("campo50");
        String campo51 = request.getParameter("campo51");
        String campo53 = request.getParameter("campo53");
        String campo54 = request.getParameter("campo54");
        String campo55 = request.getParameter("campo55");
        String campo56 = request.getParameter("campo56");
        String campo57 = request.getParameter("campo57");
        String campo58 = request.getParameter("campo58");
        String campo59 = request.getParameter("campo59");
        String campo60 = request.getParameter("campo60");
        String campo61 = request.getParameter("campo61");
        String campo62 = request.getParameter("campo62");
        String campo63 = request.getParameter("campo63");
        String campo64 = request.getParameter("campo64");
        String campo67 = request.getParameter("campo67");
        String campo68 = request.getParameter("campo68");
        String campo69 = request.getParameter("campo68");
        String campo70 = request.getParameter("campo70");
        String campo71 = request.getParameter("campo71");
        String campo72 = request.getParameter("campo72");
        String campo73 = request.getParameter("campo73");
        String campo74 = request.getParameter("campo74");
        String campo75 = request.getParameter("campo75");
        String campo76 = request.getParameter("campo76");
        String campo77 = request.getParameter("campo77");
        String campo78 = request.getParameter("campo78");
        String campo79 = request.getParameter("campo79");
        String campo80 = request.getParameter("campo80");
        String campo81 = request.getParameter("campo81");
        String campo101 = request.getParameter("campo101");
        String uproc = request.getParameter("uproc");
        String uplan = request.getParameter("uplan");
        String pilo = request.getParameter("pilo");
       Vector colegios = admision.Colegios(campo18) ;
       if  (colegios.size()>0) {
           campo18= colegios.elementAt(1).toString();
       }
%>

<html>
    <head>
        <title>Formulario de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {
                var i, band, valor, valcorreo;
                var variable=document.forminsc.pension2.value;
                             
                if(variable == ""){
                    alert("Por favor ingrese el valor mensual de la pensi�n este campo no debe estar en blanco");
                    return false;
                }

                   if(isNaN(document.forminsc.pension2.value )){
                    alert("El campo de Valor Mensual Pagado debe ser un n�mero");
                    return false;
                }else{
                    for (i=0;i<document.forminsc.pension2.value.length;i++) {
                        if(document.forminsc.pension2.value.charAt(i) == '.'){
                            alert("En el campo Valor Mensual Pagado no coloque puntos ni comas");
                            return false;
                        }
                    }
                }

                
                 if ((document.forminsc.ingresosm2.value == "" && document.forminsc.ingresosp2.value == "" && document.forminsc.ingresosotro.value == "" )|| (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "0" ) || (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "" && document.forminsc.ingresos3.value == "" )|| (document.forminsc.ingresosm.value == "" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "" ) || (document.forminsc.ingresosm.value == "" && document.forminsc.ingresosp.value == "" && document.forminsc.ingresos3.value == "0" )|| (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "" && document.forminsc.ingresos3.value == "0" )|| (document.forminsc.ingresosm.value == "" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "0" ) || (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "" )){
                    alert("Debe registrar los ingresos de por lo menos uno de los padres o del responsable de su matr�cula. ");
                    return false;
                }

              
                if(isNaN(document.forminsc.ingresosp2.value )){
                    alert("El campo ingresos Mensuales del padre debe ser num�rico, no debe contener puntos ni comas");
                    document.forminsc.ingresosp.style.backgroundColor= '#ffcc00';
                    return false;
                }else{
                    for (i=0;i<document.forminsc.ingresosp2.value.length;i++) {
                        if(document.forminsc.ingresosp2.value.charAt(i) == '.'){
                            alert("El campo ingresos Mensuales del padre no debe contener puntos ni comas");
                            document.forminsc.ingresosp2.style.backgroundColor= '#ffcc00';
                            return false;
                        }
                    }
                }


                if(isNaN(document.forminsc.ingresosm2.value )){
                    alert("El campo ingresos Mensuales de la madre debe ser num�rico");
                    document.forminsc.ingresosm2.style.backgroundColor= '#ffcc00';
                    return false;
                }else{
                    for (i=0;i<document.forminsc.ingresosm2.value.length;i++) {
                        if(document.forminsc.ingresosm2.value.charAt(i) == '.'){
                            alert("El campo ingresos Mensuales de la madre no debe contener puntos ni comas");
                            document.forminsc.ingresosm2.style.backgroundColor= '#ffcc00';
                            return false;
                        }
                    }
                }
                
                if(document.forminsc.conoci[0].checked == false && document.forminsc.conoci[1].checked == false){
                    alert("Por favor seleccione la modalidad de presentaci�n del ex�men de conocimiento ");
                    return false;
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
        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
                <td><fieldset><legend class="textocom"><strong>Solicitud de Admisi�n</strong></legend>
                        <div align="center" class="textocom"><a href="Ayuda<%=tipoest%>" target="_blank"><b>&gt;&gt;Instructivo
                                    para diligenciar el Formulario&lt;&lt;</b></a></div>
                        
      <p align="center"><b><font color="#800000" size="3">Por favor verifique 
        la siguiente informaci&oacute;n antes de ENVIAR la solicitud de Admisi�n.</font></b></p>
                        <div align="center">
                            <form action="GrabaEstudiante" method="post" name="forminsc" id="forminsc">
                                <table width="666" border="0" cellpadding="1" cellspacing="1" class="textocom">
                                    <tr>
                                        <td colspan="4">&nbsp; </td>
                                    </tr>
                                    <tr>
                                        
              <td width="119"><strong>Primer Apellido del aspirante:</strong></td>
                                        
              <td width="340"> 
                <input type="text" class="campotext" name="ape1"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=ape1%>">
                                        </td>
                                        
              <td width="189"><strong>Segundo Apellido del aspirante:</strong></td>
                                        
              <td width="381"> 
                <input type="text" class="campotext" name="ape2"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=ape2%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        
              <td width="119"><strong>Nombre del aspirante:</strong></td>
                                        <td colspan="3">
                                            <input type="text" class="campotext" name="nombres"  size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);"  value="<%=nom_est%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        
              <td width="119"><strong>Documento de identidad:</strong></td>
                                        
              <td width="340"><font size="2"> 
                <input name="doc_est" type="text" class="campotext" size="18" maxlength="20" value="<%=doc%>">
                                            </font></td>
                                        <td colspan="2"><b> <font size="2"> </font> </b></td>
                                    </tr>
                                    <tr>
                                        
              <td width="119"><strong>Programa acad&eacute;mico:</strong></td>
                                        
              <td width="340"> 
                <%if (programa.equals("19")) {%>
                                            ADMINISTRACION DE EMPRESAS
                                            <% } else if (programa.equals("18")) {%>
                                            ECONOMIA
                                            <% } else if (programa.equals("13")) {%>
                                            INGENIERIA CIVIL
                                            <% } else if (programa.equals("15")) {%>
                                            INGENIERIA DE SISTEMAS
                                            <%} else if (programa.equals("16")) {%>
                                            INGENIERIA INDUSTRIAL
                                            <%} else if (programa.equals("14")) {%>
                                            INGENIERIA ELECTRICA
                                            <%} else if (programa.equals("17")) {%>
                                            INGENIERIA ELECTRONICA
                                            <%} else if (programa.equals("20")) {%>
                                            MATEMATICAS
                                            <%} else if (programa.equals("260")) {%>
                                            INGENIERIA MECANICA
                                            <%} else if (programa.equals("262")) {%>
                                            INGENIERIA BIOMEDICA
                                            <%}%>
                                        </td>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong>DATOS DEL ASPIRANTE</strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong><font color="#990000">*</font> Direcci&oacute;n
                                                correspondencia:
                                                <input name="campo13" type="text" class="campotext" id="campo13" size="50" maxlength="35" value="<%=campo13%>">
                                            </strong></td>
                                    </tr>
                                    <tr>
                                        
              <td width="119"><strong><font color="#990000">*</font> Tel&eacute;fono: 
                </strong></td>
                                        
              <td width="340"> 
                <input name="campo16" type="text" class="campotext" id="campo16" maxlength="15" value="<%=campo16%>">
                                        </td>
                                        
              <td width="189"><strong><font color="#990000">*</font>Celular: </strong></td>
                                        
              <td width="381"> 
                <input name="celular" type="text" class="campotext" id="celular" value="<%=celular%>" maxlength="10">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong>INFORMACI&Oacute;N FAMILIAR Y ECON&Oacute;MICA</strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><strong>Composici&oacute;n Familiar</strong></td>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong><font color="#990000">*</font> </strong>
                                            <%if (familia.equals("2")) {%>
                                            Padre y madre unidos<strong>
                                                <input name="campo22" type="radio" value="2" checked>
                                            </strong>Padres separados<strong>
                                                <input type="radio" name="campo22" value="3">
                                            </strong>Padres viudos <strong>
                                                <input type="radio" name="campo22" value="5">
                                            </strong>Padres sin sociedad conyugal <strong>
                                                <input type="radio" name="campo22" value="10">
                                            </strong>
                                            <%} else if (familia.equals("3")) {%>
                                            Padre y madre unidos<strong>
                                                <input name="campo22" type="radio" value="2" >
                                            </strong>Padres separados<strong>
                                                <input type="radio" name="campo22" value="3" checked >
                                            </strong>Padres viudos <strong>
                                                <input type="radio" name="campo22" value="5" >
                                            </strong>Padres sin sociedad conyugal <strong>
                                                <input type="radio" name="campo22" value="10">
                                            </strong>
                                            <%} else if (familia.equals("5")) {%>
                                            Padre y madre unidos<strong>
                                                <input name="campo22" type="radio" value="2">
                                            </strong>Padres separados<strong>
                                                <input type="radio" name="campo22" value="3">
                                            </strong>Padres viudos <strong>
                                                <input type="radio" name="campo22" value="5" checked>
                                            </strong>Padres sin sociedad conyugal <strong>
                                                <input type="radio" name="campo22" value="10">
                                            </strong>
                                            <%} else if (familia.equals("10")) {%>
                                            Padre y madre unidos<strong>
                                                <input name="campo22" type="radio" value="2">
                                            </strong>Padres separados<strong>
                                                <input type="radio" name="campo22" value="3">
                                            </strong>Padres viudos <strong>
                                                <input type="radio" name="campo22" value="5">
                                            </strong>Padres sin sociedad conyugal <strong>
                                                <input type="radio" name="campo22" value="10"  checked>
                                                <%}%>
                                            </strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong><font color="#990000">*</font> La vivienda
                                                de habitaci&oacute;n de su hogar es:</strong>
                                            <select name="campo30" class="campotext" id="campo30">
                                                <option value="1" <%if (vivienda.equals("1")) {
            out.println("selected");
        }%>>Arriendo </option>
                                                <option value="2" <%if (vivienda.equals("2")) {
            out.println("selected");
        }%>>Propia pagada
                                                <option value="3"<%if (vivienda.equals("3")) {
            out.println("selected");
        }%>>Propia deuda
                                                <option value="5"<%if (vivienda.equals("5")) {
            out.println("selected");
        }%>>Familiar
                                            </select>
                                            <strong>Estrato de los servicios p&uacute;blicos:
                                                <input name="campo35" type="text" class="campotext" id="campo35" size="3" maxlength="2" value="<%=estrato%>">
                                            </strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><strong><font color="#990000">*</font> </strong><b>Ultimo
                                                valor pagado en pensi&oacute;n del colegio(en pesos): </b><strong>
                                                <input type="text" name="pension2" size="8" maxlength="8" value="<%=pension%>">
                                            </strong></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"><b>INFORMACI&Oacute;N FAMILIAR</b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><strong>Acerca del Padre</strong></td>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;Nombre Completo
                                            <input name="campo51" type="text" class="campotext"  size="30" maxlength="40" value="<%=campo51%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Ingresos mensuales(en pesos sin puntos
                                            ni comas)</td>
                                        
              <td width="381"> 
                <input type="text" name="ingresosp2" size="8" maxlength="8" value="<%=ingresosp%>">
                                        </td>
                                    <tr>
                                        <td colspan="2"><strong>Acerca de la Madre</strong></td>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;Nombre Completo
                                            <input name="campo68" type="text" class="campotext"  size="30" maxlength="40" value="<%=campo68%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Ingresos mensuales(en pesos sin puntos
                                            ni comas)</td>
                                        
              <td width="381"> 
                <input type="text" name="ingresosm2" size="8" maxlength="8" value="<%=ingresosm%>">
                                        </td>
                                    </tr>
                                    <!--   <tr>
              <td colspan="4">Total ingresos a�o anterior $
                <input name="campo82" type="text" id="campo82" class="campotext" size="15" maxlength="9">
                <strong>(Sin puntos ni comas) </strong></td>
                                    </tr>-->
                                    <tr>
                                        <td colspan="4"> 
                <p><b>Si hay un tercer responsable de su matr&iacute;cula por 
                  favor registre los ingresos mensuales (en miles de pesos sin 
                  puntos ni comas): </b> 
                  <input type="text" name="ingresosotro" size="8" maxlength="8" value="<%=ingresos3%>">
                </p>
                <p>&nbsp; </p>
              </td>
                                    </tr>
		<%if (!tipoest.equals("T") ) {%>							
            <tr> 
              <td colspan="4">
               
                  
                <div align="left"><font face="Times New Roman, Times, serif" size="3" color="#800000"><b>Despu�s 
                  de ser admitido y haber hecho el pago de sus derechos de matr�cula 
                  y de acuerdo al programa al que fue admitido, usted debe presentar 
                  las pruebas de conocimientos que le correspondan de forma virtual. 
                  Est�s son de car�cter obligatorio y la respuesta le dar� una 
                  sugerencia sobre las asignaturas que deber� cursar en su primer 
                  semestre, en caso de no aceptarla usted deber� cursar las asignaturas 
                  indicadas en la respuesta de admisi�n. Si desea consultar mas 
                  informaci&oacute;n acerca del ex&aacute;men <a href="http://tycho.escuelaing.edu.co/contenido/promo/matematicas/index.html">HAGA 
                  CLICK AQUI</a><br>
                    <br>
                    <!--Seleccione la modalidad en la que quiere presentar las pruebas: -->
                    </b></font> </div>
                  <p>&nbsp;</p>
                
              </td>
									</tr>
                                                                        <!---	
									<tr>
								
              <td colspan="3">
                <div align="right">
                  <p align="left"><b>Fuera de la Escuela (desde cualquier lugar 
                    con conexi�n a internet):</b><b> 
                    <input type="radio" name="conoci" value="V">
                    </b></p>
                 
                  </div>
              </td>
              <td colspan="2">
                <div align="center">
                  <p align="left"><b>En las instalaciones de la Escuela: 
                    <input type="radio" name="conoci" value="P">
                    </b></p>
                 
                </div>
              </td>
			  
									</tr>-->
                                                                        
                                                                        <%}%>
									
                                    <tr>
                                        <td colspan="4">
                                           <hr size="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
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
                                        <td colspan="4">
                                            <div align="left"><b>
                                                    <!--Declaramos expresamente que la informaci&oacute;n
                                                    aqu&iacute; consignada es cierta y autorizamos su verificaci&oacute;n.
                                                    <br>
                                                    En el caso de encontrar falsedad de los datos consignados, esta
                                                    solicitud se anular&aacute;.-->
                                                    La Escuela se reserva el derecho de verificar la informaci�n
                                                    y los documentos presentados por el aspirante para la liquidaci�n
                                                    del valor de la matr�cula a trav�s de visitas domiciliarias
                                                    u otros mecanismos. Cualquier inexactitud en la informaci�n
                                                    presentada, podr� dar lugar inicialmente a la revisi�n del valor
                                                    de la matr�cula o eventualmente a la anulaci�n de la admisi�n.</b></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <div align="center">
                                                <input name="tipoest" type="hidden" id="tipoest" value="<%=tipoest%>">
                                                <input name="numreg" type="hidden" id="numreg" value="<%=numreg%>">
                                                <input name="nom_est" type="hidden" id="nom_est" value="<%=nom_est%>">
                                                <input name="ref" type="hidden" id="ref" value="<%=ref%>">
                                                <input name="uproc" type="hidden" id="uproc" value="<%=uproc%>">
                                                <input name="celular" type="hidden" id="celular" value="<%=celular%>">
                                                <input name="interes" type="hidden" id="interes" value="">
                                                <input name="tipdoc" type="hidden" id="tip_doc" value="<%=tipdoc%>">
                                                <input name="docicfes" type="hidden" id="docicfes" value="<%=docicfes%>">
                                                <input name="estado" type="hidden" id="estado" value="<%=estado%>">
                                                <input name="egresado" type="hidden" id="egresado" value="<%=egresado%>">
                                                <input name="simultaneo" type="hidden" id="simultaneo" value="<%=simultaneo%>">
                                                <input name="celularp" type="hidden" id="celularp" value="<%=celularp%>">
                                                <input name="celularm" type="hidden" id="celularm" value="<%=celularm%>">
                                                <input name="hermano" type="hidden" id="hermano" value="<%=hermano%>">
                                                <input name="interes" type="hidden" id="interes" value="<%=interes%>">
                                                <input name="ingresosm" type="hidden" id="ingresosm" value="<%=ingresosm%>">
                                                <input name="ingresosp" type="hidden" id="ingresosp" value="<%=ingresosp%>">
                                                <input name="correom" type="hidden" id="correom" value="<%=correom%>">
                                                <input name="correop" type="hidden" id="correop" value="<%=correop%>">
                                                <input name="antiguedadp" type="hidden" id="antiguedadp" value="<%=antiguedadp%>">
                                                <input name="antiguedadm" type="hidden" id="antiguedadm" value="<%=antiguedadm%>">
                                               
                                                <input name="medio" type="hidden" id="medio" value="<%=medio%>">
                                                <input name="campo1" type="hidden" id="campo1" value="<%=campo1%>">
                                                <input name="campo2" type="hidden" id="campo2" value="<%=campo2%>">
                                                <input name="campo3" type="hidden" id="campo3" value="<%=campo3%>">
                                                <input name="campo4" type="hidden" id="campo4" value="<%=campo4%>">
                                                <input name="campo5" type="hidden" id="campo4" value="<%=campo5%>">
                                                <input name="campo6" type="hidden" id="campo6" value="<%=campo6%>">
                                                <input name="campo7" type="hidden" id="campo7" value="<%=campo7%>">
                                                <input name="campo8" type="hidden" id="campo8" value="<%=campo8%>">
                                                <input name="campo9" type="hidden" id="campo9" value="<%=campo9%>">
                                                <input name="campo19" type="hidden" id="campo19" value="<%=campo19%>">
                                                <input name="campo20" type="hidden" id="campo20" value="<%=campo20%>">
                                                <input name="campo38" type="hidden" id="campo38" value="<%=campo38%>">
                                                <input name="ingresos3" type="hidden" id="ingresos3" value="<%=ingresos3%>">
                                                <input name="emailacud" type="hidden" id="emailacud" value="<%=emailacud%>">
                                                <input name="campo37" type="hidden" id="campo37" value="<%=parentesco%>">
                                                <input name="campo39" type="hidden" id="ecampo39" value="<%=cedulaacud%>">
                                                <input name="campo40" type="hidden" id="campo40" value="<%=diracud%>">
                                                <input name="campo41" type="hidden" id="campo41" value="<%=telacud%>">
                                                <input name="campo42" type="hidden" id="campo42" value="<%=ciudad%>">
                                                <input name="campo43" type="hidden" id="campo43" value="<%=campo43%>">
                                                <input name="campo44" type="hidden" id="campo44" value="<%=telotro%>">
                                                <input name="campo10" type="hidden" id="campo10" value="<%=campo10%>">
                                                <input name="campo11" type="hidden" id="campo11" value="<%=campo11%>">
                                                <input name="campo13" type="hidden" id="campo13" value="<%=campo13%>">
                                                <input name="campo14" type="hidden" id="campo14" value="<%=campo14%>">
                                                <input name="campo15" type="hidden" id="campo15" value="<%=campo15%>">
                                                <input name="campo16" type="hidden" id="campo16" value="<%=campo16%>">
                                                <input name="campo17" type="hidden" id="campo17" value="<%=campo17%>">
                                                <input name="campo18" type="hidden" id="campo18" value="<%=campo18%>">
                                                <input name="campo19" type="hidden" id="campo19" value="<%=campo19%>">
                                                <input name="campo20" type="hidden" id="campo20" value="<%=campo20%>">
                                                <input name="campo21" type="hidden" id="campo21" value="<%=campo21%>">
                                                <input name="campo22" type="hidden" id="campo22" value="<%=familia%>">
                                                <input name="campo30" type="hidden" id="campo30" value="<%=vivienda%>">
                                                <input name="campo35" type="hidden" id="campo35" value="<%=campo35%>">
                                                <input name="campo45" type="hidden" id="campo45" value="<%=campo45%>">
                                                <input name="campo46" type="hidden" id="campo46" value="<%=campo46%>">
                                                <input name="campo47" type="hidden" id="campo47" value="<%=campo47%>">
                                                <input name="campo48" type="hidden" id="campo48" value="<%=campo48%>">
                                                <input name="campo49" type="hidden" id="campo49" value="<%=campo49%>">
                                                <input name="campo50" type="hidden" id="campo50" value="<%=campo50%>">
                                                <input name="campo51" type="hidden" id="campo51" value="<%=campo51%>">
                                                <input name="campo53" type="hidden" id="campo53" value="<%=campo53%>">
                                                <input name="campo54" type="hidden" id="campo54" value="<%=campo54%>">
                                                <input name="campo55" type="hidden" id="campo55" value="<%=campo55%>">
                                                <input name="campo56" type="hidden" id="campo56" value="<%=campo56%>">
                                                <input name="campo57" type="hidden" id="campo57" value="<%=campo57%>">
                                                <input name="campo58" type="hidden" id="campo58" value="<%=campo58%>">
                                                <input name="campo59" type="hidden" id="campo59" value="<%=campo59%>">
                                                <input name="campo60" type="hidden" id="campo60" value="<%=campo60%>">
                                                <input name="campo61" type="hidden" id="campo61" value="<%=campo61%>">
                                                <input name="campo62" type="hidden" id="campo62" value="<%=campo62%>"
                                                       <input name="campo63" type="hidden" id="campo63" value="<%=campo63%>">
                                                <input name="campo64" type="hidden" id="campo64" value="<%=campo64%>">
                                                <input name="campo67" type="hidden" id="campo67" value="<%=campo67%>">
                                                <input name="campo68" type="hidden" id="campo68" value="<%=campo68%>">
                                                <input name="campo69" type="hidden" id="campo69" value="<%=campo69%>">
                                                <input name="campo70" type="hidden" id="campo70" value="<%=campo70%>">
                                                <input name="campo71" type="hidden" id="campo71" value="<%=campo71%>">
                                                <input name="campo72" type="hidden" id="campo72" value="<%=campo72%>">
                                                <input name="campo73" type="hidden" id="campo73" value="<%=campo73%>">
                                                <input name="campo74" type="hidden" id="campo74" value="<%=campo74%>">
                                                <input name="campo75" type="hidden" id="campo75" value="<%=campo75%>">
                                                <input name="campo76" type="hidden" id="campo76" value="<%=campo76%>">
                                                <input name="campo77" type="hidden" id="campo77" value="<%=campo77%>">
                                                <input name="campo78" type="hidden" id="campo78" value="<%=campo78%>">
                                                <input name="campo79" type="hidden" id="campo79" value="<%=campo79%>">
                                                <input name="campo80" type="hidden" id="campo80" value="<%=campo80%>">
                                                <input name="campo81" type="hidden" id="campo81" value="<%=campo81%>">
                                                <input name="campo101" type="hidden" id="campo101" value="<%=campo101%>">
                                                <input name="uplan" type="hidden" id="uplan" value="<%=uplan%>">
                                                <input name="programa" type="hidden" id="programa" value="<%=programa%>">
                                                <input name="pilo" type="hidden" id="uplan" value="<%=pilo%>">
                                                <input name="conoci" type="hidden" id="conoci" value="V">
                                                <input name="bi" type="submit" class="boton" value="Enviar Solicitud de Admisi�n" onClick="javascript: return validar();">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">&nbsp;</td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </fieldset> </td>
            </tr>
        </table>
    </body>
</html>
<!%
}else
response.sendRedirect("ErrorPago");
%>
<%
}catch(Exception e){
   Correo correo=new Correo();
   correo.enviar("Confirmar Formulario Pregrado", e.getMessage());
}
%>