<%-- 
    Document   : AvanzeCiclo
    Created on : 26/11/2018, 03:50:46 PM
    Author     : Omarwsk
--%>

<%@page import="clases.ConexionMysql.Conexion"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../jquery1.4/jquery.mobile-1.4.5.css" />
        <link rel="stylesheet" href="../animate.css" />
        <script src="../jquery1.4/jquery.mobile-1.4.5.min.js"></script>
        <script src="../jquery1.4/demos/js/jquery.js"></script>
        <script src="../jquery1.4/demos/js/jquery.mobile-1.4.5.min.js"></script>
        <script src="../jquery1.4/jquery.form.js"></script>   <!-- libreria ajax forms -->
    </head>
    <body>
        <div align="center" style="width: 70%">
            <h2>Selecciona los alumnos del ciclo</h2>
            <select name="SelectCiclo" id="select-v-2b">
                <%//scriplet para armar e imprimir las opciones de este select
                    Conexion conexion = new Conexion();
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

                        String query = "SELECT * FROM ciclo ORDER BY año DESC";
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(query);
                        while (rs.next()) {
                            int id = rs.getInt("idciclo");
                            String ciclo = rs.getInt("año") + "-" + (rs.getInt("año") + 1);
                            //impresion de option por cada ciclo 
                            out.print("<option value=\"" + id + "\">" + ciclo + "</option>");
                        }
                        con.close();
                        st.close();
                        rs.close();
                    } catch (Exception e) {
                        out.print("Got an exception! ");
                        out.print(e.getMessage());
                }
                //scriplet para armar e imprimir las opciones de este select%>
            </select>
        </div>
    </body>
</html>
