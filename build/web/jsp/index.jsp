<%-- 
    Document   : index
    Created on : 12/08/2010, 11:52:25 AM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
     <%String msg="";
String secHash ="";
String originalHash="";
String seccode = request.getParameter ("seccode");
System.out.println("Valor caja texto : "+seccode);
if(!(seccode == null || seccode.equals("null"))){
  originalHash=(String)session.getAttribute("captcha");
  System.out.println("Valor de captcha sesion : "+originalHash);
  secHash = seccode;

 if(originalHash.equals(secHash)){
 // msg="<span style="color: green;">Correcto</span> ";
 }else{
 // msg="<span style="color: red;">Error</span> ";
 }
}%>

    </body>
</html>
