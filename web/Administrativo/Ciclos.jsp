<%-- 
    Document   : Ciclos
    Created on : 15/11/2018, 07:33:05 PM
    Author     : Omarwsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="../jquery1.4/jquery.mobile-1.4.5.css">
        <script src="../jquery1.4/jquery.mobile-1.4.5.min.js"></script> 
        <script src="../jquery1.4/demos/js/jquery.js"></script>
        <script src=../jquery1.4/demos/js/jquery.mobile-1.4.5.min.js></script> 
        <script src="../jquery1.4/jquery.form.js"></script>

        <title>JSP Page</title>
        <script>
            $().ready(function () {
                $("#ciclo1").change(function () {  //funcion para actualizar segundo input del ciclo cada vez que cambie el primero
                    $("#ciclo2").val(parseInt($("#ciclo1").val()) + 1)
                })
            })

        </script>
        <script>
            function insertar() { //funcion ejecutada para post form de registrar ciclo
                var formulario = $("#myform");
                $.post("../jsp/RegistrarCiclo.jsp", formulario.serialize(), respuesta);
            }
            function respuesta(datos) { //funcion ejecutada despues del post
                alert(datos.trim());
                location.href = "../principal.jsp"
            }
        </script>
    </head>


    <%%>

    <body>
        <div align="center">
            <form id="myform" style="align-items: center; width:600px; height: 200px;">

                <div data-role="header" data-theme="b" class="ui-corner-all" style="margin-top:25px; " >
                    <h4 style="color:#ffffff ; font-family: verdana; font-weight: bolder">Administracion de ciclos</h4>
                </div>


                <div class="ui-body ui-body-a ui-corner-all" >    
                    <input style="width: 20%; height: 30px; text-align: center" id="ciclo1" name="varCiclo" value="2018" data-role="none" type="number" placeholder="ej: 2015" min="2000" >
                    <a  style="font-size: large">-</a>
                    <input style="width: 20%; height: 30px; text-align: center" id="ciclo2" value="2019" data-role="none" type="number" disabled>
                    <a data-rel='popup' data-position-to='origin' data-transition='flip' href='#popupConfirmar'  class="ui-btn ui-icon-plus ui-btn-icon-notext ui-corner-all"></a>

                    <select style="width: 45%;text-align: center" data-role="none" size="3">
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
                                    //impresion de option por cada ciclo encontrado
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
                </div>

            </form>
            <form data-role="popup" id="popupConfirmar" data-overlay-theme="b" data-theme="b" data-dismissible="true" style="max-width:400px;" class="ui-corner-all" style="padding: 1px; width: 300px"  method="post">

                <script>
                    function ClosePopup() {
                        $("#popupConfirmar").popup("close")
                    }
                </script>
                    <div data-role="header" style="margin-top: 0px;" data-theme="b">
                        <h1>Agregar Ciclo Escolar</h1>
                </div>
                    <div align="center" role="main" class="ui-content">
                            <h3 class="ui-title">¿Esta seguro que desea agregar este ciclo escolar?</h3>
                    <h4>No podra ser borrado</h4>
                        
                            <a onclick="insertar();ClosePopup();"  class="BotonEncima2 ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" data-transition="flow" >Aceptar</a>
                            <a href="#" onclick="ClosePopup()" class="BotonEncima2 ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" >Cancelar</a>
                        </div>
            </form>
        </div>
    </body>
</html>
