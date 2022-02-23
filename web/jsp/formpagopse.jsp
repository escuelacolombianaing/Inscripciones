<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>

<%
        response.setHeader("Cache-Control", "no-cache");
        String nsol = request.getParameter("nsol");
        String docInsc = request.getParameter("doc");
        PrintWriter oout = response.getWriter();
        Vector asig = new Vector();
        BDadmisiones bd = new BDadmisiones();
        int i = 0, valor;
        long val = 99000;
        NumberFormat nf = NumberFormat.getIntegerInstance();
        Vector tot = new Vector();
        configeci.configuracion confEci = new configeci.configuracion();
        String pag = new String("");
        Vector inscrito = bd.getInscrito(docInsc, nsol);

        Vector infpago = bd.VerificaPago(nsol, oout);
         String valores = infpago.elementAt(0).toString();
        if (!valores.equals("0.00")) {
            valor = (new Integer(valores)).intValue();
        } else {
            valor = 0;
        }
%>

<html>
    <head>
        <title>Pago derechos de inscripción</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
            <tr>
                <td width="640" valign="top" class="textocom">
                    <jsp:include page="encabezado">
                        <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
                        <jsp:param name="titulo" value="PAGO DERECHOS DE INSCRIPCIÓN" />
                    </jsp:include>
                </td>
            </tr>
            <tr>
                <td width="640" valign="top" height="255"  class="textocom">

                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                    <tr>
                        <td><strong><font color="#990000">Instrucciones para continuar</font></strong></td>
                    </tr>
                    <tr>
                        <td><br>Verifique que todos los datos son correctos. <br>
                            Al hacer click en el bot&oacute;n PAGAR ser&aacute; enviado a una nueva p&aacute;gina
                            en la que deber&aacute; escoger la entidad bancaria donde va a realizar la transacci&oacute;n
                            y el tipo de cliente (Persona Natural o Jur&iacute;dica), all&iacute; encontrar&aacute; un
                            bot&oacute;n (Pagos en línea) que lo direccionar&aacute; a la p&aacute;gina
                            de su banco que le solicitar&aacute; los datos del cliente y proceder&aacute; a realizar
                            el pago. <br>
                            Una vez realizado el pago espere
                            una hora e intente ingresar a la opci&oacute;n 3 del men&uacute; anterior a esta
                            p&aacute;gina (Inscripciones en l&iacute;nea) para
                            diligenciar en l&iacute;nea su formulario de solicitud de admisi&oacute;n. Si
                            su pago no ha sido registrado intente nuevamente una segunda hora mas tarde,
                            si en ese tiempo al intentar diligenciar su formulario el sistema todav&iacute;a
                            no ha registrado su pago comun&iacute;quese con la Oficina de Admisiones Bloque
                            A tercer piso donde se aclararán sus inquietudes, o al email: <a href='mailto:admisiones@escuelaing.edu.co'>admisiones@escuelaing.edu.co</a> o
                        al teléfono 6683600 opción 2 en el menú.</td>
                    </tr>
                    <tr>
                        <td><br><strong><font color="#990000">Instrucciones para tener en cuenta:</font></strong></td>
                    </tr>
                    <tr>
                        <td><br>
                            &#8226; Por seguridad evite realizar este procedimiento
                            desde un computador diferente al de su casa u oficina.<br>
                            &#8226; Este proceso hace internamente varias operaciones
                            por esa raz&oacute;n es posible que se presenten
                            demoras. <br>
                            &#8226; No cancele el proceso prematuramente y
                            no cierre la ventana. <br>
                            &#8226; Si por alg&uacute;n motivo el proceso es cancelado, espere
                            entre media hora y una hora para volverlo a intentarlo.				          <br>
                            &#8226; Una vez realizado el pago, imprima el recibo de confirmaci&oacute;n
                            de la operaci&oacute;n y adj&uacute;ntelo a los documentos de inscripci&oacute;n.<br>
                            &#8226; Finalmente verifique que el pago fu&eacute; debitado de
                            su cuenta.<br>
                            &#8226; Recuerde que este procedimiento se realiza &uacute;nicamente a
                            trav&eacute;s
                            de los links oficiales de la Escuela Colombiana de Ingenier&iacute;a
                            por lo tanto no de informaci&oacute;n personal a trav&eacute;s de
                            links env&iacute;ados por correo electr&oacute;nico o mensajes sospechosos.<br>
                            &nbsp;<br>&nbsp;
                        <hr></td>
                    </tr>
                </table>
                <table width="100%" border="0" align="center">
                    <%
        if (valor >= 99000) {
                    %>
                    <table align="center" border="0" width="640" class="textocom">
                        <tr>
                            <td width="35%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                            <b> Ya tenemos el registro de su pago</b></font></td>
                        </tr>
                    </table>

                    <%                    } else {
                        if (inscrito.size() > 0) {
                    %>
                    <tr>
                        <td>
                            <form method="POST" action="https://www.edinet.com/pse/pago.aspx">
                                <table align="center" border="0" width="640" class="textocom">
                                    <tr>
                                        <td width="35%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                                        <b> Nombre del Aspirante:</b></font></td>
                                        <td width="65%"><%=inscrito.elementAt(2)%></td>
                                    </tr>
                                    <tr>
                                        <td width="35%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                                        <b> Documento de identidad: </b></font></td>
                                        <td width="65%"><%=inscrito.elementAt(3)%></td>
                                    </tr>
                                    <tr>
                                        <td width="35%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                                        <b> Número de referencia: </b></font></td>
                                        <td width="65%"><%=inscrito.elementAt(0)%></td>
                                    </tr>
                                    <tr>
                                        <td width="35%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                                        <b> Valor:</b></font></td>
                                        <td width="65%">$ <%=nf.format(val)%></td>
                                    </tr>
                                    <tr>
                                        <td width="35%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                                        <b> IVA:</b></font></td>
                                        <td width="65%">$ 0.00</td>
                                    </tr>
                                    <input type="hidden" name="Id" value="159cd765-1498-4806-a743-51ae33fc911c">
                                    <input type="hidden" name="CodigoServicio" value="8600348113">
                                    <input type="hidden" name="NoFact" maxlength="80" value="<%=inscrito.elementAt(0)%>">
                                    <input type="hidden" name="Ref1" maxlength="80" value="<%=inscrito.elementAt(3)%>">
                                    <input type="hidden" name="Ref2" maxlength="80" value="<%=inscrito.elementAt(2)%>">
                                    <input type="hidden" name="Ref3" maxlength="80" value="<%=inscrito.elementAt(4)%>">
                                    <input type="hidden" name="Valor" maxlength="10" value="<%=val%>">
                                    <input type="hidden" name="Iva" maxlength="8" value="0">
                                </table>
                                <p align="center" >
                                    <input type="hidden" name="casig" value="<%=i%>">
                                <input type="submit" value="PAGAR" name="B1" class="boton"></p>
                            </form>

                        </td>
                    </tr>
                    <%      }
        }
                    %>
                    <tr>
                        <td valign="top" height="12">
                        </td>
                    </tr>
                    <tr>
                        <td height="5" colspan="3" align="center">
                            <jsp:include page="piepag">
                                <jsp:param name="parametro" value="" />
                        </jsp:include></td>
                    </tr>
                </table>
            </tr>
        </table>
    </body>
</html>