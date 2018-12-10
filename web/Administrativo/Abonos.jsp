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

        <script>
            $(document).ready(function () { //funcion ejecutada cuando la pagina haya cargado
                var options = {//variable options que se asignara para la libreria de ajaxforms
                    success: showResponse, //funcion que se ejecutara despues de ejecutar el post/get del form

                };
                $('#myform').ajaxForm(options); // se le asigna la funcion y parametros de la libreria al form
            });


            function showResponse(responseText, statusText, xhr, $form) { //funcion ejecutada despues del post/get
                $("#buscar").val("");
                $('#mydiv').html(responseText).trigger("create"); //se asigna la respuesta de texto que contiene un formulario a un div y se recarga el div
            }
            function test() { //funcion usada para usar post/get actualizar adeudo
                var formulario = $("#adeudos")
                $.get("../jsp/ActualizarAdeudo.jsp", formulario.serialize(), respuesta);
            }
            function respuesta(datos) { //funcion ejecutada despues de post/get de funcion test()
                alert(datos.trim());
                location.href = "../Administrativo/Abonos.jsp";
            }
        </script>
    </head>
    <body>
        <div  align="center">

            <h2>Buscar adeudos de alumno</h2>

            <form action="../jsp/BusquedaAdeudos.jsp" method="POST" id="myform" style="width: 25%">
                <input id="buscar" pattern="[0-9]{1,}" title="Solo numeros" style=" text-align: center;" autocomplete="off"  type="text" list="alumnos" name="idAlumno" placeholder="Selecciona ID..." required>

                <datalist id="alumnos" >
                    <% //scriplet para armar e imprimir las opciones de este datalist
                        Conexion conexion = new Conexion();
                        try {
                            String myDriver = "org.gjt.mm.mysql.Driver";
                            Class.forName(myDriver);
                            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
                            String query = "SELECT idalumnos, nombre FROM alumnos";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            while (rs.next()) {
                                //impresion de option por cada alumno
                                out.print("<option value=\"" + rs.getString("idalumnos") + "\">" + rs.getString("nombre") + "</option>");
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
                <select id="SelectCiclo" name="SelectCiclo" >
                    <%//scriplet para armar e imprimir las opciones de este select
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
                <button type="submit" >Buscar</button>
            </form>


            <div style="width:500px; height: 400px; overflow-y: scroll;"  id="mydiv">

            </div>


        </div>
    </body>
</html>
