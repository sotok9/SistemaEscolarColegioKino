<%-- 
    Document   : BusquedaExpediente
    Created on : 16/11/2018, 03:50:09 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%
    Conexion conexion = new Conexion();

    try {
        int ID = Integer.valueOf(request.getParameter("idAlumno"));
        String myDriver = "org.gjt.mm.mysql.Driver";
        Class.forName(myDriver);
        Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

        String query = "SELECT iddeuda, idalumno, motivo, cantidad, nombre FROM deudas "
                + "INNER JOIN alumnos ON deudas.idalumno = alumnos.idalumnos "
                + "where idalumno=" + ID;
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        out.print("<form id=\"adeudos\" >");
        out.print(" <input id=\"id\" data-role\"none\" type=\"hidden\" name=\"id\" value=\"" + ID + "\"> ");
        while (rs.next()) {
            String style = "";
            if (rs.getInt("cantidad") == 0) {
                style = "style=\"background-color: green\"";
            }
%>
<div class="ui-field-contain">
    <label for="id<%=rs.getString("motivo")%>"><%=rs.getString("motivo")%>:</label>
    <input <%=style%> type="number" name="<%=rs.getString("motivo").replaceAll("\\s+", "")%>" id="id<%=rs.getString("motivo")%>" value="<%=rs.getInt("cantidad")%>" max="<%=rs.getInt("cantidad")%>" min="0">
</div>


<%

        }
        out.print("<a onclick=\"test()\" class=\"ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini\" >Guardar Cambios</a>");
        out.print("</form>");
        st.close();
        conn.close();
        rs.close();
    } catch (Exception e) {
        out.print("Got an exception! ");
        out.print(e.getMessage());
    }
%>

