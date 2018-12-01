<%-- 
    Document   : FormModificarTutor
    Created on : 25/11/2018, 01:31:55 PM
    Author     : Omarwsk
--%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conexion conexion = new Conexion(); //clase conexion inicializada
    //captura de parametros recibidos
    int ID = Integer.valueOf(request.getParameter("idTutor"));
    try {
        String myDriver = "org.gjt.mm.mysql.Driver";
        Class.forName(myDriver);
        Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

        String query = "SELECT * FROM tutores WHERE idtutor =" + ID;
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        //se imprime comienzo del formulario
        out.print("<form class='animated fadeInUp ui-body ui-body-a ui-corner-all' method='get' action='../jsp/ModificarTutor.jsp' id=\"modificar\" >");

        while (rs.next()) {
            //se imprime formulario con los valores encontrados en el resultado
%>


<div data-role="header" data-theme="b" class="ui-corner-all" style="margin-top:25px; " >
    <h4 style="color:#ffffff ; font-family: verdana; font-weight: bolder">Modificar tutor <br> ID:#<%=rs.getString("idtutor")%></h4>
</div>




    <input type="text" name="Nombre-Tutor" value="<%=rs.getString("nombre")%>" id="Nombre-Tutor" placeholder="Nombre" required>
    <input type="hidden" name="idTutor" value="<%=ID%>" id="id-Tutor" >

    <input type="text" name="Direccion-Tutor" value="<%=rs.getString("direccion")%>" id="Direccion-Tutor"  placeholder="Dirección" required>
    <input type="tel" pattern="[0-9]{1,}" title="Solo numeros" value="<%=rs.getString("tel1")%>" name="Telefono-Tutor-1" id="Telefono-Tutor-1" placeholder="Télefono 1" required> 
    <input type="tel" pattern="[0-9]{1,}" title="Solo numeros" value="<%=rs.getString("tel2")%>" name="Telefono-Tutor-2" id="Telefono-Tutor-2" placeholder="Télefono 2(OPCIONAL)"> 
    <input type="email"  name="Email-Tutor" id="Email-Tutor" value="<%=rs.getString("correo")%>" placeholder="Correo Electronico">


<%
        }
        //se imprime boton para modificar del form
        out.print("<button type='submit'  class=\"ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini\" >Guardar Cambios</button>");
        //se imprime boton para eliminar del form
        out.print("<a onclick='test()' class=\"ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini\" >Eliminar Tutor</a>");
        //se imprime cierre de form
        out.print("</form>");
        st.close();
        conn.close();
        rs.close();
    } catch (Exception e) {
        out.print("Got an exception! ");
        out.print(e.getMessage());
    }
%>