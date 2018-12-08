/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases.Auxiliar;

import clases.ConexionMysql.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;

/**
 *
 * @author Omarwsk
 */
public class RegistroMovimientos {

    public void GenerarMovimiento(int idDeuda, int idUsuario, int MontoNuevo) {
        int MontoViejo = ObtenerMontoViejo(idDeuda);
        
        if(MontoViejo != MontoNuevo){
        InsertarMovimiento(idDeuda, idUsuario, MontoViejo, MontoNuevo);
        }
        
    }

    private int ObtenerMontoViejo(int idDeuda) {
        try {
            Conexion conexion = new Conexion();

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT * FROM deudas WHERE iddeuda=" + idDeuda;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.first()) {
                return rs.getInt("cantidad");
            }
        } catch (Exception ex) {
            return -1;
        }
        return 0;
    }

    private void InsertarMovimiento(int idDeuda, int idUsuario, int MontoViejo, int MontoNuevo) {
        try {
            Conexion conexion = new Conexion();
            Date fecha = java.sql.Date.valueOf(java.time.LocalDate.now());

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            Statement stmt = con.createStatement();
            PreparedStatement ps = con.prepareStatement("INSERT INTO movimientosadeudos (iddeuda, idusuario, fecha, montoviejo, montonuevo) VALUES(?,?,?,?,?)");
            ps.setInt(1, idDeuda);
            ps.setInt(2, idUsuario);
            ps.setDate(3, fecha);
            ps.setDouble(4, MontoViejo);
            ps.setDouble(5, MontoNuevo);
            ps.executeUpdate();
            ps.close();
        } catch (Exception ex) {
        }
    }
}
