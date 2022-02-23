<%-- 
    Document   : AceptaExamen
    Created on : 9/11/2015, 03:58:23 PM
    Author     : Lucero
--%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>


<% String docEst = request.getParameter("docEst");
    configeci.configuracion confEci = new configeci.configuracion();
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    String valorM = request.getParameter("matematicas");
    String valorF = request.getParameter("fisica");
    String valorQ = request.getParameter("quimica");
    String carnet = request.getParameter("carnet");
    String icfesmat = request.getParameter("icfesmat");
    String icfesfil = request.getParameter("icfesfil");
    String icfesfis = request.getParameter("icfesfis");
    String icfeslen = request.getParameter("icfeslen");
    String icfesqui = request.getParameter("icfesqui");
    String icfesbio = request.getParameter("icfesbio");
    String examat = new String();
    String exafis = new String();
    String exaqui = new String();
    String mensaje = new String();
    int suma = 0, sumaexa=0, sumafinal = 0, sumaInicial=0, sumaexaM=0, sumaexaF=0, sumaexaQ=0, sumaexaL=0, restaMat=0, restaFis=0, restaQui=0, restaLen=0,restaMate=0, restaFisi=0, restaQuim=0, restaLeng=0;

    if (valorM.equals("null") || valorM.equals("0")) {
        examat = icfesmat;
    } else if (valorM.equals("1")) {
        examat = request.getParameter("examat");;
    }

    String exafil = request.getParameter("exafil");

    if (valorF.equals("null") || valorF.equals("0")) {
        exafis = icfesfis;

    } else if (valorF.equals("1")) {
        exafis = request.getParameter("exafis");
    }

    String exalen = request.getParameter("exalen");

    if ((valorQ==null || valorQ.equals("null")) || valorQ.equals("0")) {
        exaqui = icfesqui;

    } else if (valorQ.equals("1")) {
        exaqui = request.getParameter("exaqui");
    }

    String exabio = request.getParameter("exabio");

    String idprog = request.getParameter("idprog");

     Vector CreditosIni = bd.CreditosIni(carnet);
     if (CreditosIni.size() > 0) {
     String dato1 = CreditosIni.elementAt(0).toString();
     int dato = Integer.parseInt(dato1);
    
     Vector sumar = bd.SumarCreditosIni(idprog);
     String mas = sumar.elementAt(0).toString();
     int parcial = Integer.parseInt(mas);
     sumaInicial = dato + parcial ;
     suma = dato + parcial ;
    // out.println(suma);
    // out.println(sumaInicial);
     
     //RESTAR SEGUN SABER 11
     Vector restaM = bd.RestaCreditosM(idprog, icfesmat);
     if (restaM.size()>0){
     String menosM = restaM.elementAt(0).toString();
     restaMat = Integer.parseInt(menosM);
     //suma = suma - restaMat;
     }
     
     Vector restaF = bd.RestaCreditosF(idprog, icfesfis);
     if (restaF.size()>0){
     String menosF = restaF.elementAt(0).toString();
    restaFis = Integer.parseInt(menosF);
    // suma = suma - restaFis;
     }
     
     Vector restaQ = bd.RestaCreditosQ(idprog, icfesqui);
     if (restaQ.size()>0){
     String menosQ = restaQ.elementAt(0).toString();
     restaQui = Integer.parseInt(menosQ);
     //suma = suma - restaQui;
     }
     
     Vector restaL = bd.RestaCreditosL(idprog, icfeslen);
     if (restaL.size()>0){
     String menosL = restaL.elementAt(0).toString();
      restaLen = Integer.parseInt(menosL);
     //suma = suma - restaLen;
     }
     
     suma= sumaInicial - restaMat - restaFis -restaQui - restaLen;
          
     //RESTAR SEGUN CLASIFICACION EXAMEN
     Vector restaMa = bd.RestaCreditosM(idprog, examat);
     if (restaMa.size()>0){
     String menosMa = restaMa.elementAt(0).toString();
      restaMate = Integer.parseInt(menosMa);
    // sumaexaM = sumaInicial - restaMate;
     }
     
     Vector restaFi = bd.RestaCreditosF(idprog, exafis);
     if (restaFi.size()>0){
     String menosFi = restaFi.elementAt(0).toString();
      restaFisi = Integer.parseInt(menosFi);
    // sumaexaF= sumaInicial - restaFisi;
     }
     
     Vector restaQu = bd.RestaCreditosQ(idprog, exaqui);
     if (restaQu.size()>0){
     String menosQu = restaQu.elementAt(0).toString();
      restaQuim = Integer.parseInt(menosQu);
    // sumaexa = sumaInicial - restaQuim;
     }
     
     Vector restaLe = bd.RestaCreditosL(idprog, exalen);
     if (restaLe.size()>0){
         
     String menosLe = restaLe.elementAt(0).toString();
     restaLeng = Integer.parseInt(menosLe);
     // sumaexaL = sumaInicial - restaLeng;
     }
     sumaexa= sumaInicial - restaMate - restaFisi -restaQuim - restaLeng;
               
     sumafinal = sumaexa -suma;
     if (sumafinal<0){
         sumafinal= sumafinal *(-1);
         mensaje = "Cursará " + sumafinal + " créditos menos" ;
     }else if (sumafinal>0){
         mensaje = "Cursará " + sumafinal + " créditos más" ;
     }else {
         mensaje= "";
     }
     

     //out.println(suma);
    // out.println(sumaexa);
     //out.println(sumafinal);
     
    }
/*
     Vector CreditosFin = bd.CreditosFin(carnet, idprog, examat, exafis, exaqui);
     if (CreditosFin.size() > 0){
     Vector CreditosFin1 = (Vector) CreditosFin.elementAt(0);
     Vector CreditosFin2 = (Vector) CreditosFin.elementAt(1);
     Vector CreditosFin3 = (Vector) CreditosFin.elementAt(2);
     String datoFin1= CreditosFin1.elementAt(0).toString();
     String datoFin2= CreditosFin2.elementAt(0).toString();
     String datoFin3= CreditosFin3.elementAt(0).toString();
     int datoF1 = Integer.parseInt(datoFin1);
     int datoF2 = Integer.parseInt(datoFin2);
     int datoF3 = Integer.parseInt(datoFin3);
     sumafinal =  datoF1+ datoF2+datoF3;
     // out.println(sumafinal);
     }
     */

    //int Borrar = bd.BorrarTemporal(carnet, confEci.getPeriodo());
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title> Examen de Conocimiento</title>
        <link href="css/estilo-resultadoconocimiento.css" rel="stylesheet" type="text/css" media="all">
        <script language="JavaScript" type="text/JavaScript">

            function validar() {

            if (!document.form1.acepta.checked) {
            alert("Debe aceptar las condiciones aquí expresadas.");
            return false; 
            }
            }
            
            function confirmacion() {
            var pregunta = confirm("Tenga en cuenta que aún no ha terminado el proceso, por lo cual no ha sido enviada su solicitud de aceptación de las recomendaciones dadas.")
            if (pregunta){
          //  alert("Adios!")
            window.location = "http://www.escuelaing.edu.co";
            }
            else{
            alert("Gracias por permanecer en la página!")
            }
            }
        </script>
    </head>
    <body>
        <div id="container">
            <header>
                <div class="logoescuela">
                    <img src="img/logo-ESCUELA.svg"/>
                </div>
                <img src="img/banner.jpg"/>
                <div class="osiris">Desarrollado por: Direcci&oacute;n de Tecnolog&iacute;a Osiris y Direcci&oacute;n de Comunicaciones y Mercadeo</div>
            </header>
            <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
            <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
            <link href="css/comun.css" rel="stylesheet" type="text/css">
            <h1></h1>


            <form name="form1" method="post" action ="ConfirmaExaCono"  >
                <br>
                <div class="contenidolista"> Tenga en cuenta que: 
                    <br>
                    <ul>
                        <li>Esta decisi&oacute;n no afecta necesariamente, la duraci&oacute;n 
                            de su programa, sin embargo podr&iacute;a cambiar el n&uacute;mero de 
                            cr&eacute;ditos que va a cursar. <%=mensaje%> <br />
                            <!--%=sumafinal%-->        </li>

                        <li>Esta solicitud deberá ser revisada con su acudiente antes de ser enviada, 
                            ya que una vez se envie no podrá ser modificada. </li>
                    </ul>
                    </blockquote>
                    <p>&nbsp;</p>
                    <p> 
                        <input name="valorF" type="hidden"  value="<%=valorF%>">
                        <input name="valorM" type="hidden"  value="<%=valorM%>">
                        <input name="valorQ" type="hidden"  value="<%=valorQ%>">
                        <input name="examat" type="hidden"  value="<%=examat%>">
                        <input name="exafil" type="hidden"  value="<%=exafil%>">
                        <input name="exafis" type="hidden"  value="<%=exafis%>">
                        <input name="exalen" type="hidden"  value="<%=exalen%>">
                        <input name="exaqui" type="hidden"  value="<%=exaqui%>">
                        <input name="exabio" type="hidden"  value="<%=exabio%>">
                        <input name="icfesmat" type="hidden"  value="<%=icfesmat%>">
                        <input name="icfesfil" type="hidden"  value="<%=icfesfil%>">
                        <input name="icfesfis" type="hidden"  value="<%=icfesfis%>">
                        <input name="icfeslen" type="hidden"  value="<%=icfeslen%>">
                        <input name="icfesqui" type="hidden"  value="<%=icfesqui%>">
                        <input name="icfesbio" type="hidden"  value="<%=icfesbio%>">
                        <input name="idprog" type="hidden"  value="<%=idprog%>">
                        <input name="carnet" type="hidden"  value="<%=carnet%>">
                        <input name="docEst" type="hidden"  value="<%=docEst%>">
                    <p class="textoimpremas">&nbsp; </p>
                    <p>&nbsp;</p>

                    <input type="checkbox" name="acepta" value="S">
                    Declaro que mi acudiente y yo conocemos y aceptamos las condiciones aqu&iacute; 
                    expresadas. 
                </div>
                <div align="center"> 

                    <input class="boton" type="submit" name="Submit" value="Enviar"  onclick="return validar();">
                </div>
            </form>
            <div align="center"> 
                <input class="boton" type="submit" name="Submit" value="Salir"  onClick="confirmacion()" >

                <input class="boton" type="submit" name="Submit" value="Regresar"  onClick="location.href = 'RespuestaExaCono?docEst=<%=docEst%>'">

            </div>
            <br>
            <!--<div align="center">
                <input name="Salir" class="boton"  type="submit" id="" value="Salir" onClick="location.href = 'http://www.escuelaing.edu.co'"></div>
            -->
            <p><footer> </footer></p>
        <p><footer><span class="programa">Escuela Colombiana de Ingeniería Julio Garavito 
            </span> <span class="direccion"> AK.45 No.205-59 (Autopista Norte)<br/>
                PBX: +57(1) 668 3600<br/>
                Call Center: +57(1) 668 3600<br/>
                Línea Nacional Gratuita: 018000112668<br/>
                www.escuelaing.edu.co<br/>
                Bogotá, D.C. - Colombia<br/>
            </span> </footer></p>
</body>
</html>
