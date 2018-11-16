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
            <!--se acabo-->

        </style>
        <script>
            //reset type=date inputs to text
            $(document).bind("mobileinit", function () {
                $.mobile.page.prototype.options.degradeInputs.date = true;
            });
        </script>

        <script>
            $().ready(function(){
                $("#idTutor").val(sessionStorage.getItem("idTutor"));
                $("#NombreTutor").val(sessionStorage.getItem("NombreTutor"));
            })
            
            function insertar(){
                var formulario = $("#myform");
                alert(formulario.serialize())
                $.post("../jsp/RegistrarAlumno.jsp",formulario.serialize(), respuesta );
            }
            function respuesta(datos){
                alert(datos);
            }
        </script>
    </head>


    <body style="align-items: center;">
        <%
            int idCiclo = 0;
            try {
                Conexion conexion = new Conexion();
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
                Calendar cal = Calendar.getInstance();
                int mes = cal.get(Calendar.MONTH);
                int año = cal.get(Calendar.YEAR);
                int añociclo;
                if (mes < 7) {
                    añociclo = año + 1;
                } else {
                    añociclo = año;
                }

                String query = "SELECT * FROM ciclo WHERE año=" + añociclo;
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(query);
                if (rs.next()) {
                    idCiclo = rs.getInt("idciclo");
                }
                st.close();
            } catch (Exception ex) {
                out.print("Error al registrar tutor: " + ex.getMessage());
            }%>
        <form id="myform" style="align-items: center; width:600px; height: 200px; margin-left: 35%;">

            <div data-role="header" data-theme="b" class="ui-corner-all" style="margin-top:25px; " >
                <h4 style="color:#ffffff ; font-family: verdana; font-weight: bolder">Registro de Alumnos</h4>
            </div>


                  <div class="ui-body ui-body-a ui-corner-all">    
                <input type="text" id="NombreTutor" name="NombreTutor" readonly>        
                <input type="text" id="idTutor" name="idTutor" readonly>
                <input type="hidden" id="idCiclo" value="<%=idCiclo%>" name="idCiclo" >

                <input type="text" name="NombreAlumno" id="Nombre-Alumno" value="" placeholder="Nombre Del Alumno">            
                <input type="text" name="DireccionAlumno" id="Direccion-Alumno" value="" placeholder=" Dirección Del Alumno">
                <label style="font-family: verdana; font-weight: bolder" for="date">Fecha De Nacimiento</label>
                <input type="date" name="FechaNacimiento" id="FechaNacimiento" value="" />

                <fieldset data-role="controlgroup" data-theme="b" data-type="horizontal" >
                    <p  style=" font-family: verdana; font-weight: bolder" >Sexo del Alumno: </p>
                            <input type="radio" name="Sexo" id="radio-choice-t-6a" value="1" >
                            <label class="BotonEncima" style="width: 75%; height: -5%" for="radio-choice-t-6a">Masculino</label>
                            <input type="radio" name="Sexo" id="radio-choice-t-6b" value="0">
                            <label class="BotonEncima" for="radio-choice-t-6b">Femenino</label>
                     </fieldset>

                <fieldset data-role="controlgroup" data-theme="b" data-type="horizontal" >
                    <p  style=" font-family: verdana; font-weight: bolder" >Seleccionar El Nivel Del Alumno: </p>

                        <label for="select-v-2a">Nivel</label>
                        <select name="SelectNivel" id="select-v-2a">
                        <option value="Prescolar">Prescolar</option>
                        <option value="Primaria">Primaria</option>
                        <option value="Secundaria">Secundaria</option>
                    </select>
                        <label for="select-v-2b">Grado</label>
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
                </fieldset>
                <br>
                <label style="font-family: verdana; font-weight: bolder" for="textarea-1">Discapacidad:</label>
                <textarea  name="DiscapacidadAlumno" id="DiscapacidadAlumno"></textarea>
                <br>
                <a onclick="insertar()" style="margin-left: 240px;"  class="BotonEncima ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini">Registrar</a>

            </div>




        </form>

           

    </body>

</html>

