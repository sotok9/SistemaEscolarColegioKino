<%-- 
    Document   : CrearUsuario
    Created on : 5/12/2018, 10:28:35 PM
    Author     : Maribel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="../jquery1.4/jquery.mobile-1.4.5.css">
        <script src="../jquery1.4/jquery.mobile-1.4.5.min.js"></script> 
        <script src="../jquery1.4/demos/js/jquery.js"></script>
        <script src=../jquery1.4/demos/js/jquery.mobile-1.4.5.min.js></script> 
        <script src="../jquery1.4/jquery.form.js"></script>
        <script>
            $(document).ready(function () {//funcion ejecutada cuando la pagina haya cargado
                var options = {//variable options que se asignara para la libreria de ajaxforms
                    success: showResponse, //funcion que se ejecutara despues de ejecutar el post/get del form
                    clearForm: true       // limpiar formulario despues de la accion

                };
                $('#FormRegistro').ajaxForm(options);
            });

            function showResponse(responseText, statusText, xhr, $form) {
                alert(responseText.trim()); //se despliega en un alert la respuesta obtenida
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <form method="post" action="../jsp/RegistroUsuario.jsp" id="FormRegistro" style="align-items: center; width:600px; height: 200px;">

                    <div data-role="header" data-theme="b" class="ui-corner-all" style="margin-top:25px; " >
                        <h4 style="color:#ffffff ; font-family: verdana; font-weight: bolder">Registro de usuarios</h4>
                    </div>

                          <div class="ui-body ui-body-a ui-corner-all">


                        <input autocomplete="off" type="text" name="Nombre" id="Nombre" placeholder="Nombre" required>
                        <input autocomplete="off" type="text" pattern="[A-Za-z0-9]{1,20}" title="Sin caracteres especiales y menos de 20" data-clear-btn="true" name="Usuario" id="Usuario" placeholder="Usuario" required> 
                        <input autocomplete="off" type="text" pattern="[A-Za-z0-9]{1,20}" title="Sin caracteres especiales y menos de 20" data-clear-btn="true" name="Contraseña" id="Contraseña" placeholder="Contraseña" required> 
                        <select>
                            <option value="1" >Buscar</option>
                            <option value="2" >Buscar/Registrar</option>
                            <option value="3" >Buscar/Registrar/Eliminar</option>
                            <option value="4" >Buscar/Registrar/Eliminar/Abonar</option>
                            <option value="5" >Administrador</option>
                        </select>
                        <button id="btn" class="BotonEncima ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini">Registrar</button>
                    </div>
                </form>
            </div>
        </body>
    </html>
