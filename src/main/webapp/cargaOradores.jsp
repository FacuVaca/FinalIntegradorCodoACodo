<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Carga oradores</title>
</head>
<body>
<%
// Obtengo los parámetros enviados desde el formulario
String id = request.getParameter("id");
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String tema = request.getParameter("tema");

Class.forName("com.mysql.jdbc.Driver");

try {
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oradores", "root", "");

    if (id != null && !id.isEmpty()) {
        // Actualizo los datos existentes
        String sql = "UPDATE oradores SET nombre = ?, apellido = ?, tema = ? WHERE id = ?";
        PreparedStatement pstmt = cn.prepareStatement(sql);
        pstmt.setString(1, nombre);
        pstmt.setString(2, apellido);
        pstmt.setString(3, tema);
        pstmt.setString(4, id);
        // Ejecutar la consulta
        pstmt.executeUpdate();
        out.println("Datos actualizados correctamente");
    } else {
        // Inserto nuevos datos
        String query = "INSERT INTO oradores(nombre, apellido, tema) VALUES (?, ?, ?)";
        PreparedStatement pstmt = cn.prepareStatement(query);
        pstmt.setString(1, nombre);
        pstmt.setString(2, apellido);
        pstmt.setString(3, tema);
        // Ejecuto la consulta
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