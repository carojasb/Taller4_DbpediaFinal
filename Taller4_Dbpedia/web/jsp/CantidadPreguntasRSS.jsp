<%-- 
    Document   : ConsultaRSS
    Created on : 2/12/2017, 05:52:28 PM
    Author     : Kmilo
--%>
<%@ page contentType="text/html"
         pageEncoding="ISO-8859-1"
         import="rss.RSS_Reader" 
         import="java.util.*"
         import="java.net.UnknownHostException"
         import="java.net.*"
         import="java.io.*"%> 

<jsp:useBean id="RSS_Reader" class="rss.RSS_Reader" scope="page"/> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Preguntas</title>
        <link href="../Resources/css/screen.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <BR><BR><BR>
        <%String cantidad = new String(request.getParameter("preguntas").getBytes("ISO-8859-1"),"UTF-8"); %>
        <h1 style="color: black" align="center"><b>Listado de <%= cantidad %> preguntas consultadas aleatoriamente</b></h1><BR><BR>
        
        <%
            List<String> Titulos_Completos = new ArrayList<String>();
            
            Titulos_Completos = RSS_Reader.readRSSFeed("https://musicfans.stackexchange.com/feeds");
            
            int c = Titulos_Completos.size();
            int cnt = 0;
            String opcion = "";
            
            
            for (int i = 0 ; i < Integer.parseInt(cantidad) ; i++){
                
                int numero = (int) (Math.random() * Titulos_Completos.size());
                
                String titulo = Titulos_Completos.get(numero);
                String id = Titulos_Completos.get(numero).substring(Titulos_Completos.get(numero).length() - 4, Titulos_Completos.get(numero).length());

                %>
                <p class="Preguntas" align="center">
                    <label style="color: black; font-size:18px"><%= titulo.substring(0, Titulos_Completos.get(numero).length() - 5) %></label>                    
                </p>
                <%
                
                if (cnt < Integer.parseInt(cantidad)){                    
                    opcion = opcion + "<option value=\"https://musicfans.stackexchange.com/feeds/question/"+id+"\">"+titulo.substring(0, Titulos_Completos.get(numero).length() - 5)+"</option>";                    
                }
                
                cnt++;
            }    
            
        %>
        
        <div class="opciones_preguntas" align="center">
            <form name="Form_consultPreguntas" action="RespuestaPreguntasRSS.jsp">
                <label style="color: black; font-size:18px">Consultar las respuestas de la pregunta </label>
                <select name="Pregunta_Elegida" id="Pregunta_Elegida">
                    <%=opcion%>
                </select>                
                <BR><BR>                
                <p class="BtnRespuestaPregunta">
                    <input type="submit" value="Buscar"/>
                </p>
            </form>
        </div>
        
        <br><br>
        <p class="linkVolver" align="center">                
            <a href="../index.jsp" style="font-size: 15pt; font-family: Comic Sans MS; color: white; align-items: center"> Inicio </a>
            <br>
            <a href="principal.jsp" style="font-size: 15pt; font-family: Comic Sans MS; color: white; align-items: center"> Volver </a>
        </p>
    </body>
</html>
