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
                width: 35px;
                height: 22px;

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
                $('#mydiv').html(responseText); // se asigna la respuesta de texto que contiene una tabla a el div
                //alert('status: ' + statusText + '\n\nresponseText: \n' + responseText);
            }
        </script>
        <script>
            function siguiente() { // funcion que pasa los datos de tutor al registro de alumnos
                var rdBtn = $('input[name=Radiobtn]:checked'); // se busca el radio seleccionado
                var row = 0;
                var ciclo = 0;
                var Tutor;
                var idTutor;
                row = rdBtn.attr('id'); // se extrae el atributo de id al radio (tambien usado como referencia de renglon)
                if(row==null){
                    alert("Selecciona un tutor primero")
                }else{
                $('#Tabla tr').each(function () { // se recorre toda la tabla para buscar el renglon seleccionado
                    if (ciclo == row) {//se guardan los datos del renglon seleccionado
                        idTutor = $(this).find("td").eq(0).html(); 
                        Tutor = $(this).find("td").eq(1).html();
                    }
                    ciclo += 1;
                });
                //los datos del tutor seleccionado se almacenan en sesion para pasar al siguiente form
                sessionStorage.setItem("idTutor", idTutor);
                sessionStorage.setItem("NombreTutor", Tutor);
                location.href = "../Alumnos/RegistroAlumno.jsp";
            }
            }
        </script>

    </head>
    <body>

        <div  align="center">

            <h2>Selecciona un tutor para el alumno</h2>

            <form action="../jsp/BusquedaAsignarTutor.jsp" method="post" id="myform"  style="width: 30%">
                <input style=" text-align: center;" autocomplete="off"  type="search" list="tutores" name="Nombre-Tutor" placeholder="Nombre(vacio para busqueda general)" class="CrecerInput">
                <button type="submit">buscar</button> 
            </form>

            <form action="../Alumnos/RegistroAlumno.jsp" method="post" id="myform2">
                <input id="nombretutor" type="hidden" name="NombreTutor">
                <input id="idtutor" type="hidden" name="idTutor">
            </form>

            <div id="mydiv">
                <!-- se inicia la tabla de tutores -->
                <table id="Tabla">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Direccion</th>
                        <th>Telefono 1</th>
                        <th>Telefono 2</th>
                        <th>Correo</th>
                        <th>Seleccionar</th>
                    </tr>
                    <% //scripplet para armar los renglones de tabla y el datalist de tutores
                        Conexion conexion = new Conexion();
                        try {
                            String myDriver = "org.gjt.mm.mysql.Driver";
                            Class.forName(myDriver);
                            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
                            int num = 0;
                            String query = "SELECT * FROM tutores";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            List ListaNombres = new ArrayList();
                            
                            while (rs.next()) { //se imprimen todos los renglones y columnas 
                                num++;
                                int id = rs.getInt("idtutor");
                                String Nombre = rs.getString("nombre");
                                ListaNombres.add(Nombre); // se agregan los nombres a un list para el datalist
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
                                out.print("<td  style=\"width:10%\"><input id=\"" + num + "\" class=\"radioinput RadioTutor\" style=\"margin-left: 30%\" type=\"radio\" form=\"myform\" name=\"Radiobtn\" value=\"true\"></td>");
                                out.print("</tr>");

                            }
                            conn.close();
                            st.close();
                            rs.close();

                   %>
                </table>
            </div>
            <datalist id="tutores" >
                <%for (int i = 0; i < ListaNombres.size(); i++) { //ciclo para armar el datalist de tutores
                %>
                <option  ><%= ListaNombres.get(i)%></option>

                <% }
                    } catch (Exception e) {
                        out.print("Got an exception! ");
                        out.print(e.getMessage());
                    }
                 //scripplet para armar los renglones de tabla y el datalist de tutores%>
            </datalist>
            <a href="./../Tutores/RegistrarTutor.html"  style="margin-right:12.5%" target="Marco" class="ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini">Registrar nuevo Tutor</a>
            <button  style="margin-left:12.5%" onclick="siguiente()"   target="Marco" class="ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini">Siguiente</button>
        </div>

    </body>
</html>
