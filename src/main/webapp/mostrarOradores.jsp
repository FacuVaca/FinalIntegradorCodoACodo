<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Oradores</title>
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
    <h1>Lista de Oradores</h1>

    <table>
        <tr>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Tema</th>
            <th colspan="2">Acciones</th>
        </tr>
    
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oradores", "root", "");

      
        String query = "SELECT * FROM oradores";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

       
        while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("nombre") %></td>
                <td><%= rs.getString("apellido") %></td>
                <td><%= rs.getString("tema") %></td>
                <td> <a href="editarOrador.jsp?id=<%= rs.getInt("id") %>">Editar</a></td>
                 <td>  <a href="eliminarOrador.jsp?id=<%= rs.getInt("id") %>">Eliminar</a> </td>
            </tr>
            <%
        }
        %>

  
        <%
        rs.close();
        stmt.close();
        conn.close();
        %>
    </table>
</body>
</html>