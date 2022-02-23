<%-- 
    Document   : FormularioReadmision
    Created on : 28/08/2009, 03:52:44 PM
    Author     : lrodriguez
--%>

<%@page import="utiles.Correo"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones"%>
<% try {
        String carnet = new String();
        String idciudad = new String();
        String docEst = request.getParameter("idEst");
        String clave = request.getParameter("clave");
        PrintWriter oout = response.getWriter();
        configeci.configuracion confeci = new configeci.configuracion();
        BDadmisiones admision = new BDadmisiones();
        String perant = confeci.getperant();
        String prog = new String(""), dirres, ciures, dirofi, ciuofi, banp = "0", banm = "0", idp = "", idm = "", vives = "", viven = "";
        StringTokenizer st;
        Vector estud = admision.getInfoEst(docEst);
        if (estud.size() > 0) {
            carnet = estud.elementAt(0).toString();
            Vector ciud = admision.getCiudades();
            Vector padres = admision.getPadres(carnet);
//   String impre = request.getParameter("impre");
            if (docEst != null && !docEst.equals("")) {
%>
<html>
    <head>
        <title>Readmisión</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/estilo-fomularios.css">
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="SOLICITUD DE READMISION A LOS PROGRAMAS ACADÉMICOS DE PREGRADO" />
        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-7">   
                    <form name="form1" method="post" action="GrabaEstudiante">


                        <% String parentesco = "";
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
                            }%>

                        <%
                if ((estud.size()) == 0) {%>
                        <p>&nbsp;</p>
                        <p>
                        <table width="75%" border="0" align="center">
                            <tr>
                                <td>Solicitud de Readmisión :</td>
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
                            <!--%} else {
                    if (!((String) estud.elementAt(31)).equals(clave)) {%>
                        </p>

                        <p align="center">
                        <h3>
                            <center>
                                Su password es incorrecto, verifíquelo e ingrese nuevamente.-->
                            </center></h3>
                        <!-- se agrega -1 que son suspendidos ya que no habran reingresos  el tipo Z y estado -23 podra volver a solicitar la readmision-->
                        <%} else if (((String) estud.elementAt(18)).equals("Z") && !((String) estud.elementAt(15)).equals("-23")) {%>
                        <p align="center">
                        <h3>
                            <center>
                                Usted ya realizó el proceso de Readmisión. Cualquier información adicional comuníquese con la oficina de Admisiones
                                donde se aclararán sus inquietudes al teléfono 6683600 opción 2 en el menú.
                            </center></h3>
                            <%} else {
                                Vector Readmision = admision.getValidaSolRead(docEst, oout);
                                // out.println(Readmision);
%>
                            <%if (Readmision.size() > 0) {%>
                        <table width="640" border="0" align="center" >
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
                                <%if (estud.elementAt(7).equals("260")) {
                                        prog = "INGENIERIA MECANICA";
                                    }%>
                                <%if (estud.elementAt(7).equals("264")) {
                                prog = "INGENIERIA AMBIENTAL";
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
                                    &nbsp;<b>&nbsp; No.</b> <%=estud.elementAt(3)%> &nbsp;
                                    <!--<b>de</b> -->
                                    <!--%=admision.getNomCiudad(estud.elementAt(8).toString())%>-->
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
                                <td width="68%"> <%=admision.getNomCiudad(estud.elementAt(5).toString())%> </td>
                            </tr>
                            <tr>
                                <td width="32%"><b>Tel&eacute;fono</b> </td>
                                <td width="68%">
                                    <input type="text" name="campo8" maxlength="12" size="15" value="<%=estud.elementAt(6)%>">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><b>INTERES ACADEMICO</b>
                                    <p><strong><b><font color="#990000">*</font></b>Indique las razones por
                                            las cu&aacute;les desea solicitar readmisi&oacute;n al programa:</strong></p>
                                    <p>
                                        <input type="text" name="interes" value="" maxlength="240" size="100">
                                        <!-- <textarea name="interes" cols="85" rows="2" wrap="VIRTUAL" onBlur="this.value = convertTildes(this.value);"></textarea>-->
                                    </p>
                                </td>
                            </tr>
                        </table>
                        <p><%
                            for (int i = 0; i < padres.size(); i++) {
                                Vector padre = (Vector) padres.elementAt(i);
                                if (padre.elementAt(0).equals("P")) {
                            %></p>

                        <table width="640" border="0"  >
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
                        <table width="640" border="0" align="center">
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
                        <table width="640" border="0" align="center" >
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
                            <input type="hidden" name="tipoest"  id="tipoest" value="Z">
                            <input type="hidden" name="carnet"  id="carnet" value="<%=carnet%>">
                            <input  type="hidden"name="nomest"  id="nomest" value="<%=estud.elementAt(1)%>">
                            <input  name="parentesco" type="hidden" id="parentesco" value="<%=parentesco%>">
                            <input name="programa" type="hidden" id="programa" value="<%=prog%>">
                            <input name="idEst" type="hidden" id="idEst" value="<%=docEst%>">
                        </table>
                        <br>
                        <center><p align="center">

                                <input type="submit" name="Submit" value="Enviar Solicitud" size="2"  class="boton">
                            </p></center>
                    </form>
                </div>
            </div>
        </div>
        <%} else {%>

        <h3>
            <center>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="3"> Usted no esta
                autorizado para realizar este proceso. <br>
                Puede comunicarse con la oficina de Admisiones donde se aclararán sus inquietudes,
                al email: <a href="mailto:admisiones@escuelaing.edu.co">admisiones@escuelaing.edu.co</a>
                o al teléfono 6683600 opción 2 en el menú. </font>
            </center>
        </h3>
        <h3>&nbsp;</h3>
        <%}%>
        <%}
           // }%>

    </body>

</html>
<%
        } else {
            response.sendRedirect("ImprimeReadmision?documento=" + estud.elementAt(3) + "&docest=" + estud.elementAt(3));
        }
    } else {
        out.println("No existe información de este registro");
    }
%>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Formulario Readmisión", e.getMessage());
    }
%>
