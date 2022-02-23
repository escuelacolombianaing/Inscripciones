<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import ="java.text.DecimalFormat"%>
<%@page contentType="text/html"%>
<%@page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*"%>
<%String titulo = "Consulta Entrevistas Readmisiones";%>
<%String idplan = request.getParameter("idplan");
String arreglo[]=new String[50];
String texto[] = new String[20] ;
String prog;
configeci.configuracion confEci = new configeci.configuracion();
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
String tipprog = request.getParameter("tipprog");
Date currentTime_1 = new Date();
String dateString = formatter.format(currentTime_1);
ParsePosition pos = new ParsePosition(0);
Date currentTime_2 = formatter.parse(dateString, pos);
Date hoy = formatter.parse(dateString);
int l, b = 0, a = 0, s = 0, ban=0, k ;
arreglo = confEci.getTodo();
for (int j=1; j<confEci.getTamanio(); j++){
    StringTokenizer st = new StringTokenizer(arreglo[j], "$");
    k=0;
    while (st.hasMoreTokens()) {
        texto[k]=st.nextToken();
        k=k+1;
    }
    prog = texto[1];
    String val  = texto[0];
    Date fechafin = formatter.parse(texto[2]);
    if(prog.equals(tipprog)){
        if ((val.equals("1")) && (hoy.before(fechafin)))
            ban = 1;
    }
}%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entrevistas Readmitidos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <jsp:include page="encabezado">        
            <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        
        <!% if (ban == 1){%>
        <table border="0" width="550" align="center">
            <tr> 
                <td height="77" colspan="3">  
                    <form name="form1" method="post" action="ConsultaEntrevistasRead">
                        <input name="idplan" type="hidden" id="idplan" value="<!%=idplan%>">
                        <table align=center 
                               border=0 bordercolor=white cellpadding=0 cellspacing=2 
                               width=306 height=109  class="textocom">
                            <tr> 
                                
            <td align=left height="53" width="50%"> 
              <div align="left"><strong>Documento de Identidad </strong></div>
            </td>
                                <td align=left height="53" width="50%"> 
                                    
                                        <input name=documento type=password maxlength=12 style="HEIGHT: 22px; WIDTH: 110px" size="12">
                                 
                                </td>
                            </tr>
                            <tr> 
                                <td align=left height="39" width="50%"> 
                                    
              <div align="left"><b>Seleccione el Programa al cual se inscribi&oacute;</b></div>
                                              </td>
                                <td align=left height="39" width="50%">
                                    <select name="iddpto" size="1" id="prog"  class="campotext">
                                        <option value="null" selected>Seleccione</option>
                                        <option value="13">Ingeniería Civil</option>
                                         <option value="14">Ingeniería Eléctrica</option>
                                        <option value="15">Ingeniería de Sistemas</option>
                                        <option value="16">Ingeniería Industrial</option>
                                        <option value="17">Ingeniería Electrónica</option>
                                         <option value="18">Economía</option>
                                          <option value="19">Administración de Empresas</option>
                                        <option value="20">Matemáticas</option>
                                        <option value="260">Ingeniería Mecánica</option>
                                                                         </select>
                                </td>
                            </tr>
                            <tr> 
                                <td align=left height="39" width="50%"> 
                                    <div align="center"> 
                                        <input id=submit1 name=Aceptar style="HEIGHT: 27px; LEFT: 200px; TOP: 99px; WIDTH: 110px" type=submit value=Aceptar title=Aceptar tabindex="Yes" class="boton ">
                                    </div>
                                </td>
                                <td align=left height="39" width="50%"> 
                                    <div align="center"> 
                                        <input id=submit1 name=Limpiar style="HEIGHT: 27px; LEFT: 200px; TOP: 99px; WIDTH: 110px" type=reset value=Limpiar title=Limpiar class="boton ">
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                   
                </td> 
            </tr>
            
        </table>
        
    </body>
</html>
