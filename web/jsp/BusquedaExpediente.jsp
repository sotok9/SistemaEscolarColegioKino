<%-- 
    Document   : BusquedaExpediente
    Created on : 16/11/2018, 03:50:09 PM
    Author     : Omarwsk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="clases.ConexionMysql.Conexion"%>
<%
    Conexion conexion = new Conexion(); //clase conexion inicializada
    //captura de parametros recibidos
    String ID =request.getParameter("idAlumno");
    try {
        String myDriver = "org.gjt.mm.mysql.Driver";
        Class.forName(myDriver);
        Connection conn = DriverManager.getConnection(conexion.Url, conexion.User, conexion.Pass);

        String query = "SELECT expediente.*, alumnos.nombre FROM expediente "
                + "INNER JOIN alumnos ON expediente.idalumno = alumnos.idalumnos "
                + "WHERE alumnos.idalumnos="+ID;
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            
 //se imprime el formulario con 3 elementos por cada documento del expediente
 //un checkbox con su nombre y un input hidden con el mismo nombre
%>
    <form class='ui-body ui-body-a ui-corner-all animated fadeInUp' id="expediente" >
        <input type="hidden" name="idExp" id="idExp" value="<%=rs.getInt("idexp")%>" />
        <a><%=rs.getString("nombre")%> ID:#<%=ID%></a>
                <fieldset id="myfield" data-role="controlgroup">
                    
                    
                    <!-- se marca el checkbox si se encuentra que el resultado es 1 -->
                    <input type="checkbox" name="ActaNacimiento" value="1" id="chkActaNacimiento" class="custom" <%if(rs.getInt("acta")==1){out.print("checked");}%>/>
                    <input type="hidden" name="ActaNacimiento" id="h-chkActaNacimiento" value="0" />
                    <label for="chkActaNacimiento">Acta de nacimiento</label>
                    
                    <input type="checkbox" name="Curp" value="1" id="chkCurp" class="custom" <%if(rs.getInt("curp")==1){out.print("checked");}%>/>
                    <input type="hidden" name="Curp" value="0" id="h-chkCurp" />
                    <label for="chkCurp">Curp</label>

                    <input type="checkbox" name="Foto" id="chkFoto" value="1" class="custom" <%if(rs.getInt("foto")==1){out.print("checked");}%>/>
                    <input type="hidden" name="Foto" id="h-chkFoto" value="0" />
                    <label for="chkFoto">Fotografia</label>

                    <input type="checkbox" name="CartillaVacunacion" id="chkCartillaVacunacion" value="1" class="custom" <%if(rs.getInt("cartilla_vacunacion")==1){out.print("checked");}%>/>
                    <input type="hidden" name="CartillaVacunacion" id="h-chkCartillaVacunacion" value="0" />
                    <label for="chkCartillaVacunacion">Cartilla de vacunacion</label>

                    <input type="checkbox" name="ComprobanteDomicilio" id="chkComprobanteDomicilio"  value="1"class="custom" <%if(rs.getInt("comprobante_domicilio")==1){out.print("checked");}%>/>
                    <input type="hidden" name="ComprobanteDomicilio" id="h-chkComprobanteDomicilio" value="0" />
                    <label for="chkComprobanteDomicilio">Comprobante de domicilio</label>

                    <input type="checkbox" name="CartaNoAdeudo" id="chkCartaNoAdeudo" value="1" class="custom" <%if(rs.getInt("carta_na")==1){out.print("checked");}%>/>
                    <input type="hidden" name="CartaNoAdeudo" id="h-chkCartaNoAdeudo"value="0" />
                    <label for="chkCartaNoAdeudo">Carta de no adeudo</label>

                    <input type="checkbox" name="ActaBautismo" id="chkActaBautismo" value="1" class="custom" <%if(rs.getInt("acta_bautismo")==1){out.print("checked");}%>/>
                    <input type="hidden" name="ActaBautismo" id="h-chkActaBautismo" value="0" />
                    <label for="chkActaBautismo">Acta de bautismo</label>

                    <input type="checkbox" name="TipoSangre" id="chkTipoSangre" value="1" class="custom" <%if(rs.getInt("tipo_sangre")==1){out.print("checked");}%>/>
                    <input type="hidden" name="TipoSangre" id="h-chkTipoSangre" value="0" />
                    <label for="chkTipoSangre">Tipo de sangre</label>

                    <input type="checkbox" name="ServicioMedico" id="chkServicioMedico" value="1" class="custom" <%if(rs.getInt("servicio_medico")==1){out.print("checked");}%>/>
                    <input type="hidden" name="ServicioMedico" id="h-ServicioMedico" value="0" />
                    <label for="chkServicioMedico">Servicio Medico</label>
                </fieldset>
                    <a onclick="test()" class="ui-shadow ui-btn ui-corner-all ui-btn-inline ui-btn-b ui-mini" >Guardar Cambios</a>
    </form>
<%
        }
        st.close();
            conn.close();
            rs.close();
    } catch (Exception e) {
        out.print("Error, selecciona un id valido! <br>reporte tecnico:");
        out.print(e.getMessage());
    }
%>

