<%-- 
    Document   : FormuPregrado
    Created on : 2/06/2016, 08:34:45 AM
    Author     : Lucero
--%>
<%@page import="co.gov.icfes.prisma.ws.cliente.ResultadosFachadaClientException"%>
<%@page import="nuevos.ICFES"%>
<!DOCTYPE html>


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
    String pilo = request.getParameter("pilo");
    String colegio = request.getParameter("col");
    String prog = "";
    String idcol = request.getParameter("idcol");
    Vector pginsc = admision.getInscrito(doc, ref);
    Vector Lista = admision.ListaColegios();
    if (pginsc.size() > 0) {

        prog = (pginsc.elementAt(1).toString());
        //  out.println(prog);
        Vector plan = admision.VerificaPlan(prog);
        String uplan = plan.elementAt(0).toString();
        // out.println(uplan);
        /*if(pginsc.size()>0){*/
        String tipo = (String) pginsc.elementAt(6);
        // String pilo=  (String) pginsc.elementAt(11);
        
        String tip_doc = request.getParameter("tip_doc");
        String snp = request.getParameter("snp");
        
        ICFES ic = new ICFES();
        String p;
        
        if(!(snp.trim()).equals("")){
            p = ic.procExtraerDatos(tip_doc, doc, snp);
        }else{
            p = "69-0;74-0;103-0;8-0;";
        }
        

        if(p.contains("@")){
            p = p.replaceAll("@", "");
            response.sendRedirect("ErrorICFES?error="+p+"&snp="+ snp+"&tip_doc="+tip_doc+"&doc="+doc);
        }    
        String tip_doc_largo="";
        if(tip_doc.equals("TI")){
            tip_doc="T";
            tip_doc_largo="Tarjeta de Identidad";
        }else if(tip_doc.equals("CC")||tip_doc.equals("CR")){
            tip_doc="C";
            tip_doc_largo="C�dula de Cuidadan�a";
        }else if(tip_doc.equals("CE")){
            tip_doc="E";
            tip_doc_largo="C�dula Extranjera";
        }else if(tip_doc.equals("PC") || tip_doc.equals("PE")){
            tip_doc="P";
            tip_doc_largo="Pasaporte";
        }
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Formulario de Inscripci�n Pregrado</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="Content-Language" content="ES" />
        <meta name="language" content="spanish" />
        <meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
        <meta name="copyright" content="Copyright (c) 2016" />
        <meta name="description" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
        <meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
        <link rel="stylesheet" href="css/admisionFormulario.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">

        <script>
            

            function validar() {
                var i, j, band, valor, valcorreo;
                for (i = 1; i < 45; i++) {
                    document.forminsc.elements[i].style.backgroundColor = '#D8E6F1';
                }

                if (document.forminsc.medio.value == "0") {
                    alert("Por favor se�ale el medio por el cual se entero de la ECI");
                    document.forminsc.medio.style.backgroundColor = '#ffcc00';
                    document.forminsc.medio.focus();
                    return false;
                }

                if (document.forminsc.doc_est.value != document.forminsc.doc_est2.value) {
                    alert("Los n�meros de documento no concuerdan");
                    document.forminsc.doc_est2.style.backgroundColor = '#ffcc00';
                    document.forminsc.doc_est2.focus();
                    return false;
                }

                if (document.forminsc.tip_doc.value == "null") {
                    alert("Por favor seleccione el tipo de documento de identificaci�n");
                    document.forminsc.tip_doc.style.backgroundColor = '#ffcc00';
                    document.forminsc.tip_doc.focus();
                    return false;
                }



                if (document.forminsc.docicfes.value == "") {
                    alert("Por favor ingrese el documento de identificaci�n con el que present� el icfes");
                    document.forminsc.docicfes.style.backgroundColor = '#ffcc00';
                    document.forminsc.docicfes.focus();
                    return false;
                }


                if (isNaN(document.forminsc.docicfes.value)) {
                    alert("El N�mero de documento con el que present� el icfes debe ser num�rico");
                    document.forminsc.docicfes.style.backgroundColor = '#ffcc00';
                    //document.getElementById("docicfes").focus();
                    return false;
                }

                if (isNaN(document.forminsc.docicfes.value) || (document.forminsc.docicfes.value == '')) {
                    alert("El documento de identidad con el que presento el icfes no puede estar en blanco y debe ser dato num�rico");
                    return false;
                }


                if (document.forminsc.campo3.value > 2018) {
                    alert("Por favor verifique el a�o de nacimiento");
                    return false;
                }

                if (document.forminsc.campo6[0].checked) {
                    if ((document.forminsc.campo7.value == "" || document.forminsc.campo8.value == "")) {
                        alert("Por favor ingrese N�mero de libreta militar y distrito");
                        document.forminsc.campo7.style.backgroundColor = '#ffcc00';
                        document.forminsc.campo7.focus();
                        return (false);
                    }
                }


                for (i = 1; i < 46; i++) {
                    if (document.forminsc.elements[i].value == "null" || document.forminsc.elements[i].value == "") {
                        if (document.forminsc.elements[i].name == "campo6" || document.forminsc.elements[i].name == "campo7" || document.forminsc.elements[i].name == "campo8" || document.forminsc.elements[i].name == "campo9") {
                            band = 1;
                        } else if (document.forminsc.elements[i].name == "campo15" && document.forminsc.campo14.value != "0") {
                            band = 1;
                        } else {
                            alert("Los campos con * son obligatorios ");
                            document.forminsc.elements[i].style.backgroundColor = '#ffcc00';
                            return false;
                        }
                    }
                }

                if (document.forminsc.campo35.value == "") {
                    alert("Ingrese el estrato de los servicios p�blicos");
                    document.forminsc.campo35.style.backgroundColor = '#ffcc00';
                    return false;
                }



                if ((document.forminsc.campo51.value == "" || document.forminsc.campo54.value == "") && (document.forminsc.campo68.value == "" || document.forminsc.campo71.value == "")) {
                    alert("Ingrese la informaci�n de por lo menos uno de los padres");
                    return false;
                }

                if ((document.forminsc.ingresosm.value == "" && document.forminsc.ingresosp.value == "" && document.forminsc.ingresos3.value == "") || (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "0") || (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "" && document.forminsc.ingresos3.value == "") || (document.forminsc.ingresosm.value == "" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "") || (document.forminsc.ingresosm.value == "" && document.forminsc.ingresosp.value == "" && document.forminsc.ingresos3.value == "0") || (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "" && document.forminsc.ingresos3.value == "0") || (document.forminsc.ingresosm.value == "" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "0") || (document.forminsc.ingresosm.value == "0" && document.forminsc.ingresosp.value == "0" && document.forminsc.ingresos3.value == "")) {
                    alert("Debe registrar los ingresos de por lo menos uno de los padres o del responsable de su matr�cula. ");
                    return false;
                }

                if (isNaN(document.forminsc.ingresosp.value)) {
                    alert("El campo ingresos Mensuales del padre debe ser num�rico");
                    document.forminsc.ingresosp.style.backgroundColor = '#ffcc00';
                    return false;
                } else {
                    for (i = 0; i < document.forminsc.ingresosp.value.length; i++) {
                        if (document.forminsc.ingresosp.value.charAt(i) == '.') {
                            alert("El campo ingresos Mensuales del padre no debe contener puntos ni comas");
                            document.forminsc.ingresosp.style.backgroundColor = '#ffcc00';
                            return false;
                        }
                    }
                }


                if (isNaN(document.forminsc.ingresosm.value)) {
                    alert("El campo ingresos Mensuales de la madre debe ser num�rico");
                    document.forminsc.ingresosm.style.backgroundColor = '#ffcc00';
                    return false;
                } else {
                    for (i = 0; i < document.forminsc.ingresosm.value.length; i++) {
                        if (document.forminsc.ingresosm.value.charAt(i) == '.') {
                            alert("El campo ingresos Mensuales de la madre no debe contener puntos ni comas");
                            document.forminsc.ingresosm.style.backgroundColor = '#ffcc00';
                            return false;
                        }
                    }
                }

                if (isNaN(document.forminsc.ingresos3.value)) {
                    alert("El campo ingresos Mensuales de un tercero debe ser num�rico");
                    document.forminsc.ingresos3.style.backgroundColor = '#ffcc00';
                    return false;
                } else {
                    for (i = 0; i < document.forminsc.ingresos3.value.length; i++) {
                        if (document.forminsc.ingresos3.value.charAt(i) == '.') {
                            alert("El campo ingresos mensuales de un tercero no debe contener puntos ni comas");
                            document.forminsc.ingresos3.style.backgroundColor = '#ffcc00';
                            return false;
                        }
                    }
                }

                if (document.forminsc.pension.value > 1500000) {
                    if (confirm("El valor de la pensi�n es " + document.forminsc.pension.value + ", es correcto el valor?")) {
                        return true;
                    } else {
                        return false;
                    }
                }

                if (document.forminsc.campo16.value.length < 7) {
                    alert("Por favor verifique el n�mero de tel�fono e ingrese un n�mero v�lido.");
                    document.forminsc.campo16.style.backgroundColor = '#ffcc00';
                    return false;
                }


                if (isNaN(document.forminsc.campo16.value)) {
                    alert("El n�mero de tel�fono del aspirante debe ser  n�merico");
                    document.forminsc.campo16.style.backgroundColor = '#ffcc00';
                    return false;
                }


                if (isNaN(document.forminsc.campo18.value)) {
                    alert("El c�digo del colegio debe ser  n�merico");
                    document.forminsc.campo18.style.backgroundColor = '#ffcc00';
                    return false;
                }

                if (document.forminsc.pension.value == "") {
                    alert("Por favor ingrese el campo �ltimo valor pagado en pensi�n mensual")
                    document.forminsc.pension.style.backgroundColor = '#ffcc00';
                    return false;
                }



                if (isNaN(document.forminsc.pension.value)) {
                    alert("El campo de Valor Mensual Pagado debe ser un n�mero");
                    document.forminsc.pension.style.backgroundColor = '#ffcc00';
                    //   document.getElementById("pension").focus();
                    return false;
                } else {
                    for (i = 0; i < document.forminsc.pension.value.length; i++) {
                        if (document.forminsc.pension.value.charAt(i) == '.') {
                            alert("En el campo Valor Mensual Pagado no coloque puntos ni comas");
                            document.forminsc.pension.style.backgroundColor = '#ffcc00';
                            //document.getElementById("pension").focus();
                            return false;
                        }
                    }
                }



                if (document.forminsc.campo41.value.length < 7) {
                    alert("Por favor verifique el n�mero de tel�fono del Acudiente e ingrese un n�mero v�lido.");
                    document.forminsc.campo41.style.backgroundColor = '#ffcc00';
                    return false;
                }



                valcorreo = document.forminsc.campo17.value;

                if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valcorreo)) {
                    return (true);
                } else {
                    alert("Error: Por favor ingrese una direcci�n de correo v�lida");
                    document.forminsc.campo17.style.backgroundColor = '#ffcc00';
                    return (false);
                }

            }

            function buscar() {
                document.forminsc.action = "Colegios";
                document.forminsc.method = 'POST';
                document.forminsc.submit();
            }

            function convertTildes(str) {
                var out = "", flag = 0;
                for (i = 0; i < str.length; i++) {
                    if ((str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�")
                            && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�")
                            && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�")
                            && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�") && (str.charAt(i) != "�")) {
                        out += str.charAt(i);
                        flag = 0;
                    }

                    else {
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "i";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "a";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "e";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "o";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "u";
                            flag = 1;
                        }

                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "i";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "a";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "e";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "o";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "u";
                            flag = 1;
                        }

                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "A";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "E";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "I";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "O";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "U";
                            flag = 1;
                        }

                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "A";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "E";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "I";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "O";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "U";
                            flag = 1;
                        }

                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "i";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "a";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "e";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "o";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "u";
                            flag = 1;
                        }

                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "A";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "E";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "I";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
                            out += "O";
                            flag = 1;
                        }
                        if ((flag == 0) && (str.charAt(i) == "�")) {
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

        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <img class="logoescuela" src="img/logo.jpg" alt="logoEscuela">
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-9">
                    <div class="superior"></div>
                    <nav class="navbar navbar-default">
                        <div class="container">
                            <ul class="nav navbar-nav">
                                <li><a href="http://www.escuelaing.edu.co/es/">Inicio</a></li>
                                <li><a href="http://www.escuelaing.edu.co/es/conozcanos">Con�zcanos</a></li>
                                <li><a href="http://www.escuelaing.edu.co/es/comunidad/estudiantes">Comunidad</a></li>
                                <li><a href="http://www.escuelaing.edu.co/es/programas">Programas</a></li>
                                <li><a href="http://www.escuelaing.edu.co/es/programas/admisiones">Admisiones</a></li>
                                <li><a href="http://www.escuelaing.edu.co/es/financiacion">Pagos, Financiaci�n y Becas</a></li>
                                <li><a href="http://www.escuelaing.edu.co/es/empresa">Empresa</a></li>
                                <li><a href="http://www.escuelaing.edu.co/es/investigacion">Investigaci�n e Innovaci�n</a></li>
                                <li><a href="http://www.escuelaing.edu.co/es/donaciones" class="final">Donaciones</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>

            <div class="container-fluid">
                <img src="img/img-principal.jpg" alt="fotoEscuela" class="img-responsive">
            </div>

            <div class="container-fluid contenidos">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-xs-12 col-md-8">
                                <p><strong>Para diligenciar el formulario de admisiones puede consultar el instructivo.</strong></p>
                            </div>

                            <div class="col-xs-12 col-md-4">
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                    Instructivo
                                </button>
                                <!-- Modal -->
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel">Instructivo para diligenciar la solicitud de admisi�n<br>a trav�s del portal web de la Escuela</h4>
                                            </div>
                                            <div class="modal-body">
                                                <p>Tenga en cuenta que los datos suministrados en la solicitud de admisi�n que diligencie a trav�s de la p�gina web de la Escuela, deben corresponder con los documentos de soporte que entregar� para formalizar la inscripci�n. Una vez env�e la solicitud v�a internet, no podr� hacer modificaciones.</p>
                                                <p>La Escuela se reserva el derecho de verificar la informaci�n suministrada en la solicitud y en los documentos de soporte entregados. En caso de encontrar falsedad en los datos consignados, la solicitud se anular�.</p>
                                                <p>Todos los campos marcados con (*), son obligatorios.</p>

                                                <hr>
                                                <h5><span class="glyphicon glyphicon-expand"></span> Medio de informaci�n</h5>
                                                <p>Seleccione el medio por el cual se enter� de la Escuela Colombiana de ingenier�a Julio Garavito.</p>

                                                <hr>
                                                <h5><span class="glyphicon glyphicon-expand"></span> Datos del aspirante</h5>
                                                <p>Registre los datos b�sicos del aspirante, como nombre, fecha de nacimiento, documento de identidad, estado civil, etc�tera.</p>
                                                <p>Las fechas deben digitarse en el formato d�a, mes y a�o. Para digitar el a�o utilice los cuatro (4) d�gitos).</p>
                                                <p>Si tiene el n�mero de la libreta militar y el distrito, escr�balos; si est� en tr�mite, marque "SI" en la casilla correspondiente a tr�mite.</p>
                                                <p>Registre completamente la direcci�n de correspondencia, ya que esta se utilizar� para todas las comunicaciones v�a correo entre la Escuela y el aspirante o su familia.</p>

                                                <hr>
                                                <h5><span class="glyphicon glyphicon-expand"></span> Educaci�n secundaria</h5>
                                                <p>Hace referencia a los datos b�sicos de la instituci�n en la que se cursa (�) grado 11. Si obtuvo la validaci�n del bachillerato ante el Icfes, marque la casilla</p>
                                                <p>correspondiente, deje la casilla de c�digo de colegio en blanco.</p>
                                                <ul class="tematicas">
                                                    <li>En la casilla correspondiente al C�digo del colegio, escriba el n�mero que aparece en el informe del Examen de Estado (Icfes) o cons�ltelo en el link ver ayuda.</li>
                                                </ul>

                                                <hr>
                                                <h5><span class="glyphicon glyphicon-expand"></span> Informaci�n econ�mica</h5>
                                                <p>Valor mensual pagado en el �ltimo a�o de estudios en el colegio
                                                <p>Registre el valor mensual pagado por concepto de pensi�n en el colegio en el �ltimo a�o de estudios. En caso de realizar un solo pago en el a�o, div�dalo por 10 y registre all� el resultado.</p>
                                                <p>En caso de haber estado becado o no pagar pensi�n, registre $0 y anexe a los documentos de soporte, la constancia correspondiente expedida por la instituci�n donde cursa (�) grado 11.</p>
                                                <p>Valor pagado por matr�cula en el �ltimo semestre (si es su caso)</p>
                                                <p>Si el aspirante ha estado en alguna instituci�n universitaria o ha realizado alg�n curso pre-universitario, diligencie el valor pagado por matr�cula en el �ltimo semestre.</p>
                                                <p>La vivienda de habitaci�n de su hogar es</p>
                                                <p>Escoja entre los �tems propuestos el que identifique el tipo de vivienda y el estrato de acuerdo con los servicios p�blicos.</p>

                                                <hr>
                                                <h5><span class="glyphicon glyphicon-expand"></span> Datos del acudiente</h5>
                                                <p><strong>Acudiente</strong></p>
                                                <p>La informaci�n del acudiente es de vital importancia para la instituci�n. Por lo anterior, la Escuela Colombiana de Ingenier�a define al acudiente como la persona mayor de edad preferiblemente el padre, la madre, o un familiar allegado que se hace responsable del estudiante ante la Escuela Colombiana de Ingenier�a frente a procesos de �ndole acad�mica, personal, social, familiar, administrativa y financiera, por lo cual es la persona reconocida por la instituci�n para dar y recibir informaci�n respecto del proceso formativo del estudiante.</p>
                                                <p>Persona diferente del acudiente, residente en Bogot�</p>
                                                <p>Esta informaci�n es obligatoria. Quien aparezca aqu� registrado se contactar� cuando el acudiente no se pueda localizar, pero de ninguna manera lo reemplaza. <p>Registre aqu� un n�mero telef�nico diferente al del acudiente.</p>

                                                <hr>
                                                <h5><span class="glyphicon glyphicon-expand"></span> Informaci�n acerca de los hermano</h5>
                                                <p>Escriba la informaci�n b�sica de cada uno de los hermanos del aspirante.</p>

                                                <hr>
                                                <h5><span class="glyphicon glyphicon-expand"></span> Informaci�n familia</h5>
                                                <p><strong>Composici�n familiar</strong></p>
                                                <p>Acerca del padre y la madre</p>
                                                <p>Registre la informaci�n b�sica del padre y la madre: datos personales; nivel de educaci�n (si es profesional, se debe especificar el t�tulo obtenido, si no tiene profesi�n, seleccione la opci�n "No tiene"); ocupaci�n (se refiere a la labor que actualmente desempe�a) y, por �ltimo, el aspecto econ�mico conformado por el total de los ingresos recibidos durante el a�o inmediatamente anterior. Si provienen de una vinculaci�n laboral, �stos deben estar respaldados por el certificado de ingresos y retenciones expedido por la entidad contratante. En esta casilla coloque solamente lo referente a los rubros que conforman salarios (grabados y no grabados).</p>
                                                <p>Si los padres no son responsables de presentar declaraci�n de renta y no tienen v�nculo laboral, estos ingresos se refieren a los recibidos por actividades independientes y deben estar certificados por contador p�blico, anexando copia de la matr�cula profesional expedida por la Junta Central de Contadores.</p>
                                                <p>Al diligenciar estos datos no registre ni comas ni puntos, si no hubo ning�n ingreso registre cero (0).</p>

                                                <hr>
                                                <h5><span class="glyphicon glyphicon-expand"></span> Matr�cula m�xima</h5>
                                                <p>Si el aspirante no desea presentar los documentos necesarios para la liquidaci�n del valor de los derechos de matr�cula, marque la casilla correspondiente. En este caso, deber� anexar adicionalmente a los documentos de soporte, una carta en la cual el acudiente acepta y firma que se somete a la matr�cula m�xima, lo cual implica que no tendr� la oportunidad de solicitar posteriormente la liquidaci�n.</p>

                                                <hr>
                                                <h5><span class="glyphicon glyphicon-expand"></span> Enviar solicitud de admisi�n</h5>
                                                <p>Una vez est� seguro que todos los datos registrados en el formulario son correctos, marque la casilla correspondiente a "Enviar Solicitud de Admisi�n". </p>
                                                <p>Despu�s de enviada la solicitud de admisi�n, no podr� hacer modificaciones.</p>
                                                <p>Una vez enviada la solicitud de admisi�n imprima el formulario y an�xelo a la documentaci�n.</p>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <form action="ConfirmarPregrado" method="post" name="forminsc" id="forminsc">
                            
                            <input type="hidden" value="<%=p%>" name="valicfes" id="valicfes">
                            <h3>Formulario de inscripci�n</h3>
                            <div class="row">		
                                <div class="col-xs-12 col-md-9">
                                    <div class="form-group espaciado">			      
                                        <br><font color="#990000">*</font>Se�ale el medio por el cual se enter� y tomo la decisi�n de estudiar en la <br>Escuela Colombiana de Ingenier�a Julio Garavito
                                    </div>
                                </div>
                                <div class="col-xs-12 col-md-3">
                                    <div class="form-group espaciado">
                                        <label></label>
                                        <select name="medio" class="form-control">
                                            <option value="0" Selected><font size="3">Seleccione</font></option>
                                            <%   Vector medios = new Vector();
                                                Vector medio = admision.Medios();
                                                for (int x = 0; x < medio.size(); x++) {
                                                    medios = (Vector) medio.elementAt(x);%>
                                            <option value="<%=medios.elementAt(0)%>"><font size="3"><%=medios.elementAt(1)%></font></option>
                                            <%}%>
                                        </select>      
                                    </div>
                                </div>
                                <div class="col-xs-12 col-md-1"></div>                			              
                            </div>
                            <!--DATOS ASPIRANTE-->

                            <div class="formulario">
                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingOne">
                                            <h4 class="panel-title">
                                                <span class="glyphicon glyphicon-collapse-down"></span> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                    <strong><span class="rojo">PASO 1:</span></strong> Datos del aspirante
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                            <div class="panel-body">

                                                <div class="row">
                                                    <div class="col-xs-12 col-md-6">
                                                        <div class="form-group espaciado">
                                                            <label for="">Primer apellido</label>
                                                            <input type="text" class="form-control" name="ape1" placeholder="primer apellido" size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(7)%>">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-md-6">
                                                        <div class="form-group">
                                                            <label for="">Segundo apellido</label>
                                                            <input type="text" class="form-control" name="ape2" placeholder="segundo apellido"  size="15" maxlength="15" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(8)%>">
                                                        </div>
                                                    </div>
                                                </div>	

                                                <div class="form-group">
                                                    <label for="">Nombre(s) completo</label>
                                                    <input type="text" class="form-control" name="nombres" placeholder="nombre completo" size="40" maxlength="40" onBlur="this.value = convertTildes(this.value);"  value="<%=pginsc.elementAt(9)%>">
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12 col-md-4">
                                                        <div class="form-group espaciado">
                                                            <input type="hidden" id="tip_doc" name="tip_doc" value="<%=tip_doc%>">
                                                            <label>Tipo de Documento: </label>
                                                            <input type="text" class="form-control" name="tip_doc_largo" disabled="true" placeholder="tipo de identidad" size="18" maxlength="20" value="<%=tip_doc_largo%>">
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-4">
                                                        <div class="form-group espaciado">
                                                            <label for="">Documento de identidad</label>
                                                            <input type="text" class="form-control" name="doc_est" disabled="true" placeholder="documento de identidad" size="18" maxlength="20" value="<%=pginsc.elementAt(3)%>">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-md-4">
                                                        <div class="form-group">
                                                            <label for=""><font color="#990000">*</font>Confirmar documento</label>
                                                            <input type="text" class="form-control" name="doc_est2" placeholder="confirmar documento" size="18" maxlength="20">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div><strong><font color="#990000">*</font>Fecha de nacimiento</strong></div>
                                                    <div class="col-xs-2 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label>D�a</label>
                                                            <select name="campo1"  class="form-control" id="campo1">
                                                                <option value="null" selected>Seleccione</option>
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4</option>
                                                                <option value="5">5</option>
                                                                <option value="6">6</option>
                                                                <option value="7">7</option>
                                                                <option value="8">8</option>
                                                                <option value="9">9</option>
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
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-2 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label>Mes</label>
                                                            <select name="campo2" id="campo2" class="form-control">
                                                                <option value="null" selected>Seleccione</option>
                                                                <option value="01">enero</option>
                                                                <option value="02">febrero</option>
                                                                <option value="03">marzo</option>
                                                                <option value="04">abril</option>
                                                                <option value="05">mayo</option>
                                                                <option value="06">junio</option>
                                                                <option value="07">julio</option>
                                                                <option value="08">agosto</option>
                                                                <option value="09">septiembre</option>
                                                                <option value="10">octubre</option>
                                                                <option value="11">noviembre</option>
                                                                <option value="12">diciembre</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-2 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label>A�o</label>
                                                            <input type="text" class="form-control" name="campo3" placeholder="a�o" size="5" maxlength="4">
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-3 col-md-3">
                                                        <div class="form-group espaciado">
                                                            <label><font color="#990000">*</font>Ciudad de nacimiento</label>
                                                            <select name="campo4" class="form-control" id="campo4">
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
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-3 col-md-3">
                                                        <div class="form-group espaciado">
                                                            <label><font color="#990000">*</font>Pa�s de nacimiento</label>
                                                            <select name="campo5" class="form-control" id="campo5">
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
                                                        </div>
                                                    </div>
                                                </div>   
                                                <div class="row">
                                                    <div class="col-xs-12 col-md-5 col-md-offset-1">		                			
                                                        <p><b>Prest� servicio militar?</b></p>									
                                                    </div>

                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label class="radio-inline">
                                                                <input type="radio" name="campo6"  value="si"> SI
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="campo6"  value="no" checked> NO
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12 col-md-4">
                                                        <div class="form-group espaciado">
                                                            <label for="">Libreta militar n�mero (si no aplica dejelo en blanco)</label>
                                                            <input type="number" class="form-control" name="campo7"  id="campo7" placeholder="Libreta militar" size="15" maxlength="15">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label for="">Distrito No. (si no aplica dejelo en blanco)</label>
                                                            <input type="number" class="form-control" name="campo8"  id="campo8" placeholder="Distrito" size="3" maxlength="3">
                                                        </div>

                                                    </div>
                                                    <div class="col-xs-12 col-md-6">
                                                        <div class="form-group espaciado">
                                                            <label for="">En tr�mite</label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="campo9" id="inlineRadio1" value="si"> SI
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="campo9" id="inlineRadio2" value="no" checked=""> NO
                                                            </label>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-xs-2 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label><font color="#990000">*</font>Sexo</label>
                                                            <select name="campo10" id="campo10" class="form-control">
                                                                <option value="">Seleccione</option>
                                                                <option value="M">Masculino</option>
                                                                <option value="F">Femenino</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-2 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label><font color="#990000">*</font>Estado civil</label>
                                                            <select name="campo11" id="campo11" class="form-control">
                                                                <option value="S" selected>Soltero(A) 
                                                                <option value="C">Casado(A) 
                                                                <option value="P">Separado(A) 
                                                                <option value="V">Viudo(A) 
                                                                <option value="U">Uni�n Libre 
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-6">
                                                        <div class="form-group espaciado">
                                                            <label for=""><font color="#990000">*</font>Correo electr�nico</label>
                                                            <input type="email" class="form-control" name="campo17"  value="<%=pginsc.elementAt(5)%>" maxlength="30" placeholder="correo electr�nico" >
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label for=""><font color="#990000">*</font>Celular</label>
                                                            <input type="text" class="form-control" name="celular"  value="<%=pginsc.elementAt(10)%>" maxlength="10" placeholder="celular">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-xs-12 col-md-6">
                                                        <div class="form-group espaciado">
                                                            <label for=""><font color="#990000">*</font>Direcci�n correspondencia</label>
                                                            <input type="text" class="form-control" name="campo13" size="50" maxlength="35" placeholder="direcci�n" id="campo13">
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label><font color="#990000">*</font>Ciudad</label>
                                                            <select name="campo14" id="campo14" class="form-control">
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
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label for="">Si es otra cual?</label>
                                                            <input type="text" class="form-control" name="campo15" placeholder="otra ciudad" id="campo15">
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-md-2">
                                                        <div class="form-group espaciado">
                                                            <label for=""><font color="#990000">*</font>Tel�fono</label>
                                                            <input type="text" class="form-control" name="campo16" placeholder="tel�fono" id="campo16">
                                                        </div>
                                                    </div>		                	
                                                </div>


                                                <div class="row">
                                                    <div class="col-xs-12 col-md-6">
                                                        <div class="form-group espaciado">
                                                            <label for="">Programa acad�mico</label>
                                                            <%if (pginsc.elementAt(1).equals("19")) {%>
                                                            <input type="text" class="form-control" name="" value="ADMINISTRACION DE EMPRESAS"> 
                                                            <% } else if (pginsc.elementAt(1).equals("18")) {%>

                                                            <input type="text" class="form-control" name="" value="ECONOMIA"> 
                                                            <% } else if (pginsc.elementAt(1).equals("13")) {%>
                                                            <input type="text" class="form-control" name="" value="INGENIERIA CIVIL"> 
                                                            <% } else if (pginsc.elementAt(1).equals("15")) {%>
                                                            <input type="text" class="form-control" name="" value="INGENIERIA DE SISTEMAS"> 
                                                            <%} else if (pginsc.elementAt(1).equals("16")) {%>
                                                            <input type="text" class="form-control" name="" value="INGENIERIA INDUSTRIAL">  
                                                            <%} else if (pginsc.elementAt(1).equals("14")) {%>
                                                            <input type="text" class="form-control" name="" value="INGENIERIA ELECTRICA"> 
                                                            <%} else if (pginsc.elementAt(1).equals("17")) {%>
                                                            <input type="text" class="form-control" name="" value="INGENIERIA ELECTRONICA"> 
                                                            <%} else if (pginsc.elementAt(1).equals("20")) {%>
                                                            <input type="text" class="form-control" name="" value="MATEMATICAS"> 
                                                            <%} else if (pginsc.elementAt(1).equals("260")) {%>
                                                            <input type="text" class="form-control" name="" value="INGENIERIA MECANICA"> 
                                                            <%} else if (pginsc.elementAt(1).equals("264")) {%>
                                                            <input type="text" class="form-control" name="" value="INGENIERIA AMBIENTAL"> 
                                                            <%}%>

                                                        </div>
                                                    </div>
                                                    <%if (!tipo.equals("S")) {%>
                                                    <div class="col-xs-12 col-md-6">
                                                        <div class="form-group">
                                                            <label for="">No. Registro examen de Estado</label>
                                                            <input type="text" class="form-control" value="<%=pginsc.elementAt(4)%>"> 
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-xs-12 col-md-8">
                                                        <div class="form-group espaciado">
                                                            <font color="#990000">*</font> N�mero de documento de identidad con el que present� el examen de Estado Icfes
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-md-4">
                                                        <div class="form-group espaciado">
                                                            <input type="text" class="form-control" name="docicfes" maxlength="15" size="15" placeholder="N�. documento">
                                                        </div>
                                                    </div>
                                                </div>	
                                                <%}%>
                                                <%if (tipo.equals("T")) {%>
                                                <div class="row">
                                                    <div class="col-xs-12 col-md-8">
                                                        <div class="form-group espaciado">
                                                            Prueba de Estado (versi&oacute;n anterior a&ntilde;o 2000)</b>&nbsp; (Si es su caso) <strong><b>Puntaje Total&nbsp; 
                                                                    </div>
                                                                    </div>
                                                                    <div class="col-xs-12 col-md-4">
                                                                        <div class="form-group espaciado">
                                                                            <input type="text" class="form-control" name="ptotal" value="0" size="5" maxlength="10" placeholder="Puntaje Total">
                                                                        </div>
                                                                    </div>
                                                                    </div>
                                                                    <%}%>
                                                                    <div class="separador"></div>

                                                                    <div class="row">

                                                                        <div class="col-xs-12 col-md-4">
                                                                            <h5>Educaci�n secundaria</h5>
                                                                        </div>	              
                                                                    </div>
                                                                    <%if (!tipo.equals("S")) {%>
                                                                    <div class="row">
                                                                        <div class="col-xs-12 col-md-4">
                                                                            <div class="form-group espaciado">
                                                                                <label><font color="#990000">*</font>C�digo ICFES colegio</label>
                                                                                <input type="text" class="form-control" name="campo18" placeholder="n�mero" maxlength="8" value="">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-xs-12 col-md-4">
                                                                            <div class="form-group espaciado">
                                                                                <label><font color="#990000">*</font>Nombre del colegio </label>
                                                                                <select name="campo102" class="form-control">
                                                                                    <option value="null" Selected><font size="3">Seleccione</font></option>
                                                                                    <%   Vector colegios = new Vector();

                                                                                        for (int r = 0; r < Lista.size(); r++) {
                                                                                            colegios = (Vector) Lista.elementAt(r);%>
                                                                                    <option value="<%=colegios.elementAt(1)%>"><font size="3"><%=colegios.elementAt(0)%>-<%=colegios.elementAt(2)%>-<%=colegios.elementAt(3)%></font></option>
                                                                                    <%}%>
                                                                                </select>      

                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-md-4 col-md-offset-1">
                                                                            <div class="form-group espaciado">
                                                                                <p><strong>Si no conoce el c�digo del colegio</strong></p>
                                                                                <p><strong>El que aparece en la primera columna del archivo</strong></p>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-md-2">
                                                                            <div class="form-group espaciado">
                                                                                <a href="http://tycho.escuelaing.edu.co/contenido/documentos/Basecolegios.xls" target="blank" class="btn btn-info" role="button">consulte aqu�</a>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-md-3"></div>
                                                                    </div>
                                                                    <%}else{%>
                                                                        <input name="campo102" type="hidden" value="0">
                                                                    <%}%>
                                                                    <div class="row">
                                                                        <div><font color="#990000">*</font>Fecha de grado</div>
                                                                        <div class="col-xs-12 col-md-2">									
                                                                            <div class="form-group espaciado">
                                                                                <label>Mes</label>
                                                                                <select name="campo19" id="campo19" class="form-control">
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
                                                                            </div>
                                                                        </div>		                		

                                                                        <div class="col-xs-12 col-md-2">
                                                                            <div></div>
                                                                            <div class="form-group espaciado">
                                                                                <label>A�o</label>
                                                                                <input type="text" class="form-control" name="campo20" placeholder="A�o" id="campo20" size="4" maxlength="4">
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-xs-12 col-md-5 col-md-offset-1">		                			
                                                                            <p>Obtuvo validaci�n del bachillerato con el ICFES?</p>									
                                                                        </div>

                                                                        <div class="col-xs-12 col-md-2">
                                                                            <div class="form-group espaciado">
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="campo21" id="campo21" value="S"> SI
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="campo21" id="campo21" value="N" checked=""> NO
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-xs-12 col-md-8">
                                                                            <div class="form-group espaciado">
                                                                                <font color="#990000">*</font> Ultimo valor pagado en pensi�n mensual del colegio <small>(en pesos, sin puntos ni comas, si no aplica escribir 0)</small>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-xs-12 col-md-4">
                                                                            <div class="form-group espaciado">
                                                                                <input type="number" class="form-control"  name="pension" size="8" maxlength="8" placeholder="valor" >
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <%if (tipo.equals("T")) {%>
                                                                    <div class="row">

                                                                        <div class="col-xs-12 col-md-3">									
                                                                            <div class="form-group espaciado">
                                                                                <label>Universidad de procedencia</label>
                                                                                <select name="uproc" id="uproc" class="form-control">
                                                                                    <option value="null" selected> Seleccione </option>
                                                                                    <option value="1">Escuela De Ingenier�a de Antioquia Antioquia</option>
                                                                                    <option value="2">Instituto Tecnol�gico Metropolitano Antioquia</option>
                                                                                    <option value="3">Universidad CES Antioquia</option>
                                                                                    <option value="4">Universidad De Antioquia</option>
                                                                                    <option value="5">Universidad De Medell�n</option>
                                                                                    <option value="6">Universidad Eafit Antioquia</option>
                                                                                    <option value="7">Universidad Pontificia Bolivariana Antioquia</option>
                                                                                    <option value="8">Escuela Naval de Suboficiales ARC Barranquilla</option>
                                                                                    <option value="9">Universidad del Norte Atl�ntico</option>
                                                                                    <option value="10">Colegio Mayor De Nuestra Se�ora del Rosario</option>
                                                                                    <option value="11">Direcci�n Nacional de Escuelas</option>
                                                                                    <option value="12">Universidad de La Salle</option>
                                                                                    <option value="13">Universidad de Los Andes</option>
                                                                                    <option value="14">Universidad EAN</option>
                                                                                    <option value="15">Universidad Externado de Colombia</option>
                                                                                    <option value="16">Universidad Javeriana</option>
                                                                                    <option value="17">Universidad Jorge Tadeo Lozano</option>
                                                                                    <option value="18">Universidad Nacional de Colombia</option>
                                                                                    <option value="19">Universidad Santo Tom�s</option>
                                                                                    <option value="20">Universidad Sergio Arboleda</option>
                                                                                    <option value="21">Fundaci�n Tecnol�gica Antonio De Ar�valo</option>
                                                                                    <option value="22">Universidad de Cartagena</option>
                                                                                    <option value="23">Universidad Tecnol�gica de Bol�var</option>
                                                                                    <option value="24">Universidad Pedag�gica y Tecnol�gica De Colombia</option>
                                                                                    <option value="25">Universidad de Caldas</option>
                                                                                    <option value="26">Universidad del Cauca</option>
                                                                                    <option value="27">Escuela De Suboficiales De La Fuerza A�rea Colombiana Andr�s M. D�az</option>
                                                                                    <option value="28">Universidad de La Sabana</option>
                                                                                    <option value="29">Universidad Tecnol�gica de Pereira</option>
                                                                                    <option value="30">Universidad Aut�noma de Bucaramanga</option>
                                                                                    <option value="31">Universidad Industrial de Santander</option>
                                                                                    <option value="32">Universidad Aut�noma de Occidente</option>
                                                                                    <option value="33">Universidad del Valle</option>
                                                                                    <option value="34">Universidad Icesi</option>
                                                                                    <option value="35">Universidad Javeriana Cali</option>
                                                                                    <option value="36">Otra</option>

                                                                                </select>
                                                                            </div>
                                                                        </div>	
                                                                    </div>

                                                                    <%}%>
                                                                    </div>
                                                                    </div>
                                                                    </div>

                                                                    <!--DATOS ACUDIENTE-->
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-heading" role="tab" id="headingTwo">
                                                                            <h4 class="panel-title">
                                                                                <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                                                    <strong><span class="rojo">PASO 2:</span></strong> Datos del acudiente <small class="acudiente">(preferiblemente el padre o la madre)</small>
                                                                                </a>
                                                                            </h4>
                                                                        </div>
                                                                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                                                            <div class="panel-body">
                                                                                <p>Quien acepta la condici�n de acudiente del aspirante se compromete a  hacerse responsable del estudiante ante a la Escuela frente a los procesos de �ndole acad�mica, personal, familiar, administrativa y financiera y por lo tanto ser� la persona reconocida por la instituci�n para dar y recibir informaci�n respecto a su proceso formativo.</p>
                                                                                <hr>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-12">
                                                                                        <div class="form-group">
                                                                                            <label for=""><font color="#990000">*</font>Nombre completo</label>
                                                                                            <input type="text" class="form-control" name="campo38" placeholder="nombre completo" id="campo38" onBlur="this.value = convertTildes(this.value);" size="25" maxlength="35">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-3">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for=""><font color="#990000">*</font>Parentesco</label>
                                                                                            <select name="campo37" id="campo37" class="form-control">
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
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="col-xs-12 col-md-6">
                                                                                        <div class="form-group">
                                                                                            <label for=""><font color="#990000">*</font>No. Documento identidad</label>
                                                                                            <input type="text" class="form-control" name="campo39" placeholder="n�mero de documento" id="campo39" size="10" maxlength="10">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-8">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for=""><font color="#990000">*</font>Direcci�n</label>
                                                                                            <input type="text" class="form-control" name="campo40" placeholder="direcci�n" id="campo40" size="25" maxlength="35">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for=""><font color="#990000">*</font>Tel�fono</label>
                                                                                            <input type="text" class="form-control" name="campo41" placeholder="tel�fono" id="campo41" size="10" maxlength="20">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group">
                                                                                            <label for=""><font color="#990000">*</font>Ciudad</label>
                                                                                            <input type="text" class="form-control" name="campo42" placeholder="ciudad" id="campo42" size="15" maxlength="15">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label for=""><font color="#990000">*</font>Correo electr�nico</label>
                                                                                        <input type="email" class="form-control" name="emailacud" placeholder="correo electr�nico" id="emailacud" maxlength="30">
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <hr>
                                                                                    <p><strong>Persona diferente del acudiente, residente en Bogot�, D.C.,</strong> <small>(Con tel�fono diferente)</small></p>
                                                                                    <div class="col-xs-12 col-md-6">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Nombre completo</label>
                                                                                            <input type="text" class="form-control" name="campo43" placeholder="nombre completo" id="campo43"  onBlur="this.value = convertTildes(this.value);" size="25" maxlength="35">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Direcci�n</label>
                                                                                            <input type="text" class="form-control" name="campo44" placeholder="direcci�n" size="25" maxlength="35">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group">
                                                                                            <label for="">Tel�fono</label>
                                                                                            <input type="text" class="form-control" name="campo45" placeholder="tel�fono" id="campo45" size="10" maxlength="20">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>


                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!--DATOS HERMANOS-->
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-heading" role="tab" id="headingThree">
                                                                            <h4 class="panel-title">
                                                                                <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                                                    <strong><span class="rojo">PASO 3:</span></strong> Informaci�n de hermanos que estudian actualmente en est� instituci�n (Si no aplica, deje este paso en blanco)
                                                                                </a>
                                                                            </h4>
                                                                        </div>

                                                                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                                                            <div class="panel-body">

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-8">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Apellidos y nombres</label>
                                                                                            <input type="text" class="form-control" name="campo46" placeholder="apellidos y nombres" id="campo46" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">No. Carn� estudiantil de la Escuela</label>
                                                                                            <input type="text" class="form-control" name="campo47" placeholder="N�mero de carn�" size="35" maxlength="20">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-8">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Apellidos y nombres</label>
                                                                                            <input type="text" class="form-control" name="campo48" placeholder="apellidos y nombres" id="campo48" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">No. Carn� estudiantil de la Escuela</label>
                                                                                            <input type="text" class="form-control" name="campo49" placeholder="N�mero de carn�" size="35" maxlength="20">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <hr>
                                                                                    <div class="col-xs-12 col-md-6">
                                                                                        <div class="espaciado">
                                                                                            <p><font color="#990000">*</font>Usted ingresar� simult�neamente con un hermano?</p>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-6">
                                                                                        <div class="form-group espaciado">
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="simultaneo" id="simultaneo" value="S"> SI
                                                                                            </label>
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="simultaneo" id="simultaneo" value="N" checked=""> NO
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>

                                                                                </div>	
                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-8">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Apellidos y nombres</label>
                                                                                            <input type="text" class="form-control" name="hermano" placeholder="apellidos y nombres" id="hermano" onBlur="this.value = convertTildes(this.value);" size="35" maxlength="40">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Documento</label>
                                                                                            <input type="text" class="form-control" name="docher" placeholder="Documento" size="35" maxlength="20">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!--DATOS FAMILIARES-->
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-heading" role="tab" id="headingFour">
                                                                            <h4 class="panel-title">
                                                                                <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                                                                    <strong><span class="rojo">PASO 4:</span></strong> Informaci�n familiar
                                                                                </a>
                                                                            </h4>
                                                                        </div>
                                                                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                                                                            <div class="panel-body">

                                                                                <div class="row">		              
                                                                                    <div class="col-xs-12 col-md-12">
                                                                                        <div class="espaciado">
                                                                                            <h5>Composici�n familiar</h5>
                                                                                        </div>

                                                                                        <div class="form-group espaciado">
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="campo22" id="campo22" value="2" checked><font color="#990000">*</font> Padre y madre unidos
                                                                                            </label>
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="campo22" id="campo22" value="3"> <font color="#990000">*</font>Padres separados
                                                                                            </label>
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="campo22" id="campo22" value="5"> <font color="#990000">*</font>Padres viudos
                                                                                            </label>
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="campo22" id="campo22" value="10"> <font color="#990000">*</font>Padres sin sociedad conyugal
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for=""><font color="#990000">*</font>La vivienda que habita es</label>
                                                                                            <select name="campo30" id="campo30" class="form-control">
                                                                                                <option value="1">Arriendo 
                                                                                                <option value="2" selected>Propia pagada 
                                                                                                <option value="3">Propia deuda 
                                                                                                <option value="5">Familiar 
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group">
                                                                                            <label for="">&nbsp;&nbsp;&nbsp;&nbsp;Estrato de los servicios publicos</label>

                                                                                        </div>
                                                                                    </div>	

                                                                                    <div class="col-xs-12 col-md-1">
                                                                                        <div class="form-group">
                                                                                            <input type="text" class="form-control" name="campo35" size="3" maxlength="2">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="separador"></div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <h5>Acerca del padre</h5>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-1">
                                                                                        <div class="form-group espaciado">
                                                                                            <p>Vive?</p>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-7">
                                                                                        <div class="form-group espaciado">
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="campo50" id="campo50" value="S" checked> SI
                                                                                            </label>
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="campo50" id="campo50" value="N"> NO
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>		              
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="form-group">
                                                                                        <label for="">Nombre completo</label>
                                                                                        <input type="txt" class="form-control" name="campo51" placeholder="nombre completo" value="" size="30" maxlength="40">
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-8">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Direcci�n</label>
                                                                                            <input type="text" class="form-control" name="campo53" placeholder="direcci�n" value="" size="20" maxlength="27">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Tel�fono</label>
                                                                                            <input type="text" class="form-control" name="campo54" placeholder="tel�fono" value="" size="10" maxlength="20">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">ciudad</label>
                                                                                            <input type="text" class="form-control" name="campo55" placeholder="ciudad" value="" size="15" maxlength="9">
                                                                                        </div>
                                                                                    </div>		              
                                                                                </div>


                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Educaci�n</label>
                                                                                            <select name="campo56" id="" class="form-control">
                                                                                                <option value="X" selected>Seleccione 
                                                                                                <option value="P">Primaria 
                                                                                                <option value="S">Secundaria 
                                                                                                <option value="U">Universitaria 
                                                                                                <option value="E">Estudiante Universitario 
                                                                                                <option value="T">T&eacute;cnico 
                                                                                                <option value="L">Tecn&oacute;logo 
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Profesi�n</label>
                                                                                            <select name="campo57" id="campo57" class="form-control">
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
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group">
                                                                                            <label for="">Celular</label>
                                                                                            <input type="text" class="form-control" name="celularp" placeholder="n�mero celular" id="celularp" value="" size="10" maxlength="10">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Ocupaci�n actual</label>
                                                                                            <select name="campo58" id="campo58" class="form-control">
                                                                                                <option value="9">Empleado</option>
                                                                                                <option value="5">Empresario</option>
                                                                                                <option value="7">Trabajo Independiente</option>
                                                                                                <option value="6">Profesional Independiente</option>
                                                                                                <option value="15">Pensionado</option>
                                                                                                <option value="4">Hogar</option>
                                                                                                <option value="0" selected>Otro</option>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-6">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Entidad donde labora</label>
                                                                                            <input type="text" class="form-control" name="campo59" placeholder="entidad donde labora" size="20" maxlength="50">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group">
                                                                                            <label for="">Cargo</label>
                                                                                            <input type="text" class="form-control" name="campo60" placeholder="cargo" size="20" maxlength="20">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">			      
                                                                                            <br>Antig�edad<br><small>(n�mero de meses)</small>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label></label>
                                                                                            <input type="text" class="form-control" name="antiguedadp" placeholder="antig�edad" size="5" maxlength="5">
                                                                                        </div>
                                                                                    </div>	
                                                                                    <div class="col-xs-12 col-md-1"></div>	                	
                                                                                    <div class="col-xs-12 col-md-3">			                		
                                                                                        <div class="form-group espaciado">
                                                                                            <br>Ingresos mensuales<br><small>(en pesos sin puntos ni comas, si no aplica, 0)</small>
                                                                                        </div>
                                                                                    </div>								
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label></label>
                                                                                            <input type="number" class="form-control" name="ingresosp" placeholder="ingreso mensual" size="8" maxlength="8" required="">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2"></div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Direcci�n oficina</label>
                                                                                            <input type="text" class="form-control" name="campo62" placeholder="direcci�n" id="campo62" size="15" maxlength="27">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Correo electr�nico</label>
                                                                                            <input type="email" class="form-control" name="correop" size="50" maxlength="50" placeholder="correo electr�nico" id="correop">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Tel�fono</label>
                                                                                            <input type="text" class="form-control" name="campo63" placeholder="tel�fono" id="campo63" size="10" maxlength="20">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">ciudad</label>
                                                                                            <input type="text" class="form-control" name="campo64" placeholder="ciudad" id="campo64" size="15" maxlength="9">
                                                                                        </div>
                                                                                    </div>		                			              
                                                                                </div>


                                                                                <div class="separador"></div>


                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <h5>Acerca de la madre</h5>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-1">
                                                                                        <div class="form-group espaciado">
                                                                                            <p>Vive?</p>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-7">
                                                                                        <div class="form-group espaciado">
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="campo67" id="campo67" value="S" checked> SI
                                                                                            </label>
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="campo67" id="campo67" value="N"> NO
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>		              
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="form-group">
                                                                                        <label for="">Nombre completo</label>
                                                                                        <input type="txt" class="form-control" name="campo68" placeholder="nombre completo" id="campo68" value="" size="30" maxlength="40">
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-8">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Direcci�n</label>
                                                                                            <input type="text" class="form-control" name="campo70" placeholder="direcci�n" id="campo70" value="" size="25" maxlength="27">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Tel�fono</label>
                                                                                            <input type="text" class="form-control" name="campo71" placeholder="tel�fono" id="campo71" value="" size="10" maxlength="20">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">ciudad</label>
                                                                                            <input type="text" class="form-control" name="campo72" placeholder="ciudad" id="campo72" value="" size="15" maxlength="9">
                                                                                        </div>
                                                                                    </div>		              
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Educaci�n</label>
                                                                                            <select name="campo73" id="campo73" class="form-control">
                                                                                                <option value="X" selected>Seleccione 
                                                                                                <option value="P">Primaria 
                                                                                                <option value="S">Secundaria 
                                                                                                <option value="U">Universitaria 
                                                                                                <option value="E">Estudiante Universitario 
                                                                                                <option value="T">T&eacute;cnico 
                                                                                                <option value="L">Tecn&oacute;logo 
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Profesi�n</label>
                                                                                            <select name="campo74" id="campo74" class="form-control">
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
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group">
                                                                                            <label for="">Celular</label>
                                                                                            <input type="text" class="form-control" name="celularm" placeholder="n�mero celular" id="celularm" value="" size="10" maxlength="10">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Ocupaci�n actual</label>
                                                                                            <select name="campo75" id="campo75" class="form-control">
                                                                                                <option value="9">Empleado</option>
                                                                                                <option value="5">Empresario</option>
                                                                                                <option value="7">Trabajo Independiente</option>
                                                                                                <option value="6">Profesional Independiente</option>
                                                                                                <option value="15">Pensionado</option>
                                                                                                <option value="4">Hogar</option>
                                                                                                <option value="0" selected>Otro</option>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-6">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Entidad donde labora</label>
                                                                                            <input type="text" class="form-control" name="campo76" placeholder="entidad donde labora" id="campo76" size="20" maxlength="50">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group">
                                                                                            <label for="">Cargo</label>
                                                                                            <input type="text" class="form-control" name="campo77" placeholder="cargo" id="campo77" size="20" maxlength="20">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">			      
                                                                                            <br>Antig�edad<br><small>(n�mero de meses)</small>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label></label>
                                                                                            <input type="text" class="form-control"  name="antiguedadm" size="5" maxlength="5" placeholder="antig�edad" id="antiguedadm">
                                                                                        </div>
                                                                                    </div>	
                                                                                    <div class="col-xs-12 col-md-1"></div>	                	
                                                                                    <div class="col-xs-12 col-md-3">			                		
                                                                                        <div class="form-group espaciado">
                                                                                            <br>Ingresos mensuales<br><small>(en pesos sin puntos ni comas, si no aplica, 0)</small>
                                                                                        </div>
                                                                                    </div>								
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label></label>
                                                                                            <input type="number" class="form-control" name="ingresosm" size="8" maxlength="8" placeholder="ingreso mensual" id="ingresosm" required="">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2"></div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Direcci�n oficina</label>
                                                                                            <input type="text" class="form-control" name="campo79" placeholder="direcci�n" id="campo79" size="15" maxlength="27">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-4">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Correo electr�nico</label>
                                                                                            <input type="email" class="form-control" name="correom" size="50" maxlength="50" placeholder="correo electr�nico" id="correom">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">Tel�fono</label>
                                                                                            <input type="text" class="form-control" name="campo80" placeholder="tel�fono" id="campo80" size="10" maxlength="20">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label for="">ciudad</label>
                                                                                            <input type="text" class="form-control" name="campo81" placeholder="ciudad" id="campo81"  size="15" maxlength="9">
                                                                                        </div>
                                                                                    </div>		                			              
                                                                                </div>

                                                                                <div class="separador"></div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-9">
                                                                                        <div class="form-group espaciado">			      
                                                                                            <br><font color="#990000">*</font>Alguno de sus padres es egresado de la Escuela Colombiana de Ingenier�a Julio Garavito
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label></label>
                                                                                            <select name="egresado" id="egresado" class="form-control">
                                                                                                <option value="P" >Padre 
                                                                                                <option value="M">Madre 
                                                                                                <option value="A">Ambos Padres 
                                                                                                <option value="N" selected>Ninguno 
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-1"></div>                			              
                                                                                </div>

                                                                                <div class="row">
                                                                                    <div class="col-xs-12 col-md-9">			                		
                                                                                        <div class="form-group espaciado">
                                                                                            <br>Si hay un tercer responsable de su matr�cula por favor registre los ingresos mensuales <br><small>(en pesos sin puntos ni comas, si no aplica, 0)</small>
                                                                                        </div>
                                                                                    </div>								
                                                                                    <div class="col-xs-12 col-md-3">
                                                                                        <div class="form-group espaciado">
                                                                                            <label></label>
                                                                                            <input type="number" class="form-control"  name="ingresos3" size="8" maxlength="8" placeholder="ingreso mensual" id="ingresos3" required="">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                    <hr>
                                                                                    <div class="col-xs-12 col-md-10">			                		
                                                                                        <div class="form-group espaciado">
                                                                                            Me someto a la MATR�CULA M�XIMA y, por lo tanto, declaro que no presento los documentos que acreditan el ingreso familiar.
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-xs-12 col-md-2">
                                                                                        <div class="form-group espaciado">
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="campo101" id="campo101" value="S"> SI
                                                                                            </label>
                                                                                            <label class="radio-inline">
                                                                                                <input type="radio" name="campo101" id="campo101" value="N" checked> NO
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>								
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <hr>
                                                                        <div class="col-xs-12 col-md-9">			                		
                                                                            <div class="form-group espaciado">
                                                                                <small>La Escuela se reserva el derecho de verificar la informaci�n y los documentos presentados por el aspirante para la liquidaci�n del valor de la matr�cula a trav�s de visitas domiciliarias u otros mecanismos. Cualquier inexactitud en la informaci�n presentada, podr� dar lugar inicialmente a la revisi�n del valor de la matr�cula o eventualmente a la anulaci�n de la admisi�n.</small>
                                                                            </div>
                                                                        </div>


                                                                        <input name="tipoest" type="hidden" id="tipoest" value="<%=pginsc.elementAt(6)%>">
                                                                        <input name="numreg" type="hidden" id="numreg" value="<%=pginsc.elementAt(4)%>">
                                                                        <input name="nom_est" type="hidden" id="nom_est" value="<%=pginsc.elementAt(2)%>">
                                                                        <input name="ref" type="hidden" id="ref" value="<%=pginsc.elementAt(0)%>">
                                                                        <input name="celular" type="hidden" id="celular" value="<%=pginsc.elementAt(10)%>">
                                                                        <input name="programa" type="hidden" id="programa" value="<%=pginsc.elementAt(1)%>">
                                                                        <input name="interes" type="hidden" id="interes" value="">
                                                                        <input name="uplan" type="hidden" id="uplan" value="<%=uplan%>">
                                                                        <input name="pilo" type="hidden" id="uplan" value="<%=pilo%>">
                                                                        <input name="bi"  type="submit" class="boton" value="Enviar Solicitud" onClick="javascript: return validar();">
                                                                    </div>
                                                                    </div>



                                                                    </form>					
                                                                    </div>
                                                                    </div>

                                                                    <div class="proteccionDatos"><small>Protecci�n de datos: La Escuela Colombiana de Ingenier�a Julio Garavito le garantizar� a los titulares de la informaci�n, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteraci�n, p�rdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizar�n para informarlos sobre nuestra oferta acad�mica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
                                                                    </div>

                                                                    </div>
                                                                    </div>


                                                                    <!--FOOTER-->
                                                                    <footer>
                                                                        <div class="container">
                                                                            <div class="row">
                                                                                <article class="redes col-xs-12 col-md-6">
                                                                                    <p>
                                                                                        Siganos en:<br/>

                                                                                    <ul>
                                                                                        <li><a href="https://www.facebook.com/Escuelacolingenieria" target="_blank"><img src="img/icono-facebook.svg" class="f"></a></li>
                                                                                        <li><a href="https://twitter.com/Escuelaing" target="_blank"><img src="img/icono-twitter.svg" class="t"></a></li>
                                                                                        <li><a href="http://instagram.com/escuelaing" target="_blank"><img src="img/icono-instagram.svg" class="i"></a></li>
                                                                                        <li><a href="https://www.youtube.com/user/escuelacolingenieria" target="_blank"><img src="img/icono-youtube.svg" class="y"></a></li>
                                                                                        <li><a href="https://www.linkedin.com/edu/school?id=11508" target="_blank"><img src="img/icono-linkedin.svg" class="l"></a></li>
                                                                                        <li><a href="http://www.pinterest.com/escuelacoling" target="_blank"><img src="img/icono-pinterest.svg" class="p"></a></li>
                                                                                    </ul>

                                                                                    ESCUELA COLOMBIANA DE INGENIER�A JULIO GARAVITO<br/>
                                                                                    AK.45 No.205-59 (Autopista Norte)<br/>
                                                                                    Contact Center: +57(1) 668 3600<br/>
                                                                                    L�nea Nacional Gratuita: 018000112668<br/>
                                                                                    www.escuelaing.edu.co<br/><br/>
                                                                                    Bogot�, D.C. - Colombia<br/>						
                                                                                    </p>
                                                                                </article>
                                                                                <article class="iframe-video col-xs-12 col-md-6">
                                                                                    <p>
                                                                                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1987.9617427360993!2d-74.04338482936627!3d4.783148717834411!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f85e374627fe5%3A0x540783a0b074c84d!2sEscuela+Colombiana+de+Ingenier%C3%ADa!5e0!3m2!1ses!2ses!4v1424190444206" width="100%" height="auto" frameborder="0" style="border:0"></iframe>
                                                                                    </p>
                                                                                    <small>Todos los derechos reservados � 2016 - Escuela Colombiana de Ingenieria Julio Garavito. <br>Personer�a Jur�dica 086 de enero 19 de 1973. Instituci�n sujeta a inspecci�n y vigilancia por el Ministerio de Educaci�n Nacional.</small>
                                                                                </article>
                                                                            </div>
                                                                        </div>
                                                                    </footer>
                                                                    <script src="js/jquery.js"></script>
                                                                    <script src="http://code.jquery.com/jquery-latest.jS"></script>
                                                                    <script src="js/bootstrap.min.js"></script>

                                                                    <!%}%>
                                                                    </body>
                                                                    </html>

                                                                    <%                                                                        } else
                                                                            response.sendRedirect("ErrorPago");
                                                                    %>
