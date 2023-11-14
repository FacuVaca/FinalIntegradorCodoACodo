<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Carga tickets</title>
</head>
<body>
<%
// Obtener los parámetros enviados desde el formulario
String id = request.getParameter("id");
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String correo = request.getParameter("Email");
String cantidad = request.getParameter("cantidad");
String categoria = request.getParameter("categoria");

Class.forName("com.mysql.jdbc.Driver");

try {
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/compratickect", "root", "");

    if (id != null && !id.isEmpty()) {
        // Actualizar datos existentes
        String sql = "UPDATE ticket SET nombre = ?, apellido = ?, Email = ?, cantidad = ?, categoria = ? WHERE id = ?";
        PreparedStatement pstmt = cn.prepareStatement(sql);
        pstmt.setString(1, nombre);
        pstmt.setString(2, apellido);
        pstmt.setString(3, correo);
        pstmt.setString(4, cantidad);
        pstmt.setString(5, categoria);
        pstmt.setString(6, id);
        // Ejecutar la consulta
        pstmt.executeUpdate();
        out.println("Datos actualizados correctamente");
    } else {
        // Insertar nuevos datos
        String query = "INSERT INTO ticket(nombre, apellido, Email, cantidad, categoria) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = cn.prepareStatement(query);
        pstmt.setString(1, nombre);
        pstmt.setString(2, apellido);
        pstmt.setString(3, correo);
        pstmt.setString(4, cantidad);
        pstmt.setString(5, categoria);
        // Ejecutar la consulta
        pstmt.executeUpdate();
        out.println("Datos cargados exitosamente");
    }

    cn.close();
} catch (Exception e) {
    out.println("Error al cargar los datos: " + e.getMessage());
}
%>
</body>
</html>