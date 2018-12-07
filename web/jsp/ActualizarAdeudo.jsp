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
        
        String SqlQuery = "UPDATE deudas SET cantidad=? WHERE iddeuda=?";
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
        ////bloque update
        PreparedStatement ps = con.prepareStatement(SqlQuery);
        ps.setInt(1, Inscripcion);
        ps.setInt(2, Integer.valueOf(request.getParameter("idInscripcion")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, CuotaPadres);
        ps.setInt(2, Integer.valueOf(request.getParameter("idCuotadePadres")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, Libros);
        ps.setInt(2, Integer.valueOf(request.getParameter("idLibros")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, Seguro);
        ps.setInt(2, Integer.valueOf(request.getParameter("idSeguro")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, MensualidadSep);
        ps.setInt(2, Integer.valueOf(request.getParameter("idMensualidadSeptiembre")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, MensualidadOct);
        ps.setInt(2, Integer.valueOf(request.getParameter("idMensualidadOctubre")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, MensualidadNov);
        ps.setInt(2, Integer.valueOf(request.getParameter("idMensualidadNoviembre")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, MensualidadDic);
        ps.setInt(2, Integer.valueOf(request.getParameter("idMensualidadDiciembre")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, MensualidadEn);
        ps.setInt(2, Integer.valueOf(request.getParameter("idMensualidadEnero")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, MensualidadFeb);
        ps.setInt(2, Integer.valueOf(request.getParameter("idMensualidadFebrero")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, MensualidadMar);
        ps.setInt(2, Integer.valueOf(request.getParameter("idMensualidadMarzo")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, MensualidadAbr);
        ps.setInt(2, Integer.valueOf(request.getParameter("idMensualidadAbril")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, MensualidadMay);
        ps.setInt(2, Integer.valueOf(request.getParameter("idMensualidadMayo")));
        ps.executeUpdate();
        /////bloque update

        ////bloque update
        ps.setInt(1, MensualidadJun);
        ps.setInt(2, Integer.valueOf(request.getParameter("idMensualidadJunio")));
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
