<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        BDadmisiones admision = new BDadmisiones();
        Vector ciud = admision.getCiudades();
        Vector profes = admision.getProfesiones();
        PrintWriter oout = response.getWriter();
        int i;
        String ref = request.getParameter("ref");
        String doc = request.getParameter("doc");
        String prog ="";
        Vector pginsc = admision.getInscrito(doc, ref);
        prog = (pginsc.elementAt(1).toString());
      //  out.println(prog);
        Vector plan = admision.VerificaPlan(prog);
        String uplan = plan.elementAt(0).toString();
       // out.println(uplan);
        /*if(pginsc.size()>0){*/
        String tipo = (String) pginsc.elementAt(6);
%>
<html>
    <head>
        <title>Formulario de Inscripci&oacute;n</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {
                var i, band, valor;
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
                    document.forminsc.doc_est.style.backgroundColor= '#ffcc00';
                    document.forminsc.doc_est2.style.backgroundColor= '#ffcc00';
                    document.forminsc.doc.focus();
                    return false;
                }

                if(isNaN(document.forminsc.docicfes.value )){
                    alert("El Número de documento con el que presentó el icfes debe ser numérico");
                    document.forminsc.docicfes.style.backgroundColor= '#ffcc00';
                    //document.getElementById("docicfes").focus();
                    return false;
                }

                valor = document.forminsc.campo18.value;

                if (/^\s+$/.test(valor) ){
                    alert("POR FAVOR INGRESE EL CODIGO DEL COLEGIO, NO DEBE INGRESAR ESPACIOS EN BLANCO");
                    document.forminsc.campo18.style.backgroundColor= '#ffcc00';

                    return false;
                }


                if (document.forminsc.pension.value==""){
                    alert("Por favor ingrese el campo último valor pagado en pensión mensual")
                    document.forminsc.pension.style.backgroundColor= '#ffcc00';
                    document.getElementById("pension").focus();
                    return false;
                }

                if(isNaN(document.forminsc.campo47.value )){
                    alert("El Número de carnet debe ser numérico");
                    document.forminsc.campo47.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo47").focus();
                    return false;
                }

                if(isNaN(document.forminsc.campo49.value )){
                    alert("El Número de carnet debe ser numérico");
                    document.forminsc.campo49.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo49").focus();
                    return false;
                }

                band = 0;
                for(i=0; i<47; i++){
                    if(document.forminsc.elements[i].value == "null" || document.forminsc.elements[i].value == ""){
                        if(document.forminsc.elements[i].name == "campo6" || document.forminsc.elements[i].name == "campo7" || document.forminsc.elements[i].name == "campo8" || document.forminsc.elements[i].name == "campo9"){
                            band = 1;
                        }else if(document.forminsc.elements[i].name == "campo12" && document.forminsc.campo11.value != "O"){
                            band = 1;
                        }else if(document.forminsc.elements[i].name == "campo15" && document.forminsc.campo14.value != "0"){
                            band = 1;
                        }else if(document.forminsc.elements[i].name == "campo28" && document.forminsc.campo26.value != ""){
                            band = 1;
                        }   else{
                            alert("Los campos con * son obligatorios ");
                            document.forminsc.elements[i].style.backgroundColor= '#ffcc00';

                            if(i<27)
                                document.getElementById("campo18").focus();
                            return false;
                        }
                    }
                }

                if (document.forminsc.campo4.value == ""){
                    alert("Por favor seleccione la ciudad de nacimiento");
                    return false;

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
                    alert("El campo ingresos del padre debe ser un número sin puntos ni comas");
                    return false;
                }

                if(isNaN(document.forminsc.ingresosm.value )){
                    alert("El campo ingresos de la madre debe ser un número sin puntos ni comas");
                    return false;
                }

                if(isNaN(document.forminsc.pension.value )){
                    alert("El campo de Valor Mensual Pagado debe ser un número");
                    document.forminsc.pension.style.backgroundColor= '#ffcc00';
                    document.getElementById("pension").focus();
                    return false;
                }else{
                    for (i=0;i<document.forminsc.pension.value.length;i++) {
                        if(document.forminsc.pension.value.charAt(i) == '.'){
                            alert("En el campo Valor Mensual Pagado no coloque puntos ni comas");
                            document.forminsc.pension.style.backgroundColor= '#ffcc00';
                            document.getElementById("pension").focus();
                            return false;
                        }
                    }
                }



                if(isNaN(document.forminsc.campo18.value )){
                    alert("El Código del Colegio debe ser un número");
                    document.forminsc.campo18.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo18").focus();
                    return false;
                }




                if(isNaN(document.forminsc.campo3.value )){
                    alert("Año debe ser un número");
                    document.forminsc.campo3.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo3").focus();
                    return false;
                }

                if(isNaN(document.forminsc.campo20.value )){
                    alert("Año debe ser un número");
                    document.forminsc.campo20.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo20").focus();
                    return false;
                }
                /*
                if(isNaN(document.forminsc.campo27.value )){
                    alert("Año debe ser un número");
                    document.forminsc.campo27.style.backgroundColor= '#ffcc00';
                    document.getElementById("campo27").focus();
                    return false;
                }*/
                if(isNaN(document.forminsc.ingresosp.value )){
                    alert("El campo ingresos Mensuales del padre no debe contener puntos ni comas");
                    document.forminsc.ingresosp.style.backgroundColor= '#ffcc00';
                    document.getElementById("ingresosp").focus();
                    return false;
                }else{
                    for (i=0;i<document.forminsc.ingresosp.value.length;i++) {
                        if(document.forminsc.ingresosp.value.charAt(i) == '.'){
                            alert("El campo ingresos Mensuales del padre no debe contener puntos ni comas");
                            document.forminsc.ingresosp.style.backgroundColor= '#ffcc00';
                            document.getElementById("ingresosp").focus();
                            return false;
                        }
                    }
                }


                if(isNaN(document.forminsc.ingresosm.value )){
                    alert("El campo ingresos Mensuales de la madre no debe contener puntos ni comas");
                    document.forminsc.ingresosm.style.backgroundColor= '#ffcc00';
                    document.getElementById("ingresosm").focus();
                    return false;
                }else{
                    for (i=0;i<document.forminsc.ingresosm.value.length;i++) {
                        if(document.forminsc.ingresosm.value.charAt(i) == '.'){
                            alert("El campo ingresos Mensuales de la madre no debe contener puntos ni comas");
                            document.forminsc.ingresosm.style.backgroundColor= '#ffcc00';
                            document.getElementById("ingresosm").focus();
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
    <td><img src="img/spacer.gif" width="97" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="123" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="155" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="265" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>
  <tr> 
    <td rowspan="2" colspan="4">&nbsp;</td>
    <td><img src="img/spacer.gif" width="1" height="37" border="0" alt=""></td>
  </tr>
  <tr> 
    <td><img src="img/spacer.gif" width="1" height="33" border="0" alt=""></td>
  </tr>
</table>
        <br>
        <table width="680" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
                
    <td> <fieldset><legend class="textocom"></legend>
      <div align="center">
        <p>NOMBRES:</p>
        <p>&nbsp; </p>
        <form action="ConfirmarPregrado" method="post" name="forminsc" id="forminsc">
        </form>
                        </div>
                    </fieldset>
                </td>
            </tr>
        </table>
    </body>
</html>
<!%
}else
response.sendRedirect("ErrorPago");
%>
