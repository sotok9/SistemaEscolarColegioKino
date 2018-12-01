<%-- 
    Document   : RegistrarCiclo
    Created on : 15/11/2018, 09:05:28 PM
    Author     : Omarwsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%

    try {
        //captura de parametros recibidos
        String ciclo = request.getParameter("varCiclo");
        
        Conexion conexion = new Conexion(); //clase conexion inicializada
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
        
        //busqueda de ciclo para saber si ya existe un ciclo con ese año
        String query = "SELECT * FROM ciclo WHERE año=" + ciclo;
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        if (rs.first()) {
            //si ya existe se imprime esta respuesta de texto
            out.print("Este ciclo ya existe");
        } else {

            PreparedStatement ps = con.prepareStatement("INSERT INTO ciclo (año) VALUES (?)");
            ps.setString(1, ciclo);
            ps.executeUpdate();
            //en caso de que no exista se imprime esta respuesta de texto despues de insertarlo
            out.print("Ciclo registrado exitosamente-" + ciclo);
            ps.close();
        }
        st.close();
        con.close();
        rs.close();

    } catch (Exception ex) {
        out.print("Error al registrar ciclo " + ex.getMessage());
    }
    //out.print(AñoCiclo);
%>