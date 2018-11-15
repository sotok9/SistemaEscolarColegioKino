<%-- 
    Document   : BusquedaTutor
    Created on : 11/11/2018, 08:06:02 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<table id="Tabla">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Direccion</th>
        <th>Telefono 1</th>
        <th>Telefono 2</th>
        <th>Correo</th>
        <th>Seleccionar</th>
    </tr>
    <%
        String nombre =  (String) request.getParameter("Nombre-Tutor");
        Conexion conexion = new Conexion();
        try {
            String myDriver = "org.gjt.mm.mysql.Driver";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
            int num = 0;
            String query = "SELECT * FROM tutores WHERE nombre like '%"+nombre+"%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                num++;
                int id = rs.getInt("idtutor");
                String Nombre = rs.getString("nombre");
                String Direccion = rs.getString("direccion");
                long telefono1 = rs.getLong("tel1");
                long telefono2 = rs.getLong("tel2");
                String correo = rs.getString("correo");
                out.print("<tr>");
                out.print("<td>" + id + "</td>");
                out.print("<td>" + Nombre + "</td>");
                out.print("<td>" + Direccion + "</td>");
                out.print("<td>" + telefono1 + "</td>");
                out.print("<td>" + telefono2 + "</td>");
                out.print("<td>" + correo + "</td>");
                out.print("<td  style=\"width:10%\"><input id=\""+num+"\" class=\"radioinput RadioTutor\" style=\" margin-left: 30%\" type=\"radio\" form=\"myform\" name=\"Radiobtn\" value=\"true\"></td>");
                out.print("</tr>");

            }
            st.close();
        } catch (Exception e) {
            out.print("Got an exception! ");
            out.print(e.getMessage());
        }
    %>
</table>