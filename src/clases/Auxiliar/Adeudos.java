/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases.Auxiliar;

import clases.ConexionMysql.Conexion;
import java.sql.*;
import java.text.DateFormatSymbols;

/**
 *
 * @author Omarwsk
 */
public class Adeudos {

    public void GenerarNuevo(int idAlumno) {

        int idCiclo = ObtenerCiclo(idAlumno);
        String Nivel = ObtenerNivel(idAlumno);
        Double[] precios = ObtenerPrecios(idCiclo, Nivel);

        InsertarAdeudo(idAlumno, "Inscripcion", precios[0]);
        InsertarAdeudo(idAlumno, "Cuota de Padres", precios[1]);
        InsertarAdeudo(idAlumno, "Libros", precios[2]);
        InsertarAdeudo(idAlumno, "Seguro", precios[3]);
        
        InsertarAdeudo(idAlumno, "Mensualidad Septiembre", precios[4]);
        InsertarAdeudo(idAlumno, "Mensualidad Octubre", precios[4]);
        InsertarAdeudo(idAlumno, "Mensualidad Noviembre", precios[4]);
        InsertarAdeudo(idAlumno, "Mensualidad Diciembre", precios[4]);
        InsertarAdeudo(idAlumno, "Mensualidad Enero", precios[4]);
        InsertarAdeudo(idAlumno, "Mensualidad Febrero", precios[4]);
        InsertarAdeudo(idAlumno, "Mensualidad Marzo", precios[4]);
        InsertarAdeudo(idAlumno, "Mensualidad Abril", precios[4]);
        InsertarAdeudo(idAlumno, "Mensualidad Mayo", precios[4]);
        InsertarAdeudo(idAlumno, "Mensualidad Junio", precios[4]);
    }

    private void InsertarAdeudo(int idAlumno, String Motivo, Double Cantidad) {
        try {
            Conexion conexion = new Conexion();

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            Statement stmt = con.createStatement();
            PreparedStatement ps = con.prepareStatement("INSERT INTO deudas (idalumno, motivo, cantidad) VALUES(?,?,?)");
            ps.setInt(1, idAlumno);
            ps.setString(2, Motivo);
            ps.setDouble(3, Cantidad);
            ps.executeUpdate();
            ps.close();
        } catch (Exception ex) {
        }
    }

    private int ObtenerCiclo(int idAlumno) {
        try {
            Conexion conexion = new Conexion();

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT idalumnos, idciclo FROM alumnos WHERE idalumnos=" + idAlumno;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.first()) {
                return rs.getInt("idciclo");
            }
        } catch (Exception ex) {
            return -1;
        }
        return 0;
    }

    private String ObtenerNivel(int idAlumno) {
        try {
            Conexion conexion = new Conexion();

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT idalumnos, nivel FROM alumnos WHERE idalumnos=" + idAlumno;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.first()) {
                return rs.getString("nivel");
            }
        } catch (Exception ex) {
            return ex.getMessage();
        }
        return "";
    }

    private Double[] ObtenerPrecios(int idCiclo, String Nivel) {
        Double[] Precios = new Double[5];
        try {
            Conexion conexion = new Conexion();

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT * FROM precios WHERE nivel='" + Nivel + "' and idciclo=" + idCiclo;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.first()) {
                Precios[0] = rs.getDouble("inscripcion");
                Precios[1] = rs.getDouble("cuota_padres");
                Precios[2] = rs.getDouble("libros");
                Precios[3] = rs.getDouble("seguro");
                Precios[4] = rs.getDouble("mensualidad");
            }
        } catch (Exception ex) {
        }
        return Precios;
    }

}
