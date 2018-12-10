<%-- 
    Document   : RegistroTutor
    Created on : 11/11/2018, 05:03:54 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<% try {
        Conexion conexion = new Conexion(); //clase conexion inicializada
        
        //captura de parametros recibidos
        int idTutor = Integer.valueOf(request.getParameter("idTutor"));
        int idAlumno = Integer.valueOf(request.getParameter("idAlumno"));
        String idCiclo = request.getParameter("idCiclo");
        String Nombre = request.getParameter("NombreAlumno");
        String direccion = request.getParameter("DireccionAlumno");
        String FechaNac = request.getParameter("FechaNacimiento");
        int Sexo = Integer.valueOf(request.getParameter("Sexo"));
        String Nivel = request.getParameter("SelectNivel");
        String Grado = request.getParameter("SelectGrado");
        String Grupo = request.getParameter("SelectGrupo");
        String Discapacidad = request.getParameter("DiscapacidadAlumno");
        
        int descuento = Integer.valueOf(request.getParameter("numDescuento"));

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

        PreparedStatement ps = con.prepareStatement("UPDATE alumnos SET"
                + " idtutor=?, nombre=?, sexo=?, direccion=?, fechanac=?, discapacidad=?, grado=?, nivel=?, grupo=?, descuento=? WHERE idalumnos=?");
        ps.setInt(1, idTutor);
        ps.setString(2, Nombre);
        ps.setInt(3, Sexo);
        ps.setString(4, direccion);
        ps.setString(5, FechaNac);
        ps.setString(6, Discapacidad);
        ps.setString(7, Grado);
        ps.setString(8, Nivel);
        ps.setString(9, Grupo);
        ps.setInt(10, descuento);
        ps.setInt(11, idAlumno);
        ps.executeUpdate();

            con.close();

            ps.close();
            // se imprime respuesta de texto
        out.print("Alumno modificado exitosamente");
    } catch (Exception ex) {
        out.print("Error al modificado alumno " + ex.getMessage());
    }
%>