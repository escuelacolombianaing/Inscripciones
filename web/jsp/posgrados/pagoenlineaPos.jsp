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
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">
<!--
function impresion(){
    document.getElementById("tablaboton").style.visibility='hidden';
    window.print();
    
}
-->

        </script>
    </head>
    <body>

        <%if (prog.equals("370")) {%>
        <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="INSTRUCCIONES PARA EL PAGO EN LINEA" />
        </jsp:include>
           <%} else {%>
 <jsp:include page="encabezadoP">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="INSTRUCCIONES PARA EL PAGO EN LINEA" />
        </jsp:include>
            <%  }%>
        <p>&nbsp;</p>

        <% if (prog.equals("13"))
    prog="INGENIERIA CIVIL";
if (prog.equals("14"))
    prog="INGENIERIA ELECTRICA";
if (prog.equals("15"))
    prog="INGENIERIA DE SISTEMAS";
if (prog.equals("16"))
    prog="INGENIERIA INDUSTRIAL";
if (prog.equals("17"))
    prog="INGENIERIA ELECTRONICA";
if (prog.equals("18"))
    prog="ECONOMIA";
if (prog.equals("19"))
    prog="ADMINISTRACION";
if (prog.equals("20"))
    prog="MATEMATICAS";
if (prog.equals("260"))
    prog="INGENIERIA MECANICA";
if (prog.equals("285"))
    prog="PROCESAMIENTO DE POLIMEROS";
if (prog.equals("370"))
    prog="GESTIÓN INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE";
if (prog.equals("312"))
    prog="ESPECIALIZACION EN ESTRUCTURAS";
if (prog.equals("310"))
    prog="ESPECIALIZACION EN RECURSOS HIDRAULICOS Y MEDIO AMBIENTE";
if (prog.equals("324"))
    prog="ESPECIALIZACION EN TELEMATICA APLICADA A NEGOCIOS";
if (prog.equals("374"))
    prog="ESPECIALIZACION EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
if (prog.equals("320"))
    prog="ESPECIALIZACION EN INGENIERIA DE FUNDACIONES";
if (prog.equals("309"))
    prog="ESPECIALIZACION EN SANEAMIENTO AMBIENTAL";
if (prog.equals("313"))
    prog="ESPECIALIZACION EN ECONOMIA PARA INGENIEROS";
if (prog.equals("373"))
    prog="ESPECIALIZACION EN GERENCIA DE OPERACIONES";
if (prog.equals("267"))
    prog="ESPECIALIZACION EN DISEÑO, CONSTRUCCION Y CONSERVACION DE VIAS";
if (prog.equals("332"))
    prog="MAESTRIA EN INGENIERIA ELECTRONICA";
if (prog.equals("333"))
    prog="MAESTRIA EN INGENIERIA ELECTRONICA";
if (prog.equals("351"))
    prog="MAESTRIA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";
if (prog.equals("290") || prog.equals("290")||prog.equals("292")||prog.equals("293")||prog.equals("294") )
    prog="MAESTRIA EN INGENIERIA CIVIL";
if (prog.equals("353"))
    prog="MAESTRIA EN GESTION DE INFORMACION";
if (prog.equals("330"))
    prog="MAESTRIA EN INGENIERIA INDUSTRIAL";
if (prog.equals("335") || prog.equals("336"))
    prog="MAESTRIA EN INGENIERIA ELECTRICA";
if (prog.equals("371"))
    prog="MAESTRÍA EN INFORMÁTICA";
if (prog.equals("372"))
    prog="MAESTRÍA EN CIENCIAS ACTUARIALES";
if (prog.equals("376")|| prog.equals("377"))
    prog="MAESTRÍA EN CIENCIA DE DATOS";
%>	
      
          <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">           
      <p>Usted va a realizar el pago de los derechos de Inscripción ($99.000
        ) en el link que aparece en la parte inferior de esta p&aacute;gina.</p>
                    <p><b>Nombre Aspirante - Programa: <%=nom.toUpperCase()%>&nbsp;&nbsp;<%=apellido1.toUpperCase()%> &nbsp;<%=apellido2.toUpperCase()%>
                    - <%=prog%> </b></p>
                    <p><b>Documento de Identidad:&nbsp;&nbsp;&nbsp;<%=doc%></b> </p>
                    <p><b>Número de referencia:</b> <strong>&nbsp; &nbsp;<%=ref%></strong> 
                    </p>
                  
                    <p align="center">
        <p>No olvide hacer clic en el bot&oacute;n <strong>"REGRESAR A LA TIENDA"</strong> al terminar el pago en PSE para que su pago quede registrado.</p>
      <p>Si desea puede realizar el pago de los derechos de inscripci&oacute;n 
        <strong>a trav&eacute;s de internet</strong> haciendo <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst"><strong>&lt;&lt;CLIK
        AQUI&gt;&gt;</strong></a>, para realizar este proceso debe contar con 
        una cuenta corriente o de ahorros en Colombia. </p>
                    
      <p><i>(En caso de error en el número del documento de identidad que quedó 
        registrado, por favor envíe a la Oficina de admisiones al correo electr&oacute;nico 
        admisiones@escuelaing.edu.co, copia de su documento de identidad solicitando 
        la correspondiente corrección, antes de realizar su pago". Esto evitará 
        posteriores confusiones con su pago).</i></p>
      <p>Para atender cualquier inquietud que tenga con su pago, por favor env&iacute;ela 
        al correo electr&oacute;nico admisiones@escuelaing.edu.co, Oficina de 
        Admisiones, relacionando sus datos.</p>
                <p>&nbsp;</p></td>
           
                    <div align="center">
                        <input name="imprimir" class="boton"  type="submit" id="imprimir3" value="Imprimir"  onClick="impresion()">
                    </div>
                </div>
            </div></div>
    </body>
</html>
