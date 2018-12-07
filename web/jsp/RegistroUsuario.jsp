<%-- 
    Document   : RegistroUsuario
    Created on : 5/12/2018, 11:22:09 PM
    Author     : Maribel
--%>

<%@page import="clases.ConexionMysql.Conexion"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.SQLDataException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conexion conexion = new Conexion();//Adeudos conexion inicializada
    
    //captura de parametros recibidos
    String nombre = request.getParameter("Nombre");
    String usuario = request.getParameter("Usuario").toLowerCase();
    String password = request.getParameter("Password");
    int privilegios = Integer.valueOf(request.getParameter("Privilegios"));

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);


        PreparedStatement ps = con.prepareStatement("INSERT INTO usuarios (nombre, usuario, password, privilegios) VALUES (?,?,?,?)");
        ps.setString(1, nombre);
        ps.setString(2, usuario);
        ps.setString(3, password);
        ps.setInt(4, privilegios);
        ps.executeUpdate();
        //se imprime la respuesta de texto
        out.print("Usuario registrado exitosamente");

        con.close();
        ps.close();
    } catch (SQLDataException ex) {
        out.print("Error al registrar tutor: " + ex.getMessage());
    }
%>
