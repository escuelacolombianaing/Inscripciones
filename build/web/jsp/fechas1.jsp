<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form name="form1" method="get" action="">
            <select name="annio" id="annio">
                <option value="2007">2007</option>
                <option value="2008">2008</option>
                <option value="2009">2009</option>
                <option value="2010">2010</option>
            </select>
            <select name="mes" id="mes">
                <option value="0">Enero</option>
                <option value="1">Febrero</option>
                <option value="2">Marzo</option>
                <option value="3">Abril</option>
                <option value="4">Mayo</option>
                <option value="5">Junio</option>
                <option value="6">Julio</option>
                <option value="7">Agosto</option>
                <option value="8">Septiembre</option>
                <option value="9">Octubre</option>
                <option value="10">Noviembre</option>
                <option value="11">Diciembre</option>
            </select>      
            <input type="submit" name="Submit" value="Enviar">
        </form>
        <%
        int mesf;
        int anniof;
        String mes = request.getParameter("mes");
        String annio = request.getParameter("annio");
        String [] Meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        String[] Dias = {"Domingo","Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"};
        
        if(mes != null && annio != null){
            mesf = Integer.parseInt(mes);
            anniof = Integer.parseInt(annio);
            Calendar cumpleCal = Calendar.getInstance();
            int dia=0;
            int dias = numDiasMes(mesf + 1, anniof);
            out.println("<table border=1>");
                for(int i=0;i<dias;i++){
                
                cumpleCal.set(anniof, mesf, i); //La hora no me interesa y recuerda que los meses van de 0 a 11
                dia = cumpleCal.get(Calendar.DAY_OF_WEEK);
                out.println(dia + "<br>"); //DÃ­a 4 = WEDNESDAY = MIÃ‰RCOLES
               
                
            
            out.println("DIAS: " + dias);
                        
                        int j=1;
                        for ( i=0; i<7; i++)
                         out.println("<th>" + Dias[i] );
                        out.println("</th>") ;
                        out.println("</tr>") ;
                        out.println("<tr>") ;
                        
                        for (i=0; i < dia;i++)
                            out.println("<td>0");
                        out.println("</td>");
                        for (i=dia;i<dias;j++,i++)
                            out.println( "<td>" + j + "</td>");
                        
                       /* while (j<=dias) {
                            out.println("</tr>");
                            out.println("<tr>");
                            for (i=0; i<7 & j<=dias; j++,i++)
                                out.println("<td>" + j );
                            out.println("</td>");
                           
                        }*/
            out.println("</tr>");
                            out.println("</table>");
            
        }
            }
        %>
        
        <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
        <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    
    </body>
</html>
<%!
public static int numDiasMes(int mes, int anio) {
    int dias = 31;
    switch (mes) {
        case 2: if (bisiesto(anio)) dias=29; else dias=28;break;
        case 4:
        case 6:
        case 9:
        case 11: dias= 30; break;
}
return dias;
}

public static boolean bisiesto(int anio) {
return ((anio%4==0 && anio%100!=0) || (anio%400==0));
}

%>


</tr>
</table>


</body>
</html>