<%-- 
    Document   : RegistroAlumno
    Created on : 14/11/2018, 04:46:20 PM
    Author     : lab2
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Registro de alumnos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../jquery1.4/jquery.mobile-1.4.5.css">
        <link rel="stylesheet" href="../animate.css" />
        <script src="../jquery1.4/jquery.mobile-1.4.5.min.js"></script> 
        <script src="../jquery1.4/demos/js/jquery.js"></script>
        <script src=../jquery1.4/demos/js/jquery.mobile-1.4.5.min.js></script> 
        <script src="../jquery1.4/jquery.form.js"></script>




        <style>
            <!--al poner el mause encima del boton--> 
            .BotonEncima:hover{

                background: #ffffff;  
            }
            .BotonEncima:hover
            {
                box-shadow: inset 0 0 20px rgba(0.19, 1, 0.22, 1), 0 0 20px rgba(0.19, 1, 0.22, 1); 
            }
            .descuentosOn{
                background: greenyellow;
            }
            .descuentosOff{
                background: gray;
            }
            <!--se acabo-->

        </style>
        <script>
            //reset type=date inputs to text
            $(document).bind("mobileinit", function () {
                $.mobile.page.prototype.options.degradeInputs.date = true;
            });
        </script>

        <script>
            $().ready(function () {
                //se busca la informacion del tutor asignado en sesion
                // y se asigna a los campos de texto señalados
                $("#idTutor").val(sessionStorage.getItem("idTutor"));
                $("#NombreTutor").val(sessionStorage.getItem("NombreTutor"));
                $("#chkDescuento").change(function () {
                    $("#descuento").toggleClass("descuentosOn");
                    $("#descuento").toggleClass("descuentosOff");
                    $('#numDescuento').prop('disabled', function(i, v) { return !v; });
                    $('#numDescuento-h').prop('disabled', function(i, v) { return !v; });
                });
            })


            $(document).ready(function () {//funcion ejecutada cuando la pagina haya cargado
                var options = {//variable options que se asignara para la libreria de ajaxforms
                    success: showResponse, //funcion que se ejecutara despues de ejecutar el post/get del form
                    clearForm: true       // limpiar formulario despues de la accion

                };
                $('#myform').ajaxForm(options);
            });

            function showResponse(responseText, statusText, xhr, $form) {
                alert(responseText.trim()); //se despliega en un alert la respuesta obtenida
                location.href = "../Alumnos/AsignarTutor.jsp" //recarga de pagina
            }
        </script>
    </head>


    <body>
        <div align="center">
        <form align="left" class="animated slideInRight" action="../jsp/RegistrarAlumno.jsp" method="get" id="myform" style="align-items: center; width:600px; height: 200px;">

            <div data-role="header" data-theme="b" class="ui-corner-all" style="margin-top:25px; " >
                <h4 style="color:#ffffff ; font-family: verdana; font-weight: bolder">Registro de Alumnos</h4>
            </div>


                  <div class="ui-body ui-body-a ui-corner-all">    
                <input type="text" id="NombreTutor" name="NombreTutor" readonly>        
                <input type="text" id="idTutor"  name="idTutor" readonly>


                <input type="text" name="NombreAlumno" id="Nombre-Alumno" value="" placeholder="Nombre Del Alumno" required>            
                <input type="text" name="DireccionAlumno" id="Direccion-Alumno" value="" placeholder=" Dirección Del Alumno" required>
                <label style="font-family: verdana; font-weight: bolder" for="date">Fecha De Nacimiento</label>
                <input type="date" name="FechaNacimiento" id="FechaNacimiento" required/>

                <fieldset data-role="controlgroup" data-theme="b" data-type="horizontal" required>
                    <p  style=" font-family: verdana; font-weight: bolder" >Sexo del Alumno: </p>
                            <input type="radio" name="Sexo" id="radio-choice-t-6a" checked  value="1" >
                            <label class="BotonEncima" style="width: 75%; height: -5%" for="radio-choice-t-6a">Masculino</label>
                            <input type="radio" name="Sexo" id="radio-choice-t-6b"  value="0">
                            <label class="BotonEncima" for="radio-choice-t-6b">Femenino</label>
                     </fieldset>
                <div id="descuento"  style="width: 25%; padding-bottom: 5%" class="descuentosOff ui-corner-all">
                    <p  style=" font-family: verdana; font-weight: bolder" >Descuento:</p>  
                    <input id="chkDescuento" type="checkbox" data-role="none" style="margin-left: 7%;transform: scale(2)"  />
                    <input disabled id="numDescuento" name="numDescuento" type="number" min="0" max="100" value='0' data-role="none"  style="margin-left: 7%;width: 30%"/>%
                    <input id="numDescuento-h" name="numDescuento" type="hidden" value='0' />
                </div>
                <fieldset data-role="controlgroup" data-theme="b" data-type="horizontal" >
                    <p  style=" font-family: verdana; font-weight: bolder" >Seleccionar El Nivel Del Alumno: </p>

                        
                        <select name="SelectNivel" id="SelectNivel">
                        <option value="Preescolar">Preescolar</option>
                        <option value="Primaria">Primaria</option>
                        <option value="Secundaria">Secundaria</option>
                    </select>
                        <select name="SelectGrado" id="select-v-2b">
                        <option value="1°">1°</option>
                        <option value="2°">2°</option>
                        <option value="3°">3°</option>
                        <option value="4°">4°</option>
                        <option value="5°">5°</option>
                        <option value="6°">6°</option>
                    </select>
                    <label for="select-v-2c">Grupo</label>
                    <select name="SelectGrupo" id="select-v-2c">
                        <option value="A">A</option>
                        <option value="B">B</option>   
                    </select>
                    <select name="idCiclo" id="select-v-2b">
                        <%// scriplet para armar el select de ciclos
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
                                    // se imprime cada option del select
                                    out.print("<option value=\"" + id + "\">" + ciclo + "</option>");
                                }
                                con.close();
                                st.close();
                                rs.close();
                            } catch (Exception e) {
                                out.print("Got an exception! ");
                                out.print(e.getMessage());
                            }
                            // scriplet para armar el select de ciclos
                        %>
                    </select>
                </fieldset>
                <br>
                <label style="font-family: verdana; font-weight: bolder" for="textarea-1">Discapacidad:</label>
                <textarea  name="DiscapacidadAlumno" id="DiscapacidadAlumno" placeholder="Opcional"></textarea>
                <br>
                <button type="submit" style="margin-left: 240px;"  class="BotonEncima ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini">Registrar</button>

            </div>




        </form>

           
</div>
    </body>

</html>

