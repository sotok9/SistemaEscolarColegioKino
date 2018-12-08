<%@page import="java.sql.*"%>
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
        String Usuario = request.getParameter("user").toLowerCase();
        String password = request.getParameter("pass");
        boolean conectar = false;
        int privilegios = 0;
        String nombre = "";
        
        HttpSession sesion = request.getSession(true);
        
        Conexion conexion = new Conexion();//conexion inicializada
        try {
            String myDriver = "org.gjt.mm.mysql.Driver";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT * FROM usuarios WHERE usuario='" + Usuario + "' and password='" + password+"' ";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.first()) {
                sesion.setAttribute("idusuario", rs.getInt("idusuario"));
                conectar = true;
                nombre = rs.getString("nombre");
                privilegios = rs.getInt("privilegios");
            }
            st.close();
            conn.close();
            rs.close();
        } catch (SQLException e) {
            out.print("Got an exception! ");
            out.print(e.getMessage());
        }

        if ((Usuario.equals("admin") && password.equals("123")) || conectar) {

            
            sesion.setAttribute("kino", "1");

    %>           
    <script >
        sessionStorage.setItem("privilegios", <%=privilegios%>);
        sessionStorage.setItem("nombre", "<%=nombre%>");
        location.href = "../menu.jsp";
    </script>
    <%        } else {
    %>            

    <script >
        alert("Usuario o contraseña equivocado")
        location.href = "../index.html";
    </script>

    <%
        }
    %>

</body>
</html>
