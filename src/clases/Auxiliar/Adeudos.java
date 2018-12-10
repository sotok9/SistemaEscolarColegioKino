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
        int Descuento = ObtenerDescuento(idAlumno);
        Double[] precios = ObtenerPrecios(idCiclo, Nivel, Descuento);

        InsertarAdeudo(idAlumno, idCiclo, "Inscripcion", precios[0]);
        InsertarAdeudo(idAlumno, idCiclo, "Cuota de Padres", precios[1]);
        InsertarAdeudo(idAlumno, idCiclo, "Libros", precios[2]);
        InsertarAdeudo(idAlumno, idCiclo, "Seguro", precios[3]);

        InsertarAdeudo(idAlumno, idCiclo, "Mensualidad Septiembre", precios[4]);
        InsertarAdeudo(idAlumno, idCiclo, "Mensualidad Octubre", precios[4]);
        InsertarAdeudo(idAlumno, idCiclo, "Mensualidad Noviembre", precios[4]);
        InsertarAdeudo(idAlumno, idCiclo, "Mensualidad Diciembre", precios[4]);
        InsertarAdeudo(idAlumno, idCiclo, "Mensualidad Enero", precios[4]);
        InsertarAdeudo(idAlumno, idCiclo, "Mensualidad Febrero", precios[4]);
        InsertarAdeudo(idAlumno, idCiclo, "Mensualidad Marzo", precios[4]);
        InsertarAdeudo(idAlumno, idCiclo, "Mensualidad Abril", precios[4]);
        InsertarAdeudo(idAlumno, idCiclo, "Mensualidad Mayo", precios[4]);
        InsertarAdeudo(idAlumno, idCiclo, "Mensualidad Junio", precios[4]);
    }

    private void InsertarAdeudo(int idAlumno, int idCiclo, String Motivo, Double Cantidad) {
        try {
            Conexion conexion = new Conexion();

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            Statement stmt = con.createStatement();
            PreparedStatement ps = con.prepareStatement("INSERT INTO deudas (idalumno, motivo, cantidad, idciclo) VALUES(?,?,?,?)");
            ps.setInt(1, idAlumno);
            ps.setString(2, Motivo);
            ps.setDouble(3, Cantidad);
            ps.setInt(4, idCiclo);
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

    private int ObtenerDescuento(int idAlumno) {
        try {
            Conexion conexion = new Conexion();

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT idalumnos, descuento FROM alumnos WHERE idalumnos=" + idAlumno;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.first()) {
                return rs.getInt("descuento");
            }
        } catch (Exception ex) {
            return 0;
        }
        return 0;
    }

    private Double[] ObtenerPrecios(int idCiclo, String Nivel, int Descuento) {
        Double[] Precios = new Double[5];
        try {
            Conexion conexion = new Conexion();
            Double DescuentoFinal = 0.0;
            if (Descuento != 0) {
                DescuentoFinal = Double.valueOf(Descuento) / 100;
            }
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT * FROM precios WHERE nivel='" + Nivel + "' and idciclo=" + idCiclo;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.first()) {
                Precios[0] = rs.getDouble("inscripcion");
                Precios[0] = Precios[0] - (Precios[0] * DescuentoFinal);

                Precios[1] = rs.getDouble("cuota_padres");
                Precios[1] = Precios[1] - (Precios[1] * DescuentoFinal);
                
                Precios[2] = rs.getDouble("libros");
                Precios[2] = Precios[2] - (Precios[2] * DescuentoFinal);
                
                Precios[3] = rs.getDouble("seguro");
                Precios[3] = Precios[3] - (Precios[3] * DescuentoFinal);
                
                Precios[4] = rs.getDouble("mensualidad");
                Precios[4] = Precios[4] - (Precios[4] * DescuentoFinal);
            }
        } catch (Exception ex) {
        }
        return Precios;
    }

}
