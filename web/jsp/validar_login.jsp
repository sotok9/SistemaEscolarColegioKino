<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
</head>
        
    </head>
    <body>
        
        <%
        String Usuario = request.getParameter("user");
        String Contraseña = request.getParameter("pass");

        if(Usuario.equals("admin") && Contraseña.equals("123")){

        HttpSession sesion = request.getSession(true);
        sesion.setAttribute("kino","1");

        %>           
        
        <script >
         location.href="../menu.jsp";
        </script>
        
        <%
        }else{
        %>            

        <script >
         location.href="../index.html";
        </script>
        
        <%
        }
        %>
        
    </body>
</html>
