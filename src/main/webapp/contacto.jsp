<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contacto</title>
</head>
<body>
   
    
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String mail = request.getParameter("mail");
    String telefono = request.getParameter("telefono");

    // Verifica si el campo 'nombre' está vacío
    if (nombre == null || nombre.isEmpty()) {
        out.println("");
    } else {
        // Establece la conexión con la base de datos
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/contacto";
            String username = "root";
            String password = "";
            conn = DriverManager.getConnection(url, username, password);

            // Inserta los datos en la tabla "contacto"
            String sql = "INSERT INTO contacto (nombre, apellido, mail, telefono) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nombre);
            pstmt.setString(2, apellido);
            pstmt.setString(3, mail);
            pstmt.setString(4, telefono);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("Datos enviados correctamente.");
            } else {
                out.println("Error al enviar los datos.");
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
            // Cerrar la conexión y liberar recursos
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
    }
    %>

    <h1>Contacto</h1>
    <form action="contacto.jsp" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" required><br>
        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido" required><br>
        <label for="mail">Correo :</label>
        <input type="email" name="mail" required><br>
        <label for="telefono">Teléfono:</label>
        <input type="text" name="telefono" required><br>
        <input type="submit" value="Enviar">
    </form>
</body>
</html>