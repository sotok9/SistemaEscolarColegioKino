<%-- 
    Document   : TablaPrecios
    Created on : 9/12/2018, 10:19:35 PM
    Author     : Omarwsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<!-- Comienzo de la tabla de respuesta -->
<style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 50%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
            .radioinput{
                width: 35px;
                height: 22px;

                display: inline-block;
                vertical-align: top;
            }
        </style>
<table class="animated fadeInUp">
    <tr>
        <th>Nivel</th>
        <th>Inscripcion</th>
        <th>Cuota de padres</th>
        <th>Libros</th>
        <th>Seguro</th>
        <th>Mensualidades</th>
    </tr>
    <%
        Conexion conexion = new Conexion(); //clase conexion inicializada
        //captura de parametros recibidos
        String idCiclo = (String) request.getParameter("SelectCiclo");
        try {
            String myDriver = "org.gjt.mm.mysql.Driver";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
            String query = "SELECT * FROM precios "
                    + " WHERE idciclo="+idCiclo;
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {

                //se imprime las columnas para el renglon de la tabla por cada resultado
                out.print("<tr>");
                out.print("<td>" + rs.getString("nivel") + "</td>");
                out.print("<td>" + rs.getString("inscripcion") + "</td>");
                out.print("<td>" + rs.getString("cuota_padres") + "</td>");
                out.print("<td>" + rs.getString("libros") + "</td>");
                out.print("<td>" + rs.getString("seguro") + "</td>");
                out.print("<td>" + rs.getString("mensualidad") + "</td>");
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