<%-- 
    Document   : BuscarTutor
    Created on : 23/10/2018, 12:13:44 PM
    Author     : Omarwsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="../jquery1.4/jquery.mobile-1.4.5.css" />

        <script src="../jquery1.4/jquery-1.11.1.min.js"></script>
        <script src="../jquery1.4/jquery.mobile-1.4.5.min.js"></script>
        <script src="../jquery1.4/demos/js/jquery.js"></script>
        <script src="../jquery1.4/demos/js/jquery.mobile-1.4.5.min.js"></script>

        <style>

            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 50%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
            .radioinput{
                 display: inline-block;
    vertical-align: top;
            }
        </style>
    </head>
    <body>

        <div align="center">
            <form style="width: 30%">
                <h2>Tutor del alumno</h2>
                <input style="text-align: center" type="search" list="tutores" name="txtTutor" placeholder="Nombre del tutor...">
                <datalist id="tutores" >
                    <%for (int i = 1; i <= 10; i++) {
                    %>
                    <option  value="opcion #"<%=i%> >

                        <% } %>
                </datalist>
            </form>

            <table>
                <tr>
                    <th>id</th>
                    <th>Nombre</th>
                    <th>Direccion</th>
                    <th>Seleccionar</th>
                </tr>
                <%for (int i = 1; i <= 10; i++) {
                %>
                <tr>
                    <td><%=i%></td>
                    <td>Tutor #<%=i%></td>
                    <td>Calle #<%=i*4%></td>
                    <td style="width:10%"><input class="radioinput" style="margin-left: 30%" type="radio" name="Radiobtn" value="true"></td>
                </tr>

                <% }%>

            </table>

        </div>

    </body>
</html>
