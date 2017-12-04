<%-- 
    Document   : ConsultarEntidadRSS
    Created on : 2/12/2017, 06:12:41 PM
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
        <title>JSP Page</title>
        <link href="../Resources/css/screen.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <BR><BR><BR>
        <%String entidad = new String(request.getParameter("Entidad_Elegida").getBytes("ISO-8859-1"),"UTF-8"); %>
        <h1 style="color: black" align="center"><b>Información encontrada de <%= entidad.replace("_"," ") %></b></h1><BR><BR>
        
        <table BORDER WIDTH="70%" align="center" border=5 border-color = "black" id="myTable" class="myTable"
                               CELLPADDING=5 CELLSPACING=5
                                style="margin: 0 auto; font-size: 12pt; font-family: Comic Sans MS; background-color: lightsteelblue">
            <tr>
                <th><b>PROPIEDAD</b></th>
                <th><b>VALOR</b></th>
            </tr>
            <tr>
                <tr>
                <td align="center">Introducción</td>
                <td align="center">
                <%
                    List<String> introduccion = new ArrayList<String>();            
                    introduccion = RSS_Reader.readRSSFeedLead("http://dbpedia.org/page/" + entidad);
                    
                    int c0 = introduccion.size();
                    String valores0 = "";
                    
                    for (int i = 0 ; i < c0 ; i++){
                        
                        String valor = introduccion.get(i);
                        valores0 = valores0 + valor + "\n";
                    }
                    %>
                    
                        <%= valores0 %>
                    
                    <%
                %>
                </td>
            </tr>
                
                <td align="center">Fecha Inicio Actividad</td>
                <td align="center">
                <%
                    List<String> inicio_actividad = new ArrayList<String>();            
                    inicio_actividad = RSS_Reader.readRSSFeedEntidad("http://dbpedia.org/page/" + entidad,"dbo:activeYearsStartYear");
                    
                    int c1 = inicio_actividad.size();
                    String valores1 = "";
                    
                    for (int i = 0 ; i < c1 ; i++){
                        
                        String valor = inicio_actividad.get(i);
                        valores1 = valores1 + valor + "\n";
                    }
                    %>
                    
                        <%= valores1 %>
                    
                    <%
                %>
                </td>
            </tr>
            
            <tr>
                <td align="center">Fecha Nacimiento</td>
                <td align="center">
                <%
                    List<String> fecha_nacimiento = new ArrayList<String>();            
                    fecha_nacimiento = RSS_Reader.readRSSFeedEntidad("http://dbpedia.org/page/" + entidad,"dbo:birthDate");
                    
                    int c2 = fecha_nacimiento.size();
                    String valores2 = "";
                    
                    for (int i = 0 ; i < c2 ; i++){
                        
                        String valor = fecha_nacimiento.get(i);
                        valores2 = valores2 + valor + "\n";
                    }
                    %>
                    
                        <%= valores2 %>
                    
                    <%
                %>
                </td>
            </tr>
            
            <tr>
                <td align="center">Lugar Nacimiento</td>
                <td align="center">
                <%
                    List<String> lugar_nacimiento = new ArrayList<String>();            
                    lugar_nacimiento = RSS_Reader.readRSSFeedEntidad("http://dbpedia.org/page/" + entidad,"dbo:birthPlace");
                    
                    int c3 = lugar_nacimiento.size();
                    String valores3 = "";
                    
                    for (int i = 0 ; i < c3 ; i++){
                        
                        String valor = lugar_nacimiento.get(i);
                        valores3 = valores3 + valor + "\n";
                    }
                    %>
                    
                        <%= valores3 %>
                    
                    <%
                %>
                </td>
            </tr>
            
            <tr>
                <td align="center">Bandas Asociadas</td>
                <td align="center">
                <%
                    List<String> bandas_asociadas = new ArrayList<String>();            
                    bandas_asociadas = RSS_Reader.readRSSFeedEntidad("http://dbpedia.org/page/" + entidad,"dbo:associatedBand");
                    
                    int c4 = bandas_asociadas.size();
                    String valores4 = "";
                    
                    for (int i = 0 ; i < c4 ; i++){
                        
                        String valor = bandas_asociadas.get(i);
                        valores4 = valores4 + valor + "\n";
                    }
                    %>
                    
                        <%= valores4 %>
                    
                    <%
                %>
                </td>
            </tr>
            
            <tr>
                <td align="center">Genero Musical</td>
                <td align="center">
                <%
                    List<String> genero_musical = new ArrayList<String>();            
                    genero_musical = RSS_Reader.readRSSFeedEntidad("http://dbpedia.org/page/" + entidad,"dbo:genre");
                    
                    int c5 = genero_musical.size();
                    String valores5 = "";
                    
                    for (int i = 0 ; i < c5 ; i++){
                        
                        String valor = genero_musical.get(i);
                        valores5 = valores5 + valor + "\n";
                    }
                    %>
                    
                        <%= valores5 %>
                    
                    <%
                %>
                </td>
            </tr>
            
            <tr>
                <td align="center">Instrumentos Musicales</td>
                <td align="center">
                <%
                    List<String> instrumento_musical = new ArrayList<String>();            
                    instrumento_musical = RSS_Reader.readRSSFeedEntidad("http://dbpedia.org/page/" + entidad,"dbo:instrument");
                    
                    int c6 = instrumento_musical.size();
                    String valores6 = "";
                    
                    for (int i = 0 ; i < c6 ; i++){
                        
                        String valor = instrumento_musical.get(i);
                        valores6 = valores6 + valor + "\n";
                    }
                    %>
                    
                        <%= valores6 %>
                    
                    <%
                %>
                </td>
            </tr>
            
        </table>
                
        <br><br>
        
        <p class="linkVolver" align="center">                
            <a href="../index.jsp" style="font-size: 15pt; font-family: Comic Sans MS; color: white; align-items: center"> Inicio </a>
            <br>
            <a href="principal.jsp" style="font-size: 15pt; font-family: Comic Sans MS; color: white; align-items: center"> Volver </a>
        </p>
    </body>
</html>
