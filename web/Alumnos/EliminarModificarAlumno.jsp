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
                    beforeSubmit: showRequest,
                    success: showResponse,
                    clearForm: true

                };
                $('#myform').ajaxForm(options);
            });


            function showRequest(formData, jqForm, options) {
                var queryString = $.param(formData);

                alert('About to submit: \n\n' + queryString);
                return true;
            }

            function showResponse(responseText, statusText, xhr, $form) {
                $('#mydiv').html(responseText).trigger("create");
                var options = {
                    beforeSubmit: modificar1,
                    success: Modificar,
                    clearForm: true
                };
                $('#modificar').ajaxForm(options);
                alert('status: ' + statusText + '\n\nresponseText: \n' + responseText);
            }

            function Modificar(responseText) {
                alert(responseText);
                location.href = "../Alumnos/EliminarModificarAlumno.jsp"
            }

            function modificar1(formData, jqForm, options) {
                var queryString = $.param(formData);

                alert('About to submit: \n\n' + queryString);
                return true;
            }

            function test() {
                var formulario = $("#modificar");
                $.get("../jsp/EliminarAlumno.jsp",formulario.serialize(), respuesta );
                
            }
            function respuesta(datos){
                alert(datos.trim())
                location.href = "../Alumnos/EliminarModificarAlumno.jsp"
            }
        </script>

    </head>
    <body>
        
        
        <div  align="center">

            <h2>Alumnos Registrados</h2>

            <form action="../jsp/FormModificarAlumno.jsp" method="post" id="myform"  style="width: 25%">
                <input style=" text-align: center;" autocomplete="off"   type="search" list="alumnos" name="idAlumno" placeholder="Seleccionar Alumno(ID)" class="CrecerInput">

                <button type="submit">Buscar</button> 
            </form>
            <div id="mydiv" style="align-items: center; width:600px; height: 200px;">


            </div>
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

                            out.print("<option value='" + rs.getString("idalumnos") + "' >" + rs.getString("nombre") + "</option>");
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
        </div>

    </body>
</html>
