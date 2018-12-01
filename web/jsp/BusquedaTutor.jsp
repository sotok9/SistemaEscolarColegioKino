<%-- 
    Document   : BusquedaTutor
    Created on : 11/11/2018, 08:06:02 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<!-- Comienzo de la tabla de respuesta -->
<table class="animated fadeInUp">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Direccion</th>
        <th>Telefono 1</th>
        <th>Telefono 2</th>
        <th>Correo</th>
    </tr>
    <%
        Conexion conexion = new Conexion(); //clase conexion inicializada
        //captura de parametros recibidos
        String nombre = (String) request.getParameter("Nombre-Tutor");
        try {
            String myDriver = "org.gjt.mm.mysql.Driver";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT * FROM tutores WHERE nombre like '%" + nombre + "%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                
                int id = rs.getInt("idtutor");
                String Nombre = rs.getString("nombre");
                String Direccion = rs.getString("direccion");
                long telefono1 = rs.getLong("tel1");
                long telefono2 = rs.getLong("tel2");
                String correo = rs.getString("correo");
                //se imprime las columnas para el renglon de la tabla por cada resultado
                out.print("<tr>");
                out.print("<td>" + id + "</td>");
                out.print("<td>" + Nombre + "</td>");
                out.print("<td>" + Direccion + "</td>");
                out.print("<td>" + telefono1 + "</td>");
                out.print("<td>" + telefono2 + "</td>");
                out.print("<td>" + correo + "</td>");
                out.print("</tr>");

            }
            st.close();
            conn.close();
            rs.close();
        } catch (Exception e) {
            out.print("Got an exception! ");
            out.print(e.getMessage());
        }
    %>
</table>