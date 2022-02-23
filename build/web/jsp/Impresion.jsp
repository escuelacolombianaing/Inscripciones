<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%@ page import ="configeci.configuracion"%>

<%
    String docEst = request.getParameter("documento");
    String docestud = request.getParameter("docest");
    PrintWriter oout = response.getWriter();
    BDadmisiones bd = new BDadmisiones();
    String nomprof = new String("");
    String egresa = new String("");
    String numRef = request.getParameter("ref");
    configeci.configuracion confeci = new configeci.configuracion();
    String periodo = confeci.getPeriodo();
    if (docEst != null && !docEst.equals("") && docEst.equals(docestud)) {%>

<html>
    <head>
        <title>Formulario Pregrado</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
         <link rel="stylesheet" href="css/estilo-fomularios.css">
        <script language="javascript" type="text/javascript" src="jscript/comun.js">
           
        </script>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function impresion(){
            document.getElementById("tablaboton").style.visibility='hidden';
            window.print();
            window.close();
            }
            -->
        </script>
    </head>
    <body>  
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />

        </jsp:include>
        <div class="container-fluid contenidos">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">


                    <%Vector ciucor = bd.getCiudadcor();%>

                    <%Vector datos = bd.ConsultaInscrito(docEst, numRef, oout, periodo);%>

                    <%int lon = datos.size();
                        if (lon <= 0) {
                            out.println("<b><center>La información  no concuerda con la diligenciada, o la información de sus acudientes no fué registrada exitosamente, por favor verifique los datos.</center></b>");
                        } else {
                            Vector estudiante = (Vector) datos.elementAt(0);
                            String programa = "";
            String carnet = estudiante.elementAt(0).toString();%>
                    <%if (estudiante.elementAt(3).equals("13")) {
                            programa = "INGENIERIA CIVIL";
                        }
                        if (estudiante.elementAt(3).equals("14")) {
                            programa = "INGENIERIA ELECTRICA";
                        }
                        if (estudiante.elementAt(3).equals("15")) {
                            programa = "INGENIERIA DE SISTEMAS";
                        }
                        if (estudiante.elementAt(3).equals("16")) {
                            programa = "INGENIERIA INDUSTRIAL";
                        }
                        if (estudiante.elementAt(3).equals("17")) {
                            programa = "INGENIERIA ELECTRONICA";
                        }
                        if (estudiante.elementAt(3).equals("18")) {
                            programa = "ECONOMIA";
                        }
                        if (estudiante.elementAt(3).equals("19")) {
                            programa = "ADMINISTRACION DE EMPRESAS";
                        }
                        if (estudiante.elementAt(3).equals("20")) {
                            programa = "MATEMATICAS";
                        }
                        if (estudiante.elementAt(3).equals("260")) {
                            programa = "INGENIERIA MECANICA";
                        }
                        if (estudiante.elementAt(3).equals("264")) {
                            programa = "INGENIERIA AMBIENTAL";
                        }
                        String financia = "";
                        if (estudiante.elementAt(27).equals("1")) {
                            financia = "BECA";
                        }
                        if (estudiante.elementAt(27).equals("2")) {
                            financia = "RENTA PROPIA";
                        }
                        if (estudiante.elementAt(27).equals("3")) {
                            financia = "APOYO FAMILIAR";
                        }
                        if (estudiante.elementAt(27).equals("4")) {
                            financia = "CREDITO";
                        }
                        if (estudiante.elementAt(27).equals("5")) {
                            financia = "TRABAJO PERSONAL";
                        }
                        if (estudiante.elementAt(27).equals("6")) {
                            financia = "ICETEX";
                        }
                        if (estudiante.elementAt(27).equals("7")) {
                            financia = "OTRO";
                        }
                        String flia = "";
                        if (estudiante.elementAt(28).equals("2")) {
                            flia = "Padre y Madre unidos";
                        }
                        if (estudiante.elementAt(28).equals("3")) {
                            flia = "Padres Separados";
                        }
                        if (estudiante.elementAt(28).equals("5")) {
                            flia = "Padres Viudos";
                        }
                        if (estudiante.elementAt(28).equals("10")) {
                            flia = "Padres sin sociedad Conyugal";
                        }
                        String vivienda = "";
                        if (estudiante.elementAt(30).equals("1")) {
                            vivienda = "ARRENDADA";
                        }
                        if (estudiante.elementAt(30).equals("2")) {
                            vivienda = "PROPIA Y PAGADA";
                        }
                        if (estudiante.elementAt(30).equals("3")) {
                            vivienda = "PROPIA Y DEUDA";
                        }
                        if (estudiante.elementAt(30).equals("5")) {
                            vivienda = "FAMILIAR";
                        }
                        String parentesco = "";
                        if (estudiante.elementAt(33).equals("M")) {
                            parentesco = "MADRE";
                        }
                        if (estudiante.elementAt(33).equals("P")) {
                            parentesco = "PADRE";
                        }
                        if (estudiante.elementAt(33).equals("A")) {
                            parentesco = "ABUELO(A)";
                        }
                        if (estudiante.elementAt(33).equals("T")) {
                            parentesco = "TIO(A)";
                        }
                        if (estudiante.elementAt(33).equals("H")) {
                            parentesco = "HERMANO(A)";
                        }
                        if (estudiante.elementAt(33).equals("R")) {
                            parentesco = "PRIMO(A)";
                        }
                        if (estudiante.elementAt(33).equals("O")) {
                            parentesco = "OTRO";
                        }
                        if (estudiante.elementAt(33).equals("N")) {
                            parentesco = "NINGUNO";
                        }
                        String universidad = "";
                        if (estudiante.elementAt(45).equals("1")) {
                            universidad = "UNIVERSIDAD DE LOS ANDES";
                        }
                        if (estudiante.elementAt(45).equals("2")) {
                            universidad = "UNIVERSIDAD CATOLICA DE COLOMBIA";
                        }
                        if (estudiante.elementAt(45).equals("3")) {
                            universidad = "UNIVERSIDAD NACIONAL";
                        }
                        if (estudiante.elementAt(45).equals("4")) {
                            universidad = "UNIVERSIDAD DISTRITAL";
                        }
                        if (estudiante.elementAt(45).equals("5")) {
                            universidad = "UNIVERSIDAD CENTRAL";
                        }
                        ;
                        if (estudiante.elementAt(45).equals("6")) {
                            universidad = "UNIVERSIDAD PILOTO DE COLOMBIA";
                        }
                        ;
                        if (estudiante.elementAt(45).equals("7")) {
                            universidad = "UNIVERSIDAD JAVERIANA";
                        }
                        if (estudiante.elementAt(45).equals("8")) {
                            universidad = "UNIVERSIDAD ANTONIO NARIÑO";
                        }
                        if (estudiante.elementAt(45).equals("10")) {
                            universidad = "OTRA UNIVERSIDAD";
                        }
                        if (estudiante.elementAt(45).equals("11")) {
                            universidad = "UNIVERSIDAD DE CARTAGENA";
                        }

                    %>


                    <table width="660" border="0" cellpadding="1" cellspacing="0" class="textoimpre" align="center">
                        <tr>
                            <td width="29%"><b>Identificador:</b></td>
                            <td width="55%"><%=carnet%></td>
                            <td width="11%" rowspan="7"> 
                                <div align="center"></div>
                            </td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>No. Inscripci&oacute;n:&nbsp;</b></td>
                            <td width="55%"><%=estudiante.elementAt(46)%></td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Programa acad&eacute;mico:</b></td>
                            <td width="55%"><%=programa%></td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Nombres y Apellidos:&nbsp;</b></td>
                            <td width="55%"><%=estudiante.elementAt(2)%></td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>No.Documento del aspirante:&nbsp;&nbsp;</b></td>
                            <td width="55%"><%=estudiante.elementAt(1)%></td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>N&uacute;mero de registro SNP</b>: </td>
                            <td width="55%"><%=estudiante.elementAt(4)%></td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Fecha y Lugar de Nacimiento:</b></td>
                            <td width="55%"><%=estudiante.elementAt(7)%> - <%=estudiante.elementAt(56)%> 
                            </td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Direcci&oacute;n de correspondencia:</b></td>
                            <%
                                if (estudiante.elementAt(46).toString().charAt(0) == 'R') {
                            %>
                            <td colspan="2"><%=estudiante.elementAt(52)%></td>
                            <%} else {%>
                            <td colspan="2" width="5%"><%=estudiante.elementAt(10)%></td>
                            <%}%>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Tel&eacute;fono:</b></td>
                            <%
                                if (estudiante.elementAt(44).toString().equals("R")) {
                            %>
                            <td colspan="2"><%=estudiante.elementAt(51)%></td>
                            <%
    } else {%>
                            <td colspan="2" width="5%"><%=estudiante.elementAt(11)%></td>
                            <%}%>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Ciudad:</b></td>
                            <td width="55%"><%=estudiante.elementAt(6)%> </td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Celular:</b></td>
                            <td colspan="2"><%=estudiante.elementAt(53)%></td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Correo Electr&oacute;nico:</b></td>
                            <td colspan="2"><%=estudiante.elementAt(12)%></td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>C&oacute;digo del colegio:</b> &nbsp;&nbsp;<%=estudiante.elementAt(13)%></td>
                            <td colspan="2"><b>Fecha de grado:</b>&nbsp;&nbsp;<%=estudiante.elementAt(14)%></td>
                        </tr>
                        <%Vector colegio = bd.Colegio(carnet, oout);%>
                        <%if (colegio.size() > 0) {%>
                        <tr> 
                            <td width="29%"><b>Nombre del colegio:</b></td>
                            <td colspan="2"><%=colegio.elementAt(1)%></td>
                        <tr> 
                            <td width="29%"><b>Municipio:</b></td>
                            <td colspan="2"><%=colegio.elementAt(3)%></td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Departamento:</b></td>
                            <td colspan="2"><%=colegio.elementAt(2)%></td>
                        </tr>

                        <%}%>
                        <tr> 
                            <td width="29%">&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <%if (estudiante.elementAt(44).equals("T")) {

                        %>
                        <tr> 
                            <td colspan="3"><b>Universidad de procedencia:</b> &nbsp;&nbsp;<%=universidad%></td>
                        </tr>
                        <%}%>
                        <tr> 
                            <td colspan="3"> 
                                <hr>
                            </td>
                        </tr>
                        <tr> 
                            <td colspan="3"> 
                                <div align="center"><b><font color="#336699">INFORMACION ECONOMICA</font></b></div>
                            </td>
                        </tr>
                        <!--   <tr>
                                  <td><b>Valor mensual pagado &uacute;ltimo a&ntilde;o de estudios:</b></td>
                                  <td colspan="2"><!%=estudiante.elementAt(29)%></td>
                                </tr>
                                <!%if (estudiante.elementAt(44).equals("T")){%>
                                <tr>
                                  <td><b>Valor pagado por matr&iacute;cula en el &uacute;ltimo semestre:</b></td>
                                  <td colspan="2"><!%=estudiante.elementAt(50)%></td>
                              </tr>-->
                        <!%}%>
                        <tr> 
                            <td width="29%"><b>La vivienda de habitaci&oacute;n de su hogar es:</b></td>
                            <td colspan="2"><%=vivienda%></td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Estrato de los servicios p&uacute;blicos:</b></td>
                            <td colspan="2"><%=estudiante.elementAt(40)%></td>
                        </tr>
                        <tr> 
                            <td colspan="3"> 
                                <hr>
                            </td>
                        </tr>
                        <tr> 
                            <td colspan="3"> 
                                <div align="center"><b><font color="#336699">DATOS DEL ACUDIENTE</font></b></div>
                            </td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Parentesco:</b>&nbsp;&nbsp; <%=parentesco%> </td>
                            <td colspan="2"><b>Nombre Completo:</b>&nbsp;&nbsp;<%=estudiante.elementAt(34)%> 
                            </td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Direcci&oacute;n :</b>&nbsp;&nbsp; <%=estudiante.elementAt(35)%> 
                            </td>
                            <td colspan="2"><b>Tel&eacute;fono: &nbsp;&nbsp; </b> <%=estudiante.elementAt(36)%></td>
                        </tr>
                       
                        <tr> 
                            <td width="29%"><b>Nombre persona diferente al acudiente:</b></td>
                            <td colspan="2"><%=estudiante.elementAt(37)%></td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Direcci&oacute;n: </b> &nbsp;&nbsp;<%=estudiante.elementAt(38)%></td>
                            <td colspan="2"><b>Tel&eacute;fono: </b> &nbsp;&nbsp; <%=estudiante.elementAt(39)%></td>
                        </tr>
                        <tr> 
                            <td colspan="3"> 
                                <hr>
                            </td>
                        </tr>
                        <%Vector hermanos = bd.ConsultaHermanos(docEst, oout);%>
                        <%if ((hermanos.size()) > 0) {%>
                        <% for (int j = 0; j < hermanos.size(); j++) {
          Vector hermano = (Vector) hermanos.elementAt(j);
          if (hermano.elementAt(1).equals("S")) {%>
                        <tr> 
                            <td colspan="3"> 
                                <p align="center"><b><font color="#336699">HERMANOS QUE INGRESARAN SIMULTANEAMENTE</font></b></p>
                            </td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Nombre:&nbsp;&nbsp; </b><%=hermano.elementAt(0)%></td>
                            <td colspan="2"><b>Documento: &nbsp;&nbsp;</b><%=hermano.elementAt(2)%></td>
                        </tr>
                        <% } else {%>
                        <tr> 
                            <td colspan="3"> 
                                <p align="center"><b><font color="#336699">HERMANOS QUE ACTUALMENTE ESTUDIAN 
                                        EN LA ESCUELA</font></b></p>
                            </td>
                        </tr>
                        <tr> 
                            <td width="29%"><b>Nombre:&nbsp;&nbsp; </b><%=hermano.elementAt(0)%></td>
                            <td colspan="2"><b>Carnet: &nbsp;&nbsp;</b><%=hermano.elementAt(2)%></td>
                        </tr>
                        <tr> 
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <%}
          }
      }%>
                        <tr> 
                            <td colspan="3"> 
                                <hr>
                            </td>
                        </tr>
                        <tr> 
                            <td colspan="3"> 
                                <div align="center"><b><font color="#336699">INFORMACION FAMILIAR</font></b></div>
                            </td>
                        </tr>
                        <tr> 
                            <td colspan="3"> 
                                <% String nommp = new String("");
                                    // if (estudiante.elementAt(43).equals("S")){
                                    if (estudiante.elementAt(49).equals("M")) {
                                        nommp = "de la Madre";
                                    } else {
                                        nommp = "del Padre";
          }%>
                                
                                    <tr> 
                                        <td width="31%"><b>Composici&oacute;n Familiar:</b></td>
                                        <td width="69%"><%=flia%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Nombre <%=nommp%>:</b></td>
                                        <td width="69%"><%=estudiante.elementAt(24)%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Direcci&oacute;n de residencia:</b></td>
                                        <td width="69%"><%=estudiante.elementAt(25)%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Tel&eacute;fono:</b></td>
                                        <td width="69%"><%=estudiante.elementAt(26)%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Celular</b></td>
                                        <td width="69%"><%=estudiante.elementAt(54)%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Ingresos (en pesos)</b></td>
                                        <td width="69%"><%=estudiante.elementAt(41)%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Antiguedad en la Empresa</b></td>
                                        <td width="69%"><%=estudiante.elementAt(58)%> meses</td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Correo</b></td>
                                        <td width="69%"><%=estudiante.elementAt(59)%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Educaci&oacute;n:</b></td>
                                        <% String educacion = "";
                                            if (estudiante.elementAt(47).equals("P")) {
                                                educacion = "Primaria";
                                            }
                                            if (estudiante.elementAt(47).equals("S")) {
                                                educacion = "Secundaria";
                                            }
                                            if (estudiante.elementAt(47).equals("U")) {
                                                educacion = "Universitaria";
                                            }
                                            if (estudiante.elementAt(47).equals("E")) {
                                                educacion = "Estudiante Universitario";
                                            }
                                            if (estudiante.elementAt(47).equals("T")) {
                                                educacion = "Técnico";
                                            }
                                            if (estudiante.elementAt(47).equals("L")) {
                                                educacion = "Tecnólogo";
                                            }
                                        %>
                                        <td width="69%"><%=educacion%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Profesi&oacute;n:</b></td>
                                        <%
                                            nomprof = bd.getProfesion(estudiante.elementAt(48).toString());
                                        %>
                                        <td width="69%"><%=nomprof%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Ocupación</b></td>
                                        <% String ocupacion = "";
                                            if (estudiante.elementAt(57).equals("9")) {
                                                ocupacion = "Empleado";
                                            }
                                            if (estudiante.elementAt(57).equals("5")) {
                                                ocupacion = "Empresario";
                                            }
                                            if (estudiante.elementAt(57).equals("7")) {
                                                ocupacion = "Trabajo Independiente";
                                            }
                                            if (estudiante.elementAt(57).equals("6")) {
                                                ocupacion = "Profesional Independiente";
                                            }
                                            if (estudiante.elementAt(57).equals("15")) {
                                                ocupacion = "Pensionado";
                                            }
                                            ;
                                            if (estudiante.elementAt(57).equals("4")) {
                                                ocupacion = "Hogar";
                                            }
                                            if (estudiante.elementAt(57).equals("0")) {
                                                ocupacion = "Otro";
                                            }

                                        %>
                                        <td width="69%"><%=ocupacion%></td>
                                    </tr>
                                    <tr> 
                                        <%//}
              if (lon > 1) {%>
                                        <% Vector estudiante1 = (Vector) datos.elementAt(1);%>
                                        <% %>
                                        <% //if (estudiante1.elementAt(43).equals("S")){
                                            if (estudiante1.elementAt(49).equals("M")) {
                                                nommp = "de la Madre";
                                            } else {
                                                nommp = "del Padre";
              }%>
                                    <tr> 
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Nombre <%=nommp%>:</b></td>
                                        <td width="69%"><%=estudiante1.elementAt(24)%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Direcci&oacute;n de residencia:</b></td>
                                        <td width="69%"><%=estudiante1.elementAt(25)%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Tel&eacute;fono:</b></td>
                                        <td width="69%"><%=estudiante1.elementAt(26)%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Celular:</b></td>
                                        <td width="69%"><%=estudiante1.elementAt(54)%><strong> </strong></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Ingresos (en pesos)</b></td>
                                        <td width="69%"><%=estudiante1.elementAt(41)%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Antiguedad en la Empresa</b></td>
                                        <td width="69%"><%=estudiante1.elementAt(58)%> meses</td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Correo</b></td>
                                        <td width="69%"><%=estudiante1.elementAt(59)%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Educaci&oacute;n:</b></td>
                                        <% String educacionp = "";
                                            if (estudiante1.elementAt(47).equals("P")) {
                                                educacionp = "Primaria";
                                            }
                                            if (estudiante1.elementAt(47).equals("S")) {
                                                educacionp = "Secundaria";
                                            }
                                            if (estudiante1.elementAt(47).equals("U")) {
                                                educacionp = "Universitaria";
                                            }
                                            if (estudiante1.elementAt(47).equals("E")) {
                                                educacionp = "Estudiante Universitario";
                                            }
                                            if (estudiante1.elementAt(47).equals("T")) {
                                                educacionp = "Técnico";
                                            }
                                            if (estudiante1.elementAt(47).equals("L")) {
                                                educacionp = "Tecnólogo";
                                            }
                                        %>
                                        <td width="69%"><%=educacionp%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Ocupación</b></td>
                                        <% String ocupacionp = "";
                                            if (estudiante1.elementAt(57).equals("9")) {
                                                ocupacionp = "Empleado";
                                            }
                                            if (estudiante1.elementAt(57).equals("5")) {
                                                ocupacionp = "Empresario";
                                            }
                                            if (estudiante1.elementAt(57).equals("7")) {
                                                ocupacionp = "Trabajo Independiente";
                                            }
                                            if (estudiante1.elementAt(57).equals("6")) {
                                                ocupacionp = "Profesional Independiente";
                                            }
                                            if (estudiante1.elementAt(57).equals("15")) {
                                                ocupacionp = "Pensionado";
                                            }
                                            ;
                                            if (estudiante1.elementAt(57).equals("4")) {
                                                ocupacionp = "Hogar";
                                            }
                                            if (estudiante1.elementAt(57).equals("0")) {
                                                ocupacionp = "Otro";
                                            }

                                        %>
                                        <td width="69%"><%=ocupacionp%></td>
                                    </tr>
                                    <tr> 
                                        <td width="31%"><b>Profesi&oacute;n:</b></td>
                                        <%
                                            nomprof = bd.getProfesion(estudiante1.elementAt(48).toString());
                                        %>
                                        <td width="69%"><%=nomprof%></td>
                                    </tr>
                               
                                <%//}
          }%>
                                <% if (estudiante.elementAt(55).equals("N")) {
                                        egresa = "Ninguno";
                                    }
                                    if (estudiante.elementAt(55).equals("P")) {
                                        egresa = "Padre";
                                    }
                                    if (estudiante.elementAt(55).equals("M")) {
                                        egresa = "Madre";
                                    }
                                    if (estudiante.elementAt(55).equals("A")) {
                                        egresa = "Ambos";
                                    }
                                %>
                        <tr> 
                            <td width="29%"><b>Padre egresado de la Escuela Col. de Ingeniería:</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=egresa%></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

       <table width="100%" border="0" id="tablaboton" >
        <tr>
            <td width="60%">
                <div align="center">
                    <input name="imprimir" class="boton"  type="submit" id="imprimir3" value="Imprimir Formulario " onClick="impresion()">
                </div>
            </td>
        </tr>
    </table>

                    <%}
                        } else {
                            out.println("Por favor ingrese el documento de identidad con el que registró su Inscripción.");

                        }%>
                    </body>
                    </html>
