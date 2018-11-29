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

        <link rel="stylesheet" href="../jquery1.4/jquery.mobile-1.4.5.css" />
        <link rel="stylesheet" href="../animate.css" />
        
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
            $(document).ready(function () {
                var options = {
                    success: showResponse,
                    clearForm: true        // clear all form fields after successful submit 

                };
                $('#myform').ajaxForm(options);
            });


            function showResponse(responseText, statusText, xhr, $form) {
                $('#mydiv').html(responseText);
                //alert('status: ' + statusText + '\n\nresponseText: \n' + responseText);
            }
        </script>

    </head>
    <body>

        <div  align="center">

            <h2>Tutores Registrados</h2>

            <form action="../jsp/BusquedaTutor.jsp" method="post" id="myform"  style="width: 30%">
                <input style=" text-align: center;" autocomplete="off"   type="search" list="tutores" name="Nombre-Tutor" placeholder="Nombre(vacio para busqueda general)" class="CrecerInput">
                <button type="submit">buscar</button> 
            </form>
            <div id="mydiv">
  <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Direccion</th>
                        <th>Telefono 1</th>
                        <th>Telefono 2</th>
                        <th>Correo</th>
                    </tr>
                    <%
                        Conexion conexion = new Conexion();
                        try {
                            String myDriver = "org.gjt.mm.mysql.Driver";
                            Class.forName(myDriver);
                            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
                            String query = "SELECT * FROM tutores";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            List ListaNombres = new ArrayList();
                            while (rs.next()) {

                                int id = rs.getInt("idtutor");
                                String Nombre = rs.getString("nombre");
                                ListaNombres.add(Nombre);
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
                                out.print("</tr>");

                            }
                            conn.close();
                            st.close();
                            rs.close();

                    %>
                </table>
            </div>

            <datalist id="tutores" >
                <%for (int i = 0; i < ListaNombres.size(); i++) {
                %>
                <option  ><%= ListaNombres.get(i)%></option>

                <% }
                    } catch (Exception e) {
                        out.print("Got an exception! ");
                        out.print(e.getMessage());
                    }
                %>
            </datalist>
        </div>

    </body>
</html>
