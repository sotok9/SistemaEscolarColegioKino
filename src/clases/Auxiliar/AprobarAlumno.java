/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases.Auxiliar;

import clases.ConexionMysql.Conexion;
import clases.Auxiliar.Adeudos;
import java.sql.*;

/**
 *
 * @author Omarwsk
 */
public class AprobarAlumno {

    public void Aprobar(int idAlumno, int AñoCiclo, String Grado, String Nivel) {
        Adeudos adeudos = new Adeudos();

        int CicloNuevo = BuscarSiguienteCiclo(AñoCiclo);
        String NivelNuevo = NivelSiguiente(Grado, Nivel);
        String GradoNuevo = GradoSiguiente(Grado, Nivel);

        ModificarCiclo(CicloNuevo, idAlumno, GradoNuevo, NivelNuevo);
        adeudos.GenerarNuevo(idAlumno);
    }

    private String GradoSiguiente(String GradoActual, String NivelActual) {
        String Grado="";
        if(GradoActual.equals("1°")){
            Grado="2°";
        }
        if(GradoActual.equals("2°")){
            Grado="3°";
        }
        if(GradoActual.equals("3°")){
            Grado="4°";
            if(NivelActual.equals("Preescolar") || NivelActual.equals("Secundaria")){
            Grado="1°";
            }
        }
        if(GradoActual.equals("4°")){
            Grado="5°";
        }
        if(GradoActual.equals("5°")){
            Grado="6°";
        }
        if(GradoActual.equals("6°") && NivelActual.equals("Primaria")){
            Grado="1°";
        }
        return Grado;
    }

    private String NivelSiguiente(String GradoActual, String NivelActual) {
        String Nivel =NivelActual;
        if(NivelActual.equals("Preescolar") && GradoActual.equals("3°")){
            Nivel ="Primaria";
        }
        if(NivelActual.equals("Primaria") && GradoActual.equals("6°")){
            Nivel ="Secundaria";
        }
        if(NivelActual.equals("Secundaria") && GradoActual.equals("3°")){
            Nivel ="Egresado";
        }
        
        return Nivel;
    }
    
    private void ModificarCiclo(int CicloNuevo, int idAlumno, String GradoNuevo, String NivelNuevo) {
        Conexion conexion = new Conexion(); //clase conexion inicializada

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            PreparedStatement ps = con.prepareStatement("UPDATE alumnos SET idciclo=?, grado=?, nivel=? WHERE idalumnos=?");
            ps.setInt(1, CicloNuevo);
            ps.setString(2, GradoNuevo);
            ps.setString(3, NivelNuevo);
            ps.setInt(4, idAlumno);
            ps.executeUpdate();
            //se imprime respuesta

            con.close();
            ps.close();
        } catch (Exception ex) {
        }
    }

    private int BuscarSiguienteCiclo(int AñoCiclo) {
        Conexion conexion = new Conexion();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT * FROM ciclo";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                int año = rs.getInt("año");
                if (año == AñoCiclo + 1) {
                    return rs.getInt("idciclo");
                }
            }
            con.close();
            st.close();
            rs.close();
        } catch (Exception e) {
        }
        return 0;
    }
}
