<%-- 
    Document   : ImpresionDoc
    Created on : 4/04/2018, 04:45:43 PM
    Author     : andres.rojas
--%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>

<%
    String docEst = request.getParameter("documento");
    String numRef = request.getParameter("ref");
    String docestud = request.getParameter("docest");
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    String nomprof = new String("");
    configeci.configDoctorado confeci = new configeci.configDoctorado();
    String idplan = request.getParameter("idplan");
    String periodo = new String();

    
    periodo = confeci.getPeriodoSiguiente();
    if (docEst != null && !docEst.equals("")) {%>


<html>
    <head>
        <title>Formulario impreso Doctorado</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">

            <!--
            function impresion(){
            document.getElementById("tablaboton").style.visibility='hidden';
            window.print();
            window.close();
            }
            -->

        </script>

        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div align="center"> 

            <table width="45%" border="0" class="textoimpre">
                <tr> 
                    <td height="116"><img src="img/logo.gif" width="83" height="90" align="right"></td>
                    <td width="86%"> 
                        <div align="center"> 
                            <p align="center"><b>ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
                                    JULIO GARAVITO</b></p>
                            <p align="center"><b>SOLICITUD DE ADMISI&Oacute;N AL PROGRAMA DOCTORADO EN INGENIER&Iacute;A </b></p>
                            <br>
                        </div>
                    </td>
                </tr>
                <tr> 
                    <td height="116" colspan="2"> 
                        <%Vector datos = bd.ConsultaInscritoPos(docEst, numRef, periodo, oout);%>
                        <%int lon = datos.size();%>
                        <% if (lon <= 0) {%>
                <center>
                    Sus datos no fueron ingresados correctamente o faltó información en 
                    el registro del formulario. 
                </center>
                <% } else {%>
                <%Vector estudiante = (Vector) datos.elementAt(0);

                    String programa = "";
                    if (estudiante.elementAt(2).equals("352")) {
                        programa = "DOCTORADO EN INGENIERIA";
                    }



                %>
                <%String financia = "";
                    if (estudiante.elementAt(22).equals("1")) {
                        financia = "BECA";
                    }
                    if (estudiante.elementAt(22).equals("2")) {
                        financia = "RENTA PROPIA";
                    }
                    if (estudiante.elementAt(22).equals("3")) {
                        financia = "APOYO FAMILIAR";
                    }
                    if (estudiante.elementAt(22).equals("4")) {
                        financia = "CREDITO";
                    }
                    if (estudiante.elementAt(22).equals("5")) {
                        financia = "ENTIDAD DONDE TRABAJA";
                    }
                    if (estudiante.elementAt(22).equals("20")) {
                        financia = "MIXTO";
                    }
                %>
                <table width="660" border="0" cellpadding="1" cellspacing="0" class="textoimpre" align="center">
                    <tr> 
                        <td width="31%"><b>No. Inscripci&oacute;n:&nbsp;</b></td>
                        <td width="42%"><%=estudiante.elementAt(19)%></td>
                        <td width="27%" rowspan="6"> 
                            <table width="113" height="135" border="2" align="center" cellpadding="0" cellspacing="0" class="textoimpre">
                                <tr> 
                                    <td height="93"> 
                                        <div align="center"> 
                                            <p><font color="#999999">Pegue aqu&iacute; su</font></p>
                                            <p><font color="#999999">fotograf&iacute;a</font></p>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div align="center"></div>
                        </td>
                    </tr>
                    <tr> 
                        <td width="31%"><b>Programa acad&eacute;mico:</b></td>
                        <td width="42%"><%=programa%></td>
                    </tr>
                    <tr> 
                        <td width="31%"><b>Nombres y Apellidos:&nbsp;</b></td>
                        <td width="42%"><%=estudiante.elementAt(0)%></td>
                    </tr>
                    <tr> 
                        <td width="31%"><b>No.Documento del aspirante:&nbsp;&nbsp;</b></td>
                        <td width="42%"><%=estudiante.elementAt(1)%></td>
                    </tr>
                    <tr> 
                        <td width="31%"><b>Fecha y Lugar de Nacimiento:</b></td>
                        <td width="42%"><%=estudiante.elementAt(4)%> - <%=estudiante.elementAt(24)%> </td>
                    </tr>
                    <tr> 
                        <td width="31%"><b>Direcci&oacute;n de correspondencia:</b></td>
                        <td width="42%"><%=estudiante.elementAt(5)%></td>
                    </tr>
                    <tr> 
                        <td width="31%"><b>Tel&eacute;fono:</b></td>
                        <td colspan="2"><%=estudiante.elementAt(7)%></td>
                    </tr>
                    <tr> 
                        <td width="31%"><b>Correo Electr&oacute;nico:</b></td>
                        <td colspan="2"><%=estudiante.elementAt(10)%></td>
                    </tr>
                    <tr> 
                        <td width="31%"><b>Contacto en caso de emergencia:</b></td>
                        <td colspan="2"><%=estudiante.elementAt(20)%></td>
                    </tr>
                    <tr> 
                        <td width="31%"><b>Teléfono</b></td>
                        <td colspan="2"><%=estudiante.elementAt(21)%></td>
                    </tr>
                    <td colspan="3"> 
                        <hr>
                    </td>
                    </tr>
                    <tr> 
                        <td colspan="3"> 
                            <div align="center"><b><font color="#336699">EDUCACION</font></b></div>
                        </td>
                    </tr>
                    <tr> 
                        <td height="24"><b>Universidad:</b></td>
                        <td colspan="2" height="24"><%=estudiante.elementAt(12)%></td>
                    </tr>
                    <tr> 
                        <td height="24"><b>Programa:</b></td>
                        <td colspan="2" height="24"><%=estudiante.elementAt(13)%></td>
                    </tr>
                    <tr> 
                        <td><b>Grado Obtenido</b>:</td>
                        <td colspan="2"><%=estudiante.elementAt(14)%></td>
                    </tr>
                    <tr> 
                        <td><b>Promedio de la carrera</b>:</td>
                        <td colspan="2"><%=estudiante.elementAt(25)%></td>
                    </tr>
                    <% if (lon > 1) {
                  Vector estudiante1 = (Vector) datos.elementAt(1);%>
                    <tr> 
                        <td colspan="3"><b>OTROS ESTUDIOS FORMALES</b></td>
                    </tr>
                    <tr> 
                        <td><b>Universidad</b></td>
                        <td colspan="2"><%=estudiante1.elementAt(12)%></td>
                    </tr>
                    <tr> 
                        <td><b>Programa</b></td>
                        <td colspan="2"><%=estudiante1.elementAt(13)%></td>
                    </tr>
                    <tr> 
                        <td><b>T&iacute;tulo</b></td>
                        <td colspan="2"><%=estudiante1.elementAt(14)%></td>
                    </tr>
                    <%}%>
                    <tr> 
                        <td colspan="3"> 
                            <hr>
                        </td>
                    </tr>
                    <%Vector expe = bd.ExperienciaPos(docEst, oout);%>
                    <%int lon5 = expe.size();

                        for (int k = 0; k < lon5; k++) {
                  Vector exper = (Vector) expe.elementAt(k);%>
                    <tr> 
                        <td colspan="3" height="22"> 
                            <div align="center"><b><font color="#336699">EXPERIENCIA</font></b></div>
                        </td>
                    </tr>
                    <tr> 
                        <td><b>Entidad</b>&nbsp;:</td>
                        <td colspan="2"><%=exper.elementAt(0)%></td>
                    </tr>
                    <tr> 
                        <td><b>Cargo :</b>&nbsp;&nbsp; </td>
                        <td colspan="2"><%=exper.elementAt(1)%></td>
                    </tr>
                    <tr> 
                        <%String experi = "";
                            if (exper.elementAt(2).equals("L")) {
                                experi = "LABORAL";
                            }
                            if (exper.elementAt(2).equals("D")) {
                                experi = "DOCENTE";
                            }
                            if (exper.elementAt(2).equals("I")) {
                                experi = "INVESTIGATIVA";
                            }
                        %>
                        <td><b>Experiencia:</b></td>
                        <td colspan="2"><%=experi%></td>
                    </tr>
                    <tr> 
                        <td><b>Jefe Inmediato:</b></td>
                        <td colspan="2"><%=exper.elementAt(3)%></td>
                    </tr>
                    <tr> 
                        <td><b>Tel&eacute;fono:</b></td>
                        <td colspan="2"><%=exper.elementAt(4)%></td>
                    </tr>
                    <tr> 
                        <td colspan="3"> 
                            <hr>
                        </td>
                    </tr>
                    <%}%>
                    <%Vector distin = bd.DistincionPos(docEst, oout);%>
                    <%int lon2 = distin.size();
              if (lon2 > 0) {%>
                    <tr> 
                        <td colspan="3"> 
                            <div align="center"><b><font color="#336699">DISTINCIONES</font></b></div>
                        </td>
                    </tr>
                    <%
                        for (int k = 0; k < lon2; k++) {
                            Vector distincion = (Vector) distin.elementAt(k);
                    %>
                    <tr> 
                        <td><b>Distinci&oacute;n:</b></td>
                        <td colspan="2"><%=distincion.elementAt(0)%></td>
                    </tr>
                    <tr> 
                        <td><b>Entidad:</b></td>
                        <td colspan="2"><%=distincion.elementAt(1)%></td>
                    </tr>
                    <tr> 
                        <td><b>A&ntilde;o:</b></td>
                        <td colspan="2"><%=distincion.elementAt(2)%></td>
                    </tr>
                    <tr> 
                        <td colspan="3"> 
                            <hr>
                        </td>
                        <%}
                }%>
                    </tr>
                    <tr> 
                        <td colspan="3"> 
                            <p align="center"><b><font color="#336699">INTERES ACADEMICO</font></b></p>
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="3"> 
                            <p><%=estudiante.elementAt(23)%></p>
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="3"> 
                            <hr>
                        </td>
                    </tr>
                    <%Vector refe = bd.ReferenciasPos(docEst, oout);%>
                    <%int lon1 = refe.size();%>
                    <tr> 
                        <td colspan="3"> 
                            <div align="center"><b><font color="#336699">REFERENCIAS ACADEMICAS 
                                    O LABORALES</font></b></div>
                        </td>
                    </tr>
                    <% for (int j = 0; j < lon1; j++) {
                            Vector referencias = (Vector) refe.elementAt(j);
                    %>
                    <tr> 
                        <td colspan="3"> 
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="textoimpre">
                                <tr> 
                                    <td width="31%"><b>Nombre:</b></td>
                                    <td width="69%"><%=referencias.elementAt(0)%></td>
                                </tr>
                                <tr> 
                                    <td width="31%"><b>Entidad:</b></td>
                                    <td width="69%"><%=referencias.elementAt(1)%></td>
                                </tr>
                                <tr> 
                                    <td width="31%"><b>Cargo:</b></td>
                                    <td width="69%"><%=referencias.elementAt(2)%></td>
                                </tr>
                                <tr> 
                                    <td width="31%"><b>Tel&eacute;fono:</b></td>
                                    <td width="69%"><%=referencias.elementAt(3)%></td>
                                </tr>
                                <tr> 
                                    <td>&nbsp;</td>
                                </tr>
                                <%}%>
                            </table>
                        </td>
                    </tr>
                </table>
                </td>
                </tr>
            </table>
            <br>
            <table width="100%" border="0" id="tablaboton" >
                <tr>
                    <td width="40%">
                        <div align="center">
                            <input name="imprimir" class="boton"  type="submit" id="imprimir3" value="Imprimir Formulario" onClick="impresion()">
                        </div>
                    </td>
                </tr>
            </table>
            <br>
            <br>
            <div align="left"></div>
            <div align="center">  </div>
            <p>&nbsp;</p>
        </div>
        <div align="center"></div>
        <%}
            } else {
                out.println("Por favor ingrese el documento de identidad con el que registró su Inscripción.");

            }%>
    </body>
</html>
