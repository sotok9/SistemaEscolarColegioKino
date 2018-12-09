/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases.Auxiliar;

import clases.ConexionMysql.Conexion;
import java.sql.*;

/**
 *
 * @author Omarwsk
 */
public class Advertencias {

    public String Ciclos() {
        try {
            Conexion conexion = new Conexion();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT * FROM ciclo";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (!rs.first()) {
                return "<p style='font-size: 30px; color: red;' >No hay ciclos registrados!!</p>";
            }
            con.close();
            st.close();
            rs.close();
        } catch (Exception e) {

        }
        return "";
    }

    public String Precios() {
        String advertencias = "";
        try {
            Conexion conexion = new Conexion();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT * FROM ciclo";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                advertencias += "<p style='font-size: 30px; color: red;' >"+ConsultaPrecio(rs.getInt("idciclo"), "Preescolar", rs.getInt("año"))+"</p>";
                advertencias += "<p style='font-size: 30px; color: red;' >"+ConsultaPrecio(rs.getInt("idciclo"), "Primaria", rs.getInt("año"))+"</p>";
                advertencias += "<p style='font-size: 30px; color: red;' >"+ConsultaPrecio(rs.getInt("idciclo"), "Secundaria", rs.getInt("año"))+"</p>";
            }
            con.close();
            st.close();
            rs.close();
        } catch (Exception e) {

        }
        return advertencias;
    }

    private String ConsultaPrecio(int idCiclo, String Nivel, int AñoCiclo) {
        try {
            Conexion conexion = new Conexion();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

            String query = "SELECT * FROM precios WHERE idciclo="+idCiclo+" AND nivel='"+Nivel+"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if(!rs.first()){
                return "No existen precios para el nivel " + Nivel + " del ciclo "+AñoCiclo + "-" + (AñoCiclo+1)+"!!"; 
            }
            con.close();
            st.close();
            rs.close();
        } catch (Exception e) {

        }
        return "";
    }
}
