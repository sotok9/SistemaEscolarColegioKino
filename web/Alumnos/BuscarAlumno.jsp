<%-- 
    Document   : BuscarTutor
    Created on : 23/10/2018, 12:13:44 PM
    Author     : Omarwsk
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../animate.css" />
        <link rel="stylesheet" href="../jquery1.4/jquery.mobile-1.4.5.css" />

        <script src="../jquery1.4/jquery.mobile-1.4.5.min.js"></script>
        <script src="../jquery1.4/demos/js/jquery.js"></script>
        <script src="../jquery1.4/demos/js/jquery.mobile-1.4.5.min.js"></script>
        <script src="../jquery1.4/jquery.form.js"></script>
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
                display: inline-block;
                vertical-align: top;
            }
        </style>

        <script>
            $(document).ready(function () {//funcion ejecutada cuando la pagina haya cargado
                var options = {//variable options que se asignara para la libreria de ajaxforms
                    success: showResponse,//funcion que se ejecutara despues de ejecutar el post/get del form
                    clearForm: true       // limpiar formulario despues de la accion

                };
                $('#myform').ajaxForm(options);
            });


            function showResponse(responseText, statusText, xhr, $form) {
                // se asigna la respuesta de texto que contiene una tabla a el div
                $('#mydiv').html(responseText); 
               // alert('status: ' + statusText + '\n\nresponseText: \n' + responseText);
            }
        </script>

    </head>
    <body>

        <div  align="center">

            <h2>Alumnos Registrados</h2>

            <form action="../jsp/BusquedaAlumno.jsp" method="post" id="myform"  style="width: 30%">
                <input style=" text-align: center;" autocomplete="off"   type="search" list="alumnos" name="Nombre-Alumno" placeholder="Nombre (vacio para busqueda general)" class="CrecerInput">
                <button type="submit">buscar</button> 
            </form>
            <div id="mydiv">
                <table>
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
                    <%//scripplet para armar los renglones de tabla y el datalist de alumnos
                        Conexion conexion = new Conexion();
                        try {
                            String myDriver = "org.gjt.mm.mysql.Driver";
                            Class.forName(myDriver);
                            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
                            String query = "SELECT idalumnos, alumnos.nombre, alumnos.direccion, sexo, fechanac, grado, nivel, grupo, tutores.nombre as nombretutor FROM schema_kino.alumnos "
                                    + "INNER JOIN tutores ON alumnos.idtutor = tutores.idtutor;";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            List ListaNombres = new ArrayList();
                            while (rs.next()) { //se imprimen todos los renglones y columnas 
                                String sexo = "";
                                if (rs.getInt("sexo") == 0) {
                                    sexo = "Mujer";
                                } else {
                                    sexo = "Hombre";
                                }
                                 // se agregan los nombres a un list para el datalist
                                ListaNombres.add(rs.getString("nombre"));
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
                            conn.close();
                            st.close();
                            rs.close();

                    %>
                </table>
            </div>
            <datalist id="alumnos" >
                <%for (int i = 0; i < ListaNombres.size(); i++) { //ciclo para armar el datalist de tutores
                %>
                <option  ><%= ListaNombres.get(i)%></option>

                <% }
                    } catch (Exception e) {
                        out.print("Got an exception! ");
                        out.print(e.getMessage());
                    }
                //scripplet para armar los renglones de tabla y el datalist de alumnos%>
            </datalist>
        </div>

    </body>
</html>
