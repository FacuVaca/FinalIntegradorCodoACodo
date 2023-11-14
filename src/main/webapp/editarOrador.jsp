<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Orador</title>
</head>
<body>
    <%
 
    String oradorId = request.getParameter("id");

 
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/oradores";
        String username = "root";
        String password = "";
        conn = DriverManager.getConnection(url, username, password);

        String sql = "SELECT * FROM oradores WHERE id = " + oradorId;
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        if (rs.next()) {
            String nombre = rs.getString("nombre");
            String apellido = rs.getString("apellido");
            String tema = rs.getString("tema");
    %>
    <h1>Editar Orador</h1>  
    <form action="cargaOradores.jsp" method="post">
        <input type="hidden" name="id" value="<%= oradorId %>">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" value="<%= nombre %>"><br>
        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido" value="<%= apellido %>"><br>
        <label for="tema">Tema:</label>
        <input type="text" name="tema" value="<%= tema %>"><br>
        <input type="submit" value="Guardar cambios">
    </form>
    <% 
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        out.println("Error de SQL: " + ex.getMessage());
    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
        out.println("Error al cargar el controlador JDBC: " + ex.getMessage());
    } catch (Exception ex) {
        ex.printStackTrace();
        out.println("Error general: " + ex.getMessage());
    } finally {
    
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    %>
</body>
</html>