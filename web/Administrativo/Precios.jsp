<%-- 
    Document   : Precios
    Created on : 18/11/2018, 02:52:29 PM
    Author     : Omarwsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro de Tutores</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../jquery1.4/jquery.mobile-1.4.5.css">
        <script src="../jquery1.4/jquery.mobile-1.4.5.min.js"></script> 
        <script src="../jquery1.4/demos/js/jquery.js"></script>
        <script src=../jquery1.4/demos/js/jquery.mobile-1.4.5.min.js></script> 
        <script src="../jquery1.4/jquery.form.js"></script>
        <style>
            <!--al poner el mause encima del boton--> 
            .BotonEncima:hover{

                background: #000;  
            }
            .BotonEncima:hover
            {
                box-shadow: inset 0 0 20px rgba(0.19, 1, 0.22, 1), 0 0 20px rgba(0.19, 1, 0.22, 1); 
            }
            <!--se acabo-->
        </style>

        <script>
            $(document).ready(function () {//funcion ejecutada cuando la pagina haya cargado
                var options = {//variable options que se asignara para la libreria de ajaxforms
                    success: showResponse, //funcion que se ejecutara despues de ejecutar el post/get del form
                    clearForm: true       // limpiar formulario despues de la accion

                };
                $('#FormRegistro').ajaxForm(options);// se le asigna la funcion y parametros de la libreria al form
            });

            function showResponse(responseText, statusText, xhr, $form) {
                alert(responseText.trim()); // se muestra el resuldado de la operacion en un alert
                location.href = '../Administrativo/Precios.jsp'
            }
        </script>
    </head>
    <body >
        <div align="center">
            <form action="../jsp/RegistroPrecios.jsp" method="post"  id="FormRegistro" style="align-items: center; width:400px; height: 200px;">

                <div data-role="header" data-theme="b" class="ui-corner-all" style="margin-top:25px; " >
                    <h4 style="color:#ffffff ; font-family: verdana; font-weight: bolder">Registro/Actualizacion <br> de Precios</h4>
                </div>

                      <div class="ui-body ui-body-a ui-corner-all">

                    <fieldset data-role="controlgroup" data-theme="b" data-type="horizontal" >
                        <p  style=" font-family: verdana; font-weight: bolder" >Selecciona nivel y ciclo </p>

                            <label for="select-v-2a">Nivel</label>
                            <select name="SelectNivel" id="select-v-2a">
                            <option value="Preescolar">Preescolar</option>
                            <option value="Primaria">Primaria</option>
                            <option value="Secundaria">Secundaria</option>
                        </select>

                            <select name="SelectCiclo" id="select-v-2b">
                            <%//scriplet para armar e imprimir las opciones de este select
                                try {
                                    Conexion conexion = new Conexion();
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
                            
                    </fieldset>
                    <input type="number" name="Inscripcion" placeholder="Inscripcion $$$" min="0" required>
                    <input type="number" name="CuotaPadres" placeholder="Cuota de padres $$$" min="0" required>
                    <input type="number" name="Libros" placeholder="Libros $$$" min="0" required>
                    <input type="number" name="Seguro" placeholder="Seguro $$$" min="0" required>
                    <input type="number" name="Mensualidad" placeholder="Mensualidad(10 meses) $$$" min="0" required>
                    <button type="submit" id="btn" style="margin-left: 240px;" class="BotonEncima ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini">Registrar</button>
                </div>
            </form>
        </div>
    </body>
</html>