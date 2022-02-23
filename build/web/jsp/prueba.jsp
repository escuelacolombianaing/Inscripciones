<%-- 
    Document   : prueba
    Created on : 18/11/2016, 11:30:55 AM
    Author     : lucero.rodriguez
--%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="Content-Language" content="ES" />
	<meta name="language" content="spanish" />
	<meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
	<meta name="copyright" content="Copyright (c) 2016" />
	<meta name="description" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
	<meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
	<link rel="stylesheet" href="css/FormularioPosgrado.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<img class="logoescuela" src="img/logo.jpg" alt="logoEscuela">
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-9">
				<div class="superior"></div>
				<nav class="navbar navbar-default">
					<div class="container">
						<ul class="nav navbar-nav">
							<li><a href="#">Inicio</a></li>
							<li><a href="#">Conózcanos</a></li>
							<li><a href="#">Comunidad</a></li>
							<li><a href="#">Programas</a></li>
							<li><a href="#">Admisiones</a></li>
							<li><a href="#">Pagos, Financiación y Becas</a></li>
							<li><a href="#">Empresa</a></li>
							<li><a href="#">Investigación e Innovación</a></li>
							<li><a href="#" class="final">Donaciones</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		
		<div class="container-fluid">
			<img src="img/img-principal.jpg" alt="fotoEscuela" class="img-responsive">
		</div>

		<div class="container-fluid contenidos">
			<div class="row">
				<div class="col-xs-12 col-md-8 col-md-offset-2">
<form action="">
			<h3>Solicitud de Admisión a programas académicos de posgrado<hr></h3>
			<div class="row">
				<div class="col-xs-12 col-md-7">
					<div>
						<p><br>Unicamente aparecerán disponibles los programas de Especialización que a la fecha tengan inscripciones abiertas.<br>
						<small class="azul">Los campos marcados con un asterisco ( * ) son campos obligatorios</small></p>
					</div>
				</div>
				<div class="col-xs-12 col-md-1"></div> 
				<div class="col-xs-12 col-md-4">
					<div class="form-group espaciado">
						<br>
						<label>Programa al cual aspira</label>
						<select name="" id="" class="form-control">
							<option value="">Seleccione</option>
							<option value="">Especialización en diseño, construcción y conservación de vías</option>
							<option value="">Especialización en estructuras</option>
							<option value="">Especialización en ingeniería de fundaciones</option>
							<option value="">Especialización en recursos hidráulicos y medio ambiente</option>
							<option value="">Especialización en saneamiento ambiental</option>
							<option value="">Especialización en gestión integrada QHSE</option>
							<option value="">Especialización en gerencia de producción industrial</option>
							<option value="">Especialización en economía para ingenieros</option>
							<option value="">Especialización en desarrollo y gerencia integral de proyectos</option>
							<option value="">Maestría en ingeniería civil</option>
							<option value="">Maestría en gestión de información</option>
							<option value="">Maestría en ingeniería electrónica</option>
							<option value="">Maestría en desarrollo y gerencia integral de proyectos</option>
							<option value="">Maestría en ingeniería industrial</option>						
						</select>
					</div>
				</div>                			              
			</div>
<!--DATOS ASPIRANTE-->

			<div class="formulario">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		          <div class="panel panel-default">
		            <div class="panel-heading" role="tab" id="headingOne">
		              <h4 class="panel-title">
		                <span class="glyphicon glyphicon-collapse-down"></span> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		                  <strong><span class="rojo">PASO 1:</span></strong> Datos del aspirante
		                </a>
		              </h4>
		            </div>
		            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
		              <div class="panel-body">
		                
		                	<div class="row">
		                		<div class="col-xs-12 col-md-6">
			                		<div class="form-group espaciado">
									<label for="">Primer apellido</label>
									<input type="text" class="form-control" name="" placeholder="primer apellido" id="">
									</div>
								</div>
		                		<div class="col-xs-12 col-md-6">
		                			<div class="form-group">
										<label for="">Segundo apellido</label>
										<input type="text" class="form-control" name="" placeholder="segundo apellido" id="">
									</div>
		                		</div>
		                	</div>	

							<div class="form-group">
								<label for="">Nombre(s) completo</label>
								<input type="text" class="form-control" name="" placeholder="nombre completo" id="">
							</div>
							
							<div class="row">
								<div class="col-xs-12 col-md-4">
		                			<div class="form-group espaciado">
										<label for="">Tipo de documento</label>
										<select name="" id="identificacion" class="form-control">
											<option value="">Seleccione</option>
											<option value="cedula">C.C.</option>
											<option value="tajeta">T.I.</option>
										</select>
									</div>
		                		</div>

		                		<div class="col-xs-12 col-md-4">
			                		<div class="form-group espaciado">
									<label for="">Documento de identidad</label>
									<input type="text" class="form-control" name="" placeholder="documento de identidad" id="">
									</div>
								</div>
		                		<div class="col-xs-12 col-md-4">
		                			<div class="form-group">
										<label for="">*Confirmar documento</label>
										<input type="text" class="form-control" name="" placeholder="confirmar documento" id="">
									</div>
		                		</div>
		                	</div>

							<div class="row">
								<div><strong>Fecha de nacimiento</strong></div>
								<div class="col-xs-2 col-md-2">
		                			<div class="form-group espaciado">
										<label>Día</label>
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
											<option value="21">21</option>
											<option value="22">22</option>
											<option value="23">23</option>
											<option value="24">24</option>
											<option value="25">25</option>
											<option value="26">26</option>
											<option value="27">27</option>
											<option value="28">28</option>
											<option value="29">29</option>
											<option value="30">30</option>
											<option value="31">31</option>
										</select>
									</div>
		                		</div>

		                		<div class="col-xs-2 col-md-2">
			                		<div class="form-group espaciado">
									<label>Mes</label>
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="enero">enero</option>
											<option value="febrero">febrero</option>
											<option value="marzo">marzo</option>
											<option value="abril">abril</option>
											<option value="mayo">mayo</option>
											<option value="junio">junio</option>
											<option value="julio">julio</option>
											<option value="agosto">agosto</option>
											<option value="septiembre">septiembre</option>
											<option value="octubre">octubre</option>
											<option value="noviembre">noviembre</option>
											<option value="diciembre">diciembre</option>
										</select>
									</div>
								</div>

		                		<div class="col-xs-2 col-md-2">
		                			<div class="form-group espaciado">
										<label>Año</label>
										<input type="text" class="form-control" name="" placeholder="año" id="">
									</div>
		                		</div>

		                		<div class="col-xs-3 col-md-3">
		                			<div class="form-group espaciado">
									<label>Ciudad de nacimiento</label>
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="enero">Bogotá</option>
											<option value="febrero">Cali</option>
										</select>
									</div>
		                		</div>

		                		<div class="col-xs-3 col-md-3">
									<div class="form-group espaciado">
									<label>País de nacimiento</label>
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="enero">Colombia</option>
											<option value="febrero">Velezuela</option>
										</select>
									</div>
		                		</div>
		                	</div>


		                	<div class="row">
		                		<div class="col-xs-2 col-md-2">
			                		<div class="form-group espaciado">
									<label>Sexo</label>
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="">Masculino</option>
											<option value="">Femenino</option>
										</select>
									</div>
								</div>

								<div class="col-xs-2 col-md-2">
			                		<div class="form-group espaciado">
									<label>Estado civil</label>
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="">Soltero(A)</option>
											<option value="">Casado</option>
										</select>
									</div>
								</div>

								<div class="col-xs-12 col-md-6">
		                			<div class="form-group espaciado">
										<label for="">Correo electrónico</label>
										<input type="email" class="form-control" name="" placeholder="correo electrónico" id="">
									</div>
		                		</div>

		                		<div class="col-xs-12 col-md-2">
		                			<div class="form-group espaciado">
										<label for="">Celular</label>
										<input type="email" class="form-control" name="" placeholder="celular" id="">
									</div>
		                		</div>
		                	</div>

		                	<div class="row">
		                		<div class="col-xs-12 col-md-6">
		                			<div class="form-group espaciado">
										<label for="">Dirección de residencia</label>
										<input type="text" class="form-control" name="" placeholder="dirección" id="">
									</div>
		                		</div>

		                		<div class="col-xs-12 col-md-2">
		                			<div class="form-group espaciado">
		                				<label>Ciudad</label>
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="enero">Bogotá</option>
											<option value="febrero">Barranquilla</option>
										</select>
									</div>
		                		</div>

		                		<div class="col-xs-12 col-md-2">
			                		<div class="form-group espaciado">
									<label for="">Si es otra cual?</label>
									<input type="text" class="form-control" name="" placeholder="otra ciudad" id="">
									</div>
								</div>
		                		
		                		<div class="col-xs-12 col-md-2">
			                		<div class="form-group espaciado">
									<label for="">Teléfono</label>
									<input type="text" class="form-control" name="" placeholder="teléfono" id="">
									</div>
								</div>		                	
		                	</div> 

		                	<div class="row">
		                		<div class="col-xs-12 col-md-5">
		                			<div class="form-group espaciado">
										<label for="">Dirección de oficina</label>
										<input type="text" class="form-control" name="" placeholder="dirección" id="">
									</div>
		                		</div>

		                		<div class="col-xs-12 col-md-2">
		                			<div class="form-group espaciado">
		                				<label>Ciudad</label>
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="enero">Bogotá</option>
											<option value="febrero">Barranquilla</option>
										</select>
									</div>
		                		</div>

		                		<div class="col-xs-12 col-md-2">
			                		<div class="form-group espaciado">
									<label for="">Teléfono</label>
									<input type="text" class="form-control" name="" placeholder="telefóno" id="">
									</div>
								</div>
		                		
		                		<div class="col-xs-12 col-md-3">
			                		<div class="form-group espaciado">
									<label for="">Correo electrónico</label>
									<input type="text" class="form-control" name="" placeholder="correo electrónico" id="">
									</div>
								</div>		                	
		                	</div>   

		                	<div class="form-group">
		                		<hr>
								<label for="">Persona a quien contactar en caso de emergencia</label>
								<input type="text" class="form-control" name="" placeholder="nombre completo" id="">
							</div>   

							<div class="row">
		                		<div class="col-xs-12 col-md-8">
		                			<div class="form-group espaciado">
										<label for="">Dirección</label>
										<input type="text" class="form-control" name="" placeholder="dirección" id="">
									</div>
		                		</div>

		                		<div class="col-xs-12 col-md-2">
		                			<div class="form-group espaciado">
		                				<label>Ciudad</label>
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="enero">Bogotá</option>
											<option value="febrero">Barranquilla</option>
										</select>
									</div>
		                		</div>

		                		<div class="col-xs-12 col-md-2">
			                		<div class="form-group espaciado">
									<label for="">Teléfono</label>
									<input type="text" class="form-control" name="" placeholder="telefóno" id="">
									</div>
								</div>	                	
		                	</div>            	
		              </div>
		            </div>
		          </div>
		          
<!--DATOS EDUCACION-->
		          <div class="panel panel-default">
		            <div class="panel-heading" role="tab" id="headingTwo">
		              <h4 class="panel-title">
		                <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		                  <strong><span class="rojo">PASO 2:</span></strong> Datos de educación
		                </a>
		              </h4>
		            </div>
		            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">

							<div class="row">
		                		<div class="col-xs-12 col-md-8">			                		
									<div class="form-group espaciado">
										<br>Estudios universitarios de pregrado <small class="azul">(Título profesional)</small> promedio de la carrera
									</div>
								</div>								
		                		<div class="col-xs-2 col-md-1">
		                			<div class="form-group espaciado">
									<label></label>
										<input type="text" class="form-control" name="" placeholder="" id="">
		                			</div>
		                		</div>
		                		<div class="col-xs-5 col-md-3"><br> Dos dígitos <br> sin puntos</div>
		                	</div>

		                	<div class="row">
								<div class="col-xs-12 col-md-7">
									<div class="form-group espaciado">
										<label for="">Universidad </label>
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="">1</option>
											<option value="">2</option>
											<option value="">3</option>
											<option value="">4</option>
											<option value="">5</option>
										</select>
									</div>
								</div>

								<div class="col-xs-12 col-md-5">
			                		<div class="form-group espaciado">
									<label for="">Título obtenido</label>
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="">1</option>
											<option value="">2</option>
											<option value="">3</option>
										</select>
									</div>
								</div>							
							</div>

							<div class="row">
								<div class="col-xs-12 col-md-7">
									<div class="form-group espaciado">
									<label for="">Programa</label>
									<input type="text" class="form-control" name="" placeholder="programa" id="">
									</div>
								</div>
								
								<div class="col-xs-12 col-md-3">
									<div class="row">
										<div class="col-sx-6 col-md-6">
											<label for="">Fecha <small class="miniaturas">inicio</small></label>
											<div class="form-group espaciado">
											<input type="text" class="form-control" name="" placeholder="dd-mm-aaa" id="">
											</div>
										</div>
										<div class="col-sx-6 col-md-6">
											<label for="">Fecha <small class="miniaturas">final</small></label>
											<div class="form-group espaciado">
											<input type="text" class="form-control" name="" placeholder="dd-mm-aaaa" id="">
											</div>
										</div>
									</div>
								</div>

								<div class="col-xs-12 col-md-2">
									<div class="form-group espaciado">
										<label for="">País</label>
										<input type="text" class="form-control" name="" placeholder="país" id="">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-md-12">
									<div class="separador"></div>
									<h5>Otros estudios formales <small class="azul">(Aquellos que conducen a título)</small></h5>
								</div>
							</div>
							
							<div class="row">
								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
									<label for="">Universidad </label>
									<select name="" id="" class="form-control">
									<option value="">Seleccione</option>
									<option value="">1</option>
									<option value="">2</option>
									<option value="">3</option>
									<option value="">4</option>
									<option value="">5</option>
									</select>
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
									<label for="">Programa</label>
									<input type="text" class="form-control" name="" placeholder="programa" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<label for="">Grado obtenido</label>
										<input type="text" class="form-control" name="" placeholder="nombre completo" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="row">
										<div class="col-sx-6 col-md-6">
											<label for="">Fecha <small class="miniaturas">inicio</small></label>
											<div class="form-group espaciado">
											<input type="text" class="form-control" name="" placeholder="dd-mm-aaaa" id="">
											</div>
										</div>
										<div class="col-sx-6 col-md-6">
											<label for="">Fecha <small class="miniaturas">final</small></label>
											<div class="form-group espaciado">
											<input type="text" class="form-control" name="" placeholder="dd-mm-aaaa" id="">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">							
									<select name="" id="" class="form-control">
									<option value="">Seleccione</option>
									<option value="">1</option>
									<option value="">2</option>
									<option value="">3</option>
									<option value="">4</option>
									<option value="">5</option>
									</select>
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">								
									<input type="text" class="form-control" name="" placeholder="programa" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">									
										<input type="text" class="form-control" name="" placeholder="nombre completo" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="row">
										<div class="col-sx-6 col-md-6">										
											<div class="form-group espaciado">
											<input type="text" class="form-control" name="" placeholder="dd-mm-aaaa" id="">
											</div>
										</div>
										<div class="col-sx-6 col-md-6">											
											<div class="form-group">
											<input type="text" class="form-control" name="" placeholder="dd-mm-aaaa" id="">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">								
									<select name="" id="" class="form-control">
									<option value="">Seleccione</option>
									<option value="">1</option>
									<option value="">2</option>
									<option value="">3</option>
									<option value="">4</option>
									<option value="">5</option>
									</select>
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">									
									<input type="text" class="form-control" name="" placeholder="programa" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">										
										<input type="text" class="form-control" name="" placeholder="nombre completo" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="row">
										<div class="col-sx-6 col-md-6">											
											<div class="form-group espaciado">
											<input type="text" class="form-control" name="" placeholder="dd-mm-aaaa" id="">
											</div>
										</div>
										<div class="col-sx-6 col-md-6">											
											<div class="form-group">
											<input type="text" class="form-control" name="" placeholder="dd-mm-aaaa" id="">
											</div>
										</div>
									</div>
								</div>
							</div>					

						</div>
		            </div>
		          </div>

<!--DATOS EXPERIENCIA-->
		          <div class="panel panel-default">
		            <div class="panel-heading" role="tab" id="headingThree">
		              <h4 class="panel-title">
		                <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		                  <strong><span class="rojo">PASO 3:</span></strong> Información experiencia
		                </a>
		              </h4>
		            </div>
		            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
		              <div class="panel-body">

		                	<div class="row">
		                		<div class="col-xs-12 col-md-12">			                		
									<div class="form-group espaciado">
										<br>Haga referencia a la experiencia actual
									</div>
								</div>	
								<div class="col-xs-12 col-md-5">
									<label for="">Entidad</label>
									<div class="form-group espaciado">
									<input type="text" class="form-control" name="" placeholder="entidad" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-4">
									<label for="">Cargo</label>
									<div class="form-group espaciado">									
									<input type="text" class="form-control" name="" placeholder="cargo" id="">
									</div>
								</div>				

								<div class="col-xs-12 col-md-3">
									<div class="row">
										<div class="col-sx-6 col-md-6">	
										<p>Experiencia</p>
										</div>
										<div class="col-sx-6 col-md-6">	
										<div class="form-group espaciado">		
										<label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> Laboral
										</label><br>
										<label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Docente
										</label><br>
										<label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Investigativa
										</label>
									</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-md-5">
									<label for="">Jefe inmediato</label>
									<div class="form-group espaciado">
									<input type="text" class="form-control" name="" placeholder="nombre" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-4">
									<label for="">Teléfono</label>
									<div class="form-group espaciado">									
									<input type="text" class="form-control" name="" placeholder="teléfono" id="">
									</div>
								</div>				

								<div class="col-xs-12 col-md-3">
									<div class="row">
										<div class="col-sx-6 col-md-6">	
										<label for="">Fecha <small class="miniaturas">inicio</small></label>										
											<div class="form-group espaciado">
											<input type="text" class="form-control" name="" placeholder="mm-aaaa" id="">
											</div>
										</div>
										<div class="col-sx-6 col-md-6">	
										<label for="">Fecha <small class="miniaturas">final</small></label>										
											<div class="form-group">
											<input type="text" class="form-control" name="" placeholder="mm-aaaa" id="">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-md-12">							
									<p><strong>¿Ha sido usted objeto de distinciones y premios (académicos, profesionales u otros), y en caso dado, en cuáles?</strong></p>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-md-5">
									<label for="">Distinción</label>
									<div class="form-group espaciado">
									<input type="text" class="form-control" name="" placeholder="distinción" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-5">
									<label for="">Entidad</label>
									<div class="form-group espaciado">
									<input type="text" class="form-control" name="" placeholder="entidad" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-2">
									<label for="">Año</label>
									<div class="form-group espaciado">
									<input type="text" class="form-control" name="" placeholder="año" id="">
									</div>
								</div>
							</div>	

							<div class="row">
								<div class="col-xs-12 col-md-12">							
									<p>Califique su conocimiento de idiomas diferentes al español, de acuerdo con la siguiente convención: MUY BIEN, BIEN, REGULAR</p>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-md-4">
									<div class="form-group espaciado">	
										<label for="">Idioma</label>						
										<select name="" id="" class="form-control">
										<option value="">Seleccione</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">3</option>
										<option value="">4</option>
										<option value="">5</option>
										</select>
									</div>
								</div>

								<div class="col-xs-12 col-md-2">
									<div class="form-group espaciado">	
										<label for="">Comprende leer</label>						
										<select name="" id="" class="form-control">
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										</select>
									</div>
								</div>

								<div class="col-xs-12 col-md-2">
									<div class="form-group espaciado">	
										<label for="">Comprende al oir</label>						
										<select name="" id="" class="form-control">
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										</select>
									</div>
								</div>

								<div class="col-xs-12 col-md-2">
									<div class="form-group espaciado">	
										<label for="">Habla</label>						
										<select name="" id="" class="form-control">
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										</select>
									</div>
								</div>

								<div class="col-xs-12 col-md-2">
									<div class="form-group espaciado">	
										<label for="">Escribe</label>						
										<select name="" id="" class="form-control">
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										<option value="">0-20%</option>
										</select>
									</div>
								</div>
							</div>
		              </div>
		            </div>
		          </div>

<!--INTERES ACADEMICO-->
		        <div class="panel panel-default">
		            <div class="panel-heading" role="tab" id="headingFour">
		              <h4 class="panel-title">
		                <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
		                  <strong><span class="rojo">PASO 4:</span></strong> Interés académico
		                </a>
		              </h4>
		            </div>
		            <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
		              <div class="panel-body">

		              		<div class="row">
								<div class="col-xs-12 col-md-12">							
									<p><strong>*</strong> Indique las razones por las cuales desea seguir este programa de posgrado, o los factores que lo llevaron a pensar que sería de gran utilidad en el desarrollo de su vida profesional y laboral, intereses académicos y profesionales y planes futuros. (máximo 255 caracteres)</p>
								</div>

								<div class="col-xs-12 col-md-12">
									<div class="form-group">
										<textarea class="form-control" rows="7" id="comment"></textarea>
									</div>
								</div>
							</div>		                	
		              </div>
		            </div>
		          </div>

<!--REFERENCIAS-->
		        <div class="panel panel-default">
		            <div class="panel-heading" role="tab" id="headingFive">
		              <h4 class="panel-title">
		                <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
		                  <strong><span class="rojo">PASO 5:</span></strong> Referencias académicas o laborales
		                </a>
		              </h4>
		            </div>
		            <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
		              <div class="panel-body">

		              		<div class="row">
								<div class="col-xs-12 col-md-12">							
									<p><strong>*</strong> Preferiblemente de sus profesores universitarios o jefes inmediatos</p>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<label for="">Nombre</label>
										<input type="text" class="form-control" placeholder="nombre" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<label for="">Entidad</label>
										<input type="text" class="form-control" placeholder="entidad" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<label for="">Cargo</label>
										<input type="text" class="form-control" placeholder="cargo" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<label for="">Teléfono <small class="azul">(número y ext)</small></label>
										<input type="text" class="form-control" placeholder="teléfono y ext" id="">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<input type="text" class="form-control" placeholder="nombre" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<input type="text" class="form-control" placeholder="entidad" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<input type="text" class="form-control" placeholder="cargo" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<input type="text" class="form-control" placeholder="teléfono y ext" id="">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<input type="text" class="form-control" placeholder="nombre" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<input type="text" class="form-control" placeholder="entidad" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">
										<input type="text" class="form-control" placeholder="cargo" id="">
									</div>
								</div>

								<div class="col-xs-12 col-md-3">
									<div class="form-group espaciado">										
										<input type="text" class="form-control" placeholder="teléfono y ext" id="">
									</div>
								</div>
							</div>	                	
		              </div>
		            </div>
		          </div>

<!--OTRA INFORMACION-->
		        <div class="panel panel-default">
		            <div class="panel-heading" role="tab" id="headingSix">
		              <h4 class="panel-title">
		                <span class="glyphicon glyphicon-collapse-down"></span> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
		                  <strong><span class="rojo">PASO 6:</span></strong> Información adicional
		                </a>
		              </h4>
		            </div>
		            <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
		              <div class="panel-body">
		              	<div class="row">		
		                	<div class="col-xs-12 col-md-8">
		                		<div class="form-group espaciado">			      
									<p><strong>*</strong> ¿Cómo se enteró de la existencia de este programa de posgrado?</p>
								</div>
							</div>
		                	<div class="col-xs-12 col-md-3">
		                		<div class="form-group espaciado">
										<select name="" id="" class="form-control">
											<option value="">Seleccione</option>
											<option value="">1</option>
											<option value="">2</option>
											<option value="">3</option>
										</select>
		                		</div>
		                	</div>
		                	<div class="col-xs-12 col-md-1"></div>                			              
		                </div>

		                <div class="row">		              
		                		<div class="col-xs-12 col-md-12">
		                			<div class="espaciado">
		                			<p><strong>*</strong> ¿Cómo piensa financiar sus estudios?</p>
								</div>
		                			
			                		<div class="form-group espaciado">
										<label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> Préstamo
										</label>
										<label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Beca
										</label>
										<label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> Entidad donde trabaja
										</label>
										<label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option3"> Familia
										</label>
										<label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="option3"> Recursos propios
										</label>
										<label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio6" value="option3"> Mixto
										</label>
									</div>
								</div>
		                	</div>
		              </div>
		            </div>
		          </div>
		        </div>

						<div class="row">
							<div class="col-xs-12 col-md-4"></div>
							<div class="col-xs-12 col-md-4">
								<div class="submit">
									<input class="btn btn-primary btn-lg" type="submit" value="Enviar solicitud de Admisión"/>
								</div>
		                	</div>
		                	<div class="col-xs-12 col-md-4"></div>								
		                </div>

			</div>	
</form>					
				</div>
			</div>
		
			<div class="proteccionDatos"><small>Protección de datos: La Escuela Colombiana de Ingeniería Julio Garavito le garantizará a los titulares de la información, la privacidad, confidencialidad y seguridad de los datos entregados, evitando la adulteración, pérdida, consulta, uso o acceso no autorizado o fraudulento por parte de terceros y le informa que los datos recolectados se utilizarán para informarlos sobre nuestra oferta académica, contactarlo para invitarlo a eventos u otras actividades, relacionadas con el objeto social de la Escuela. En caso de que desee ser retirado de nuestras bases de datos debe escribir a protecciondatos@mail.escuelaing.edu.co.</small>
			</div>

		</div>
	</div>


<!--FOOTER-->
	<footer>
		<div class="container">
			<div class="row">
				<article class="redes col-xs-12 col-md-6">
					<p>
						Siganos en:<br/>

						<ul>
					         <li><a href="https://www.facebook.com/Escuelacolingenieria" target="_blank"><img src="img/icono-facebook.svg" class="f"></a></li>
					         <li><a href="https://twitter.com/Escuelaing" target="_blank"><img src="img/icono-twitter.svg" class="t"></a></li>
					         <li><a href="http://instagram.com/escuelaing" target="_blank"><img src="img/icono-instagram.svg" class="i"></a></li>
					         <li><a href="https://www.youtube.com/user/escuelacolingenieria" target="_blank"><img src="img/icono-youtube.svg" class="y"></a></li>
					         <li><a href="https://www.linkedin.com/edu/school?id=11508" target="_blank"><img src="img/icono-linkedin.svg" class="l"></a></li>
					         <li><a href="http://www.pinterest.com/escuelacoling" target="_blank"><img src="img/icono-pinterest.svg" class="p"></a></li>
				        </ul>
						
						ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO<br/>
						AK.45 No.205-59 (Autopista Norte)<br/>
						Contact Center: +57(1) 668 3600<br/>
						Línea Nacional Gratuita: 018000112668<br/>
						www.escuelaing.edu.co<br/><br/>
						Bogotá, D.C. - Colombia<br/>						
					</p>
				</article>
				<article class="iframe-video col-xs-12 col-md-6">
					<p>
						<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1987.9617427360993!2d-74.04338482936627!3d4.783148717834411!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f85e374627fe5%3A0x540783a0b074c84d!2sEscuela+Colombiana+de+Ingenier%C3%ADa!5e0!3m2!1ses!2ses!4v1424190444206" width="100%" height="auto" frameborder="0" style="border:0"></iframe>
					</p>
					<small>Todos los derechos reservados © 2016 - Escuela Colombiana de Ingenieria Julio Garavito. <br>Personería Jurídica 086 de enero 19 de 1973. Institución sujeta a inspección y vigilancia por el Ministerio de Educación Nacional.</small>
				</article>
			</div>
		</div>
	</footer>











	<script src="js/jquery.js"></script>
  	<script src="http://code.jquery.com/jquery-latest.jS"></script>
	<script src="js/bootstrap.min.js"></script>


</body>
</html>