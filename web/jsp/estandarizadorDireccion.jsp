


    
<html>
     <head>
          <title>.:Asistente de Direcciones - Secretaria Distrital de Hacienda:.</title>
          <meta http-equiv="Content-Type"
                content="text/html; charset=iso-8859-1"></meta>
         
          
          <meta http-equiv="Pragma" content="no-cache"></meta>
          <meta http-equiv="expires" content="-1"></meta>
         
          <!--script type="text/javascript" src="js/SqueezeBox.js"></script-->
          <script src="js/jquery.js" type="text/javascript"></script>
          <script src="js/jquery.maskedinput-1.2.2.js" type="text/javascript"></script>
          <script type="text/javascript" src="js/jquery.alphanumeric.pack.js"></script>
          <script type='text/javascript' src='js/mootools12core.js'></script>
          <script type='text/javascript' src='js/overlay.js'></script>
          <script type="text/javascript" src="js/estandarizador.js"></script>
          <script type="text/javascript">
            jQuery(function($){$("#numeroViaPrincipal").numeric();});
            jQuery(function($){$("#nombreViaPrincipal").alphanumeric({ichars:'abcdefghijklmnopqrstuvwxyz!@#$%^&*()+=[]\;,/{}|\":<>?~`.-¿Ç´¡·\''});    });
            jQuery(function($){$("#valorComplemento").alphanumeric({ichars:'abcdefghijklmnopqrstuvwxyz!@#$%^&*()+=[]\;,/{}|\":<>?~`.-¿Ç´¡·\''});    });
            jQuery(function($){$("#letraViaPrincipal").alpha({allcaps:true});});
            jQuery(function($){$("#letraBis").alpha({allcaps:true});});
            jQuery(function($){ $("#numeroViaGeneradora").numeric();});   
            jQuery(function($){$("#letraViaGeneradora").alpha({allcaps:true});});
            jQuery(function($){$("#numeroPlaca").numeric();});
       
                  </script>
                  
            <script type="text/javascript">
                  var nombreCampoDireccion;
                    var nombreCampoCodigoDepto;
                    var nombreCampoNombreDepto;
                    var nombreCampoCodigoMunicipio;
                    var nombreCampoNombreMunicipio;
          </script>

     </head>
     <body topmargin="0" marginheight="0" onload="cargarMunicipios(0)"><table border="0" cellpadding="0"
                                                 cellspacing="0">

                        <form name="frmDireccionNotificacion">
                     
                              <table id="tabladeclaracion" cellspacing="2"
                                     cellpadding="3" border="1" width="800"
                                    summary="ASISTENTE DE DIRECCIONES">
                                   <tbody>
                                        <tr>
                                             <td rowspan="1" width="264"
                                                 class="tablatitulo">&nbsp;Municipio:</td>
                                             <td rowspan="1" width="1083">
                                                  <select id="municipio"
                                                          name="municipio"
                                                          class="formlista"
                                                          style="formlista"
                                                          onchange="cargarMunicipios(1);">
                                                    </select>
                                             </td>
                                        </tr>
                                        <tr>
                                             <td rowspan="1" width="264"
                                                 class="tablatitulo">&nbsp;&nbsp;Direcci&oacute;n Completa:</td>
                                             <td rowspan="1" width="1083">
                                                  <!--  <input id="direccion"
                                                         name="direccion"
                                                         class="formcampoyarea"
                                                         type="text" size="30"
                                                         disabled="disabled"/> -->
                                                  <textarea name="direccion"
                                                            cols="30" rows="3"
                                                            readonly="readonly"
                                                            class="formcampoyarea"
                                                            id="direccion" 
                                                            title="La Direcci&oacute;n se va formado autom&aacute;ticamente cuando se diligencian los asistentes."
                                                            
                                                            ></textarea>
                                                  <input type="button"
                                                         name="Borrar"
                                                         value="Borrar"
                                                         class="formboton"
                                                         onclick="borrarDireccion();"/>
                                             </td>
                                        </tr>
                                        <tr>
                                             <td rowspan="1" width="264">&nbsp;</td>
                                             <td rowspan="1" width="1083">&nbsp;</td>
                                        </tr>
                                        <tr>
                                             <td colspan="2"
                                                 class="tablatitulo">&nbsp;Asistente
                                                                     Para el
                                                                     ingreso de
                                                                     la
                                                                     Direcci&oacute;n
                                                                     Parte
                                                                     Principal</td>
                                        </tr>
                                        <tr>
                                             <td colspan="2"
                                                 class="menu_titulo"><i>(Diligencie los campos requeridos que identifiquen la direcci&oacute;n actual; los campos que no requiera los puede dejar en blanco. Vaya verificando en el recuadro superior &quot;Direccion Completa&quot; su direcci&oacute;n) </i></td>
                                        </tr>
                                        <tr>
                                             <td colspan="2">
                                                  &nbsp;
                                                  <select size="1"
                                                          name="tipoViaPrimaria"
                                                          onchange="validarCuadranteViaPrincipal();editarDireccionNotificacion2();"
                                                          class="formlista">
                                                       <option value="">
                                                            Escoja una Opci&oacute;n
                                                       </option>
                                                       <option value="AC">
                                                            Avenida calle
                                                       </option>
                                                       <option value="AK">
                                                            Avenida carrera
                                                       </option>
                                                       <option value="CL">
                                                            Calle
                                                       </option>
                                                       <option value="KR">
                                                            Carrera
                                                       </option>
                                                       <option value="DG">
                                                            Diagonal
                                                       </option>
                                                       <option value="TV">
                                                            Transversal
                                                       </option>
                                                  </select>
                                                  <input type="text"
                                                         name="numeroViaPrincipal"
                                                         id="numeroViaPrincipal"
                                                         maxlength="3" size="3"
                                                         onkeyup="editarDireccionNotificacion2();"
                                                         class="formcampoyarea"
                                                         title="Acepta solo n&uacute;meros."/>
                                                  <select size="1"
                                                          name="letraViaPrincipal"
                                                          onchange="editarDireccionNotificacion2();"
                                                          id="letraViaPrincipal"
                                                          class="formlista">
                                                       <option value=""/>
                                                       <option value="A">A</option>
                                                       <option value="B">B</option>
                                                       <option value="C">C</option>
                                                       <option value="D">D</option>
                                                       <option value="E">E</option>
                                                       <option value="F">F</option>
                                                       <option value="G">G</option>
                                                       <option value="H">H</option>
                                                       <option value="I">I</option>
                                                       <option value="J">J</option>
                                                       <option value="K">K</option>
                                                       <option value="L">L</option>
                                                       <option value="M">M</option>
                                                       <option value="N">N</option>
                                                       <option value="O">O</option>
                                                       <option value="P">P</option>
                                                       <option value="Q">Q</option>
                                                       <option value="R">R</option>
                                                       <option value="S">S</option>
                                                       <option value="T">T</option>
                                                       <option value="U">U</option>
                                                       <option value="V">V</option>
                                                       <option value="W">W</option>
                                                       <option value="X">X</option>
                                                       <option value="Y">Y</option>
                                                       <option value="Z">Z</option>
                                                  </select>
                                                  <select size="1" name="bis"
                                                          onchange="editarDireccionNotificacion2();"
                                                          class="formlista">
                                                       <option value=""/>
                                                       <option value="BIS">BIS</option>
                                                  </select>
                                                  <select size="1"
                                                          name="letraBis"
                                                          onchange="editarDireccionNotificacion2();"
                                                          id="letraBis"
                                                          class="formlista">
                                                       <option value=""/>
                                                       <option value="A">A</option>
                                                       <option value="B">B</option>
                                                       <option value="C">C</option>
                                                       <option value="D">D</option>
                                                       <option value="E">E</option>
                                                       <option value="F">F</option>
                                                       <option value="G">G</option>
                                                       <option value="H">H</option>
                                                       <option value="I">I</option>
                                                       <option value="J">J</option>
                                                       <option value="K">K</option>
                                                       <option value="L">L</option>
                                                       <option value="M">M</option>
                                                       <option value="N">N</option>
                                                       <option value="O">O</option>
                                                       <option value="P">P</option>
                                                       <option value="Q">Q</option>  
                                                       <option value="R">R</option>
                                                       <option value="S">S</option>
                                                       <option value="T">T</option>
                                                       <option value="U">U</option>  
                                                       <option value="V">V</option>
                                                       <option value="W">W</option>
                                                       <option value="X">X</option>
                                                       <option value="Y">Y</option>
                                                       <option value="Z">Z</option>  
                                                  </select>
                                                  <select size="1"
                                                          name="cuadranteViaPrincipal"
                                                          onchange="validarCuadranteViaPrincipal();validarCuadranteViaGeneradora();editarDireccionNotificacion2();"
                                                          class="formlista"
                                                          title='"Este", correponde al Occidente'>
                                                       <option value=""/>
                                                       <option value="SUR">SUR</option> 
                                                       <option value="ESTE">ESTE</option>
                                                  </select>
                                                  #
                                                  <input type="text"
                                                         name="numeroViaGeneradora"
                                                         maxlength="3" size="3"
                                                         id="numeroViaGeneradora"
                                                         onkeyup="editarDireccionNotificacion2();"
                                                         class="formcampoyarea"
                                                         title="Acepta solo n&uacute;meros."/>
                                                  <select size="1"
                                                          name="letraViaGeneradora"
                                                          onchange="editarDireccionNotificacion2();"
                                                          id="letraViaGeneradora"
                                                          class="formlista">
                                                       <option value=""/>
                                                       <option value="A">A</option>
                                                       <option value="B">B</option>
                                                       <option value="C">C</option>
                                                       <option value="D">D</option>
                                                       <option value="E">E</option>
                                                       <option value="F">F</option>
                                                       <option value="G">G</option>
                                                       <option value="H">H</option>
                                                       <option value="I">I</option>
                                                       <option value="J">J</option>
                                                       <option value="K">K</option>
                                                       <option value="L">L</option>
                                                       <option value="M">M</option>
                                                       <option value="N">N</option>
                                                       <option value="O">O</option>
                                                       <option value="P">P</option>
                                                       <option value="Q">Q</option>
                                                       <option value="R">R</option>
                                                       <option value="S">S</option>
                                                       <option value="T">T</option>
                                                       <option value="U">U</option>
                                                       <option value="V">V</option>
                                                       <option value="W">W</option>
                                                       <option value="X">X</option>
                                                       <option value="Y">Y</option>
                                                       <option value="Z">Z</option>
                                                  </select>
                                                  -
                                                  <input type="text"
                                                         name="numeroPlaca"
                                                         maxlength="3" size="3"
                                                         id="numeroPlaca"
                                                         onkeyup="editarDireccionNotificacion2();"
                                                         class="formcampoyarea"
                                                         title="Acepta solo n&uacute;meros."/>
                                                  <select size="1"
                                                          name="cuadranteViaGeneradora"
                                                          onchange="validarCuadranteViaGeneradora(); editarDireccionNotificacion2();"
                                                          class="formlista">
                                                       <option value=""/>
                                                       <option value="SUR">SUR</option>
                                                       <option value="ESTE">ESTE</option>
                                                  </select>
                                                  <!--<input type="text" name="complemento"
                           onkeyup="conMayusculas(this);"
                           onblur="contarPalabras();"/>  -->
                                             </td>
                                        </tr>
                                        <tr>
                                             <td colspan="2">&nbsp;</td>
                                        </tr> 
                                        <tr>
                                             <td colspan="2"
                                                 class="tablatitulo">Asistente&nbsp;Para&nbsp;el&nbsp;ingreso&nbsp;de&nbsp;la&nbsp;Direcci&oacute;n&nbsp;Parte&nbsp;Complementaria&nbsp;&nbsp; (Ej. INT 2 AP 505)</td>
                                        </tr>
                                        <tr>
                                             
      <td colspan="2"
                                                class="menu_titulo"> <i>(Seleccione 
        el tipo en la lista desplegable inferior, escriba en el recuadro el detalle 
        y pulse el bot&oacute;n &quot;Adicionar otro complemento&quot;. Repita 
        este proceso hasta tener toda&nbsp;la&nbsp;parte&nbsp;complementaria&nbsp;de 
        la direcci&oacute;n y vaya verificando en el recuadro superior &quot;Direcci&oacute;n 
        Completa&quot; su direcci&oacute;n)</i> . </td>
                                        </tr>
                                        <tr>
                                             <td colspan="2">
                                                  <select size="1"
                                                          name="componenteComplemento"
                                                          id="listaComplemento"
                                                          class="formlista">
                                                       <option value="">Escoja
                                                                        una
                                                                        opci&oacute;n</option>
                                                       <option value="AP">Apartamento</option>
                                                       <option value="AG">Agrupaci&oacute;n</option>
                                                       <option value="BL">Bloque</option>
                                                       <option value="BG">Bodega</option>
                                                       <option value="CN">Camino</option>
                                                       <option value="CT ">Carretera</option>
                                                       <option value="CEL">C&eacute;lula</option>
                                                       <option value="CA">Casa</option>
                                                       <option value="CONJ">Conjunto</option>
                                                       <option value="CS ">Consultorio</option>
                                                       <option value="DP">Dep&oacute;sito</option>
                                                       <option value="ED ">Edificio</option>
                                                       <option value="EN">Entrada</option>
                                                       <option value="ESQ">Esquina</option>
                                                       <option value="ET">Etapa</option>
                                                       <option value="GJ">Garaje</option>
                                                       <option value="IN">Interior</option>
                                                       <option value="KM">Kil&oacute;metro</option>
                                                       <option value="LC">Local</option>
                                                       <option value="LT">Lote</option>
                                                       <option value="MZ">Manzana</option>
                                                       <option value="MN">Mezanine</option>
                                                       <option value="MD">M&oacute;dulo</option>
                                                       <option value="OF">Oficina</option>
                                                       <option value="PS">Paseo</option>
                                                       <option value="PA">Parcela</option>
                                                       <option value="PH">Penthouse</option>
                                                       <option value="PI">Piso</option>
                                                       <option value="PN">Puente</option>
                                                       <option value="PD">Predio</option>
                                                       <option value="SC">Sal&oacute;n
                                                                          comunal</option>
                                                       <option value="SR">Sector</option>
                                                       <option value="SL">Solar</option>
                                                       <option value="SS">Semi
                                                                          s&oacute;tano</option>
                                                       <option value="SM">Super
                                                                          manzana</option>
                                                       <option value="TO">Torre</option>
                                                       <option value="UN">Unidad</option>
                                                       <option value="UR">Unidad
                                                                          residencialc</option>
                                                       <option value="URB">Urbanizaci&oacute;n</option>
                                                       <option value="ZN">Zona</option>
                                                  </select>
                                                  <input  type="text"
                                                         name="valorComplemento"
                                                         size="10"
                                                         id="valorComplemento"
                                                         class="formcampoyarea"
                                                         title="Acepta  n&uacute;meros, espacios y letras may&uacute;sculas."/>
                                                  <input type="button"
                                                         id="btnAgregarComplemento"
                                                         title="Agregar a Complemento"
                                                         value="Adicionar otro complemento"
                                                         onclick="editarComplemento(); borrarComplementoEscogido()"
                                                         class="formboton"/>
                                             </td>
                                        </tr>
                                        <tr>
                                             <td colspan="2" align="center">
                                                  <input type="button"
                                                         class="formboton"
                                                         id="btnAceptar"
                                                         title="Aceptar"
                                                         value="Aceptar"
                                                         onclick="validarDireccionConUAECD();"/>   
                                             </td>
                                        </tr>
                                   </tbody>
                              </table>
                         </form>
</body>
</html>