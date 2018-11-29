<%-- 
    Document   : FormModificarTutor
    Created on : 25/11/2018, 01:31:55 PM
    Author     : Omarwsk
--%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conexion conexion = new Conexion();
    int ID = Integer.valueOf(request.getParameter("idAlumno"));
    try {
        String myDriver = "org.gjt.mm.mysql.Driver";
        Class.forName(myDriver);
        Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

        String query = "SELECT * FROM alumnos WHERE idalumnos =" + ID;
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
%>




<form class='animated fadeInUp ui-body ui-body-a ui-corner-all' method='get' action='../jsp/ModificarAlumno.jsp' id="modificar" >

           <div data-role="header" data-theme="b" class="ui-corner-all" style="margin-top:25px; " >
               <h4 style="color:#ffffff ; font-family: verdana; font-weight: bolder">Modificar Alumno <br> ID:#<%=rs.getString("idalumnos")%></h4>
</div>


                <input type="text" id="idTutor" value="<%=rs.getString("idtutor")%>"  placeholder="ID del tutor" name="idTutor" readonly>
                <input type="hidden" name="idAlumno" value="<%=ID%>" id="idAlumno" >

                <input type="text" name="NombreAlumno" id="Nombre-Alumno" value="<%=rs.getString("nombre")%>"  placeholder="Nombre Del Alumno">            
                <input type="text" name="DireccionAlumno" id="Direccion-Alumno" value="<%=rs.getString("direccion")%>"  placeholder=" Dirección Del Alumno">
                <label style="font-family: verdana; font-weight: bolder"   for="date">Fecha De Nacimiento</label>
                <input type="date" name="FechaNacimiento" value="<%=rs.getDate("fechanac")%>" id="FechaNacimiento" />

                <fieldset data-role="controlgroup" data-theme="b" data-type="horizontal" >
                    <p  style=" font-family: verdana; font-weight: bolder" >Sexo del Alumno: </p>
                            <input type="radio" name="Sexo" id="radio-choice-t-6a" <%if(rs.getInt("sexo")==1){out.print("checked");}%> value="1" >
                            <label class="BotonEncima" style="width: 75%; height: -5%" for="radio-choice-t-6a">Masculino</label>
                            <input type="radio" name="Sexo" id="radio-choice-t-6b" <%if(rs.getInt("sexo")==0){out.print("checked");}%> value="0">
                            <label class="BotonEncima" for="radio-choice-t-6b">Femenino</label>
                     </fieldset>

                <fieldset data-role="controlgroup" data-theme="b" data-type="horizontal" >
                    <p  style=" font-family: verdana; font-weight: bolder" >Seleccionar El Nivel Del Alumno: </p>

                        <label for="select-v-2a">Nivel</label>
                        <select name="SelectNivel" id="select-v-2a">
                        <option value="<%=rs.getString("nivel")%>"><%=rs.getString("nivel")%></option>
                        <option value="Prescolar">Prescolar</option>
                        <option value="Primaria">Primaria</option>
                        <option value="Secundaria">Secundaria</option>
                    </select>
                        <label for="select-v-2b">Grado</label>
                        <select name="SelectGrado" id="select-v-2b">
                        <option value="<%=rs.getString("grado")%>"><%=rs.getString("grado")%></option>
                        <option value="1°">1°</option>
                        <option value="2°">2°</option>
                        <option value="3°">3°</option>
                        <option value="4°">4°</option>
                        <option value="5°">5°</option>
                        <option value="6°">6°</option>
                    </select>
                        <label for="select-v-2c">Grupo</label>
                        <select name="SelectGrupo" id="select-v-2c">
                        <option value="<%=rs.getString("grupo")%>"><%=rs.getString("grupo")%></option>
                        <option value="A">A</option>
                        <option value="B">B</option>   
                    </select>
                    <select name="idCiclo" id="select-v-2b">
                        <%
                            try {

                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

                                String query2 = "SELECT * FROM ciclo ORDER BY año DESC";
                                Statement st2 = con.createStatement();
                                ResultSet rs2 = st2.executeQuery(query2);
                                while (rs2.next()) {
                                    String selected="";
                                    
                                    
                                    int id = rs2.getInt("idciclo");
                                    String ciclo = rs2.getInt("año") + "-" + (rs2.getInt("año") + 1);
                                    ;
                                    if(rs.getInt("idciclo")==id)
                                    {
                                        selected = "selected";
                                    }
                                    out.print("<option value=\"" + id + "\" "+selected+">" + ciclo + "</option>");
                                }
                                con.close();
                                st2.close();
                                rs2.close();
                            } catch (Exception e) {
                                out.print("Got an exception! ");
                                out.print(e.getMessage());
                            }
                        %>
                    </select>
                </fieldset>
                <br>
                <label style="font-family: verdana; font-weight: bolder" for="textarea-1">Discapacidad:</label>
                <textarea  name="DiscapacidadAlumno" id="DiscapacidadAlumno"><%=rs.getString("discapacidad")%></textarea>
                <br>






<%
        }
        out.print("<button type='submit'  class=\"ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini\" >Guardar Cambios</button>");
        out.print("<a onclick='eliminar()' class=\"ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini\" >Eliminar Alumno</a>");
        out.print("</form>");
        st.close();
        conn.close();
        rs.close();
    } catch (Exception e) {
        out.print("Got an exception! ");
        out.print(e.getMessage());
    }
%>