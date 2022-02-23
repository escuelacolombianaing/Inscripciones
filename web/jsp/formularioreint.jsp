<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones"%>
<%
    String carnet = new String();
    String idciudad = new String();
    String idEst = request.getParameter("idEst");
    int total1=0;
    //  String clave = request.getParameter("clave");
    PrintWriter oout = response.getWriter();
    configeci.configuracion confeci = new configeci.configuracion();
    BDadmisiones admision = new BDadmisiones();
    String prog = new String(""), dirres, ciures, dirofi, ciuofi, banp = "0", banm = "0", idp = "", idm = "", vives = "", viven = "";
    
    StringTokenizer st;
    Vector estud = admision.getInfoEstReint(idEst);
%>


<html>
    <head>
        <title>Reintegro</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
        <link rel="stylesheet" href="css/admisionFormulario.css">
    </head>

    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="Consulta número de referencia" />
        </jsp:include>

        <% if (estud.size() == 0) {%>
        <table width="75%" border="0" align="center">
            <tr>
                <td>Solicitud de reintegro :</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Su documento o carnet es incorrecto, recuerde que este documento fue
                    con el que ingreso a la Escuela; o no existe información.<br>
                    Puede comunicarse con la oficina de Admisiones donde se aclararán
                    sus inquietudes, al email: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a>
                    o al teléfono 6683600 opción 2 en el menú. </td>
            </tr>
        </table>

        <%   } else {
            Vector anotacionR = admision.AnotacionReint(estud.elementAt(0).toString(), confeci.getPeriodo());
            Vector ciud = admision.getCiudades();
        %>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <form name="form1" method="post" action="GrabaEstudiante">


                        <%if (anotacionR.size() > 0) {%>
                        <p>&nbsp;</p>
                        <h3><center>
                                <p><font face="Verdana, Arial, Helvetica, sans-serif" size="3">Usted ya realizó
                                    su solicitud de reintegro</font> </p>
                                <p align="center">
                                <center>
                                    <h3>&nbsp;</h3>
                                </center>
                                <p>&nbsp; </p>
                            </center></h3>
                            <%  } else if (estud.size() > 0) {


                                String parentesco = "";
                                if (estud.elementAt(21).equals("M")) {
                                    parentesco = "MADRE";
                                }
                                if (estud.elementAt(21).equals("P")) {
                                    parentesco = "PADRE";
                                }
                                if (estud.elementAt(21).equals("A")) {
                                    parentesco = "ABUELO(A)";
                                }
                                if (estud.elementAt(21).equals("T")) {
                                    parentesco = "TIO(A)";
                                }
                                if (estud.elementAt(21).equals("H")) {
                                    parentesco = "HERMANO(A)";
                                }
                                if (estud.elementAt(21).equals("R")) {
                                    parentesco = "PRIMO(A)";
                                }
                                if (estud.elementAt(21).equals("O")) {
                                    parentesco = "OTRO";
                                }
                                if (estud.elementAt(21).equals("N")) {
                                    parentesco = "NINGUNO";
                                }

                                Vector maxper = admision.MaximoperPre(estud.elementAt(0).toString());
                                String peractual = confeci.getPeriodo();
                                String annoactual = peractual.substring(0, 4);
                                int maximoanno;
                                String maxperiodo = new String("");
                                int annoact = Integer.parseInt(annoactual);
                                String per = peractual.substring(5, 6);
                                String maxanno = maxper.elementAt(0).toString();
                                if (maxanno.equals("No disponible")) {
                                    maxanno = estud.elementAt(32).toString();
                                    maxanno = maxanno.substring(0, 4);
                                    maximoanno = Integer.parseInt(maxanno);
                                    maxperiodo = estud.elementAt(32).toString().substring(5, 6);
                                    int dato1 = (annoact - maximoanno);
                                    total1 = (dato1 * 2);
                                    if (maxperiodo.equals("2") && (per.equals("1"))) {
                                        total1 = total1 - 1;
                                    } else if (maxperiodo.equals("2") && (per.equals("2"))) {
                                        total1 = total1 ;
                                    } else if (maxperiodo.equals("1") && (per.equals("1"))) {
                                        total1 = total1 ;
                                    } else if (maxperiodo.equals("1") && (per.equals("2"))) {
                                        total1 = total1 + 1;
                                    }

                                } else {
                                    maximoanno = Integer.parseInt(maxanno);
                                    maxperiodo = maxper.elementAt(1).toString();

                                    int dato1 = (annoact - maximoanno);
                                    total1 = (dato1 * 2);
                                    if (maxperiodo.equals("2") && (per.equals("1"))) {
                                        total1 = total1 - 2;
                                    } else if (maxperiodo.equals("2") && (per.equals("2"))) {
                                        total1 = total1 - 1;
                                    } else if (maxperiodo.equals("1") && (per.equals("1"))) {
                                        total1 = total1 - 1;
                                    } else if (maxperiodo.equals("1") && (per.equals("2"))) {
                                        total1 = total1;
                                    }

                                }

                                carnet = estud.elementAt(0).toString();
                                Vector padres = admision.getPadres(carnet);
                                Vector despNotas = admision.despNotas(carnet);
                                if (despNotas.size() <= 0 && estud.elementAt(15).equals("-4") && total1 <= 3) {
                            %>
                        <table width="640" border="0" align="center" class="textocom">
                            <tr>
                                <td colspan="2"><b>DATOS DEL ASPIRANTE </b> </td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Programa</b>:</td>
                                <%if (estud.elementAt(7).equals("13")) {
                                        prog = "INGENIERIA CIVIL";
                                    }%>
                                <%if (estud.elementAt(7).equals("14")) {
                                        prog = "INGENIERIA ELECTRICA";
                                    }%>
                                <%if (estud.elementAt(7).equals("15")) {
                                        prog = "INGENIERIA DE SISTEMAS";
                                    }%>
                                <%if (estud.elementAt(7).equals("16")) {
                                        prog = "INGENIERIA INDUSTRIAL";
                                    }%>
                                <%if (estud.elementAt(7).equals("17")) {
                                        prog = "INGENIERIA ELECTRONICA";
                                    }%>
                                <%if (estud.elementAt(7).equals("18")) {
                                        prog = "ECONOMIA";
                                    }%>
                                <%if (estud.elementAt(7).equals("19")) {
                                        prog = "ADMINISTRACION";
                                    }
                                    if (estud.elementAt(7).equals("260")) {
                                        prog = "INGENIERIA MECANICA";
                                    }
                                    if (estud.elementAt(7).equals("262")) {
                                        prog = "INGENIERIA BIOMEDICA";
                                    }%>
                                <td width="68%"><%=prog%></td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Apellidos y Nombres:</b></td>
                                <td width="68%"><b><%=estud.elementAt(1)%></b></td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Documento de identidad </b>&nbsp;</td>
                                <td width="68%">
                                    <% if ("T".equals(estud.elementAt(2))) {%>
                                    &nbsp;&nbsp; <b>T.I.</b>
                                    <%}%>
                                    <% if ("C".equals(estud.elementAt(2))) {%>
                                    <b>C.C</b>.
                                    <%}%>
                                    <% if ("CE".equals(estud.elementAt(2))) {%>
                                    <b>C.E</b>.
                                    <%}%>
                                    <% if ("RC".equals(estud.elementAt(2))) {%>
                                    <b>R.C.</b>
                                    <%}%>
                                    &nbsp;<b>&nbsp; No.</b> <%=estud.elementAt(3)%>; &nbsp;<b>de</b> <%=admision.getNomCiudad(estud.elementAt(8).toString())%>
                                </td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Direcci&oacute;n correspondencia</b>: </td>
                                <td width="68%">
                                    <input type="text" class="form-control" name="campo6" maxlength="35" size="35" value="<%=estud.elementAt(4)%>">
                                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Ciudad</b></td>
                                <td width="68%">  <%=admision.getNomCiudad(estud.elementAt(5).toString())%>

                                </td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Tel&eacute;fono</b> </td>
                                <td width="68%">
                                    <input type="text" class="form-control"  name="campo8" maxlength="12" size="15" value="<%=estud.elementAt(6)%>">
                                </td>
                            </tr>
                        </table>
                        <p><%
                            for (int i = 0; i < padres.size(); i++) {
                                Vector padre = (Vector) padres.elementAt(i);
                                if (padre.elementAt(0).equals("P")) {
                            %></p>



                        <table width="640" border="0" align="center" class="textocom" >
                            <tr> 
                                <td colspan="2"><b>DATOS DEL PADRE</b></td>
                            </tr>
                            <tr> 
                                <td width="32%"><b>Apellidos y Nombres</b></td>
                                <td width="68%"><b><%=padre.elementAt(1)%></b></td>
                            </tr>
                            <tr> 
                                <td width="32%"><b>Direcci&oacute;n residencia</b></td>
                                <td width="68%"> 
                                    <% st = new StringTokenizer(padre.elementAt(2).toString(), "$");
                                        if (st.hasMoreElements()) {
                                            dirres = st.nextToken();
                                        } else {
                                            dirres = "";
                                        }
                                        if (st.hasMoreElements()) {
                                            ciures = st.nextToken();
                                        } else {
                                            ciures = "";
                                        }
                                        st = new StringTokenizer(padre.elementAt(4).toString(), "$");
                                        if (st.hasMoreElements()) {
                                            dirofi = st.nextToken();
                                        } else {
                                            dirofi = "";
                                        }
                                        if (st.hasMoreElements()) {
                                            ciuofi = st.nextToken();
                                        } else {
                                            ciuofi = "";
                                        }
                                    %>
                                    <%=dirres%> &nbsp;&nbsp;</td>
                            </tr>
                            <tr> 
                                <td width="32%"><b>Tel&eacute;fono</b></td>
                                <td width="68%"><%=padre.elementAt(3)%></td>
                            </tr>
                            <tr> 
                                <td width="32%"><b>Ciudad:</b></td>
                                <td width="68%"><%=ciures%></td>
                            </tr>
                            <tr> 
                                <td width="32%"><b>Direcci&oacute;n oficina:</b></td>
                                <td width="68%"><%=dirofi%> </td>
                            </tr>
                            <tr> 
                                <td width="32%"><b>Tel&eacute;fono:</b> <%=padre.elementAt(6)%></td>
                                <td width="68%"> &nbsp;<b>&nbsp;Ciudad:</b> <%=ciuofi%></td>
                            </tr>
                        </table>

                        <p>
                            <%} else if (padre.elementAt(0).equals("M")) {
                                idm = (String) padre.elementAt(11);
                                banm = "1";
                                st = new StringTokenizer(padre.elementAt(2).toString(), "$");
                                if (st.hasMoreElements()) {
                                    dirres = st.nextToken();
                                } else {
                                    dirres = "";
                                }
                                if (st.hasMoreElements()) {
                                    ciures = st.nextToken();
                                } else {
                                    ciures = "";
                                }
                                st = new StringTokenizer(padre.elementAt(4).toString(), "$");
                                if (st.hasMoreElements()) {
                                    dirofi = st.nextToken();
                                } else {
                                    dirofi = "";
                                }
                                if (st.hasMoreElements()) {
                                    ciuofi = st.nextToken();
                                } else {
                                    ciuofi = "";
                                }
                            %>
                        </p>
                        <table width="640" border="0" align="center" class="textocom">
                            <tr>
                                <td colspan="2"><b>DATOS DE LA MADRE</b></td>
                            </tr>
                            <tr>
                                <td width="33%"><b>Apellidos y Nombres</b></td>
                                <td width="67%"><%=padre.elementAt(1)%></td>
                            </tr>
                            <tr>
                                <td width="33%"><b>Direcci&oacute;n residencia: </b></td>
                                <td width="67%"><%=dirres%></td>
                            </tr>
                            <tr>
                                <td width="33%"><b>Tel&eacute;fono:</b> <%=padre.elementAt(3)%></td>
                                <td width="67%"><b>Ciudad:<%=ciures%></b></td>
                            </tr>
                            <tr>
                                <td width="33%"><b>Direcci&oacute;n oficina:</b></td>
                                <td width="67%"><%=dirofi%></td>
                            </tr>
                            <tr>
                                <td width="33%" height="22"><b>Tel&eacute;fono:<%=padre.elementAt(6)%></b></td>
                                <td width="67%" height="22"><b>Ciudad: <%=ciuofi%></b></td>
                            </tr>
                        </table>
                        <p>
                            <%}%>
                            <%}%>
                        </p>
                        <table width="640" border="0" align="center" class="textocom">
                            <tr>
                                <td colspan="2"><b>DATOS DEL ACUDIENTE</b></td>
                            </tr>
                            <tr>
                                <td width="33%"><b>Parentesco:</b></td>
                                <td width="67%">
                                    <%=parentesco%>
                                </td>
                            </tr>
                            <tr>
                                <td width="33%"><b>Nombre completo: </b></td>
                                <td width="67%"><b><%=estud.elementAt(9)%></b></td>
                            </tr>
                            <tr>
                                <td width="33%"><b>Direcci&oacute;n residencia:</b> </td>
                                <td width="67%"><%=estud.elementAt(10)%></td>
                            </tr>
                            <tr>
                                <td width="33%"><b>Tel&eacute;fono:</b></td>
                                <td width="67%"><%=estud.elementAt(11)%></td>
                            </tr>
                            <input name="tipoest" type="hidden" id="tipoest" value="E">
                            <input name="carnet" type="hidden" id="carnet" value="<%=carnet%>">
                            <input name="nomest" type="hidden" id="nomest" value="<%=estud.elementAt(1)%>">
                            <input name="parentesco" type="hidden" id="parentesco" value="<%=parentesco%>">
                            <input name="programa" type="hidden" id="programa" value="<%=prog%>">
                            <input name="idEst" type="hidden" id="idEst" value="<%=idEst%>">
                        </table>
                        <br>
                        <center><p align="center">

                                <input type="submit" name="Submit" value="Enviar Solicitud" size="2"  class="boton">
                            </p></center>  </form>
                            <%     } else if (despNotas.size() > 0) {
                                String prom = despNotas.elementAt(0).toString();
                                prom = prom.substring(0, 5);
                                float promedio = Float.parseFloat(prom);%>
                    <!--Pr. Acum: --><!--%=promedio%-->
                    <%
                        //   String impre = request.getParameter("impre");
                        if (idEst != null && !idEst.equals("")) {

                            if ((estud.size()) == 0) {%>
                    <p>&nbsp;</p>
                    <p>
                    <table width="75%" border="0" align="center">
                        <tr>
                            <td>Solicitud de reintegro :</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Su documento o carnet es incorrecto, recuerde que este documento fue
                                con el que ingreso a la Escuela; o no existe información.<br>
                                Puede comunicarse con la oficina de Admisiones donde se aclararán
                                sus inquietudes, al email: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a>
                                o al teléfono 6683600 opción 2 en el menú. </td>
                        </tr>
                    </table>
                    <p>
                        <!-- se agrega -1 que son suspendidos ya que no habran reingresos -->
                        <%} else if (((estud.elementAt(15).equals("-3")) || (estud.elementAt(15).equals("-4")) || (estud.elementAt(15).equals("-8"))
                                || (estud.elementAt(15).equals("-9")) || (estud.elementAt(15).equals("-1")) || (estud.elementAt(15).equals("-14")) || (estud.elementAt(15).equals("-15")) || (estud.elementAt(15).equals("-26"))) && ((promedio >= 2.950)||(idEst.equals("2164898"))) && total1 <= 3) {
                        %>

                        <!%if ((estud.elementAt(18).equals("E")) && estud.elementAt(32).equals("2012-1")) {%>

                        <!-- <p>&nbsp;</p>
                        <h3><center>
                                <p><font face="Verdana, Arial, Helvetica, sans-serif" size="3">Usted ya realizo
                                su solicitud de reintegro</font> </p>
                                <p align="center">
                                <center>
                                    <h3>&nbsp;</h3>
                                </center>
                                <p>&nbsp; </p>
                        </center></h3>-->
                        <!--%} else {%-->


                    <table width="640" border="0" align="center" class="textocom">
                        <tr>
                            <td colspan="2"><b>DATOS DEL ASPIRANTE </b> </td>
                        </tr>
                        <tr>
                            <td width="32%"><b>Programa</b>:</td>
                            <%if (estud.elementAt(7).equals("13")) {
                                    prog = "INGENIERIA CIVIL";
                                }%>
                            <%if (estud.elementAt(7).equals("14")) {
                                    prog = "INGENIERIA ELECTRICA";
                                }%>
                            <%if (estud.elementAt(7).equals("15")) {
                                    prog = "INGENIERIA DE SISTEMAS";
                                }%>
                            <%if (estud.elementAt(7).equals("16")) {
                                    prog = "INGENIERIA INDUSTRIAL";
                                }%>
                            <%if (estud.elementAt(7).equals("17")) {
                                    prog = "INGENIERIA ELECTRONICA";
                                }%>
                            <%if (estud.elementAt(7).equals("18")) {
                                    prog = "ECONOMIA";
                                }%>
                            <%if (estud.elementAt(7).equals("19")) {
                                    prog = "ADMINISTRACION";
                                }%>
                            <td width="68%"><%=prog%></td>
                        </tr>
                        <tr>
                            <td width="32%"><b>Apellidos y Nombres:</b></td>
                            <td width="68%"><b><%=estud.elementAt(1)%></b></td>
                        </tr>
                        <tr>
                            <td width="32%"><b>Documento de identidad </b>&nbsp;</td>
                            <td width="68%">
                                <% if ("T".equals(estud.elementAt(2))) {%>
                                &nbsp;&nbsp; <b>T.I.</b>
                                <%}%>
                                <% if ("C".equals(estud.elementAt(2))) {%>
                                <b>C.C</b>.
                                <%}%>
                                <% if ("CE".equals(estud.elementAt(2))) {%>
                                <b>C.E</b>.
                                <%}%>
                                <% if ("RC".equals(estud.elementAt(2))) {%>
                                <b>R.C.</b>
                                <%}%>
                                &nbsp;<b>&nbsp; No.</b> <%=estud.elementAt(3)%>; &nbsp;<b>de</b> <%=admision.getNomCiudad(estud.elementAt(8).toString())%>
                            </td>
                        </tr>
                        <tr>
                            <td width="32%"><b>Direcci&oacute;n correspondencia</b>: </td>
                            <td width="68%">
                                <input type="text" name="campo6" maxlength="35" size="35" value="<%=estud.elementAt(4)%>">
                                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="32%"><b>Ciudad</b></td>
                            <td width="68%">  <%=admision.getNomCiudad(estud.elementAt(5).toString())%>

                            </td>
                        </tr>
                        <tr>
                            <td width="32%"><b>Tel&eacute;fono</b> </td>
                            <td width="68%">
                                <input type="text" name="campo8" maxlength="12" size="15" value="<%=estud.elementAt(6)%>">
                            </td>
                        </tr>
                    </table>
                    <p><%
                        for (int i = 0; i < padres.size(); i++) {
                            Vector padre = (Vector) padres.elementAt(i);
                            if (padre.elementAt(0).equals("P")) {
                        %></p>
                    <div align="center">
                        <table width="640" border="0" class="textocom" >
                            <tr>
                                <td colspan="2"><b>DATOS DEL PADRE</b></td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Apellidos y Nombres</b></td>
                                <td width="68%"><b><%=padre.elementAt(1)%></b></td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Direcci&oacute;n residencia</b></td>
                                <td width="68%">
                                    <% st = new StringTokenizer(padre.elementAt(2).toString(), "$");
                                        if (st.hasMoreElements()) {
                                            dirres = st.nextToken();
                                        } else {
                                            dirres = "";
                                        }
                                        if (st.hasMoreElements()) {
                                            ciures = st.nextToken();
                                        } else {
                                            ciures = "";
                                        }
                                        st = new StringTokenizer(padre.elementAt(4).toString(), "$");
                                        if (st.hasMoreElements()) {
                                            dirofi = st.nextToken();
                                        } else {
                                            dirofi = "";
                                        }
                                        if (st.hasMoreElements()) {
                                            ciuofi = st.nextToken();
                                        } else {
                                            ciuofi = "";
                                        }
                                    %>
                                    <%=dirres%> &nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Tel&eacute;fono</b></td>
                                <td width="68%"><%=padre.elementAt(3)%></td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Ciudad:</b></td>
                                <td width="68%"><%=ciures%></td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Direcci&oacute;n oficina:</b></td>
                                <td width="68%"><%=dirofi%> </td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Tel&eacute;fono:</b> <%=padre.elementAt(6)%></td>
                                <td width="68%"> &nbsp;<b>&nbsp;Ciudad:</b> <%=ciuofi%></td>
                            </tr>
                        </table>
                    </div>
                    <p>
                        <%} else if (padre.elementAt(0).equals("M")) {
                            idm = (String) padre.elementAt(11);
                            banm = "1";
                            st = new StringTokenizer(padre.elementAt(2).toString(), "$");
                            if (st.hasMoreElements()) {
                                dirres = st.nextToken();
                            } else {
                                dirres = "";
                            }
                            if (st.hasMoreElements()) {
                                ciures = st.nextToken();
                            } else {
                                ciures = "";
                            }
                            st = new StringTokenizer(padre.elementAt(4).toString(), "$");
                            if (st.hasMoreElements()) {
                                dirofi = st.nextToken();
                            } else {
                                dirofi = "";
                            }
                            if (st.hasMoreElements()) {
                                ciuofi = st.nextToken();
                            } else {
                                ciuofi = "";
                            }
                        %>
                    </p>
                    <table width="640" border="0" align="center" class="textocom">
                        <tr>
                            <td colspan="2"><b>DATOS DE LA MADRE</b></td>
                        </tr>
                        <tr>
                            <td width="33%"><b>Apellidos y Nombres</b></td>
                            <td width="67%"><%=padre.elementAt(1)%></td>
                        </tr>
                        <tr>
                            <td width="33%"><b>Direcci&oacute;n residencia: </b></td>
                            <td width="67%"><%=dirres%></td>
                        </tr>
                        <tr>
                            <td width="33%"><b>Tel&eacute;fono:</b> <%=padre.elementAt(3)%></td>
                            <td width="67%"><b>Ciudad:<%=ciures%></b></td>
                        </tr>
                        <tr>
                            <td width="33%"><b>Direcci&oacute;n oficina:</b></td>
                            <td width="67%"><%=dirofi%></td>
                        </tr>
                        <tr>
                            <td width="33%" height="22"><b>Tel&eacute;fono:<%=padre.elementAt(6)%></b></td>
                            <td width="67%" height="22"><b>Ciudad: <%=ciuofi%></b></td>
                        </tr>
                    </table>
                    <p>
                        <%}%>
                        <%}%>
                    </p>
                    <table width="640" border="0" align="center" class="textocom">
                        <tr>
                            <td colspan="2"><b>DATOS DEL ACUDIENTE</b></td>
                        </tr>
                        <tr>
                            <td width="33%"><b>Parentesco:</b></td>
                            <td width="67%">
                                <%=parentesco%>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%"><b>Nombre completo: </b></td>
                            <td width="67%"><b><%=estud.elementAt(9)%></b></td>
                        </tr>
                        <tr>
                            <td width="33%"><b>Direcci&oacute;n residencia:</b> </td>
                            <td width="67%"><%=estud.elementAt(10)%></td>
                        </tr>
                        <tr>
                            <td width="33%"><b>Tel&eacute;fono:</b></td>
                            <td width="67%"><%=estud.elementAt(11)%></td>
                        </tr>
                        <input name="tipoest" type="hidden" id="tipoest" value="E">
                        <input name="carnet" type="hidden" id="carnet" value="<%=carnet%>">
                        <input name="nomest" type="hidden" id="nomest" value="<%=estud.elementAt(1)%>">
                        <input name="parentesco" type="hidden" id="parentesco" value="<%=parentesco%>">
                        <input name="programa" type="hidden" id="programa" value="<%=prog%>">
                        <input name="idEst" type="hidden" id="idEst" value="<%=idEst%>">
                    </table>
                    <br>
                    <center><p align="center">

                            <input type="submit" name="Submit" value="Enviar Solicitud" size="2"  class="boton">
                        </p></center>  </form>

                    <%} else if (estud.elementAt(15).equals("-5")) {%>
                    <table width="75%" border="0" align="center">
                        <tr>
                            <td><font size="4"><b>Apreciado Aspirante:</b></font></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td><font size="3">Usted debe presentar previamente en la Oficina de Admisiones
                                la constancia del cumplimiento de los requerimientos solicitados por la
                                Rectoría como condición para solicitar el Reintegro.
                                <p>Puede comunicarse con la oficina de Admisiones donde se aclararán sus inquietudes,
                                    al email: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a>
                                    o al teléfono 6683600 opción 2 en el menú. </font> </td>
                        </tr>
                    </table>
                    <p>
                        <% } else {%>
                    </p>
                    <p>&nbsp;</p>
                    <p align="center">
                    <center>
                        <p align="center">
                        <h3>
                            <center>
                                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> Usted no esta
                                autorizado para realizar este proceso. <br>
                                Puede comunicarse con la oficina de Admisiones donde se aclararán sus inquietudes,<br>
                                al email: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a>
                                o al teléfono 6683600 opción 2 en el menú. </font>
                            </center>
                        </h3>
                    </center>
                    <h3>&nbsp;</h3>
                    <%}
                            //}
                        }

                    } else {%>
                    <h3>
                        <center>
                            <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> Usted no esta
                            autorizado para realizar este proceso. <br>
                            Puede comunicarse con la oficina de Admisiones donde se aclararán sus inquietudes,<br>
                            al email: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a>
                            o al teléfono 6683600 opción 2 en el menú. </font>
                        </center>
                    </h3>
                </div>
            </div>
        </div>
        <%}

                } else {

                    response.sendRedirect("ImprimeReintegro?documento=" + estud.elementAt(3) + "&docest=" + estud.elementAt(3));


                }
            }

        %>
        <!jsp:include page="piepag">
    <!jsp:param name="parametro" value="" />
    <!--/jsp:include-->
</body>

</html>