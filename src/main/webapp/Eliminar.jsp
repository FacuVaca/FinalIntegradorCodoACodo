<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Eliminar Registro</title>
</head>
<body>
  <%
    String id = request.getParameter("id");
    
    Class.forName("com.mysql.jdbc.Driver");

    try {
      Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/compratickect", "root", "");

      String query = "DELETE FROM ticket WHERE id = ?";
      PreparedStatement pstmt = cn.prepareStatement(query);
      pstmt.setString(1, id);
      pstmt.executeUpdate();
      
      out.println("Registro eliminado correctamente");
      
    } catch (Exception e) {
      out.println("Error al eliminar el registro: " + e.getMessage());
    }
  %>
</body>
</html>