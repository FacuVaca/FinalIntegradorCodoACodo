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

  <h2>Podes seguir tu compra ingresando tu email</h2>
  <form method="post" action="soloMostrarTicket.jsp">
    <input type="text" name="email" placeholder="Ingrese el email">
    <input type="submit" value="Buscar">
  </form>

  <table>
    <tr>
      <th>Nombre</th>
      <th>Apellido</th>
      <th>Email</th>
      <th>Cantidad</th>
      <th>Categoría</th>
    </tr>

    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/compratickect", "root", "");

   
      String email = request.getParameter("email");

      if (email != null && !email.isEmpty()) {
       
        String query = "SELECT * FROM ticket WHERE Email = '" + email + "'";
        Statement stmt = cn.createStatement();
        ResultSet rs = stmt.executeQuery(query);


        boolean foundResults = false;
        while (rs.next()) {
          foundResults = true;
    %>
    <tr>
      <td><%= rs.getString("nombre") %></td>
      <td><%= rs.getString("apellido") %></td>
      <td><%= rs.getString("Email") %></td>
      <td><%= rs.getString("cantidad") %></td>
      <td><%= rs.getString("categoria") %></td>
    </tr>
    <% }
      
        if (!foundResults) {
    %>
    <tr>
      <td colspan="5">No se encontraron resultados para el email <%= email %>.</td>
    </tr>
    <% }
        rs.close();
        stmt.close();
      } else {
        
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
    </tr>
    <% }
        rs.close();
        stmt.close();
      }

      cn.close();
    %>
  </table>
</body>
</html>