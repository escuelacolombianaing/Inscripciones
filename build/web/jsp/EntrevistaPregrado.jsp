<%-- 
    Document   : EntrevistasBecas
    Created on : 31/07/2009, 10:14:10 AM
    Author     : lrodriguez
--%>

<%@page import="utiles.Correo"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BDdocumentacion" %>
<%@ page import="BDatos.BaseDatos" %>

<% try {

        String docEst = request.getParameter("documento");
        PrintWriter oout = response.getWriter();
        BDadmisiones bd = new BDadmisiones();
        BDdocumentacion bd1 = new BDdocumentacion();
        configeci.configuracion confEci = new configeci.configuracion();
        String prog = "";
        Vector entrevista = bd.ConsultaEntrev(docEst, confEci.getPeriodo(), oout);
        String tipoest = request.getParameter("tipprog");
        configeci.configuracion confeci = new configeci.configuracion();
        Vector pregrados = bd.pregrado(oout, confeci.getPeriodo(), tipoest);
        Vector estado = bd.Entrevistas(docEst, oout, confeci.getPeriodo());
        Vector datos = bd1.ConsultaDatos(docEst, confEci.getPeriodo(), oout);
        String blq = new String();%>

<%if (datos.size() > 0) {
        String nro = new String();

        blq = datos.elementAt(8).toString();
    }


//  Vector Readmision = bd.EntrevistasRead(docEst, oout);
//  String fecread = request.getParameter("fecread");

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title> Entrevistas  </title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
        </script>
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="Entrevistas Aspirantes a Programas de Pregrado" />
        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-xs-12 col-md-2"></div>
                <div class="col-xs-12 col-md-12">

                    <% if (entrevista.size() <= 0 && estado.size() <= 0) {%>
                    <table width="50%" border="0" cellspacing="0" cellpadding="0" height="20"  class="textoimpremas" align="center">
                        <tr>
                            <td>
                                <div align="center"><br>
                                    No est� autorizado para realizar este proceso, o su entrevista a�n no ha sido asignada,por favor comun�quese al 6683600 opci�n 2 en el men�. </div>
                            </td>
                        </tr>
                    </table>

                    <%} else {%>
                    <div align="center">
                    <table width="50%" border="0" cellspacing="0" cellpadding="0"  align="center" class="textoimpremas">
                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <%for (int m = 0; m < entrevista.size(); m++) {
                                Vector entre = (Vector) entrevista.elementAt(m);
                                if (entre.elementAt(6).equals("13")) {
                                    prog = "INGENIERIA CIVIL";

                                } else if (entre.elementAt(6).equals("14")) {
                                    prog = "INGENIERIA ELECTRICA";

                                } else if (entre.elementAt(6).equals("15")) {
                                    prog = "INGENIERIA DE SISTEMAS";

                                } else if (entre.elementAt(6).equals("16")) {
                                    prog = "INGENIERIA INDUSTRIAL";

                                } else if (entre.elementAt(6).equals("17")) {
                                    prog = "INGENIERIA ELECTRONICA";

                                } else if (entre.elementAt(6).equals("18")) {
                                    prog = "ECONOMIA";

                                } else if (entre.elementAt(6).equals("19")) {
                                    prog = "ADMINISTRACI�N DE EMPRESAS";

                                } else if (entre.elementAt(6).equals("20")) {
                                    prog = "MATEMATICAS";

                                } else if (entre.elementAt(6).equals("260")) {
                                    prog = "INGENIERIA MECANICA";

                                } else if (entre.elementAt(6).equals("264")) {
                                    prog = "INGENIERIA AMBIENTAL";

                                }

                                if (entre.elementAt(5).equals("-60") && entre.elementAt(2).equals("N")) {

                                    if (entre.elementAt(4).equals("0")) {%>
                        <tr>
                            <td>Entrevista para el programa de <b><%=prog%></b></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td height="19">
                                <p><%=entre.elementAt(0)%></p>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Apreciado Aspirante:</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <!-- OJO ESTOS MENSAJES SE DEBEN REVISAR DE ACUERDO A LA  BD -->
                                <p>Como parte del estudio de la postulaci�n para ser beneficiario de las
                                    Becas Julio Garavito Armero, le informamos que deber� presentar entrevistas
                                    as�:
                                    <%if (estado.size() <= 0) {%>
                        <center>Usted no tiene entrevista asignada.
                        </center>
                        <%} else {%>

                        <p><b>PSICOLOGIA</b>
                        <p>El pr&oacute;ximo<B> <%=estado.elementAt(10)%></B>, a las <b><%=estado.elementAt(11)%> </b>en la<b> <%=estado.elementAt(14)%></b>, con : <%=estado.elementAt(13)%> en <B>COMPA�IA DE SU ACUDIENTE</B>
                        <p><b>DECANATURA</b>
                        <p>El pr�ximo <b> <%=estado.elementAt(2)%>, a las <%=estado.elementAt(3)%> en la <%=estado.elementAt(6)%></b>, con : <%=estado.elementAt(7)%>, (S&oacute;lamente el aspirante).

                        <p>
                            El <b> <%=pregrados.elementAt(6)%> </b>   deber� consultar la respuesta a su postulaci�n a Beca Julio Garavito Armero,  en el link  <b>Respuesta de Admisi�n</b> de esta misma p�gina.
                        </p>

                        <p>Esperamos su puntual asistencia.
                        <p>Admisiones</p>
                        <p>Tel&eacute;fono: 6683600  opci�n 2 en el men�. </p>

                        </td>
                        </tr>

                        <%}
                        } else if (entre.elementAt(4).equals("-1")) {%>
                        <tr>
                            <td>Programa de <b><%=prog%></b></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>

                        </tr>
                        <tr>
                            <td height="19">
                                <p><%=entre.elementAt(0)%></p>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Apreciado Aspirante:</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>

                            <td> Despu�s de realizado el proceso de selecci�n, lamentamos informarle que en esta oportunidad no fue aceptada su postulaci�n para ser beneficiario de las Becas
                                JULIO GARAVITO ARMERO. Le invitamos a vincularse a nuestra instituci�n donde de acuerdo con sus condiciones acad�micas estamos seguros que obtendr� los mejores 
                                resultados y eventualmente podr� aplicar a las becas de Excelencia Acad�mica que ofrece la Escuela.
                                <br>
                                En caso de requerirlo le sugerimos conocer las diferentes alternativas de financiaci�n que coordina la oficina de apoyo financiero, quienes se encuentran ubicados en la 
                                plazoleta del primer piso del bloque A. (apoyofinanciero@escuelaing.edu.co).

                            </td>
                            <td>&nbsp;

                            </td>
                        </tr>

                        <%  } else if (entre.elementAt(4).equals("2")) {%>

                        <tr>
                            <td>Programa de <b><%=prog%></b></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td height="19">
                                <p><%=entre.elementAt(0)%></p>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Apreciado Aspirante:</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                Estimado Aspirante:  Lamentamos informarle que usted no fue elegido para continuar con el proceso de
                                adjudicaci�n de Becas Julio Garavito Armero.  En caso de requerirlo, le sugerimos conocer las opciones de
                                Apoyo Financiero ofrecidas por la Escuela, a trav�s de la p�gina
                                http://www.escuelaing.edu.co/apoyo_financiero/apoyo_financiero.htm
                                <p>
                                    <br>
                                    Cordialmente,
                                <p>
                                    Oficina de Admisiones

                                    <!--Lamentamos que en esta oportunidad no haya sido aceptada su Postulaci�n
                                    para ser beneficiario de las Becas JULIO GARAVITO ARMERO, pues sus puntajes
                                    en el resultado del Ex�men de Estado no alcanzaron el requisito m�nimo en
                                    las �reas de inter�s para tal fin (Minimo 55 puntos en las �reas de inter�s).
                                    Sin embargo con los puntajes obtenidos y si usted as� lo considera, podr�a
                                    ingresar realizando el proceso regular de admisi�n, lo cual deber� manifestar
                                    por escrito ante la Oficina de Admisiones adjuntando en este caso el recibo
                                    de pago de los derechos de Inscripci�n. Dicho valor le ser� abonado a sus
                                    derechos de matr�cula. Si desea mayor informaci&oacute;n al respecto por
                                    favor comun&iacute;quese con la Oficina de Admisiones. Tel&eacute;fono:
                                6683600 Ext: 274, 263 o 101. --></td>
                        </tr>
                        <tr>
                            <td>&nbsp;

                            </td>
                        </tr>
                        <%  }

                            }
                            if ((entre.elementAt(5).equals("-81") || entre.elementAt(5).equals("-61")) && entre.elementAt(2).equals("T")) {%>
                        <tr>
                            <td>Entrevista para el programa de <b><%=prog%></b></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td height="19">
                                <p><%=entre.elementAt(0)%></p>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Apreciado Aspirante:</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <% if (entre.elementAt(6).equals("15")) {%>
                                <p><b>PSICOLOGIA</b>
                                <p>El pr�ximo <b> <%=estado.elementAt(10)%>, a las <%=estado.elementAt(11)%> en la <%=estado.elementAt(14)%></b>, con Psc. <%=estado.elementAt(13)%>.
                                <P> <b>DECANATURA</b>
                                <p>El pr&oacute;ximo  <b><%=estado.elementAt(2)%>, a las <%=estado.elementAt(3)%> en  <%=estado.elementAt(6)%></b>, con Ing. <%=estado.elementAt(7)%>.
                                <p>
                                <p>Esperamos su puntual asistencia.
                                <p>
                                    El <%=pregrados.elementAt(6)%>  deber� reclamar la respuesta a su solicitud de Transferencia en la Oficina de Admisiones, Bloque A, primer piso.
                                </p>
                                <p>&nbsp; </p>
                                <%} else {%>
                                <p>Como parte del estudio de su solicitud de Transferencia
                                    informamos que deber&aacute; presentar entrevista el pr&oacute;ximo
                                    <%=estado.elementAt(2)%>, a las <b><%=estado.elementAt(3)%> </b>en la <b>
                                        <%=estado.elementAt(6)%></b>, con Psc: <%=estado.elementAt(13)%> y el Decano <%=estado.elementAt(7)%>. Esperamos su puntual
                                    asistencia. <br>
                                <p>
                                    El <b> <%=pregrados.elementAt(6)%> </b> deber� reclamar la respuesta a su solicitud de Transferencia en la Oficina de Admisiones, Bloque A, primer piso.
                                </p>
                                <p>&nbsp; </p>
                                <%}%>
                            </td>
                        </tr>

                        <%} else if (((entre.elementAt(5).equals("-83") || entre.elementAt(5).equals("-80")) && (!blq.equals("0") || !blq.equals("-2"))) && entre.elementAt(2).equals("T")) {%>
                        <tr>
                            <td>Entrevista para el programa de <b><%=prog%></b></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td height="19">
                                <p><%=entre.elementAt(0)%></p>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Apreciado Aspirante:</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <p><b>Usted no ha formalizado su inscripci�n, debe entregar la documentaci�n
                                        correspondiente en las fechas se�aladas. Favor comun�quese
                                        con la Oficina de Admisiones.
                                        Tel&eacute;fono: 6683600 opci�n 2 en el men�.</b>
                                <p>
                            <TD>
                            </TD>

                            <% }%>
                            <!--f (Readmision.size() > 0) {
                        Vector estadoread = bd.EstadoReadmision(docEst, oout);%>
                                <!%if ((estadoread.size()) == 0) {%>
                            <tr>
                                <td>
                                    <br>
                                    No est� autorizado para realizar este proceso, por favor comun�quese con
                                    la Oficina de Admisiones11. <br>
                                    Tel&eacute;fono: 6683600 Ext: 274, 263 o 101.
                                </td>
                            </tr>
                    
                            <!%} else
                    for (int k = 0; k < estadoread.size(); k++) {
                        Vector readmi = (Vector) estadoread.elementAt(k);%>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <!%if (readmi.elementAt(3).equals("0")) {%>
                            <tr>
                                <td>Entrevista para el programa de <b><!%=prog%></b></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="19">
                                    <p><!%=entre.elementAt(0)%></p>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Apreciado Aspirante:</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <p>Como parte del estudio de su solicitud de readmisi&oacute;n  le informamos que deber&aacute; presentar  entrevistas as�:
                                        <b> <!%=estado.elementAt(2)%>, a las <!%=estado.elementAt(3)%>
                                            en la <!%=estado.elementAt(6)%></b>, con PSC: <!%=estado.elementAt(7)%>,  el pr&oacute;ximo<b> <!%=estado.elementAt(10)%>, a las <!%=estado.elementAt(11)%>
                                            en la <!%=estado.elementAt(13)%></b>, con PSC: <!%=estado.elementAt(12)%>  en <B>COMPA�IA DE SU ACUDIENTE</B> </p>
                                    <br>El <!%=fecread%>  deber� consultar la respuesta a su solicitud en <a href="http://www.escuelaing.edu.co/admisiones/aspirantes_01.htm"> Readmisi�n - Admitidos</a>
                                    <p>Cordialmente</p>
                                    <p>Oficina de Admisiones</p>
                                    <p>Ext.274,263 &oacute; 101</p>
                                </td>
                            </tr>
                            <!%
                    } else if (readmi.elementAt(3).equals("1")) {%>
                            <tr>
                                <td>
                                    Una vez estudiada su hoja de vida acad�mica, el Comit� de Admisiones conceptu� que no es necesario citarlo(a)  a
                                    entrevista; por lo tanto deber� consultar las condiciones con las cuales se aprob� su readmisi�n el  <!%=fecread%>
                    
                    
                                    <p>&nbsp;</p>
                                    <p> Atentamente, Psi. Nancy Barrero Ram�rez Jefe de Admisiones </p>
                                </td>
                            </tr>
                            <!%}
                                            }
                                    }-->

                            <%   }
                                }
                            %>

                        <tr>
                            <td align="center">
                                <p align="center">&nbsp;</p>
                            </td>
                        </tr>
                    </table>
                    </div>

                </div>
            </div>
        </div>

    </body>

</html>

<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Entrevistas Pregrado local", e.getMessage());
    }
%>

