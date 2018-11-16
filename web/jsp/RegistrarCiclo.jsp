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
        String ciclo = request.getParameter("varCiclo");
        Conexion conexion = new Conexion();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

        String query = "SELECT * FROM ciclo WHERE año=" + ciclo;
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        if(rs.first()){
            out.print("Este ciclo ya existe");
        }else{
        
        PreparedStatement ps = con.prepareStatement("INSERT INTO ciclo (año) VALUES (?)");
        ps.setString(1, ciclo);
        ps.executeUpdate();
        
        out.print("Ciclo registrado exitosamente-" + ciclo);
        }
        st.close();
        
    } catch (Exception ex) {
        out.print("Error al registrar tutor: " + ex.getMessage());
    }
    //out.print(AñoCiclo);
%>