<%-- 
    Document   : Confirmacion
    Created on : 24/11/2015, 09:26:41 AM
    Author     : Lucero
--%>


<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<% String docEst = request.getParameter("docEst");
    configeci.configuracion confEci = new configeci.configuracion();
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    Vector examen = bd.ExamenConoc(docEst, confEci.getPeriodo(), oout);

    int x = 0, ban = 1;
    char com1, com2, com3, com4, com5, com6, comp1, comp2, comp3, comp4, comp5, comp6;

    String com11 = "", com22 = "", com33 = "", com44 = "", com55 = "", com66 = "", co6 = "";

    String comparar = new String();
    String tipoest = new String();
    String clasifica1 = new String();
    String clasifica2 = new String();
    String clasifica3 = new String();
    String clasifica4 = new String();
    String clasifica5 = new String();
    String clasifica6 = new String();
    String nivelexamen = new String();
    String confirmat = new String();
    String confirfis = new String();
    String confirqui = new String();
    String prog = new String();
    String carnet = new String();
    String co1 = new String();
    String co2 = new String();
    String co3 = new String();
    String co4 = new String();
    String co5 = new String();

    if (examen.size() > 0) {

        carnet = examen.elementAt(0).toString();
        String nombre = examen.elementAt(1).toString();
        String correo = examen.elementAt(2).toString();

        Vector DatosExamen = bd.Exa_Cono(carnet, confEci.getPeriodo(), oout);
        if (DatosExamen.size() > 0) {
            nivelexamen = DatosExamen.elementAt(2).toString();
            confirmat = DatosExamen.elementAt(3).toString();
            confirfis = DatosExamen.elementAt(4).toString();
            confirqui = DatosExamen.elementAt(5).toString();
%>
<html>
    <head>  <div id="container">
        <header>
            <div class="logoescuela">
                <img src="img/logo-ESCUELA.svg"/>
            </div>
            <img src="img/banner.jpg" />
            <div class="osiris">Desarrollado por: Direcci&oacute;n de Tecnolog&iacute;a Osiris y Direcci&oacute;n de Comunicaciones y Mercadeo</div>
        </header>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

        <title>Examen de Conocimiento</title>  
        <link href="css/estilo-resultadoconocimiento.css" rel="stylesheet" type="text/css" media="all">
            <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/JavaScript">
            function impresion(){
           
            window.print();
            
            }
        </script>

    </head>
    <body>
        <br>
        <div align="center" class="textoimpremas">Apreciado(a): <%=nombre%> </div>
        <p><br>

            <%Vector estudiante = bd.AdmitidosPregradoOtros(docEst, oout, confEci.getPeriodo());

                if (estudiante.size() > 0) {
                    for (int k = 0; k < estudiante.size(); k++) {

                        Vector datos = (Vector) estudiante.elementAt(k);%>

            <%
                Vector asignaturas = bd.Niveles(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);
                Vector asignaturasBio = bd.NivelesBio(datos.elementAt(1).toString(), confEci.getPeriodo(), oout);

                // String idprog = datos.elementAt(1).toString();
                if (datos.elementAt(1).equals("13")) {
                    prog = "INGENIERÍA CIVIL";
                } else if (datos.elementAt(1).equals("14")) {
                    prog = "INGENIERÍA ELÉCTRICA";
                } else if (datos.elementAt(1).equals("15")) {
                    prog = "INGENIERÍA DE SISTEMAS";
                } else if (datos.elementAt(1).equals("16")) {
                    prog = "INGENIERÍA INDUSTRIAL";
                } else if (datos.elementAt(1).equals("17")) {

                    prog = "INGENIERÍA ELECTRÓNICA";
                } else if (datos.elementAt(1).equals("18")) {
                    prog = "ECONOMÍA";

                } else if (datos.elementAt(1).equals("19")) {
                    prog = "ADMINISTRACIÓN DE EMPRESAS";
                } else if (datos.elementAt(1).equals("20")) {
                    prog = "MATEMÁTICAS";

                } else if (datos.elementAt(1).equals("260")) {
                    prog = "INGENIERÍA MECÁNICA";

                } else if (datos.elementAt(1).equals("262")) {
                    prog = "INGENIERÍA BIOMEDICA";

                }else if (datos.elementAt(1).equals("264")) {
                    prog = "INGENIERÍA AMBIENTAL";

                }%>
            <%comparar = (String) datos.elementAt(4);%>
            <% com1 = comparar.charAt(0);
                com11 = Character.toString(com1);
                com2 = comparar.charAt(1);
                com22 = Character.toString(com2);
                com3 = comparar.charAt(2);
                com33 = Character.toString(com3);
                com4 = comparar.charAt(3);
                com44 = Character.toString(com4);
                com5 = comparar.charAt(4);
                com55 = Character.toString(com5);
            %>
            <% if (com1 == 'B') {
                    clasifica1 = "Básico";
                }

                if (com1 == 'M') {
                    clasifica1 = "Medio";
                }

                if (com1 == 'A') {
                    clasifica1 = "Alto";
                }
            %>
            <% if (com2 == 'B') {
                    clasifica2 = "Básico";
                }

                if (com2 == 'M') {
                    clasifica2 = "Medio";
                }

                if (com2 == 'A') {
                    clasifica2 = "Alto";
                }
            %>
            <% if (com3 == 'B') {
                    clasifica3 = "Básico";
                }

                if (com3 == 'M') {
                    clasifica3 = "Medio";
                }

                if (com3 == 'A') {
                    clasifica3 = "Alto";
                }
            %>
            <% if (com4 == 'B') {
                    clasifica4 = "Básico";
                }

                if (com4 == 'M') {
                    clasifica4 = "Medio";
                }

                if (com4 == 'A') {
                    clasifica4 = "Alto";
                }
            %>
            <% if (com5 == 'B') {
                    clasifica5 = "Básico";
                }

                if (com5 == 'M') {
                    clasifica5 = "Medio";
                }

                if (com5 == 'A') {
                    clasifica5 = "Alto";
                }
            %>
            <%  if (nivelexamen.equals("No disponible") || (nivelexamen.equals("0"))) {%>

            <b><center>Usted no presentó el examen de conocimiento. Consulte nuevamente su citación.</center></b>

            <%} else {%>
            <br>
        <div align="center" class="textoimpremas">Programa: <%=prog%> </div>
        <table width="710" border="0" cellspacing="0" cellpadding="0" align="center"  class="textoimpremas">
            <tr>
                <td>
                    <br>

                    <p>Teniendo en cuenta sus resultados en el examen 
                        SABER 11 y en la prueba de conocimientos efectuada en noviembre de 2019 y la aprobación aceptada por usted,
                        sus niveles de clasificación son los siguientes:</p>
                </td>
            </tr>
        </table>
        <br>
        <br>
        <!--NIVEL ACEPTADO DESPUES DEL EXAMEN DE CONOCIMIENTO-->
        <% Vector NvoNivel = bd.NvoNivelIcfes(carnet, confEci.getPeriodo(), oout);

                comparar = NvoNivel.elementAt(0).toString();%>
        <%comp1 = comparar.charAt(0);
            co1 = Character.toString(comp1);
            comp2 = comparar.charAt(1);
            co2 = Character.toString(comp2);
            comp3 = comparar.charAt(2);
            co3 = Character.toString(comp3);
            comp4 = comparar.charAt(3);
            co4 = Character.toString(comp4);
            comp5 = comparar.charAt(4);
            co5 = Character.toString(comp5);
        %>

        <% if (comp1 == 'B') {
                clasifica1 = "Básico";
            }

            if (comp1 == 'M') {
                clasifica1 = "Medio";
            }

            if (comp1 == 'A') {
                clasifica1 = "Alto";
            }
        %>

        <% if (comp2 == 'B') {
                clasifica2 = "Básico";
            }

            if (comp2 == 'M') {
                clasifica2 = "Medio";
            }

            if (comp2 == 'A') {
                clasifica2 = "Alto";
            }
        %>

        <% if (comp3 == 'B') {
                clasifica3 = "Básico";
            }

            if (comp3 == 'M') {
                clasifica3 = "Medio";
            }

            if (comp3 == 'A') {
                clasifica3 = "Alto";
            }

            if (comp4 == 'B') {
                clasifica4 = "Básico";
            }

            if (comp4 == 'M') {
                clasifica4 = "Medio";
            }

            if (comp4 == 'A') {
                clasifica4 = "Alto";
            }
        %>

        <% if (comp5 == 'B') {
                clasifica5 = "Básico";
            }

            if (comp5 == 'M') {
                clasifica5 = "Medio";
            }

            if (comp5 == 'A') {
                clasifica5 = "Alto";
            }

            if (datos.elementAt(1).equals("18")) {%>

        <table align="center" width="37%" border="0" class="textoimpremas">
            <tr>
                <td width="19%">&nbsp;</td>

                <td width="19%"> <b>Su clasificaci&oacute;n</b></td>
            <br>&nbsp;
            </tr>
            <%if (!co1.equals(com11)) {%>
            <tr>
                <td width="19%"><font color="#990000"><b> Matemáticas</b></font></td>


                <td width="20%"> 
                    <div align="left"></div>
                    <font color="#990000"><b> <%=clasifica1%></b></font>
                </td>
            </tr>
            <%} else {%>
            <tr>
                <td width="19%"> Matemáticas</td>


                <td width="20%"> 
                    <div align="left"></div>
                    <%=clasifica1%>
                </td></tr>
                <%}%>
            <!--<tr>
                <td width="19%">Filosof&iacute;a</td>


                <td width="19%"> 
                    <div align="left"></div>
                    <!%=clasifica2%></td>
            </tr>
            <tr>
                <td width="19%">Lenguaje</td>


                <td width="19%"> 
                    <div align="left"></div>
                    <!%=clasifica4%></td>
            </tr>-->
        </table>

        <%  } else if (datos.elementAt(1).equals("19")) {%>

        <table align="center" width="37%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">
            <tr>
                <td width="19%">&nbsp;</td>

                <td width="19%"> Su clasificaci&oacute;n</td>
            </tr>
            <%if (!co1.equals(com11)) {%>
            <tr>
                <td width="19%"><font color="#990000"><b> Matemáticas</b></font></td>


                <td width="20%"> 
                    <div align="left"></div>
                    <font color="#990000"><b> <%=clasifica1%></b></font>
                </td>
            </tr>
            <%} else {%>
            <tr>
                <td width="19%"> Matemáticas</td>


                <td width="20%"> 
                    <div align="left"></div>
                    <%=clasifica1%>
                </td></tr>
                <%}%>
           <!-- <tr>
                <td width="19%">Ciencias Sociales</td>


                <td width="19%"> 
                    <div align="left"></div>
                    <!%=clasifica2%></td>
            </tr>
            <tr>
                <td width="19%">Lenguaje</td>


                <td width="19%"> 
                    <div align="left"></div>
                    <!%=clasifica4%></td>
            </tr>-->
        </table>

        <% }%>



        <% if (datos.elementAt(1).equals("13") || datos.elementAt(1).equals("14") || datos.elementAt(1).equals("15") || datos.elementAt(1).equals("17")) {%>

        <table align="center" width="37%" border="0" class="textoimpremas" dwcopytype="CopyTableRow">        

            <tr>
                <td width="19%">&nbsp;</td>

                <td width="20%"> Su clasificaci&oacute;n</td>
            </tr>
            <%if (!co1.equals(com11)) {%>
            <tr>
                <td width="19%"><font color="#990000"><b> Matemáticas</b></font></td>


                <td width="20%"> 
                    <div align="left"></div>
                    <font color="#990000"><b> <%=clasifica1%></b></font>
                </td>
            </tr>
            <%} else {%>
            <tr>
                <td width="19%"> Matemáticas</td>


                <td width="20%"> 
                    <div align="left"></div>
                    <%=clasifica1%>
                </td></tr>
                <%}%>
                <%if (!co3.equals(com33)) {%>
            <tr>
                <td width="19%"><font color="#990000"><b> F&iacute;sica</b></font></td>


                <td width="20%"> 
                    <div align="left"></div>
                    <font color="#990000"><b> <%=clasifica3%></b></font>
                </td>
            </tr>
            <%} else {%>
            <tr>
                <td width="19%"> F&iacute;sica</td>


                <td width="20%"> 
                    <div align="left"></div>
                    <%=clasifica3%>
                </td></tr>
                <%}%>
          <!--  <tr>
                <td width="19%">Lenguaje</td>

                <td width="20%"> 
                    <div align="left"></div>
                    <!%=clasifica4%></td>
            </tr>-->
        </table>



        <%} else if (datos.elementAt(1).equals("16") || datos.elementAt(1).equals("20") || datos.elementAt(1).equals("260")||datos.elementAt(1).equals("264")) {%>

        <p>&nbsp;</p><table align="center" width="60%" border="0" class="textoimpremas">
            <tr>
                <td width="19%">&nbsp;</td>

                <td width="20%"> Su clasificaci&oacute;n</td>
            </tr>
            <%if (!co1.equals(com11)) {%>
            <tr>
                <td width="19%"><font color="#990000"><b> Matemáticas</b></font></td>


                <td width="20%"> 
                    <div align="left"></div>
                    <font color="#990000"><b> <%=clasifica1%></b></font>
                </td>
            </tr>
            <%} else {%>
            <tr>
                <td width="19%"> Matemáticas</td>


                <td width="20%"> 
                    <div align="left"></div>
                    <%=clasifica1%>
                </td></tr>
                <%}%>
                <%if (!co3.equals(com33)) {%>
            <tr>
                <td width="19%"><font color="#990000"><b> F&iacute;sica</b></font></td>


                <td width="20%"> 
                    <div align="left"></div>
                    <font color="#990000"><b> <%=clasifica3%></b></font>
                </td>
            </tr>
            <%} else {%>
            <tr>
                <td width="19%"> F&iacute;sica</td>


                <td width="20%"> 
                    <div align="left"></div>
                    <%=clasifica3%>
                </td></tr>
                <%}%>
           <!-- <tr>
                <td width="19%">Lenguaje</td>

                <td width="20%"> 
                    <div align="left"></div>
                    <!%=clasifica4%></td>
            </tr>-->

            <%if (!co5.equals(com55)) {%>
            <tr>
                <td width="19%"><font color="#990000"><b> Química</b></font></td>
                <td width="20%"> 
                    <div align="left"></div>
                    <font color="#990000"><b> <%=clasifica5%></b></font>
                </td>
            </tr>
            <%} else {%>
            <tr>
                <td width="19%">Química</td>
                <td width="20%"> 
                    <div align="left"></div>
                    <%=clasifica5%>
                </td></tr>
                <%}%>

            <tr>

                <td height="19"> 
                    <p>&nbsp;</p>

                </td>
            </tr>
        </table>
        <% } else if (datos.elementAt(1).equals("262")) {
            comp6 = comparar.charAt(5);
            co6 = Character.toString(comp6);
            if (comp6 == 'B') {
                clasifica6 = "Básico";
            }

            if (comp6 == 'M') {
                clasifica6 = "Medio";
            }

            if (comp6 == 'A') {
                clasifica6 = "Alto";
            }%>

        <p>

        <table align="center" width="36%" border="0" class="textoimpremas">
            <tr>
                <td width="19%">&nbsp;</td>

                <td width="20%"><b> Su clasificaci&oacute;n</b></td>
            <br>&nbsp;
            </tr>
            <%if (!co1.equals(com11)) {%>
            <tr>
                <td width="19%"><font color="#990000"><b> Matemáticas</b></font></td>
                <td width="20%"> 
                    <div align="left"></div>
                    <font color="#990000"><b> <%=clasifica1%></b></font>
                </td>
            </tr>
            <%} else {%>
            <tr>
                <td width="19%"> Matemáticas</td>


                <td width="20%"> 
                    <div align="left"></div>
                    <%=clasifica1%>
                </td></tr>
                <%}%>
                <%if (!co3.equals(com33)) {%>
            <tr>
                <td width="19%"><font color="#990000"><b> F&iacute;sica</b></font></td>


                <td width="20%"> 
                    <div align="left"></div>
                    <font color="#990000"><b> <%=clasifica3%></b></font>
                </td>
            </tr>
            <%} else {%>
            <tr>
                <td width="19%"> F&iacute;sica</td>
                <td width="20%"> 
                    <div align="left"></div>
                    <%=clasifica3%>
                </td></tr>
                <%}%>
            <tr>
                <td width="19%">Lenguaje</td>

                <td width="20%"> 
                    <div align="left"></div>
                    <%=clasifica4%></td>
            </tr>
            <%if (!co5.equals(com55)) {%>
            <tr>
                <td width="19%"><font color="#990000"><b> Química</b></font></td>
                <td width="20%"> 
                    <div align="left"></div>
                    <font color="#990000"><b> <%=clasifica5%></b></font>
                </td>
            </tr>
            <%} else {%>
            <tr>
                <td width="19%">Química</td>
                <td width="20%"> 
                    <div align="left"></div>
                    <%=clasifica5%>
                </td></tr>
                <%}%>
            <tr>
                <td width="17%">Biología</td>

                <td width="20%">
                    <div align="left"></div><%=clasifica6%>
                </td>
            </tr>
            <p>&nbsp;</p>
            <tr>
            <p>&nbsp;</p>
            <td>  <p>&nbsp;</p>
            </td></tr>
            <%}%>
        </table>

        <p>&nbsp;</p>

        <!--div align="center" class="textoimpremas">ASIGNATURAS A CURSAR<br>
        </div-->
        <p>&nbsp;</p>
        <!--%Vector AsigFinal = bd.AsignaturasRegistroT(carnet, confEci.getPeriodo());
                for (int j = 0; j < AsigFinal.size(); j++) {%-->
        <!--% Vector nombreasig = (Vector) AsigFinal.elementAt(j);
                String asignatura = nombreasig.elementAt(1).toString();%-->

        <!--p class="textoimpremas" ><!--%=asignatura%--></p-->
        <!--%}%-->

        <div class="textoimpremas">
            <br>

            <p align="left">&nbsp;</p>
        </div>
        <%
                }
            }
        } else {%>
        <b>Su documento es incorrecto o usted no ha diligenciado la solicitud de admisión. 
            Verifique e intente nuevamente o comuníquese al 6683600 opción 2 en el menú.**</b> 
            <%}
                    }%>
            <%   }%>
        <table width="100%" border="0" id="tablaboton" >
            <tr>

                
      <td width="40%"> 
        <div align="center">
          <input name="imprimir" class="boton"  type="submit" id="imprimir3" value="Imprimir" onClick="impresion()">
          <input name="salir" class="boton"  type="submit" id="" value="Salir" onClick="location.href = 'http://www.escuelaing.edu.co' ">
        </div>
      </td>
            </tr>
        </table>
        
  <p>&nbsp;</p>

<p><footer> </footer></p>
<p><footer><span class="programa">Escuela Colombiana de Ingeniería Julio Garavito 
            </span> 
            <span class="direccion">
                AK.45 No.205-59 (Autopista Norte) costado occidental<br/>
                Contact Center: +57(1) 668 3600<br/>
                Línea Nacional Gratuita: 018000112668<br/>
                www.escuelaing.edu.co<br/>
                Bogotá, D.C. - Colombia<br/>
            </span>
    </footer></p>



</body>
</html>

