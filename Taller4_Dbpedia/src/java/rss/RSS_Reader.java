/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rss;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Kmilo
 */
public class RSS_Reader {
    
    
    public static List<String> readRSSFeed(String url) throws IOException{
            //Objetos
            URL rssUrl = new URL (url);
            BufferedReader in = new BufferedReader(new InputStreamReader(rssUrl.openStream()));
            List<String> rss_file_read = new ArrayList<String>();            
            String line;
            String id = "";
            String titulo = "";
            long lNumeroLineas = 0;     
            
            while( (line = in.readLine()) != null){
                
                System.out.println("line = " + line);
                
                int titulo_inicial = line.indexOf("<title type=\"text\">");                
                int titulo_final = line.indexOf("</title>");
                
                int id_inicial = line.indexOf("<id>");                
                int id_final = line.indexOf("</id>");
                
                if((titulo_inicial != -1 && titulo_final != -1) || (id_inicial != -1 && id_final != -1)){
                   
                    if (id_inicial != -1 && id_final != -1){
                        System.out.println("legth = " + line.length());
                        id = line.trim().substring(line.length()-17, line.length()-13);
                        
                    }else if (titulo_inicial != -1 && titulo_final != -1){
                        titulo = line.trim().replace("<title type=\"text\">", "").replace("</title>", "");
                        rss_file_read.add(titulo + "-" + id);
                    }
                    
                }
                
                lNumeroLineas++;
                
            }
            System.out.println("cantidad = " + lNumeroLineas);
            in.close();
            
            return rss_file_read;            
    }
    
    
    
    public static List<String> readRSSFeedRespuesta(String url) throws IOException{
            //Objetos
            URL rssUrl = new URL (url);
            BufferedReader in = new BufferedReader(new InputStreamReader(rssUrl.openStream()));
            List<String> rss_file_read = new ArrayList<String>();            
            String line;
            String respuesta_final = "";
                        
            while( (line = in.readLine()) != null){
                
                int summary_inicial = line.indexOf("<summary type=\"html\">");                    
                int summary_final = line.indexOf("</summary>");
                
                if (summary_inicial != -1){
                    respuesta_final = "";
                    respuesta_final = line + "\n";
                }
                
                if (summary_inicial == -1 && summary_final == -1 && line.length()>0){
                    respuesta_final = respuesta_final + line + "\n";
                }
                
                if (summary_final != -1){
                    rss_file_read.add(respuesta_final.trim().replace("<summary type=\"html\">", "").replace("</summary>", "").
                            replace("&lt;p&gt;", "").replace("&lt;/p&gt;", "").replace("&lt;blockquote&gt;", "").replace("&lt;/blockquote&gt;", "").
                            replace("&lt;a href=&quot;", "").replace("&quot;&gt;", "").replace(";/a&gt;", "").replace("&quot;", "").replace("&amp;amp;", "").
                            replace("&lt;strong&gt;", "").replace("&lt;/strong&gt;", "").replace("rel=", "").replace("&lt", ""));
                    System.out.println("Respuesta_final = " + respuesta_final);
                    respuesta_final = "";
                }
                
            }
            
            in.close();
            
            return rss_file_read;            
    }
    
    
    
    
    public static List<String> readRSSFeedLead(String url) throws IOException{
            //Objetos
            URL rssUrl = new URL (url);
            BufferedReader in = new BufferedReader(new InputStreamReader(rssUrl.openStream()));
            List<String> rss_file_read = new ArrayList<String>();            
            String line;
            String respuesta_final = "";
            int limite = 0;
            int inicio = 0;
                        
            while( (line = in.readLine()) != null){
                
                int summary_inicial = line.indexOf("class=\"lead\"");                    
                System.out.println("inicial = " + summary_inicial);
                int summary_final = line.indexOf("</div>");
                System.out.println("final = " + summary_final);
                
                if (summary_inicial != -1 && limite == 0){
                    respuesta_final = "";
                    respuesta_final = line + "\n";                    
                    System.out.println("respuesta_INICIAL = " + respuesta_final);
                    inicio = 1;
                }
                
                if (summary_inicial == -1 && summary_final == -1 && line.length()>0 && limite == 0){
                    respuesta_final = respuesta_final + line + "\n";
                    System.out.println("respuesta_PARCIAL = " + respuesta_final);
                }
                
                if (summary_final != -1 && limite == 0 && inicio == 1){
                    rss_file_read.add(respuesta_final.trim().replace("<p class=\"lead\">", "").replace("</div>", ""));
                    System.out.println("respuesta_FINAL = " + respuesta_final);
                    respuesta_final = "";
                    limite = 1;
                }
                
            }
            
            in.close();
            
            return rss_file_read;            
    }
    
    
    
    public static List<String> readRSSFeedEntidad(String url, String campo) throws IOException{
            //Objetos
            URL rssUrl = new URL (url);
            BufferedReader in = new BufferedReader(new InputStreamReader(rssUrl.openStream()));
            List<String> rss_file_read = new ArrayList<String>();            
            String line;
            String informacion = "";
            
            while( (line = in.readLine()) != null){
                
                int filtro = line.indexOf(campo);
                
                if(filtro != -1){                   
                    informacion = line;
                    rss_file_read.add(informacion);
                }
                
            }            
            in.close();
            
            return rss_file_read;            
    }
    
    
    
    public static List<String> readRSSFeedFilto(String url, String Filtro) throws IOException{
            //Objetos
            URL rssUrl = new URL (url);
            BufferedReader in = new BufferedReader(new InputStreamReader(rssUrl.openStream()));
            List<String> rss_file_read = new ArrayList<String>();
            List<String> rss_file_filter = new ArrayList<String>();
            String line;
            System.out.println("La palabra a buscar es " + Filtro);
            int longitud_palabra;
            //Lee desde la primera linea del rss hasta que encuentra una linea null(final del archivo)
            //Esto indica que leera cada linea del archivo RSS
            while((line = in.readLine())!=null){
                //indexof retorna -1 sino encuentra la palabra que recibio como argumento
                int indice_inicial = line.indexOf("<title>");
                int indice_final = line.indexOf("</title>");
                if((indice_inicial) != -1 && indice_final != -1 && indice_final-indice_inicial>7){             
                   int inicia_titulo = 7;
                   String Titulo = line.substring(indice_inicial+inicia_titulo,indice_final).replace("<![CDATA[", "");
                        try{
                            rss_file_read.add(Titulo.replace("]]>", ""));
                        }catch(NullPointerException ex){
                            System.out.println(ex);
                        }
                }
            }
            in.close();
            try{
                longitud_palabra = Filtro.length();
            }catch(NullPointerException exp){
                longitud_palabra = -1;
            }
            System.out.println("La longitud del fitro es " + longitud_palabra);
            if(longitud_palabra>0){
                for(int i=0;i<rss_file_read.size();i++){
                    if(ValidarRegex(rss_file_read.get(i).toUpperCase(),"(?d)"+Filtro.toUpperCase())){
                       try{
                       rss_file_filter.add(rss_file_read.get(i));
                       }catch(NullPointerException ex){
                            System.out.println(ex);
                       }
                    }
                }
                return rss_file_filter;
            }else
                return rss_file_read;
    }
    
    
    public static boolean ValidarRegex(String palabra_evaluar, String expresion_regular) 
    {     
        Pattern patron = Pattern.compile(expresion_regular);
        Matcher m = patron.matcher(palabra_evaluar);
        return m.find();            
    }
    
}
