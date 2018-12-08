<%-- 
    Document   : BusquedaTutor
    Created on : 11/11/2018, 08:06:02 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<!-- Comienzo de la tabla de respuesta -->
<table class="animated fadeInUp" style='font-size: 18px'>
    <tr>
        <th style='text-align: center'>#</th>
        <th style='width: 210px'>Nombre del usuario</th>
        <th>Alumno</th>
        <th style='text-align: center; width: 10px' >Motivo de abono</th>
        <th style='text-align: center; width: 10px'>Monto viejo</th>
        <th style='text-align: center; width: 10px'>Monto nuevo</th>
        <th style='text-align: center; width: 110px'>Fecha</th>
    </tr>
    <%
        Conexion conexion = new Conexion(); //clase conexion inicializada
        //captura de parametros recibidos
        String nombre = (String) request.getParameter("NombreUsuario");
        try {
            String myDriver = "org.gjt.mm.mysql.Driver";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT idmovimiento, usuarios.nombre as NombreUsuario, alumnos.nombre as NombreAlumno, motivo, montoviejo, montonuevo, fecha  "
                    + "FROM movimientosadeudos INNER JOIN usuarios ON movimientosadeudos.idusuario=usuarios.idusuario "
                    + "INNER JOIN deudas ON movimientosadeudos.iddeuda=deudas.iddeuda "
                    + "INNER JOIN alumnos ON deudas.idalumno=alumnos.idalumnos WHERE usuarios.nombre LIKE '%"+nombre+"%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                //se asignan los valores de la tabla sql a variables
                int id = rs.getInt("idmovimiento");
                String Usuario = rs.getString("NombreUsuario");
                String Alumno = rs.getString("NombreAlumno");
                String motivo = rs.getString("motivo");
                Double montoviejo = rs.getDouble("montoviejo");
                Double montonuevo = rs.getDouble("montonuevo");
                String fecha = rs.getString("fecha");
                //se imprime las columnas para el renglon de la tabla por cada resultado
                out.print("<tr>");
                out.print("<td style='text-align: center'>" + id + "</td>");
                out.print("<td>" + Usuario + "</td>");
                out.print("<td>" + Alumno + "</td>");
                out.print("<td style='text-align: center'>" + motivo + "</td>");
                out.print("<td>" + montoviejo + "</td>");
                out.print("<td>" + montonuevo + "</td>");
                out.print("<td style='text-align: center'>" + fecha + "</td>");
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