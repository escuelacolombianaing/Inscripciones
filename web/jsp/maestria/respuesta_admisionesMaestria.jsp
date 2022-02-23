
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*" %>
<%@ page import="BDatos.BDadmisiones" %>
<%@ page import="BDatos.BaseDatos" %>
<%      
        //Se asigna el documento del estudiante a validar
        String docEst = request.getParameter("documento");
        String idplan = request.getParameter("idplan");
        Vector cronograma = new Vector();
        PrintWriter oout = response.getWriter();
        configeci.configmaestria confEci = new configeci.configmaestria();
        String respadm = "", induccion = "", fecinicio = "", valorniv = "", ordenesp = "", firmaesp = "";
        String programa = "", titulo = "", fecordenes = "", fecpagos = "", fecniv = "", firmaniv = "", valortotal = "", creditos = "", valcredito = "";
        otros.rutas ruta = new otros.rutas();
        BDadmisiones bd = new BDadmisiones();
        
        String periodo=confEci.getPeriodo();
        
        //Instanciamos el objeto Calendar
        //en fecha obtenemos la fecha y hora del sistema
        Calendar fecha = new GregorianCalendar();
        //Obtenemos el valor del a�o, mes, d�a,
        //hora, minuto y segundo del sistema
        //usando el m�todo get y el par�metro correspondiente
        int a�o = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        int hora = fecha.get(Calendar.HOUR_OF_DAY);
        int minuto = fecha.get(Calendar.MINUTE);
        int segundo = fecha.get(Calendar.SECOND);
        
        String fechaAct= dia + "/" + (mes+1) + "/" + a�o;
        
        
        
        String titulos = "Aspirantes a la Maestr�a";
        int val = 0;
        int ban = 0;

    if (docEst != null && !docEst.equals(""))
    {   //Apertura If Principal (1)
%>
        <%@page contentType="text/html" pageEncoding="windows-1252"%>
        <!DOCTYPE html>
        <html>
            <head>               
                <title>Consulta Admisiones</title>
                <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <link href="css/comun.css" rel="stylesheet" type="text/css" >
                <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
            </head>
            <body bgcolor="#FFFFFF" text="#000000">                
                    <%if(idplan.equals("353")) 
                      {
                           programa = "MAESTRIA EN GESTI�N DE INFORMACI�N-MODALIDAD DE PROFUNDIZACI�N";%>
                            <jsp:include page="encabezado">
                                <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
                                <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTR�A EN GESTI�N DE INFORMACI�N" />
                            </jsp:include>
                    <%}
                      else if(idplan.equals("354"))
                      {
                            programa = "MAESTRIA EN GESTI�N DE INFORMACI�N-MODALIDAD DE INVESTIGACION";%>
                            <jsp:include page="encabezado">
                                <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
                                <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTR�A EN GESTI�N DE INFORMACI�N" />
                            </jsp:include>
                    <%}else if(idplan.equals("321"))
                      {
                            programa = "MAESTR�A EN INGENIER�A ELECTR�NICA";%>
                            <jsp:include page="encabezado">
                                <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
                                <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTR�A EN INGENIER�A ELECTR�NICA-MODALIDAD DE PROFUNDIZACI�N" />
                            </jsp:include>
                    <%}
                      else if(idplan.equals("332")|| idplan.equals("333"))
                           {
                                programa = "MAESTR�A EN INGENIER�A ELECTR�NICA";%>
                                <jsp:include page="encabezado">
                                    <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
                                    <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTR�A EN INGENIER�A ELECTR�NICA-MODALIDAD DE INVESTIGACI�N" />
                                </jsp:include>
                        <% }
                           else if(idplan.equals("351"))
                                {
                                    programa = "MAESTR�A EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS";%>
                                    <jsp:include page="encabezado">
                                        <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
                                        <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTR�A  EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS" />
                                    </jsp:include>
                            <%  }
                                else if(idplan.equals("330") || idplan.equals("331"))
                                     {
                                        programa = "MAESTR�A EN INGENIER�A INDUSTRIAL";%>
                                        <jsp:include page="encabezado">
                                            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
                                            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTR�A  EN INGENIERIA INDUSTRIAL" />
                                        </jsp:include>
                                  <% }
                                        else if(idplan.equals("371"))
                                     {
                                        programa = "MAESTR�A EN INFORM�TICA";%>
                                        <jsp:include page="encabezado">
                                            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
                                            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTR�A EN INFORM�TICA" />
                                        </jsp:include>
                                  <% }
                                        else if(idplan.equals("372"))
                                     {
                                        programa = "MAESTR�A EN CIENCIAS ACTUARIALES";%>
                                        <jsp:include page="encabezado">
                                            <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
                                            <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTR�A EN CIENCIAS ACTUARIALES" />
                                        </jsp:include>
                                  <% } else if(idplan.equals("376") || idplan.equals("377"))
                                          {
                                            programa = "MAESTR�A EN CIENCIA DE DATOS";%>
                                            <jsp:include page="encabezado">
                                                <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
                                                <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTR�A  EN CIENCIA DE DATOS" />
                                            </jsp:include>
                                       <% }
                                    else if(idplan.equals("291") || idplan.equals("290") || idplan.equals("292") || idplan.equals("293") || idplan.equals("294"))
                                          {
                                            programa = "MAESTR�A EN INGENIER�A CIVIL";%>
                                            <jsp:include page="encabezado">
                                                <jsp:param name="parametro" value="<!%=confEci.getPeriodo()%>" />
                                                <jsp:param name="titulo" value="CONSULTA ADMITIDOS A LA MAESTR�A EN INGENIER�A CIVIL" />
                                            </jsp:include>
                                       <% } 
                   // ------------------------------------------------------------------------------------------------------------------------------------ 
                   // ------------------------------------------------------------------------------------------------------------------------------------
                   Vector estud = bd.AdmitidosPos(docEst, idplan, confEci.getPeriodo(), oout);

                   if(idplan.equals("331"))
                   {
                      cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), "330");
                   }
                   else if(idplan.equals("332") || idplan.equals("333") )
                        {
                            cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), "332");
                        }
                        else
                        {
                            cronograma = bd.Cronogramas(oout, confEci.getPeriodo(), idplan);
                        } 
                   // ------------------------------------------------------------------------------------------------------------------------------------
                   // ------------------------------------------------------------------------------------------------------------------------------------                        
                  
                        //TRUE: EL ESTUDIANTE NO ESTA EN LA TABLA ADMITIDOS
                        if((estud.size()) == 0)
                        { // IF - Si el estudiante consultado NO se encontro como admitido (*1) %>
                            <div align="center">
                            <table align="center" width="60%" border="0" cellspacing="0" cellpadding="0" height="20" class="textoimpremas">
                                <tr>
                                    <td valign="top">
                                        <div align="center">

                                            <p>&nbsp;</p>

                                            <p>Su documento es incorrecto o usted no formaliz&oacute; la solicitud
                                                de admisi�n para este programa acad�mico. <br>
                                                Verifique e intente nuevamente o comun�quese con la Oficina de Admisiones.
                                                <br>
                                                Tel�fono. 668 3600, opci�n 2 en el men�. 
                                             </div>
                                    </td>
                                </tr>
                            </table>
                            </div>
                     <% } else{ // ELSE - Si el estudiante consultado se encontro!!! (*1)
                            Vector tutor = bd.Tutores(docEst, oout);
                            
                            Vector estudios = bd.Titulo((String) estud.elementAt(0));
                            if ((estudios.size()) > 0)
                            {
                                for(int m = 0; m < estudios.size(); m++)
                                {
                                    Vector estudiosant = (Vector) estudios.elementAt(m);
                                    titulo = (String) estudiosant.elementAt(1);
                                    if(titulo.equals("OTRA"))
                                    {
                                        titulo = "ASPIRANTE";
                                    }
                                }
                            }
                            // ------------------------------------------------------------------------------------------------------
                            // ------------------------------------------------------------------------------------------------------ 
                            
                        if(estud.elementAt(3).equals("-179") && (tutor.size() == 0)) 
                        { %>
                            <p><center>No tiene consejero asignado, comun�quese con la Direcci�n de la Maestr�a.</center></p>
                    <%  } 
                        else if(estud.elementAt(3).equals("-179") || estud.elementAt(3).equals("-91") || estud.elementAt(3).equals("-102") && ban == 0)
                             { %>
                                <br>
                                <form name="formulario" method="post" action="">
                                    <input type="hidden" name="idplan" value="<%=idplan%>">
                                    <input type="hidden" name="docEst" value="<%=docEst%>">
                                    
                                    <div align="center">
                                        <table width="60%" border="0" cellspacing="0" cellpadding="0" class="textoimpre" >                                      
                                          <tr> 
                                            <td> 
                                              <p align="justify">
                                                <br>
                                                 Bogot�, D.C., <%=fechaAct%><br><br>


                                                 <b><%=titulo%></b><br>
                                                 <b><%=estud.elementAt(1)%></b> <br><br>


                                                 En nombre de la Escuela Colombiana de Ingenier�a Julio Garavito, me es grato informarle que su solicitud de admisi�n, para el programa de 
                                                 posgrado <b><%=programa%></b>, ha sido aprobada para el periodo acad�mico <b><%=periodo%></b>. 
                                                 <br>

                                                 Para continuar con su proceso de matr�cula es necesario que se ponga en contacto con su Consejero Acad�mico, quien le orientar� en la 
                                                 elecci�n de las asignaturas con las que iniciar� el desarrollo de su plan de estudios. Sus datos de contacto son:<br><br>
                                                 
                                                 
                                                 Nombre: <b>Ing. <%=tutor.elementAt(1)%></b><br>
                                                 Correo electr�nico: <b><%=tutor.elementAt(3)%></b>
                                                 <br><br>

                                                 El inicio de clases est� programado para el <b><%=cronograma.elementAt(20)%></b>, y previo a ello, la Escuela ofrece una jornada de inducci�n para sus 
                                                 estudiantes de nuevo ingreso como usted, que se llevar� a cabo el <b><%=cronograma.elementAt(16)%></b> y en la cual esperamos contar con su activa participaci�n.<br><br>

                                                 Sea nuevamente bienvenido a la Escuela y al programa de posgrado <b><%=programa%></b>. Espero que su permanencia con nosotros sea 
                                                 enriquecedora y contribuya a su realizaci�n profesional y personal y a la construcci�n del Pa�s que desde la Escuela so�amos.<br><br>


                                              <p>Cordialmente,</p><br>


                                              <b>GERM�N RICARDO SANTOS GRANADOS</b><br>
                                              <b>Director de Posgrados</b><br>
                                              
                                            </td>
                                          </tr>
                                        </table>
                                    </div>
                                </form>
                                    
                        <%   } // CIERRE IF - Si el estudiante consultado se encontro!!! (*1)
                             else if(estud.elementAt(3).equals("-185") || estud.elementAt(3).equals("-190"))
                                  {%>                               
                                         <form name="formulario" method="post" action="">
                                         <input type="hidden" name="idplan" value="<%=idplan%>">
                                         <input type="hidden" name="docEst" value="<%=docEst%>">

                                             <div align="center">
                                                 <table width="60%" border="0" cellspacing="0" cellpadding="0" class="textoimpre" >                                      
                                                   <tr> 
                                                     <td> 
                                                         <p align="justify">
                                                             <br>
                                                             <br>
                                                             <br>
                                                             Su solicitud de admisi�n esta en <%=estud.elementAt(3).equals("-185")?"estudio":"proceso"%>. Para mayor informaci�n por 
                                                             favor comun�quese con la Direcci�n de Posgrados.<br>
                                                             Tel�fono. 668 3600, exts. 560
                                                             <br>
                                                             <br>
                                                             <br>
                                                         </p>
                                                     </td>
                                                   </tr>
                                                 </table>
                                             </div>
                                         </form>     
                              <%  }  
                                  else if(estud.elementAt(3).equals("-111"))
                                       { %>
                                         <form name="formulario" method="post" action="">
                                         <input type="hidden" name="idplan" value="<%=idplan%>">
                                         <input type="hidden" name="docEst" value="<%=docEst%>">

                                             <div align="center">
                                                 <table width="60%" border="0" cellspacing="0" cellpadding="0" class="textoimpre" >                                      
                                                   <tr> 
                                                     <td> 
                                                         <p align="justify">
                                                             <br>
                                                             <br>
                                                             <br>
                                                             <br>
                                                             Despu�s de realizado el proceso de selecci�n, le informamos que inicialmente 
                                                             por restricci�n de cupos no fue seleccionado para iniciar actividades 
                                                             acad�micas en el <%=cronograma.elementAt(20)%>. <br><br>
                                                             Para mayor informaci�n por favor comun�quese con la Direcci�n de Posgrados.<br>
                                                             Tel�fono. 668 3600, exts. 560<br>                                                                                                                   
                                                         </p>
                                                     </td>
                                                   </tr>
                                                 </table>
                                             </div>
                                         </form>
                                    <% } 
                                       else
                                       {  //RESPUESTA : NO ADMITIDO  %>
                                               <form name="formulario" method="post" action="">
                                               <input type="hidden" name="idplan" value="<%=idplan%>">
                                               <input type="hidden" name="docEst" value="<%=docEst%>">

                                                   <div align="center">
                                                       <table width="60%" border="0" cellspacing="0" cellpadding="0" class="textoimpre" >                                      
                                                         <tr> 
                                                           <td> 
                                                               <p align="justify">
                                                                   <br><br>
                                                                   <br><br>

                                                                   Bogot�, D.C., <%=fechaAct%><br><br>


                                                                    <b><%=titulo%></b><br>
                                                                    <b><%=estud.elementAt(1)%></b> <br><br>


                                                                   En nombre de la Escuela Colombiana de Ingenier�a Julio Garavito, le informo que su solicitud de admisi�n para el programa de 
                                                                   posgrado <b><%=programa%></b>, no ha sido aprobada. <br><br>

                                                                   Lo invitamos a que su deseo de crecimiento personal y profesional no se vea afectado por esta decisi�n, sino que sea un motivo 
                                                                   de reflexi�n y an�lisis sobre sus objetivos y sus fortalezas, de manera que pueda proyectarse y considerar otras opciones que 
                                                                   le garanticen el �xito que usted y nosotros deseamos.<br><br>

                                                               <p>Cordialmente,</p><br>


                                                                <b>GERM�N RICARDO SANTOS GRANADOS</b><br>
                                                                <b>Director de Posgrados</b><br>                                                   
                                                           </td>
                                                         </tr>
                                                       </table>
                                                   </div>
                                               </form>     
                                   <%   }  %>                                     
                   
            </body>
        </html>
<%} 
    }
//Cierre If Principal (1) %>