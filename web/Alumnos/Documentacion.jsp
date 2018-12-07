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
            $(document).ready(function () {//funcion ejecutada cuando la pagina haya cargado
                var options = {//variable options que se asignara para la libreria de ajaxforms
                    success: showResponse, //funcion que se ejecutara despues de ejecutar el post/get del form
                    clearForm: true       // limpiar formulario despues de la accion

                };
                $('#myform').ajaxForm(options);
            });


            function showResponse(responseText, statusText, xhr, $form) {
                // se asigna la respuesta de tesxto que contiene el form de documentacion a un div y se recarga
                $('#mydiv').html(responseText).trigger("create");
                //alert('status: ' + statusText + '\n\nresponseText: \n' + responseText);
            }
        </script>
        <script>
            function test() {// funcion para hacer post de los checkbox del form expediente
                //cada checkbox tiene un hidden input con el mismo nombre
                //en caso de que el checkbox no este marcado se enviara el input hidden
                //caso contrario el input hidden se enviara
                if ($("#chkActaNacimiento").is(':checked')) {
                    $("#h-chkActaNacimiento").attr('disabled', 'disabled');
                }
                if ($("#chkCurp").is(':checked')) {
                    $("#h-chkCurp").attr('disabled', 'disabled');
                }
                if ($("#chkFoto").is(':checked')) {
                    $("#h-chkFoto").attr('disabled', 'disabled');
                }
                if ($("#chkCartillaVacunacion").is(':checked')) {
                    $("#h-chkCartillaVacunacion").attr('disabled', 'disabled');
                }
                if ($("#chkComprobanteDomicilio").is(':checked')) {
                    $("#h-chkComprobanteDomicilio").attr('disabled', 'disabled');
                }
                if ($("#chkCartaNoAdeudo").is(':checked')) {
                    $("#h-chkCartaNoAdeudo").attr('disabled', 'disabled');
                }
                if ($("#chkActaBautismo").is(':checked')) {
                    $("#h-chkActaBautismo").attr('disabled', 'disabled');
                }
                if ($("#chkTipoSangre").is(':checked')) {
                    $("#h-chkTipoSangre").attr('disabled', 'disabled');
                }
                if ($("#chkServicioMedico").is(':checked')) {
                    $("#h-chkServicioMedico").attr('disabled', 'disabled');
                }
                var formulario = $("#expediente");

                $.post("../jsp/ActualizarExpediente.jsp", formulario.serialize(), respuesta);
            }


            function respuesta(datos) { //funcion ejecutada despues del post
                alert(datos.trim()); //se despliega la respuesta en un alert
                location.href = "../Alumnos/Documentacion.jsp" //se recarga la pagina
            }
        </script>
    </head>
    <body>
        <div  align="center">

            <h2>Buscar expediente de alumno</h2>

            <form action="../jsp/BusquedaExpediente.jsp" method="POST" id="myform" style="width: 25%">
                <input style=" text-align: center;" pattern="[0-9]{1,}" title="Solo numeros" autocomplete="off" type="text" list="alumnos" name="idAlumno" placeholder="Selecciona ID" required>
                <button type="submit" >Buscar</button>
                <datalist id="alumnos" >
                    <%//scripplet para armar el datalist de alumnos
                        Conexion conexion = new Conexion();
                        try {
                            String myDriver = "org.gjt.mm.mysql.Driver";
                            Class.forName(myDriver);
                            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
                            String query = "SELECT idalumnos, nombre FROM alumnos";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            while (rs.next()) {
                                //se imprime cada opcion del datalist
                                out.print("<option value=\"" + rs.getString("idalumnos") + "\">" + rs.getString("nombre") + "</option>");
                            }
                            conn.close();
                            st.close();
                            rs.close();
                        } catch (Exception e) {
                            out.print("Got an exception! ");
                            out.print(e.getMessage());
                        }
                        //scripplet para armar el datalist de alumnos%>
                </datalist>
            </form>


            <div id="mydiv" align="center"  style="width:45%">
                <!-- en este div se despliega el expediente -->
            </div>

        </div>
    </body>
</html>
