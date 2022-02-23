<%
	configeci.configuracion confEci = new configeci.configuracion();
%>
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff">
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=confEci.getPeriodo()%>" />
        <jsp:param name="titulo" value="CITACION POSTULANTES BECAS 2008-2" />
</jsp:include>
      <table width="440" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
		  <form name="form1" method="post" action="RespBeca">
	  
        <table align="center" border="0" cellpadding="0" cellspacing="2" width="292" height="98" class="textocom">
          <tr> 
            <td align=left height="53" width="45%"> 
              <div align="right"><strong><em><font face="Arial" size="2">Documento 
                de Identidad </font></em></strong></div>
            </td>
            <td align=left width="9%">&nbsp;</td>
            <td align=left height="53" width="46%"> 
              <div align="left">
                <input name="documento" type="password" maxlength="12" size="12" class="campotext">
              </div></td>
          </tr>
          <tr> 
            <td align=left height="39" width="45%"> 
              <div align="right">
                <input id="submit1" name="Aceptar"  type="submit" value="Aceptar" title="Aceptar" class="boton" tabindex="Yes">
              </div></td>
            <td width="9%" height="39" align=left>&nbsp;</td>
            <td width="46%" height="39" align=left> 
              <div align="left">
                <input id="submit1" name="Limpiar" type="reset" value="Limpiar" title="Limpiar" class="boton">
              </div></td>
          </tr>
        </table>
      </form>
		  </td>
        </tr>
</table>
<jsp:include page="piepag">
        <jsp:param name="parametro" value="" />
</jsp:include>
</body>
</html>