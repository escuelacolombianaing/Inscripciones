<%-- 
  Document   : DocumentosPregrado
  Created on : 13/09/2011, 02:40:18 PM
  Author     : 
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    String docEst = request.getParameter("doc");
    String pant = "", pact = "", idest = "", conadm = "";
    int conp = 0, pag = 0;
    long idinsc = 0, val = 0, idinscant = 0;
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    configeci.configuracion confEci = new configeci.configuracion();
    //==Busco periodo anterior

    String per = confEci.getFechaN();
    pant = per.substring(0, 4);
    String p = per.substring(5, 6);
    if (p.equals("1")) {
        p = "primer";
    } else {
        p = "segundo";
    }

    //==Busco periodo actual
    String peract = confEci.getPeriodo();
    pact = peract.substring(0, 4);
    String pp = peract.substring(5, 6);
    if (pp.equals("1")) {
        pp = "primer";
    } else {
        pp = "segundo";
    }

    /*Buscar si el aspirante ya solicito referencia para el periodo actual y si ya la pago
     * no puede realizar el proceso, si no la pago se debe actualizar el registro a un peso 
     * para el periodo actual
     * */
    Vector pago = bd.RefPago(docEst, peract, oout);
    if ((pago.size()) == 0) {
        //CONSULTA PARA PERIODO ANTERIOR...................
        pago = bd.RefPago(docEst, per, oout);
        if ((pago.size()) == 0) {
            conp = 0;
        } else {
            conp = 2;
            idinsc = Long.parseLong((String) pago.elementAt(0));
            val = Long.parseLong((String) pago.elementAt(1));
        }
    } else {
        conp = 1;
        idinsc = Long.parseLong((String) pago.elementAt(0));
        val = Long.parseLong((String) pago.elementAt(1));
        if (val == 1) {
            pag = 1;
        }
    }
    HttpSession sesion;
    sesion = request.getSession(true);
    if (docEst != null && !docEst.equals("")) {
        Vector consulta = bd.InfAspirante(docEst, confEci.getFechaN(), oout);
        if (consulta.size() > 0) {
            conadm = consulta.elementAt(4).toString();
        }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Activaci�n Admisi�n Primer Semestre</title>
        <link href="css/forms.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/tablas.css"/>
        <SCRIPT LANGUAGE="JavaScript">

            function comprueba() {
                if (!document.forms.form1.inten[0].checked && !document.forms.form1.inter[1].checked) {
                    alert("Usted debe seleccionar si esta o no interesado(a) en continuar el proceso");
                    return false;
                }
            }

        </SCRIPT>
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Activaci�n Admisi�n Primer Semestre" />
        </jsp:include>

        <%if ((consulta.size()) == 0 && conp == 1) {
                Vector consulta1 = bd.InfAspirante(docEst, peract, oout);
                if ((consulta1.size()) == 0) {%>
    <center>
        <table width="45%" border="0" class="textoimpre">
            <tr>
                <td>
                    <div align="center"><p>&nbsp;</p>Su documento es incorrecto o usted no realizo proceso de Admisi�n para el per�odo <%=per%>.</div>
                </td>
            </tr>
        </table>
    </center>
        <%} else {
            if (consulta1.elementAt(4).equals("S")) {%>
    <center>
        <table width="100%" border="0" >
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><b>Estimado Aspirante:</b>&nbsp; <%=consulta1.elementAt(0)%>
                    <p align="justify">�Bienvenido a la Escuela Colombiana de Ingenier�a Julio Garavito! </p>
                    <p align="justify">Teniendo en cuenta su inter�s de continuar con el proceso
                        de admisi�n al programa <%=consulta1.elementAt(1)%>, hemos habilitado el pago de su inscripci�n
                        y su registro de admisi�n para el <%=pp%> periodo acad�mico del <%=pact%>, si solicit� la activaci�n de admisi�n antes del 10 de noviembre generaremos su nueva orden de matr�cula el d�a 17 de noviembre de 2017 de acuerdo a la documentaci�n presentada en el periodo anterior.</p>
                    <p align="justify">Si usted no entrego completa la documentaci�n para el periodo <%=per%>, le solicitamos consulte los documentos que debe anexar siguiendo este <a href="http://www.escuelaing.edu.co/es/programas/admisiones/pregrado?id=1&itemId=3">enlace </a>para continuar con el proceso de liquidaci�n de matr�cula y generaci�n de orden de pago. </p>
                    
                    <p align="justify">Si usted es del programa de Ingenier�a Biom�dica consulte <a href="http://tycho.escuelaing.edu.co/PagosenLinea/loginEst"> AQUI </a>para descargar su orden de matr�cula 24 horas despu�s de hacer la activaci�n de su cupo. Si corresponde a otro programa, es importante que remita los documentos para la liquidaci�n de la matr�cula actualizados, los cuales puede enviar a trav�s de nuestra p�gina web, a trav�s de correo certificado o entregarlos en las ventanillas de la Oficina de Admisiones  (Plazoleta del Bloque A, primer piso).  M�ximo el d�a 25 DE MAYO.                <br>Los documentos, y la informaci�n relacionada con el tr�mite, cons�ltela ingresando por la siguiente direcci�n electr�nica:  <a href="http://www.escuelaing.edu.co/es/programas/admisiones/pregrado?id=1&itemId=3" target = "_blank"> http://www.escuelaing.edu.co/es/programas/admisiones/pregrado?id=1&itemId=3</a></p>
                    <p align="justify">Recuerde que las consultas asociadas a su proceso, puede realizarlas ingresando
                        con su n�mero de documento de identidad y el n�mero de referencia <b><%=consulta1.elementAt(3)%></b> </p>
                    <p align="justify">Nos alegra que haya tomado esta decisi�n, y esperamos poder
                        contribuir en su formaci�n personal y profesional.</p>
                    <br>
                    <p align="justify">Cordialmente,</p>
                    <br>
                    <p align="justify">OFICINA
                        DE ADMISIONES</p>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </center>
    <%} else if (consulta1.elementAt(4).equals("N")) {%>
    <center>
    <table width="45%" border="0"  >
        <tr>
            <td>
                <div align="left"><p>&nbsp;</p>Estimado Aspirante: <%=consulta1.elementAt(0)%> </div>
                <p> Le agradecemos por tenernos en cuenta entre sus opciones para adelantar su programa de pregrado y le deseamos �xitos en el desarrollo de su carrera profesional en la Instituci�n que haya elegido.</p>
                <p align="justify">Cordialmente,</p>
                <br>
                <p align="justify">OFICINA
                    DE ADMISIONES </p>
                <p>&nbsp;</p>
            </td>
        </tr>
    </table>
    </center>
    <%} else {%>
    <center>
        <table width="45%" border="0" >
            <tr>
                <td>
                    <div align="left"><p>&nbsp;</p>Estimado Aspirante: <%=consulta1.elementAt(0)%> </div>
                    <p>Usted no es un usuario autorizado para este proceso.</p>
                </td>
            </tr>
        </table>
    </center>
    <% }

        }%>
    <%  } else if (consulta.size() > 0 && conadm.equals("S")) {%>
    <center>
        <table width="40%" border="0" class="textoimpre" >
            <tr>
                <td>
                    <div align="left"><p>&nbsp;</p>Usted ya realizo este proceso para el per�odo <%=per%>, por lo que debe continuar el proceso como aspirante nuevo.</div>
                    <p>&nbsp;</p>
                </td>
            </tr>
        </table>
    </center>
    <%  } else if (val > 0 && conp == 1 && pag == 0) {%>
    <center>

        <table width="40%" border="0" class="textoimpre" >
            <tr>
                <td>
                    <div align="left"><p>&nbsp;</p>Usted ya realizo el pago de inscripci�n para el per�odo <%=peract%>, por lo que debe continuar el proceso como aspirante nuevo.</div>
                    <p>&nbsp;</p>
                </td>
            </tr>
        </table>        
    </center>    
        <%
    } else if (consulta.size() == 0) {%>
    <center>
    <table width="40%" border="0" class="textoimpre">
        <tr>
            <td>
                <div align="center"><p>&nbsp;</p>Su documento es incorrecto o usted no realizo proceso de Admisi�n para el per�odo <%=per%>.</div>
                <p>&nbsp;</p>
            </td>
        </tr>
    </table>
    </center>
    <%  } else if (consulta.elementAt(4).equals("N")) {%>
    <center>
    <table width="45%" border="0">
        <tr>
            <td>
                <div align="left"><p>&nbsp;</p>Estimado Aspirante: <%=consulta.elementAt(0)%> </div>
                <p> Le agradecemos por tenernos en cuenta entre sus opciones para adelantar su programa de pregrado y le deseamos �xitos en el desarrollo de su carrera profesional en la Instituci�n que haya elegido.</p>
                <p align="justify">Cordialmente,</p>
                <br>
                <p align="justify">OFICINA
                    DE ADMISIONES </p>
                <p>&nbsp;</p>
            </td>
        </tr>
    </table>
    </center>
    <%} else {
    %>
    <form name="form1" method="post" action="RegSolic">
        <center>
        <table width="45%" border="0">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><b>Estimado Aspirante:</b>&nbsp;<%=consulta.elementAt(0)%>
                    <p align="justify">Teniendo en cuenta que usted fue admitido para el <%=p%> semestre del <%=pant%> al programa de <%=consulta.elementAt(1)%>, nos permitimos informarle que si es de su inter�s continuar con este tr�mite para el <%=pp%> periodo del <%=pact%>, la Escuela habilitar� el pago de su inscripci�n y la admisi�n correspondiente, es decir, que no tendr� que pagar inscripci�n nuevamente.</p>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><p align="justify">Si se encuentra interesado en continuar con el proceso de admisi�n para iniciar sus estudios en el programa de <%=consulta.elementAt(1)%>, en el <%=pp%> periodo del <%=pact%>, elija dicha opci�n.</p></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0">
                        <tr bgcolor="#F3F3F3"> 
                            <td width="52%"> 
                                <div align="right"><b>Esta usted interesado(a):</b>&nbsp;&nbsp;</div>
                            </td>
                            <td width="16%"><b>&nbsp;&nbsp;Si</b> &nbsp; 
                                <input type="radio" name="inten" value="S" >
                            </td>
                            <td width="32%"><b>&nbsp;&nbsp;No</b> &nbsp; 
                                <input type="radio" name="inten" value="N" >
                            </td>
                        </tr>
                        <tr bgcolor="#F3F3F3"> 
                            <td colspan="3"> <br>
                                <div align="center">
                                    <input type="submit" class="boton"  value="Enviar" onClick="javascript: return comprueba();" name="submit">
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
        </center>
        <input type="hidden" name="idinsc" value="<%=idinsc%>">
        <input type="hidden" name="valp" value="<%=val%>">        
        <input type="hidden" name="ind" value="<%=conp%>">
        <input type="hidden" name="docEst" value="<%=docEst%>">
    </form>
    <%}
        }%>

</body>
</html>
