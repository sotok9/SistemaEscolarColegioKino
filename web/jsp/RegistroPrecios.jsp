<%-- 
    Document   : RegistroPrecios
    Created on : 18/11/2018, 03:07:44 PM
    Author     : Omarwsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%

    try {
        Conexion conexion = new Conexion();
        String Nivel = request.getParameter("SelectNivel");
        int Ciclo = Integer.valueOf(request.getParameter("SelectCiclo"));
        int Inscripcion = Integer.valueOf(request.getParameter("Inscripcion"));
        int CuotaPadres = Integer.valueOf(request.getParameter("CuotaPadres"));
        int Libros = Integer.valueOf(request.getParameter("Libros"));
        int Seguro = Integer.valueOf(request.getParameter("Seguro"));
        int Mensualidad = Integer.valueOf(request.getParameter("Mensualidad"));

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

        String query = "SELECT * FROM precios WHERE idciclo=" + Ciclo + " and nivel='" + Nivel + "'";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        if (rs.first()) {
            out.print("Ya existen precios para este ciclo y nivel");
        } else {

            Statement stmt = con.createStatement();
            PreparedStatement ps = con.prepareStatement("INSERT INTO precios (idciclo, nivel, inscripcion, cuota_padres, libros, seguro, mensualidad)"
                    + " values(?,?,?,?,?,?,?) ");
            ps.setInt(1, Ciclo);
            ps.setString(2, Nivel);
            ps.setInt(3, Inscripcion);
            ps.setInt(4, CuotaPadres);
            ps.setInt(5, Libros);
            ps.setInt(6, Seguro);
            ps.setInt(7, Mensualidad);
            ps.executeUpdate();
            st.close();
            con.close();
            rs.close();
            out.print("Precios registrados exitosamente");
        }
    } catch (SQLDataException ex) {
        out.print("Error al registrar precios: " + ex.getMessage());
    }
%>