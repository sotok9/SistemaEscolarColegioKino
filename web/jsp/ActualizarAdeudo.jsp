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
        Conexion conexion = new Conexion(); //clase conexion inicializada
        
        //captura de parametros recibidos
        int ID = Integer.valueOf(request.getParameter("id"));
        int Inscripcion = Integer.valueOf(request.getParameter("Inscripcion"));
        int CuotaPadres = Integer.valueOf(request.getParameter("CuotadePadres"));
        int Libros = Integer.valueOf(request.getParameter("Libros"));
        int Seguro = Integer.valueOf(request.getParameter("Seguro"));
        int MensualidadSep = Integer.valueOf(request.getParameter("MensualidadSeptiembre"));
        int MensualidadOct = Integer.valueOf(request.getParameter("MensualidadOctubre"));
        int MensualidadNov = Integer.valueOf(request.getParameter("MensualidadNoviembre"));
        int MensualidadDic = Integer.valueOf(request.getParameter("MensualidadDiciembre"));
        int MensualidadEn = Integer.valueOf(request.getParameter("MensualidadEnero"));
        int MensualidadFeb = Integer.valueOf(request.getParameter("MensualidadFebrero"));
        int MensualidadMar = Integer.valueOf(request.getParameter("MensualidadMarzo"));
        int MensualidadAbr = Integer.valueOf(request.getParameter("MensualidadAbril"));
        int MensualidadMay = Integer.valueOf(request.getParameter("MensualidadMayo"));
        int MensualidadJun = Integer.valueOf(request.getParameter("MensualidadJunio"));
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
        ////bloque update
        PreparedStatement ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Inscripcion'");
        ps.setInt(1, Inscripcion);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Cuota de Padres'");
        ps.setInt(1, CuotaPadres);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Libros'");
        ps.setInt(1, Libros);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Seguro'");
        ps.setInt(1, Seguro);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Mensualidad Septiembre'");
        ps.setInt(1, MensualidadSep);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Mensualidad Octubre'");
        ps.setInt(1, MensualidadOct);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Mensualidad Noviembre'");
        ps.setInt(1, MensualidadNov);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Mensualidad Diciembre'");
        ps.setInt(1, MensualidadDic);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Mensualidad Enero'");
        ps.setInt(1, MensualidadEn);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Mensualidad Febrero'");
        ps.setInt(1, MensualidadFeb);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Mensualidad Marzo'");
        ps.setInt(1, MensualidadMar);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Mensualidad Abril'");
        ps.setInt(1, MensualidadAbr);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Mensualidad Mayo'");
        ps.setInt(1, MensualidadMay);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        ////bloque update
        ps = con.prepareStatement("UPDATE deudas SET cantidad=? WHERE idalumno=? and motivo='Mensualidad Junio'");
        ps.setInt(1, MensualidadJun);
        ps.setInt(2, ID);
        ps.executeUpdate();
        /////bloque update
        
        //imprimir respuesta
        out.print("adeudos actualizados");

        con.close();
        ps.close();

    } catch (SQLException ex) {
        out.print("Error al actualizar deudas " + ex.getMessage());
    }
%>
