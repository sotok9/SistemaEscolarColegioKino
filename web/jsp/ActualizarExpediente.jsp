<%-- 
    Document   : ActualizarExpediente
    Created on : 16/11/2018, 07:19:12 PM
    Author     : Omarwsk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%

    try {
        Conexion conexion = new Conexion();//clase conexion inicializada
        
        //captura de parametros recibidos
        int idExp = Integer.valueOf(request.getParameter("idExp"));
        int ActaNac = Integer.valueOf(request.getParameter("ActaNacimiento"));
        int Curp = Integer.valueOf(request.getParameter("Curp"));
        int Foto = Integer.valueOf(request.getParameter("Foto"));
        int CartillaVacunacion = Integer.valueOf(request.getParameter("CartillaVacunacion"));
        int ComprobanteDomicilio = Integer.valueOf(request.getParameter("ComprobanteDomicilio"));
        int CartaNoAdeudo = Integer.valueOf(request.getParameter("CartaNoAdeudo"));
        int ActaBautismo = Integer.valueOf(request.getParameter("ActaBautismo"));
        int TipoSangre = Integer.valueOf(request.getParameter("TipoSangre"));
        int ServicioMedico = Integer.valueOf(request.getParameter("ServicioMedico"));

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

        PreparedStatement ps = con.prepareStatement("UPDATE expediente SET acta=?, curp=?, foto=?, cartilla_vacunacion=?, comprobante_domicilio=?, "
                + "carta_na=?, acta_bautismo=?, tipo_sangre=?, servicio_medico=? "
                + " WHERE idexp=?");
        ps.setInt(1, ActaNac);
        ps.setInt(2, Curp);
        ps.setInt(3, Foto);
        ps.setInt(4, CartillaVacunacion);
        ps.setInt(5, ComprobanteDomicilio);
        ps.setInt(6, CartaNoAdeudo);
        ps.setInt(7, ActaBautismo);
        ps.setInt(8, TipoSangre);
        ps.setInt(9, ServicioMedico);
        ps.setInt(10, idExp);
        ps.executeUpdate();
        //imprimir respuesta
        out.print("Expediente actualizado");
        
        con.close();
        ps.close();
        
    } catch (Exception ex) {
        out.print("Error al actualizar expediente " + ex.getMessage());
    }
%>
