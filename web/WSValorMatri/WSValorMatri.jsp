<%-- 
    Document   : WSValorMatri
    Created on : 5/09/2018, 08:28:16 AM
    Author     : andres.rojas
--%>

<%@page import="BDatos.BDadmisiones"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    String autenticado="0";
    String datosIngresados="0";
    Boolean errorDatos=false;
    BDadmisiones bd=new BDadmisiones();
    HttpSession actualSession = request.getSession();
    
    
    int ingresosma, ingresospa, total, ingresostercero, matult, smin = 877;
    float pA, pB, pC, pD, mat1, mat2, matdef, tmp, rango, sdomin, liminter, max1, max2, max3;
    float minima = (float) 4500;
    float auto = (float) 1;
    float min = (float) 4.7;
    String usuario = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasena");
    String ingresosm = request.getParameter("ingresosm");
    String ingresosp = request.getParameter("ingresosp");
    String ingresos3 = request.getParameter("ingresos3");
    String programa = request.getParameter("programa");
    String pension = request.getParameter("pension");
    String ingresoDatos = request.getParameter("ingresoDatos");
    String cerroSesion = request.getParameter("cerroSesion");
    if(cerroSesion!=null&&cerroSesion.equals("1")){
        actualSession.setAttribute("autenticado", "0");
    }
    
    
    if(ingresoDatos!=null&&ingresoDatos.equals("1")){
        actualSession.setAttribute("datosIngresados", "1");
    }else{
        actualSession.setAttribute("datosIngresados", "0");
    }
    
    rango = 200;
    sdomin = 4500;
    liminter = 30;
    max1 = 5500;
    max2 = 7100;
    //max3 = 7700;
    max3 = 10900;
    
    
    matdef=0;
    
    if((usuario != null && !usuario.equals(""))&&(contrasena != null && !contrasena.equals(""))&&bd.loginWSValorMatri(usuario, contrasena)>0){
        actualSession.setAttribute("autenticado", "1");
    }
    
    if(actualSession.getAttribute("datosIngresados")!=null&&actualSession.getAttribute("datosIngresados").equals("1")){
        if (ingresosm.equals("null") || ingresosm.equals("")) {
            ingresosm = "0";
        }
        if (ingresosp.equals("null") || ingresosp.equals("")) {
            ingresosp = "0";
        }

        if (ingresos3.equals("null") || ingresos3.equals("")) {
            ingresos3 = "0";
        }

        ingresospa = Integer.parseInt(ingresosp) * 12;
        ingresosma = Integer.parseInt(ingresosm) * 12;
        ingresostercero = Integer.parseInt(ingresos3) * 12;
        total = (ingresospa + ingresosma + ingresostercero) / 1000;
        if (total <= 0) {
            errorDatos=true;
        } else {
            if (programa.equals("18") || programa.equals("19")) {
                pA = (float) 5.8;
                pB = (float) 1.015;
                pC = (float) 5.2;
                pD = (float) 0.01;
            } else if (programa.equals("20")) {
                pA = (float) 4.0;
                pB = (float) 1.015;
                pC = (float) 4.5;
                pD = (float) 0.008;
            } else {
                //Ojo, este cambio se implemento en 2019-1
                min= (float) 4.73;
                pA = (float) 8.2;
                pB = (float) 1.15;
                pC = (float) 7.2;
                pD = (float) 0.01225;
            }
            // double pgeduc= Double.valueOf(pension)
            //pasamos el valor de la pension a tipo double para realizar la operacion
            // float pension = float.parse(pgeduc);
            float pgeduc = Float.parseFloat(pension);
            //   valueOf(pension).floatValue();
            pgeduc = (pgeduc * auto / (smin * 1000));
            float ting = total;
            ting = (ting * auto / smin);

            mat1 = (float) (min + (pA * Math.atan(pB * pgeduc))) * smin;
            mat2 = (float) (min + (pC * Math.atan(pD * ting))) * smin;

            matdef = Math.max(mat1, mat2);
            int matd = (int) matdef;
            float nvomatd = matd;
            float matde = (nvomatd / 1000);
            //
            int ent = (int) matde;
            float nvoent = ent;
            float res = (matde - nvoent);
            float mul = (res * 10);
            int ult = (int) mul;

            if (ult == 0) {
                ult = 1;
            } else if (ult == 1) {
                ult = 1;
            } else if (ult == 2) {
                ult = 3;
            } else if (ult == 3) {
                ult = 3;

            } else if (ult == 4) {
                ult = 5;

            } else if (ult == 5) {
                ult = 5;
            } else if (ult == 6) {
                ult = 7;

            } else if (ult == 7) {
                ult = 7;

            } else if (ult == 8) {
                ult = 9;

            } else if (ult == 9) {
                ult = 9;

            }
            int definit = ((ent * 1000) + (ult * 100));
    //            matult = Math.round(matdef / rango) * (int) rango;
            //matdef = matult;
            matdef = Math.max(minima, definit);

            /*          tmp = (matdef * 100 / rango) % 100;
             if (tmp >= liminter) {
             matdef = (matdef / rango) + 1;
             matdef = (int) Math.floor(matdef);
             } else {
             matdef = (matdef / rango);
             matdef = (int) Math.floor(matdef);
             }

             matdef = (matdef * rango);*/

            //Evaluamos programas para máximas
            //matdef = matdef * auto;
            if (programa.equals("20") && matdef > max1) {
                matdef = max1;
            } else if ((programa.equals("18") || programa.equals("19")) && (matdef > max2)) {
                matdef = max2;
            } else if (matdef > max3) {
                matdef = max3;
            }
            matdef = matdef * 1000;
            
        }
    }
    
    
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>CONSULTA DE VALOR APROXIMADO DE MATRICULA - ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO</title>
    <style>
        label {
            text-align: justify;
         }
    </style>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="Content-Language" content="ES" />
    <meta name="language" content="spanish" />
    <meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
    <meta name="copyright" content="Copyright (c) 2018" />
    <meta name="description" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
    <meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="WSValorMatri/css/seguimiento.css">     
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="WSValorMatri/img/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Arsenal" rel="stylesheet">

</head>
<body>

<header>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <center><img src="WSValorMatri/img/img-header.jpg" class="img-responsive"></center>
            </div>
        </div>
    </div>
</header>
<!--CONTENIDOS-->
<%  
    
    if(actualSession.getAttribute("autenticado")==null||!actualSession.getAttribute("autenticado").equals("1")){
%>
    <section>
        <div class="jumbotron">
            <div class="container inscripcion">
                <div class="row">
                    <div class="col-sm-7 col-md-6 col-md-offset-1">
                        <h1>Consulta de Valor Aproximado de Matrícula</h1>
                    </div>
                    <div class="col-sm-5 col-md-5">
                        <div class="formulario">
                            <form class="form-horizontal" method="post" action="WSValorMatri">
                                <div class="form-group">
                                    <label for="usuario" class="col-sm-9 col-md-5 control-label">Nombre de Usuario:</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="text" class="form-control" name="usuario" id="usuario" required="">
                                    </div>
                                    <label for="contrasena" class="col-sm-9 col-md-5 control-label">Contraseña:</label>
                                    <div class="col-sm-12 col-md-7">
                                        <input type="password" class="form-control" name="contrasena" id="contrasena" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-offset-5 col-md-7">
                                      <button type="submit" class="btn btn-default">Iniciar Sesión</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%
    }else if(actualSession.getAttribute("datosIngresados")!=null&&actualSession.getAttribute("datosIngresados").equals("1")){
%>
    <section>
        <div class="jumbotron">
            <div class="container inscripcion">
                <div class="row">
                    <div class="col-sm-7 col-md-6 col-md-offset-1">
                        <h1>Consulta de Valor Aproximado de Matrícula</h1>
                    </div>
                    <%
                        if(!errorDatos){
                    %>
                        <div class="col-sm-5 col-md-5">
                                <div class="form-group">
                                    <h2 class="col-sm-9 col-md-5 control-label">Valor Aproximado de Matrícula: <%=Integer.toString((int) matdef)%></h2>
                                </div>
                        </div>
                    <%
                        }else{
                    %>
                        <div class="col-sm-5 col-md-5">
                                <div class="form-group">
                                    <h2 class="col-sm-9 col-md-5 control-label">Datos erroneos, intente nuevamente.</h2>
                                </div>
                        </div>
                    <%
                        }
                    %>
                    <%
                    if(actualSession.getAttribute("autenticado").equals("1")){
                        %>
                            <div class="form-group">
                                <form class="form-horizontal" method="post" action="WSValorMatri">
                                    <input type="hidden" name="cerroSesion" id="cerroSesion" value="1">
                                    <div class="col-md-offset-5 col-md-7">
                                        <button type="submit" class="btn btn-default">Cerrar Sesión</button>
                                    </div>
                                </form>
                            </div>
                        <%
                    }
                    %>
            </div>
        </div>
    </section>
<%
    }else{
%>
    <section>
        <div class="jumbotron">
            <div class="container inscripcion">
                <div class="row">
                    <div class="col-sm-7 col-md-6 col-md-offset-1">
                        <h1>Ingrese todos los datos</h1>
                    </div>
                    <div class="col-sm-5 col-md-5">
                        <div class="formulario">
                            <form class="form-horizontal" method="post" action="WSValorMatri">
                                <div class="form-group">
                                    <label for="programa" class="col-sm-9 col-md-5 control-label">Programa Académico:</label>
                                    
                                        <select required="" class="form-control" name= "programa" id="programa">
                                            <option value="">Seleccione</option>
                                            <option value="19">Administración de Empresas</option>
                                            <option value="18">Economía</option>
                                            <option value="13">Ingeniería Civil</option>
                                            <option value="15">Ingeniería de Sistemas</option>
                                            <option value="16">Ingeniería Industrial</option>
                                            <option value="14">Ingeniería Eléctrica</option>
                                            <option value="17">Ingeniería Electrónica</option>
                                            <option value="20">Matemáticas</option>
                                            <option value="264">Ingeniería Ambiental</option>
                                            <option value="260">Ingeniería Mecánica</option>
                                        </select>
                                    
                                    <br>
                                    <label for="ingresosm" class="col-sm-9 col-md-5 control-label">Ingresos de la Madre (Mensuales en pesos):</label>
                                    
                                        <input type="number" min="0" class="form-control" name="ingresosm" id="ingresosm" required="">
                                    
                                    <br>
                                    <label for="ingresosp" class="col-sm-9 col-md-5 control-label">Ingresos del Padre (Mensuales en pesos):</label>
                                    
                                        <input type="number" min="0" class="form-control" name="ingresosp" id="ingresosp" required="">
                                    
                                    <br>
                                    <label for="ingresos3" class="col-sm-9 col-md-5 control-label">Ingresos de un tercero (Mensuales en pesos):</label>
                                    
                                        <input type="number" min="0" class="form-control" name="ingresos3" id="ingresos3" required="">
                                    
                                    <br>
                                    
                                    <label for="pension" class="col-sm-9 col-md-5 control-label">Pensión del Colegio (Mensual en pesos):</label>
                                    
                                        <input type="number" min="0" class="form-control" name="pension" id="pension" required="">
                                    
                                    <input type="hidden" name="ingresoDatos" id="ingresoDatos" value="1">
                                </div>
                                <div class="form-group">
                                    <div class="col-md-offset-5 col-md-7">
                                        <button type="submit" class="btn btn-default">Enviar Datos</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%
                    if(actualSession.getAttribute("autenticado").equals("1")){
                        %>
                            <div class="form-group">
                                <form class="form-horizontal" method="post" action="WSValorMatri">
                                    <input type="hidden" name="cerroSesion" id="cerroSesion" value="1">
                                    <div class="col-md-offset-5 col-md-7">
                                        <button type="submit" class="btn btn-default">Cerrar Sesión</button>
                                    </div>
                                </form>
                            </div>
                        <%
                    }
                    %>
                </div>
            </div>
        </div>
    </section>
<%
    }

    
%>
<!--FOOTER-->
<footer class="footerContainer">
    <div class="container">        
        <div class="row">
            <article class="col-sm-7 col-md-5">
                <p>                    
                    <strong>ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO</strong><br/>
                    AK.45 No.205-59 (Autopista Norte)<br/>
                    <i>Contact center</i>: +57(1) 668 3600<br/>
                    Línea Nacional Gratuita: 018000112668<br/>
                    Información detallada en: www.escuelaing.edu.co<br/><br/>
                    <small>Personería Jurídica 086 de enero 19 de 1973. Acreditación institucional de alta calidad. Res. 20273 del 27 de noviembre de 2014. (Vigencia 4 años).<br>
                    Vigilada Mineducación.</small><br><br>
                    Bogotá, D.C. - Colombia<br/>
                
            </article>
            <article class="col-sm-5 col-md-7">
                <p>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1987.9617427360993!2d-74.04338482936627!3d4.783148717834411!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f85e374627fe5%3A0x540783a0b074c84d!2sEscuela+Colombiana+de+Ingenier%C3%ADa!5e0!3m2!1ses!2ses!4v1424190444206" width="100%" height="280" frameborder="0" style="border:0"></iframe>
                </p>
            </article>
        </div> 
    </div>       
</footer>
