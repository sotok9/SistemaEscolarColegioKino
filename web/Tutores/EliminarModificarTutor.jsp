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
        

        <script>
            $(document).ready(function () {//funcion ejecutada cuando la pagina haya cargado
                var options = {//variable options que se asignara para la libreria de ajaxforms
                    success: showResponse, //funcion que se ejecutara despues de ejecutar el post/get del form
                    clearForm: true       // limpiar formulario despues de la accion

                };
                $('#myform').ajaxForm(options);
            });


            function showResponse(responseText, statusText, xhr, $form) {
                //se asigna la respuesta que contiene el form de eliminar y modificar a un div
                //despues de asignarse se recarga el complemento
                $('#mydiv').html(responseText).trigger("create");
                var options = {//se crean mas parametros de ajaxforms para el form de modificacion
                    success: Modificar,
                    clearForm: true
                };
                $('#modificar').ajaxForm(options);
               // alert('status: ' + statusText + '\n\nresponseText: \n' + responseText);
            }

            function Modificar(responseText) { //funcion ejecutada despues del post/get de moficiacion
                alert(responseText);
                location.href = "../Tutores/EliminarModificarTutor.jsp"
            }

            function test() { //funcion usada para el post/get de eliminacion
                var formulario = $("#modificar");
                $.get("../jsp/EliminarTutor.jsp",formulario.serialize(), respuesta );
                
            }
            function respuesta(datos){ // funcion ejecutada despudes del post/get de eliminacion
                alert(datos.trim())
                location.href = "../Tutores/EliminarModificarTutor.jsp"
            }
        </script>

    </head>
    <body>
        
        
        <div  align="center">

            <h2>Modificar o Eliminar Tutor</h2>

            <form action="../jsp/FormModificarTutor.jsp" method="post" id="myform"  style="width: 25%">
                <input style=" text-align: center;" autocomplete="off" pattern="[0-9]{1,}" title="Solo numeros"  type="search" list="tutores" name="idTutor" placeholder="Seleccionar Tutor" class="CrecerInput">

                <button type="submit">Buscar</button> 
            </form>
            <div id="mydiv" style="align-items: center; width:600px; height: 200px;">
            <!-- en este div se desplegara el nuevo formulario -->

            </div>
            <datalist id="tutores" >
                <%//scripplet para armar el datalist de tutores
                    Conexion conexion = new Conexion();
                    try {
                        String myDriver = "org.gjt.mm.mysql.Driver";
                        Class.forName(myDriver);
                        Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
                        String query = "SELECT idtutor, nombre FROM tutores";
                        Statement st = conn.createStatement();
                        ResultSet rs = st.executeQuery(query);
                        while (rs.next()) {
                            //se imprime cada option del datalist
                            out.print("<option value='" + rs.getString("idtutor") + "' >" + rs.getString("nombre") + "</option>");
                        }
                        conn.close();
                        st.close();
                        rs.close();
                    } catch (Exception e) {
                        out.print("Got an exception! ");
                        out.print(e.getMessage());
                    }
                //scripplet para armar el datalist de tutores%>
            </datalist>
        </div>
            <form data-role="popup" id="popupConfirmar" data-overlay-theme="b" data-theme="b" data-dismissible="true" style="max-width:400px;" class="ui-corner-all" style="padding: 1px; width: 300px"  method="post">

                    <script>
                        function ClosePopup() {
                            $("#popupConfirmar").popup("close")
                        }
                    </script>
                        <div data-role="header" style="margin-top: 0px;" data-theme="b">
                            <h1>Eliminar Tutor</h1>
                    </div>
                        <div align="center" role="main" class="ui-content">
                                <h3 class="ui-title">¿Esta seguro que desea eliminar el tutor seleccionado?</h3>
                                <h4 >Esto borrara todos los alumnos registrados a este tutor y su informacion</h4>
                            
                                <a onclick="test();ClosePopup();"  class="BotonEncima2 ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" data-transition="flow" >Aceptar</a>
                                <a href="#" onclick="ClosePopup()" class="BotonEncima2 ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" >Cancelar</a>
                            </div>
                </form>
            
    </body>
</html>
