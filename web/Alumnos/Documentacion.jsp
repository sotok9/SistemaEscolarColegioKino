<%-- 
    Document   : Documentacion
    Created on : 4/11/2018, 07:54:14 PM
    Author     : Omarwsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../jquery1.4/jquery.mobile-1.4.5.css" />

        <script src="../jquery1.4/jquery.mobile-1.4.5.min.js"></script>
        <script src="../jquery1.4/demos/js/jquery.js"></script>
        <script src="../jquery1.4/demos/js/jquery.mobile-1.4.5.min.js"></script>
    </head>
    <body>
        <div  align="center">

            <h2>Buscar expediente de alumno</h2>

            <form action="" method="POST" style="width: 25%">
                <input style=" text-align: center;"   type="search" list="alumnos" name="txtAlumno" placeholder="Nombre del Alumno..." class="CrecerInput">

                <datalist id="alumnos" >
                    <%for (int i = 1; i <= 10; i++) {
                    %>
                    <option value="id:<%=i%>" >Alumno #<%=i%>  </option>

                    <% } %>


                </datalist>
            </form>

            <%
                String nombre = (String) request.getParameter("txtAlumno");
                if (nombre != null && !nombre.isEmpty()) {
            %>
            <div  style="width:60%" data-role="fieldcontain">
                <fieldset data-role="controlgroup">
                    <%
                        for (int i = 1; i <= 10; i++) {
                    %>
                    <input type="checkbox" name="checkbox-<%=i%>" id="checkbox-<%=i%>" class="custom"/>
                    <label for="checkbox-<%=i%>">Documento <%=i%></label>
                    <%
                        }
                    %>
                </fieldset>
            </div>
            <%
                }
            %>

    </body>
</html>
