<%@page import="nuevos.ICFES"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read Text</title>
    </head>
    <body>
        <%
            String jspPath = "C:\\Users\\Desarrollo\\Desktop\\";
            String fileName = "Tmp.txt";
            String txtFilePath = jspPath + fileName;
            BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
            //BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
            StringBuilder sb = new StringBuilder();
            String line;
            
              

            while((line = reader.readLine())!= null){
                sb.append(line+"\n");
            }
            //out.println(sb.toString());
            
            ICFES bd = new ICFES();
            String Resp = bd.consultamasiva(sb.toString());
            String [] FilasEvaluad = Resp.split("<br>");
            
            for(int l = 0; l < FilasEvaluad.length; l++){
            
            String mat="", fis="", len="", ciencsoc="", filos="", quim="", biol="", ac="",nmb="",doc="";
            String [] cadenas = FilasEvaluad[l].split(";");
            
            for(int kl = 0; kl < cadenas.length; kl++){
            
               String [] temp = cadenas[kl].split("-");
               if(temp[0].equals("74") ) {mat       = temp[1];}
               if(temp[0].equals("44") ) {fis       = temp[1];}
               if(temp[0].equals("71") ) {len       = temp[1];}
               if(temp[0].equals("9")  ) {ciencsoc  = temp[1];}
               if(temp[0].equals("43") ) {filos     = temp[1];}
               if(temp[0].equals("100")) {quim      = temp[1];}
               if(temp[0].equals("7")  ) {biol      = temp[1];}
               if(temp[0].equals("8")  ) {fis       = temp[1]; biol = temp[1]; quim = temp[1];}
               if(temp[0].equals("69") ) {len       = temp[1]; filos = temp[1];}
               if(temp[0].equals("103")) {ciencsoc  = temp[1];}
               if(temp[0].equals("AC"))  {ac   = temp[1];}
               if(temp[0].equals("NB"))  {nmb  = temp[1];}
               if(temp[0].equals("DC"))  {doc  = temp[1];}
               
            }
        %>
        
        <%=ac%>;<%=nmb%>;<%=doc%>;<%=mat%>;<%=filos%>;<%=fis%>;<%=len%>;<%=quim%>;<%=biol%>;<%=ciencsoc%>;1<br>
        
        
        <%
            
            }
            
            //response.setContentType("application/xml");
            //response.setHeader("Content-Disposition", "attachment; filename=\"Resultados" + ".txt\"");
        %>

    </body>
</html>