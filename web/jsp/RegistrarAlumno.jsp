<%-- 
    Document   : RegistrarAlumno
    Created on : 16/11/2018, 12:55:55 AM
    Author     : Omarwsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%@page import="clases.Auxiliar.Adeudos"%>


<%

    try {
        Adeudos adeudos = new Adeudos(); //Adeudos conexion inicializada
        Conexion conexion = new Conexion(); //clase conexion inicializada
        
        //captura de parametros recibidos
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
        
        int descuento = Integer.valueOf(request.getParameter("numDescuento"));
        
        if ( (Nivel.equals("Preescolar") || Nivel.equals("Secundaria")) && (Grado.equals("4°") || Grado.equals("5°") || Grado.equals("6°")) )
        {
        out.print("No es posible usar ese nivel escolar con grado mayor a 3°");
        }else{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

        PreparedStatement ps = con.prepareStatement("INSERT INTO alumnos "
                + "(idtutor, idciclo, nombre, sexo, direccion, fechanac, discapacidad, grado, nivel, grupo, descuento) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
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
        ps.setInt(11, descuento);
        ps.executeUpdate();
        //despues de insertar el alumno se busca el ultimo alumno insertado
        String query = "SELECT idalumnos FROM schema_kino.alumnos ORDER BY idalumnos DESC";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        if(rs.first()){
            //se usa la clase adeudos para generar todos los adeudos en la base de datos segun los precios registrados 
            adeudos.GenerarNuevo(rs.getInt("idalumnos"));
        }
            st.close();
            con.close();
            rs.close();
            ps.close();
            //se imprime la respuesta de texto
        out.print("Alumno registrado exitosamente");
        }
    } catch (SQLException ex) {
        out.print("Error al registrar Alumno " + ex.getMessage());
    }
%>