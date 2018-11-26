<%-- 
    Document   : RegistroTutor
    Created on : 11/11/2018, 05:03:54 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%
    Conexion conexion = new Conexion();
     
    try {
        int ID = Integer.valueOf(request.getParameter("idAlumno"));
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);


        PreparedStatement ps = con.prepareStatement("DELETE FROM alumnos WHERE idalumnos=?");
        ps.setInt(1, ID);
        ps.executeUpdate();
        out.print("Alumno eliminado exitosamente");

        con.close();
        ps.close();
    } catch (SQLDataException ex) {
        out.print("Error al eliminar Alumno: " + ex.getMessage());
    }
%>