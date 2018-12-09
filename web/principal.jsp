<%-- 
    Document   : principal
    Created on : 8/12/2018, 07:47:37 PM
    Author     : Omarwsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.Auxiliar.Advertencias"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../jquery1.4/jquery.mobile-1.4.5.css">
        <script src="../jquery1.4/jquery.mobile-1.4.5.min.js"></script> 
        <script src="../jquery1.4/demos/js/jquery.js"></script>
        <script src=../jquery1.4/demos/js/jquery.mobile-1.4.5.min.js></script> 
        <script src="../jquery1.4/jquery.form.js"></script>
        
        <script>
            $().ready(function () {
                //se busca la informacion del tutor asignado en sesion
                // y se asigna a los campos de texto señalados
                $("#saludo").text("Bienvenido "+sessionStorage.getItem("nombre"));
            })
        </script>
    </head>
    
    <body style="background: #fff">
        
        <div align="center">
            <h1 id="saludo"></h1>
            <br><br>
            <img src="./imagenes/logo_kino.png" >
            
            
            <% 
            Advertencias advertencias = new Advertencias();
            out.print(advertencias.Ciclos());
            out.print(advertencias.Precios());
            %>
        </div>
        
    </body>
</html>
