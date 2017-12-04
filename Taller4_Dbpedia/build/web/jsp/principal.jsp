<%-- 
    Document   : principal
    Created on : 4/11/2017, 01:19:01 PM
    Author     : Kmilo
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal</title>
        <link href="../Resources/css/screen.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            function validarEntidad() {
                //obteniendo el valor que se puso en campo text del formulario
                miCampoTexto = document.getElementById("entidad").value;
                //la condición
                if (miCampoTexto.length == 0) {
                    alert("Debe colocar la entidad");
                    return false;
                }
                return true;
            }
            
            function validarCantidad() {
                //obteniendo el valor que se puso en campo text del formulario
                miCampoTexto = document.getElementById("cantidad").value;
                //la condición
                if (miCampoTexto.length == 0) {
                    alert("Debe colocar la cantidad de Hashtags");
                    return false;
                }
                return true;
            }
            
            
            
            function validarSiNumero(numero){
                if (!/^([0-9])*$/.test(numero)) 
                    alert("El valor " + numero + " no es un número");
            }
        </script>
    </head>
    <body>
    <!--<body style="background-color: darkslategray">-->
        
        <BR><BR><BR>
        
        <h1 style="color: black" align="center"><b>Busqueda de entidades musicales</b></h1><BR><BR><BR>            
        
        <form name="form_cantidadPreguntas" action="CantidadPreguntasRSS.jsp" onsubmit="return validarCantidad()" align="center">
            <fieldset style="background-color:darkgrey;"><br>
                <p class="BtnCantidadPreguntas" align="center">
                    <label style="color: black; font-size:18px"> Consultar </label>
                    <input id="cantidad" type="text" name="preguntas" placeholder="Ej: 10" size="3" onChange="validarSiNumero(this.value);"/>
                    <label style="color: black; font-size:18px"> preguntas aleatoriamente en </label><BR><BR>
                    <input type="submit" value="Buscar" name="btn_cantidadPreguntas" align="center"/>
                </p>
            </fieldset>
        </form>
                
        <BR><BR>
        
        <form name="form_cosultarEntidad" action="ConsultarEntidadRSS.jsp" onsubmit="return validarEntidad()" align="center">
            <fieldset style="background-color:darkgrey;"><br>
                <p class="BtnConsultarEntidad" align="center">
                    <label style="color: black; font-size:18px"> Consultar la información relacionadas con </label>                    
                    <select name="Entidad_Elegida" id="Entidad_Elegida">
                        <option value="Shakira">Shakira</option>
                        <option value="Juanes">Juanes</option>
                        <option value="Juan_Fernando_Velasco">Juan Fernando Velasco</option>
                    </select><br><br>
                    <input type="submit" value="Buscar" name="btn_consultarEntidad" align="center"/>
                </p>
                </fieldset>
        </form>
        
        <BR><BR>
        
        <p class="linkVolver" align="center">
            <a href="../index.jsp" style="font-size: 15pt; font-family: Comic Sans MS; color: white; align-items: center" align="center">Inicio</a>
        </p>
        
    </body>
</html>
