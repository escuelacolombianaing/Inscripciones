<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
 <script language="JavaScript">
function comprueba_extension(formulario, archivo) {
   extensiones_permitidas = new Array(".gif", ".jpg", ".doc", ".pdf");
   mierror = "";
   if (!archivo) {
      //Si no tengo archivo, es que no se ha seleccionado un archivo en el formulario
       mierror = "No has seleccionado ningún archivo";
   }else{
      //recupero la extensión de este nombre de archivo
      extension = (archivo.substring(archivo.lastIndexOf("."))).toLowerCase();
      //alert (extension);
      //compruebo si la extensión está entre las permitidas
      permitida = false;
      for (var i = 0; i < extensiones_permitidas.length; i++) {
         if (extensiones_permitidas[i] == extension) {
         permitida = true;
         break;
         }
      }
      if (!permitida) {
         mierror = "Comprueba la extensión de los archivos a subir. \nSólo se pueden subir archivos con extensiones: " + extensiones_permitidas.join();
       }else{
          //submito!
         alert ("Todo correcto. Voy a submitir el formulario.");
         formulario.submit("C:/Sun/doc_pregrado/20102/civil" );
         return 1;
       }
   }
   //si estoy aqui es que no se ha podido submitir
   alert (mierror);
   return 0;
} 
</script>

<body bgcolor="#FFFFFF" text="#000000">
<form method=post action="FileUpload?on=n&spath=correo&fpath=C:/Sun/doc_pregrado/20102/civil" enctype="multipart/form-data">
<input type=file name="archivoupload">
<input type=button name="Submit" value="Enviar" onclick="comprueba_extension(this.form, this.form.archivoupload.value)">
</form>
</body>
</html>
