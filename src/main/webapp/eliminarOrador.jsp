<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Orador</title>
</head>
<body>
    <%
  
    String oradorId = request.getParameter("id");

  
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/oradores";
        String username = "root";
        String password = "";
        conn = DriverManager.getConnection(url, username, password);


        String sql = "DELETE FROM oradores WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, oradorId);
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Orador eliminado correctamente.");
        } else {
            out.println("No se encontró el orador en la base de datos.");
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
     
    
        if (pstmt != null) {
            try {
                pstmt.close();
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