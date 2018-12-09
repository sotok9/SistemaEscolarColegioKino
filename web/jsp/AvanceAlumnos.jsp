<%-- 
    Document   : BusquedaTutor
    Created on : 11/11/2018, 08:06:02 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%@page import="clases.Auxiliar.AprobarAlumno"%>

    <%
        AprobarAlumno Aux = new AprobarAlumno();
        
        //captura de parametros recibidos
        String idCiclo =  (String) request.getParameter("SelectCicloActual");
        String nivel =  (String) request.getParameter("SelectNivel");
        String grado =  (String) request.getParameter("SelectGrado");
        Conexion conexion = new Conexion(); //clase conexion inicializada
        try {
            String myDriver = "org.gjt.mm.mysql.Driver";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);
            String query = "SELECT idalumnos, ciclo.año, grado, nivel, grupo, direccion FROM alumnos "
                    + "INNER JOIN ciclo ON alumnos.idciclo=ciclo.idciclo "
                    + " WHERE alumnos.idciclo LIKE '%"+idCiclo+"%' AND grado LIKE '%"+grado+"%' and nivel LIKE '%"+nivel+"%' ";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                Aux.Aprobar(rs.getInt("idalumnos"), rs.getInt("año"), rs.getString("grado"), rs.getString("nivel"));
            }
            st.close();
            conn.close();
            rs.close();
            out.print("Aprobados!");
        } catch (Exception e) {
            out.print("Got an exception! ");
            out.print(e.getMessage());
        }
    %>
