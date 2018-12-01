<%-- 
    Document   : RegistroTutor
    Created on : 11/11/2018, 05:03:54 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%
    Conexion conexion = new Conexion(); //clase conexion inicializada
    
    //captura de parametros recibidos
    String nombre = request.getParameter("Nombre-Tutor");
    String direccion = request.getParameter("Direccion-Tutor");
    long tel1 = Long.valueOf((String) request.getParameter("Telefono-Tutor-1"));
    long tel2 = 0;
    
    if (!((String) request.getParameter("Telefono-Tutor-2")).equals("")) {
        tel2 = Long.valueOf(request.getParameter("Telefono-Tutor-2"));
    }

    String correo = request.getParameter("Email-Tutor");
    try {
        int ID = Integer.valueOf(request.getParameter("idTutor"));
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);


        PreparedStatement ps = con.prepareStatement("UPDATE tutores SET nombre=?, direccion=?, tel1=?, tel2=?, correo=? WHERE idtutor=?");
        ps.setString(1, nombre);
        ps.setString(2, direccion);
        ps.setLong(3, tel1);
        ps.setLong(4, tel2);
        ps.setString(5, correo);
        ps.setInt(6, ID);
        ps.executeUpdate();
        //se imprime respuesta
        out.print("Tutor modificado exitosamente");

        con.close();
        ps.close();
    } catch (SQLDataException ex) {
        out.print("Error al modificado tutor: " + ex.getMessage());
    }
%>