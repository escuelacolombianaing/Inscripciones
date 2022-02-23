<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banco de occidente</title>
    </head>
    <body>
<p>Utilice el comprobante de <font color="#B7003C">RECAUDO EN LINEA</font> del 
  Banco de Occidente el cual puede solicitar en la sucursal donde haga la transacci&oacute;n, 
  consigne $90.000.oo (noventa mil pesos m/cte) en efectivo a nombre de la Escuela 
  Colombiana de Ingenier&iacute;a, cuenta corriente No. 25503548-7.</p>
<p> Registre all&iacute; el n&uacute;mero de referencia de pago que se le asign&oacute; 
  anteriormente. <a href="ejemplopos.htm">Ver ejemplo aqu&iacute;</a>. Tenga en 
  cuenta que Si utiliza un comprobante diferente, su pago no podr&aacute; ser 
  identificado. Al siguente d&iacute;a h&aacute;bil despu&eacute;s de efectuar 
  el pago y a partir de las 10:00 am, ingrese a la p&aacute;gina web de la Escuela, 
  y digite el <u> <i>n&uacute;mero de referencia de pago y el n&uacute;mero del 
  documento de identidad del aspirante</i></u> , el cual le dar&aacute; acceso 
  para diligenciar el formulario de solicitud de admisi&oacute;n en l&iacute;nea. 
  Tenga en cuenta la fecha l&iacute;mite del proceso de inscripciones y los tiempos 
  necesarios para acceder al formulario una vez haya realizado el pago y verifique 
  que este se recibi&oacute; correctamente. </p>
<p>Para atender cualquier dificultad que tenga con su pago, por favor env&iacute;elo 
  v&iacute;a fax al 6762340, Oficina de Admisiones, relacionando el motivo de 
  la dificultad. </p>
<h1> <font size="2" face="Arial, Helvetica, sans-serif"> 
  <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
  <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
  </font></h1>
    
    </body>
</html>
