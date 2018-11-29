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
        <script src="../jquery1.4/jquery.form.js"></script>

        <script>
            $(document).ready(function () {
                var options = {
                    success: showResponse,
                    clearForm: true        // clear all form fields after successful submit 

                };
                $('#myform').ajaxForm(options);
            });

            function showResponse(responseText, statusText, xhr, $form) {
                $('#mydiv').html(responseText).trigger("create");
                // $("#idAlumno").val($("#buscar").val());
                //alert('status: ' + statusText + '\n\nresponseText: \n' + responseText);
            }
            function test() {
                var formulario = $("#adeudos")
                // alert(formulario.serialize())
                $.get("../jsp/ActualizarAdeudo.jsp", formulario.serialize(), respuesta);
            }
            function respuesta(datos) {
                alert(datos.trim());
                location.href = "../Administrativo/Abonos.jsp";
            }
        </script>
    </head>
    <body>
        <div  align="center">

            <h2 id="asd">Buscar adeudos de alumno</h2>

            <form action="../jsp/BusquedaAdeudos.jsp" method="POST" id="myform" style="width: 25%">
                <input id="buscar" style=" text-align: center;" autocomplete="off"  type="number" list="alumnos" name="idAlumno" placeholder="Selecciona ID..." required>

                <button type="submit" >Buscar</button>
                <datalist id="alumnos" >
                    <%
                        Conexion conexion = new Conexion();
                        try {
                            String myDriver = "org.gjt.mm.mysql.Driver";
                            Class.forName(myDriver);
                            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
                            String query = "SELECT idalumnos, nombre FROM alumnos";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            while (rs.next()) {
                                out.print("<option value=\"" + rs.getString("idalumnos") + "\">" + rs.getString("nombre") + "</option>");
                            }
                            conn.close();
                            st.close();
                            rs.close();
                        } catch (Exception e) {
                            out.print("Got an exception! ");
                            out.print(e.getMessage());
                        }
                    %>
                </datalist>
            </form>


            <div style="width:500px;" id="mydiv">

            </div>


        </div>
    </body>
</html>
