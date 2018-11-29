<%-- 
    Document   : BusquedaTutor
    Created on : 11/11/2018, 08:06:02 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<table class="animated fadeInUp">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Direccion</th>
        <th>Sexo</th>
        <th>Fecha de Nacimiento</th>
        <th>Grado</th>
        <th>Nivel</th>
        <th>Grupo</th>
        <th>Tutor</th>
    </tr>
    <%
        Conexion conexion = new Conexion();
        String nombre = (String) request.getParameter("Nombre-Alumno");
        try {
            String myDriver = "org.gjt.mm.mysql.Driver";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
            String query = "SELECT idalumnos, alumnos.nombre, alumnos.direccion, sexo, fechanac, grado, nivel, grupo, tutores.nombre as nombretutor FROM schema_kino.alumnos "
                    + "INNER JOIN tutores ON alumnos.idtutor = tutores.idtutor WHERE alumnos.nombre like '%" + nombre + "%';";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String sexo = "";
                if (rs.getInt("sexo") == 0) {
                    sexo = "Mujer";
                } else {
                    sexo = "Hombre";
                }

                out.print("<tr>");
                out.print("<td>" + rs.getInt("idalumnos") + "</td>");
                out.print("<td>" + rs.getString("nombre") + "</td>");
                out.print("<td>" + rs.getString("direccion") + "</td>");
                out.print("<td>" + sexo + "</td>");
                out.print("<td>" + rs.getString("fechanac") + "</td>");
                out.print("<td>" + rs.getString("grado") + "</td>");
                out.print("<td>" + rs.getString("nivel") + "</td>");
                out.print("<td>" + rs.getString("grupo") + "</td>");
                out.print("<td>" + rs.getString("nombretutor") + "</td>");
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