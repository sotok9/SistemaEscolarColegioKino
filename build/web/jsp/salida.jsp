<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
      
        <%
        HttpSession sesion = request.getSession(false);
        //se eliminan los registros de sesion
        sesion.invalidate();
        %>
        
        <script >
            sessionStorage.clear();
         location.href="../index.html";
        </script>
        
    </body>
</html>
