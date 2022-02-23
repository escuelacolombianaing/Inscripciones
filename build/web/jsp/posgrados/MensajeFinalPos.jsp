<%
String ref, apellido1, apellido2, nom,doc,prog;
apellido1 = request.getParameter("apellido1") ;
apellido2 = request.getParameter("apellido2") ;
nom = request.getParameter("nombre") ;
doc = request.getParameter("doc") ;
ref = request.getParameter("ref") ;
prog = request.getParameter("prog") ;
configeci.configPosgrados confEci = new configeci.configPosgrados();
%>

<html>
    <head>
        <title>Información de Pago de Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
         <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
        <script language="JavaScript" type="text/JavaScript">
            //Estas dos lineas se agregaron en 2020-2 por el tema del Coronavirus
            alert("Su solicitud de número de referencia se realizó con éxito. El número de referencia es: <%=ref%>. Tenga  en cuenta que este número le será solicitado para el diligenciamiento del formulario")
            location.href = '/inscripcioneslinea/InicioPosgrado';
            
<!--
function impresion(){
    document.getElementById("tablaboton").style.visibility='hidden';
    window.print();
    
}
        --> </script>
    </head>
    
    <body>
          <%if (prog.equals("370")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="3. SOLICITUD DE NUMERO DE REFERENCIA DE PAGO PARA HACER LA INSCRIPCION" />
        </jsp:include>
           <%} else {%>
               <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="3. SOLICITUD DE NUMERO DE REFERENCIA DE PAGO PARA HACER LA INSCRIPCION" />
        </jsp:include>
                <%  }%>
        <p align="center"><b><font size="3">Una vez seleccione la forma de pago
        el sistema le informar&aacute; el n&uacute;mero de referencia.</font></b></p>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
          <p>1. <span class="resaltados"><font size="2" face="Arial, Helvetica, sans-serif"><b>Pago</b></font></span><b><font size="2" face="Arial, Helvetica, sans-serif"> 
            en efectivo en bancos:</font></b><font size="2" face="Arial, Helvetica, sans-serif"> 
            Consigne $99.000(noventa y nueve mil pesos m/cte) en efectivo a nombre de
            la Escuela Colombiana de Ingenier&iacute;a. Siga las instrucciones 
            de acuerdo con la entidad bancaria en la cual realizar&aacute; el 
            pago:</font> </p>
        
        
              <li><b><a href="MensajeOccidentePos?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%>">Banco
                de Occidente</a></b></li>
              <li><a href="MensajeSantanderPos?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%> "><b><i>Banco Itaú </i></b></a><font face="Arial, Helvetica, sans-serif" size="2"><br>
                </font><font face="Arial, Helvetica, sans-serif" size="2"><br>
                </font></li>
           
       
          <p><span class="resaltados">2. <b><font size="2" face="Arial, Helvetica, sans-serif">Pago 
            en l&iacute;nea :</font></b> <b><i><a href="PagoLineaPos?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%>">Para
            consultar instrucciones haga click Aqu&iacute;</a></i></b></span><br>
          </p>
          <p>3. <b> <font size="2" face="Arial, Helvetica, sans-serif">Pago mixto. 
            </font></b><i><b><a href="TarjetaPos?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%>">Para
            consultar instrucciones haga click Aqu&iacute;</a></b></i></p>
          <p><i></i></p>
        
    
                  
               
       <p>&nbsp;</p>
    <p><b><i>Despu&eacute;s de haber realizado el pago, recuerde diligenciar su 
      formulario para terminar el proceso de inscripci&oacute;n.</i></b></p>
    <p><b><i>Si tiene inquietudes por favor comun&iacute;quese al tel&eacute;fono 
      6683600 opción 2 en el menú.</i></b></p>
    
<p></div> </div> </div> </div></p>
    </body>
</html>
<!--%
    sesion = request.getSession(false) ;
    sesion.invalidate() ;
%-->
