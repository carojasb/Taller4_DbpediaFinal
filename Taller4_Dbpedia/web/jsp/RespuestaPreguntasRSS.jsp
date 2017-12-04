<%-- 
    Document   : RespuestaPreguntas
    Created on : 3/12/2017, 10:19:29 AM
    Author     : Kmilo
--%>

<%@ page contentType="text/html"
         pageEncoding="ISO-8859-1"
         import="rss.RSS_Reader" 
         import="java.util.*"
         import="java.net.UnknownHostException"
         import="java.net.*"
         import="java.io.*"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Respuestas a la pregunta</title>
        <link href="../Resources/css/screen.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <BR><BR><BR>
        <%String url_pregunta = new String(request.getParameter("Pregunta_Elegida").getBytes("ISO-8859-1"),"UTF-8"); %>
        <h1 style="color: black" align="center"><b>Respuestas a la pregunta seleccionada</b></h1><BR><BR>
        
        <table BORDER WIDTH="90%" align="center" border=5 border-color = "black" id="myTable" class="myTable"
                               CELLPADDING=5 CELLSPACING=5
                                style="margin: 0 auto; font-size: 12pt; font-family: Comic Sans MS; background-color: lightsteelblue">
                <tr>
                    <th><b>ID</b></th>
                    <th><b>RESPUESTA</b></th>
                </tr>
        <%
            List<String> Respuestas_Completas = new ArrayList<String>();
            
            Respuestas_Completas = RSS_Reader.readRSSFeedRespuesta(url_pregunta);
            
            int c = Respuestas_Completas.size();
            
            for (int i = 0 ; i < c ; i++){
                
                String respuesta = Respuestas_Completas.get(i);
                
                %>
                <tr>
                    <td align="center"><b>Respuesta <%= i+1 %></b></td>
                    <td><%= respuesta %> </td>                            
                </tr>
                <%
            }
        %>
        </table>
        
        <br><br>
        
        <p class="linkVolver" align="center">                
            <a href="../index.jsp" style="font-size: 15pt; font-family: Comic Sans MS; color: white; align-items: center"> Inicio </a>
            <br>
            <a href="principal.jsp" style="font-size: 15pt; font-family: Comic Sans MS; color: white; align-items: center"> Volver </a>
        </p>
    </body>
</html>
