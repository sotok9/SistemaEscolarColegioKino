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
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 70%;
                margin-top: 3%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>

        <script>
            $(document).ready(function () {//funcion ejecutada cuando la pagina haya cargado
                var options = {//variable options que se asignara para la libreria de ajaxforms
                    success: showResponse, //funcion que se ejecutara despues de ejecutar el post/get del form
                    clearForm: true       // limpiar formulario despues de la accion

                };
                $('#myform').ajaxForm(options);
            });


            function showResponse(responseText, statusText, xhr, $form) {
                // se asigna la respuesta de texto que contiene una tabla a el div
                 alert('status: ' + statusText + '\n\nresponseText: \n' + responseText);
            }


        </script>

    </head>
    <body>
        <div align="center" >
            <h2>Selecciona el grupo para aprobar ciclo</h2>
            <form id="myform" action="../jsp/AvanceAlumnos.jsp" method="post" class="ui-body ui-body-a ui-corner-all" style="width: 20%">
                <label>Ciclo Actual:</label>
                <select name="SelectCicloActual" >
                    <%//scriplet para armar e imprimir las opciones de este select
                        Conexion conexion = new Conexion();
                        String options = "";
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

                            String query = "SELECT * FROM ciclo ORDER BY año DESC";
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            while (rs.next()) {
                                int año = rs.getInt("año");
                                String ciclo = rs.getInt("año") + "-" + (rs.getInt("año") + 1);
                                //impresion de option por cada ciclo 
                                options += "<option value=\"" + rs.getInt("idciclo") + "\">" + ciclo + "</option>";
                            }
                            out.print(options);
                            con.close();
                            st.close();
                            rs.close();
                        } catch (Exception e) {
                            out.print("Got an exception! ");
                            out.print(e.getMessage());
                        }
                        //scriplet para armar e imprimir las opciones de este select%>
                </select>
                <label>Nivel:</label>
                <select name="SelectNivel" id="select-v-2a">
                    <option value="">Todos</option>
                    <option value="Preescolar">Preescolar</option>
                    <option value="Primaria">Primaria</option>
                    <option value="Secundaria">Secundaria</option>
                </select>
                <label>Grado:</label>
                <select name="SelectGrado" id="select-v-2b">
                    <option value="" >Todos</option>
                    <option value="1°">1°</option>
                    <option value="2°">2°</option>
                    <option value="3°">3°</option>
                    <option value="4°">4°</option>
                    <option value="5°">5°</option>
                    <option value="6°">6°</option>
                </select>
                <br>
                <button type="submit">Aprobar</button> 
            </form>
        </div>
    </body>
</html>
