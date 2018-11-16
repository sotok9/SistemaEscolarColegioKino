<%-- 
    Document   : RegistrarAlumno
    Created on : 16/11/2018, 12:55:55 AM
    Author     : Omarwsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>


<%

    try {
        Conexion conexion = new Conexion();
    int idTutor = Integer.valueOf(request.getParameter("idTutor"));
    String idCiclo = request.getParameter("idCiclo");
    String Nombre = request.getParameter("NombreAlumno");
    String direccion = request.getParameter("DireccionAlumno");
    String FechaNac = request.getParameter("FechaNacimiento");
    int Sexo = Integer.valueOf(request.getParameter("Sexo"));
    String Nivel = request.getParameter("SelectNivel");
    String Grado = request.getParameter("SelectGrado");
    String Grupo = request.getParameter("SelectGrupo");
    String Discapacidad = request.getParameter("DiscapacidadAlumno");
    out.print(Sexo);
    
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

        Statement stmt = con.createStatement();
        PreparedStatement ps = con.prepareStatement("INSERT INTO alumnos "
                + "(idtutor, idciclo, nombre, sexo, direccion, fechanac, discapacidad, grado, nivel, grupo) VALUES (?,?,?,?,?,?,?,?,?,?)");
        ps.setInt(1, idTutor);
        ps.setString(2, idCiclo);
        ps.setString(3, Nombre);
        ps.setInt(4, Sexo);
        ps.setString(5, direccion);
        ps.setString(6, FechaNac);
        ps.setString(7, Discapacidad);
        ps.setString(8, Grado);
        ps.setString(9, Nivel);
        ps.setString(10, Grupo);
       ps.executeUpdate();
        out.print("Alumno registrado exitosamente");
    } catch (Exception ex) {
        out.print("Error al registrar tutor: " + ex.getMessage());
    }
%>