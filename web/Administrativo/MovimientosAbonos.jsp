<%-- 
    Document   : Documentacion
    Created on : 4/11/2018, 07:54:14 PM
    Author     : Omarwsk
--%>

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
            $(document).ready(function () { //funcion ejecutada cuando la pagina haya cargado
                var options = {//variable options que se asignara para la libreria de ajaxforms
                    success: showResponse, //funcion que se ejecutara despues de ejecutar el post/get del form
                    clearForm: true        // limpiar formulario despues de la accion

                };
                $('#myform').ajaxForm(options); // se le asigna la funcion y parametros de la libreria al form
            });

            function showResponse(responseText, statusText, xhr, $form) { //funcion ejecutada despues del post/get
                $('#mydiv').html(responseText).trigger("create"); //se asigna la respuesta de texto que contiene una tabla a un div y se recarga el div
            }
        </script>
    </head>
    <body>
        <div  align="center">

            <h2 id="asd">Buscar historial de abonos</h2>

            <form action="../jsp/BusquedaMovimientos.jsp" method="POST" id="myform" style="width: 25%">
                <input id="buscar" style=" text-align: center;" autocomplete="off"  type="text" list="usuarios" name="NombreUsuario" placeholder="Nombre (Vacio para busqueda general)">

                <datalist id="usuarios" >
                    <% //scriplet para armar e imprimir las opciones de este datalist
                        Conexion conexion = new Conexion();
                        try {
                            String myDriver = "org.gjt.mm.mysql.Driver";
                            Class.forName(myDriver);
                            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
                            String query = "SELECT nombre FROM usuarios";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            while (rs.next()) {
                                //impresion de option por cada alumno
                                out.print("<option >" + rs.getString("nombre") + "</option>");
                            }
                            conn.close();
                            st.close();
                            rs.close();
                        } catch (Exception e) {
                            out.print("Got an exception! ");
                            out.print(e.getMessage());
                        }
                        //scriplet para armar e imprimir las opciones de este datalist%>
                </datalist>

                <button type="submit" >Buscar</button>
            </form>





        </div>
        <div align="center" style="width: 100%;" id="mydiv">
            
        </div>
    </body>
</html>
