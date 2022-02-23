
<%@ page import="javax.naming.*, 
javax.rmi.PortableRemoteObject, 
java.text.*,
java.util.*"%>

<%
HttpSession sesion;
response.setHeader("Cache-Control","no-cache");
String nomarch = new String();
String spath = "correo";

%> 


<html>
    <head>
        <meta target="principal" http-equiv="Refresh" content="0;">
    </head>
</html>

<html> 
    <head>
        <title>Subir Archivos</title> 
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"> 
        <!-- Validaciones -->  
        <script language="JavaScript">  
<!--  

//-->  
        </script>  
    </head> 
    <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
    <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondo.gif" onLoad="preloadImg()">
        <p class="textocom">&nbsp;</p>
        
        SUBIR ARCHIVOS
        
        <table width="640" border="0" align="center" cellspacing="0">
            <tr class="textocom">
                <td height="22"> 
                    <div align="center"> 
                        
                        <table width="550" border="0" align="center" cellspacing="0" class="textocom"> 
                            
                            <tr>  
                                <td width="120" valign="top"><div align="right"><strong>Subir
                                Archivos:</strong></div></td>
                                <form enctype="multipart/form-data" method="post" action="FileUpload?spath=<%=spath%>&fpath=/usr/local/SUN/mecanica">
                                    
                                    <td>  
                                    
                                    <td>  
                                        <table width="100%" border="1" cellspacing="0">
                                            <tr>
                                                <td><p align="left">  
                                                    <input type="file" size="30" maxlength="300" name="file1" class="campotext"> </p>
                                                    <p>
                                                        <input type="submit" name="uploadservlet" value="Subir Archivo"  class="boton">
                                                </p></td>
                                            </tr>
                                        </table>
                                    </td> 
                                </form> 
                            </tr>
                        </table> 
                        
                    </div>
                </td>
            </tr>
            <tr class="textocom">
                <td height="22">
                    <div align="right">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="<!%=anterior%>" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
    </body> 
</html> 

