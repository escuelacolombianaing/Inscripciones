<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="BDatos.BDadmisiones"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
            configeci.configPosgrados confEci = new configeci.configPosgrados();
            BDadmisiones admision = new BDadmisiones();
            Vector posgasp = new Vector();
            Vector asp = new Vector();
            %>
<!doctype html>
<script language="JavaScript" type="text/JavaScript">

    function cargar()
    {
        if(!(document.form1.programa[0].selected))
        {
            document.form1.action='ReferenciasPos';
            document.form1.submit();
        }
    }

 function validar()
    {
        if(document.form1.programa.value == '0')
        {
            alert("Por favor seleccione el programa del apirante");
            document.form1.programa.style.backgroundColor= '#FFD9B3';
            document.form1.programa.focus();
            return false;
        }

        if(document.form1.nombre.value == '0')
        {
            alert("Por favor seleccione el nombre del apirante");
            document.form1.nombre.style.backgroundColor= '#FFD9B3';
            document.form1.nombre.focus();
            return false;
        }

        if (document.form1.nombre1.value == ""){
                    alert("Por favor ingrese nombre de quien referencia");
                    document.form1.nombre1.style.backgroundColor= '#FFD9B3';
                    document.form1.nombre1.focus();
                    return false;
        }
        if (document.form1.titulo.value == ""){
                    alert("Por favor ingrese título de quien referencia");
                    document.form1.titulo.style.backgroundColor= '#FFD9B3';
                    document.form1.titulo.focus();
                    return false;
        }
        if (document.form1.cargo.value == ""){
                    alert("Por favor ingrese el cargo de quien referencia");
                    document.form1.cargo.style.backgroundColor= '#FFD9B3';
                    document.form1.cargo.focus();
                    return false;
        }

        if (document.form1.empresa.value == ""){
                    alert("Por favor ingrese la empresa de quien referencia");
                    document.form1.empresa.style.backgroundColor= '#FFD9B3';
                    document.form1.empresa.focus();
                    return false;
        }

        if (document.form1.email.value == ""){
                    alert("Por favor ingrese el correo de quien referencia");
                    document.form1.email.style.backgroundColor= '#FFD9B3';
                    document.form1.email.focus();
                    return false;
        }
        if (document.form1.direccion.value == ""){
                    alert("Por favor ingrese la dirección de quien referencia");
                    document.form1.direccion.style.backgroundColor= '#FFD9B3';
                    document.form1.direccion.focus();
                    return false;
        }

        if (document.form1.telefono.value == ""){
                    alert("Por favor ingrese el número de teléfono de quien referencia");
                    document.form1.telefono.style.backgroundColor= '#FFD9B3';
                    document.form1.telefono.focus();
                    return false;
        }
        if (document.form1.celular.value == ""){
                    alert("Por favor ingrese el número de celular de quien referencia");
                    document.form1.celular.style.backgroundColor= '#FFD9B3';
                    document.form1.celular.focus();
                    return false;
        }
        if (document.form1.anos.value == ""){
                    alert("Por favor ingrese la información de conoce al solicitante desde hace?");
                    document.form1.anos.style.backgroundColor= '#FFD9B3';
                    document.form1.anos.focus();
                    return false;
        }
        if ( !document.form1.lista[0].checked && !document.form1.lista[1].checked &&
         !document.form1.lista[2].checked && !document.form1.lista[3].checked
          && !document.form1.lista[4].checked ) {
                    alert("Por favor seleccione la información de: El solicitante fue?");
                    document.form1.lista[0].style.backgroundColor= '#FFD9B3';
                    document.form1.lista[0].focus();
                    return false;
        }else{
            if (document.form1.lista[4].checked){
               if (document.form1.otro.value == ""){
                    alert("Por favor ingrese la información del campo cual?");
                    document.form1.otro.style.backgroundColor= '#FFD9B3';
                    document.form1.otro.focus();
                    return false;
                 }
            }
        }
        if ( !document.form1.hint[0].checked && !document.form1.hint[1].checked &&
         !document.form1.hint[2].checked && !document.form1.hint[3].checked
          && !document.form1.hint[4].checked ) {
                    alert("Por favor seleccione la habilidad intelectual que considera que el solicitante tiene");
                    document.form1.hint[0].style.backgroundColor= '#FFD9B3';
                    document.form1.hint[0].focus();
                    return false;
        }
        if ( !document.form1.hesc[0].checked && !document.form1.hesc[1].checked &&
         !document.form1.hesc[2].checked && !document.form1.hesc[3].checked
          && !document.form1.hesc[4].checked ) {
                    alert("Por favor seleccione la habilidad para escribir que considera que el solicitante tiene");
                    document.form1.hesc[0].style.backgroundColor= '#FFD9B3';
                    document.form1.hesc[0].focus();
                    return false;
        }
        if ( !document.form1.hhabla[0].checked && !document.form1.hhabla[1].checked &&
         !document.form1.hhabla[2].checked && !document.form1.hhabla[3].checked
          && !document.form1.hhabla[4].checked ) {
                    alert("Por favor seleccione la habilidad para hablar que considera que el solicitante tiene");
                    document.form1.hhabla[0].style.backgroundColor= '#FFD9B3';
                    document.form1.hhabla[0].focus();
                    return false;
        }
        if ( !document.form1.pacad[0].checked && !document.form1.pacad[1].checked &&
         !document.form1.pacad[2].checked && !document.form1.pacad[3].checked
          && !document.form1.pacad[4].checked ) {
                    alert("Por favor seleccione la preparación académica que considera que el solicitante tiene");
                    document.form1.pacad[0].style.backgroundColor= '#FFD9B3';
                    document.form1.pacad[0].focus();
                    return false;
        }
        if ( !document.form1.motiv[0].checked && !document.form1.motiv[1].checked &&
         !document.form1.motiv[2].checked && !document.form1.motiv[3].checked
          && !document.form1.motiv[4].checked ) {
                    alert("Por favor seleccione la motivación que considera que el solicitante tiene");
                    document.form1.motiv[0].style.backgroundColor= '#FFD9B3';
                    document.form1.motiv[0].focus();
                    return false;
        }
        if ( !document.form1.mad[0].checked && !document.form1.mad[1].checked &&
         !document.form1.mad[2].checked && !document.form1.mad[3].checked
          && !document.form1.mad[4].checked ) {
                    alert("Por favor seleccione la madurez que considera que el solicitante tiene");
                    document.form1.mad[0].style.backgroundColor= '#FFD9B3';
                    document.form1.mad[0].focus();
                    return false;
        }
        if ( !document.form1.respo[0].checked && !document.form1.respo[1].checked &&
         !document.form1.respo[2].checked && !document.form1.respo[3].checked
          && !document.form1.respo[4].checked ) {
                    alert("Por favor seleccione la responsabilidad que considera que el solicitante tiene");
                    document.form1.respo[0].style.backgroundColor= '#FFD9B3';
                    document.form1.respo[0].focus();
                    return false;
        }
        if ( !document.form1.htrab[0].checked && !document.form1.htrab[1].checked &&
         !document.form1.htrab[2].checked && !document.form1.htrab[3].checked
          && !document.form1.htrab[4].checked ) {
                    alert("Por favor seleccione la habilidad para trabajo en equipo que considera que el solicitante tiene");
                    document.form1.htrab[0].style.backgroundColor= '#FFD9B3';
                    document.form1.htrab[0].focus();
                    return false;
        }
        if ( !document.form1.consi[0].checked && !document.form1.consi[1].checked &&
         !document.form1.consi[2].checked && !document.form1.consi[3].checked) {
                    alert("Por favor seleccione en resumen considera que este candidato es? ");
                    document.form1.consi[0].style.backgroundColor= '#FFD9B3';
                    document.form1.consi[0].focus();
                    return false;
        }
    }
</script>
<%
String prog;
int idprog = 0;

prog = request.getParameter("programa");

if (prog != null )  {
     if (!(prog.length() == 0))
           idprog = Integer.parseInt(prog);
           // Se buscan los estudiantes inscritos para el programa seleccionado.
           posgasp =  admision.InscritoProg(prog, confEci.getPeriodo());
     }

%>
<html>
<head>
<meta charset="iso-8859-1">
<title>FORMULARIO POSGRADO</title>

<!--<link href="estilo-fomularios.css" rel="stylesheet" type="text/css" media="all">-->

<link href="css/estilo-fomularios.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="container">
	<header>
    	<img src="img/banner_pos.jpg" width="100%" height="240"/>
    </header>
    <section>
       <h1>Carta de Referencia</h1>
	<form name="form1" method="post" action="GenRecomend">
          <div id="formulario">
        	<h2>1. Datos del solicitante</h2><br/>		     
		<select name="programa" size="1"  onChange="cargar();">
                <%if (idprog == 0) {%>
              	<option value="0">Programa al que ingresa el solicitante</option>
                <%}else if (idprog == 7){%>
                 <option value="7">ESTRUCTURAS</option>
                <%}else if (idprog == 262){%>
                 <option value="262">INGENIERIA DE FUNDACIONES</option>
                <%}else if (idprog == 108){%>
                 <option value="108">RECURSOS HIDRÁULICOS Y MEDIO AMBIENTE</option>
                <%}else if (idprog == 109){%>
                <option value="109">SANEAMIENTO AMBIENTAL</option>
                <%}else if (idprog == 210){%>
                <option value="210">DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS</option>
                <%}else if (idprog == 220){%>
                <option value="220">DISEÑO, CONSTRUCCIÓN Y CONSERVACIÓN DE VIAS</option>
                <%}else if (idprog == 254){%>
                <option value="254">ECONOMIA PARA INGENIEROS</option>
                <%}else if (idprog == 282){%>
                <option value="282">GESTIÓN INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE</option>
                <%}else if (idprog == 279){%>
                <option value="279">GERENCIA DE OPERACIONES</option>
                <%}else if (idprog == 266){%>
                <option value="266">MAESTRÍA EN INGENIERÍA CIVIL</option>
                <%}else if (idprog == 269){%>
                <option value="269">MAESTRIA EN GESTIÓN DE INFORMACIÓN</option>
                <%}else if (idprog == 274){%>
                <option value="274">MAESTRÍA EN INGENIERIA INDUSTRIAL</option>
                <%}else if (idprog == 271){%>
                <option value="271">MAESTRÍA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS</option>
                <%}else if (idprog == 272){%>
                <option value="272">MAESTRÍA EN INGENIERÍA ELECTRÓNICA</option>
                <%}else if (idprog == 276){%>
                <option value="276">MAESTRÍA EN INGENIERÍA ELÉCTRICA</option>
                <%}else if (idprog == 277){%>
                <option value="277">DOCTORADO EN INGENIERÍA</option>
                <%}else if (idprog == 278){%>
                <option value="278">MAESTRÍA EN INGENIERÍA BIOMÉDICA</option>
                <%}else if (idprog == 280){%>
                <option value="280">MAESTRÍA EN CIENCIAS ACTUARIALES</option>
                <%}else if (idprog == 283){%>
                <option value="283">MAESTRÍA EN CIENCIA DE DATOS</option>
                <%}else if (idprog == 281){%>
                <option value="281">MAESTRÍA EN INFORMÁTICA</option>
                <%}%>
                <option value="7">ESTRUCTURAS</option>
                <option value="262">INGENIERIA DE FUNDACIONES</option>
                <option value="108">RECURSOS HIDRÁULICOS Y MEDIO AMBIENTE</option>
                <option value="109">SANEAMIENTO AMBIENTAL</option>
                <option value="210">DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS</option>
                <option value="220">DISEÑO, CONSTRUCCIÓN Y CONSERVACIÓN DE VIAS</option>
                <option value="254">ECONOMIA PARA INGENIEROS</option>
                <option value="282">GESTIÓN INTEGRADA DE LA SEGURIDAD Y SALUD EN EL TRABAJO, CALIDAD Y MEDIO AMBIENTE</option>
                <option value="279">GERENCIA DE OPERACIONES</option>
                <option value="266">MAESTRÍA EN INGENIERÍA CIVIL</option>
                <option value="269">MAESTRIA EN GESTIÓN DE INFORMACIÓN</option>
                <option value="274">MAESTRÍA EN INGENIERIA INDUSTRIAL</option>
                <option value="271">MAESTRÍA EN DESARROLLO Y GERENCIA INTEGRAL DE PROYECTOS</option>
                <option value="272">MAESTRÍA EN INGENIERÍA ELECTRÓNICA</option>
                <option value="276">MAESTRÍA EN INGENIERÍA ELÉCTRICA</option>
                <option value="277">DOCTORADO EN INGENIERÍA</option>
                <option value="278">MAESTRÍA EN INGENIERÍA BIOMÉDICA</option>
                <option value="280">MAESTRÍA EN CIENCIAS ACTUARIALES</option>
                <option value="283">MAESTRÍA EN CIENCIA DE DATOS</option>
                <option value="281">MAESTRÍA EN INFORMÁTICA</option>
              </select>
                <br>
              <select name="nombre" id="select" class="campotext">
              <option value="0" Selected>Seleccione Aspirante</option>
                            <%if (posgasp.size()>0) {
                              for ( int i = 0 ; i < posgasp.size() ; i++ ){
                                asp = (Vector)posgasp.elementAt(i) ;%>
                            <option value="<%=asp.elementAt(0)%>"><%=asp.elementAt(1)%></option>
                            <%}%>                            
                            
                            <%}%>
                          </select>
                 <!--<input name="nombre" type="text" placeholder= "Nombres y Apellidos"/>-->
              
          </div> 
          
          <div id="formulario">
        	<h2>2. Datos de quien referencia</h2><br/>
	     <input name="nombre1" type="text" MAXLENGTH="90" placeholder="Nombres y Apellidos"/>
              <input name="titulo" type="text" MAXLENGTH="80" placeholder="Título"/>
              <input name="cargo" type="text" MAXLENGTH="80" placeholder="Cargo"/>
              <input name="empresa" type="text" MAXLENGTH="80" placeholder="Empresa"/>
              <input name="email" type="email" MAXLENGTH="40" placeholder="Correo electrónico"/>
              <input name="direccion" type="text" MAXLENGTH="80" placeholder="Dirección"/>
              <input name="telefono" type="text" MAXLENGTH="20" placeholder="Teléfono"/>
              <input name="celular" type="text" MAXLENGTH="20" placeholder="Celular"/>
          </div>
          
          <div id="formulario">
        	<h2>3. Referencia</h2><br/>
		      <span style="color:#666;">Conoce al solicitante desde hace:</span> <input name="anos" type="text" placeholder="Años"/><br/>
              <span style="color:#666;">El solicitante fue:</span></br>
              <table>
              	<tr>
              
              		</tr>
                    <tr>
                    
                    </tr>
                    <tr>
              
              		</tr>
              
               		</tr>
              </table>
              <table>
                <tr>
                  <td><label><input type="radio" name="lista" value="Estudiante de pregrado" id="lista_1"/> Estudiante de pregrado</label></td>
                                   <td></td>
                  <td><label><input type="radio" name="lista" value="Estudiante de posgrado" id="lista_4"/> Estudiante de posgrado</label></td>
                  
                </tr>
                <tr>
                  <td><label><input type="radio" name="lista" value="Asistente" id="lista_2"/> Asistente</label></td>
                  <td></td>
                  <td><label><input type="radio" name="lista" value="Aconsejado" id="lista_5"/> Aconsejado</label></td>
                  <td></td>
                </tr>
                <tr>
                    <td colspan="2"><label><input type="radio" name="lista" value="Otro" id="lista_3" /> Otro</label> <input type="text" maxlength="39" name="otro" id="lista_6" placeholder= "Cuál"/></td>
                  
                </tr>
              </table>
          </div> 
          
          
          <div id="formulario">
        	<h2>4. Considera que el solicitante tienen una</h2><br/>
		      <table class="considera">
                  <tr>
                    <td></td>
                    <td align="center" width="10">Excelente</td>		
                    <td align="center" width="10">Buena</td>
                    <td align="center" width="10">Promedio</td>		
                    <td align="center" width="10">Bajo el promedio</td>
                    <td align="center" width="10">No sabe</td>		
                  </tr>
                  <tr>
                    <td>Habilidad intelectual</td>
                    <td align="center"><input type="radio" name="hint" value="Excelente" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hint" value="Buena" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hint" value="Promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hint" value="Bajo el promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hint" value="No sabe" id="lista_1" /></td>
                  </tr>
                  <tr>
                    <td>Habilidad para escribir</td>
                    <td align="center"><input type="radio" name="hesc" value="Excelente" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hesc" value="Buena" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hesc" value="Promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hesc" value="Bajo el promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hesc" value="No sabe" id="lista_1" /></td>
                  </tr>
                  <tr>
                    <td>Habilidad para hablar</td>
                    <td align="center"><input type="radio" name="hhabla" value="Excelente" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hhabla" value="Buena" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hhabla" value="Promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hhabla" value="Bajo el promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="hhabla" value="No sabe" id="lista_1" /></td>
                  </tr>
                  <tr>
                    <td>Preparación académica</td>
                    <td align="center"><input type="radio" name="pacad" value="Excelente" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="pacad" value="Buena" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="pacad" value="Promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="pacad" value="Bajo el promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="pacad" value="No sabe" id="lista_1" /></td>
                  </tr>
                  <tr>
                    <td>Motivación</td>
                    <td align="center"><input type="radio" name="motiv" value="Excelente" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="motiv" value="Buena" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="motiv" value="Promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="motiv" value="Bajo el promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="motiv" value="No sabe" id="lista_1" /></td>
                  </tr>
                  <tr>
                    <td>Madurez</td>
                    <td align="center"><input type="radio" name="mad" value="Excelente" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="mad" value="Buena" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="mad" value="Promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="mad" value="Bajo el promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="mad" value="No sabe" id="lista_1" /></td>
                  </tr>
                  <tr>
                    <td>Responsabilidad</td>
                    <td align="center"><input type="radio" name="respo" value="Excelente" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="respo" value="Buena" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="respo" value="Promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="respo" value="Bajo el promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="respo" value="No sabe" id="lista_1" /></td>
                  </tr>
                  <tr>
                    <td>Habilidad para trabajo en equipo</td>
                    <td align="center"><input type="radio" name="htrab" value="Excelente" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="htrab" value="Buena" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="htrab" value="Promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="htrab" value="Bajo el promedio" id="lista_1" /></td>
                    <td align="center"><input type="radio" name="htrab" value="No sabe" id="lista_1" /></td>
                  </tr>
              </table>
          </div>
          
          <div id="formulario">
        	<h2>4. En resumen considera que este candidato es</h2><br/>
		      <table class="resumen">
                  <tr>
                    <td>Excelente</td>
                    <td align="center"><input type="radio" name="consi" value="Excelente" id="lista_1" /></td>
                  </tr>
                  <tr>
                    <td>Bueno</td>
                    <td align="center"><input type="radio" name="consi" value="Bueno" id="lista_1" /></td>
                  </tr>
                  <tr>
                    <td>Promedio</td>
                    <td align="center"><input type="radio" name="consi" value="Promedio" id="lista_1" /></td>
                  </tr>
                  <tr>
                    <td>Bajo promedio</td>
                    <td align="center"><input type="radio" name="consi" value="Bajo promedio" id="lista_1" /></td>
                  </tr>
              </table>
          </div>
          
          <div id="formulario">
        	<span style="color:#666;">Utilice este espacio para hacer algún comentario adicional sobre el solicitante. </span><br/><br/>
		      <textarea name="textarea" id="textarea" cols="89" rows="10" MAXLENGTH="500"></textarea>
          </div>

       <div id ="submit">
         <input type="submit" name="Submit3" class="boton" value="Enviar Solicitud" onClick="javascript: return validar();">
       </div>
         		 
         </form>
       
    </section>
        <footer>
    	<span class="programa">
            Escuela Colombiana de Ingeniería Julio Garavito
            <br/>Formulario Posgrados
        </span>
    	<span class="direccion">
            AK.45 No.205-59 (Autopista Norte)<br/>
            PBX: +57(1) 668 3600<br/>
            Call Center: +57(1) 668 3600<br/>
            Línea Nacional Gratuita: 018000112668<br/>
            www.escuelaing.edu.co<br/>
            Bogotá, D.C. - Colombia<br/>
        </span>
    </footer>
</div>
</body>
</html>
