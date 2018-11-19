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

        <script src="../jquery1.4/jquery.mobile-1.4.5.min.js"></script>
        <script src="../jquery1.4/demos/js/jquery.js"></script>
        <script src="../jquery1.4/demos/js/jquery.mobile-1.4.5.min.js"></script>
        <script src="../jquery1.4/jquery.form.js"></script>

        <script>
            $(document).ready(function () {
                var options = {
                    beforeSubmit: showRequest,
                    success: showResponse,
                    clearForm: true        // clear all form fields after successful submit 

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
                alert('status: ' + statusText + '\n\nresponseText: \n' + responseText);
            }
        </script>
        <script>
            function test(){
                if ($("#chkActaNacimiento").is(':checked')) {
                    $("#h-chkActaNacimiento").attr('disabled','disabled');
                }
                if ($("#chkCurp").is(':checked')) {
                    $("#h-chkCurp").attr('disabled','disabled');
                }
                if ($("#chkFoto").is(':checked')) {
                    $("#h-chkFoto").attr('disabled','disabled');
                }
                if ($("#chkCartillaVacunacion").is(':checked')) {
                    $("#h-chkCartillaVacunacion").attr('disabled','disabled');
                }
                if ($("#chkComprobanteDomicilio").is(':checked')) {
                    $("#h-chkComprobanteDomicilio").attr('disabled','disabled');
                }
                if ($("#chkCartaNoAdeudo").is(':checked')) {
                    $("#h-chkCartaNoAdeudo").attr('disabled','disabled');
                }
                if ($("#chkActaBautismo").is(':checked')) {
                    $("#h-chkActaBautismo").attr('disabled','disabled');
                }
                if ($("#chkTipoSangre").is(':checked')) {
                    $("#h-chkTipoSangre").attr('disabled','disabled');
                }
                if ($("#chkServicioMedico").is(':checked')) {
                    $("#h-chkServicioMedico").attr('disabled','disabled');
                }
                var formulario = $("#expediente");
                alert(formulario.serialize())
                
                $.post("../jsp/ActualizarExpediente.jsp",formulario.serialize(), respuesta );
            }
            
            
            function respuesta(datos){
                alert(datos);
            }
        </script>
    </head>
    <body>
        <div  align="center">

            <h2>Buscar expediente de alumno</h2>

            <form action="../jsp/BusquedaExpediente.jsp" method="POST" id="myform" style="width: 25%">
                <input style=" text-align: center;"   type="search" list="alumnos" name="NombreAlumno" placeholder="Nombre Completo..." class="CrecerInput">
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

                                out.print("<option>" + rs.getString("nombre") + "</option>");
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


            <div id="mydiv"  style="width:60%" data-role="fieldcontain">

            </div>

</div>
    </body>
</html>
