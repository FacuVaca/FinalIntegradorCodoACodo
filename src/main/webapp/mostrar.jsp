<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Mostrar Datos</title>
  <style>
      table {
          border-collapse: collapse;
          width: 100%;
      }

      th, td {
          border: 1px solid black;
          padding: 8px;
          text-align: left;
      }

      th {
          background-color: #f2f2f2;
      }

      tr:nth-child(even) {
          background-color: #f9f9f9;
      }
  </style>
</head>
<body>
  <table>
    <tr>
      <th>Nombre</th>
      <th>Apellido</th>
      <th>Email</th>
      <th>Cantidad</th>
      <th>Categoría</th>
      <th>Acciones</th>
    </tr>
    <% 
      try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/compratickect", "root", "");
        String query = "SELECT * FROM ticket";
        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
    %>
          <tr>
            <td><%= rs.getString("nombre") %></td>
            <td><%= rs.getString("apellido") %></td>
            <td><%= rs.getString("Email") %></td>
            <td><%= rs.getString("cantidad") %></td>
            <td><%= rs.getString("categoria") %></td>
            <td>
              <a href="editar.jsp?id=<%= rs.getInt("id") %>">Editar</a>
              <a href="Eliminar.jsp?id=<%= rs.getInt("id") %>">Eliminar</a>
            </td>
          </tr>
    <% 
        }
        rs.close();
        stmt.close();
        cn.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
  </table>
</body>
</html>
