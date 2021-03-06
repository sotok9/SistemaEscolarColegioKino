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
        Conexion conexion = new Conexion();//clase conexion inicializada
        
        //captura de parametros recibidos
        String Nivel = request.getParameter("SelectNivel");
        int Ciclo = Integer.valueOf(request.getParameter("SelectCiclo"));
        int Inscripcion = Integer.valueOf(request.getParameter("Inscripcion"));
        int CuotaPadres = Integer.valueOf(request.getParameter("CuotaPadres"));
        int Libros = Integer.valueOf(request.getParameter("Libros"));
        int Seguro = Integer.valueOf(request.getParameter("Seguro"));
        int Mensualidad = Integer.valueOf(request.getParameter("Mensualidad"));

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
        
        //busqueda de precios por ciclo y nivel para saber si existe
        String query = "SELECT * FROM precios WHERE idciclo=" + Ciclo + " and nivel='" + Nivel + "'";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        if (rs.first()) { // si se encontró precios con el mismo ciclo y nivel se actualiza
            Statement stmt = con.createStatement();
            PreparedStatement ps = con.prepareStatement("UPDATE precios SET inscripcion=?, cuota_padres=?, libros=?, seguro=?, mensualidad=? WHERE idciclo=? and nivel=? ");

            ps.setInt(1, Inscripcion);
            ps.setInt(2, CuotaPadres);
            ps.setInt(3, Libros);
            ps.setInt(4, Seguro);
            ps.setInt(5, Mensualidad);
            ps.setInt(6, Ciclo);
            ps.setString(7, Nivel);
            ps.executeUpdate();
            st.close();
            con.close();
            rs.close();
            out.print("Precios Actualizados exitosamente");
        } else {// caso contrario se crea uno nuevo

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
            // se imprime respuesta de texto
            out.print("Precios registrados exitosamente");
        }
    } catch (SQLDataException ex) {
        out.print("Error al registrar precios: " + ex.getMessage());
    }
%>