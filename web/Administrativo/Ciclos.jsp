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
            function insertar(){ //funcion ejecutada para post form de registrar ciclo
                var formulario = $("#myform");
                $.post("../jsp/RegistrarCiclo.jsp",formulario.serialize(), respuesta );
            }
            function respuesta(datos){ //funcion ejecutada despues del post
                alert(datos);
            }
        </script>
    </head>


<%%>

    <body>
        <form id="myform" style="align-items: center; width:600px; height: 200px; margin-left: 35%;">

            <div data-role="header" data-theme="b" class="ui-corner-all" style="margin-top:25px; " >
                <h4 style="color:#ffffff ; font-family: verdana; font-weight: bolder">Administracion de ciclos</h4>
            </div>


            <div align="center" class="ui-body ui-body-a ui-corner-all" >    
                <input style="width: 20%; height: 30px; text-align: center" id="ciclo1" name="varCiclo" value="2018" data-role="none" type="number" placeholder="ej: 2015" min="2000" >
                <a  style="font-size: large">-</a>
                <input style="width: 20%; height: 30px; text-align: center" id="ciclo2" value="2019" data-role="none" type="number" disabled>
                <button onclick="insertar()"  class="ui-btn ui-icon-plus ui-btn-icon-notext ui-corner-all"></button>

                <select style="width: 45%;text-align: center" data-role="none" name="cars" size="3">
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
                                String ciclo = rs.getInt("año") + "-" + (rs.getInt("año")+1);
                                //impresion de option por cada ciclo encontrado
                                out.print("<option value=\""+id+"\">"+ciclo+"</option>");
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
    </body>
</html>
