<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SISTEMA ESCOLAR.- Menú</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="jquery1.4/jquery.mobile-1.4.5.css" />

        <!-- <script src="jquery1.4/jquery-1.11.1.min.js"></script> -->

        <script src="jquery1.4/jquery.mobile-1.4.5.min.js"></script>
        <script src="jquery1.4/demos/js/jquery.js"></script>
        <script src="jquery1.4/demos/js/jquery.mobile-1.4.5.min.js"></script>
        <script src="PrivilegiosMenu.js"></script>

        <style>
            .contendorDivFrame {
                position: relative;
                padding-bottom: 70%;
                height: 0;
                overflow: hidden;
            }

            .contendorDivFrame iframe {
                position: absolute;
                top:0;
                left: 0;
                width: 100%;
                height: 100%;
            }
        </style>

        <%
            HttpSession sesion = request.getSession(false);
            String sesionmenu = (String) sesion.getAttribute("kino");

            if (sesionmenu == null) {
        %>           

        <script >
            location.href = "./index.html";
        </script>

        <%
            }

        %>

    </head>
    <body>
        <script>
            function fadeOut(duration) {
                var iframe = document.getElementById('Marco');
                var step = 10 / duration, opacity = 0;
                $("#popupPrincipal").popup("close")
                function next() {
                    if (opacity >= 1) {
                        return;
                    }

                    iframe.style.opacity = (opacity += step);
                    setTimeout(next, 10);
                }

                next();
            }

            function Salir() {

            }


        </script>

        <style>

            .BotonEncima:hover{
                background: #318aac;    
                outline: 1px solid;
                outline-color: rgba(49, 138, 172, 0.4);
                transition: all 1s cubic-bezier(0.19, 1, 0.22, 1);
            }
            .BotonEncima2:hover{

                background: #000;  
            }
            .BotonEncima2:hover
            {
                box-shadow: inset 0 0 20px rgba(255, 255, 255, 1), 0 0 20px rgba(255, 255,255, 1); 
            }

            .AnimarBoton:hover
            {
                box-shadow: inset 0 0 20px rgba(49, 138, 172, 0.5), 0 0 20px rgba(49, 138, 172, 0.4);
                outline-color: rgba(49, 138, 172, 0);
                outline-offset: 30px;
                text-shadow: 1px 1px 6px #fff;
            }

            .AnimarTexto:hover
            {
                outline-color: rgba(49, 138, 172, 0);
                outline-offset: 30px;
                text-shadow: 1px 1px 6px #fff;
            }
            .disabled {
                pointer-events:none; 
                opacity:0.6;         
            }

        </style>



        <div data-role="page" id="pageone" ">
            <div data-role="panel" id="myPanel" data-display="push" data-theme="b" > 

                <div class="nav-glyphish-example ">
                    <ul  data-role="listview">
                        <br> <li style="font-size: 110%;"  data-role="list-divider">Tutores</li>
                        <li data-icon="user" class="BotonEncima2 ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio2" ><a href="./Tutores/RegistrarTutor.html" onclick="fadeOut(500)" target="Marco">Registro</a></li> 
                        <li data-icon="action" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio3"><a href="./Tutores/EliminarModificarTutor.jsp" onclick="fadeOut(500)" target="Marco">Eliminar/Modificar</a></li>
                        <li data-icon="search" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio1"><a href="./Tutores/BuscarTutor.jsp" onclick="fadeOut(500)" target="Marco">Busqueda</a></li><br>

                        <li style="font-size: 110%; " data-role="list-divider">Alumnos</li>

                        <li data-icon="edit" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio2"><a href="./Alumnos/AsignarTutor.jsp" onclick="fadeOut(500)" target="Marco">Inscripciones</a></li>
                        <li data-icon="action" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio3"><a href="./Alumnos/EliminarModificarAlumno.jsp" onclick="fadeOut(500)" target="Marco">Eliminar/Modificar</a></li>
                        <li data-icon="search" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio1"><a href="./Alumnos/BuscarAlumno.jsp" onclick="fadeOut(500)" target="Marco" >Busqueda</a></li>
                        <li data-icon="bars" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio2"><a href="./Alumnos/Documentacion.jsp" onclick="fadeOut(500)" target="Marco">Documentación</a></li>
                        <li data-icon="check" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio4"><a href="./Administrativo/Abonos.jsp" onclick="fadeOut(500)" target="Marco" >Abonar</a></li><br>

                        <li style="font-size: 110%; " data-role="list-divider">Administración</li>

                        <li data-icon="calendar" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio5"><a  href="./Administrativo/Ciclos.jsp" onclick="fadeOut(500)" target="Marco">Ciclos</a></li>
                        <li data-icon="tag" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio5"><a href="./Administrativo/Precios.jsp" onclick="fadeOut(500)" target="Marco" >Precios</a></li>
                        <li data-icon="user" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio5"><a href="./Administrativo/RegistrarUsuario.jsp" onclick="fadeOut(500)" target="Marco" >Usuarios</a></li>
                        <li data-icon="bullets" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio5"><a href="./Administrativo/MovimientosAbonos.jsp" onclick="fadeOut(500)" target="Marco" >Historial Abonos</a></li>
                        <li data-icon="edit" class="BotonEncima ui-shadow-icon ui-btn ui-shadow ui-corner-all ui-btn-b privilegio5"><a href="./Administrativo/AvanceCiclo.jsp" onclick="fadeOut(500)" target="Marco">Avance de ciclo</a></li>
                    </ul> 
                </div>

            </div> 

            <div data-role="main" class="ui-content">
                <div data-role="header" style="height: 55px;" class="ui-corner-all" data-theme="b">
                    <a href="#myPanel" data-role="button" data-theme="b" style="height: 20px; font-family: verdana; font-size: 16px; color: white; font-weight: normal" class="BotonEncima2 ui-btn-left" data-icon="home" data-iconpos="left">Menú</a>

                    <div align="center" style="color:#fff; font-family: verdana; font-size: 16px; font-weight: normal; margin-top: 15px">
                        <a  class="AnimarTexto" style="font-size: 125%; text-decoration: none; color: #fff; font-family: verdana; font-weight: normal" data-rel="popup" data-position-to="origin" data-transition="flip" href="#popupPrincipal">Sistema Escolar Colegio Kino</a>
                    </div>

                    <a href="./jsp/salida.jsp" data-role="button" data-theme="b" style="height: 20px; font-family: verdana; font-size: 16px; color: white; font-weight: normal" class="BotonEncima2 ui-btn-right" data-icon="power" data-iconpos="left">Salir</a>
                </div>

                <form data-role="popup" id="popupPrincipal" data-overlay-theme="b" data-theme="b" data-dismissible="true" style="max-width:400px;" class="ui-corner-all" style="padding: 1px; width: 300px"  method="post">
                    <!--action="./jsp/validar_login.jsp"  ./principal.html  onclick="fadeOut(500)" target="Marco"-->

                    <script>
                        function ClosePopup() {
                            $("#popupPrincipal").popup("close")
                        }
                    </script>
                        <div data-role="header" style="margin-top: 0px;" data-theme="b">
                            <h1>Ventana Principal</h1>
                    </div>
                        <div align="center" role="main" class="ui-content">
                                <h3 class="ui-title">¿Volver a la Ventana Principal?</h3>
                            
                                <a href="./principal.html" onclick="fadeOut(500);ClosePopup();" target="Marco"  class="BotonEncima2 ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" data-transition="flow" >Volver</a>
                                <a href="#" onclick="ClosePopup()" class="BotonEncima2 ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" >Cancelar</a>
                            </div>


                </form>



                <div class="contendorDivFrame">
                    <iframe name="Marco" src="principal.html" id="Marco" frameborder="0" >

                    </iframe>
                </div>
            </div>

        </div>
    </body>
</html>