<%-- 
    Document   : RegistroTutor
    Created on : 11/11/2018, 05:03:54 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String nombre = request.getParameter("Nombre-Tutor");
    String direccion = request.getParameter("Direccion-Tutor");
    long tel1 = Long.valueOf( (String) request.getParameter("Telefono-Tutor-1"));
    long tel2=0;
    if(((String) request.getParameter("Telefono-Tutor-2")).equals(null)){
        tel2 = Long.valueOf(request.getParameter("Telefono-Tutor-2"));
    }
    
    String correo = request.getParameter("Email-Tutor");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/schema_kino", "root", "root");

        Statement stmt = con.createStatement();
        PreparedStatement ps = con.prepareStatement("INSERT INTO tutores (nombre, direccion, tel1, tel2, correo) VALUES (?,?,?,?,?)");
        ps.setString(1, nombre);
        ps.setString(2, direccion);
        ps.setLong(3, tel1);
        ps.setLong(4, tel2);
        ps.setString(5, correo);
        ps.executeUpdate();
        out.print("Tutor registrado exitosamente");
    } catch (SQLDataException ex) {
        out.print("Error al registrar tutor: " + ex.getMessage());
    }
%>