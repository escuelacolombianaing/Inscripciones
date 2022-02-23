<%
String ref, apellido1,apellido2, nom,doc,prog;
apellido1 = request.getParameter("apellido1") ;
apellido2 = request.getParameter("apellido2") ;
nom = request.getParameter("nombre") ;
doc = request.getParameter("doc") ;
ref = request.getParameter("ref") ;
prog = request.getParameter("prog") ;
configeci.configmaestria confEci = new configeci.configmaestria();
%>

<html>
    <head>
        <title>Información de Pago de Inscripción del Aspirante</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
         <meta http-equiv="X-UA-Compatible" content="IE=edge"
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">
            //Estas dos lineas se agregaron en 2020-2 por el tema del Coronavirus
            alert("Su solicitud de número de referencia se realizó con éxito. El número de referencia es: <%=ref%>. Tenga  en cuenta que este número le será solicitado para el diligenciamiento del formulario")
            location.href = '/inscripcioneslinea/InicioPosgrado';
            
<!--
function impresion(){
    document.getElementById("tablaboton").style.visibility='hidden';
    window.print();
    
}
-->

        </script>
    </head>
    
    <body>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE NUMERO DE REFERENCIA DE PAGO PARA HACER LA INSCRIPCION" />
        </jsp:include>
        
        <p align="center"><b><font size="4">Una vez seleccione la forma de pago 
        el sistema le informar&aacute; el n&uacute;mero de referencia.</font></b></p>
          <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
       
       
                            <p>1. <span class="resaltados"><font size="2" face="Arial, Helvetica, sans-serif"><b>Pago</b></font></span><b><font size="2" face="Arial, Helvetica, sans-serif"> 
                                en efectivo en Bancos:</font></b><font size="2" face="Arial, Helvetica, sans-serif"> 
                                    Consigne $99.000(noventa y nueve mil pesos m/cte) en efectivo a nombre
                                    de la Escuela Colombiana de Ingenier&iacute;a. Siga las instrucciones 
                                de acuerdo a la entidad bancaria en la cual realizar&aacute; el pago:</font> 
                            </p>
                      
                      
                                    <li><i><b><a href="OccidenteMensaje?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%>">Banco 
                                    de occidente</a></b></i></li>
                                    <li><a href="SantanderMensaje?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%> "><b><i>BANCO ITAÚ </i></b></a><font face="Arial, Helvetica, sans-serif" size="2"><br>
                                        </font><font face="Arial, Helvetica, sans-serif" size="2"><br>
                                    </font></li>
                              
                       
                            <p><span class="resaltados">2. <b><font size="2" face="Arial, Helvetica, sans-serif">Pago 
                                    en L&iacute;nea :</font></b> <b><i><a href="LineaPago?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%>">Para 
                                consultar instrucciones haga click Aqu&iacute;</a></i></b></span><br>
                            </p>
                            <p>3. <b> <font size="2" face="Arial, Helvetica, sans-serif">Pago con 
                                tarjeta d&eacute;bito o tarjeta cr&eacute;dito: </font></b><i><b><a href="PagoTarjeta?apellido1=<%=apellido1%>&apellido2=<%=apellido2%>&nombre=<%=nom%>&ref=<%=ref%>&prog=<%=prog%>&doc=<%=doc%>">Para 
                            consultar instrucciones haga click Aqu&iacute;</a></b></i></p>
                            <p><i></i></p>
              
      </div> </div> </div> 
        
    </body>
</html>
<!--%
    sesion = request.getSession(false) ;
    sesion.invalidate() ;
%-->
