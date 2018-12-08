<%-- 
    Document   : BusquedaExpediente
    Created on : 16/11/2018, 03:50:09 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%
    Conexion conexion = new Conexion(); //clase conexion inicializada

    try {
        //captura de parametros recibidos
        int ID = Integer.valueOf(request.getParameter("idAlumno"));
        int idCiclo = Integer.valueOf(request.getParameter("SelectCiclo"));
        String myDriver = "org.gjt.mm.mysql.Driver";
        Class.forName(myDriver);
        Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

        String query = "SELECT iddeuda, idalumno, motivo, cantidad, nombre FROM deudas "
                + "INNER JOIN alumnos ON deudas.idalumno = alumnos.idalumnos "
                + "where idalumno=" + ID+" and deudas.idciclo="+idCiclo;
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        //imprimir empiezo del form adeudos
        out.print("<form class='animated fadeInUp ui-body ui-body-a ui-corner-all' id=\"adeudos\" >");
        //imprimir input hidden con el valor del id del alumno
        out.print(" <input id=\"id\" type=\"hidden\" name=\"id\" value=\"" + ID + "\"> ");
        while (rs.next()) { //ciclo para armar formulario
            String style = "";
            if (rs.getInt("cantidad") == 0) {
                //si la cantidad obtenida es 0 se le da el color verde al input
                style = "style=\"background-color: green\"";
            }
//se imprime un label y 2 input por cada resultado de la tabla, uno de ellos guarda la cantidad y el otro el iddeuda en hidden   
%>
<div class="ui-field-contain">
    <label for="id<%=rs.getString("motivo")%>"><%=rs.getString("motivo")%>:</label>
    <input <%=style%> type="number" name="<%=rs.getString("motivo").replaceAll("\\s+", "")%>" id="id<%=rs.getString("motivo")%>" value="<%=rs.getInt("cantidad")%>" max="<%=rs.getInt("cantidad")%>" min="0">
    <input  type="hidden" name="id<%=rs.getString("motivo").replaceAll("\\s+", "")%>"  value="<%=rs.getInt("iddeuda")%>" >
</div>


<%

        }
        //se imprime el boton que ejecutara el metodo test()
        out.print("<a onclick=\"test()\" class=\"ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini\" >Guardar Cambios</a>");
        //se imprime el cierre de form
        out.print("</form>");
        st.close();
        conn.close();
        rs.close();
    } catch (Exception e) {
        out.print("Got an exception! ");
        out.print(e.getMessage());
    }
%>

