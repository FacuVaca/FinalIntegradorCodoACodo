<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Editar Datos</title>
</head>
<body>
  <h2>Editar Datos</h2>
  
  <%-- Obtengo el ID del registro a editar --%>
  <% String id = request.getParameter("id"); %>
  
  <%-- Realizo la consulta para obtener los datos del registro --%>
  <% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/compratickect", "root", "");
    
    String query = "SELECT * FROM ticket WHERE id = ?";
    PreparedStatement pstmt = cn.prepareStatement(query);
    pstmt.setString(1, id);
    ResultSet rs = pstmt.executeQuery();
    
    if (rs.next()) {
      String nombre = rs.getString("nombre");
      String apellido = rs.getString("apellido");
      String mail = rs.getString("Email");
      String cantidad = rs.getString("cantidad");
      String categoria = rs.getString("categoria");
  %>
  
  <%-- Muestro el formulario prellenado con los datos del registro --%>
  <form action="carga.jsp" method="post">
    <input type="hidden" name="id" value="<%= id %>">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" value="<%= nombre %>"><br>
    <label for="apellido">Apellido:</label>
    <input type="text" name="apellido" value="<%= apellido %>"><br>
    <label for="Email">Email:</label>
    <input type="text" name="Email" value="<%= mail %>"><br>
    <label for="cantidad">Cantidad:</label>
    <input type="text" name="cantidad" value="<%= cantidad %>"><br>
    <label for="categoria">Categoría:</label>
    <input type="text" name="categoria" value="<%= categoria %>"><br>
    <button type="submit">Actualizar</button>
  </form>
  
  <% 
    } else {
      out.println("Registro no encontrado");
    }
    
    rs.close();
    pstmt.close();
    cn.close();
  %>
</body>
</html>